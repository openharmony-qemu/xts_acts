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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';


class MyIterator1<T> implements IterableIterator<T> {
  private items: T[];
  private index: int = 0;
  constructor(items: T[]) {
    this.items = items;
  }
  next(): IteratorResult<T> {
    if (this.index < this.items.length) {
      return new IteratorResult<T>(this.items[this.index++]);
    }
    return new IteratorResult<T>();
  }
  $_iterator(): IterableIterator<T> {
    return this;
  }
}

class ThrowIterator1 implements IterableIterator<number> {
  next(): IteratorResult<number> {
    throw new Error("next error");
  }
  $_iterator(): IterableIterator<number> {
    return this;
  }
}

class ThrowIterator2_1 implements IterableIterator<number> {
  next(): IteratorResult<number> {
    return new IteratorResult<number>(1);
  }
  $_iterator(): IterableIterator<number> {
    throw new Error("iterator error");
  }
}

class Animal1 {
  name: string = "animal";
}

class Dog1 extends Animal1 {
  breed: string = "dog";
}

interface ObjName {
  name: string;
}

class ArrayIterableIterator<T> implements IterableIterator<T> {
  private items: T[];
  private idx: int = 0;
  constructor(items: T[]) { this.items = items; }
  next(): IteratorResult<T> {
    if (this.idx < this.items.length) {
      let i: int = this.idx;
      this.idx = this.idx + 1;
      return new IteratorResult<T>(this.items[i]);
    }
    return new IteratorResult<T>();
  }
  $_iterator(): IterableIterator<T> { return this; }
}

