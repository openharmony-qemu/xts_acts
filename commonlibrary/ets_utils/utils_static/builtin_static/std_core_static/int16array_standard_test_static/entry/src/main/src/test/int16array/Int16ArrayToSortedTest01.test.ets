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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayToSortedTest01(): void {
  describe('Int16ArrayToSortedTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_0100
     * @tc.name testInt16ArrayToSortedTestOne001
     * @tc.desc Verify toSorted() on empty array returns an independent empty Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let sorted: Int16Array = arr.toSorted();
      let actualLength: int = sorted.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      expect(sorted).not().assertEqual(arr);
      expect(sorted.buffer).not().assertEqual(arr.buffer);
      let actualSourceLength: int = arr.length;
      let expectedSourceLength: int = 0;
      expect(actualSourceLength).assertEqual(expectedSourceLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_0200
     * @tc.name testInt16ArrayToSortedTestOne002
     * @tc.desc Verify toSorted() on single-element array returns same-value copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 42;
      let arr: Int16Array = Int16Array.of(val);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = 42;
      expect(elementAt0).assertEqual(expectedElement0);
      let actualLength: int = sorted.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_0300
     * @tc.name testInt16ArrayToSortedTestOne003
     * @tc.desc Verify toSorted() on ascending array with int16 bounds keeps order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 32767;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_0400
     * @tc.name testInt16ArrayToSortedTestOne004
     * @tc.desc Verify toSorted() on length-1 value -1 returns same element copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1;
      let arr: Int16Array = Int16Array.of(val);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -1;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_0500
     * @tc.name testInt16ArrayToSortedTestOne005
     * @tc.desc Verify toSorted() on length-1 int16.MIN returns -32768 copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -32768;
      let arr: Int16Array = Int16Array.of(val);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_0600
     * @tc.name testInt16ArrayToSortedTestOne006
     * @tc.desc Verify toSorted() on length-1 int16.MAX returns 32767 copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 32767;
      let arr: Int16Array = Int16Array.of(val);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_0700
     * @tc.name testInt16ArrayToSortedTestOne007
     * @tc.desc Verify toSorted() on length-2 [MIN, MAX] keeps ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 32767);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_0800
     * @tc.name testInt16ArrayToSortedTestOne008
     * @tc.desc Verify toSorted() on length-2 [MAX, MIN] swaps to ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, -32768);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_0900
     * @tc.name testInt16ArrayToSortedTestOne009
     * @tc.desc Verify toSorted() on length-6 negatives-and-zero random returns ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-5, -3, -1, -4, -2, 0);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -5;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = -4;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = -3;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sorted.$_get(3 as int);
      let expectedElement3: int = -2;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sorted.$_get(4 as int);
      let expectedElement4: int = -1;
      expect(elementAt4).assertEqual(expectedElement4);
      let elementAt5: number = sorted.$_get(5 as int);
      let expectedElement5: int = 0;
      expect(elementAt5).assertEqual(expectedElement5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_1000
     * @tc.name testInt16ArrayToSortedTestOne010
     * @tc.desc Verify toSorted() on length-100 reverse values has ascending endpoints and middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i as int, 100 - i);
      }
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt50: number = sorted.$_get(50 as int);
      let expectedElement50: int = 51;
      expect(elementAt50).assertEqual(expectedElement50);
      let elementAt99: number = sorted.$_get(99 as int);
      let expectedElement99: int = 100;
      expect(elementAt99).assertEqual(expectedElement99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_1100
     * @tc.name testInt16ArrayToSortedTestOne011
     * @tc.desc Verify toSorted() on ascending MIN/MAX/0 mix keeps order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, -1, 0, 1, 32767);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = -1;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sorted.$_get(3 as int);
      let expectedElement3: int = 1;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sorted.$_get(4 as int);
      let expectedElement4: int = 32767;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_1200
     * @tc.name testInt16ArrayToSortedTestOne012
     * @tc.desc Verify toSorted() on ascending all-negative values keeps order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-100, -50, -10, -5, -1);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -100;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = -50;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = -10;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sorted.$_get(3 as int);
      let expectedElement3: int = -5;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sorted.$_get(4 as int);
      let expectedElement4: int = -1;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_1300
     * @tc.name testInt16ArrayToSortedTestOne013
     * @tc.desc Verify toSorted() with duplicate MIN/MAX keeps duplicates adjacent after ascending sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 32767, 0, -32768, -32768);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sorted.$_get(3 as int);
      let expectedElement3: int = 32767;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sorted.$_get(4 as int);
      let expectedElement4: int = 32767;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_1400
     * @tc.name testInt16ArrayToSortedTestOne014
     * @tc.desc Verify toSorted() on all int16.MIN returns all -32768 copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, -32768, -32768, -32768, -32768);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = -32768;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sorted.$_get(3 as int);
      let expectedElement3: int = -32768;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sorted.$_get(4 as int);
      let expectedElement4: int = -32768;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_1500
     * @tc.name testInt16ArrayToSortedTestOne015
     * @tc.desc Verify toSorted() on ascending adjacent negatives/zero/positives keeps order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-3, -2, -1, 0, 1, 2, 3);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = -2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = -1;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sorted.$_get(3 as int);
      let expectedElement3: int = 0;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sorted.$_get(4 as int);
      let expectedElement4: int = 1;
      expect(elementAt4).assertEqual(expectedElement4);
      let elementAt5: number = sorted.$_get(5 as int);
      let expectedElement5: int = 2;
      expect(elementAt5).assertEqual(expectedElement5);
      let elementAt6: number = sorted.$_get(6 as int);
      let expectedElement6: int = 3;
      expect(elementAt6).assertEqual(expectedElement6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_1600
     * @tc.name testInt16ArrayToSortedTestOne016
     * @tc.desc Verify toSorted() on three distinct negatives returns ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, -32768, -100);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = -100;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = -1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_1700
     * @tc.name testInt16ArrayToSortedTestOne017
     * @tc.desc Verify toSorted() corrects single misplaced element position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 1, 3, 4, 5);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sorted.$_get(3 as int);
      let expectedElement3: int = 4;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sorted.$_get(4 as int);
      let expectedElement4: int = 5;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_1800
     * @tc.name testInt16ArrayToSortedTestOne018
     * @tc.desc Verify toSorted() on two concatenated sorted segments returns global ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(4, 5, 6, 1, 2, 3);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sorted.$_get(3 as int);
      let expectedElement3: int = 4;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sorted.$_get(4 as int);
      let expectedElement4: int = 5;
      expect(elementAt4).assertEqual(expectedElement4);
      let elementAt5: number = sorted.$_get(5 as int);
      let expectedElement5: int = 6;
      expect(elementAt5).assertEqual(expectedElement5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_1900
     * @tc.name testInt16ArrayToSortedTestOne019
     * @tc.desc Verify toSorted() on new Int16Array(array-literal) returns ascending copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 1, 2]);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_2000
     * @tc.name testInt16ArrayToSortedTestOne020
     * @tc.desc Verify toSorted() on Int16Array.from(number[]) returns ascending copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [3, 1, 2];
      let arr = Int16Array.from(src);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_2100
     * @tc.name testInt16ArrayToSortedTestOne021
     * @tc.desc Verify toSorted() on length-constructor plus $_set returns ascending copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.$_set(0, 3 as int);
      arr.$_set(1, 1 as int);
      arr.$_set(2, 2 as int);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_2200
     * @tc.name testInt16ArrayToSortedTestOne022
     * @tc.desc Verify toSorted() on ArrayBuffer view construction returns ascending copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let view = new Int16Array(buf);
      view.$_set(0, 3 as int);
      view.$_set(1, 1 as int);
      view.$_set(2, 2 as int);
      let sorted = view.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_2300
     * @tc.name testInt16ArrayToSortedTestOne023
     * @tc.desc Verify no-arg toSorted() overload returns Int16Array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 1, 2);
      let sorted: Int16Array = arr.toSorted();
      let actualLength: int = sorted.length;
      let expectedNotValue: int = arr.length;
      expect(actualLength).assertEqual(expectedNotValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_2400
     * @tc.name testInt16ArrayToSortedTestOne024
     * @tc.desc Verify calling toSorted() twice is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 1, 2);
      let sorted1 = arr.toSorted();
      let sorted2 = sorted1.toSorted();
      let elementAt0: number = sorted2.$_get(0 as int);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted2.$_get(1 as int);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted2.$_get(2 as int);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_2500
     * @tc.name testInt16ArrayToSortedTestOne025
     * @tc.desc Verify default toSorted() without compareFn uses numeric ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, -50, 0, 50, -100);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -100;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = -50;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sorted.$_get(3 as int);
      let expectedElement3: int = 50;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sorted.$_get(4 as int);
      let expectedElement4: int = 100;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_2600
     * @tc.name testInt16ArrayToSortedTestOne026
     * @tc.desc Verify toSorted() returns a different object reference than source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let sorted: Int16Array = arr.toSorted();
      expect(sorted).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_2700
     * @tc.name testInt16ArrayToSortedTestOne027
     * @tc.desc Verify toSorted() sorts random array containing boundary values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 32767, -32768, 100, -100);
      let sorted: Int16Array = arr.toSorted();
      let elementAt0: number = sorted.$_get(0 as int);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sorted.$_get(1 as int);
      let expectedElement1: int = -100;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sorted.$_get(2 as int);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sorted.$_get(3 as int);
      let expectedElement3: int = 100;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sorted.$_get(4 as int);
      let expectedElement4: int = 32767;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_2800
     * @tc.name testInt16ArrayToSortedTestOne028
     * @tc.desc Verify toSorted() sorts alternating highs and lows ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, -100, 200, -200, 0);
      let result: Int16Array = arr.toSorted();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = -200;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = -100;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = result.$_get(3);
      let expectedElement3: int = 100;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = result.$_get(4);
      let expectedElement4: int = 200;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_2900
     * @tc.name testInt16ArrayToSortedTestOne029
     * @tc.desc Verify toSorted() moves MAX from front to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 100, 50);
      let result: Int16Array = arr.toSorted();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = 50;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = 100;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = 32767;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_3000
     * @tc.name testInt16ArrayToSortedTestOne030
     * @tc.desc Verify toSorted() keeps MIN at front for all-negative array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, -100, -50);
      let result: Int16Array = arr.toSorted();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = -100;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = -50;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_3100
     * @tc.name testInt16ArrayToSortedTestOne031
     * @tc.desc Verify toSorted() sorts [0,-1,1] to [-1,0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, -1, 1);
      let result: Int16Array = arr.toSorted();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = -1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = 1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_ONE_3200
     * @tc.name testInt16ArrayToSortedTestOne032
     * @tc.desc Verify toSorted() result length equals 5 for 5-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 1, 2, 5, 4);
      let result: Int16Array = arr.toSorted();
      let actualLength: int = result.length;
      let expectedLength: int = 5;
      expect(actualLength).assertEqual(expectedLength);
    });
  });
}
