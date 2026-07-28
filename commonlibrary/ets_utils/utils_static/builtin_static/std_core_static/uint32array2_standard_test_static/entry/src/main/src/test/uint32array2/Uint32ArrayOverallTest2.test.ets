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

export default function uint32ArrayOverallTwoTest(): void {
  describe('Uint32ArrayOverallTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_0100
     * @tc.name testUint32ArrayOverallTwo001
     * @tc.desc Verify with() returns new Uint32Array with element replaced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const result = src.with(1, 30);
      expect(result.length).assertEqual(2);
      expect(result.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_0200
     * @tc.name testUint32ArrayOverallTwo002
     * @tc.desc Verify slice() returns Uint32Array subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.slice(0, 2);
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_0300
     * @tc.name testUint32ArrayOverallTwo003
     * @tc.desc Verify subarray() returns Uint32Array view over same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.subarray(1, 3);
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_0400
     * @tc.name testUint32ArrayOverallTwo004
     * @tc.desc Verify reverse() reverses Uint32Array in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.reverse();
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_0500
     * @tc.name testUint32ArrayOverallTwo005
     * @tc.desc Verify toReversed() returns new reversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.toReversed();
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_0600
     * @tc.name testUint32ArrayOverallTwo006
     * @tc.desc Verify sort() returns Uint32Array sorted ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.sort();
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_0700
     * @tc.name testUint32ArrayOverallTwo007
     * @tc.desc Verify toSorted() returns new sorted Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.toSorted();
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_0800
     * @tc.name testUint32ArrayOverallTwo008
     * @tc.desc Verify valueOf() returns Uint32Array itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const result = src.valueOf();
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_0900
     * @tc.name testUint32ArrayOverallTwo009
     * @tc.desc Verify copyWithin() returns Uint32Array with values copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.length).assertEqual(4);
      expect(result.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_1000
     * @tc.name testUint32ArrayOverallTwo010
     * @tc.desc Verify fill() returns Uint32Array with values written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(5, 1);
      expect(result.length).assertEqual(3);
      expect(result.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_1100
     * @tc.name testUint32ArrayOverallTwo011
     * @tc.desc Verify at(index) returns element as number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const result = src.at(0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_1200
     * @tc.name testUint32ArrayOverallTwo012
     * @tc.desc Verify find() returns first matching number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      const result = src.find((value: number, index: int, array: Uint32Array): boolean => value > 4);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_1300
     * @tc.name testUint32ArrayOverallTwo013
     * @tc.desc Verify findLast() returns last matching number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      const result = src.findLast((value: number, index: int, array: Uint32Array): boolean => value > 4);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_1400
     * @tc.name testUint32ArrayOverallTwo014
     * @tc.desc Verify join(separator) returns joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const result = src.join('|');
      expect(result).assertEqual('10|20|30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_1500
     * @tc.name testUint32ArrayOverallTwo015
     * @tc.desc Verify toLocaleString(locale) returns locale-formatted string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1000, 2000);
      const result = src.toLocaleString('en-US');
      expect(result.includes('1,000') && result.includes('2,000')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_1600
     * @tc.name testUint32ArrayOverallTwo016
     * @tc.desc Verify includes() returns boolean true when present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      const result = src.includes(5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_1700
     * @tc.name testUint32ArrayOverallTwo017
     * @tc.desc Verify some() returns boolean true when predicate matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      const result = src.some((value: number, index: int, array: Uint32Array): boolean => value === 6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_1800
     * @tc.name testUint32ArrayOverallTwo018
     * @tc.desc Verify every() returns boolean true when all match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      const result = src.every((value: number, index: int, array: Uint32Array): boolean => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_1900
     * @tc.name testUint32ArrayOverallTwo019
     * @tc.desc Verify indexOf() returns numeric index of first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      const result = src.indexOf(5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_2000
     * @tc.name testUint32ArrayOverallTwo020
     * @tc.desc Verify entries() returns iterator of [index, value] pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5);
      const result = src.entries();
      const item = result.next();
      expect(item.done).assertEqual(false);
      expect(item.value![0]).assertEqual(0);
      expect(item.value![1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_2100
     * @tc.name testUint32ArrayOverallTwo021
     * @tc.desc Verify keys() returns iterator of indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5);
      const result = src.keys();
      const key = result.next();
      expect(key.done).assertEqual(false);
      expect(key.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_2200
     * @tc.name testUint32ArrayOverallTwo022
     * @tc.desc Verify values() returns iterator of values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5);
      const result = src.values();
      const val = result.next();
      expect(val.done).assertEqual(false);
      expect(val.value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_2300
     * @tc.name testUint32ArrayOverallTwo023
     * @tc.desc Verify $_iterator() returns default value iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5);
      const result = src.$_iterator();
      const item = result.next();
      expect(item.done).assertEqual(false);
      expect(item.value).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_2400
     * @tc.name testUint32ArrayOverallTwo024
     * @tc.desc Verify buffer property is ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(2);
      expect(src.buffer.byteLength).assertEqual(8);
      expect(src.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_2500
     * @tc.name testUint32ArrayOverallTwo025
     * @tc.desc Verify byteLength returns numeric byte length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(2);
      expect(src.byteLength).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_2600
     * @tc.name testUint32ArrayOverallTwo026
     * @tc.desc Verify slice(start, end) returns subrange values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2, 8);
      const result = src.slice(1, 3);
      expect(result.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_2700
     * @tc.name testUint32ArrayOverallTwo027
     * @tc.desc Verify subarray(start, end) returns view values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2, 8);
      const result = src.subarray(1, 3);
      expect(result.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_2800
     * @tc.name testUint32ArrayOverallTwo028
     * @tc.desc Verify map() applies function to each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.map((value: number, index: int, array: Uint32Array): number => value + 1);
      expect(result.join(',')).assertEqual('4,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_2900
     * @tc.name testUint32ArrayOverallTwo029
     * @tc.desc Verify filter() keeps elements matching predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.filter((value: number, index: int, array: Uint32Array): boolean => value > 1);
      expect(result.join(',')).assertEqual('3,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_3000
     * @tc.name testUint32ArrayOverallTwo030
     * @tc.desc Verify Uint32Array.of() constructs from listed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(7, 8, 9);
      expect(result.join(',')).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_3100
     * @tc.name testUint32ArrayOverallTwo031
     * @tc.desc Verify Uint32Array.from(FixedArray<int>) constructs from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [1, 2, 3];
      const result = Uint32Array.from(src);
      expect(result.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_3200
     * @tc.name testUint32ArrayOverallTwo032
     * @tc.desc Verify at(-1) returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      expect(src.at(-1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_3300
     * @tc.name testUint32ArrayOverallTwo033
     * @tc.desc Verify at(out-of-range) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      expect(src.at(5)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_3400
     * @tc.name testUint32ArrayOverallTwo034
     * @tc.desc Verify findLast() returns last matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6, 5);
      expect(src.findLast((value: number, index: int, array: Uint32Array): boolean => value === 5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_3500
     * @tc.name testUint32ArrayOverallTwo035
     * @tc.desc Verify reduce() with initialValue returns accumulated sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const result = src.reduce<number>(
        (sum: number, value: number, index: int, array: Uint32Array): number => sum + value,
        0.0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_3600
     * @tc.name testUint32ArrayOverallTwo036
     * @tc.desc Verify reduce() without initialValue accumulates from first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      expect(src.reduce(
        (sum: number, value: number, index: int, array: Uint32Array): number => sum + value
      )).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_3700
     * @tc.name testUint32ArrayOverallTwo037
     * @tc.desc Verify reduceRight() accumulates from right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      expect(src.reduceRight(
        (acc: number, value: number, index: int, array: Uint32Array): number => acc - value
      )).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_3800
     * @tc.name testUint32ArrayOverallTwo038
     * @tc.desc Verify join() with no separator uses comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      expect(src.join()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_3900
     * @tc.name testUint32ArrayOverallTwo039
     * @tc.desc Verify join('') concatenates without separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      expect(src.join('')).assertEqual('102030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_4000
     * @tc.name testUint32ArrayOverallTwo040
     * @tc.desc Verify includes() returns false when absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      expect(src.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_4100
     * @tc.name testUint32ArrayOverallTwo041
     * @tc.desc Verify some() returns false when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      expect(src.some((value: number, index: int, array: Uint32Array): boolean => value > 100)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_4200
     * @tc.name testUint32ArrayOverallTwo042
     * @tc.desc Verify every() returns false when any element fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      expect(src.every((value: number, index: int, array: Uint32Array): boolean => value > 5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_4300
     * @tc.name testUint32ArrayOverallTwo043
     * @tc.desc Verify indexOf(value, fromIndex) skips before start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6, 5);
      expect(src.indexOf(5, 2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_4400
     * @tc.name testUint32ArrayOverallTwo044
     * @tc.desc Verify indexOf() returns -1 when value absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      expect(src.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_4500
     * @tc.name testUint32ArrayOverallTwo045
     * @tc.desc Verify lastIndexOf() returns last matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6, 5);
      expect(src.lastIndexOf(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_4600
     * @tc.name testUint32ArrayOverallTwo046
     * @tc.desc Verify lastIndexOf() returns -1 when value absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      expect(src.lastIndexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_4700
     * @tc.name testUint32ArrayOverallTwo047
     * @tc.desc Verify findIndex() returns index of first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      expect(src.findIndex((value: number, index: int, array: Uint32Array): boolean => value > 4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_4800
     * @tc.name testUint32ArrayOverallTwo048
     * @tc.desc Verify findIndex() returns -1 when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6);
      expect(src.findIndex((value: number, index: int, array: Uint32Array): boolean => value > 100)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_4900
     * @tc.name testUint32ArrayOverallTwo049
     * @tc.desc Verify findLastIndex() returns last match index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 5, 6, 5);
      expect(src.findLastIndex((value: number, index: int, array: Uint32Array): boolean => value === 5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_5000
     * @tc.name testUint32ArrayOverallTwo050
     * @tc.desc Verify buffer.byteLength and byteLength match backing store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint32Array(buf, 4, 2);
      expect(view.buffer.byteLength).assertEqual(16);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_5100
     * @tc.name testUint32ArrayOverallTwo051
     * @tc.desc Verify with() returns array of same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const result = src.with(1, 99);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_5200
     * @tc.name testUint32ArrayOverallTwo052
     * @tc.desc Verify byteOffset reflects ArrayBuffer view offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint32Array(buf, 8, 2);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_5300
     * @tc.name testUint32ArrayOverallTwo053
     * @tc.desc Verify byteLength equals element count times 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint32Array(buf, 8, 2);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_5400
     * @tc.name testUint32ArrayOverallTwo054
     * @tc.desc Verify length equals view element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint32Array(buf, 8, 2);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_5500
     * @tc.name testUint32ArrayOverallTwo055
     * @tc.desc Verify with() does not mutate source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      src.with(1, 99);
      expect(src.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_5600
     * @tc.name testUint32ArrayOverallTwo056
     * @tc.desc Verify slice() does not mutate source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.slice(1, 3);
      expect(src.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_5700
     * @tc.name testUint32ArrayOverallTwo057
     * @tc.desc Verify map() does not mutate source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      src.map((value: number, index: int, array: Uint32Array): number => value + 100);
      expect(src.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_5800
     * @tc.name testUint32ArrayOverallTwo058
     * @tc.desc Verify filter() does not mutate source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.filter((value: number, index: int, array: Uint32Array): boolean => value > 2);
      expect(src.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_5900
     * @tc.name testUint32ArrayOverallTwo059
     * @tc.desc Verify toReversed() does not mutate source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      src.toReversed();
      expect(src.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_6000
     * @tc.name testUint32ArrayOverallTwo060
     * @tc.desc Verify toSorted() does not mutate source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      src.toSorted();
      expect(src.join(',')).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_6100
     * @tc.name testUint32ArrayOverallTwo061
     * @tc.desc Verify fill() writes values from start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      src.fill(7, 1);
      expect(src.join(',')).assertEqual('0,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_6200
     * @tc.name testUint32ArrayOverallTwo062
     * @tc.desc Verify reverse() returns receiver sharing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.reverse();
      result.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_6300
     * @tc.name testUint32ArrayOverallTwo063
     * @tc.desc Verify sort() returns receiver sharing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.sort();
      result.$_set(1, 888);
      expect(src.$_get(1)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_6400
     * @tc.name testUint32ArrayOverallTwo064
     * @tc.desc Verify copyWithin() returns receiver sharing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      result.$_set(0, 777);
      expect(src.$_get(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_6500
     * @tc.name testUint32ArrayOverallTwo065
     * @tc.desc Verify fill() returns receiver sharing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(5, 0);
      result.$_set(2, 666);
      expect(src.$_get(2)).assertEqual(666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_6600
     * @tc.name testUint32ArrayOverallTwo066
     * @tc.desc Verify chained fill().reverse() returns receiver sharing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(3);
      const result = src.fill(9).reverse();
      result.$_set(0, 444);
      expect(src.$_get(0)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_6700
     * @tc.name testUint32ArrayOverallTwo067
     * @tc.desc Verify subarray() shares buffer with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const sub = src.subarray(1, 3);
      sub.$_set(0, 99);
      expect(src.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_6800
     * @tc.name testUint32ArrayOverallTwo068
     * @tc.desc Verify subarray() reflects source writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const sub = src.subarray(1, 3);
      src.$_set(1, 88);
      expect(sub.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_6900
     * @tc.name testUint32ArrayOverallTwo069
     * @tc.desc Verify slice() returns independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const copy = src.slice(1, 3);
      copy.$_set(0, 99);
      expect(src.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_7000
     * @tc.name testUint32ArrayOverallTwo070
     * @tc.desc Verify slice() copy unaffected by source writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const copy = src.slice(1, 3);
      src.$_set(1, 88);
      expect(copy.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_7100
     * @tc.name testUint32ArrayOverallTwo071
     * @tc.desc Verify overlapping ArrayBuffer views share memory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view1 = new Uint32Array(buf, 0, 3);
      const view2 = new Uint32Array(buf, 4, 2);
      view1.$_set(1, 777);
      expect(view2.$_get(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_7200
     * @tc.name testUint32ArrayOverallTwo072
     * @tc.desc Verify map() returns array with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((value: number, index: int, array: Uint32Array): number => value + 1);
      result.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_7300
     * @tc.name testUint32ArrayOverallTwo073
     * @tc.desc Verify filter() returns array with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.filter((value: number, index: int, array: Uint32Array): boolean => value > 2);
      result.$_set(0, 999);
      expect(src.$_get(2)).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_7400
     * @tc.name testUint32ArrayOverallTwo074
     * @tc.desc Verify toSorted() returns array with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.toSorted();
      result.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_7500
     * @tc.name testUint32ArrayOverallTwo075
     * @tc.desc Verify with() returns array with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const result = src.with(1, 99);
      result.$_set(0, 888);
      expect(src.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_7600
     * @tc.name testUint32ArrayOverallTwo076
     * @tc.desc Verify Uint32Array.of(-1) wraps negative one to uint32 max (4294967295)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.of(-1).$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_7700
     * @tc.name testUint32ArrayOverallTwo077
     * @tc.desc Verify fill with start and end within bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.fill(9, 0, 2);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_7800
     * @tc.name testUint32ArrayOverallTwo078
     * @tc.desc Verify filter empty array and no-match return empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array(0);
      expect(empty.filter((v: number): boolean => v > 0).length).assertEqual(0);
      const src = Uint32Array.of(1, 2, 3);
      expect(src.filter((v: number): boolean => v > 100).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_TWO_7900
     * @tc.name testUint32ArrayOverallTwo079
     * @tc.desc Verify filter returns Uint32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const filtered = src.filter((v: number): boolean => v > 1);
      expect(filtered.length).assertEqual(2);
      expect(filtered.$_get(0)).assertEqual(2);
      expect(filtered.$_get(1)).assertEqual(3);
    });
  });
}
