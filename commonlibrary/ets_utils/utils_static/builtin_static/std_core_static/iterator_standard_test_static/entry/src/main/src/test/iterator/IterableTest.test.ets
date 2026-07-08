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
import Utils from './../Util.test';


class IterableInnerIter1<T> implements IterableIterator<T> {
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

class HugeInnerIter1 implements IterableIterator<number> {
  private index: int = 0;
  private size: number;
  constructor(size: number) {
    this.size = size;
  }
  next(): IteratorResult<number> {
    if (this.index < this.size) {
      return new IteratorResult<number>(this.index++);
    }
    return new IteratorResult<number>();
  }
  $_iterator(): IterableIterator<number> {
    return this;
  }
}

class EmptyStringIter1 implements IterableIterator<string> {
  next(): IteratorResult<string> {
    return new IteratorResult<string>();
  }
  $_iterator(): IterableIterator<string> {
    return this;
  }
}

class NextThrowInnerIter1 implements IterableIterator<number> {
  private index: int = 0;
  private failAt: number;
  constructor(failAt: number) {
    this.failAt = failAt;
  }
  next(): IteratorResult<number> {
    if (this.index === this.failAt) {
      throw new Error('Fail at index ' + this.failAt.toString());
    }
    if (this.index < 3) {
      return new IteratorResult<number>(this.index++);
    }
    return new IteratorResult<number>();
  }
  $_iterator(): IterableIterator<number> {
    return this;
  }
}

class ReverseInnerIter1 implements IterableIterator<string> {
  private index: int;
  private data: string[];
  constructor(data: string[]) {
    this.data = data;
    this.index = data.length - 1;
  }
  next(): IteratorResult<string> {
    if (this.index >= 0) {
      return new IteratorResult<string>(this.data[this.index--]);
    }
    return new IteratorResult<string>();
  }
  $_iterator(): IterableIterator<string> {
    return this;
  }
}


function collectAll<T>(iterable: Iterable<T>): T[] {
  let result: T[] = [];
  let iter = iterable.$_iterator();
  let r = iter.next();
  while (!r.done) {
    result.push(r.value as T);
    r = iter.next();
  }
  return result;
}


class StringIterable1 implements Iterable<string> {
  private items: string[] = ['a', 'b', 'c'];
  $_iterator(): IterableIterator<string> {
    return new IterableInnerIter1<string>(this.items);
  }
}

class NumberIterable1 implements Iterable<number> {
  private items: number[] = [1, 2, 3];
  $_iterator(): IterableIterator<number> {
    return new IterableInnerIter1<number>(this.items);
  }
}

class SimpleIterable1 implements Iterable<number> {
  private items: number[] = [10, 20, 30];
  $_iterator(): IterableIterator<number> {
    return new IterableInnerIter1<number>(this.items);
  }
}

class StringCollection1 implements Iterable<string> {
  private data: string[] = ['hello', 'world', 'test'];
  $_iterator(): IterableIterator<string> {
    return new IterableInnerIter1<string>(this.data);
  }
}

class NumberCollection1 implements Iterable<number> {
  private data: number[] = [100, 200, 300];
  $_iterator(): IterableIterator<number> {
    return new IterableInnerIter1<number>(this.data);
  }
}

class BooleanCollection1 implements Iterable<boolean> {
  private data: boolean[] = [true, false, true];
  $_iterator(): IterableIterator<boolean> {
    return new IterableInnerIter1<boolean>(this.data);
  }
}

interface Item1 {
  id: number;
  name: string;
}

class ObjectCollection1 implements Iterable<Item1> {
  private data: Item1[] = [
    { id: 1, name: 'item1' },
    { id: 2, name: 'item2' }
  ];
  $_iterator(): IterableIterator<Item1> {
    return new IterableInnerIter1<Item1>(this.data);
  }
}

class ArrayCollection1 implements Iterable<number[]> {
  private data: number[][] = [[1, 2], [3, 4], [5, 6]];
  $_iterator(): IterableIterator<number[]> {
    return new IterableInnerIter1<number[]>(this.data);
  }
}

class MultiIterable1 implements Iterable<string> {
  private items: string[] = ['x', 'y', 'z'];
  $_iterator(): IterableIterator<string> {
    return new IterableInnerIter1<string>(this.items);
  }
}

class StepIterable1 implements Iterable<number> {
  private items: number[] = [5, 10, 15];
  $_iterator(): IterableIterator<number> {
    return new IterableInnerIter1<number>(this.items);
  }
}

class EmptyIterable1 implements Iterable<string> {
  private items: string[] = [];
  $_iterator(): IterableIterator<string> {
    return new IterableInnerIter1<string>(this.items);
  }
}

class SingleIterable1 implements Iterable<number> {
  private items: number[] = [42];
  $_iterator(): IterableIterator<number> {
    return new IterableInnerIter1<number>(this.items);
  }
}

class LargeIterable1 implements Iterable<number> {
  private items: number[];
  constructor() {
    this.items = [];
    for (let i: number = 0; i < 10000; i++) {
      this.items.push(i);
    }
  }
  $_iterator(): IterableIterator<number> {
    return new IterableInnerIter1<number>(this.items);
  }
}

class TypeCheckIterable1 implements Iterable<string> {
  private items: string[] = ['a', 'b'];
  $_iterator(): IterableIterator<string> {
    return new IterableInnerIter1<string>(this.items);
  }
}

class DualIterable1 implements Iterable<number> {
  private items: number[] = [1, 2, 3];
  $_iterator(): IterableIterator<number> {
    return new IterableInnerIter1<number>(this.items);
  }
}

class ResultIterable1 implements Iterable<string> {
  private items: string[] = ['test'];
  $_iterator(): IterableIterator<string> {
    return new IterableInnerIter1<string>(this.items);
  }
}

class HugeIterable1 implements Iterable<number> {
  private size: number = 100000;
  $_iterator(): IterableIterator<number> {
    return new HugeInnerIter1(this.size);
  }
}

class InnerIterable1 implements Iterable<number> {
  private items: number[];
  constructor(items: number[]) {
    this.items = items;
  }
  $_iterator(): IterableIterator<number> {
    return new IterableInnerIter1<number>(this.items);
  }
}

class OuterIterable1 implements Iterable<Iterable<number>> {
  private data: Iterable<number>[];
  constructor() {
    this.data = [
      new InnerIterable1([1, 2]) as Iterable<number>,
      new InnerIterable1([3, 4]) as Iterable<number>,
    ];
  }
  $_iterator(): IterableIterator<Iterable<number>> {
    return new IterableInnerIter1<Iterable<number>>(this.data);
  }
}

class ThrowingIterable1 implements Iterable<string> {
  private shouldThrow: boolean;
  constructor(shouldThrow: boolean) {
    this.shouldThrow = shouldThrow;
  }
  $_iterator(): IterableIterator<string> {
    if (this.shouldThrow) {
      throw new Error('Iterator creation failed');
    }
    return new EmptyStringIter1();
  }
}

class NextThrowIterable1 implements Iterable<number> {
  private failAt: number;
  constructor(failAt: number) {
    this.failAt = failAt;
  }
  $_iterator(): IterableIterator<number> {
    return new NextThrowInnerIter1(this.failAt);
  }
}

class NumberList1 implements Iterable<number> {
  private items: number[];
  constructor(items: number[]) {
    this.items = items;
  }
  $_iterator(): IterableIterator<number> {
    return new IterableInnerIter1<number>(this.items);
  }
}

interface DataSource1 extends Iterable<string> {}

class ArraySource1 implements DataSource1 {
  private data: string[];
  constructor(data: string[]) {
    this.data = data;
  }
  $_iterator(): IterableIterator<string> {
    return new IterableInnerIter1<string>(this.data);
  }
}

class ReverseSource1 implements DataSource1 {
  private data: string[];
  constructor(data: string[]) {
    this.data = data;
  }
  $_iterator(): IterableIterator<string> {
    return new ReverseInnerIter1(this.data);
  }
}

class ColorIterable1 implements Iterable<string> {
  private colors: string[] = ['red', 'green', 'blue'];
  $_iterator(): IterableIterator<string> {
    return new IterableInnerIter1<string>(this.colors);
  }
}

class CharIterable1 implements Iterable<string> {
  private chars: string[] = ['A', 'B', 'C'];
  $_iterator(): IterableIterator<string> {
    return new IterableInnerIter1<string>(this.chars);
  }
}

interface Pair1 {
  key: string;
  value: number;
}

class PairIterable1 implements Iterable<Pair1> {
  private pairs: Pair1[] = [
    { key: 'a', value: 1 },
    { key: 'b', value: 2 }
  ];
  $_iterator(): IterableIterator<Pair1> {
    return new IterableInnerIter1<Pair1>(this.pairs);
  }
}

class Animal2 {
  name: string = 'animal';
}

class Dog2 extends Animal2 {
  breed: string = 'labrador';
}

class DogIterable1 implements Iterable<Dog2> {
  private dogs: Dog2[] = [new Dog2(), new Dog2()];
  $_iterator(): IterableIterator<Dog2> {
    return new IterableInnerIter1<Dog2>(this.dogs);
  }
}

export default function IterableTest(): void {
  describe('IterableTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_0100
     * @tc.name testIterable001
     * @tc.desc Verify $_iterator() returns IterableIterator with next() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SimpleIterable1();
      let iter = iterable.$_iterator();
      let r1 = iter.next();
      expect(r1.value).assertEqual(10);
      expect(r1.done).assertFalse();
      let r2 = iter.next();
      expect(r2.value).assertEqual(20);
      let r3 = iter.next();
      expect(r3.value).assertEqual(30);
      let r4 = iter.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_0200
     * @tc.name testIterable002
     * @tc.desc Verify T=string returns string values from iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let col = new StringCollection1();
      let iter = col.$_iterator();
      expect(iter.next().value).assertEqual('hello');
      expect(iter.next().value).assertEqual('world');
      expect(iter.next().value).assertEqual('test');
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_0300
     * @tc.name testIterable003
     * @tc.desc Verify T=number returns number values from iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let col = new NumberCollection1();
      let iter = col.$_iterator();
      expect(iter.next().value).assertEqual(100);
      expect(iter.next().value).assertEqual(200);
      expect(iter.next().value).assertEqual(300);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_0400
     * @tc.name testIterable004
     * @tc.desc Verify T=boolean returns boolean values from iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let col = new BooleanCollection1();
      let iter = col.$_iterator();
      expect(iter.next().value).assertTrue();
      expect(iter.next().value).assertFalse();
      expect(iter.next().value).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_0500
     * @tc.name testIterable005
     * @tc.desc Verify Iterable<Item1>.$_iterator() yields each Item1 in declared order
     *          with id/name preserved, and reports done=true with undefined value
     *          after the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let col: ObjectCollection1 = new ObjectCollection1();
      let iter: IterableIterator<Item1> = col.$_iterator();

      let first: IteratorResult<Item1> = iter.next();
      expect(first.done).assertFalse();
      let firstVal: Item1 | undefined = first.value;
      expect(firstVal!.id).assertEqual(1);
      expect(firstVal!.name).assertEqual('item1');

      let second: IteratorResult<Item1> = iter.next();
      expect(second.done).assertFalse();
      let secondVal: Item1 | undefined = second.value;
      expect(secondVal!.id).assertEqual(2);
      expect(secondVal!.name).assertEqual('item2');

      let third: IteratorResult<Item1> = iter.next();
      expect(third.done).assertTrue();
      expect(third.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_0600
     * @tc.name testIterable006
     * @tc.desc Verify T=array returns array values from iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let col = new ArrayCollection1();
      let iter = col.$_iterator();
      let first = iter.next();
      expect(first.done).assertFalse();
      let firstVal = first.value;
      expect(firstVal![0]).assertEqual(1);
      expect(firstVal![1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_0700
     * @tc.name testIterable007
     * @tc.desc Verify multiple $_iterator() calls return independent iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new MultiIterable1();
      let iter1 = iterable.$_iterator();
      let iter2 = iterable.$_iterator();
      expect(iter1.next().value).assertEqual('x');
      expect(iter1.next().value).assertEqual('y');
      expect(iter2.next().value).assertEqual('x');
      expect(iter1.next().value).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_0800
     * @tc.name testIterable008
     * @tc.desc Verify iterator next() returns correct elements and done status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new StepIterable1();
      let iter = iterable.$_iterator();
      let r1 = iter.next();
      expect(r1.value).assertEqual(5);
      expect(r1.done).assertFalse();
      let r2 = iter.next();
      expect(r2.value).assertEqual(10);
      expect(r2.done).assertFalse();
      let r3 = iter.next();
      expect(r3.value).assertEqual(15);
      expect(r3.done).assertFalse();
      let r4 = iter.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_0900
     * @tc.name testIterable009
     * @tc.desc Verify empty iterable returns done=true immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty = new EmptyIterable1();
      let iter = empty.$_iterator();
      let result = iter.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_1000
     * @tc.name testIterable010
     * @tc.desc Verify single element iterable returns element then done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let single = new SingleIterable1();
      let iter = single.$_iterator();
      let r1 = iter.next();
      expect(r1.value).assertEqual(42);
      expect(r1.done).assertFalse();
      let r2 = iter.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_1100
     * @tc.name testIterable011
     * @tc.desc Verify large iterable with 10000 elements completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large = new LargeIterable1();
      let iter = large.$_iterator();
      let count: number = 0;
      let lastValue: number = -1;
      let r = iter.next();
      while (!r.done) {
        lastValue = r.value!;
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(10000);
      expect(lastValue).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_1200
     * @tc.name testIterable012
     * @tc.desc Verify $_iterator() returns object with next and $_iterator() methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new TypeCheckIterable1();
      let iter = iterable.$_iterator();
      expect(typeof (iter as Iterator<string>).next === 'function').assertTrue();
      let nextResult = iter.next();
      expect(nextResult.value).assertEqual('a');
      expect(nextResult.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_1300
     * @tc.name testIterable013
     * @tc.desc Verify IterableIterator satisfies both Iterator and Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dual = new DualIterable1();
      let iter = dual.$_iterator();
      expect(typeof (iter as Iterator<number>).next === 'function').assertTrue();
      expect(typeof (iter as Iterable<number>).$_iterator === 'function').assertTrue();
      let pre = iter.next();
      expect(pre.done).assertFalse();
      expect(pre.value).assertEqual(1);
      let sameIter = iter.$_iterator();
      let r2 = sameIter.next();
      expect(r2.done).assertFalse();
      expect(r2.value).assertEqual(2);
      let r3 = sameIter.next();
      expect(r3.done).assertFalse();
      expect(r3.value).assertEqual(3);
      let r4 = sameIter.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_1400
     * @tc.name testIterable014
     * @tc.desc Verify next() returns IteratorResult with value and done properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new ResultIterable1();
      let iter = iterable.$_iterator();
      let r1: IteratorResult<string> = iter.next();
      expect(r1.done === false).assertTrue();
      expect(typeof r1.value === 'string').assertTrue();
      expect(r1.value === 'test').assertTrue();
      let r2: IteratorResult<string> = iter.next();
      expect(r2.done === true).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_1500
     * @tc.name testIterable015
     * @tc.desc Verify huge iterable with 100000 elements completes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let huge = new HugeIterable1();
      let iter = huge.$_iterator();
      let sum: number = 0;
      let count: number = 0;
      let r = iter.next();
      while (!r.done) {
        sum += r.value!;
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(100000);
      expect(sum).assertEqual(4999950000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_1600
     * @tc.name testIterable016
     * @tc.desc Verify nested Iterable iteration works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer = new OuterIterable1();
      let outerIter = outer.$_iterator();
      let outerResult = outerIter.next();
      expect(outerResult.done).assertFalse();
      let outerVal = outerResult.value;
      let innerIter = outerVal!.$_iterator();
      expect(innerIter.next().value).assertEqual(1);
      expect(innerIter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_1700
     * @tc.name testIterable017
     * @tc.desc Verify $_iterator() returns a valid Iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable: Iterable<number> = new NumberList1([1, 2]);
      let iterator: Iterator<number> = iterable.$_iterator();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_1800
     * @tc.name testIterable018
     * @tc.desc Verify $_iterator() throwing Error can be caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let throwing = new ThrowingIterable1(true);
      try {
        let iter = throwing.$_iterator();
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('Iterator creation failed');
      }
      let normal = new ThrowingIterable1(false);
      let iter = normal.$_iterator();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_1900
     * @tc.name testIterable019
     * @tc.desc Verify iterator next() throwing Error can be caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NextThrowIterable1(1);
      let iter = iterable.$_iterator();
      expect(iter.next().value).assertEqual(0);
      try {
        iter.next();
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('Fail at index 1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_2000
     * @tc.name testIterable020
     * @tc.desc Verify class implements Iterable interface correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list = new NumberList1([10, 20, 30]);
      let iter = list.$_iterator();
      expect(iter.next().value).assertEqual(10);
      expect(iter.next().value).assertEqual(20);
      expect(iter.next().value).assertEqual(30);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_2100
     * @tc.name testIterable021
     * @tc.desc Verify multiple classes implementing same Iterable interface with different logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arraySource = new ArraySource1(['a', 'b', 'c']);
      let reverseSource = new ReverseSource1(['a', 'b', 'c']);
      let iter1 = arraySource.$_iterator();
      expect(iter1.next().value).assertEqual('a');
      let iter2 = reverseSource.$_iterator();
      expect(iter2.next().value).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_2200
     * @tc.name testIterable022
     * @tc.desc Verify Iterable interface type reference works with implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable: Iterable<string> = new ColorIterable1();
      let iter = iterable.$_iterator();
      expect(iter.next().value).assertEqual('red');
      expect(iter.next().value).assertEqual('green');
      expect(iter.next().value).assertEqual('blue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_2300
     * @tc.name testIterable023
     * @tc.desc Verify Iterable as function parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let charIter = new CharIterable1();
      let all = collectAll(charIter);
      expect(all.length).assertEqual(3);
      expect(all[0]).assertEqual('A');
      expect(all[2]).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_2400
     * @tc.name testIterable024
     * @tc.desc Verify Iterable.$_iterator() yields a fresh iterator on each call (full sequence + independent restart)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pairIter = new PairIterable1();
      let iter1 = pairIter.$_iterator();
      let r1a = iter1.next();
      expect(r1a.done).assertFalse();
      let v1a = r1a.value;
      expect(v1a!.key).assertEqual('a');
      expect(v1a!.value).assertEqual(1);
      let r1b = iter1.next();
      expect(r1b.done).assertFalse();
      let v1b = r1b.value;
      expect(v1b!.key).assertEqual('b');
      expect(v1b!.value).assertEqual(2);
      expect(iter1.next().done).assertTrue();
      let iter2 = pairIter.$_iterator();
      let r2a = iter2.next();
      expect(r2a.done).assertFalse();
      let v2a = r2a.value;
      expect(v2a!.key).assertEqual('a');
      expect(v2a!.value).assertEqual(1);
      expect(iter1.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_2500
     * @tc.name testIterable025
     * @tc.desc Verify Iterable out covariance: sub type to base type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dogIterable: Iterable<Dog2> = new DogIterable1();
      let animalIterable: Iterable<Animal2> = dogIterable;
      let iter = animalIterable.$_iterator();
      let r = iter.next();
      expect(r.done).assertFalse();
      let v = r.value;
      expect(v!.name).assertEqual('animal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_2600
     * @tc.name testIterable026
     * @tc.desc Verify for-of iterates StringIterable1 in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new StringIterable1();
      let collected: string[] = [];
      for (let v of iterable) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual('a');
      expect(collected[1]).assertEqual('b');
      expect(collected[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_2700
     * @tc.name testIterable027
     * @tc.desc Verify for-of break stops iteration without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberCollection1();
      let collected: number[] = [];
      for (let v of iterable) {
        if (collected.length === 2) {
          break;
        }
        collected.push(v);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(100);
      expect(collected[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_2800
     * @tc.name testIterable028
     * @tc.desc Verify for-of continue skips current element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberIterable1();
      let collected: number[] = [];
      for (let v of iterable) {
        if (v === 2) {
          continue;
        }
        collected.push(v);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_2900
     * @tc.name testIterable029
     * @tc.desc Verify for-of with empty iterable does not enter loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new EmptyIterable1();
      let entered: boolean = false;
      for (let v of iterable) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_3000
     * @tc.name testIterable030
     * @tc.desc Verify for-of with single element runs loop body once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SingleIterable1();
      let collected: number[] = [];
      for (let v of iterable) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(1);
      expect(collected[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_3100
     * @tc.name testIterable031
     * @tc.desc Verify for-of count equals source length for large iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new LargeIterable1();
      let count: number = 0;
      for (let v of iterable) {
        count++;
      }
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_3200
     * @tc.name testIterable032
     * @tc.desc Verify same instance can be iterated by for-of multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new MultiIterable1();
      let firstPass: string[] = [];
      for (let v of iterable) {
        firstPass.push(v);
      }
      let secondPass: string[] = [];
      for (let v of iterable) {
        secondPass.push(v);
      }
      expect(firstPass.length).assertEqual(3);
      expect(secondPass.length).assertEqual(3);
      expect(firstPass[0]).assertEqual('x');
      expect(secondPass[0]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_3300
     * @tc.name testIterable033
     * @tc.desc Verify two iterators produced by $_iterator() advance independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new MultiIterable1();
      let iter1 = iterable.$_iterator();
      let iter2 = iterable.$_iterator();
      expect(iter1 === iter2).assertFalse();
      expect(iter1.next().value).assertEqual('x');
      expect(iter1.next().value).assertEqual('y');
      expect(iter2.next().value).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_3400
     * @tc.name testIterable034
     * @tc.desc Verify $_iterator() result satisfies Iterator<T> structurally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable: Iterable<number> = new SimpleIterable1();
      let iter: Iterator<number> = iterable.$_iterator();
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_3500
     * @tc.name testIterable035
     * @tc.desc Verify IterableIterator returned by $_iterator() also satisfies Iterable<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SimpleIterable1();
      let iter = iterable.$_iterator();
      let asIterable: Iterable<number> = iter;
      let collected: number[] = [];
      for (let v of asIterable) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_3600
     * @tc.name testIterable036
     * @tc.desc Verify exhausted iterator keeps returning done=true on subsequent next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SingleIterable1();
      let iter = iterable.$_iterator();
      iter.next();
      let r2 = iter.next();
      let r3 = iter.next();
      let r4 = iter.next();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_3700
     * @tc.name testIterable037
     * @tc.desc Verify exhausted iterator value is undefined on subsequent next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new EmptyIterable1();
      let iter = iterable.$_iterator();
      let r1 = iter.next();
      let r2 = iter.next();
      expect(r1.value === undefined).assertTrue();
      expect(r2.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_3800
     * @tc.name testIterable038
     * @tc.desc Verify Iterable as function parameter via collectAll preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new ColorIterable1();
      let collected = collectAll<string>(iterable);
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual('red');
      expect(collected[1]).assertEqual('green');
      expect(collected[2]).assertEqual('blue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_3900
     * @tc.name testIterable039
     * @tc.desc Verify Iterable as function return value is iterable by caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable: Iterable<number> = new NumberList1([7, 8, 9]);
      let iter = iterable.$_iterator();
      expect(iter.next().value).assertEqual(7);
      expect(iter.next().value).assertEqual(8);
      expect(iter.next().value).assertEqual(9);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_4000
     * @tc.name testIterable040
     * @tc.desc Verify Iterable[] elements can each be iterated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterables: Iterable<number>[] = [new SimpleIterable1(), new NumberCollection1()];
      let totalCount: number = 0;
      for (let i: int = 0; i < iterables.length; i++) {
        let collected = collectAll<number>(iterables[i]);
        totalCount += collected.length;
      }
      expect(totalCount).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_4100
     * @tc.name testIterable041
     * @tc.desc Verify Iterable can be stored in Map<string, Iterable<T>> value and iterated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<string, Iterable<number>>();
      map.set('simple', new SimpleIterable1());
      map.set('coll', new NumberCollection1());
      let stored = map.get('simple');
      expect(stored !== undefined).assertTrue();
      if (stored !== undefined) {
        let collected = collectAll<number>(stored);
        expect(collected.length).assertEqual(3);
        expect(collected[0]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_4200
     * @tc.name testIterable042
     * @tc.desc Verify Iterable instance is instanceof its concrete class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SimpleIterable1();
      expect(iterable instanceof SimpleIterable1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_4300
     * @tc.name testIterable043
     * @tc.desc Verify Iterable assigned to Iterable<T> variable still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable: Iterable<number> = new SimpleIterable1();
      let collected = collectAll<number>(iterable);
      expect(collected.length).assertEqual(3);
      expect(collected[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_4400
     * @tc.name testIterable044
     * @tc.desc Verify nested Iterable<Iterable<T>> outer for-of yields inner Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer = new OuterIterable1();
      let outerCount: number = 0;
      for (let inner of outer) {
        outerCount++;
        let innerCollected = collectAll<number>(inner);
        expect(innerCollected.length).assertEqual(2);
      }
      expect(outerCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_4500
     * @tc.name testIterable045
     * @tc.desc Verify nested for-of inner loop sums all inner elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer = new OuterIterable1();
      let total: number = 0;
      for (let inner of outer) {
        for (let v of inner) {
          total += v;
        }
      }
      expect(total).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_4600
     * @tc.name testIterable046
     * @tc.desc Verify $_iterator() throwing Error path: error.name and error.message match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let throwing = new ThrowingIterable1(true);
      let caughtName: string = '';
      let caughtMsg: string = '';
      try {
        throwing.$_iterator();
        expect().assertFail();
      } catch (e) {
        caughtName = e.name;
        caughtMsg = e.message;
      }
      expect(caughtName).assertEqual('Error');
      expect(caughtMsg).assertEqual('Iterator creation failed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_4700
     * @tc.name testIterable047
     * @tc.desc Verify Iterator next() throwing Error preserves elements collected before failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NextThrowIterable1(2);
      let iter = iterable.$_iterator();
      let collected: number[] = [];
      try {
        collected.push(iter.next().value!);
        collected.push(iter.next().value!);
        iter.next();
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('Fail at index 2');
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_4800
     * @tc.name testIterable048
     * @tc.desc Verify Iterator next() throws on first call when failAt=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NextThrowIterable1(0);
      let iter = iterable.$_iterator();
      try {
        iter.next();
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('Fail at index 0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_4900
     * @tc.name testIterable049
     * @tc.desc Verify ReverseSource1 iterates input in reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new ReverseSource1(['a', 'b', 'c']);
      let collected = collectAll<string>(source);
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual('c');
      expect(collected[1]).assertEqual('b');
      expect(collected[2]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_5000
     * @tc.name testIterable050
     * @tc.desc Verify ArraySource1 vs ReverseSource1 produce different orders for same input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new ArraySource1(['a', 'b', 'c']);
      let rev = new ReverseSource1(['a', 'b', 'c']);
      let arrCollected = collectAll<string>(arr);
      let revCollected = collectAll<string>(rev);
      expect(arrCollected[0]).assertEqual('a');
      expect(revCollected[0]).assertEqual('c');
      expect(arrCollected.length).assertEqual(revCollected.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_5100
     * @tc.name testIterable051
     * @tc.desc Verify NumberList1 with empty constructor input produces zero iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([]);
      let collected = collectAll<number>(iterable);
      expect(collected.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_5200
     * @tc.name testIterable052
     * @tc.desc Verify NumberList1 with single negative element preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([-5]);
      let collected = collectAll<number>(iterable);
      expect(collected.length).assertEqual(1);
      expect(collected[0]).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_5300
     * @tc.name testIterable053
     * @tc.desc Verify NumberList1 sum equals expected value for [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([1, 2, 3, 4, 5]);
      let sum: number = 0;
      for (let v of iterable) {
        sum += v;
      }
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_5400
     * @tc.name testIterable054
     * @tc.desc Verify NumberList1 max equals last element when ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([3, 5, 7, 9]);
      let maxVal: number = -1;
      for (let v of iterable) {
        if (v > maxVal) {
          maxVal = v;
        }
      }
      expect(maxVal).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_5500
     * @tc.name testIterable055
     * @tc.desc Verify NumberList1 min equals first element when ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([4, 6, 8]);
      let minVal: number = 1000;
      for (let v of iterable) {
        if (v < minVal) {
          minVal = v;
        }
      }
      expect(minVal).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_5600
     * @tc.name testIterable056
     * @tc.desc Verify StringCollection1 join produces expected concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new StringCollection1();
      let joined: string = '';
      for (let v of iterable) {
        joined = joined + v + '|';
      }
      expect(joined).assertEqual('hello|world|test|');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_5700
     * @tc.name testIterable057
     * @tc.desc Verify BooleanCollection1 every check returns false when contains false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new BooleanCollection1();
      let allTrue: boolean = true;
      for (let v of iterable) {
        if (!v) {
          allTrue = false;
        }
      }
      expect(allTrue).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_5800
     * @tc.name testIterable058
     * @tc.desc Verify BooleanCollection1 some check returns true when contains true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new BooleanCollection1();
      let anyTrue: boolean = false;
      for (let v of iterable) {
        if (v) {
          anyTrue = true;
        }
      }
      expect(anyTrue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_5900
     * @tc.name testIterable059
     * @tc.desc Verify Iterable count helper returns same length as collectAll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new ColorIterable1();
      let collected = collectAll<string>(iterable);
      let countViaForOf: number = 0;
      for (let v of iterable) {
        countViaForOf++;
      }
      expect(countViaForOf).assertEqual(collected.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_6000
     * @tc.name testIterable060
     * @tc.desc Verify count of empty iterable is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new EmptyIterable1();
      let count: number = 0;
      for (let v of iterable) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_6100
     * @tc.name testIterable061
     * @tc.desc Verify explicit next() driving simulates for-of result for SimpleIterable1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SimpleIterable1();
      let iter = iterable.$_iterator();
      let collected: number[] = [];
      let r = iter.next();
      while (!r.done) {
        collected.push(r.value!);
        r = iter.next();
      }
      expect(collected.length).assertEqual(3);
      expect(collected[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_6200
     * @tc.name testIterable062
     * @tc.desc Verify explicit next() out-of-bound returns done=true with value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SingleIterable1();
      let iter = iterable.$_iterator();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_6300
     * @tc.name testIterable063
     * @tc.desc Verify lazy iteration: count of next() calls equals number of consumed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SimpleIterable1();
      let iter = iterable.$_iterator();
      iter.next();
      iter.next();
      let collected: number[] = [];
      let r = iter.next();
      while (!r.done) {
        collected.push(r.value!);
        r = iter.next();
      }
      expect(collected.length).assertEqual(1);
      expect(collected[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_6400
     * @tc.name testIterable064
     * @tc.desc Verify Iterable interface inherited via DataSource1 still iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: DataSource1 = new ArraySource1(['x', 'y']);
      let collected = collectAll<string>(source);
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual('x');
      expect(collected[1]).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_6500
     * @tc.name testIterable065
     * @tc.desc Verify Iterable abstract via DataSource1 inherited iteration produces values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Iterable<string> = new ArraySource1(['m', 'n', 'o']);
      let collected = collectAll<string>(source);
      expect(collected.length).assertEqual(3);
      expect(collected[1]).assertEqual('n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_6600
     * @tc.name testIterable066
     * @tc.desc Verify two implementations of DataSource1 do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new ArraySource1(['p', 'q']);
      let rev = new ReverseSource1(['p', 'q']);
      let arrCollected = collectAll<string>(arr);
      let revCollected = collectAll<string>(rev);
      expect(arrCollected[0]).assertEqual('p');
      expect(revCollected[0]).assertEqual('q');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_6700
     * @tc.name testIterable067
     * @tc.desc Verify NumberList1 with NaN element preserves NaN via Number.isNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([Number.NaN, 1]);
      let iter = iterable.$_iterator();
      let first = iter.next();
      let firstVal = first.value as number;
      expect(first.done).assertFalse();
      expect(Number.isNaN(firstVal)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_6800
     * @tc.name testIterable068
     * @tc.desc Verify NumberList1 with POSITIVE_INFINITY preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([Number.POSITIVE_INFINITY]);
      let iter = iterable.$_iterator();
      let r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_6900
     * @tc.name testIterable069
     * @tc.desc Verify NumberList1 with NEGATIVE_INFINITY preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([Number.NEGATIVE_INFINITY]);
      let iter = iterable.$_iterator();
      let r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_7000
     * @tc.name testIterable070
     * @tc.desc Verify NumberList1 with MAX_SAFE_INTEGER preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([Number.MAX_SAFE_INTEGER]);
      let iter = iterable.$_iterator();
      let r = iter.next();
      expect(r.value).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_7100
     * @tc.name testIterable071
     * @tc.desc Verify NumberList1 with MIN_SAFE_INTEGER preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([Number.MIN_SAFE_INTEGER]);
      let iter = iterable.$_iterator();
      let r = iter.next();
      expect(r.value).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_7200
     * @tc.name testIterable072
     * @tc.desc Verify ArraySource1 with Unicode characters yields each in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new ArraySource1(['你', '好', '世', '界']);
      let collected = collectAll<string>(source);
      expect(collected.length).assertEqual(4);
      expect(collected[0]).assertEqual('你');
      expect(collected[3]).assertEqual('界');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_7300
     * @tc.name testIterable073
     * @tc.desc Verify ArraySource1 with emoji-like strings yields values intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new ArraySource1(['😀', '🎉']);
      let collected = collectAll<string>(source);
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual('😀');
      expect(collected[1]).assertEqual('🎉');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_7400
     * @tc.name testIterable074
     * @tc.desc Verify ArraySource1 with empty string element does not skip it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new ArraySource1(['', 'x', '']);
      let collected = collectAll<string>(source);
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual('');
      expect(collected[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_7500
     * @tc.name testIterable075
     * @tc.desc Verify Iterable<number[]> elements yield array references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let col = new ArrayCollection1();
      let totalLen: number = 0;
      for (let arr of col) {
        totalLen += arr.length;
      }
      expect(totalLen).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_7600
     * @tc.name testIterable076
     * @tc.desc Verify Iterable<Pair1> elements expose key and value fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pairs = new PairIterable1();
      let collected: Pair1[] = [];
      for (let p of pairs) {
        collected.push(p);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0].key).assertEqual('a');
      expect(collected[0].value).assertEqual(1);
      expect(collected[1].key).assertEqual('b');
      expect(collected[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_7700
     * @tc.name testIterable077
     * @tc.desc Verify NumberList1 reflects mutated source array on subsequent iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [1, 2];
      let iterable = new NumberList1(source);
      let firstRun = collectAll<number>(iterable);
      source.push(3);
      let secondRun = collectAll<number>(iterable);
      expect(firstRun.length).assertEqual(2);
      expect(secondRun.length).assertEqual(3);
      expect(secondRun[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_7800
     * @tc.name testIterable078
     * @tc.desc Verify NumberList1 reflects mutated element on subsequent iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [10, 20];
      let iterable = new NumberList1(source);
      let firstRun = collectAll<number>(iterable);
      source[0] = 99;
      let secondRun = collectAll<number>(iterable);
      expect(firstRun[0]).assertEqual(10);
      expect(secondRun[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_7900
     * @tc.name testIterable079
     * @tc.desc Verify ColorIterable1 first three elements via direct next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new ColorIterable1();
      let iter = iterable.$_iterator();
      let r1 = iter.next();
      let r2 = iter.next();
      let r3 = iter.next();
      expect(r1.value).assertEqual('red');
      expect(r2.value).assertEqual('green');
      expect(r3.value).assertEqual('blue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_8000
     * @tc.name testIterable080
     * @tc.desc Verify CharIterable1 third element is C
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new CharIterable1();
      let iter = iterable.$_iterator();
      iter.next();
      iter.next();
      let r3 = iter.next();
      expect(r3.value).assertEqual('C');
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_8100
     * @tc.name testIterable081
     * @tc.desc Verify Iterable used with hand-driven for loop simulates for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SimpleIterable1();
      let iter = iterable.$_iterator();
      let collected: number[] = [];
      for (let r = iter.next(); !r.done; r = iter.next()) {
        collected.push(r.value!);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_8200
     * @tc.name testIterable082
     * @tc.desc Verify Iterable returned by helper function still iterable in caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable: Iterable<number> = new SimpleIterable1();
      let collected = collectAll<number>(iterable);
      expect(collected.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_8300
     * @tc.name testIterable083
     * @tc.desc Verify Iterable parameter accepts SimpleIterable1 subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: Iterable<number> = new SimpleIterable1();
      let sum: number = 0;
      for (let v of iter) {
        sum += v;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_8400
     * @tc.name testIterable084
     * @tc.desc Verify covariant Iterable<Dog2> treated as Iterable<Animal2> exposes name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dogs: Iterable<Dog2> = new DogIterable1();
      let animals: Iterable<Animal2> = dogs;
      let collected: string[] = [];
      for (let a of animals) {
        collected.push(a.name);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual('animal');
      expect(collected[1]).assertEqual('animal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_8500
     * @tc.name testIterable085
     * @tc.desc Verify DogIterable1 inner element keeps Dog2-specific breed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dogs = new DogIterable1();
      let iter = dogs.$_iterator();
      let r = iter.next();
      let v = r.value as Dog2;
      expect(r.done).assertFalse();
      expect(v !== undefined).assertTrue();
      expect(v.breed).assertEqual('labrador');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_8600
     * @tc.name testIterable086
     * @tc.desc Verify NumberList1 large input total iteration yields expected sum 5050
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      for (let i: number = 1; i <= 100; i++) {
        arr.push(i);
      }
      let iterable = new NumberList1(arr);
      let sum: number = 0;
      for (let v of iterable) {
        sum += v;
      }
      expect(sum).assertEqual(5050);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_8700
     * @tc.name testIterable087
     * @tc.desc Verify HugeIterable1 first three values from explicit next() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let huge = new HugeIterable1();
      let iter = huge.$_iterator();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_8800
     * @tc.name testIterable088
     * @tc.desc Verify EmptyStringIter1 used directly is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new EmptyStringIter1();
      let r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_8900
     * @tc.name testIterable089
     * @tc.desc Verify ReverseInnerIter1 yields elements from end to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new ReverseInnerIter1(['a', 'b', 'c']);
      expect(iter.next().value).assertEqual('c');
      expect(iter.next().value).assertEqual('b');
      expect(iter.next().value).assertEqual('a');
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_9000
     * @tc.name testIterable090
     * @tc.desc Verify same iterable yields equal sums via collectAll and for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberCollection1();
      let helperSum: number = 0;
      let helperCollected = collectAll<number>(iterable);
      for (let i: int = 0; i < helperCollected.length; i++) {
        helperSum += helperCollected[i];
      }
      let forOfSum: number = 0;
      for (let v of iterable) {
        forOfSum += v;
      }
      expect(helperSum).assertEqual(forOfSum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_9100
     * @tc.name testIterable091
     * @tc.desc Verify Iterable<Animal2>[] holds covariant DogIterable1 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bag: Iterable<Animal2>[] = [new DogIterable1() as Iterable<Animal2>];
      let total: number = 0;
      for (let i: int = 0; i < bag.length; i++) {
        let source: Iterable<Animal2> = bag[i];
        let collected: Animal2[] = [];
        for (let v of source) {
          collected.push(v);
        }
        total += collected.length;
      }
      expect(total).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_9200
     * @tc.name testIterable092
     * @tc.desc Verify Iterable used in generic helper firstN returns first 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SimpleIterable1();
      let collected: number[] = [];
      let count: number = 0;
      for (let v of iterable) {
        if (count >= 2) {
          break;
        }
        collected.push(v);
        count++;
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(10);
      expect(collected[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_9300
     * @tc.name testIterable093
     * @tc.desc Verify Iterable iteration with n larger than length collects all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SimpleIterable1();
      let collected: number[] = [];
      let count: number = 0;
      for (let v of iterable) {
        if (count >= 100) {
          break;
        }
        collected.push(v);
        count++;
      }
      expect(collected.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_9400
     * @tc.name testIterable094
     * @tc.desc Verify two collectAll invocations on same instance return equal arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new ColorIterable1();
      let first = collectAll<string>(iterable);
      let second = collectAll<string>(iterable);
      expect(first.length).assertEqual(second.length);
      expect(first[0]).assertEqual(second[0]);
      expect(first[2]).assertEqual(second[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_9500
     * @tc.name testIterable095
     * @tc.desc Verify Iterable<Item1> for-of can read both id and name fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let col = new ObjectCollection1();
      let names: string[] = [];
      let ids: number[] = [];
      for (let item of col) {
        names.push(item.name);
        ids.push(item.id);
      }
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('item1');
      expect(ids[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_9600
     * @tc.name testIterable096
     * @tc.desc Verify Iterable<number[]> outer for-of yields first elements in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let col = new ArrayCollection1();
      let firstElements: number[] = [];
      for (let arr of col) {
        firstElements.push(arr[0]);
      }
      expect(firstElements.length).assertEqual(3);
      expect(firstElements[0]).assertEqual(1);
      expect(firstElements[1]).assertEqual(3);
      expect(firstElements[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_9700
     * @tc.name testIterable097
     * @tc.desc Verify Iterable inside Map<string, Iterable<string>> exposes iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<string, Iterable<string>>();
      map.set('color', new ColorIterable1());
      let stored = map.get('color');
      expect(stored !== undefined).assertTrue();
      if (stored !== undefined) {
        let collected = collectAll<string>(stored);
        expect(collected.length).assertEqual(3);
        expect(collected[0]).assertEqual('red');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_9800
     * @tc.name testIterable098
     * @tc.desc Verify NumberList1 chain of iterators each from $_iterator() are distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new NumberList1([1, 2, 3]);
      let iter1 = iterable.$_iterator();
      let iter2 = iterable.$_iterator();
      let iter3 = iterable.$_iterator();
      expect(iter1 === iter2).assertFalse();
      expect(iter2 === iter3).assertFalse();
      expect(iter1 === iter3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_9900
     * @tc.name testIterable099
     * @tc.desc Verify two for-of loops on same iterable consume independent iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = new SimpleIterable1();
      let firstSum: number = 0;
      for (let v of iterable) {
        firstSum += v;
      }
      let secondSum: number = 0;
      for (let v of iterable) {
        secondSum += v;
      }
      expect(firstSum).assertEqual(secondSum);
      expect(firstSum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_10000
     * @tc.name testIterable100
     * @tc.desc Verify Iterable<Pair1> exposes objects whose keys can be sorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pairs = new PairIterable1();
      let keys: string[] = [];
      for (let p of pairs) {
        keys.push(p.key);
      }
      expect(keys.length).assertEqual(2);
      let sortedFirst: string = keys[0] < keys[1] ? keys[0] : keys[1];
      expect(sortedFirst).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERABLE_10100
     * @tc.name testIterable101
     * @tc.desc Verify Iterable<Animal2> via DogIterable1 yields elements with name == animal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterable101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let animals: Iterable<Animal2> = new DogIterable1();
      let names: string[] = [];
      for (let a of animals) {
        names.push(a.name);
      }
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('animal');
    });
  });
}
