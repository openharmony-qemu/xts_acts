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

export default function uint16ArrayReducePart2Test(): void {
  describe('Uint16ArrayReducePart2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_0100
     * @tc.name testUint16ArrayReducePart2001
     * @tc.desc Verify empty input without a seed throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint16Array = new Uint16Array(0);
        arr.reduce((prev: number, curr: number): number => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_0200
     * @tc.name testUint16ArrayReducePart2002
     * @tc.desc Verify unseeded reduction uses the first element as accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_0300
     * @tc.name testUint16ArrayReducePart2003
     * @tc.desc Verify unseeded single elements return unchanged edge values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: Uint16Array[] = [
        new Uint16Array([0]),
        new Uint16Array([99]),
        new Uint16Array([65535]),
      ];
      let expected: number[] = [0, 99, 65535];
      for (let i: int = 0; i < inputs.length; i++) {
        let result: number = inputs[i].reduce((prev: number, curr: number): number => prev + curr);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_0400
     * @tc.name testUint16ArrayReducePart2004
     * @tc.desc Verify unseeded sums across varied input lengths and values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: Uint16Array[] = [
        new Uint16Array([1, 2]),
        new Uint16Array([10, 20, 30, 40, 50]),
        new Uint16Array([1, 1, 1, 1, 1]),
        new Uint16Array([0, 0, 0]),
        new Uint16Array([10, 20, 30]),
        new Uint16Array([100, 200, 300]),
      ];
      let expected: number[] = [3, 150, 5, 0, 60, 600];
      for (let i: int = 0; i < inputs.length; i++) {
        let result: number = inputs[i].reduce((prev: number, curr: number): number => prev + curr);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_0500
     * @tc.name testUint16ArrayReducePart2005
     * @tc.desc Verify unseeded arithmetic, maximum, and minimum reductions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mul: Uint16Array[] = [
        new Uint16Array([10, 20]),
        new Uint16Array([1, 2, 3]),
      ];
      let mulExpected: number[] = [200, 6];
      for (let i: int = 0; i < mul.length; i++) {
        let result: number = mul[i].reduce((prev: number, curr: number): number => prev * curr);
        expect(result).assertEqual(mulExpected[i]);
      }
      let sub: Uint16Array[] = [
        new Uint16Array([5, 3]),
        new Uint16Array([100, 200, 300]),
      ];
      let subExpected: number[] = [2, -400];
      for (let i: int = 0; i < sub.length; i++) {
        let result: number = sub[i].reduce((prev: number, curr: number): number => prev - curr);
        expect(result).assertEqual(subExpected[i]);
      }
      let maxArr: Uint16Array[] = [
        new Uint16Array([0, 65535]),
        new Uint16Array([5, 10, 15]),
      ];
      let maxExpected: number[] = [65535, 15];
      for (let i: int = 0; i < maxArr.length; i++) {
        let result: number = maxArr[i].reduce((prev: number, curr: number): number => prev > curr ? prev : curr);
        expect(result).assertEqual(maxExpected[i]);
      }
      let minArr: Uint16Array[] = [
        new Uint16Array([7, 2]),
        new Uint16Array([100, 200, 300]),
      ];
      let minExpected: number[] = [2, 100];
      for (let i: int = 0; i < minArr.length; i++) {
        let result: number = minArr[i].reduce((prev: number, curr: number): number => prev < curr ? prev : curr);
        expect(result).assertEqual(minExpected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_0600
     * @tc.name testUint16ArrayReducePart2006
     * @tc.desc Verify unseeded bitwise OR and AND reductions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orArr: Uint16Array[] = [
        new Uint16Array([2, 4]),
        new Uint16Array([2, 4, 8]),
      ];
      let orExpected: number[] = [6, 14];
      for (let i: int = 0; i < orArr.length; i++) {
        let result: number = orArr[i].reduce((prev: number, curr: number): number => prev | curr);
        expect(result).assertEqual(orExpected[i]);
      }
      let andArr: Uint16Array[] = [
        new Uint16Array([2, 4]),
        new Uint16Array([3, 7]),
      ];
      let andExpected: number[] = [0, 3];
      for (let i: int = 0; i < andArr.length; i++) {
        let result: number = andArr[i].reduce((prev: number, curr: number): number => prev & curr);
        expect(result).assertEqual(andExpected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_0700
     * @tc.name testUint16ArrayReducePart2007
     * @tc.desc Verify empty subarray without a seed throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint16Array = new Uint16Array([1, 2, 3]);
        let empty: Uint16Array = arr.subarray(0, 0);
        empty.reduce((prev: number, curr: number): number => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_0800
     * @tc.name testUint16ArrayReducePart2008
     * @tc.desc Verify unseeded single element skips callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      let arr: Uint16Array = new Uint16Array([99]);
      let result: number = arr.reduce((prev: number, curr: number): number => {
        called = true;
        return prev + curr;
      });
      expect(called).assertFalse();
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_0900
     * @tc.name testUint16ArrayReducePart2009
     * @tc.desc Verify unseeded multiplication of two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([10, 20]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev * curr);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_1000
     * @tc.name testUint16ArrayReducePart2010
     * @tc.desc Verify unseeded subtraction preserves operand order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([5, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev - curr);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_1100
     * @tc.name testUint16ArrayReducePart2011
     * @tc.desc Verify unseeded reduction selects the larger value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([3, 5]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev > curr ? prev : curr);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_1200
     * @tc.name testUint16ArrayReducePart2012
     * @tc.desc Verify unseeded reduction selects the smaller value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([7, 2]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev < curr ? prev : curr);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_1300
     * @tc.name testUint16ArrayReducePart2013
     * @tc.desc Verify unseeded sum exceeds the Uint16 element range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([32768, 32768]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_1400
     * @tc.name testUint16ArrayReducePart2014
     * @tc.desc Verify zero addend preserves an unseeded sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([100, 0]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_1500
     * @tc.name testUint16ArrayReducePart2015
     * @tc.desc Verify maximum values accumulate without overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65535, 65535]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(131070);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_1600
     * @tc.name testUint16ArrayReducePart2016
     * @tc.desc Verify unseeded sum of five consecutive values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_1700
     * @tc.name testUint16ArrayReducePart2017
     * @tc.desc Verify unseeded reduction finds the largest three-digit value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([100, 200, 300]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev > curr ? prev : curr);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_1800
     * @tc.name testUint16ArrayReducePart2018
     * @tc.desc Verify unseeded reduction finds the smallest three-digit value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([100, 200, 300]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev < curr ? prev : curr);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_1900
     * @tc.name testUint16ArrayReducePart2019
     * @tc.desc Verify unseeded product across four even values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([2, 4, 6, 8]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev * curr);
      expect(result).assertEqual(384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_2000
     * @tc.name testUint16ArrayReducePart2020
     * @tc.desc Verify unseeded subtraction accumulates a negative result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([100, 200, 300]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev - curr);
      expect(result).assertEqual(-400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_2100
     * @tc.name testUint16ArrayReducePart2021
     * @tc.desc Verify unseeded XOR reduction across three values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([7, 3, 5]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev ^ curr);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_2200
     * @tc.name testUint16ArrayReducePart2022
     * @tc.desc Verify unseeded callback starts at index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstIndex: int = -1;
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.reduce((prev: number, curr: number, idx: int): number => {
        if (firstIndex === -1) {
          firstIndex = idx;
        }
        return prev + curr;
      });
      expect(firstIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_2300
     * @tc.name testUint16ArrayReducePart2023
     * @tc.desc Verify unseeded callback visits indexes one through four
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let indices: int[] = [];
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.reduce((prev: number, curr: number, idx: int): number => {
        indices.push(idx);
        return prev + curr;
      });
      expect(indices.length).assertEqual(4);
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(2);
      expect(indices[2]).assertEqual(3);
      expect(indices[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_2400
     * @tc.name testUint16ArrayReducePart2024
     * @tc.desc Verify callback index contributes to the accumulated result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number, idx: int): number => prev + curr + idx);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_2500
     * @tc.name testUint16ArrayReducePart2025
     * @tc.desc Verify unseeded callback never receives index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let startsAtZero: boolean = false;
      let arr: Uint16Array = new Uint16Array([5, 10, 15]);
      arr.reduce((prev: number, curr: number, idx: int): number => {
        if (idx === 0) {
          startsAtZero = true;
        }
        return prev + curr;
      });
      expect(startsAtZero).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_2600
     * @tc.name testUint16ArrayReducePart2026
     * @tc.desc Verify unseeded callback indexes increase monotonically
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prevIdx: int = -1;
      let monotonic: boolean = true;
      let arr: Uint16Array = new Uint16Array([1, 3, 5, 7, 9]);
      arr.reduce((prev: number, curr: number, idx: int): number => {
        if (idx <= prevIdx) {
          monotonic = false;
        }
        prevIdx = idx;
        return prev + curr;
      });
      expect(monotonic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_2700
     * @tc.name testUint16ArrayReducePart2027
     * @tc.desc Verify callback can select elements at even indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
      let result: number = arr.reduce((prev: number, curr: number, idx: int): number => {
        if (idx % 2 === 0) {
          return prev + curr;
        }
        return prev;
      });
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_2800
     * @tc.name testUint16ArrayReducePart2028
     * @tc.desc Verify callback source exposes its first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: number = 0;
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.reduce((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        first = a[0];
        return prev + curr;
      });
      expect(first).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_2900
     * @tc.name testUint16ArrayReducePart2029
     * @tc.desc Verify callback source exposes its original length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: int = 0;
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.reduce((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        len = a.length;
        return prev + curr;
      });
      expect(len).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_3000
     * @tc.name testUint16ArrayReducePart2030
     * @tc.desc Verify callback source is the original Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sameRef: boolean = false;
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      arr.reduce((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        sameRef = (a === arr);
        return prev + curr;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_3100
     * @tc.name testUint16ArrayReducePart2031
     * @tc.desc Verify source element matches current value at each callback index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matchCount: int = 0;
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.reduce((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        if (a[idx] === curr) {
          matchCount++;
        }
        return prev + curr;
      });
      expect(matchCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_3200
     * @tc.name testUint16ArrayReducePart2032
     * @tc.desc Verify callback compares values against the first source element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([5, 8, 3, 10]);
      let result: number = arr.reduce((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        if (curr > a[0]) {
          return prev + curr;
        }
        return prev;
      });
      expect(result).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_3300
     * @tc.name testUint16ArrayReducePart2033
     * @tc.desc Verify callback source exposes its final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let last: number = 0;
      let arr: Uint16Array = new Uint16Array([2, 4, 6, 8]);
      arr.reduce((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        last = a[a.length - 1];
        return prev + curr;
      });
      expect(last).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_3400
     * @tc.name testUint16ArrayReducePart2034
     * @tc.desc Verify maximum value plus one is summed accurately
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65535, 1]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_3500
     * @tc.name testUint16ArrayReducePart2035
     * @tc.desc Verify Uint16Array construction truncates fractional input before reduction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([3.14, 7]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_3600
     * @tc.name testUint16ArrayReducePart2036
     * @tc.desc Verify Uint16Array construction converts NaN to zero before reduction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([Number.NaN, 10]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_3700
     * @tc.name testUint16ArrayReducePart2037
     * @tc.desc Verify Uint16Array construction converts infinity to zero before reduction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([Number.POSITIVE_INFINITY, 5]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_3800
     * @tc.name testUint16ArrayReducePart2038
     * @tc.desc Verify binary literal elements sum correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0b1, 0b10, 0b11]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_3900
     * @tc.name testUint16ArrayReducePart2039
     * @tc.desc Verify octal literal elements sum correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0o7777, 1]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(4096);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_4000
     * @tc.name testUint16ArrayReducePart2040
     * @tc.desc Verify exponential literal elements sum correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1e4, 1]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(10001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_4100
     * @tc.name testUint16ArrayReducePart2041
     * @tc.desc Verify negative fractional input truncates to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([-0.5, 0]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_4200
     * @tc.name testUint16ArrayReducePart2042
     * @tc.desc Verify NaN callback result propagates after the first invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let callCount: int = 0;
      let firstPrevious: number = -1;
      let firstCurrent: number = -1;
      let result: number = arr.reduce((prev: number, curr: number): number => {
        callCount++;
        if (callCount === 1) {
          firstPrevious = prev;
          firstCurrent = curr;
        }
        return Number.NaN;
      });
      expect(isNaN(result)).assertTrue();
      expect(callCount).assertEqual(2);
      expect(firstPrevious).assertEqual(1);
      expect(firstCurrent).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_4300
     * @tc.name testUint16ArrayReducePart2043
     * @tc.desc Verify callback can return positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2]);
      let result: number = arr.reduce((prev: number, curr: number): number => Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_4400
     * @tc.name testUint16ArrayReducePart2044
     * @tc.desc Verify callback can return negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2]);
      let result: number = arr.reduce((prev: number, curr: number): number => -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_4500
     * @tc.name testUint16ArrayReducePart2045
     * @tc.desc Verify callback can ignore current values during reduction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev - 100);
      expect(result).assertEqual(-199);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_4600
     * @tc.name testUint16ArrayReducePart2046
     * @tc.desc Verify callback can reset the accumulator to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([5, 10, 15]);
      let result: number = arr.reduce((prev: number, curr: number): number => 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_4700
     * @tc.name testUint16ArrayReducePart2047
     * @tc.desc Verify fractional callback results accumulate normally
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr + 0.5);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_4800
     * @tc.name testUint16ArrayReducePart2048
     * @tc.desc Verify callback can return the maximum safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2]);
      let callCount: int = 0;
      let observedPrevious: number = -1;
      let observedCurrent: number = -1;
      let result: number = arr.reduce((prev: number, curr: number): number => {
        callCount++;
        observedPrevious = prev;
        observedCurrent = curr;
        return Number.MAX_SAFE_INTEGER;
      });
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(callCount).assertEqual(1);
      expect(observedPrevious).assertEqual(1);
      expect(observedCurrent).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_4900
     * @tc.name testUint16ArrayReducePart2049
      * @tc.desc Verify weighted callback accumulation and its single invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2]);
      let callCount: int = 0;
      let result: number = arr.reduce((prev: number, curr: number): number => {
        callCount++;
        return prev + curr * 10;
      });
      expect(result).assertEqual(21);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_5000
     * @tc.name testUint16ArrayReducePart2050
     * @tc.desc Verify callback-thrown error and message propagate unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint16Array = new Uint16Array([1, 2, 3]);
        arr.reduce((prev: number, curr: number): number => {
          throw new Error('reduce error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('reduce error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_5100
     * @tc.name testUint16ArrayReducePart2051
     * @tc.desc Verify error on the second callback stops reduction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      try {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4]);
        arr.reduce((prev: number, curr: number): number => {
          callCount++;
          if (callCount === 2) {
            throw new Error('fail on second call');
          }
          return prev + curr;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('fail on second call');
        expect(callCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_5200
     * @tc.name testUint16ArrayReducePart2052
     * @tc.desc Verify callback captures an outer numeric variable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: number = 100;
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr + base);
      expect(result).assertEqual(206);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_5300
     * @tc.name testUint16ArrayReducePart2053
     * @tc.desc Verify unseeded callback count equals length minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter: int = 0;
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => {
        counter++;
        return prev + curr;
      });
      expect(counter).assertEqual(2);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_5400
     * @tc.name testUint16ArrayReducePart2054
     * @tc.desc Verify callback observes all non-initial elements in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: number[] = [];
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: number = arr.reduce((prev: number, curr: number): number => {
        collected.push(curr);
        return prev + curr;
      });
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(20);
      expect(collected[1]).assertEqual(30);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_5500
     * @tc.name testUint16ArrayReducePart2055
     * @tc.desc Verify reduction delegates to a named arithmetic helper
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let addWithBonus = (a: number, b: number): number => a + b + 1;
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => addWithBonus(prev, curr));
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_5600
     * @tc.name testUint16ArrayReducePart2056
     * @tc.desc Verify callback captures an outer constant factor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const FACTOR: number = 2;
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr * FACTOR);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_5700
     * @tc.name testUint16ArrayReducePart2057
     * @tc.desc Verify callback indexes and values can populate a Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idxMap: Map<int, number> = new Map<int, number>();
      let arr: Uint16Array = new Uint16Array([5, 10, 15]);
      arr.reduce((prev: number, curr: number, idx: int): number => {
        idxMap.set(idx, curr);
        return prev + curr;
      });
      expect(idxMap.get(1)).assertEqual(10);
      expect(idxMap.get(2)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_5800
     * @tc.name testUint16ArrayReducePart2058
     * @tc.desc Verify reduction result can define a new Uint16Array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = new Uint16Array([1, 2, 3]);
      let sum: number = src.reduce((prev: number, curr: number): number => prev + curr);
      let dest: Uint16Array = new Uint16Array(sum);
      expect(dest.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_5900
     * @tc.name testUint16ArrayReducePart2059
     * @tc.desc Verify a reduction result supports post-reduction arithmetic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let sum: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      let doubled: number = sum * 2;
      expect(doubled).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_6000
     * @tc.name testUint16ArrayReducePart2060
     * @tc.desc Verify independent arrays produce independent sums
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint16Array = new Uint16Array([1, 2, 3]);
      let b: Uint16Array = new Uint16Array([4, 5, 6]);
      let sumA: number = a.reduce((prev: number, curr: number): number => prev + curr);
      let sumB: number = b.reduce((prev: number, curr: number): number => prev + curr);
      expect(sumA).assertEqual(6);
      expect(sumB).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_6100
     * @tc.name testUint16ArrayReducePart2061
     * @tc.desc Verify reduction sums a bounded subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let sub: Uint16Array = arr.subarray(1, 4);
      let result: number = sub.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_6200
     * @tc.name testUint16ArrayReducePart2062
     * @tc.desc Verify reduction sums a sliced copy suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let sliced: Uint16Array = arr.slice(2);
      let result: number = sliced.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_6300
     * @tc.name testUint16ArrayReducePart2063
     * @tc.desc Verify unseeded sum of multiples of three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([3, 6, 9]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_6400
     * @tc.name testUint16ArrayReducePart2064
     * @tc.desc Verify reduction finds the maximum of one hundred values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: number[] = [];
      for (let i: int = 0; i < 100; i++) {
        data.push(i);
      }
      let arr: Uint16Array = new Uint16Array(data);
      let result: number = arr.reduce((prev: number, curr: number): number => prev > curr ? prev : curr);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_6500
     * @tc.name testUint16ArrayReducePart2065
     * @tc.desc Verify reduction sums two hundred fifty-six unit values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: number[] = [];
      for (let i: int = 0; i < 256; i++) {
        data.push(1);
      }
      let arr: Uint16Array = new Uint16Array(data);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_6600
     * @tc.name testUint16ArrayReducePart2066
     * @tc.desc Verify callback concatenates digits into a numeric value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => parseInt(prev.toString() + curr.toString()));
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_6700
     * @tc.name testUint16ArrayReducePart2067
     * @tc.desc Verify callback can count invocations from the first value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + 1);
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_6800
     * @tc.name testUint16ArrayReducePart2068
     * @tc.desc Verify callback can retain the first element as accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([7, 8, 9]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_6900
     * @tc.name testUint16ArrayReducePart2069
     * @tc.desc Verify callback can retain the final element as accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4]);
      let result: number = arr.reduce((prev: number, curr: number): number => curr);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_7000
     * @tc.name testUint16ArrayReducePart2070
     * @tc.desc Verify XOR reduction cancels sequential values to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev ^ curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_7100
     * @tc.name testUint16ArrayReducePart2071
     * @tc.desc Verify callback applies a left shift between two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev << curr);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_7200
     * @tc.name testUint16ArrayReducePart2072
     * @tc.desc Verify callback applies a right shift between two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([16, 2]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev >> curr);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_7300
     * @tc.name testUint16ArrayReducePart2073
     * @tc.desc Verify callback applies remainder successively
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([100, 30, 20]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev % curr);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_7400
     * @tc.name testUint16ArrayReducePart2074
     * @tc.desc Verify callback counts elements greater than three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 5, 2, 8, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => curr > 3 ? prev + 1 : prev);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_7500
     * @tc.name testUint16ArrayReducePart2075
     * @tc.desc Verify callback accumulates the squares of later elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr * curr);
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_7600
     * @tc.name testUint16ArrayReducePart2076
     * @tc.desc Verify reduction sums values populated with set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(4);
      arr.set([10, 20, 30, 40]);
      let result: number = arr.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_7700
     * @tc.name testUint16ArrayReducePart2077
     * @tc.desc Verify reduction sums a Uint16Array backed by ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let view1: Uint16Array = new Uint16Array(buffer);
      view1[0] = 1;
      view1[1] = 2;
      view1[2] = 3;
      view1[3] = 4;
      let result: number = view1.reduce((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_7800
     * @tc.name testUint16ArrayReducePart2078
     * @tc.desc Verify unseeded sum of values created with Uint16Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(4, 6, 8);
      const result: number = arr.reduce((previous: number, current: number): number => previous + current);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_7900
     * @tc.name testUint16ArrayReducePart2079
     * @tc.desc Verify reduce callback receives the original Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3, 5, 7);
      let sameArray: boolean = true;
      const result: number = arr.reduce((previous: number, current: number, index: int,
        source: Uint16Array): number => {
        sameArray = sameArray && source === arr && source[index] === current;
        return previous + current;
      });
      expect(result).assertEqual(15);
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REDUCE_PART2_8000
     * @tc.name testUint16ArrayReducePart2080
     * @tc.desc Verify reduce visits indexes from one through the final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayReducePart2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2, 4, 6, 8);
      let encodedIndexes: int = 0;
      const result: number = arr.reduce((previous: number, current: number, index: int): number => {
        encodedIndexes = encodedIndexes * 10 + index;
        return previous + current;
      });
      expect(result).assertEqual(20);
      expect(encodedIndexes).assertEqual(123);
    });

  });
}
