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

export default function uint16ArrayReducePart1Test(): void {
  describe('Uint16ArrayReducePart1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_0100
     * @tc.name testUint16ArrayReducePart1001
     * @tc.desc Verify summation with an explicit zero accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(4, 5, 6);
      let cb = (prev: number, curr: number): number => prev + curr;
      let result: number = arr.reduce<number>(cb, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_0200
     * @tc.name testUint16ArrayReducePart1002
     * @tc.desc Verify seeded sums across varied Uint16Array lengths
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: Uint16Array[] = [Uint16Array.of(7, 8, 9), Uint16Array.of(3, 7), Uint16Array.of(1, 1, 1, 1, 1, 1, 1, 1, 1, 1), Uint16Array.of(0, 1, 2, 3, 4), Uint16Array.of(5, 10, 15)];
      let expected: number[] = [24, 10, 10, 10, 30];
      for (let i: int = 0; i < inputs.length; i++) {
        let result: number = inputs[i].reduce<number>((prev, curr) => prev + curr, 0);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_0300
     * @tc.name testUint16ArrayReducePart1003
     * @tc.desc Verify addition of three large element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_0400
     * @tc.name testUint16ArrayReducePart1004
     * @tc.desc Verify callback receives accumulator, value, index, and source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 4, 6);
      let result: number = arr.reduce<number>((prev, curr, idx, a) => prev + curr + idx + a.length, 0);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_0500
     * @tc.name testUint16ArrayReducePart1005
     * @tc.desc Verify callback captures an external multiplication factor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 10, 15);
      let factor: number = 2;
      let result: number = arr.reduce<number>((prev, curr) => prev + curr * factor, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_0600
     * @tc.name testUint16ArrayReducePart1006
     * @tc.desc Verify seeded reduction invokes the callback once per element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let callCount: number = 0;
      let result: number = arr.reduce<number>((prev, curr) => {
        callCount = callCount + 1;
        return prev + curr;
      }, 0);
      expect(result).assertEqual(6);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_0700
     * @tc.name testUint16ArrayReducePart1007
     * @tc.desc Verify product reduction with a multiplicative identity seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 3, 4);
      let result: number = arr.reduce<number>((prev, curr) => prev * curr, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_0800
     * @tc.name testUint16ArrayReducePart1008
     * @tc.desc Verify left-to-right subtraction with a nonzero seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 3, 1);
      let result: number = arr.reduce<number>((prev, curr) => prev - curr, 20);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_0900
     * @tc.name testUint16ArrayReducePart1009
     * @tc.desc Verify initial accumulator contributes to the final sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 100);
      expect(result).assertEqual(160);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_1000
     * @tc.name testUint16ArrayReducePart1010
     * @tc.desc Verify positive initial value offsets a numeric sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 1);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_1100
     * @tc.name testUint16ArrayReducePart1011
     * @tc.desc Verify negative initial value offsets a numeric sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, -1);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_1200
     * @tc.name testUint16ArrayReducePart1012
     * @tc.desc Verify maximum Uint16-sized seed is not truncated
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 65535);
      expect(result).assertEqual(65538);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_1300
     * @tc.name testUint16ArrayReducePart1013
     * @tc.desc Verify seed above Uint16 range remains a number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 65536);
      expect(result).assertEqual(65539);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_1400
     * @tc.name testUint16ArrayReducePart1014
     * @tc.desc Verify NaN seed propagates through numeric addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, Number.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_1500
     * @tc.name testUint16ArrayReducePart1015
     * @tc.desc Verify positive infinity seed remains infinite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_1600
     * @tc.name testUint16ArrayReducePart1016
     * @tc.desc Verify negative infinity seed remains negative infinite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_1700
     * @tc.name testUint16ArrayReducePart1017
     * @tc.desc Verify summation from the maximum safe integer seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 9007199254740991);
      expect(result).assertEqual(9007199254740994);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_1800
     * @tc.name testUint16ArrayReducePart1018
     * @tc.desc Verify minimum positive number seed is absorbed by sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 5e-324);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_1900
     * @tc.name testUint16ArrayReducePart1019
     * @tc.desc Verify octal numeric seed participates in summation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 0o777);
      expect(result).assertEqual(514);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_2000
     * @tc.name testUint16ArrayReducePart1020
     * @tc.desc Verify binary numeric seed participates in summation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 0b1010);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_2100
     * @tc.name testUint16ArrayReducePart1021
     * @tc.desc Verify exponential numeric seed participates in summation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 1e5);
      expect(result).assertEqual(100003);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_2200
     * @tc.name testUint16ArrayReducePart1022
     * @tc.desc Verify large negative seed remains uncoerced
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, -65535);
      expect(result).assertEqual(-65532);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_2300
     * @tc.name testUint16ArrayReducePart1023
     * @tc.desc Verify midpoint Uint16-range seed participates in sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 32768);
      expect(result).assertEqual(32771);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_2400
     * @tc.name testUint16ArrayReducePart1024
     * @tc.desc Verify negative midpoint seed participates in sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, -32768);
      expect(result).assertEqual(-32765);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_2500
     * @tc.name testUint16ArrayReducePart1025
     * @tc.desc Verify string accumulator converts code units to text
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65, 66, 67);
      let result: string = arr.reduce((prev: string, curr: number): string => prev + String.fromCharCode(curr.toInt()), "");
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_2600
     * @tc.name testUint16ArrayReducePart1026
     * @tc.desc Verify string seed prefixes converted code units
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65, 66);
      let result: string = arr.reduce((prev: string, curr: number): string => prev + String.fromCharCode(curr.toInt()), "result:");
      expect(result).assertEqual("result:AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_2700
     * @tc.name testUint16ArrayReducePart1027
     * @tc.desc Verify decimal element strings concatenate in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: string = arr.reduce((prev, curr) => prev + curr.toString(), "");
      expect(result).assertEqual("102030");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_2800
     * @tc.name testUint16ArrayReducePart1028
     * @tc.desc Verify delimiter formatting with a string accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: string = arr.reduce((prev, curr) => prev + "-" + curr.toString(), "start");
      expect(result).assertEqual("start-1-2-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_2900
     * @tc.name testUint16ArrayReducePart1029
     * @tc.desc Verify empty input returns each supplied typed accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      let r1: string = arr.reduce((prev, curr) => prev + curr.toString(), "");
      expect(r1).assertEqual("");
      let r2: string = arr.reduce((prev, curr) => prev + curr.toString(), "base");
      expect(r2).assertEqual("base");
      let r3: boolean = arr.reduce<boolean>((prev, curr) => prev && (curr > 0), true);
      expect(r3).assertTrue();
      let r4: boolean = arr.reduce<boolean>((prev, curr) => prev || (curr > 0), false);
      expect(r4).assertFalse();
      let r5: number = arr.reduce<number>((prev, curr) => prev + curr, 42);
      expect(r5).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_3000
     * @tc.name testUint16ArrayReducePart1030
     * @tc.desc Verify single element appends to a string seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(99);
      let result: string = arr.reduce((prev, curr) => prev + curr.toString(), "val:");
      expect(result).assertEqual("val:99");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_3100
     * @tc.name testUint16ArrayReducePart1031
     * @tc.desc Verify index values form a string accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 5, 5);
      let result: string = arr.reduce((prev, curr, idx) => prev + idx.toString(), "");
      expect(result).assertEqual("012");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_3200
     * @tc.name testUint16ArrayReducePart1032
     * @tc.desc Verify zero element stringifies within concatenation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 1);
      let result: string = arr.reduce((prev, curr) => prev + curr.toString(), "");
      expect(result).assertEqual("01");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_3300
     * @tc.name testUint16ArrayReducePart1033
     * @tc.desc Verify maximum Uint16 value stringifies without loss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 1);
      let result: string = arr.reduce((prev, curr) => prev + curr.toString(), "");
      expect(result).assertEqual("655351");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_3400
     * @tc.name testUint16ArrayReducePart1034
     * @tc.desc Verify all-positive predicate retains a true accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: boolean = arr.reduce<boolean>((prev, curr) => prev && (curr > 0), true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_3500
     * @tc.name testUint16ArrayReducePart1035
     * @tc.desc Verify any-match predicate invokes every callback iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let callCount: int = 0;
      let result: boolean = arr.reduce<boolean>((prev: boolean, curr: number, idx: int, a: Uint16Array): boolean => {
        callCount++;
        return prev || curr === 2;
      }, false);
      expect(callCount).assertEqual(3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_3600
     * @tc.name testUint16ArrayReducePart1036
     * @tc.desc Verify all-match reduction evaluates every zero element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 1);
      let callCount: int = 0;
      let result: boolean = arr.reduce<boolean>((prev: boolean, curr: number, idx: int, a: Uint16Array): boolean => {
        callCount++;
        return prev && curr > 0;
      }, true);
      expect(callCount).assertEqual(3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_3700
     * @tc.name testUint16ArrayReducePart1037
     * @tc.desc Verify all-zero input leaves an any-match accumulator false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: boolean = arr.reduce<boolean>((prev, curr) => prev || (curr > 0), false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_3800
     * @tc.name testUint16ArrayReducePart1038
     * @tc.desc Verify integer accumulator sums numeric elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.reduce<int>((prev: int, curr: number, idx: int, a: Uint16Array): int => prev + curr.toInt(), 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_3900
     * @tc.name testUint16ArrayReducePart1039
     * @tc.desc Verify integer accumulator supports subtraction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20);
      let result: int = arr.reduce<int>((prev: int, curr: number, idx: int, a: Uint16Array): int => prev - curr.toInt(), 100);
      expect(result).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_4000
     * @tc.name testUint16ArrayReducePart1040
     * @tc.desc Verify double accumulator sums numeric elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: double = arr.reduce<double>((prev: double, curr: number, idx: int, a: Uint16Array): double => prev + curr, 0.0);
      expect(result).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_4100
     * @tc.name testUint16ArrayReducePart1041
     * @tc.desc Verify double seed preserves floating-point addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: double = arr.reduce<double>((prev: double, curr: number, idx: int, a: Uint16Array): double => prev + curr, 3.14);
      expect(result).assertEqual(6.140000000000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_4200
     * @tc.name testUint16ArrayReducePart1042
     * @tc.desc Verify single element is combined with its numeric seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_4300
     * @tc.name testUint16ArrayReducePart1043
     * @tc.desc Verify sum across five sequential values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_4400
     * @tc.name testUint16ArrayReducePart1044
     * @tc.desc Verify sum across one hundred generated elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elems: number[] = [];
      let i: number = 0;
      while (i < 100) {
        elems.push(1);
        i = i + 1;
      }
      let arr: Uint16Array = Uint16Array.from(elems);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_4500
     * @tc.name testUint16ArrayReducePart1045
     * @tc.desc Verify sum with alternating zero and maximum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 0, 65535);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(131070);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_4600
     * @tc.name testUint16ArrayReducePart1046
     * @tc.desc Verify all-zero input produces a zero sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_4700
     * @tc.name testUint16ArrayReducePart1047
     * @tc.desc Verify sum exceeds Uint16 range without overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 65535, 65535);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(196605);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_4800
     * @tc.name testUint16ArrayReducePart1048
     * @tc.desc Verify character-code reduction produces a two-letter string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65, 66);
      let result: string = arr.reduce((prev: string, curr: number): string => prev + String.fromCharCode(curr.toInt()), "");
      expect(result).assertEqual("AB");
      
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_4900
     * @tc.name testUint16ArrayReducePart1049
     * @tc.desc Verify boolean accumulator confirms all values are positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: boolean = arr.reduce<boolean>((prev, curr) => prev && (curr > 0), true);
      expect(result).assertTrue();
      
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_5000
     * @tc.name testUint16ArrayReducePart1050
     * @tc.desc Verify string seed prefixes concatenated numeric values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: string = arr.reduce((prev, curr) => prev + curr.toString(), "nums:");
      expect(result).assertEqual("nums:123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_5100
     * @tc.name testUint16ArrayReducePart1051
     * @tc.desc Verify boolean accumulator confirms all values are even
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 4, 6);
      let result: boolean = arr.reduce<boolean>((prev, curr) => prev && (curr % 2 === 0), true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_5200
     * @tc.name testUint16ArrayReducePart1052
     * @tc.desc Verify reduction does not mutate source elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: number = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(6);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_5300
     * @tc.name testUint16ArrayReducePart1053
     * @tc.desc Verify callback error and message propagate unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      try {
        arr.reduce<number>((prev, curr) => {
          throw new Error("reduce_error");
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('reduce_error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_5400
     * @tc.name testUint16ArrayReducePart1054
     * @tc.desc Verify callback exception stops processing at the failing value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let iteratedCount: number = 0;
      try {
        arr.reduce<number>((prev, curr) => {
          iteratedCount = iteratedCount + 1;
          if (curr > 2) {
            throw new Error("stop");
          }
          return prev + curr;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(iteratedCount).assertEqual(3);
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('stop');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_5500
     * @tc.name testUint16ArrayReducePart1055
     * @tc.desc Verify callback observes mutation made to a later element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: number = arr.reduce<number>((prev, curr, idx, a) => {
        if (idx === 0) {
          a[1] = 10;
        }
        return prev + curr;
      }, 0);
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_5600
     * @tc.name testUint16ArrayReducePart1056
     * @tc.desc Verify seeded reduction starts callback indexing at zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 10);
      let firstIndex: number = -1;
      arr.reduce<number>((prev, curr, idx) => {
        if (idx === 0) {
          firstIndex = idx;
        }
        return prev + curr;
      }, 0);
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_5700
     * @tc.name testUint16ArrayReducePart1057
     * @tc.desc Verify seeded reduction reports consecutive indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let indices: number[] = [];
      arr.reduce<number>((prev, curr, idx) => {
          indices.push(idx);
          return prev + curr;
      }, 0);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_5800
     * @tc.name testUint16ArrayReducePart1058
     * @tc.desc Verify highest callback index matches the final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let maxIndex: number = 0;
      arr.reduce<number>((prev, curr, idx) => {
        if (idx > maxIndex) {
          maxIndex = idx;
        }
        return prev + curr;
      }, 0);
      expect(maxIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_5900
     * @tc.name testUint16ArrayReducePart1059
     * @tc.desc Verify callback source parameter references the original array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let sameRef: boolean = false;
      arr.reduce<number>((prev, curr, idx, a) => {
        sameRef = (a === arr);
        return prev + curr;
      }, 0);
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_6000
     * @tc.name testUint16ArrayReducePart1060
     * @tc.desc Verify callback source reports its full length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let arrLen: number = 0;
      arr.reduce<number>((prev, curr, idx, a) => {
        arrLen = a.length;
        return prev + curr;
      }, 0);
      expect(arrLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_6100
     * @tc.name testUint16ArrayReducePart1061
     * @tc.desc Verify callback can mutate the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr.reduce<number>((prev, curr, idx, a) => {
        if (idx === 0) {
          a[2] = 99;
        }
        return prev + curr;
      }, 0);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_6200
     * @tc.name testUint16ArrayReducePart1062
     * @tc.desc Verify callback current value matches source at its index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(7, 14, 21);
      let matchAll: boolean = true;
      arr.reduce<number>((prev, curr, idx, a) => {
        if (curr !== a[idx]) {
          matchAll = false;
        }
        return prev + curr;
      }, 0);
      expect(matchAll).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_6300
     * @tc.name testUint16ArrayReducePart1063
     * @tc.desc Verify one reduction result seeds a second reduction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Uint16Array = Uint16Array.of(1, 2, 3);
      let arr2: Uint16Array = Uint16Array.of(10, 20);
      let sum1: number = arr1.reduce<number>((p, c) => p + c, 0);
      let sum2: number = arr2.reduce<number>((p, c) => p + c, sum1);
      expect(sum2).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_6400
     * @tc.name testUint16ArrayReducePart1064
     * @tc.desc Verify independent reductions calculate sum and average
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let total: number = arr.reduce<number>((p, c) => p + c, 0);
      let avg: number = arr.reduce<number>((p, c) => p + c / 5, 0.0);
      expect(total).assertEqual(15);
      expect(avg).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_6500
     * @tc.name testUint16ArrayReducePart1065
     * @tc.desc Verify separate reductions calculate sum and product
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 4, 6);
      let sum: number = arr.reduce<number>((p, c) => p + c, 0);
      let product: number = arr.reduce<number>((p, c) => p * c, 1);
      expect(sum).assertEqual(12);
      expect(product).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_6600
     * @tc.name testUint16ArrayReducePart1066
     * @tc.desc Verify maximum seed and elements accumulate beyond Uint16 range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 65535);
      let result: number = arr.reduce<number>((p, c) => p + c, 65535);
      expect(result).assertEqual(196605);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_6700
     * @tc.name testUint16ArrayReducePart1067
     * @tc.desc Verify seeded subtraction is evaluated left to right
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: number = arr.reduce<number>((p, c) => p - c, 100);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_6800
     * @tc.name testUint16ArrayReducePart1068
     * @tc.desc Verify seeded multiplication multiplies every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 4, 5);
      let result: number = arr.reduce<number>((p, c) => p * c, 2);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_6900
     * @tc.name testUint16ArrayReducePart1069
     * @tc.desc Verify floored division is applied at each callback step
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 5, 2);
      let result: number = arr.reduce<number>((p, c) => Math.floor(p / c), 1000);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_7000
     * @tc.name testUint16ArrayReducePart1070
     * @tc.desc Verify callback can add a fixed bonus per element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: number = arr.reduce<number>((p, c) => p + c + 1, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_7100
     * @tc.name testUint16ArrayReducePart1071
     * @tc.desc Verify callback doubles each element before accumulation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: number = arr.reduce<number>((p, c) => p + c * 2, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_7200
     * @tc.name testUint16ArrayReducePart1072
     * @tc.desc Verify callback selectively sums even elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let result: number = arr.reduce<number>((p, c) => (c % 2 === 0) ? p + c : p, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_7300
     * @tc.name testUint16ArrayReducePart1073
     * @tc.desc Verify callback selectively sums odd elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let result: number = arr.reduce<number>((p, c) => (c % 2 !== 0) ? p + c : p, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_7400
     * @tc.name testUint16ArrayReducePart1074
     * @tc.desc Verify callback computes the maximum element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 7, 2, 9, 5);
      let result: number = arr.reduce<number>((p, c) => (c > p) ? c : p, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_7500
     * @tc.name testUint16ArrayReducePart1075
     * @tc.desc Verify callback computes the minimum from a high seed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 7, 2, 9, 5);
      let result: number = arr.reduce<number>((p, c) => (c < p) ? c : p, 65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_7600
     * @tc.name testUint16ArrayReducePart1076
     * @tc.desc Verify callback invocation count equals array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let count: number = arr.reduce<number>((p, c) => p + 1, 0);
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_7700
     * @tc.name testUint16ArrayReducePart1077
     * @tc.desc Verify string accumulator wraps each numeric element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: string = arr.reduce((p, c) => p + "(" + c.toString() + ")", "");
      expect(result).assertEqual("(1)(2)(3)");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_7800
     * @tc.name testUint16ArrayReducePart1078
     * @tc.desc Verify character-code reduction spells a word
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(72, 101, 108, 108, 111);
      let result: string = arr.reduce((p, c) => p + String.fromCharCode(c.toInt()), "");
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_7900
     * @tc.name testUint16ArrayReducePart1079
     * @tc.desc Verify all-match accumulator becomes false for zero values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: boolean = arr.reduce<boolean>((p, c) => p && (c > 0), true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART1_8000
     * @tc.name testUint16ArrayReducePart1080
     * @tc.desc Verify any-match accumulator becomes true at a positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 1);
      let result: boolean = arr.reduce<boolean>((p, c) => p || (c > 0), false);
      expect(result).assertTrue();
    });

  });
}
