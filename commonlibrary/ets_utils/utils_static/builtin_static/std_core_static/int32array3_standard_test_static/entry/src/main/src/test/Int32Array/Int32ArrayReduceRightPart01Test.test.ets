'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayReduceRightPart01TestMindmapTestTest(): void {
  describe('Int32ArrayReduceRightPart01TestMindmapTestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest001
     * @tc.desc Verify reduceRight with 2 args callbackfn+initialValue number generic, sums elements right-to-left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const result: number =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest002
     * @tc.desc Verify reduceRight with 2 args U=string type, concatenates right-to-left as string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20, 30);
      const result =
      values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => prev + cur.toString(),
      '');
      expect(result).assertEqual('302010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest003
     * @tc.desc Verify callbackfn first previousValue equals initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const calls: number[] = [] as number[];
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        calls.push(prev);
        return prev + cur;
      }, 100);
      expect(calls[0]).assertEqual(100);
      expect(calls[1]).assertEqual(103);
      expect(calls[2]).assertEqual(105);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest004
     * @tc.desc Verify callbackfn currentValue starts from last element and moves left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20, 30);
      const seq: number[] = [] as number[];
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        seq.push(cur);
        return prev + cur;
      }, 0);
      expect(seq.length).assertEqual(3);
      expect(seq[0]).assertEqual(30);
      expect(seq[1]).assertEqual(20);
      expect(seq[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest005
     * @tc.desc Verify callbackfn currentIndex strictly decrements from length-1 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20, 30);
      const idxSeq: int[] = [];
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        idxSeq.push(idx);
        return prev + cur;
      }, 0);
      expect(idxSeq.length).assertEqual(3);
      expect(idxSeq[0]).assertEqual(2);
      expect(idxSeq[1]).assertEqual(1);
      expect(idxSeq[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest006
     * @tc.desc Verify callbackfn array parameter references the original Int32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      let captured: Int32Array | null = null;
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        if (captured === null) {
          captured = arr;
        }
        return prev + cur;
      }, 0);
      expect(captured!).assertEqual(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest007
     * @tc.desc Verify callbackfn array parameter length equals original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3, 4);
      let capturedLen: int = -1;
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        capturedLen = arr.length;
        return prev + cur;
      }, 0);
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest008
     * @tc.desc Verify callbackfn works correctly when ignoring index and array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(5, 6, 7);
      const result = values.reduceRight((prev: number, cur: number): number => prev + cur, 0);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest009
     * @tc.desc Verify callbackfn call count equals array length for multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20, 30, 40);
      let count: int = 0;
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        count++;
        return prev + cur;
      }, 0);
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest010
     * @tc.desc Verify single-element array calls callbackfn exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(42);
      let count: int = 0;
      const result = values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        count++;
        return prev + cur;
      }, 0);
      expect(count).assertEqual(1);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest011
     * @tc.desc Verify empty array with initialValue does not invoke callbackfn, returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Int32Array(0);
      let count: int = 0;
      const result = values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        count++;
        return prev + cur;
      }, 99);
      expect(count).assertEqual(0);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest012
     * @tc.desc Verify callbackfn returning boolean type U with OR accumulation, hits true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(0, 0, 1, 0);
      const result =
      values.reduceRight((prev: boolean, cur: number, idx: int, arr: Int32Array): boolean => prev || cur !== 0,
      false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest013
     * @tc.desc Verify callbackfn returning boolean with all-zero elements returns initialValue false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(0, 0, 0);
      const result =
      values.reduceRight((prev: boolean, cur: number, idx: int, arr: Int32Array): boolean => prev || cur !== 0,
      false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest014
     * @tc.desc Verify string callbackfn first prev equals string initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2);
      let firstPrev: string = '';
      values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => {
        if (firstPrev === '') {
          firstPrev = prev;
        }
        return prev + cur.toString();
      }, 'X');
      expect(firstPrev).assertEqual('X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest015
     * @tc.desc Verify initialValue=1 multiplication, right-to-left order does not affect product; Also verify verify mixed positive and negative element accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3, 4);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev * cur, 1);
      expect(result).assertEqual(24);

      {
      const values = Int32Array.of(-10, 20, -30, 40);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest016
     * @tc.desc Verify initialValue negative number participates in accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20, 30);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, -100);
      expect(result).assertEqual(-40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest017
     * @tc.desc Verify initialValue=INT_MAX adding zeros keeps INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Int32Array(3);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 2147483647);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest018
     * @tc.desc Verify initialValue=INT_MIN adding positive numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 1, 1);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, -2147483648);
      expect(result).assertEqual(-2147483645);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest019
     * @tc.desc Verify initialValue=0 with all-zero array returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Int32Array(5);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest020
     * @tc.desc Verify initialValue=1.0 float participates in number accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 1.0);
      expect(result).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest021
     * @tc.desc Verify initialValue=NaN results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, Number.NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest022
     * @tc.desc Verify initialValue=Infinity subtraction keeps Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const result = values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev - cur,
      Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest023
     * @tc.desc Verify initialValue=-Infinity accumulation stays -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const result = values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur,
      Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest024
     * @tc.desc Verify reduceRight preserves an explicit zero initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(0);
      const result = values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest025
     * @tc.desc Verify initialValue empty string with reverse string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const result: string =
      values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => prev + cur.toString(),
      '');
      expect(result).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest026
     * @tc.desc Verify initialValue non-empty prefix string with reverse concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20, 30);
      const result =
      values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => prev + cur.toString(),
      'start');
      expect(result).assertEqual('start302010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest027
     * @tc.desc Verify callback inserts separator for reverse concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const result = values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => idx === 0 ?
      prev + cur.toString() : prev + cur.toString() + ',', '');
      expect(result).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest028
     * @tc.desc Verify empty array with string initialValue directly returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Int32Array(0);
      const result =
      values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => prev + cur.toString(),
      'init');
      expect(result).assertEqual('init');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest029
     * @tc.desc Verify single-element with string initialValue single callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(7);
      const result =
      values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => prev + cur.toString(),
      'v=');
      expect(result).assertEqual('v=7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest030
     * @tc.desc Verify string scenario negative values concatenate minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(-1, -2, -3);
      const result =
      values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => prev + cur.toString(),
      '');
      expect(result).assertEqual('-3-2-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest031
     * @tc.desc Verify string scenario index decrements from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20, 30);
      const idxArr: int[] = [];
      values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => {
        idxArr.push(idx);
        return prev + cur.toString();
      }, '');
      expect(idxArr[0]).assertEqual(2);
      expect(idxArr[1]).assertEqual(1);
      expect(idxArr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest032
     * @tc.desc Verify two-element subtraction right-to-left: 10-2-1=7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev - cur, 10);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest033
     * @tc.desc Verify three-element subtraction right-to-left: 10-3-2-1=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev - cur, 10);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest034
     * @tc.desc Verify division right-to-left: 100/4/2=12.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(2, 4);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev / cur, 100.0);
      expect(result).assertEqual(12.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest035
     * @tc.desc Verify max finding is not affected by right-to-left order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(3, 7, 2, 9, 5);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => cur > prev ? cur : prev,
      -2147483648);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest036
     * @tc.desc Verify min finding is not affected by right-to-left order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(3, 7, 2, 9, 5);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => cur < prev ? cur : prev,
      2147483647);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest037
     * @tc.desc Verify boolean AND accumulation with zero element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3, 0);
      const result =
      values.reduceRight((prev: boolean, cur: number, idx: int, arr: Int32Array): boolean => prev && cur !== 0,
      true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest038
     * @tc.desc Verify boolean AND accumulation with all non-zero elements returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, -1, 2);
      const result =
      values.reduceRight((prev: boolean, cur: number, idx: int, arr: Int32Array): boolean => prev && cur !== 0,
      true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest039
     * @tc.desc Verify array containing INT_MAX element accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(2147483647, 0);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest040
     * @tc.desc Verify array containing INT_MIN element accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(-2147483648, 0);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest041
     * @tc.desc Verify array containing -1 elements accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(-1, -1, -1);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest042
     * @tc.desc Verify array of all ones sum equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 1, 1, 1, 1);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest043
     * @tc.desc Verify Int32Array from ArrayBuffer constructor reduceRight accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const values = new Int32Array(buf, 0, 3);
      values.$_set(0, 1);
      values.$_set(1, 2);
      values.$_set(2, 3);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest044
     * @tc.desc Verify Int32Array with byteOffset reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const values = new Int32Array(buf, 4, 3);
      values.$_set(0, 10);
      values.$_set(1, 20);
      values.$_set(2, 30);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest045
     * @tc.desc Verify subarray view reduceRight accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3, 4, 5);
      const sub = values.subarray(1, 4);
      const result = sub.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest046
     * @tc.desc Verify Int32Array constructed from another Int32Array reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int32Array.of(7, 8, 9);
      const values = new Int32Array(src);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest047
     * @tc.desc Verify Int32Array.from constructed array reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.from([5, 10, 15]);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest048
     * @tc.desc Verify array containing 0 as regular element distinct from initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(0, 0, 5);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest049
     * @tc.desc Verify array containing 0 element string concatenation produces '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(0, 0, 1);
      const result =
      values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => prev + cur.toString(),
      '');
      expect(result).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest050
     * @tc.desc Verify empty array number initialValue directly returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Int32Array(0);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest051
     * @tc.desc Verify reduceRight does not modify original array element values; Also verify verify reduceRight does not modify original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);

      {
      const values = Int32Array.of(1, 2, 3);
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(values.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest052
     * @tc.desc Verify reading element via array.$_get(idx) in callback produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(5, 6, 7);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + arr.$_get(idx),
      0);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest053
     * @tc.desc Verify multi-element accumulation callback step count assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20);
      let stepCount: int = 0;
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        stepCount++;
        return prev + cur;
      }, 0);
      expect(stepCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest054
     * @tc.desc Verify callbackfn first invocation throws Error exception propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      try {
        values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
          expect(cur).assertEqual(3);
          throw new Error('callback error');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest055
     * @tc.desc Verify callbackfn first throw prevents subsequent callbacks from executing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
          callCount++;
          expect(cur).assertEqual(3);
          throw new Error('first iter');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest056
     * @tc.desc Verify callbackfn mid-iteration throw prevents subsequent callbacks; Also verify verify last callback (idx=0) throws error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
          callCount++;
          if (idx === 1) {
            throw new Error('mid iter');
          }
          return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }

      {
      const values = Int32Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
          callCount++;
          if (idx === 0) {
            throw new Error('last iter');
          }
          return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest057
     * @tc.desc Verify passing undefined as callbackfn triggers exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      try {
        values.reduceRight(undefined as (prev: number, cur: number, idx: int, arr: Int32Array) => number, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest058
     * @tc.desc Verify passing null as callbackfn triggers exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      try {
        values.reduceRight(null as (prev: number, cur: number, idx: int, arr: Int32Array) => number, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest059
     * @tc.desc Verify accumulation overflow beyond INT_MAX uses number (no truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(2147483647, 1);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(2147483648.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest060
     * @tc.desc Verify accumulation underflow below INT_MIN uses number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(-2147483648, -1);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 0);
      expect(result).assertEqual(-2147483649.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest061
     * @tc.desc Verify NaN as initialValue propagates NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, Number.NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest062
     * @tc.desc Verify callback previousValue as large double participates in computation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 1);
      const result =
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => prev + cur, 1e15);
      expect(result).assertEqual(1000000000000002.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest063
     * @tc.desc Verify writing via shared buffer other view in callback affects subsequent iteration reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const values = new Int32Array(buf, 0, 3);
      values.$_set(0, 1);
      values.$_set(1, 2);
      values.$_set(2, 3);
      const other = new Int32Array(buf, 0, 3);
      const result = values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        if (idx === 2) {
          other.$_set(1, 99);
        }
        return prev + cur;
      }, 0);
      expect(values.$_get(1)).assertEqual(99);
      expect(result).assertEqual(103);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest064
     * @tc.desc Verify $_set modifying array in callback affects subsequent iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const result = values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        if (idx === 2) {
          arr.$_set(1, 50);
        }
        return prev + cur;
      }, 0);
      expect(values.$_get(1)).assertEqual(50);
      expect(result).assertEqual(54);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest065
     * @tc.desc Verify subarray reduceRight array parameter length equals subarray length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20, 30, 40, 50);
      const sub = values.subarray(1, 4);
      let capturedLen: int = -1;
      sub.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        capturedLen = arr.length;
        return prev + cur;
      }, 0);
      expect(capturedLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest066
     * @tc.desc Verify subarray callback array.$_get uses relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20, 30, 40, 50);
      const sub = values.subarray(1, 4);
      let firstAtIdx2: number = 0;
      sub.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        if (idx === 2) {
          firstAtIdx2 = arr.$_get(2);
        }
        return prev + cur;
      }, 0);
      expect(firstAtIdx2).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest067
     * @tc.desc Verify single-element array callbackfn receives index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(77);
      let gotIdx: int = -1;
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        gotIdx = idx;
        return prev + cur;
      }, 0);
      expect(gotIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest068
     * @tc.desc Verify single-element array callbackfn receives currentValue as element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(77);
      let gotCur: number = 0;
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        gotCur = cur;
        return prev + cur;
      }, 0);
      expect(gotCur).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest069
     * @tc.desc Verify single-element array callbackfn receives previousValue as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(77);
      let gotPrev: number = 0;
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        gotPrev = prev;
        return prev + cur;
      }, 123);
      expect(gotPrev).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest070
     * @tc.desc Verify first step currentValue is the element at length-1 position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(11, 22, 33, 44);
      let firstCur: number = 0;
      let firstIdx: int = -1;
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        if (firstIdx === -1) {
          firstCur = cur;
          firstIdx = idx;
        }
        return prev + cur;
      }, 0);
      expect(firstCur).assertEqual(44);
      expect(firstIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest071
     * @tc.desc Verify last step index equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(11, 22, 33);
      let lastIdx: int = -1;
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        lastIdx = idx;
        return prev + cur;
      }, 0);
      expect(lastIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest072
     * @tc.desc Verify callback array.length remains constant throughout iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(1, 2, 3);
      const lens: int[] = [];
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        lens.push(arr.length);
        return prev + cur;
      }, 0);
      expect(lens[0]).assertEqual(3);
      expect(lens[1]).assertEqual(3);
      expect(lens[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest073
     * @tc.desc Verify five-element array adjacent index steps differ by exactly 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(10, 20, 30, 40, 50);
      const idxs: int[] = [];
      values.reduceRight((prev: number, cur: number, idx: int, arr: Int32Array): number => {
        idxs.push(idx);
        return prev + cur;
      }, 0);
      expect(idxs.length).assertEqual(5);
      expect(idxs[0] - idxs[1]).assertEqual(1);
      expect(idxs[1] - idxs[2]).assertEqual(1);
      expect(idxs[2] - idxs[3]).assertEqual(1);
      expect(idxs[3] - idxs[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayReduceRightPart01TestMindmapTest074
     * @tc.desc Verify string scenario '0' prefix reverse concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Int32Array.of(4, 5, 6);
      const result =
      values.reduceRight((prev: string, cur: number, idx: int, arr: Int32Array): string => prev + cur.toString(),
      '0');
      expect(result).assertEqual('0654');
    });
  });
}