export default function IterableIteratorTest(): void {
  describe('IterableIteratorTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async():Promise<void> =>{
      await Utils.msSleep(30);
    });
    afterEach(():void =>{
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_0100
     * @tc.name testIterableIterator001
     * @tc.desc Verify next() with no arguments returns correct IteratorResult
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2, 3]);
      let result: IteratorResult<number> = iter.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_0200
     * @tc.name testIterableIterator002
     * @tc.desc Verify $_iterator() with no arguments returns IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2, 3]);
      let result: IterableIterator<number> = iter.$_iterator();
      let next: IteratorResult<number> = result.next();
      expect(next.done).assertFalse();
      expect(next.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_0300
     * @tc.name testIterableIterator003
     * @tc.desc Verify $_iterator() accepts only the valid no-argument call form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2]);
      let firstFromOrigin: IteratorResult<number> = iter.next();
      expect(firstFromOrigin.done).assertFalse();
      expect(firstFromOrigin.value).assertEqual(1);
      let same: IterableIterator<number> = iter.$_iterator();
      let r: IteratorResult<number> = same.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(2);
      expect(same.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_0400
     * @tc.name testIterableIterator004
     * @tc.desc Verify next() returns IteratorResult with value and done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<string> = new ArrayIterableIterator<string>(["a", "b"]);
      let result: IteratorResult<string> = iter.next();
      expect(result.value).assertEqual("a");
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_0500
     * @tc.name testIterableIterator005
     * @tc.desc Verify next() returns string value when T is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<string> = new ArrayIterableIterator<string>(["hello", "world"]);
      let result: IteratorResult<string> = iter.next();
      let val: string = result.value as string;
      expect(val).assertEqual("hello");
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_0600
     * @tc.name testIterableIterator006
     * @tc.desc Verify next() returns number value when T is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2, 3]);
      let result: IteratorResult<number> = iter.next();
      let val: number = result.value as number;
      expect(val).assertEqual(1);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_0700
     * @tc.name testIterableIterator007
     * @tc.desc Verify next() returns boolean value when T is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<boolean> = new ArrayIterableIterator<boolean>([true, false]);
      let result: IteratorResult<boolean> = iter.next();
      let val: boolean = result.value as boolean;
      expect(val).assertTrue();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_0800
     * @tc.name testIterableIterator008
     * @tc.desc Verify next() returns object value when T is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objArr: Object[] = [{ name: "a" } as ObjName, { name: "b" } as ObjName];
      let iter: IterableIterator<Object> = new ArrayIterableIterator<Object>(objArr);
      let result: IteratorResult<Object> = iter.next();
      let val: Object = result.value as Object;
      expect(val !== null).assertTrue();
      expect((val as ObjName).name).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_0900
     * @tc.name testIterableIterator009
     * @tc.desc Verify next() returns array value when T is array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrArr: number[][] = [[1, 2], [3, 4]];
      let iter: IterableIterator<number[]> = new ArrayIterableIterator<number[]>(arrArr);
      let result: IteratorResult<number[]> = iter.next();
      let val: number[] = result.value as number[];
      expect(val.length).assertEqual(2);
      expect(val[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_1000
     * @tc.name testIterableIterator010
     * @tc.desc Verify consecutive next() calls iterate through elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([10, 20, 30]);
      let r1: IteratorResult<number> = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual(10);
      let r2: IteratorResult<number> = iter.next();
      expect(r2.done).assertFalse();
      expect(r2.value).assertEqual(20);
      let r3: IteratorResult<number> = iter.next();
      expect(r3.done).assertFalse();
      expect(r3.value).assertEqual(30);
      let r4: IteratorResult<number> = iter.next();
      expect(r4.done).assertTrue();
      expect(r4.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_1100
     * @tc.name testIterableIterator011
     * @tc.desc Verify iteration complete returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1]);
      iter.next();
      let fin: IteratorResult<number> = iter.next();
      expect(fin.done).assertTrue();
      expect(fin.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_1200
     * @tc.name testIterableIterator012
     * @tc.desc Verify $_iterator() result can continue iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2, 3]);
      let sameIter: IterableIterator<number> = iter.$_iterator();
      let result: IteratorResult<number> = sameIter.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_1300
     * @tc.name testIterableIterator013
     * @tc.desc Verify $_iterator() result has next() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<string> = new ArrayIterableIterator<string>(["x", "y"]);
      let sameIter: IterableIterator<string> = iter.$_iterator();
      let r: IteratorResult<string> = sameIter.next();
      expect(r.value).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_1400
     * @tc.name testIterableIterator014
     * @tc.desc Verify chained $_iterator() returns same iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2, 3]);
      let chain: IterableIterator<number> = iter.$_iterator().$_iterator();
      let isSame: boolean = (chain === iter);
      expect(isSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_1500
     * @tc.name testIterableIterator015
     * @tc.desc Verify IterableIterator works with for...of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([10, 20, 30]);
      let values: number[] = [];
      for (let item of iter) {
        values.push(item);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(10);
      expect(values[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_1600
     * @tc.name testIterableIterator016
     * @tc.desc Verify empty iterator returns done=true immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([]);
      let result: IteratorResult<number> = iter.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_1700
     * @tc.name testIterableIterator017
     * @tc.desc Verify single element iterator returns element then done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<string> = new ArrayIterableIterator<string>(["only"]);
      let r1: IteratorResult<string> = iter.next();
      expect(r1.value).assertEqual("only");
      expect(r1.done).assertFalse();
      let r2: IteratorResult<string> = iter.next();
      expect(r2.value).assertUndefined();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_1800
     * @tc.name testIterableIterator018
     * @tc.desc Verify iterator with undefined element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number | undefined> = new ArrayIterableIterator<number|undefined>([undefined]);
      let result: IteratorResult<number | undefined> = iter.next();
      expect(result.value).assertUndefined();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_1900
     * @tc.name testIterableIterator019
     * @tc.desc Verify iterator with null element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<string | null> = new ArrayIterableIterator<string|null>([null]);
      let result: IteratorResult<string | null> = iter.next();
      expect(result.value).assertEqual(null);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_2000
     * @tc.name testIterableIterator020
     * @tc.desc Verify IterableIterator can be assigned to Iterator variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2, 3]);
      let iterator: Iterator<number> = iter;
      let result: IteratorResult<number> = iterator.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_2100
     * @tc.name testIterableIterator021
     * @tc.desc Verify IterableIterator can be assigned to Iterable variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2, 3]);
      let iterable: Iterable<number> = iter;
      let sameIter: Iterator<number> = iterable.$_iterator();
      expect(sameIter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_2200
     * @tc.name testIterableIterator022
     * @tc.desc Verify large iterator with 10000 elements completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigArr: number[] = [];
      for (let i: number = 0; i < 10000; i++) {
        bigArr.push(i);
      }
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>(bigArr);
      let count: number = 0;
      let r: IteratorResult<number> = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_2300
     * @tc.name testIterableIterator023
     * @tc.desc Verify nested IterableIterator<Iterator<number>>: outer next() yields the
     *          original inner iterator instance, whose next() advances independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it1: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2]);
      let it2: IterableIterator<number> = new ArrayIterableIterator<number>([3, 4]);
      let nested: Iterator<number>[] = [it1, it2];
      let iter: IterableIterator<Iterator<number>> = new ArrayIterableIterator<Iterator<number>>(nested);
      let pre1 = it1.next();
      expect(pre1.done).assertFalse();
      expect(pre1.value).assertEqual(1);
      let r1: IteratorResult<Iterator<number>> = iter.next();
      expect(r1.done).assertFalse();
      let r1Val: Iterator<number> | undefined = r1.value;
      expect(r1Val!.next().value).assertEqual(2);
      expect(r1Val!.next().done).assertTrue();
      let r2: IteratorResult<Iterator<number>> = iter.next();
      expect(r2.done).assertFalse();
      let r2Val: Iterator<number> | undefined = r2.value;
      expect(r2Val!.next().value).assertEqual(3);
      expect(r2Val!.next().value).assertEqual(4);
      expect(r2Val!.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_2400
     * @tc.name testIterableIterator024
     * @tc.desc Verify next() throwing Error can be caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ThrowIterator1();
      try {
        iter.next();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.name).assertEqual("next error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_2500
     * @tc.name testIterableIterator025
     * @tc.desc Verify $_iterator() throwing Error can be caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ThrowIterator2_1();
      try {
        iter.$_iterator();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.name).assertEqual("iterator error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_2600
     * @tc.name testIterableIterator026
     * @tc.desc Verify IterableIterator has $_iterator from Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2]);
      let result: IterableIterator<number> = iter.$_iterator();
      let r1: IteratorResult<number> = result.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual(1);
      let chained: IterableIterator<number> = result.$_iterator();
      let r2: IteratorResult<number> = chained.next();
      expect(r2.done).assertFalse();
      expect(r2.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_2700
     * @tc.name testIterableIterator027
     * @tc.desc Verify IterableIterator used as Iterator via assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([10, 20]);
      let asIterator: Iterator<number> = iter;
      let r1: IteratorResult<number> = asIterator.next();
      let r2: IteratorResult<number> = asIterator.next();
      expect(r1.value).assertEqual(10);
      expect(r2.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_2800
     * @tc.name testIterableIterator028
     * @tc.desc Verify IterableIterator used as Iterable via assignment for for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<string> = new ArrayIterableIterator<string>(["a", "b", "c"]);
      let asIterable: Iterable<string> = iter;
      let collected: string[] = [];
      for (let item of asIterable) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_2900
     * @tc.name testIterableIterator029
     * @tc.desc Verify Iterable can get iterator from IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([1, 2]);
      let asIterable: Iterable<number> = iter;
      let newIter: Iterator<number> = asIterable.$_iterator();
      expect(newIter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_3000
     * @tc.name testIterableIterator030
     * @tc.desc Verify IterableIterator<Dog1> covariant-assigned to IterableIterator<Animal1>
     *          still yields runtime Dog1 instances (breed field preserved) via next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dogIter: IterableIterator<Dog1> = new ArrayIterableIterator<Dog1>([new Dog1(), new Dog1()]);
      let animalIter: IterableIterator<Animal1> = dogIter;
      let result: IteratorResult<Animal1> = animalIter.next();
      expect(result.done).assertFalse();
      let val: Animal1 | undefined = result.value;
      expect(val instanceof Dog1).assertTrue();
      expect((val as Dog1).breed).assertEqual("dog");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_3100
     * @tc.name testIterableIterator031
     * @tc.desc Verify IterableIterator<Dog1> covariant-assigned to IterableIterator<Animal1>
     *          with single-element source: first next() yields runtime Dog1, second next()
     *          reports done=true with undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dogIter: IterableIterator<Dog1> = new ArrayIterableIterator<Dog1>([new Dog1()]);
      let animalIter: IterableIterator<Animal1> = dogIter;

      let r1: IteratorResult<Animal1> = animalIter.next();
      expect(r1.done).assertFalse();
      let v1: Animal1 | undefined = r1.value;
      expect(v1 instanceof Dog1).assertTrue();
      expect((v1 as Dog1).breed).assertEqual("dog");

      let r2: IteratorResult<Animal1> = animalIter.next();
      expect(r2.done).assertTrue();
      expect(r2.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_3200
     * @tc.name testIterableIterator032
     * @tc.desc Verify after covariant assignment, $_iterator() returns the same underlying
     *          iterator instance (state shared, not reset); subsequent next() continues the
     *          sequence and yields runtime Dog1 instances readable via Animal1 reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dogIter: IterableIterator<Dog1> = new ArrayIterableIterator<Dog1>([new Dog1(), new Dog1()]);
      let animalIter: IterableIterator<Animal1> = dogIter;

      let pre: IteratorResult<Animal1> = animalIter.next();
      expect(pre.done).assertFalse();

      let sameIter: IterableIterator<Animal1> = animalIter.$_iterator();

      let r2: IteratorResult<Animal1> = sameIter.next();
      expect(r2.done).assertFalse();
      let v2: Animal1 | undefined = r2.value;
      expect(v2 instanceof Dog1).assertTrue();
      expect((v2 as Dog1).breed).assertEqual("dog");

      let r3: IteratorResult<Animal1> = sameIter.next();
      expect(r3.done).assertTrue();
      expect(r3.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_3300
     * @tc.name testIterableIterator033
     * @tc.desc Verify covariance: works with for...of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dogIter: IterableIterator<Dog1> = new ArrayIterableIterator<Dog1>([new Dog1()]);
      let animalIter: IterableIterator<Animal1> = dogIter;
      for (let item of animalIter) {
        let a: Animal1 = item;
        expect(a.name).assertEqual("animal");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_ITERATOR_3400
     * @tc.name testIterableIterator034
     * @tc.desc Verify next() is idempotent after iteration completes (done=true sticks; value remains undefined on subsequent calls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterableIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<number> = new ArrayIterableIterator<number>([10, 20]);
      let r1: IteratorResult<number> = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual(10);
      let r2: IteratorResult<number> = iter.next();
      expect(r2.done).assertFalse();
      expect(r2.value).assertEqual(20);
      let rDone: IteratorResult<number> = iter.next();
      expect(rDone.done).assertTrue();
      expect(rDone.value === undefined).assertTrue();
      for (let k: int = 0; k < 5; k++) {
        let again: IteratorResult<number> = iter.next();
        expect(again.done).assertTrue();
        expect(again.value === undefined).assertTrue();
      }
    });
  });
}
