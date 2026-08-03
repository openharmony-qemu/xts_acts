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

export default function uint16ArrayReduceRightPart1Test(): void {
  describe('Uint16ArrayReduceRightPart1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_0100
     * @tc.name testUint16ArrayReduceRightPart1001
      * @tc.desc Verify right-to-left subtraction starts with the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let previousValues: number[] = [];
      let currentValues: number[] = [];
      let indexes: int[] = [];
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        previousValues.push(prev);
        currentValues.push(curr);
        indexes.push(idx);
        return prev - curr;
      });
      expect(result).assertEqual(0);
      expect(previousValues[0]).assertEqual(3);
      expect(currentValues[0]).assertEqual(2);
      expect(indexes[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_0200
     * @tc.name testUint16ArrayReduceRightPart1002
      * @tc.desc Verify additive reduction returns expected totals across Uint16 inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: Uint16Array[] = [
        Uint16Array.of(10, 20, 30),
        Uint16Array.of(5, 10, 15),
        Uint16Array.of(65535, 65535),
        Uint16Array.of(1, 2, 3, 4, 5),
        Uint16Array.of(7, 8, 9),
        Uint16Array.of(3, 6, 9),
      ];
      let expected: number[] = [60, 30, 131070, 15, 24, 18];
      for (let i: int = 0; i < inputs.length; i++) {
        let result: number = inputs[i].reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_0300
     * @tc.name testUint16ArrayReduceRightPart1003
      * @tc.desc Verify index-aware callback adds each element position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr + idx, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_0400
     * @tc.name testUint16ArrayReduceRightPart1004
      * @tc.desc Verify callback arguments expose reverse traversal with an initial accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let previousValues: number[] = [];
      let currentValues: number[] = [];
      let indexes: int[] = [];
      let callbackArray: Uint16Array | undefined = undefined;
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        previousValues.push(prev);
        currentValues.push(curr);
        indexes.push(idx);
        callbackArray = a;
        return prev - curr;
      }, 100);
      expect(result).assertEqual(40);
      expect(previousValues.join(',')).assertEqual('100,70,50');
      expect(currentValues.join(',')).assertEqual('30,20,10');
      expect(indexes.join(',')).assertEqual('2,1,0');
      expect(callbackArray).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_0500
     * @tc.name testUint16ArrayReduceRightPart1005
      * @tc.desc Verify multiplicative reduction uses one as the initial identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 3, 4);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev * curr, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_0600
     * @tc.name testUint16ArrayReduceRightPart1006
      * @tc.desc Verify bitwise OR combines distinct set bits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 4);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev | curr, 0);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_0700
     * @tc.name testUint16ArrayReduceRightPart1007
      * @tc.desc Verify bitwise AND retains only shared bits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(255, 65535);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev & curr, 65535);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_0800
     * @tc.name testUint16ArrayReduceRightPart1008
      * @tc.desc Verify comparison callback selects the largest value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 12, 8);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev > curr ? prev : curr, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_0900
     * @tc.name testUint16ArrayReduceRightPart1009
      * @tc.desc Verify comparison callback selects the smallest value below a seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 12, 8);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev < curr ? prev : curr, 100);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_1000
     * @tc.name testUint16ArrayReduceRightPart1010
      * @tc.desc Verify callback applies a captured multiplication factor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let factor: number = 10;
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr * factor, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_1100
     * @tc.name testUint16ArrayReduceRightPart1011
      * @tc.desc Verify seeded reduction visits all values from right to left
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let callCount: number = 0;
      let currentValues: number[] = [];
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        callCount++;
        currentValues.push(curr);
        return prev + curr;
      }, 0);
      expect(callCount).assertEqual(3);
      expect(currentValues.join(',')).assertEqual('3,2,1');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_1200
     * @tc.name testUint16ArrayReduceRightPart1012
      * @tc.desc Verify string accumulator concatenates decimal values in reverse order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: string = arr.reduceRight((prev: string, curr: number, idx: int, a: Uint16Array): string => prev + curr.toString(), "");
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_1300
     * @tc.name testUint16ArrayReduceRightPart1013
      * @tc.desc Verify maximum Uint16 seed participates in numeric addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 65535);
      expect(result).assertEqual(65538);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_1400
     * @tc.name testUint16ArrayReduceRightPart1014
      * @tc.desc Verify negative seed is preserved during numeric addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_1500
     * @tc.name testUint16ArrayReduceRightPart1015
      * @tc.desc Verify positive seed offsets a two-element sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 100);
      expect(result).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_1600
     * @tc.name testUint16ArrayReduceRightPart1016
      * @tc.desc Verify negative seed offsets a two-element sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, -100);
      expect(result).assertEqual(-70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_1700
     * @tc.name testUint16ArrayReduceRightPart1017
      * @tc.desc Verify NaN seed propagates through addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, Number.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_1800
     * @tc.name testUint16ArrayReduceRightPart1018
      * @tc.desc Verify positive infinity seed remains infinite after addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_1900
     * @tc.name testUint16ArrayReduceRightPart1019
      * @tc.desc Verify negative infinity seed remains infinite after addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_2000
     * @tc.name testUint16ArrayReduceRightPart1020
      * @tc.desc Verify midrange Uint16 seed contributes to a large sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10000, 20000);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 32768);
      expect(result).assertEqual(62768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_2100
     * @tc.name testUint16ArrayReduceRightPart1021
      * @tc.desc Verify fractional seed retains floating-point precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 3.14);
      expect(result).assertEqual(6.140000000000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_2200
     * @tc.name testUint16ArrayReduceRightPart1022
      * @tc.desc Verify octal maximum Uint16 seed contributes numerically
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0o177777);
      expect(result).assertEqual(65538);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_2300
     * @tc.name testUint16ArrayReduceRightPart1023
      * @tc.desc Verify empty string seed builds reverse character output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65, 66, 67);
      let result: string = arr.reduceRight((prev: string, curr: number, idx: int, a: Uint16Array): string => prev + String.fromCharCode(curr.toInt()), "");
      expect(result).assertEqual("CBA");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_2400
     * @tc.name testUint16ArrayReduceRightPart1024
      * @tc.desc Verify string prefix seed precedes reverse decimal output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: string = arr.reduceRight((prev: string, curr: number, idx: int, a: Uint16Array): string => prev + curr.toString(), "result:");
      expect(result).assertEqual("result:21");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_2500
     * @tc.name testUint16ArrayReduceRightPart1025
      * @tc.desc Verify multiplicative seed produces the product of all values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 5, 7);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev * curr, 1);
      expect(result).assertEqual(105);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_2600
     * @tc.name testUint16ArrayReduceRightPart1026
      * @tc.desc Verify explicit numeric accumulator generic returns the sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 10, 15);
      let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_2700
     * @tc.name testUint16ArrayReduceRightPart1027
      * @tc.desc Verify string accumulator reverses digit sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(9, 8, 7);
      let result: string = arr.reduceRight((prev: string, curr: number, idx: int, a: Uint16Array): string => prev + curr.toString(), "");
      expect(result).assertEqual("789");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_2800
     * @tc.name testUint16ArrayReduceRightPart1028
      * @tc.desc Verify explicit numeric generic computes a product
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 4, 6);
      let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Uint16Array): number => prev * curr, 1);
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_2900
     * @tc.name testUint16ArrayReduceRightPart1029
      * @tc.desc Verify additive seed increases a three-element total
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 100);
      expect(result).assertEqual(160);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_3000
     * @tc.name testUint16ArrayReduceRightPart1030
      * @tc.desc Verify empty input returns zero seed without callback execution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of();
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_3100
     * @tc.name testUint16ArrayReduceRightPart1031
      * @tc.desc Verify empty input returns a nonzero numeric seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of();
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_3200
     * @tc.name testUint16ArrayReduceRightPart1032
      * @tc.desc Verify seeded singleton adds its sole value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_3300
     * @tc.name testUint16ArrayReduceRightPart1033
      * @tc.desc Verify seeded singleton preserves the maximum Uint16 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_3400
     * @tc.name testUint16ArrayReduceRightPart1034
      * @tc.desc Verify nonzero seed combines with a singleton
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_3500
     * @tc.name testUint16ArrayReduceRightPart1035
      * @tc.desc Verify positional decimal encoding records reverse callback state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      let previousValues: number[] = [];
      let currentValues: number[] = [];
      let indexes: int[] = [];
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        previousValues.push(prev);
        currentValues.push(curr);
        indexes.push(idx);
        return prev * 10 + curr;
      }, 0);
      expect(result).assertEqual(32100);
      expect(previousValues.join(',')).assertEqual('0,300,3200');
      expect(currentValues.join(',')).assertEqual('300,200,100');
      expect(indexes.join(',')).assertEqual('2,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_3600
     * @tc.name testUint16ArrayReduceRightPart1036
      * @tc.desc Verify string reduction concatenates multi-digit values in reverse order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      let result: string = arr.reduceRight((prev: string, curr: number, idx: int, a: Uint16Array): string => prev + curr.toString(), "");
      expect(result).assertEqual("300200100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_3700
     * @tc.name testUint16ArrayReduceRightPart1037
      * @tc.desc Verify callback indexes descend from the final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let indices: number[] = [];
      arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        indices.push(idx);
        return prev + curr;
      }, 0);
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_3800
     * @tc.name testUint16ArrayReduceRightPart1038
      * @tc.desc Verify callback values arrive in descending array order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let values: number[] = [];
      arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        values.push(curr);
        return prev + curr;
      }, 0);
      expect(values[0]).assertEqual(30);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_3900
     * @tc.name testUint16ArrayReduceRightPart1039
      * @tc.desc Verify character codes form a reverse alphabetic string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(120, 121, 122);
      let result: string = arr.reduceRight((prev: string, curr: number, idx: int, a: Uint16Array): string => prev + String.fromCharCode(curr.toInt()), "");
      expect(result).assertEqual("zyx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_4000
     * @tc.name testUint16ArrayReduceRightPart1040
      * @tc.desc Verify seeded subtraction applies values from right to left
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev - curr, 0);
      expect(result).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_4100
     * @tc.name testUint16ArrayReduceRightPart1041
      * @tc.desc Verify callback-thrown Error propagates to the caller
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      try {
        arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
          throw new Error("callback error");
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_4200
     * @tc.name testUint16ArrayReduceRightPart1042
     * @tc.desc Verify zero-valued elements reduce to zero with an additive callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_4300
     * @tc.name testUint16ArrayReduceRightPart1043
      * @tc.desc Verify negative constructor input wraps to maximum Uint16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([-1, 1]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_4400
     * @tc.name testUint16ArrayReduceRightPart1044
      * @tc.desc Verify overflow constructor input wraps to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65536, 1]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_4500
     * @tc.name testUint16ArrayReduceRightPart1045
      * @tc.desc Verify constructor truncates fractional Uint16 inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([3.14, 2.71]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_4600
     * @tc.name testUint16ArrayReduceRightPart1046
      * @tc.desc Verify constructor converts NaN element to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([Number.NaN, 5]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_4700
     * @tc.name testUint16ArrayReduceRightPart1047
      * @tc.desc Verify additive reduction totals repeated maximum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 0, 65535);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(131070);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_4800
     * @tc.name testUint16ArrayReduceRightPart1048
      * @tc.desc Verify maximum seed and singleton exceed Uint16 range in result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 65535);
      expect(result).assertEqual(131070);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_4900
     * @tc.name testUint16ArrayReduceRightPart1049
      * @tc.desc Verify default empty Uint16Array returns its supplied seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_5000
     * @tc.name testUint16ArrayReduceRightPart1050
      * @tc.desc Verify zero-filled fixed-length array sums to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_5100
     * @tc.name testUint16ArrayReduceRightPart1051
      * @tc.desc Verify callback source argument is the reduced array instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let sameArray: boolean = false;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        sameArray = a === arr;
        return prev + curr;
      }, 0);
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_5200
     * @tc.name testUint16ArrayReduceRightPart1052
      * @tc.desc Verify callback source argument retains its length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let arrLen: int = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        arrLen = a.length;
        return prev + curr;
      }, 0);
      expect(arrLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_5300
     * @tc.name testUint16ArrayReduceRightPart1053
      * @tc.desc Verify callback can access Uint16 element byte width
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let bpe: number = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        bpe = Uint16Array.BYTES_PER_ELEMENT;
        return prev + curr;
      }, 0);
      expect(bpe).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_5400
     * @tc.name testUint16ArrayReduceRightPart1054
      * @tc.desc Verify seeded callback spans final through first indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300, 400);
      let firstIdx: int = -1;
      let lastIdx: int = -1;
      let count: int = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        if (count === 0) {
          firstIdx = idx;
        }
        lastIdx = idx;
        count++;
        return prev + curr;
      }, 0);
      expect(firstIdx).assertEqual(3);
      expect(lastIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_5500
     * @tc.name testUint16ArrayReduceRightPart1055
      * @tc.desc Verify callback value matches the source element at its index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(50, 100, 150);
      let matchAll: boolean = true;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        if (curr !== a[idx]) {
          matchAll = false;
        }
        return prev + curr;
      }, 0);
      expect(matchAll).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_5600
     * @tc.name testUint16ArrayReduceRightPart1056
      * @tc.desc Verify positive fractional seed is added exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0.5);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_5700
     * @tc.name testUint16ArrayReduceRightPart1057
      * @tc.desc Verify negative fractional seed is added exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, -0.5);
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_5800
     * @tc.name testUint16ArrayReduceRightPart1058
      * @tc.desc Verify exponential numeric seed expands before reduction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 1e4);
      expect(result).assertEqual(10003);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_5900
     * @tc.name testUint16ArrayReduceRightPart1059
      * @tc.desc Verify basic additive reduction returns the array total
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(4, 5, 6);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_6000
     * @tc.name testUint16ArrayReduceRightPart1060
     * @tc.desc Verify string callback inserts separators while traversing right to left
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: string = arr.reduceRight((prev: string, curr: number, idx: int, a: Uint16Array): string => prev + "-" + curr.toString(), "");
      expect(result).assertEqual("-3-2-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_6100
     * @tc.name testUint16ArrayReduceRightPart1061
      * @tc.desc Verify zero-filled three-element array reduces to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_6200
     * @tc.name testUint16ArrayReduceRightPart1062
      * @tc.desc Verify summation preserves totals above the Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 65535, 65535);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => prev + curr, 0);
      expect(result).assertEqual(196605);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_6300
     * @tc.name testUint16ArrayReduceRightPart1063
      * @tc.desc Verify seeded generic sum invokes the callback for each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      let calls: int = 0;
      const r: int = a.reduceRight((p: int, v: number): int => {
        calls++;
        return p + v.toInt();
      }, 10);
      expect(r).assertEqual(16);
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_6400
     * @tc.name testUint16ArrayReduceRightPart1064
      * @tc.desc Verify generic index encoding produces descending positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(4, 5, 6, 7);
      const r: int = a.reduceRight((p: int, v: number, i: int): int => {
        return p * 10 + i;
      }, 0);
      expect(r).assertEqual(3210);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_6500
     * @tc.name testUint16ArrayReduceRightPart1065
      * @tc.desc Verify generic callback receives the same source array each time
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(2, 4, 8);
      let same: int = 0;
      const r: int = a.reduceRight((p: int, v: number, i: int, x: Uint16Array): int => {
        if (x === a) {
          same++;
        }
        return p + v.toInt();
      }, 0);
      expect(r).assertEqual(14);
      expect(same).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_6600
     * @tc.name testUint16ArrayReduceRightPart1066
      * @tc.desc Verify generic string accumulator records indexed reverse values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(12, 34, 56);
      const r: string = a.reduceRight<string>((p: string, v: number, i: int): string => {
        return p + i.toString() + ':' + v.toString() + ';';
      }, '');
      expect(r).assertEqual('2:56;1:34;0:12;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_6700
     * @tc.name testUint16ArrayReduceRightPart1067
      * @tc.desc Verify generic reduction preserves a fractional numeric seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const r: number = a.reduceRight((p: number, v: number): number => {
        return p + v;
      }, 0.5);
      expect(r).assertEqual(6.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_6800
     * @tc.name testUint16ArrayReduceRightPart1068
      * @tc.desc Verify generic callback computes an index-weighted sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(5, 6, 7);
      const r: int = a.reduceRight((p: int, v: number, i: int): int => {
        return p + v.toInt() * (i + 1);
      }, 0);
      expect(r).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_6900
     * @tc.name testUint16ArrayReduceRightPart1069
      * @tc.desc Verify generic empty input returns its numeric seed without callbacks
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array();
      let calls: int = 0;
      const r: int = a.reduceRight((p: int, v: number): int => {
        calls++;
        return p;
      }, 77);
      expect(r).assertEqual(77);
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_7000
     * @tc.name testUint16ArrayReduceRightPart1070
      * @tc.desc Verify generic callback Error stops evaluation at the designated index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      let calls: int = 0;
      try {
        a.reduceRight((p: int, v: number, i: int): int => {
          calls++;
          if (i === 2) {
            throw new Error('stop');
          }
          return p;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('stop');
        expect(calls).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_7100
     * @tc.name testUint16ArrayReduceRightPart1071
      * @tc.desc Verify generic reduction reads a mutated future left element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const r: int = a.reduceRight((p: int, v: number, i: int, x: Uint16Array): int => {
        if (i === 2) {
          x[0] = 10;
        }
        return p + v.toInt();
      }, 0);
      expect(r).assertEqual(15);
      expect(a[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_7200
     * @tc.name testUint16ArrayReduceRightPart1072
      * @tc.desc Verify generic product exceeds the Uint16 range without truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(65535, 65535, 2);
      const r: number = a.reduceRight((p: number, v: number): number => {
        return p * v;
      }, 1);
      expect(r).assertEqual(8589672450);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_7300
     * @tc.name testUint16ArrayReduceRightPart1073
      * @tc.desc Verify generic reduction processes a nonzero ArrayBuffer view offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const all: Uint16Array = new Uint16Array(b);
      all.set(Uint16Array.of(9, 4, 3, 2, 8));
      const v: Uint16Array = new Uint16Array(b, 2, 3);
      const r: int = v.reduceRight((p: int, n: number): int => {
        return p * 10 + n.toInt();
      }, 0);
      expect(r).assertEqual(234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_7400
     * @tc.name testUint16ArrayReduceRightPart1074
      * @tc.desc Verify pure generic callback leaves source values unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(3, 1, 4, 1);
      const r: int = a.reduceRight((p: int, v: number): int => {
        return p + v.toInt();
      }, 0);
      expect(r).assertEqual(9);
      expect(a.join(',')).assertEqual('3,1,4,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_7500
     * @tc.name testUint16ArrayReduceRightPart1075
      * @tc.desc Verify generic sum uses wrapped Uint16 constructor values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array([-1, 65536, 65537]);
      const r: int = a.reduceRight((p: int, v: number): int => {
        return p + v.toInt();
      }, 0);
      expect(a.join(',')).assertEqual('65535,0,1');
      expect(r).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_7600
     * @tc.name testUint16ArrayReduceRightPart1076
      * @tc.desc Verify generic string reduction creates a bracketed reverse trace
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(7, 8);
      const r: string = a.reduceRight<string>((p: string, v: number): string => {
        return p + '[' + v.toString() + ']';
      }, '');
      expect(r).assertEqual('[8][7]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_7700
     * @tc.name testUint16ArrayReduceRightPart1077
      * @tc.desc Verify generic subtraction accepts a negative numeric seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(5, 6);
      const r: int = a.reduceRight((p: int, v: number): int => {
        return p - v.toInt();
      }, -1);
      expect(r).assertEqual(-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_7800
     * @tc.name testUint16ArrayReduceRightPart1078
      * @tc.desc Verify generic callback count matches the subarray length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(9, 1, 2, 3, 8);
      const v: Uint16Array = a.subarray(1, 4);
      let calls: int = 0;
      const r: int = v.reduceRight((p: int, n: number): int => {
        calls++;
        return p + n.toInt();
      }, 0);
      expect(r).assertEqual(6);
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_7900
     * @tc.name testUint16ArrayReduceRightPart1079
      * @tc.desc Verify generic empty reduction preserves the string seed value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array();
      const r: string = a.reduceRight<string>((p: string, v: number): string => {
        return p + v.toString();
      }, 'seed');
      expect(r).assertEqual('seed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCERIGHT_PART1_8000
     * @tc.name testUint16ArrayReduceRightPart1080
      * @tc.desc Verify generic callback combines element values and indexes independently
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReduceRightPart1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(10, 20, 30);
      const r: int = a.reduceRight((p: int, v: number, i: int): int => {
        return p + v.toInt() - i;
      }, 0);
      expect(r).assertEqual(57);
    });

  });
}
