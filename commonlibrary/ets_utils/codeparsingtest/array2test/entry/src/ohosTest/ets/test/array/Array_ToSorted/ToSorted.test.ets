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


import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import Utils from '../../Util.test';
import * as ToSortedJs from './ToSorted';
import { arrayToSorted } from './ToSortedNative';

export default function ArrayToSortedMindMapTest() {
  describe('ArrayToSortedMindMapTest', () => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name   testToSortedTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0100
     * @tc.desc   Verify array toSorted scenario 0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: string[] = ['Mar', 'Jan', 'Feb', 'Dec'];
      const b: string[] = arrayToSorted(a);
      expect(b.join(',')).assertEqual('Dec,Feb,Jan,Mar');
    });

    /**
     * @tc.name   testToSortedTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0200
     * @tc.desc   Verify array toSorted scenario 0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 10, 21, 2];
      const b: number[] = arrayToSorted(a, (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('1,2,10,21');
    });

    /**
     * @tc.name   testToSortedTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0300
     * @tc.desc   Verify array toSorted scenario 0102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 10, 21, 2];
      const b: number[] = arrayToSorted(a);
      expect(b.join(',')).assertEqual('1,10,2,21');
    });

    /**
     * @tc.name   testToSortedTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0400
     * @tc.desc   Verify array toSorted scenario 0103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: boolean[] = [true, false, true, false];
      const b: boolean[] = arrayToSorted(a);
      expect(b.join(',')).assertEqual('false,false,true,true');
    });

    /**
     * @tc.name   testToSortedTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0500
     * @tc.desc   Verify array toSorted scenario 0104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [5, 5, 5, 5];
      const b: number[] = arrayToSorted(a);
      expect(b.join(',')).assertEqual('5,5,5,5');
    });

    /**
     * @tc.name   testToSortedTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0600
     * @tc.desc   Verify array toSorted scenario 0105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3, 4, 5];
      const b: number[] = arrayToSorted(a, (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.name   testToSortedTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0700
     * @tc.desc   Verify array toSorted scenario 0106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [5, 4, 3, 2, 1];
      const b: number[] = arrayToSorted(a, (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.name   testToSortedTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0800
     * @tc.desc   Verify array toSorted scenario 0107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [3, 1, 2, 3, 1];
      const b: number[] = arrayToSorted(a, (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('1,1,2,3,3');
    });

    /**
     * @tc.name   testToSortedTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0900
     * @tc.desc   Verify array toSorted scenario 0108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [3, 1, 2];
      const pairs: number[][] = [];
      arrayToSorted(a, (x: number, y: number): number => {
        pairs.push([x, y]);
        return 0;
      });
      expect(pairs.length >= 2).assertEqual(true);
      expect(arrayToSorted(a, (x: number, y: number): number => 0).join(',')).assertEqual('3,1,2');
    });

    /**
     * @tc.name   testToSortedTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1000
     * @tc.desc   Verify array toSorted scenario 0109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [3, 1, 2];
      const b: number[] = arrayToSorted(a, (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToSortedTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1100
     * @tc.desc   Verify array toSorted scenario 0110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const b: number[] = arrayToSorted(a, (a: number, b: number): number => b - a);
      expect(b.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToSortedTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1200
     * @tc.desc   Verify array toSorted scenario 0111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [3, 1, 2];
      const b: number[] = arrayToSorted(a, (x: number, y: number): number => 0);
      expect(b.join(',')).assertEqual('3,1,2');
    });

    /**
     * @tc.name   testToSortedTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1300
     * @tc.desc   Verify array toSorted scenario 0112
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [3.5, 1.2, 2.8];
      const b: number[] = arrayToSorted(a, (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('1.2,2.8,3.5');
    });

    /**
     * @tc.name   testToSortedTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1400
     * @tc.desc   Verify array toSorted scenario 0113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [3, 1, 2];
      const b: number[] = arrayToSorted(a, (x: number, y: number): number => Number.NaN);
      expect(b.length).assertEqual(3);
      const j: string = b.join(',');
      expect(j === '1,2,3' || j === '3,1,2').assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1500
     * @tc.desc   Verify array toSorted scenario 0114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const b: number[] = arrayToSorted(a, (x: number, y: number): number => (x === 1 ? -Infinity : Infinity));
      expect(b.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToSortedTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1600
     * @tc.desc   Verify array toSorted scenario 0115
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      let threw: boolean = false;
      try {
        arrayToSorted(a, (x: number, y: number): number => { throw new Error('compare error'); });
      } catch (e) {
        threw = (e as Error).message === 'compare error';
      }
      expect(threw).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1700
     * @tc.desc   Verify array toSorted scenario 0116. JS-only: invalid compareFn type string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0116()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1800
     * @tc.desc   Verify array toSorted scenario 0117. JS-only: invalid compareFn type number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0117()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1900
     * @tc.desc   Verify array toSorted scenario 0118. JS-only: invalid compareFn null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0118()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2000
     * @tc.desc   Verify array toSorted scenario 0119. JS-only: invalid compareFn object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0119()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2100
     * @tc.desc   Verify array toSorted scenario 0120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [10, 1, 21, 2];
      const b: number[] = arrayToSorted(a);
      expect(b.join(',')).assertEqual('1,10,2,21');
    });

    /**
     * @tc.name   testToSortedTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2200
     * @tc.desc   Verify array toSorted scenario 0121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [3, 1, 4, 1, 5];
      const b: number[] = arrayToSorted(a, (x: number, y: number): number => x - 3);
      expect(b.length).assertEqual(5);
      expect(b.join(',').split(',').length).assertEqual(5);
    });

    /**
     * @tc.name   testToSortedTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2300
     * @tc.desc   Verify array toSorted scenario 0122
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 1, 2];
      const snap: string = arr.join(',');
      arrayToSorted(arr, (a: number, b: number): number => a - b);
      expect(arr.join(',')).assertEqual(snap);
    });

    /**
     * @tc.name   testToSortedTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2400
     * @tc.desc   Verify array toSorted scenario 0123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 1, 2];
      const r: number[] = arrayToSorted(arr);
      expect(r !== arr).assertEqual(true);
      expect(r.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToSortedTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2500
     * @tc.desc   Verify array toSorted scenario 0124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 1, 2];
      const snap: number[] = [...arr];
      arrayToSorted(arr);
      expect(arr.join(',')).assertEqual(snap.join(','));
    });

    /**
     * @tc.name   testToSortedTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2600
     * @tc.desc   Verify array toSorted scenario 0125
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 1, 2, 5, 4];
      const r: number[] = arrayToSorted(arr);
      expect(r.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.name   testToSortedTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2700
     * @tc.desc   Verify array toSorted scenario 0126
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 1, 2, 3];
      const r: number[] = arrayToSorted(arr, (a: number, b: number): number => a - b);
      expect(r.join(',')).assertEqual('1,2,3,3');
    });

    /**
     * @tc.name   testToSortedTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2800
     * @tc.desc   Verify array toSorted scenario 0127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const r: number[] = arrayToSorted(arr);
      expect(r !== arr).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2900
     * @tc.desc   Verify array toSorted scenario 0128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSorted([3, 1, 2]);
      expect(Array.isArray(r)).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3000
     * @tc.desc   Verify array toSorted scenario 0129. JS-only: object reference identity after sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0129()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3100
     * @tc.desc   Verify array toSorted scenario 0130. JS-only: Object.freeze before toSorted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0130()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3200
     * @tc.desc   Verify array toSorted scenario 0131. JS-only: Object.seal before toSorted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0131()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3300
     * @tc.desc   Verify array toSorted scenario 0132
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: number[] = arrayToSorted([10, 5, 8, 1, 7], (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('1,5,7,8,10');
    });

    /**
     * @tc.name   testToSortedTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3400
     * @tc.desc   Verify array toSorted scenario 0133
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: number[] = arrayToSorted([1, 5, 3, 2, 4], (a: number, b: number): number => b - a);
      expect(b.join(',')).assertEqual('5,4,3,2,1');
    });

    /**
     * @tc.name   testToSortedTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3500
     * @tc.desc   Verify array toSorted scenario 0134
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: number[] = arrayToSorted([3.14, 1.41, 2.72, 0.58], (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('0.58,1.41,2.72,3.14');
    });

    /**
     * @tc.name   testToSortedTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3600
     * @tc.desc   Verify array toSorted scenario 0135
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: number[] = arrayToSorted([3, -1, 0, -5, 2], (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('-5,-1,0,2,3');
    });

    /**
     * @tc.name   testToSortedTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3700
     * @tc.desc   Verify array toSorted scenario 0136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: number[] = arrayToSorted([Infinity, 1, -Infinity, 0], (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('-Infinity,0,1,Infinity');
    });

    /**
     * @tc.name   testToSortedTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3800
     * @tc.desc   Verify array toSorted scenario 0137
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSorted([3, Number.NaN, 1, Number.NaN, 2], (a: number, b: number): number => a - b);
      const nums: number[] = r.filter((x: number): boolean => !Number.isNaN(x));
      nums.sort((a: number, b: number): number => a - b);
      expect(r.length).assertEqual(5);
      expect(r.some((x: number): boolean => Number.isNaN(x))).assertEqual(true);
      expect(nums.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToSortedTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3900
     * @tc.desc   Verify array toSorted scenario 0138
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: string[] = arrayToSorted(['banana', 'apple', 'cherry']);
      expect(b.join(',')).assertEqual('apple,banana,cherry');
    });

    /**
     * @tc.name   testToSortedTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4000
     * @tc.desc   Verify array toSorted scenario 0139
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: string[] = arrayToSorted(['banana', 'Apple', 'cherry']);
      expect(b.join(',')).assertEqual('Apple,banana,cherry');
    });

    /**
     * @tc.name   testToSortedTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4100
     * @tc.desc   Verify array toSorted scenario 0140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: string[] = arrayToSorted(['b', '', 'a', 'c']);
      expect(b.join(',')).assertEqual(',a,b,c');
    });

    /**
     * @tc.name   testToSortedTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4200
     * @tc.desc   Verify array toSorted scenario 0141
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: string[] = arrayToSorted(['张三', '李四', '王五']);
      expect(b.length).assertEqual(3);
      expect(b.join(',')).assertEqual('张三,李四,王五');
    });

    /**
     * @tc.name   testToSortedTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4300
     * @tc.desc   Verify array toSorted scenario 0142
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Person { name: string = ''; age: number = 0; }
      const arr: Person[] = [new Person(), new Person(), new Person()];
      arr[0].name = 'C'; arr[0].age = 30;
      arr[1].name = 'A'; arr[1].age = 20;
      arr[2].name = 'B'; arr[2].age = 25;
      const r: Person[] = arrayToSorted(arr, (a: Person, b: Person): number => a.age - b.age);
      expect(r[0].age).assertEqual(20);
      expect(r[2].age).assertEqual(30);
    });

    /**
     * @tc.name   testToSortedTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4400
     * @tc.desc   Verify array toSorted scenario 0143
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: (number | null)[] = arrayToSorted([3, null, 1, null, 2]);
      expect(r.length).assertEqual(5);
      expect(r.includes(null)).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4500
     * @tc.desc   Verify array toSorted scenario 0144
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: (number | undefined)[] = arrayToSorted([3, undefined, 1, undefined, 2]);
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.name   testToSortedTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4600
     * @tc.desc   Verify array toSorted scenario 0145
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: (number | null | undefined)[] = arrayToSorted([null, undefined, 1, null]);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.name   testToSortedTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4700
     * @tc.desc   Verify array toSorted scenario 0146
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: (number | string)[] = arrayToSorted([10, '2', 1, '10']);
      expect(b.join(',')).assertEqual('1,10,10,2');
    });

    /**
     * @tc.name   testToSortedTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4800
     * @tc.desc   Verify array toSorted scenario 0147
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: (number | string | boolean | null | undefined)[] =
        arrayToSorted([1, 'b', true, null, undefined, false, 'a']);
      expect(r.length).assertEqual(7);
    });

    /**
     * @tc.name   testToSortedTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4900
     * @tc.desc   Verify array toSorted scenario 0148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2023, 0, 1);
      const d2: Date = new Date(2021, 0, 1);
      const d3: Date = new Date(2022, 0, 1);
      const r: Date[] = arrayToSorted([d1, d2, d3], (a: Date, b: Date): number => a.getTime() - b.getTime());
      expect(r[0].getTime()).assertEqual(d2.getTime());
      expect(r[2].getTime()).assertEqual(d1.getTime());
    });

    /**
     * @tc.name   testToSortedTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5000
     * @tc.desc   Verify array toSorted scenario 0149
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: number[] = arrayToSorted([]);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.name   testToSortedTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5100
     * @tc.desc   Verify array toSorted scenario 0150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42];
      const r: number[] = arrayToSorted(arr);
      expect(r[0]).assertEqual(42);
      expect(r !== arr).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5200
     * @tc.desc   Verify array toSorted scenario 0151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: number[] = arrayToSorted([2, 1], (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.name   testToSortedTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5300
     * @tc.desc   Verify array toSorted scenario 0152
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | undefined)[] = ['a', 'c', , 'b'];
      const r: (string | undefined)[] = arrayToSorted(arr);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual('a');
      expect(r[1]).assertEqual('b');
      expect(r[2]).assertEqual('c');
    });

    /**
     * @tc.name   testToSortedTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5400
     * @tc.desc   Verify array toSorted scenario 0153
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | undefined)[] = [, , 'b', 'a'];
      const r: (string | undefined)[] = arrayToSorted(arr);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual('a');
      expect(r[1]).assertEqual('b');
    });

    /**
     * @tc.name   testToSortedTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5500
     * @tc.desc   Verify array toSorted scenario 0154
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | undefined)[] = ['b', 'a', ,];
      const r: (string | undefined)[] = arrayToSorted(arr);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual('a');
      expect(r[1]).assertEqual('b');
    });

    /**
     * @tc.name   testToSortedTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5600
     * @tc.desc   Verify array toSorted scenario 0155
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array<number>(3);
      const r: number[] = arrayToSorted(arr);
      expect(r.length).assertEqual(3);
      expect(r.every((v: number): boolean => v === undefined)).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5700
     * @tc.desc   Verify array toSorted scenario 0156
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | undefined)[] = [, undefined, 'a', 'b'];
      const r: (string | undefined)[] = arrayToSorted(arr);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual('a');
      expect(r[1]).assertEqual('b');
    });

    /**
     * @tc.name   testToSortedTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5800
     * @tc.desc   Verify array toSorted scenario 0157
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [3, , 1, , 2];
      const r: (number | undefined)[] = arrayToSorted<number | undefined>(arr,
        (x: number | undefined, y: number | undefined): number => 0);
      const defined: number[] = [];
      for (let i: number = 0; i < r.length; i++) {
        if (r[i] !== undefined) {
          defined.push(r[i] as number);
        }
      }
      expect(defined.join(',')).assertEqual('3,1,2');
    });

    /**
     * @tc.name   testToSortedTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5900
     * @tc.desc   Verify array toSorted scenario 0158
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSorted([3, Number.NaN, 1, 2], (a: number, b: number): number => a - b);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.name   testToSortedTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6000
     * @tc.desc   Verify array toSorted scenario 0159
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSorted([+0, -0, 1, -1], (a: number, b: number): number => a - b);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(-1);
      expect(r[3]).assertEqual(1);
    });

    /**
     * @tc.name   testToSortedTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6100
     * @tc.desc   Verify array toSorted scenario 0160. JS-only: Symbol elements cannot be sorted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0160()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6200
     * @tc.desc   Verify array toSorted scenario 0161
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn1 = (): void => {};
      const fn2 = (): void => {};
      const r: (() => void)[] = arrayToSorted([fn2, fn1]);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.name   testToSortedTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6300
     * @tc.desc   Verify array toSorted scenario 0162
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: number = 0; i < 500; i++) {
        arr.push(499 - i);
      }
      const r: number[] = arrayToSorted(arr, (a: number, b: number): number => a - b);
      expect(r[0]).assertEqual(0);
      expect(r[499]).assertEqual(499);
      for (let i: number = 1; i < r.length; i++) {
        expect(r[i] >= r[i - 1]).assertEqual(true);
      }
    });

    /**
     * @tc.name   testToSortedTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6400
     * @tc.desc   Verify array toSorted scenario 0163
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [3, 1];
      const b: number[] = [1, 2];
      const c: number[] = [2, 3];
      const r: number[][] = arrayToSorted<number[]>([a, b, c]);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.name   testToSortedTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6500
     * @tc.desc   Verify array toSorted scenario 0164. JS-only: Array.prototype index pollution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0164()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6600
     * @tc.desc   Verify array toSorted scenario 0165. JS-only: arrayLike object receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0165()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6700
     * @tc.desc   Verify array toSorted scenario 0166. JS-only: sparse arrayLike receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0166()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6800
     * @tc.desc   Verify array toSorted scenario 0167. JS-only: arrayLike zero length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0167()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6900
     * @tc.desc   Verify array toSorted scenario 0168. JS-only: arrayLike negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0168()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7000
     * @tc.desc   Verify array toSorted scenario 0169. JS-only: arrayLike fractional length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0169()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7100
     * @tc.desc   Verify array toSorted scenario 0170. JS-only: arrayLike NaN length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0170()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7200
     * @tc.desc   Verify array toSorted scenario 0171. JS-only: arrayLike Infinity length throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0171()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7300
     * @tc.desc   Verify array toSorted scenario 0172. JS-only: object without length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0172()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7400
     * @tc.desc   Verify array toSorted scenario 0173. JS-only: arrayLike with extra properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0173()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7500
     * @tc.desc   Verify array toSorted scenario 0174. JS-only: string primitive as toSorted receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0174()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7600
     * @tc.desc   Verify array toSorted scenario 0175. JS-only: arguments object receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0175()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7700
     * @tc.desc   Verify array toSorted scenario 0176. JS-only: arrayLike numeric object receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0176()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7800
     * @tc.desc   Verify array toSorted scenario 0177. JS-only: Array.prototype.toSorted.bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0177()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7900
     * @tc.desc   Verify array toSorted scenario 0178. JS-only: Int32Array typed array receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0178()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8000
     * @tc.desc   Verify array toSorted scenario 0179
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: number[] = arrayToSorted([3, 1, 2], (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToSortedTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8100
     * @tc.desc   Verify array toSorted scenario 0180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: boolean = false;
      try {
        arrayToSorted([1, 2, 3], true as Object as (a: number, b: number) => number);
      } catch (e) {
        ok = e instanceof TypeError;
      }
      expect(ok).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8200
     * @tc.desc   Verify array toSorted scenario 0181
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: boolean = false;
      try {
        arrayToSorted([1, 2, 3], 0 as Object as (a: number, b: number) => number);
      } catch (e) {
        ok = e instanceof TypeError;
      }
      expect(ok).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8300
     * @tc.desc   Verify array toSorted scenario 0182
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: boolean = false;
      try {
        arrayToSorted([1, 2, 3], [] as Object as (a: number, b: number) => number);
      } catch (e) {
        ok = e instanceof TypeError;
      }
      expect(ok).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8400
     * @tc.desc   Verify array toSorted scenario 0183
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: number[] = arrayToSorted([3, 1, 2], (a: number, b: number): number => a - b);
      expect(b.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToSortedTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8500
     * @tc.desc   Verify array toSorted scenario 0184. JS-only: comparatorWithBase.bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0184()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8600
     * @tc.desc   Verify array toSorted scenario 0185. JS-only: null receiver TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0185()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8700
     * @tc.desc   Verify array toSorted scenario 0186. JS-only: undefined receiver TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0186()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8800
     * @tc.desc   Verify array toSorted scenario 0187. JS-only: number primitive receiver empty result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0187()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8900
     * @tc.desc   Verify array toSorted scenario 0188. JS-only: boolean primitive receiver empty result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0188()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9000
     * @tc.desc   Verify array toSorted scenario 0189. JS-only: arrayLike MAX_SAFE_INTEGER length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0189()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9100
     * @tc.desc   Verify array toSorted scenario 0190. JS-only: arrayLike invalid length string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0190()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9200
     * @tc.desc   Verify array toSorted scenario 0191. JS-only: Array length exceeds 2^32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0191()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9300
     * @tc.desc   Verify array toSorted scenario 0192. JS-only: arrayLike object with length getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0192()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9400
     * @tc.desc   Verify array toSorted scenario 0193. JS-only: arrayLike length getter throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0193()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9500
     * @tc.desc   Verify array toSorted scenario 0194. JS-only: arrayLike element getter throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0194()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9600
     * @tc.desc   Verify array toSorted scenario 0195
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [3, 1, 4, 1, 5, 9];
      const arr2: number[] = [...arr1];
      const sorted1: number[] = arrayToSorted(arr1, (a: number, b: number): number => a - b);
      arr2.sort((a: number, b: number): number => a - b);
      expect(sorted1).assertDeepEquals(arr2);
    });

    /**
     * @tc.name   testToSortedTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9700
     * @tc.desc   Verify array toSorted scenario 0196
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [3, 1, 2];
      const r1: number[] = arrayToSorted(arr1);
      const sorted: number[] = [3, 1, 2].slice();
      sorted.sort();
      expect(arr1.join(',')).assertEqual('3,1,2');
      expect(r1.join(',')).assertEqual(sorted.join(','));
    });

    /**
     * @tc.name   testToSortedTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9800
     * @tc.desc   Verify array toSorted scenario 0197. JS-only: chain toReversed after toSorted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0197()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9900
     * @tc.desc   Verify array toSorted scenario 0198. JS-only: chain toSpliced after toSorted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0198()).assertEqual(true);
    });

    /**
     * @tc.name   testToSortedTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0199
     * @tc.desc   Verify array toSorted scenario 0199. JS-only: chain with after toSorted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0199()).assertEqual(true);
    });

  });
}
