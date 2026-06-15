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
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';
import { CustomIntArrayLike } from './CustomArrayLike';

enum ArrayLikeIterStatusEnum {
  SUCCESS = 0,
  FAIL = 1
}

enum ArrayLikeIterStringEnum {
  ON = "ON",
  OFF = "OFF"
}

enum ArrayLikeIterScoreEnum: double {
  LOW = 1.0,
  HIGH = 99.99
}


export default function ArrayLikeIteratorTest(): void {
  describe('ArrayLikeIteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0010
     * @tc.name testArrayLikeIterator001
     * @tc.desc Verify $_iterator() returns usable iterator that yields first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      const first = iter.next();
      expect(first.done).assertEqual(false);
      expect(first.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0020
     * @tc.name testArrayLikeIterator002
     * @tc.desc Verify for...of and $_iterator yield undefined for middle undefined slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | undefined>();
      arr.push(1);
      arr.push(undefined);
      arr.push(3);
      const list: ArrayLike<int | undefined> = arr;
      const fromForOf: (int | undefined)[] = [];
      for (const item of list) {
        fromForOf.push(item);
      }
      expect(fromForOf.length).assertEqual(3);
      expect(fromForOf[0]).assertEqual(1);
      expect(fromForOf[1]).assertUndefined();
      expect(fromForOf[2]).assertEqual(3);
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(1);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(3);
      step = iter.next();
      expect(step.done).assertEqual(true);
      expect(step.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0030
     * @tc.name testArrayLikeIterator003
     * @tc.desc Verify for...of iterates all ArrayLike elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3);
      const list: ArrayLike<int> = values;
      const result: int[] = [];
      for (const item of list) {
        result.push(item);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0040
     * @tc.name testArrayLikeIterator004
     * @tc.desc Verify iterator next() returns object with value and done properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(100, 200);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      const first = iter.next();
      expect(first.done).assertEqual(false);
      expect(first.value).assertEqual(100);
      const second = iter.next();
      expect(second.done).assertEqual(false);
      expect(second.value).assertEqual(200);
      const third = iter.next();
      expect(third.done).assertEqual(true);
      expect(third.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0050
     * @tc.name testArrayLikeIterator005
     * @tc.desc Verify iterator traverses elements in ascending index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(5, 4, 3, 2, 1);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(5);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(4);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(3);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(2);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(1);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0060
     * @tc.name testArrayLikeIterator006
     * @tc.desc Verify iterator values match $_get(index) results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(10, 20, 30);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      for (let i = 0; i < list.length; i++) {
        const result = iter.next();
        expect(result.done).assertEqual(false);
        expect(result.value).assertEqual(list.$_get(i));
      }
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0070
     * @tc.name testArrayLikeIterator007
     * @tc.desc Verify empty ArrayLike iterator returns done=true on first next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>();
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      const result = iter.next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0080
     * @tc.name testArrayLikeIterator008
     * @tc.desc Verify single-element ArrayLike iterator behavior on first and second next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(42);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      const first = iter.next();
      expect(first.done).assertEqual(false);
      expect(first.value).assertEqual(42);
      const second = iter.next();
      expect(second.done).assertEqual(true);
      expect(second.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0090
     * @tc.name testArrayLikeIterator009
     * @tc.desc Verify subsequent next() calls return done=true and value=undefined after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      const first = iter.next();
      expect(first.done).assertEqual(false);
      expect(first.value).assertEqual(1);
      const second = iter.next();
      expect(second.done).assertEqual(false);
      expect(second.value).assertEqual(2);
      const afterEnd1 = iter.next();
      expect(afterEnd1.done).assertEqual(true);
      expect(afterEnd1.value).assertEqual(undefined);
      const afterEnd2 = iter.next();
      expect(afterEnd2.done).assertEqual(true);
      expect(afterEnd2.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0100
     * @tc.name testArrayLikeIterator010
     * @tc.desc Verify multiple $_iterator() calls return independent iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3);
      const list: ArrayLike<int> = values;
      const iter1 = list.$_iterator();
      const iter2 = list.$_iterator();
      let step1 = iter1.next();
      expect(step1.done).assertEqual(false);
      expect(step1.value).assertEqual(1);
      let step2 = iter2.next();
      expect(step2.done).assertEqual(false);
      expect(step2.value).assertEqual(1);
      step1 = iter1.next();
      expect(step1.done).assertEqual(false);
      expect(step1.value).assertEqual(2);
      step2 = iter2.next();
      expect(step2.done).assertEqual(false);
      expect(step2.value).assertEqual(2);
      step1 = iter1.next();
      expect(step1.done).assertEqual(false);
      expect(step1.value).assertEqual(3);
      step2 = iter2.next();
      expect(step2.done).assertEqual(false);
      expect(step2.value).assertEqual(3);
      step1 = iter1.next();
      expect(step1.done).assertEqual(true);
      expect(step1.value).assertEqual(undefined);
      step2 = iter2.next();
      expect(step2.done).assertEqual(true);
      expect(step2.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0110
     * @tc.name testArrayLikeIterator011
     * @tc.desc Verify $_iterator() return type is IterableIterator<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2);
      const list: ArrayLike<int> = values;
      const iter: IterableIterator<int> = list.$_iterator();
      const first = iter.next();
      expect(first.done).assertEqual(false);
      expect(first.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0120
     * @tc.name testArrayLikeIterator012
     * @tc.desc Verify ArrayLike<int> iterator returns int elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(100, 200, 300);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      for (let i = 0; i < list.length; i++) {
        const result = iter.next();
        expect(result.done).assertEqual(false);
        expect(result.value).assertEqual(list.$_get(i));
      }
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0130
     * @tc.name testArrayLikeIterator013
     * @tc.desc Verify ArrayLike<string> iterator returns string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("hello", "world");
      const list: ArrayLike<string> = values;
      const iter = list.$_iterator();
      for (let i = 0; i < list.length; i++) {
        const result = iter.next();
        expect(result.done).assertEqual(false);
        expect(result.value).assertEqual(list.$_get(i));
      }
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0140
     * @tc.name testArrayLikeIterator014
     * @tc.desc Verify ArrayLike<double> iterator returns Number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<double>(1.0, 2.0);
      const list: ArrayLike<double> = values;
      const iter = list.$_iterator();
      for (let i = 0; i < list.length; i++) {
        const result = iter.next();
        expect(result.done).assertEqual(false);
        expect(result.value).assertEqual(list.$_get(i));
      }
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0150
     * @tc.name testArrayLikeIterator015
     * @tc.desc Verify ArrayLike<Object> iterator returns Object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new Object();
      const obj2 = new Object();
      const values = new Array<Object>(obj1, obj2);
      const list: ArrayLike<Object> = values;
      const iter = list.$_iterator();
      for (let i = 0; i < list.length; i++) {
        const result = iter.next();
        expect(result.done).assertEqual(false);
        expect(result.value).assertEqual(list.$_get(i));
      }
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0160
     * @tc.name testArrayLikeIterator016
     * @tc.desc Verify iteration over large ArrayLike with 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const targetLen = 100;
      const values = new Array<int>();
      for (let i = 0; i < targetLen; i++) {
        values.push(i);
      }
      const list: ArrayLike<int> = values;
      let count = 0;
      for (const item of list) {
        expect(item).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(targetLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0170
     * @tc.name testArrayLikeIterator017
     * @tc.desc Verify iteration over ArrayLike with boundary int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(0, -1, 2147483647, -2147483648);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(0);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(-1);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(2147483647);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(-2147483648);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0180
     * @tc.name testArrayLikeIterator018
     * @tc.desc Verify iteration over ArrayLike with special string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("", " ", "\t", "hello");
      const list: ArrayLike<string> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(" ");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("\t");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("hello");
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0190
     * @tc.name testArrayLikeIterator019
     * @tc.desc Verify for...of over empty ArrayLike does not execute loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>();
      const list: ArrayLike<int> = values;
      let count = 0;
      for (const item of list) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0200
     * @tc.name testArrayLikeIterator020
     * @tc.desc Verify next() always returns done=true after iterator exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      const first = iter.next();
      expect(first.done).assertEqual(false);
      expect(first.value).assertEqual(1);
      const end1 = iter.next();
      expect(end1.done).assertEqual(true);
      expect(end1.value).assertEqual(undefined);
      const end2 = iter.next();
      expect(end2.done).assertEqual(true);
      expect(end2.value).assertEqual(undefined);
      const end3 = iter.next();
      expect(end3.done).assertEqual(true);
      expect(end3.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0210
     * @tc.name testArrayLikeIterator021
     * @tc.desc Verify full iterator traversal returns all elements then done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(1);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(2);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(3);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0220
     * @tc.name testArrayLikeIterator022
     * @tc.desc Verify $_iterator() returns iterator that traverses all elements via next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      let index = 0;
      let result = iter.next();
      while (!result.done) {
        expect(result.value).assertEqual(list.$_get(index));
        index++;
        result = iter.next();
      }
      expect(index).assertEqual(list.length);
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0230
     * @tc.name testArrayLikeIterator023
     * @tc.desc Verify spread operator converts ArrayLike to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(10, 20, 30);
      const list: ArrayLike<int> = values;
      const arr = [...list];
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0240
     * @tc.name testArrayLikeIterator024
     * @tc.desc Verify spread ArrayLike copy preserves element order in Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(100, 200, 300);
      const list: ArrayLike<int> = values;
      const arr: Array<int> = [...list];
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0250
     * @tc.name testArrayLikeIterator025
     * @tc.desc Verify two iterators from same ArrayLike traverse independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3, 4, 5);
      const list: ArrayLike<int> = values;
      const iter1 = list.$_iterator();
      const iter2 = list.$_iterator();
      iter1.next();
      iter1.next();
      // iter2 still starts from the first element
      expect(iter2.next().value).assertEqual(1);
      // iter1 continues to the third element
      expect(iter1.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0260
     * @tc.name testArrayLikeIterator026
     * @tc.desc Verify iterator starts traversal from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(5, 10, 15, 20);
      const list: ArrayLike<int> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(list.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0270
     * @tc.name testArrayLikeIterator027
     * @tc.desc Verify iterator traverses in index order until length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("a", "b", "c", "d");
      const list: ArrayLike<string> = values;
      let index = 0;
      for (const item of list) {
        expect(item).assertEqual(list.$_get(index));
        index++;
      }
      expect(index).assertEqual(list.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0280
     * @tc.name testArrayLikeIterator028
     * @tc.desc Verify ArrayLike is assignable to Iterable<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3);
      const list: ArrayLike<int> = values;
      const iterable: Iterable<int> = list;
      let count = 0;
      for (const item of iterable) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0290
     * @tc.name testArrayLikeIterator029
     * @tc.desc Verify iterator yields Unicode and emoji string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("\u4e2d\u6587", "\uD83D\uDE00", "テスト");
      const list: ArrayLike<string> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("\u4e2d\u6587");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("\uD83D\uDE00");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("テスト");
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0300
     * @tc.name testArrayLikeIterator030
     * @tc.desc Verify iterator over ArrayLike<boolean> yields true and false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<boolean>(true, false);
      const list: ArrayLike<boolean> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(true);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(false);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0310
     * @tc.name testArrayLikeIterator031
     * @tc.desc Verify iterator over Uint8Array yields Number elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3);
      bytes[0] = 0;
      bytes[1] = 127;
      bytes[2] = 255;
      const list: ArrayLike<double> = bytes;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(0);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(127);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(255);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0320
     * @tc.name testArrayLikeIterator032
     * @tc.desc Verify iterator over Float64Array yields NaN and Infinity elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(3);
      f64[0] = Double.NaN;
      f64[1] = Double.POSITIVE_INFINITY;
      f64[2] = Double.NEGATIVE_INFINITY;
      const list: ArrayLike<double> = f64;
      const iter = list.$_iterator();
      const firstStep = iter.next();
      expect(firstStep.done).assertEqual(false);
      expect(isNaN(firstStep.value as double)).assertTrue();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(Double.POSITIVE_INFINITY);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(Double.NEGATIVE_INFINITY);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0330
     * @tc.name testArrayLikeIterator033
     * @tc.desc Verify for...of over Int32Array yields all integer elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(3);
      i32[0] = 100000;
      i32[1] = -99999;
      i32[2] = 0;
      const list: ArrayLike<double> = i32;
      const result: double[] = [];
      for (const item of list) {
        result.push(item);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(100000);
      expect(result[1]).assertEqual(-99999);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0340
     * @tc.name testArrayLikeIterator034
     * @tc.desc Verify iterator over ArrayLike<double> yields boundary doubles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<double>(0.0, Double.MIN_VALUE, 999999.99);
      const list: ArrayLike<double> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(0.0);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(Double.MIN_VALUE);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(999999.99);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0350
     * @tc.name testArrayLikeIterator035
     * @tc.desc Verify iterator yields CRLF and multiline string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("\r\n", "a\nb", "  test  ");
      const list: ArrayLike<string> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("\r\n");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("a\nb");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("  test  ");
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0360
     * @tc.name testArrayLikeIterator036
     * @tc.desc Verify empty Uint8Array iterator returns done on first next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(0);
      const list: ArrayLike<double> = bytes;
      const iter = list.$_iterator();
      const result = iter.next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0370
     * @tc.name testArrayLikeIterator037
     * @tc.desc Verify for...of over ArrayLike<Object> yields all object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj0 = new Object();
      const obj1 = new Object();
      const obj2 = new Object();
      const values = new Array<Object>(obj0, obj1, obj2);
      const list: ArrayLike<Object> = values;
      const collected: Object[] = [];
      for (const item of list) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(obj0);
      expect(collected[1]).assertEqual(obj1);
      expect(collected[2]).assertEqual(obj2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0380
     * @tc.name testArrayLikeIterator038
     * @tc.desc Verify spread of ArrayLike<float> preserves float elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<float>(1.0e3f, -0.0f);
      const list: ArrayLike<float> = values;
      const arr = [...list];
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1000.0f);
      expect(arr[1]).assertEqual(-0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0390
     * @tc.name testArrayLikeIterator039
     * @tc.desc Verify iterator over ArrayLike<char> yields char elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<char>(c'a', c'8', c'\u4e2d');
      const list: ArrayLike<char> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(c'a');
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(c'8');
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(c'\u4e2d');
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0400
     * @tc.name testArrayLikeIterator040
     * @tc.desc Verify iterator over Int8Array yields signed byte boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8 = new Int8Array(2);
      i8[0] = -128;
      i8[1] = 127;
      const list: ArrayLike<double> = i8;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(-128);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(127);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0410
     * @tc.name testArrayLikeIterator041
     * @tc.desc Verify iterator over Int16Array yields short boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i16 = new Int16Array(2);
      i16[0] = -32768;
      i16[1] = 32767;
      const list: ArrayLike<double> = i16;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(-32768);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(32767);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0420
     * @tc.name testArrayLikeIterator042
     * @tc.desc Verify iterator yields int enum elements in declaration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<ArrayLikeIterStatusEnum>(
        ArrayLikeIterStatusEnum.SUCCESS,
        ArrayLikeIterStatusEnum.FAIL
      );
      const list: ArrayLike<ArrayLikeIterStatusEnum> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(ArrayLikeIterStatusEnum.SUCCESS);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(ArrayLikeIterStatusEnum.FAIL);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0430
     * @tc.name testArrayLikeIterator043
     * @tc.desc Verify iterator over ArrayLike<bigint> yields bigint elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<bigint>(100n, 200n);
      const list: ArrayLike<bigint> = values;
      const result: bigint[] = [];
      for (const item of list) {
        result.push(item);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(100n);
      expect(result[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0440
     * @tc.name testArrayLikeIterator044
     * @tc.desc Verify for...of over sixty-char string ArrayLike yields full content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr =
        "012345678901234567890123456789012345678901234567890123456789";
      const values = new Array<string>(longStr);
      const list: ArrayLike<string> = values;
      let count = 0;
      for (const item of list) {
        expect(item).assertEqual(longStr);
        expect(item.length).assertEqual(60);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0450
     * @tc.name testArrayLikeIterator045
     * @tc.desc Verify iterator over Uint16Array yields unsigned short values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u16 = new Uint16Array(2);
      u16[0] = 0;
      u16[1] = 65535;
      const list: ArrayLike<double> = u16;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(0);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(65535);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0460
     * @tc.name testArrayLikeIterator046
     * @tc.desc Verify iterator over Uint32Array yields max unsigned int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u32 = new Uint32Array(1);
      u32[0] = 4294967295;
      const list: ArrayLike<double> = u32;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(4294967295);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0470
     * @tc.name testArrayLikeIterator047
     * @tc.desc Verify iterator yields string enum elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<ArrayLikeIterStringEnum>(
        ArrayLikeIterStringEnum.ON,
        ArrayLikeIterStringEnum.OFF
      );
      const list: ArrayLike<ArrayLikeIterStringEnum> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(ArrayLikeIterStringEnum.ON);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(ArrayLikeIterStringEnum.OFF);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0480
     * @tc.name testArrayLikeIterator048
     * @tc.desc Verify iterator over ArrayLike<long> yields long elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<long>(100, 200);
      const list: ArrayLike<long> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(100);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(200);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0490
     * @tc.name testArrayLikeIterator049
     * @tc.desc Verify iterator yields zero-width and Arabic string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("\u200B", "\u0627\u0628\u062a\u0628\u0627\u0631");
      const list: ArrayLike<string> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("\u200B");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("\u0627\u0628\u062a\u0628\u0627\u0631");
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0500
     * @tc.name testArrayLikeIterator050
     * @tc.desc Verify iterator over Float32Array yields float element 9.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(1);
      f32[0] = 9.0f;
      const list: ArrayLike<double> = f32;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(9.0f);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0510
     * @tc.name testArrayLikeIterator051
     * @tc.desc Verify iterator over Float64Array yields decimal and scientific elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(2);
      f64[0] = 9.0;
      f64[1] = 1.0e6;
      const list: ArrayLike<double> = f64;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(9.0);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(1000000.0);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0520
     * @tc.name testArrayLikeIterator052
     * @tc.desc Verify empty Int16Array iterator returns done on first next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i16 = new Int16Array(0);
      const list: ArrayLike<double> = i16;
      const result = list.$_iterator().next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0530
     * @tc.name testArrayLikeIterator053
     * @tc.desc Verify for...of on single-element ArrayLike yields one item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(55);
      const list: ArrayLike<int> = values;
      let count = 0;
      for (const item of list) {
        expect(item).assertEqual(55);
        count++;
      }
      expect(count).assertEqual(list.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0540
     * @tc.name testArrayLikeIterator054
     * @tc.desc Verify iterator over Int32Array yields hex octal binary stored values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(3);
      i32[0] = 0x10;
      i32[1] = 0o10;
      i32[2] = 0b10;
      const list: ArrayLike<double> = i32;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(16);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(8);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(2);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0550
     * @tc.name testArrayLikeIterator055
     * @tc.desc Verify iterator over ArrayLike<char> yields char boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<char>(c'\u0000', c'\uffff');
      const list: ArrayLike<char> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(c'\u0000');
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(c'\uffff');
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0560
     * @tc.name testArrayLikeIterator056
     * @tc.desc Verify for...of over ArrayLike yields elements in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<int> = new Array<int>(7, 8, 9);
      const fromSource: int[] = [];
      for (const item of source) {
        fromSource.push(item);
      }
      expect(fromSource.length).assertEqual(3);
      expect(fromSource[0]).assertEqual(7);
      expect(fromSource[1]).assertEqual(8);
      expect(fromSource[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0570
     * @tc.name testArrayLikeIterator057
     * @tc.desc Verify iterator over double enum ArrayLike yields enum elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<ArrayLikeIterScoreEnum>(
        ArrayLikeIterScoreEnum.LOW,
        ArrayLikeIterScoreEnum.HIGH
      );
      const list: ArrayLike<ArrayLikeIterScoreEnum> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(ArrayLikeIterScoreEnum.LOW);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(ArrayLikeIterScoreEnum.HIGH);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0580
     * @tc.name testArrayLikeIterator058
     * @tc.desc Verify iterator over Float32Array yields negative zero and max float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(2);
      f32[0] = -0.0f;
      f32[1] = Float.MAX_VALUE;
      const list: ArrayLike<double> = f32;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(-0.0f);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(Float.MAX_VALUE);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0590
     * @tc.name testArrayLikeIterator059
     * @tc.desc Verify for...of over ArrayLike preserves element values in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<string> = new Array<string>("x", "y", "z");
      const result: string[] = [];
      for (const item of source) {
        result.push(item);
      }
      expect(result[0]).assertEqual("x");
      expect(result[1]).assertEqual("y");
      expect(result[2]).assertEqual("z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0600
     * @tc.name testArrayLikeIterator060
     * @tc.desc Verify iterator over uninitialized Int32Array yields zero elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(3);
      const list: ArrayLike<double> = i32;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(0);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(0);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(0);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0610
     * @tc.name testArrayLikeIterator061
     * @tc.desc Verify spread of empty ArrayLike yields empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>();
      const list: ArrayLike<int> = values;
      const arr = [...list];
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0620
     * @tc.name testArrayLikeIterator062
     * @tc.desc Verify for...of over Uint8Array ArrayLike preserves typed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3);
      bytes[0] = 10;
      bytes[1] = 20;
      bytes[2] = 30;
      const list: ArrayLike<double> = bytes;
      const arr: double[] = [];
      for (const item of list) {
        arr.push(item);
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0630
     * @tc.name testArrayLikeIterator063
     * @tc.desc Verify spread copy is isolated from subsequent source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3);
      const list: ArrayLike<int> = values;
      const arr: Array<int> = [...list];
      values.push(4);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0640
     * @tc.name testArrayLikeIterator064
     * @tc.desc Verify custom ArrayLike $_iterator yields elements with done contract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(5, 15, 25));
      const list: ArrayLike<int> = custom;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(5);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(15);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(25);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
      const afterEnd = iter.next();
      expect(afterEnd.done).assertEqual(true);
      expect(afterEnd.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0650
     * @tc.name testArrayLikeIterator065
     * @tc.desc Verify for...of over custom ArrayLike yields elements in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(7, 8, 9));
      const list: ArrayLike<int> = custom;
      const result: int[] = [];
      for (const item of list) {
        result.push(item);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(7);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0660
     * @tc.name testArrayLikeIterator066
     * @tc.desc Verify collecting custom ArrayLike via length and $_get preserves element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(11, 22, 33));
      const list: ArrayLike<int> = custom;
      const arr = new Array<int>();
      for (let i = 0; i < list.length; i++) {
        arr.push(list.$_get(i));
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(22);
      expect(arr[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0670
     * @tc.name testArrayLikeIterator067
     * @tc.desc Verify $_get, bracket index, and iterator next agree on undefined slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | undefined>();
      arr.push(1);
      arr.push(undefined);
      arr.push(3);
      const list: ArrayLike<int | undefined> = arr;
      expect(list.$_get(1)).assertUndefined();
      expect(list[1]).assertEqual(list.$_get(1));
      expect(list[1]).assertUndefined();
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(list.$_get(0));
      expect(step.value).assertEqual(list[0]);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(list.$_get(1));
      expect(step.value).assertEqual(list[1]);
      expect(step.value).assertUndefined();
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(list.$_get(2));
      expect(step.value).assertEqual(list[2]);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0680
     * @tc.name testArrayLikeIterator068
     * @tc.desc Verify empty custom ArrayLike iterator, for-of, and Array.from yield no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>());
      const list: ArrayLike<int> = custom;
      const iter = list.$_iterator();
      const first = iter.next();
      expect(first.done).assertEqual(true);
      expect(first.value).assertEqual(undefined);
      let count = 0;
      for (const item of list) {
        count++;
      }
      expect(count).assertEqual(0);
      const copied = Array.from<int>(list);
      expect(copied.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0690
     * @tc.name testArrayLikeIterator069
     * @tc.desc Verify iterator and for...of yield null element from ArrayLike<string | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string | null>();
      arr.push("head");
      arr.push(null);
      arr.push("tail");
      const list: ArrayLike<string | null> = arr;
      expect(list.$_get(1)).assertEqual(null);
      const fromForOf: (string | null)[] = [];
      for (const item of list) {
        fromForOf.push(item);
      }
      expect(fromForOf.length).assertEqual(3);
      expect(fromForOf[1]).assertEqual(null);
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("head");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(null);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("tail");
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0700
     * @tc.name testArrayLikeIterator070
     * @tc.desc Verify iterator and for...of yield null from ArrayLike<int | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | null>(10, null, 30);
      const list: ArrayLike<int | null> = values;
      const fromForOf: (int | null)[] = [];
      for (const item of list) {
        fromForOf.push(item);
      }
      expect(fromForOf.length).assertEqual(3);
      expect(fromForOf[1]).assertEqual(null);
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(10);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(null);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(30);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0710
     * @tc.name testArrayLikeIterator071
     * @tc.desc Verify iterator yields undefined from ArrayLike<string | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string | undefined>();
      arr.push("a");
      arr.push(undefined);
      arr.push("c");
      const list: ArrayLike<string | undefined> = arr;
      expect(list.$_get(1)).assertUndefined();
      const fromForOf: (string | undefined)[] = [];
      for (const item of list) {
        fromForOf.push(item);
      }
      expect(fromForOf.length).assertEqual(3);
      expect(fromForOf[1]).assertUndefined();
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("a");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("c");
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0720
     * @tc.name testArrayLikeIterator072
     * @tc.desc Verify iterator yields null and undefined from ArrayLike<int | null | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | null | undefined>();
      arr.push(1);
      arr.push(null);
      arr.push(undefined);
      arr.push(4);
      const list: ArrayLike<int | null | undefined> = arr;
      const result: (int | null | undefined)[] = [];
      for (const item of list) {
        result.push(item);
      }
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(null);
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(4);
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(1);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(null);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(4);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0730
     * @tc.name testArrayLikeIterator073
     * @tc.desc Verify iterator yields heterogeneous union elements int string boolean null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | string | boolean | null>(1, "x", false, null);
      const list: ArrayLike<int | string | boolean | null> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(1);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("x");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(false);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(null);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0740
     * @tc.name testArrayLikeIterator074
     * @tc.desc Verify spread of ArrayLike<int | null | undefined> preserves nullish slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | null | undefined>();
      arr.push(7);
      arr.push(null);
      arr.push(undefined);
      const list: ArrayLike<int | null | undefined> = arr;
      const spread = [...list];
      expect(spread.length).assertEqual(3);
      expect(spread[0]).assertEqual(7);
      expect(spread[1]).assertEqual(null);
      expect(spread[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0750
     * @tc.name testArrayLikeIterator075
     * @tc.desc Verify iterator yields double null and undefined from ArrayLike<double | null | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<double | null | undefined>();
      arr.push(2.5);
      arr.push(null);
      arr.push(undefined);
      const list: ArrayLike<double | null | undefined> = arr;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(2.5);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(null);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0760
     * @tc.name testArrayLikeIterator076
     * @tc.desc Verify for...of over ArrayLike<bigint | null> yields null slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<bigint | null>(10n, null, 30n);
      const list: ArrayLike<bigint | null> = values;
      const result: (bigint | null)[] = [];
      for (const item of list) {
        result.push(item);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10n);
      expect(result[1]).assertEqual(null);
      expect(result[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0770
     * @tc.name testArrayLikeIterator077
     * @tc.desc Verify iterator yields undefined from ArrayLike<float | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<float | undefined>();
      arr.push(1.0f);
      arr.push(undefined);
      const list: ArrayLike<float | undefined> = arr;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(1.0f);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0780
     * @tc.name testArrayLikeIterator078
     * @tc.desc Verify for...of over ArrayLike<long | null> preserves null element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<long | null>(200, null, 400);
      const list: ArrayLike<long | null> = values;
      const collected: (long | null)[] = [];
      for (const item of list) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(200);
      expect(collected[1]).assertEqual(null);
      expect(collected[2]).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0790
     * @tc.name testArrayLikeIterator079
     * @tc.desc Verify iterator yields char and null from ArrayLike<char | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<char | null>(c'z', null, c'0');
      const list: ArrayLike<char | null> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(c'z');
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(null);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(c'0');
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0800
     * @tc.name testArrayLikeIterator080
     * @tc.desc Verify spread of ArrayLike<string | int | null> preserves mixed union elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string | int | null>("k", 9, null);
      const list: ArrayLike<string | int | null> = values;
      const spread = [...list];
      expect(spread.length).assertEqual(3);
      expect(spread[0]).assertEqual("k");
      expect(spread[1]).assertEqual(9);
      expect(spread[2]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0810
     * @tc.name testArrayLikeIterator081
     * @tc.desc Verify iterator yields enum and undefined from ArrayLike<ArrayLikeIterStatusEnum | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<ArrayLikeIterStatusEnum | undefined>();
      arr.push(ArrayLikeIterStatusEnum.SUCCESS);
      arr.push(undefined);
      arr.push(ArrayLikeIterStatusEnum.FAIL);
      const list: ArrayLike<ArrayLikeIterStatusEnum | undefined> = arr;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(ArrayLikeIterStatusEnum.SUCCESS);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(ArrayLikeIterStatusEnum.FAIL);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0820
     * @tc.name testArrayLikeIterator082
     * @tc.desc Verify for...of over ArrayLike<Promise<int> | null> yields Promise and null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise = Promise.resolve(11);
      const values = new Array<Promise<int> | null>(promise, null);
      const list: ArrayLike<Promise<int> | null> = values;
      const result: (Promise<int> | null)[] = [];
      for (const item of list) {
        result.push(item);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(promise);
      expect(result[1]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0830
     * @tc.name testArrayLikeIterator083
     * @tc.desc Verify iterator yields Error and null from ArrayLike<Error | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error("iter");
      const values = new Array<Error | null>(err, null);
      const list: ArrayLike<Error | null> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(err);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(null);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0840
     * @tc.name testArrayLikeIterator084
     * @tc.desc Verify spread of ArrayLike<boolean | null | undefined> preserves all nullish slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean | null | undefined>();
      arr.push(false);
      arr.push(null);
      arr.push(undefined);
      arr.push(true);
      const list: ArrayLike<boolean | null | undefined> = arr;
      const spread = [...list];
      expect(spread.length).assertEqual(4);
      expect(spread[0]).assertEqual(false);
      expect(spread[1]).assertEqual(null);
      expect(spread[2]).assertUndefined();
      expect(spread[3]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0850
     * @tc.name testArrayLikeIterator085
     * @tc.desc Verify for...of over ArrayLike<Array<int> | null> yields nested array and null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<int>(5, 6);
      const values = new Array<Array<int> | null>(nested, null);
      const list: ArrayLike<Array<int> | null> = values;
      const collected: (Array<int> | null)[] = [];
      for (const item of list) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(nested);
      expect(collected[1]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0860
     * @tc.name testArrayLikeIterator086
     * @tc.desc Verify iterator yields RegExp and null from ArrayLike<RegExp | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pattern = new RegExp('x');
      const values = new Array<RegExp | null>(pattern, null);
      const list: ArrayLike<RegExp | null> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(pattern);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(null);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0870
     * @tc.name testArrayLikeIterator087
     * @tc.desc Verify iterator yields Date and null from ArrayLike<Date | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1700000000000);
      const values = new Array<Date | null>(date, null);
      const list: ArrayLike<Date | null> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(date);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(null);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0880
     * @tc.name testArrayLikeIterator088
     * @tc.desc Verify for...of over ArrayLike<Array<int> | undefined> yields nested array and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<int>(1, 2);
      let arr = new Array<Array<int> | undefined>();
      arr.push(nested);
      arr.push(undefined);
      const list: ArrayLike<Array<int> | undefined> = arr;
      const result: (Array<int> | undefined)[] = [];
      for (const item of list) {
        result.push(item);
      }
      expect(result[0]).assertEqual(nested);
      expect(result[1]).assertUndefined();
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(nested);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0890
     * @tc.name testArrayLikeIterator089
     * @tc.desc Verify iterator yields RegExp and undefined from ArrayLike<RegExp | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pattern = new RegExp('y');
      let arr = new Array<RegExp | undefined>();
      arr.push(pattern);
      arr.push(undefined);
      const list: ArrayLike<RegExp | undefined> = arr;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(pattern);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0900
     * @tc.name testArrayLikeIterator090
     * @tc.desc Verify spread of ArrayLike<Object | undefined> preserves undefined slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      let arr = new Array<Object | undefined>();
      arr.push(obj);
      arr.push(undefined);
      const list: ArrayLike<Object | undefined> = arr;
      const spread = [...list];
      expect(spread.length).assertEqual(2);
      expect(spread[0]).assertEqual(obj);
      expect(spread[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0910
     * @tc.name testArrayLikeIterator091
     * @tc.desc Verify iterator yields Date and undefined from ArrayLike<Date | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let arr = new Array<Date | undefined>();
      arr.push(date);
      arr.push(undefined);
      const list: ArrayLike<Date | undefined> = arr;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(date);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0920
     * @tc.name testArrayLikeIterator092
     * @tc.desc Verify iterator yields enum null and undefined from ArrayLike<ArrayLikeIterStatusEnum | null | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<ArrayLikeIterStatusEnum | null | undefined>();
      arr.push(ArrayLikeIterStatusEnum.SUCCESS);
      arr.push(null);
      arr.push(undefined);
      const list: ArrayLike<ArrayLikeIterStatusEnum | null | undefined> = arr;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(ArrayLikeIterStatusEnum.SUCCESS);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(null);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0930
     * @tc.name testArrayLikeIterator093
     * @tc.desc Verify for...of, $_iterator(), and spread yield undefined for explicit undefined element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | undefined>(10, undefined, 30);
      const list: ArrayLike<int | undefined> = values;
      expect(list.length).assertEqual(3);
      expect(list.$_get(1)).assertUndefined();
      const fromForOf: (int | undefined)[] = [];
      for (const item of list) {
        fromForOf.push(item);
      }
      expect(fromForOf.length).assertEqual(3);
      expect(fromForOf[0]).assertEqual(10);
      expect(fromForOf[1]).assertUndefined();
      expect(fromForOf[2]).assertEqual(30);
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(10);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(30);
      step = iter.next();
      expect(step.done).assertEqual(true);
      expect(step.value).assertEqual(undefined);
      const spread = [...list];
      expect(spread.length).assertEqual(3);
      expect(spread[0]).assertEqual(10);
      expect(spread[1]).assertUndefined();
      expect(spread[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0940
     * @tc.name testArrayLikeIterator094
     * @tc.desc Verify custom ArrayLike multiple $_iterator() calls return independent iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(1, 2, 3));
      const list: ArrayLike<int> = custom;
      const iter1 = list.$_iterator();
      const iter2 = list.$_iterator();
      let step1 = iter1.next();
      expect(step1.done).assertEqual(false);
      expect(step1.value).assertEqual(1);
      let step2 = iter2.next();
      expect(step2.done).assertEqual(false);
      expect(step2.value).assertEqual(1);
      step1 = iter1.next();
      expect(step1.done).assertEqual(false);
      expect(step1.value).assertEqual(2);
      step2 = iter2.next();
      expect(step2.done).assertEqual(false);
      expect(step2.value).assertEqual(2);
      step1 = iter1.next();
      expect(step1.done).assertEqual(false);
      expect(step1.value).assertEqual(3);
      step2 = iter2.next();
      expect(step2.done).assertEqual(false);
      expect(step2.value).assertEqual(3);
      step1 = iter1.next();
      expect(step1.done).assertEqual(true);
      expect(step1.value).assertEqual(undefined);
      step2 = iter2.next();
      expect(step2.done).assertEqual(true);
      expect(step2.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0950
     * @tc.name testArrayLikeIterator095
     * @tc.desc Verify spread operator converts custom ArrayLike to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(10, 20, 30));
      const list: ArrayLike<int> = custom;
      const arr = [...list];
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0960
     * @tc.name testArrayLikeIterator096
     * @tc.desc Verify two iterators from same custom ArrayLike traverse independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(1, 2, 3, 4, 5));
      const list: ArrayLike<int> = custom;
      const iter1 = list.$_iterator();
      const iter2 = list.$_iterator();
      iter1.next();
      iter1.next();
      expect(iter2.next().value).assertEqual(1);
      expect(iter1.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0970
     * @tc.name testArrayLikeIterator097
     * @tc.desc Verify custom ArrayLike $_iterator() return type is IterableIterator<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(1, 2));
      const list: ArrayLike<int> = custom;
      const iter: IterableIterator<int> = list.$_iterator();
      const first = iter.next();
      expect(first.done).assertEqual(false);
      expect(first.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0980
     * @tc.name testArrayLikeIterator098
     * @tc.desc Verify iterator and for...of yield undefined from ArrayLike<int | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | undefined>(10, undefined, 30);
      const list: ArrayLike<int | undefined> = values;
      expect(list.$_get(1)).assertUndefined();
      const fromForOf: (int | undefined)[] = [];
      for (const item of list) {
        fromForOf.push(item);
      }
      expect(fromForOf.length).assertEqual(3);
      expect(fromForOf[1]).assertUndefined();
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(10);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(30);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_0990
     * @tc.name testArrayLikeIterator099
     * @tc.desc Verify for...of and iterator yield undefined from ArrayLike<bigint | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<bigint | undefined>(10n, undefined, 30n);
      const list: ArrayLike<bigint | undefined> = values;
      const result: (bigint | undefined)[] = [];
      for (const item of list) {
        result.push(item);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10n);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(30n);
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(10n);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(30n);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_1000
     * @tc.name testArrayLikeIterator100
     * @tc.desc Verify for...of and iterator yield undefined from ArrayLike<long | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<long | undefined>(200, undefined, 400);
      const list: ArrayLike<long | undefined> = values;
      const collected: (long | undefined)[] = [];
      for (const item of list) {
        collected.push(item);
      }
      expect(collected[0]).assertEqual(200);
      expect(collected[1]).assertUndefined();
      expect(collected[2]).assertEqual(400);
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(200);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(400);
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_1010
     * @tc.name testArrayLikeIterator101
     * @tc.desc Verify iterator yields char and undefined from ArrayLike<char | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<char | undefined>(c'z', undefined, c'0');
      const list: ArrayLike<char | undefined> = values;
      expect(list.$_get(1)).assertUndefined();
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(c'z');
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(c'0');
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_1020
     * @tc.name testArrayLikeIterator102
     * @tc.desc Verify for...of and iterator yield undefined from ArrayLike<Promise<int> | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise = Promise.resolve(11);
      const values = new Array<Promise<int> | undefined>(promise, undefined);
      const list: ArrayLike<Promise<int> | undefined> = values;
      const result: (Promise<int> | undefined)[] = [];
      for (const item of list) {
        result.push(item);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(promise);
      expect(result[1]).assertUndefined();
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(promise);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_1030
     * @tc.name testArrayLikeIterator103
     * @tc.desc Verify iterator yields Error and undefined from ArrayLike<Error | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error("iter");
      const values = new Array<Error | undefined>(err, undefined);
      const list: ArrayLike<Error | undefined> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(err);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_ITERATOR_1040
     * @tc.name testArrayLikeIterator104
     * @tc.desc Verify iterator yields heterogeneous union elements int string boolean undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeIterator104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | string | boolean | undefined>(1, "x", false, undefined);
      const list: ArrayLike<int | string | boolean | undefined> = values;
      const iter = list.$_iterator();
      let step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(1);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual("x");
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertEqual(false);
      step = iter.next();
      expect(step.done).assertEqual(false);
      expect(step.value).assertUndefined();
      const exhausted = iter.next();
      expect(exhausted.done).assertEqual(true);
      expect(exhausted.value).assertEqual(undefined);
    });

  });
}

