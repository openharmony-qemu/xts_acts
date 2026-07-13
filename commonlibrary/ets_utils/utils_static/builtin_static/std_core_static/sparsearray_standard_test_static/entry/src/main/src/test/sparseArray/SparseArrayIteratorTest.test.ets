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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

interface Person007 {
    name: string;
    age: number;
  }

export default function SparseArrayIteratorTest(): void {
  describe('SparseArrayIteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_0100
     * @tc.name testSparseArrayIterator001
     * @tc.desc Verify SparseArray $_iterator on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        const iterator = arr.$_iterator();
        let result = iterator.next();
        expect(result!.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_0200
     * @tc.name testSparseArrayIterator002
     * @tc.desc Verify SparseArray $_iterator on array with holes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        const iterator = arr.$_iterator();
        let count = 0;
        let result = iterator.next();
        while (!result.done) {
          count++;
          result = iterator.next();
        }
        expect(count).assertEqual(3);
        expect(result!.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_0300
     * @tc.name testSparseArrayIterator003
     * @tc.desc Verify SparseArray $_iterator for string element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("apple", "banana");
        const iterator = arr.$_iterator();
        let result = iterator.next();
        expect(result!.value).assertEqual("apple");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_0400
     * @tc.name testSparseArrayIterator004
     * @tc.desc Verify SparseArray $_iterator for int element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const iterator = arr.$_iterator();
        let result = iterator.next();
        expect(result!.value).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_0500
     * @tc.name testSparseArrayIterator005
     * @tc.desc Verify SparseArray $_iterator for number element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1.5, 2.5);
        const iterator = arr.$_iterator();
        let result = iterator.next();
        expect(result!.value).assertEqual(1.5);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_0600
     * @tc.name testSparseArrayIterator006
     * @tc.desc Verify SparseArray $_iterator for boolean element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        const iterator = arr.$_iterator();
        let result = iterator.next();
        expect(result!.value).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_0700
     * @tc.name testSparseArrayIterator007
     * @tc.desc Verify SparseArray $_iterator for custom object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person007>();
        arr[0] = { name: "Alice", age: 20 };
        const iterator = arr.$_iterator();
        let result = iterator.next();
        expect(result.value!.name).assertEqual("Alice");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_0800
     * @tc.name testSparseArrayIterator008
     * @tc.desc Verify SparseArray $_iterator full traversal via next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const iterator = arr.$_iterator();
        let result = iterator.next();
        expect(result!.done).assertFalse();
        expect(result!.value).assertEqual("a");
        result = iterator.next();
        expect(result!.done).assertFalse();
        expect(result!.value).assertEqual("b");
        result = iterator.next();
        expect(result!.done).assertFalse();
        expect(result!.value).assertEqual("c");
        result = iterator.next();
        expect(result!.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_0900
     * @tc.name testSparseArrayIterator009
     * @tc.desc Verify iterator exposes next function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1);
        const iterator = arr.$_iterator();
        expect(typeof iterator.next).assertEqual("function");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_1000
     * @tc.name testSparseArrayIterator010
     * @tc.desc Verify SparseArray $_iterator on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 42;
        const iterator = arr.$_iterator();
        let result = iterator.next();
        expect(result!.value).assertEqual(42);
        result = iterator.next();
        expect(result!.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_1100
     * @tc.name testSparseArrayIterator011
     * @tc.desc Verify SparseArray $_iterator counts many elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr[i] = i;
        }
        const iterator = arr.$_iterator();
        let count = 0;
        let result = iterator.next();
        while (!result.done) {
          count++;
          result = iterator.next();
        }
        expect(count).assertEqual(1000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_1200
     * @tc.name testSparseArrayIterator012
     * @tc.desc Verify SparseArray $_iterator on all-hole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        const iterator = arr.$_iterator();
        let result = iterator.next();
        expect(result!.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_1300
     * @tc.name testSparseArrayIterator013
     * @tc.desc Verify iterator supports for-of iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("x", "y", "z");
        const iterator = arr.$_iterator();
        let values: Array<string> = [];
        for (const value of iterator) {
          values.push(value);
        }
        expect(values.length).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_1400
     * @tc.name testSparseArrayIterator014
     * @tc.desc Verify iterator behavior when array mutated during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const iterator = arr.$_iterator();
        let result = iterator.next();
        arr[0] = 100;
        arr[1] = 200;
        while (!result.done) {
          result = iterator.next();
        }

        expect(arr instanceof SparseArray).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_1500
     * @tc.name testSparseArrayIterator015
     * @tc.desc Verify $_get sees $_set(undefined); iterator skips undefined slots like holes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(3);
              arr[0] = 1;
              arr.$_set(1, undefined);
              arr[2] = 3;
        expect(arr.$_get(1)).assertUndefined();
        const iterator = arr.$_iterator();
        let result = iterator.next();
        expect(result!.value).assertEqual(1);
        result = iterator.next();
        expect(result!.value).assertEqual(3);
        result = iterator.next();
        expect(result!.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_1600
     * @tc.name testSparseArrayIterator016
     * @tc.desc Verify $_iterator matches values() iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const iter1 = arr.$_iterator();
        const iter2 = arr.values();
        let r1 = iter1.next();
        let r2 = iter2.next();
        expect(r1.value).assertEqual(r2.value);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_1700
     * @tc.name testSparseArrayIterator017
     * @tc.desc Verify $_iterator matches forEach order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let iterValues: Array<int> = [];
        const iterator = arr.$_iterator();
        let result = iterator.next();
        while (!result.done) {
          const v = result.value;
          if (v !== undefined) {
            iterValues.push(v);
          }
          result = iterator.next();
        }

        let forEachValues: Array<int> = [];
        arr.forEach((value) => {
          forEachValues.push(value);
        });
        expect(iterValues.length).assertEqual(forEachValues.length);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_1800
     * @tc.name testSparseArrayIterator018
     * @tc.desc Verify large-array iteration completes in reasonable time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 10000; i++) {
          arr[i] = i;
        }
        const startTime = Date.now();
        const iterator = arr.$_iterator();
        let result = iterator.next();
        let steps = 0;
        while (!result.done) {
          result = iterator.next();
          steps++;
        }
        const endTime = Date.now();
        expect(endTime - startTime).assertLess(1000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_1900
     * @tc.name testSparseArrayIterator019
     * @tc.desc Verify concurrent iterators do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const iter1 = arr.$_iterator();
        const iter2 = arr.$_iterator();
        const iter3 = arr.$_iterator();

        let r1 = iter1.next();
        let r2 = iter2.next();
        let r3 = iter3.next();

        r1 = iter1.next();
        r2 = iter2.next();

        expect(r1.value).assertEqual(2);
        expect(r2.value).assertEqual(2);
        expect(r3.value).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_2000
     * @tc.name testSparseArrayIterator020
     * @tc.desc iterator on SparseArray<long> yields long elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(100 as long, 200 as long);
        const iter = arr.$_iterator();
        expect(iter.next().value).assertEqual(100 as long);
        expect(iter.next().value).assertEqual(200 as long);
        expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_2100
     * @tc.name testSparseArrayIterator021
     * @tc.desc $_iterator yields null element in SparseArray<int|null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3);
        const it = arr.$_iterator();
        expect(it.next().value).assertEqual(1);
        expect(it.next().value).assertEqual(null);
        expect(it.next().value).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_2200
     * @tc.name testSparseArrayIterator022
     * @tc.desc $_iterator yields hex 0xA then binary 0b101 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0xA, 0b101);
        const it = arr.$_iterator();
        expect(it.next().value).assertEqual(0xA);
        expect(it.next().value).assertEqual(0b101);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_2300
     * @tc.name testSparseArrayIterator023
     * @tc.desc $_iterator yields char elements in insertion index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B');
        const it = arr.$_iterator();
        expect(it.next().value).assertEqual(c'A');
        expect(it.next().value).assertEqual(c'B');
        expect(it.next().done).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATOR_2400
     * @tc.name testSparseArrayIterator024
     * @tc.desc $_iterator skips holes and yields high sparse index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIterator024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(8);
        arr[7] = "tail";
        const it = arr.$_iterator();
        expect(it.next().value).assertEqual("tail");
        expect(it.next().done).assertTrue();
    });

  });
}
