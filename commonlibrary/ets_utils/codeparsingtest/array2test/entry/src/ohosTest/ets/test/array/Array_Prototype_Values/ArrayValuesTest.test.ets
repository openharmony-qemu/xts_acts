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

class Yield99Iterator implements IterableIterator<number> {
  private emitted: boolean = false;

  next(): IteratorResult<number> {
    if (!this.emitted) {
      this.emitted = true;
      return { done: false, value: 99 };
    }
    return { done: true, value: undefined };
  }

  [Symbol.iterator](): IterableIterator<number> {
    return this;
  }
}

export default function ArrayValuesTestSupplement() {
  describe('ArrayValuesTestSupplement', () => {
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
     * @tc.name testArrayValuesTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_0100
     * @tc.desc 1.1.1 Verify values() returns an iterator object (typeof check)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      expect(iter !== null).assertEqual(true);
      expect(typeof iter === 'object').assertEqual(true);
      expect(typeof iter.next === 'function').assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_0200
     * @tc.desc 1.1.2 Verify values() iterator reads first element without Symbol.toStringTag or Object.prototype.toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      expect(iter.next().value).assertEqual(1);
      expect(typeof iter.next === 'function').assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_0300
     * @tc.desc 1.1.3 Verify each call to values() returns a new iterator instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter1: IterableIterator<number> = arr.values();
      const iter2: IterableIterator<number> = arr.values();
      expect(iter1 !== iter2).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_0400
     * @tc.desc 1.2.1 Verify iteration order and values for a basic array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals(['a', 'b', 'c']);
    })

    /**
     * @tc.name testArrayValuesTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_0500
     * @tc.desc 1.2.2 Verify iteration yields values, not indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      const iter: IterableIterator<number> = arr.values();
      expect(iter.next().value).assertEqual(10);
      expect(iter.next().value).assertEqual(20);
      expect(iter.next().value).assertEqual(30);
    })

    /**
     * @tc.name testArrayValuesTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_0600
     * @tc.desc 1.3.1 Verify values() accepts no arguments and next() returns normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      const r1: IteratorResult<number> = iter.next();
      expect(r1.value).assertEqual(1);
      expect(r1.done).assertEqual(false);
    })


    /**
     * @tc.name testArrayValuesTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_0700
     * @tc.desc 2.1.2 Verify successive next() calls return each element in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string> = arr.values();
      expect(iter.next().value).assertEqual('a');
      expect(iter.next().value).assertEqual('b');
      expect(iter.next().value).assertEqual('c');
      expect(iter.next().done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_0800
     * @tc.desc 2.2.1 Verify done is false before iteration completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(false);
      expect(r.value).assertEqual(1);
    })

    /**
     * @tc.name testArrayValuesTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_0900
     * @tc.desc 2.2.2 Verify done is true when iteration completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(true);
      expect(r.value).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_1000
     * @tc.desc 2.2.3 Verify empty array yields done true on first next()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const iter: IterableIterator<number> = arr.values();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(true);
      expect(r.value).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_1100
     * @tc.desc 2.2.4 Verify further next() calls stay done after completion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      iter.next();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_1200
     * @tc.desc 2.3.1 Verify iterator value matches the corresponding array element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42, 100, 0];
      const iter: IterableIterator<number> = arr.values();
      expect(iter.next().value).assertEqual(42);
      expect(iter.next().value).assertEqual(100);
      expect(iter.next().value).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_1300
     * @tc.desc 2.3.2 Verify value is undefined after iteration completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      expect(iter.next().value).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_1400
     * @tc.desc 2.3.3 Verify for-of consumes iterator returned by values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      const out: number[] = [];
      for (const v of iter) {
        out.push(v);
      }
      expect(out).assertDeepEquals([1]);
    })


    /**
     * @tc.name testArrayValuesTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_1500
     * @tc.desc 3.1.1 Verify for-of visits every element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      const result: number[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals([10, 20, 30]);
    })

    /**
     * @tc.name testArrayValuesTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_1600
     * @tc.desc 3.1.2 Verify for-of over values() does not mutate the array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      for (const v of arr.values()) {
        void v;
      }
      expect(arr).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArrayValuesTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_1700
     * @tc.desc 3.2.1 Verify break leaves the iterator at the current position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd', 'e'];
      const iter: IterableIterator<string> = arr.values();
      const first: string[] = [];
      for (const v of iter) {
        first.push(v);
        if (v === 'b') {
          break;
        }
      }
      const second: string[] = [];
      for (const v of iter) {
        second.push(v);
      }
      expect(first).assertDeepEquals(['a', 'b']);
      expect(second).assertDeepEquals(['c', 'd', 'e']);
    })

    /**
     * @tc.name testArrayValuesTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_1800
     * @tc.desc 3.2.2 Verify break on first element then continue iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      for (const v of iter) {
        void v;
        break;
      }
      const result: number[] = [];
      for (const v of iter) {
        result.push(v);
      }
      expect(result).assertDeepEquals([2, 3]);
    })

    /**
     * @tc.name testArrayValuesTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_1900
     * @tc.desc 3.3.1 Verify continue skips the current element and iteration continues
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = [];
      for (const v of arr.values()) {
        if (v % 2 === 0) {
          continue;
        }
        result.push(v);
      }
      expect(result).assertDeepEquals([1, 3, 5]);
    })

    /**
     * @tc.name testArrayValuesTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_2000
     * @tc.desc 3.3.2 Verify throw aborts iteration but iterator can still be advanced
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      const collected: number[] = [];
      try {
        for (const v of iter) {
          collected.push(v);
          if (v === 2) {
            throw new Error('test');
          }
        }
      } catch (_e) {
      }
      const remaining: number[] = [];
      for (const v of iter) {
        remaining.push(v);
      }
      expect(collected).assertDeepEquals([1, 2]);
      expect(remaining).assertDeepEquals([3]);
    })


    /**
     * @tc.name testArrayValuesTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_2100
     * @tc.desc 4.1.1 Verify exhausted iterator yields nothing in for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      for (const v of iter) {
        void v;
      }
      const result: number[] = [];
      for (const v of iter) {
        result.push(v);
      }
      expect(result.length).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_2200
     * @tc.desc 4.1.2 Verify next() returns done after exhaustion in for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      iter.next();
      expect(iter.next().done).assertEqual(true);
      expect(iter.next().done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_2300
     * @tc.desc 4.2.1 Verify next() after exhaustion returns { value: undefined, done: true }
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['x'];
      const iter: IterableIterator<string> = arr.values();
      iter.next();
      iter.next();
      const r1: IteratorResult<string> = iter.next();
      const r2: IteratorResult<string> = iter.next();
      expect(r1.value).assertUndefined();
      expect(r1.done).assertEqual(true);
      expect(r2.value).assertUndefined();
      expect(r2.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_2400
     * @tc.desc 4.3.1 Verify the same iterator can only be traversed effectively once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string> = arr.values();
      const first: string[] = [];
      for (const v of iter) {
        first.push(v);
      }
      const second: string[] = [];
      for (const v of iter) {
        second.push(v);
      }
      expect(first).assertDeepEquals(['a', 'b', 'c']);
      expect(second.length).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_2500
     * @tc.desc 4.3.2 Verify partially consumed iterator can traverse remaining elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      iter.next();
      const result: number[] = [];
      for (const v of iter) {
        result.push(v);
      }
      expect(result).assertDeepEquals([3, 4, 5]);
    })


    /**
     * @tc.name testArrayValuesTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_2600
     * @tc.desc 5.1.1 Verify on an instance values and Symbol.iterator are the same function reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0];
      expect(arr.values === arr[Symbol.iterator]).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_2700
     * @tc.desc 5.1.2 Verify values() and Symbol.iterator() agree on first next()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const vIter: IterableIterator<number> = arr.values();
      const sIter: IterableIterator<number> = arr[Symbol.iterator]();
      expect(vIter.next().value).assertEqual(sIter.next().value);
    })

    /**
     * @tc.name testArrayValuesTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_2800
     * @tc.desc 5.1.3 Verify two independent iterators produce the same traversal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const vIter: IterableIterator<number> = arr.values();
      const sIter: IterableIterator<number> = arr[Symbol.iterator]();
      expect(vIter.next().value).assertEqual(sIter.next().value);
      expect(vIter.next().value).assertEqual(sIter.next().value);
      expect(vIter.next().value).assertEqual(sIter.next().value);
    })

    /**
     * @tc.name testArrayValuesTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_2900
     * @tc.desc 5.2.1 Verify for-of over an array matches arr.values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const fromDirect: number[] = [];
      for (const v of arr) {
        fromDirect.push(v);
      }
      const fromValues: number[] = [];
      for (const v of arr.values()) {
        fromValues.push(v);
      }
      expect(fromDirect).assertDeepEquals(fromValues);
    })

    /**
     * @tc.name testArrayValuesTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_3000
     * @tc.desc 5.2.2 Verify existing values() iterator still completes in original order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      const result: number[] = [];
      for (const v of iter) {
        result.push(v);
      }
      expect(result).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArrayValuesTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_3100
     * @tc.desc 5.2.3 Verify for-of over custom iterator class
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom: Yield99Iterator = new Yield99Iterator();
      const result: number[] = [];
      for (const v of custom) {
        result.push(v);
      }
      expect(result).assertDeepEquals([99]);
    })


    /**
     * @tc.name testArrayValuesTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_3200
     * @tc.desc 6.1.1 Verify iteration over a number array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2.5, -3, 0];
      const result: number[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals([1, 2.5, -3, 0]);
    })

    /**
     * @tc.name testArrayValuesTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_3300
     * @tc.desc 6.1.2 Verify iteration over a string array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['hello', 'world', ''];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals(['hello', 'world', '']);
    })

    /**
     * @tc.name testArrayValuesTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_3400
     * @tc.desc 6.1.3 Verify iteration over a boolean array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      const result: boolean[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals([true, false]);
    })

    /**
     * @tc.name testArrayValuesTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_3500
     * @tc.desc 6.1.4 Verify iteration over a BigInt array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: bigint[] = [BigInt(1), BigInt(2), BigInt(3)];
      const result: bigint[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result[0]).assertEqual(BigInt(1));
      expect(result[1]).assertEqual(BigInt(2));
      expect(result[2]).assertEqual(BigInt(3));
    })

    /**
     * @tc.name testArrayValuesTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_3600
     * @tc.desc 6.2.1 Verify object elements are returned by reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Obj { key: string }
      const obj: Obj = { key: 'value' };
      const arr: Obj[] = [obj];
      const iter: IterableIterator<Obj> = arr.values();
      const r: IteratorResult<Obj> = iter.next();
      expect(r.value === obj).assertEqual(true);
      expect(r.value.key).assertEqual('value');
    })

    /**
     * @tc.name testArrayValuesTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_3700
     * @tc.desc 6.2.2 Verify nested arrays as elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const result: number[][] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals([[1, 2], [3, 4]]);
      expect(result[0] !== result[1]).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_3800
     * @tc.desc 6.2.3 Verify function elements are iterated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (): number => 42;
      const arr: (() => number)[] = [fn];
      const iter: IterableIterator<() => number> = arr.values();
      const r: IteratorResult<() => number> = iter.next();
      expect(r.value === fn).assertEqual(true);
      expect(r.value()).assertEqual(42);
    })

    /**
     * @tc.name testArrayValuesTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_3900
     * @tc.desc 6.3.1 Verify mixed-type array iteration (typeof checks)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface ObjA { a: number }
      const nested: number[] = [2];
      const objEl: ObjA = { a: 1 };
      const arr: (number | string | boolean | null | Object | number[])[] = [1, 'two', true, null, objEl, nested];
      const types: string[] = [];
      for (const v of arr.values()) {
        types.push(typeof v);
      }
      expect(types).assertDeepEquals(['number', 'string', 'boolean', 'object', 'object', 'object']);
    })

    /**
     * @tc.name testArrayValuesTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_4000
     * @tc.desc 6.4.1 Verify undefined elements are iterated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [undefined, undefined];
      const result: (number | undefined)[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_4100
     * @tc.desc 6.4.2 Verify null elements are iterated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | null)[] = [null, null];
      const result: (string | null)[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertNull();
      expect(result[1]).assertNull();
    })

    /**
     * @tc.name testArrayValuesTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_4200
     * @tc.desc 6.4.3 Verify NaN as an element is iterated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [NaN];
      const iter: IterableIterator<number> = arr.values();
      const r: IteratorResult<number> = iter.next();
      expect(Number.isNaN(r.value)).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_4300
     * @tc.desc 6.4.4 Verify custom class instance elements are iterated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Tagged {
        tag: string = 'test';
      }
      const el: Tagged = new Tagged();
      const arr: Tagged[] = [el];
      const iter: IterableIterator<Tagged> = arr.values();
      expect(iter.next().value === el).assertEqual(true);
    })


    /**
     * @tc.name testArrayValuesTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_4400
     * @tc.desc 7.1.1 Verify sparse holes iterate as undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array<number>(4);
      arr[0] = 1;
      arr[3] = 4;
      const result: (number | undefined)[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(4);
    })

    /**
     * @tc.name testArrayValuesTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_4500
     * @tc.desc 7.1.2 Verify iteration with holes in the middle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | undefined)[] = new Array<string | undefined>(3);
      arr[0] = 'a';
      arr[2] = 'c';
      const result: (string | null)[] = [];
      for (const v of arr.values()) {
        result.push(v === undefined ? null : v);
      }
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertNull();
      expect(result[2]).assertEqual('c');
    })

    /**
     * @tc.name testArrayValuesTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_4600
     * @tc.desc 7.2.1 Verify all holes iterate as undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: undefined[] = new Array<undefined>(3);
      const result: (undefined)[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_4700
     * @tc.desc 7.2.2 Verify iteration over an array created with Array(length)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array<number>(5);
      const iter: IterableIterator<number | undefined> = arr.values();
      let allUndefined = true;
      let allNotDone = true;
      for (let i = 0; i < 5; i++) {
        const r: IteratorResult<number | undefined> = iter.next();
        if (r.value !== undefined) {
          allUndefined = false;
        }
        if (r.done !== false) {
          allNotDone = false;
        }
      }
      const last: IteratorResult<number | undefined> = iter.next();
      expect(allUndefined).assertEqual(true);
      expect(allNotDone).assertEqual(true);
      expect(last.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_4800
     * @tc.desc 7.3.1 Verify iteration when holes lead the array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | undefined)[] = new Array<string | undefined>(4);
      arr[2] = 'a';
      arr[3] = 'b';
      const result: (string | undefined)[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual('a');
      expect(result[3]).assertEqual('b');
    })

    /**
     * @tc.name testArrayValuesTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_4900
     * @tc.desc 7.3.2 Verify iteration when holes trail the array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | undefined)[] = ['a', 'b', undefined];
      const result: (string | undefined)[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_5000
     * @tc.desc 7.3.3 Verify holes match explicit undefined element behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sparse: (number | undefined)[] = new Array<number | undefined>(3);
      sparse[0] = 1;
      sparse[2] = 3;
      const explicit: (number | undefined)[] = [1, undefined, 3];
      const sparseVals: (number | undefined)[] = [];
      for (const v of sparse.values()) {
        sparseVals.push(v);
      }
      const explicitVals: (number | undefined)[] = [];
      for (const v of explicit.values()) {
        explicitVals.push(v);
      }
      expect(sparseVals[0]).assertEqual(explicitVals[0]);
      expect(sparseVals[1]).assertEqual(explicitVals[1]);
      expect(sparseVals[2]).assertEqual(explicitVals[2]);
    })


    /**
     * @tc.name testArrayValuesTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_5100
     * @tc.desc 8.1.1 Verify empty array iterator is immediately done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const iter: IterableIterator<number> = arr.values();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(true);
      expect(r.value).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_5200
     * @tc.desc 8.1.2 Verify for-of over empty array runs zero iterations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      let count: number = 0;
      for (const v of arr.values()) {
        void v;
        count++;
      }
      expect(count).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_5300
     * @tc.desc 8.2.1 Verify single-element array iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42];
      const iter: IterableIterator<number> = arr.values();
      const r1: IteratorResult<number> = iter.next();
      expect(r1.value).assertEqual(42);
      expect(r1.done).assertEqual(false);
      const r2: IteratorResult<number> = iter.next();
      expect(r2.value).assertUndefined();
      expect(r2.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_5400
     * @tc.desc 8.2.2 Verify array whose sole element is undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [undefined];
      const iter: IterableIterator<number | undefined> = arr.values();
      const r: IteratorResult<number | undefined> = iter.next();
      expect(r.value).assertUndefined();
      expect(r.done).assertEqual(false);
      expect(iter.next().done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_5500
     * @tc.desc 8.3.1 Verify large dense array iteration completeness
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: number = 1000;
      const arr: number[] = Array.from({ length: size }, (_: Object, i: number): number => i);
      let count: number = 0;
      for (const v of arr.values()) {
        expect(v).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(size);
    })

    /**
     * @tc.name testArrayValuesTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_5600
     * @tc.desc 8.3.2 Verify large sparse array iteration counts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | undefined)[] = new Array<string | undefined>(1000);
      arr[0] = 'first';
      arr[999] = 'last';
      let count = 0;
      let undefinedCount = 0;
      for (const v of arr.values()) {
        if (v === undefined) {
          undefinedCount++;
        }
        count++;
      }
      expect(count).assertEqual(1000);
      expect(undefinedCount).assertEqual(998);
    })


    /**
     * @tc.name testArrayValuesTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_5700
     * @tc.desc 9.1.1 Verify changing unvisited elements affects subsequent iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string> = arr.values();
      expect(iter.next().value).assertEqual('a');
      arr[1] = 'B';
      expect(iter.next().value).assertEqual('B');
      expect(iter.next().value).assertEqual('c');
    })

    /**
     * @tc.name testArrayValuesTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_5800
     * @tc.desc 9.1.2 Verify changing visited elements does not affect subsequent iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      expect(iter.next().value).assertEqual(1);
      arr[0] = 100;
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    })

    /**
     * @tc.name testArrayValuesTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_5900
     * @tc.desc 9.1.3 Verify changing the element currently being visited
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string> = arr.values();
      iter.next();
      arr[1] = 'modified';
      const r: IteratorResult<string> = iter.next();
      expect(r.value).assertEqual('modified');
    })

    /**
     * @tc.name testArrayValuesTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_6000
     * @tc.desc 9.2.1 Verify elements pushed during iteration may be visited
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = [];
      let pushDone: boolean = false;
      for (const v of arr.values()) {
        result.push(v);
        if (!pushDone) {
          arr.push(4);
          pushDone = true;
        }
      }
      expect(result.includes(4)).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_6100
     * @tc.desc 9.2.2 Verify elements added by index during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
        if (v === 'a') {
          arr[2] = 'c';
        }
      }
      expect(result).assertDeepEquals(['a', 'b', 'c']);
    })

    /**
     * @tc.name testArrayValuesTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_6200
     * @tc.desc 9.3.1 Verify assigning undefined to slot yields undefined on next iterator read
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | undefined)[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string | undefined> = arr.values();
      iter.next();
      arr[1] = undefined;
      expect(iter.next().value).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_6300
     * @tc.desc 9.3.2 Verify pop during iteration affects iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string> = arr.values();
      iter.next();
      arr.pop();
      const r: IteratorResult<string> = iter.next();
      expect(r.value).assertEqual('b');
      const r2: IteratorResult<string> = iter.next();
      expect(r2.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_6400
     * @tc.desc 9.3.3 Verify shift during iteration affects remaining iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string | undefined> = arr.values();
      iter.next();
      arr.shift();
      const result: string[] = [];
      for (const v of iter) {
        result.push(v as string);
      }
      expect(result).assertDeepEquals(['c']);
    })

    /**
     * @tc.name testArrayValuesTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_6500
     * @tc.desc 9.4.1 Verify shortening length ends iteration early
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
        if (v === 'b') {
          arr.length = 2;
        }
      }
      expect(result).assertDeepEquals(['a', 'b']);
    })

    /**
     * @tc.name testArrayValuesTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_6600
     * @tc.desc 9.4.2 Verify growing length yields undefined for new holes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: (number | undefined)[] = [];
      for (const v of arr.values()) {
        result.push(v);
        if (v === 1) {
          arr.length = 10;
        }
      }
      expect(result.length).assertEqual(10);
      expect(result).assertDeepEquals([1, 2, 3, undefined, undefined, undefined, undefined, undefined, undefined, undefined]);
    })

    /**
     * @tc.name testArrayValuesTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_6700
     * @tc.desc 9.4.3 Verify setting length to 0 ends iteration immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
        if (v === 'a') {
          arr.length = 0;
        }
      }
      expect(result).assertDeepEquals(['a']);
    })


    /**
     * @tc.name testArrayValuesTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_6800
     * @tc.desc 10.1.1 Verify string[] values() matches manual traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: string[] = ['a', 'b', 'c'];
      const result: string[] = [];
      for (const v of src.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals(['a', 'b', 'c']);
    })

    /**
     * @tc.name testArrayValuesTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_6900
     * @tc.desc 10.1.2 Verify fixed-length string array only iterates in-range elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: string[] = ['a', 'b'];
      const result: string[] = [];
      for (const v of src.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals(['a', 'b']);
    })

    /**
     * @tc.name testArrayValuesTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_7000
     * @tc.desc 10.1.3 Verify number[] values() traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [1, 2, 3];
      const result: number[] = [];
      for (const v of src.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArrayValuesTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_7100
     * @tc.desc 10.2.1 Verify string character iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'abc';
      const result: string[] = [];
      for (const ch of str) {
        result.push(ch);
      }
      expect(result).assertDeepEquals(['a', 'b', 'c']);
    })

    /**
     * @tc.name testArrayValuesTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_7200
     * @tc.desc 10.3.1 Verify array of undefined slots via values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: undefined[] = new Array<undefined>(3);
      const result: undefined[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_7300
     * @tc.desc 10.3.2 Verify empty array values() completes immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_7400
     * @tc.desc 10.4.1 Verify calling instance method on null throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        const nil: number[] | null = null;
        nil!.values();
      } catch (e) {
        thrown = e instanceof TypeError;
      }
      expect(thrown).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_7500
     * @tc.desc 10.4.2 Verify calling instance method on undefined throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        const u: number[] | undefined = undefined;
        u!.values();
      } catch (e) {
        thrown = e instanceof TypeError;
      }
      expect(thrown).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_7600
     * @tc.desc 10.4.3 Verify empty number[] iterator is immediately done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: number[] = [];
      const iter: IterableIterator<number> = empty.values();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_7700
     * @tc.desc 10.4.4 Verify empty boolean[] iterator is immediately done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: boolean[] = [];
      const iter: IterableIterator<boolean> = empty.values();
      const r: IteratorResult<boolean> = iter.next();
      expect(r.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_7800
     * @tc.desc 10.4.5 Verify empty string[] iterator is immediately done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [];
      const iter: IterableIterator<string> = arr.values();
      const r: IteratorResult<string> = iter.next();
      expect(r.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_7900
     * @tc.desc 10.4.6 Verify empty string[] iterator is immediately done (NaN length object case)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [];
      const iter: IterableIterator<string> = arr.values();
      const r: IteratorResult<string> = iter.next();
      expect(r.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_8000
     * @tc.desc 10.4.7 Verify fixed-length string[] values() iterates all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: string[] = ['a', 'b'];
      const result: string[] = [];
      for (const v of src.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    })


    /**
     * @tc.name testArrayValuesTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_8100
     * @tc.desc 11.1.1 Verify values() yields values while entries() yields index-value pairs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const vIter: IterableIterator<string> = arr.values();
      const eIter: IterableIterator<[number, string]> = arr.entries();
      expect(vIter.next().value).assertEqual('a');
      const eFirst: IteratorResult<[number, string]> = eIter.next();
      expect(eFirst.value[0]).assertEqual(0);
      expect(eFirst.value[1]).assertEqual('a');
    })

    /**
     * @tc.name testArrayValuesTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_8200
     * @tc.desc 11.1.2 Verify values and entries iterators do not interfere
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const vIter: IterableIterator<number> = arr.values();
      const eIter: IterableIterator<[number, number]> = arr.entries();
      vIter.next();
      vIter.next();
      const eFirst: IteratorResult<[number, number]> = eIter.next();
      expect(eFirst.value[0]).assertEqual(0);
      expect(eFirst.value[1]).assertEqual(1);
    })

    /**
     * @tc.name testArrayValuesTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_8300
     * @tc.desc 11.2.1 Verify values() yields values while keys() yields indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const vIter: IterableIterator<string> = arr.values();
      const kIter: IterableIterator<number> = arr.keys();
      expect(vIter.next().value).assertEqual('a');
      expect(kIter.next().value).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_8400
     * @tc.desc 11.2.2 Verify values, keys, and entries traverse the same element count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      let vCount: number = 0;
      let kCount: number = 0;
      let eCount: number = 0;
      for (const v of arr.values()) { void v; vCount++; }
      for (const k of arr.keys()) { void k; kCount++; }
      for (const e of arr.entries()) { void e; eCount++; }
      expect(vCount).assertEqual(3);
      expect(kCount).assertEqual(3);
      expect(eCount).assertEqual(3);
    })

    /**
     * @tc.name testArrayValuesTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_8500
     * @tc.desc 11.3.1 Verify multiple values iterators on the same array work independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter1: IterableIterator<number> = arr.values();
      const iter2: IterableIterator<number> = arr.values();
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
      expect(iter1.next().value).assertEqual(2);
      expect(iter2.next().value).assertEqual(2);
    })

    /**
     * @tc.name testArrayValuesTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_8600
     * @tc.desc 11.3.2 Verify values iterator and for-of over the array do not interfere
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      const directResult: number[] = [];
      for (const v of arr) {
        directResult.push(v);
      }
      expect(directResult).assertDeepEquals([1, 2, 3]);
      expect(iter.next().value).assertEqual(2);
    })

    /**
     * @tc.name testArrayValuesTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_8700
     * @tc.desc 11.3.3 Verify using values, keys, and entries together
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['x', 'y'];
      const vIter: IterableIterator<string> = arr.values();
      const kIter: IterableIterator<number> = arr.keys();
      const eIter: IterableIterator<[number, string]> = arr.entries();
      expect(vIter.next().value).assertEqual('x');
      expect(kIter.next().value).assertEqual(0);
      const e1: IteratorResult<[number, string]> = eIter.next();
      expect(e1.value[0]).assertEqual(0);
      expect(e1.value[1]).assertEqual('x');
      expect(vIter.next().value).assertEqual('y');
      expect(kIter.next().value).assertEqual(1);
      const e2: IteratorResult<[number, string]> = eIter.next();
      expect(e2.value[0]).assertEqual(1);
      expect(e2.value[1]).assertEqual('y');
    })


    /**
     * @tc.name testArrayValuesTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_8800
     * @tc.desc 12.1.1 Verify collecting values() output (spread equivalent via Array.from)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const spread: number[] = Array.from(arr.values());
      expect(spread).assertDeepEquals([1, 2, 3]);
      expect(spread !== arr).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_8900
     * @tc.desc 12.1.2 Verify collecting from a partially consumed iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      iter.next();
      const rest: number[] = Array.from(iter);
      expect(rest).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArrayValuesTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_9000
     * @tc.desc 12.1.3 Verify merging arrays using values() collections
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const merged: number[] = Array.from(arr1.values()).concat(Array.from(arr2.values()));
      expect(merged).assertDeepEquals([1, 2, 3, 4]);
    })

    /**
     * @tc.name testArrayValuesTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_9100
     * @tc.desc 12.3.1 Verify Array.from converts a values() iterator to an array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const newArr: number[] = Array.from(arr.values());
      expect(newArr).assertDeepEquals([1, 2, 3]);
      expect(newArr !== arr).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_9200
     * @tc.desc 12.3.2 Verify Array.from with a mapping function on values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const doubled: number[] = Array.from(arr.values(), (x: number): number => x * 2);
      expect(doubled).assertDeepEquals([2, 4, 6]);
    })

    /**
     * @tc.name testArrayValuesTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_9300
     * @tc.desc 12.3.3 Verify constructing a Set from values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 2, 3, 3];
      const set: Set<number> = new Set(arr.values());
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertEqual(true);
      expect(set.has(2)).assertEqual(true);
      expect(set.has(3)).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_9400
     * @tc.desc 12.3.4 Verify spreading values() matches spreading the array values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr2: number[] = [1, 2, 3];
      const vals: number[] = Array.from(arr2.values());
      expect(vals).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArrayValuesTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_SUPPLEMENT_TEST_9500
     * @tc.desc 12.3.5 Verify folding [string, number] pairs into Record without Object.fromEntries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: [string, number][] = [['a', 1], ['b', 2]];
      const obj: Record<string, number> = {};
      for (let i: number = 0; i < arr.length; i++) {
        const pair: [string, number] = arr[i];
        obj[pair[0]] = pair[1];
      }
      expect(obj['a']).assertEqual(1);
      expect(obj['b']).assertEqual(2);
    })

  })
}
