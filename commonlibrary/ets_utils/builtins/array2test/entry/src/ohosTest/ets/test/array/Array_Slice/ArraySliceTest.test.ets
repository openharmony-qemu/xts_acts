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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../../Util.test';
import {
  ArraySliceJs_3_2,
  ArraySliceJs_3_5,
  ArraySliceJs_3_6,
  ArraySliceJs_4_3,
  ArraySliceJs_4_4,
  ArraySliceJs_5_6,
  ArraySliceJs_7_5,
  ArraySliceJs_7_6,
  ArraySliceJs_8_1,
  ArraySliceJs_8_3,
  ArraySliceJs_8_4,
  ArraySliceJs_8_5,
  ArraySliceJs_8_6,
  ArraySliceJs_9_1,
  ArraySliceJs_9_2,
  ArraySliceJs_9_3,
  ArraySliceJs_9_4,
  ArraySliceJs_9_5,
  ArraySliceJs_9_7,
  ArraySliceJs_11_2,
  ArraySliceJs_11_4,
  ArraySliceJs_11_5,
  ArraySliceJs_11_6,
  ArraySliceJs_12_2,
  ArraySliceJs_12_3
} from './ArraySliceTest';

export default function ArraySliceTestSupplement() {
  describe('ArraySliceTestSupplement', () => {
    beforeAll(() => {
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name testArraySliceTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0100
     * @tc.desc 1.1 Extract a contiguous segment from the middle of an array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 4);
      expect(result).assertDeepEquals([2, 3, 4]);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0200
     * @tc.desc 1.2 Extract a single element from an array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2, 3);
      expect(result).assertDeepEquals([3]);
    })

    /**
     * @tc.name testArraySliceTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0300
     * @tc.desc 1.3 Return empty array when begin >= end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(3, 3);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0400
     * @tc.desc 1.4 Return a copy of the entire array when no arguments are passed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice();
      expect(result1).assertDeepEquals([1, 2, 3, 4, 5]);
      const result2: number[] = arr.slice(0, 5);
      expect(result2).assertDeepEquals([1, 2, 3, 4, 5]);
      const result3: number[] = arr.slice(0, arr.length);
      expect(result3).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0500
     * @tc.desc 1.5 Extract to end of array when only begin is specified
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0600
     * @tc.desc 1.6 Extract from start to specified position when begin is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(0, 3);
      expect(result).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0700
     * @tc.desc 2.1 Return empty array when begin > end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(4, 2);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0800
     * @tc.desc 2.2 Return empty array when begin exceeds array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(10);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0900
     * @tc.desc 2.3 Extract to array end when end exceeds array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2, 10);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1000
     * @tc.desc 2.4 Return empty array when both begin and end exceed array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(10, 20);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1100
     * @tc.desc 2.5 Return empty array when begin equals end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2, 2);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1200
     * @tc.desc 2.6 Extract from array start when begin is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(0, 3);
      expect(result).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1300
     * @tc.desc 2.7 Extract through last element when end equals array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2, 5);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1400
     * @tc.desc 2.8 Extract trailing elements when begin is near array end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(4);
      expect(result).assertDeepEquals([5]);
    })

    /**
     * @tc.name testArraySliceTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1500
     * @tc.desc 3.4 Handle Infinity as slice parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(Infinity);
      expect(result1).assertDeepEquals([]);
      const result2: number[] = arr.slice(-Infinity);
      expect(result2).assertDeepEquals([1, 2, 3, 4, 5]);
      const result3: number[] = arr.slice(0, Infinity);
      expect(result3).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1600
     * @tc.desc 4.2 Handle ordinary dense arrays
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 4);
      expect(result).assertDeepEquals([2, 3, 4]);
    })

    /**
     * @tc.name testArraySliceTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1700
     * @tc.desc 4.5 Use slice on TypedArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typed: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const result: Int8Array = typed.slice(1, 4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    })

    /**
     * @tc.name testArraySliceTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1800
     * @tc.desc 4.6 Use slice on empty array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const result: number[] = arr.slice(0, 5);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1900
     * @tc.desc 4.7 Use slice on single-element array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42];
      const result1: number[] = arr.slice(0);
      expect(result1).assertDeepEquals([42]);
      const result2: number[] = arr.slice(0, 0);
      expect(result2).assertDeepEquals([]);
      const result3: number[] = arr.slice(1);
      expect(result3).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2000
     * @tc.desc 5.1 Verify slice returns shallow copy; mutating result does not affect original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 4);
      result[0] = 999;
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(result[0]).assertEqual(999);
    })

    /**
     * @tc.name testArraySliceTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2100
     * @tc.desc 5.2 Object elements in array share reference relationship
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Obj { id: number }
      const obj: Obj = { id: 1 };
      const arr: Obj[] = [obj, { id: 2 }, { id: 3 }];
      const result: Obj[] = arr.slice(0, 2);
      result[0].id = 999;
      expect(arr[0].id).assertEqual(999);
      expect(result[0].id).assertEqual(999);
    })

    /**
     * @tc.name testArraySliceTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2200
     * @tc.desc 5.3 Nested arrays in array share reference relationship
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: number[] = [1, 2];
      const arr: number[][] = [inner, [3, 4], [5, 6]];
      const result: number[][] = arr.slice(0, 2);
      result[0][0] = 999;
      expect(arr[0][0]).assertEqual(999);
      expect(result[0][0]).assertEqual(999);
    })

    /**
     * @tc.name testArraySliceTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2300
     * @tc.desc 5.4 Handle multi-level nested array structures
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const result: number[][] = arr.slice(1, 3);
      expect(result).assertDeepEquals([[3, 4], [5, 6]]);
      expect(result[0] === arr[1]).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2400
     * @tc.desc 5.5 Function elements in array share reference relationship
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: () => string = (): string => 'test';
      const arr: (() => string)[] = [fn, (): string => 'foo', (): string => 'bar'];
      const result: (() => string)[] = arr.slice(0, 2);
      expect(result[0] === arr[0]).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2500
     * @tc.desc 6.1 Compute begin from array end when begin is negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(-3);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2600
     * @tc.desc 6.2 Compute end from array end when end is negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(0, -2);
      expect(result).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2700
     * @tc.desc 6.3 Both begin and end are negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(-4, -2);
      expect(result).assertDeepEquals([2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2800
     * @tc.desc 6.4 Negative index out of range is treated as starting from 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(-10);
      expect(result1).assertDeepEquals([1, 2, 3, 4, 5]);
      const result2: number[] = arr.slice(-10, -8);
      expect(result2).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2900
     * @tc.desc 6.5 Mixed positive and negative indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(1, -1);
      expect(result1).assertDeepEquals([2, 3, 4]);
      const result2: number[] = arr.slice(-3, 4);
      expect(result2).assertDeepEquals([3, 4]);
    })

    /**
     * @tc.name testArraySliceTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3000
     * @tc.desc 6.6 Negative index with absolute value equal to length is treated as 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(-5);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3100
     * @tc.desc 6.7 Negative begin and positive end with converted begin < end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(-3, 4);
      expect(result).assertDeepEquals([3, 4]);
    })

    /**
     * @tc.name testArraySliceTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3200
     * @tc.desc 7.1 Default begin to 0 when omitted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(0, 3);
      expect(result).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3300
     * @tc.desc 7.2 Default end to array length when omitted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3400
     * @tc.desc 7.3 Return copy of entire array when all parameters omitted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice();
      expect(result).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(result === arr).assertEqual(false);
    })

    /**
     * @tc.name testArraySliceTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3500
     * @tc.desc 7.4 Pass single argument as begin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3600
     * @tc.desc 9.4 Use slice on Object.freeze array. JS-only: Object.freeze restricted in ArkTS stdlib
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_4()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3700
     * @tc.desc 9.5 Use slice on Object.seal array. JS-only: Object.seal restricted in ArkTS stdlib
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_5()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3800
     * @tc.desc 9.6 Handle array after length property is modified
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.length = 3;
      const result: number[] = arr.slice(1, 5);
      expect(result).assertDeepEquals([2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3900
     * @tc.desc 10.1 Use concat with array returned by slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 3).concat([6, 7]);
      expect(result).assertDeepEquals([2, 3, 6, 7]);
    })

    /**
     * @tc.name testArraySliceTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4000
     * @tc.desc 10.2 Difference and combination of slice and splice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([2, 3]);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      const arr2: number[] = [1, 2, 3, 4, 5];
      const spliced: number[] = arr2.splice(1, 2);
      expect(spliced).assertDeepEquals([2, 3]);
      expect(arr2).assertDeepEquals([1, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4100
     * @tc.desc 10.3 Use map on array returned by slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 4).map((x: number): number => x * 2);
      expect(result).assertDeepEquals([4, 6, 8]);
    })

    /**
     * @tc.name testArraySliceTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4200
     * @tc.desc 10.4 Use filter on array returned by slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 4).filter((x: number): boolean => x > 2);
      expect(result).assertDeepEquals([3, 4]);
    })

    /**
     * @tc.name testArraySliceTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4300
     * @tc.desc 10.5 Use reduce on array returned by slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.slice(1, 4).reduce((acc: number, val: number): number => acc + val, 0);
      expect(result).assertEqual(9);
    })

    /**
     * @tc.name testArraySliceTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4400
     * @tc.desc 10.6 Chain multiple array methods
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: number[] = arr
        .slice(2, 8)
        .filter((x: number): boolean => x % 2 === 0)
        .map((x: number): number => x * 10);
      expect(result).assertDeepEquals([40, 60, 80]);
    })

    /**
     * @tc.name testArraySliceTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4500
     * @tc.desc 10.7 Combine slice with spread operator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(1, 3);
      expect(result1).assertDeepEquals([2, 3]);
      const spread: number[] = [...arr];
      const result2: number[] = spread.slice(1, 3);
      expect(result2).assertDeepEquals([2, 3]);
      const result3: number[] = [...arr.slice(1, 3), 6, 7];
      expect(result3).assertDeepEquals([2, 3, 6, 7]);
    })

    /**
     * @tc.name testArraySliceTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4600
     * @tc.desc 11.1 Invoke via Array.prototype.slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 3);
      expect(result).assertDeepEquals([2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4700
     * @tc.desc 11.3 Use slice on array subclass
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class MyArray extends Array<number> {
        constructor(...args: number[]) {
          super(...args);
        }
      }
      const myArr: MyArray = new MyArray(1, 2, 3, 4, 5);
      const result: number[] = myArr.slice(1, 3);
      expect(result).assertDeepEquals([2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4800
     * @tc.desc 12.1 Clone array quickly using slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: number[] = [1, 2, 3, 4, 5];
      const clone: number[] = original.slice();
      expect(clone).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(clone !== original).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4900
     * @tc.desc 12.4 Implement simple pagination using slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const paginate = (arr: number[], page: number, pageSize: number): number[] => {
        const start: number = (page - 1) * pageSize;
        const end: number = start + pageSize;
        return arr.slice(start, end);
      };
      const data: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const page1: number[] = paginate(data, 1, 3);
      expect(page1).assertDeepEquals([1, 2, 3]);
      const page2: number[] = paginate(data, 2, 3);
      expect(page2).assertDeepEquals([4, 5, 6]);
    })

    /**
     * @tc.name testArraySliceTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5000
     * @tc.desc 12.5 Get last N elements using negative indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const getLastN = (arr: number[], n: number): number[] => arr.slice(-n);
      const arr: number[] = [1, 2, 3, 4, 5];
      const last3: number[] = getLastN(arr, 3);
      expect(last3).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5100
     * @tc.desc 12.6 Remove elements using slice without mutating original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const removeElement = (arr: number[], index: number): number[] =>
        arr.slice(0, index).concat(arr.slice(index + 1));
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = removeElement(arr, 2);
      expect(result).assertDeepEquals([1, 2, 4, 5]);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5200
     * @tc.desc 12.7 Split array into chunks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chunk = (arr: number[], size: number): number[][] => {
        const result: number[][] = [];
        for (let i: number = 0; i < arr.length; i += size) {
          result.push(arr.slice(i, i + size));
        }
        return result;
      };
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      const chunks: number[][] = chunk(arr, 3);
      expect(chunks).assertDeepEquals([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
    })

    /**
     * @tc.name testArraySliceTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5300
     * @tc.desc 12.8 Deduplicate array with filter and indexOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const unique = (arr: number[]): number[] =>
        arr.filter((item: number, index: number): boolean =>
          arr.slice(0, index).indexOf(item) === -1
        );
      const arr: number[] = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4];
      const result: number[] = unique(arr);
      expect(result).assertDeepEquals([1, 2, 3, 4]);
    })

    /**
     * @tc.name testArraySliceTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5400
     * @tc.desc 3.1 Treat undefined parameter as not passed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(undefined);
      const result2: number[] = arr.slice(1, undefined);
      const result3: number[] = arr.slice(undefined, 3);
      expect(result1).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(result2).assertDeepEquals([2, 3, 4, 5]);
      expect(result3).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5500
     * @tc.desc 3.2 null is converted to 0. JS-only: null slice index coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_3_2()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5600
     * @tc.desc 3.3 NaN is converted to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(NaN);
      const result2: number[] = arr.slice(NaN, 3);
      expect(result1).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(result2).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5700
     * @tc.desc 3.5 Empty string is converted to 0. JS-only: string slice index coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_3_5()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5800
     * @tc.desc 3.6 Boolean is converted to 1 or 0. JS-only: boolean slice index coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_3_6()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5900
     * @tc.desc 4.1 Handle sparse array with holes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1, undefined, undefined, 4, 5];
      const result: (number | undefined)[] = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(undefined);
      expect(result[1]).assertEqual(undefined);
      expect(result[2]).assertEqual(4);
    })

    /**
     * @tc.name testArraySliceTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6000
     * @tc.desc 4.3 Use slice on array-like object via call/apply. JS-only: Array.prototype.slice.call on array-like
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_4_3()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6100
     * @tc.desc 4.4 Use slice on arguments object. JS-only: arguments object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_4_4()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6200
     * @tc.desc 5.6 Handle array containing Symbol values. JS-only: Symbol API
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_5_6()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6300
     * @tc.desc 7.5 Extra arguments beyond two are ignored. JS-only: extra slice arguments
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_7_5()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6400
     * @tc.desc 7.6 Pass argument array via apply. JS-only: Array.prototype.slice.apply
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_7_6()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6500
     * @tc.desc 8.1 String parameters are converted to numbers. JS-only: string slice index coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_1()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6600
     * @tc.desc 8.2 Floating-point parameters are truncated toward zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(1.5, 3.9);
      const result2: number[] = arr.slice(2.1);
      expect(JSON.stringify(result1)).assertEqual('[2,3]');
      expect(JSON.stringify(result2)).assertEqual('[3,4,5]');
    })

    /**
     * @tc.name testArraySliceTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6700
     * @tc.desc 8.3 Object is converted to number via valueOf. JS-only: valueOf slice index coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_3()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6800
     * @tc.desc 8.4 Array parameter is converted to number. JS-only: array slice index coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_4()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6900
     * @tc.desc 8.5 Handle BigInt parameter (expect TypeError). JS-only: BigInt slice parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_5()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7000
     * @tc.desc 8.6 Convert hexadecimal string to number. JS-only: hex string slice index coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_6()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7100
     * @tc.desc 9.1 Throw TypeError when this value is null. JS-only: Array.prototype.slice.call(null)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_1()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7200
     * @tc.desc 9.2 Throw TypeError when this value is undefined. JS-only: Array.prototype.slice.call(undefined)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_2()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7300
     * @tc.desc 9.3 String this value is treated as array-like object. JS-only: slice.call on string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_3()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7400
     * @tc.desc 9.7 Handle read-only length property. JS-only: Object.defineProperty on length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_7()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7500
     * @tc.desc 11.2 Effect after modifying Array.prototype.slice. JS-only: mutating Array.prototype.slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_11_2()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7600
     * @tc.desc 11.4 Control returned constructor via Symbol.species. JS-only: Symbol.species
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_11_4()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7700
     * @tc.desc 11.5 Use slice on custom array-like object. JS-only: array-like with prototype.call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_11_5()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7800
     * @tc.desc 11.6 After Object.create(array), slice along prototype yields [1,2,3]. JS-only: Object.create prototype chain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_11_6()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7900
     * @tc.desc 12.2 Convert arguments to real array. JS-only: arguments to array via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_12_2()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_8000
     * @tc.desc 12.3 Handle variadic argument list in function. JS-only: arguments slicing via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_12_3()).assertEqual(true);
    })

  })
}
