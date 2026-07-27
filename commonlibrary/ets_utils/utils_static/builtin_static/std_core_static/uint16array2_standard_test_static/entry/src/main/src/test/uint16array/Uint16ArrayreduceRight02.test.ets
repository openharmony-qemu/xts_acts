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

export default function uint16ArrayReduceRightPart2Test(): void {
  describe('Uint16ArrayReduceRightPart2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_0100
     * @tc.name testUint16ArrayReduceRightPart2001
     * @tc.desc Verify subtraction without an initial value uses the last element as accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_0200
     * @tc.name testUint16ArrayReduceRightPart2002
     * @tc.desc Verify additive reduction without an initial value accumulates all elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_0300
     * @tc.name testUint16ArrayReduceRightPart2003
     * @tc.desc Verify multiplicative reduction without an initial value multiplies all elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 3, 4);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev * curr);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_0400
     * @tc.name testUint16ArrayReduceRightPart2004
     * @tc.desc Verify division reduction follows right-to-left accumulator order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 10, 2);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev / curr);
      expect(result).assertEqual(0.002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_0500
     * @tc.name testUint16ArrayReduceRightPart2005
     * @tc.desc Verify bitwise OR reduction combines complementary bit patterns
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0x00, 0xF0, 0x0F);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev | curr);
      expect(result).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_0600
     * @tc.name testUint16ArrayReduceRightPart2006
     * @tc.desc Verify bitwise AND reduction retains only common bits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0xFFFF, 0xFF00, 0x0F0F);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev & curr);
      expect(result).assertEqual(0x0F00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_0700
     * @tc.name testUint16ArrayReduceRightPart2007
     * @tc.desc Verify bitwise XOR reduction cancels complementary Uint16 patterns
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0xAAAA, 0x5555, 0xFFFF);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev ^ curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_0800
     * @tc.name testUint16ArrayReduceRightPart2008
      * @tc.desc Verify minimum-selection callback returns the smallest element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 50, 200);
      let result: number = arr.reduceRight((prev, curr, idx, a) => Math.min(prev, curr));
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_0900
     * @tc.name testUint16ArrayReduceRightPart2009
      * @tc.desc Verify maximum-selection callback returns the largest element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 50, 200);
      let result: number = arr.reduceRight((prev, curr, idx, a) => Math.max(prev, curr));
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_1000
     * @tc.name testUint16ArrayReduceRightPart2010
     * @tc.desc Verify callback that returns the accumulator preserves the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_1100
     * @tc.name testUint16ArrayReduceRightPart2011
     * @tc.desc Verify callback that returns the current value ends with the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduceRight((prev, curr, idx, a) => curr);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_1200
     * @tc.name testUint16ArrayReduceRightPart2012
     * @tc.desc Verify callback propagates NaN result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev + Number.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_1300
     * @tc.name testUint16ArrayReduceRightPart2013
     * @tc.desc Verify callback invocation count excludes the initial last-element accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: number = 0;
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      arr.reduceRight((prev, curr, idx, a) => {
        callCount = callCount + 1;
        return prev + curr;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_1400
     * @tc.name testUint16ArrayReduceRightPart2014
     * @tc.desc Verify callback can capture and apply an external factor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factor: number = 2;
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev + curr * factor);
      expect(result).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_1500
     * @tc.name testUint16ArrayReduceRightPart2015
     * @tc.desc Verify callback can invoke a local value-transforming function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleVal = (val: number): number => val * 2;
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev + doubleVal(curr));
      expect(result).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_1600
     * @tc.name testUint16ArrayReduceRightPart2016
      * @tc.desc Verify zero singleton returns itself without callback execution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_1700
     * @tc.name testUint16ArrayReduceRightPart2017
      * @tc.desc Verify maximum Uint16 singleton returns itself without callback execution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_1800
     * @tc.name testUint16ArrayReduceRightPart2018
      * @tc.desc Verify hexadecimal singleton returns its decimal value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0x10);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_1900
     * @tc.name testUint16ArrayReduceRightPart2019
      * @tc.desc Verify two-element subtraction starts from the rightmost value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_2000
     * @tc.name testUint16ArrayReduceRightPart2020
      * @tc.desc Verify two-element addition returns their sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_2100
     * @tc.name testUint16ArrayReduceRightPart2021
      * @tc.desc Verify subtraction handles maximum Uint16 followed by zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(-65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_2200
     * @tc.name testUint16ArrayReduceRightPart2022
      * @tc.desc Verify subtraction retains a rightmost maximum Uint16 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_2300
     * @tc.name testUint16ArrayReduceRightPart2023
      * @tc.desc Verify subtraction of two zero values remains zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_2400
     * @tc.name testUint16ArrayReduceRightPart2024
      * @tc.desc Verify subtraction of equal maximum values returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 65535);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_2500
     * @tc.name testUint16ArrayReduceRightPart2025
      * @tc.desc Verify addition totals a two-element hundreds pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_2600
     * @tc.name testUint16ArrayReduceRightPart2026
      * @tc.desc Verify multiplication returns a two-element product
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 3);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev * curr);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_2700
     * @tc.name testUint16ArrayReduceRightPart2027
      * @tc.desc Verify subtraction reverses the operand order for a two-element input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 10);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_2800
     * @tc.name testUint16ArrayReduceRightPart2028
      * @tc.desc Verify division starts with the rightmost value as dividend
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 5);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev / curr);
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_2900
     * @tc.name testUint16ArrayReduceRightPart2029
      * @tc.desc Verify subtraction can produce a negative result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(7, 3);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_3000
     * @tc.name testUint16ArrayReduceRightPart2030
      * @tc.desc Verify three-element subtraction follows reverse accumulator order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_3100
     * @tc.name testUint16ArrayReduceRightPart2031
      * @tc.desc Verify all-zero three-element subtraction remains zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_3200
     * @tc.name testUint16ArrayReduceRightPart2032
      * @tc.desc Verify symmetric maximum endpoints cancel through subtraction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0, 65535);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_3300
     * @tc.name testUint16ArrayReduceRightPart2033
      * @tc.desc Verify addition totals three hundreds values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_3400
     * @tc.name testUint16ArrayReduceRightPart2034
      * @tc.desc Verify addition counts three unit values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 1, 1);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_3500
     * @tc.name testUint16ArrayReduceRightPart2035
      * @tc.desc Verify addition counts five unit values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 1, 1, 1, 1);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_3600
     * @tc.name testUint16ArrayReduceRightPart2036
      * @tc.desc Verify four-element subtraction preserves reverse associativity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(-20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_3700
     * @tc.name testUint16ArrayReduceRightPart2037
      * @tc.desc Verify a filled hundred-element array sums all entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i = i + 1) {
        arr[i] = 1;
      }
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_3800
     * @tc.name testUint16ArrayReduceRightPart2038
      * @tc.desc Verify multiplication returns the factorial-style product
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev * curr);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_3900
     * @tc.name testUint16ArrayReduceRightPart2039
      * @tc.desc Verify assigned fixed-length array values are summed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 5;
      arr[1] = 10;
      arr[2] = 15;
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_4000
     * @tc.name testUint16ArrayReduceRightPart2040
      * @tc.desc Verify ArrayBuffer-backed Uint16 values are summed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf);
      arr[0] = 100;
      arr[1] = 200;
      arr[2] = 300;
      arr[3] = 400;
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_4100
     * @tc.name testUint16ArrayReduceRightPart2041
      * @tc.desc Verify unseeded callback indexes omit the initial final index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let indices: number[] = [];
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      arr.reduceRight((prev, curr, idx, a) => {
        indices.push(idx);
        return prev + curr;
      });
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_4200
     * @tc.name testUint16ArrayReduceRightPart2042
      * @tc.desc Verify callback source argument reports its full length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 0;
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      arr.reduceRight((prev, curr, idx, a) => {
        len = a.length;
        return prev + curr;
      });
      expect(len).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_4300
     * @tc.name testUint16ArrayReduceRightPart2043
      * @tc.desc Verify callback source argument exposes the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: number = 0;
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      arr.reduceRight((prev, curr, idx, a) => {
        first = a[0];
        return prev + curr;
      });
      expect(first).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_4400
     * @tc.name testUint16ArrayReduceRightPart2044
      * @tc.desc Verify unseeded addition returns the final accumulated value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let finalPrev: number = arr.reduceRight((prev, curr, idx, a) => {
        return prev + curr;
      });
      expect(finalPrev).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_4500
     * @tc.name testUint16ArrayReduceRightPart2045
      * @tc.desc Verify previous values reflect successive reverse accumulations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prevValues: number[] = [];
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      arr.reduceRight((prev, curr, idx, a) => {
        prevValues.push(prev);
        return prev + curr;
      });
      expect(prevValues[0]).assertEqual(30);
      expect(prevValues[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_4600
     * @tc.name testUint16ArrayReduceRightPart2046
      * @tc.desc Verify current values exclude the initial rightmost accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let currValues: number[] = [];
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      arr.reduceRight((prev, curr, idx, a) => {
        currValues.push(curr);
        return prev + curr;
      });
      expect(currValues[0]).assertEqual(20);
      expect(currValues[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_4700
     * @tc.name testUint16ArrayReduceRightPart2047
     * @tc.desc Verify two-element subtraction uses the rightmost value as the initial accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 50);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_4800
     * @tc.name testUint16ArrayReduceRightPart2048
     * @tc.desc Verify additive reduction returns the sum of two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(50, 100);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_4900
     * @tc.name testUint16ArrayReduceRightPart2049
      * @tc.desc Verify addition totals four hundreds values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300, 400);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_5000
     * @tc.name testUint16ArrayReduceRightPart2050
      * @tc.desc Verify empty unseeded reduction throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      try {
        arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_5100
     * @tc.name testUint16ArrayReduceRightPart2051
      * @tc.desc Verify callback-thrown Error propagates from unseeded reduction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      try {
        arr.reduceRight((prev, curr, idx, a) => {
          throw new Error('custom error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_5200
     * @tc.name testUint16ArrayReduceRightPart2052
     * @tc.desc Verify single-element reduction skips callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cbCalled: boolean = false;
      let arr: Uint16Array = Uint16Array.of(42);
      let result: number = arr.reduceRight((prev, curr, idx, a) => {
        cbCalled = true;
        return prev - curr;
      });
      expect(cbCalled).assertEqual(false);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_5300
     * @tc.name testUint16ArrayReduceRightPart2053
      * @tc.desc Verify empty unseeded reduction skips callback before TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cbCalled: boolean = false;
      let arr: Uint16Array = new Uint16Array();
      try {
        arr.reduceRight((prev, curr, idx, a) => {
          cbCalled = true;
          return prev + curr;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(cbCalled).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_5400
     * @tc.name testUint16ArrayReduceRightPart2054
      * @tc.desc Verify bitwise OR combines zero with a maximum Uint16 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev | curr);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_5500
     * @tc.name testUint16ArrayReduceRightPart2055
      * @tc.desc Verify bitwise AND clears maximum Uint16 with zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev & curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_5600
     * @tc.name testUint16ArrayReduceRightPart2056
      * @tc.desc Verify bitwise XOR merges complementary nibbles
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0x0F, 0xF0);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev ^ curr);
      expect(result).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_5700
     * @tc.name testUint16ArrayReduceRightPart2057
      * @tc.desc Verify bitwise OR combines multiple low-order bit patterns
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev | curr);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_5800
     * @tc.name testUint16ArrayReduceRightPart2058
     * @tc.desc Verify callback mutation of an unvisited element changes the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      arr.reduceRight((prev, curr, idx, a) => {
        if (idx === 1) {
          a[0] = 99;
        }
        return prev + curr;
      });
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_5900
     * @tc.name testUint16ArrayReduceRightPart2059
      * @tc.desc Verify callback observes unchanged source length on each call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lengths: number[] = [];
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      arr.reduceRight((prev, curr, idx, a) => {
        lengths.push(a.length);
        return prev + curr;
      });
      expect(lengths[0]).assertEqual(3);
      expect(lengths[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_6000
     * @tc.name testUint16ArrayReduceRightPart2060
      * @tc.desc Verify numeric result exceeds Uint16 element range without wrapping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(40000, 40000);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(80000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_6100
     * @tc.name testUint16ArrayReduceRightPart2061
      * @tc.desc Verify addition returns a high total within Uint16 range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(25000, 25000);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(50000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_6200
     * @tc.name testUint16ArrayReduceRightPart2062
      * @tc.desc Verify conditional maximum callback returns the largest element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev > curr ? prev : curr);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_6300
     * @tc.name testUint16ArrayReduceRightPart2063
      * @tc.desc Verify callback applies modular arithmetic at each reduction step
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(50000, 50000, 50000);
      let result: number = arr.reduceRight((prev, curr, idx, a) => (prev + curr) % 65536);
      expect(result).assertEqual(18928);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_6400
     * @tc.name testUint16ArrayReduceRightPart2064
      * @tc.desc Verify callback repeatedly floors pairwise averages
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      let result: number = arr.reduceRight((prev, curr, idx, a) => Math.floor((prev + curr) / 2));
      expect(result).assertEqual(175);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_6500
     * @tc.name testUint16ArrayReduceRightPart2065
      * @tc.desc Verify subtraction cancels symmetric hexadecimal maximum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0xFFFF, 0x0000, 0xFFFF);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_6600
     * @tc.name testUint16ArrayReduceRightPart2066
      * @tc.desc Verify addition totals repeated high-bit Uint16 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0x8000, 0x8000, 0x8000);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(0x18000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_6700
     * @tc.name testUint16ArrayReduceRightPart2067
      * @tc.desc Verify reverse division computes a two-element quarter quotient
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(8, 2);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev / curr);
      expect(result).assertEqual(0.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_6800
     * @tc.name testUint16ArrayReduceRightPart2068
      * @tc.desc Verify addition totals an ascending three-value sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 10, 15);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_6900
     * @tc.name testUint16ArrayReduceRightPart2069
      * @tc.desc Verify reverse subtraction accumulates a negative result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 50, 25);
      let result: number = arr.reduceRight((prev, curr, idx, a) => prev - curr);
      expect(result).assertEqual(-125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_7000
     * @tc.name testUint16ArrayReduceRightPart2070
      * @tc.desc Verify unseeded subtraction starts with the final element as accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(10, 3, 2);
      let calls: int = 0;
      const r: number = a.reduceRight((p: number, v: number): number => {
        calls++;
        return p - v;
      });
      expect(r).assertEqual(-11);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_7100
     * @tc.name testUint16ArrayReduceRightPart2071
      * @tc.desc Verify unseeded division follows right-to-left accumulator order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(100, 10, 2);
      const r: number = a.reduceRight((p: number, v: number): number => {
        return p / v;
      });
      expect(r).assertEqual(0.002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_7200
     * @tc.name testUint16ArrayReduceRightPart2072
      * @tc.desc Verify unseeded subtraction distinguishes traversal direction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(20, 5, 2);
      const r: number = a.reduceRight((p: number, v: number): number => {
        return p - v;
      });
      expect(r).assertEqual(-23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_7300
     * @tc.name testUint16ArrayReduceRightPart2073
      * @tc.desc Verify unseeded singleton returns itself without callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(32768);
      let calls: int = 0;
      const r: number = a.reduceRight((p: number, v: number): number => {
        calls++;
        return p + v;
      });
      expect(r).assertEqual(32768);
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_7400
     * @tc.name testUint16ArrayReduceRightPart2074
      * @tc.desc Verify unseeded empty input rejects reduction with TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array();
      try {
        a.reduceRight((p: number, v: number): number => {
          return p + v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_7500
     * @tc.name testUint16ArrayReduceRightPart2075
      * @tc.desc Verify unseeded callback encodes values in reverse decimal order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const r: int = a.reduceRight((p: number, v: number): number => {
        return p * 10 + v;
      }).toInt();
      expect(r).assertEqual(4321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_7600
     * @tc.name testUint16ArrayReduceRightPart2076
      * @tc.desc Verify unseeded callback indexes are relative to a subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(9, 8, 7, 6, 5);
      const v: Uint16Array = a.subarray(1, 4);
      const r: number = v.reduceRight((p: number, n: number, i: int): number => {
        return p + n * i;
      });
      expect(r).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_7700
     * @tc.name testUint16ArrayReduceRightPart2077
      * @tc.desc Verify unseeded reduction computes a two-element quotient
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(8, 2);
      const r: number = a.reduceRight((p: number, v: number): number => {
        return p / v;
      });
      expect(r).assertEqual(0.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_7800
     * @tc.name testUint16ArrayReduceRightPart2078
      * @tc.desc Verify callback updates current elements after reading their values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const r: number = a.reduceRight((p: number, v: number, i: int, x: Uint16Array): number => {
        x[i] = v.toInt() * 10;
        return p + v;
      });
      expect(r).assertEqual(6);
      expect(a.join(',')).assertEqual('10,20,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_7900
     * @tc.name testUint16ArrayReduceRightPart2079
      * @tc.desc Verify copied Uint16Array reduction leaves the original unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Uint16Array = Uint16Array.of(2, 4, 8);
      const copy: Uint16Array = new Uint16Array(original);
      copy[2] = 16;
      const r: number = copy.reduceRight((p: number, v: number): number => {
        return p + v;
      });
      expect(r).assertEqual(22);
      expect(original.join(',')).assertEqual('2,4,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART2_8000
     * @tc.name testUint16ArrayReduceRightPart2080
      * @tc.desc Verify unseeded multiplication with zero yields zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(5, 0, 7);
      const r: number = a.reduceRight((p: number, v: number): number => {
        return p * v;
      });
      expect(r).assertEqual(0);
    });
  });
}
