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
import Utils from './../Util.test';


interface ObjItem1 {
  name: string;
}

class StringIterator1 implements Iterator<string> {
  private items: string[] = ["a", "b", "c"];
  private index: int = 0;
  public next(): IteratorResult<string> {
    if (this.index < this.items.length) {
      return new IteratorResult<string>(this.items[this.index++]);
    }
    return new IteratorResult<string>();
  }
}

class NumIterator1 implements Iterator<number> {
  private items: number[] = [1, 2];
  private index: int = 0;
  public next(): IteratorResult<number> {
    if (this.index < this.items.length) {
      return new IteratorResult<number>(this.items[this.index++]);
    }
    return new IteratorResult<number>();
  }
}

class SimpleIterator1 implements Iterator<number> {
  private items: number[] = [10, 20, 30];
  private index: int = 0;
  public next(): IteratorResult<number> {
    if (this.index < this.items.length) {
      return new IteratorResult<number>(this.items[this.index++]);
    }
    return new IteratorResult<number>();
  }
}

class StringIter1 implements Iterator<string> {
  private items: string[] = ["hello", "world"];
  private index: int = 0;
  public next(): IteratorResult<string> {
    if (this.index < this.items.length) {
      return new IteratorResult<string>(this.items[this.index++]);
    }
    return new IteratorResult<string>();
  }
}

class NumberIter1 implements Iterator<number> {
  private items: number[] = [42, 3.14, -7];
  private index: int = 0;
  public next(): IteratorResult<number> {
    if (this.index < this.items.length) {
      return new IteratorResult<number>(this.items[this.index++]);
    }
    return new IteratorResult<number>();
  }
}

class BoolIter1 implements Iterator<boolean> {
  private items: boolean[] = [true, false, true];
  private index: int = 0;
  public next(): IteratorResult<boolean> {
    if (this.index < this.items.length) {
      return new IteratorResult<boolean>(this.items[this.index++]);
    }
    return new IteratorResult<boolean>();
  }
}

class ObjectIter1 implements Iterator<ObjItem1> {
  private items: ObjItem1[] = [{ name: "a" } as ObjItem1, { name: "b" } as ObjItem1];
  private index: int = 0;
  public next(): IteratorResult<ObjItem1> {
    if (this.index < this.items.length) {
      return new IteratorResult<ObjItem1>(this.items[this.index++]);
    }
    return new IteratorResult<ObjItem1>();
  }
}

class ArrayIter1 implements Iterator<number[]> {
  private items: number[][] = [[1, 2], [3, 4, 5]];
  private index: int = 0;
  public next(): IteratorResult<number[]> {
    if (this.index < this.items.length) {
      return new IteratorResult<number[]>(this.items[this.index++]);
    }
    return new IteratorResult<number[]>();
  }
}

class SeqIter1 implements Iterator<number> {
  private items: number[] = [100, 200, 300];
  private index: int = 0;
  public next(): IteratorResult<number> {
    if (this.index < this.items.length) {
      return new IteratorResult<number>(this.items[this.index++]);
    }
    return new IteratorResult<number>();
  }
}

class DoneIter1 implements Iterator<string> {
  private items: string[] = ["x"];
  private index: int = 0;
  public next(): IteratorResult<string> {
    if (this.index < this.items.length) {
      return new IteratorResult<string>(this.items[this.index++]);
    }
    return new IteratorResult<string>();
  }
}

class EmptyIter1<T> implements Iterator<T> {
  public next(): IteratorResult<T> {
    return new IteratorResult<T>();
  }
}

class UndefinedValIter1 implements Iterator<string> {
  private items: string[] = ["a"];
  private index: int = 0;
  public next(): IteratorResult<string> {
    if (this.index < this.items.length) {
      return new IteratorResult<string>(this.items[this.index++]);
    }
    return new IteratorResult<string>();
  }
}

class NullableIter1 implements Iterator<string | null> {
  private items: (string | null)[] = ["a", null, "b"];
  private index: int = 0;
  public next(): IteratorResult<string | null> {
    if (this.index < this.items.length) {
      return new IteratorResult<string | null>(this.items[this.index++]);
    }
    return new IteratorResult<string | null>();
  }
}

class TypeCheckIter1 implements Iterator<number> {
  private items: number[] = [1];
  private index: int = 0;
  public next(): IteratorResult<number> {
    if (this.index < this.items.length) {
      return new IteratorResult<number>(this.items[this.index++]);
    }
    return new IteratorResult<number>();
  }
}

class BoolDoneIter1 implements Iterator<string> {
  private items: string[] = ["a", "b"];
  private index: int = 0;
  public next(): IteratorResult<string> {
    if (this.index < this.items.length) {
      return new IteratorResult<string>(this.items[this.index++]);
    }
    return new IteratorResult<string>();
  }
}

class GenericIter1<T> implements Iterator<T> {
  private items: T[];
  private index: int = 0;
  constructor(items: T[]) {
    this.items = items;
  }
  public next(): IteratorResult<T> {
    if (this.index < this.items.length) {
      return new IteratorResult<T>(this.items[this.index++]);
    }
    return new IteratorResult<T>();
  }
}

class LargeIter1 implements Iterator<number> {
  private count: number = 0;
  private max: number = 10000;
  public next(): IteratorResult<number> {
    if (this.count < this.max) {
      return new IteratorResult<number>(this.count++);
    }
    return new IteratorResult<number>();
  }
}

class SingleIter1 implements Iterator<string> {
  private hasMore: boolean = true;
  public next(): IteratorResult<string> {
    if (this.hasMore) {
      this.hasMore = false;
      return new IteratorResult<string>("only");
    }
    return new IteratorResult<string>();
  }
}

class EmptyIterator1<T> implements Iterator<T> {
  public next(): IteratorResult<T> {
    return new IteratorResult<T>();
  }
}

class GoodIter1 implements Iterator<number> {
  public next(): IteratorResult<number> {
    return new IteratorResult<number>();
  }
}

class CorrectReturn1 implements Iterator<number> {
  public next(): IteratorResult<number> {
    return new IteratorResult<number>(1);
  }
}

class ThrowingIter1 implements Iterator<number> {
  public next(): IteratorResult<number> {
    throw new Error("Iterator error");
  }
}

class IteratorError1 extends Error {
  public errorCode: number;
  constructor(message: string, errorCode: number) {
    super(message);
    this.name = "IteratorError";
    this.errorCode = errorCode;
  }
}

class CustomThrowIter1 implements Iterator<string> {
  public next(): IteratorResult<string> {
    throw new IteratorError1("Custom iterator error", 500);
  }
}

class ErrorIter1 implements Iterator<number> {
  private count: number = 0;
  public next(): IteratorResult<number> {
    this.count++;
    if (this.count > 2) {
      throw new Error("Too many iterations");
    }
    return new IteratorResult<number>(this.count);
  }
}

class ArrayLikeIterator1<T> implements Iterator<T> {
  private data: T[];
  private pos: int = 0;
  constructor(data: T[]) {
    this.data = data;
  }
  public next(): IteratorResult<T> {
    if (this.pos < this.data.length) {
      return new IteratorResult<T>(this.data[this.pos++]);
    }
    return new IteratorResult<T>();
  }
}

class RangeIter1 implements Iterator<number> {
  private current: number;
  private end: number;
  constructor(start: number, end: number) {
    this.current = start;
    this.end = end;
  }
  public next(): IteratorResult<number> {
    if (this.current <= this.end) {
      return new IteratorResult<number>(this.current++);
    }
    return new IteratorResult<number>();
  }
}

class RepeatIter1 implements Iterator<string> {
  private value: string;
  private count: number;
  private called: number = 0;
  constructor(value: string, count: number) {
    this.value = value;
    this.count = count;
  }
  public next(): IteratorResult<string> {
    if (this.called < this.count) {
      this.called++;
      return new IteratorResult<string>(this.value);
    }
    return new IteratorResult<string>();
  }
}

class ListIter1<T> implements Iterator<T> {
  private items: T[];
  private idx: int = 0;
  constructor(items: T[]) {
    this.items = items;
  }
  public next(): IteratorResult<T> {
    if (this.idx < this.items.length) {
      return new IteratorResult<T>(this.items[this.idx++]);
    }
    return new IteratorResult<T>();
  }
}

class TestIter1 implements Iterator<number> {
  private items: number[] = [1, 2, 3];
  private idx: int = 0;
  public next(): IteratorResult<number> {
    if (this.idx < this.items.length) {
      return new IteratorResult<number>(this.items[this.idx++]);
    }
    return new IteratorResult<number>();
  }
}

class CreateIteratorResult1<T> implements Iterator<T> {
  private data: T[];
  private idx: int = 0;
  constructor(data: T[]) {
    this.data = data;
  }
  public next(): IteratorResult<T> {
    if (this.idx < this.data.length) {
      return new IteratorResult<T>(this.data[this.idx++]);
    }
    return new IteratorResult<T>();
  }
}

function createIterator1<T>(data: T[]): Iterator<T> {
  return new CreateIteratorResult1<T>(data);
}

class GenIter1<T> implements Iterator<T> {
  private items: T[];
  private idx: int = 0;
  constructor(items: T[]) {
    this.items = items;
  }
  public next(): IteratorResult<T> {
    if (this.idx < this.items.length) {
      return new IteratorResult<T>(this.items[this.idx++]);
    }
    return new IteratorResult<T>();
  }
}

interface Item1 {
  id: number;
  name: string;
}

class ItemIter1 implements Iterator<Item1> {
  private items: Item1[];
  private idx: int = 0;
  constructor(items: Item1[]) {
    this.items = items;
  }
  public next(): IteratorResult<Item1> {
    if (this.idx < this.items.length) {
      return new IteratorResult<Item1>(this.items[this.idx++]);
    }
    return new IteratorResult<Item1>();
  }
}

class Base1 {
  public id: number = 0;
}

class Derived1 extends Base1 {
  public name: string = "derived";
}

class DerivedIter1 implements Iterator<Derived1> {
  private items: Derived1[] = [new Derived1()];
  private idx: int = 0;
  public next(): IteratorResult<Derived1> {
    if (this.idx < this.items.length) {
      return new IteratorResult<Derived1>(this.items[this.idx++]);
    }
    return new IteratorResult<Derived1>();
  }
}

function consumeIterator<T>(iter: Iterator<T>): T[] {
  let results: T[] = [];
  let r = iter.next();
  while (!r.done) {
    results.push(r.value as T);
    r = iter.next();
  }
  return results;
}

export default function IteratorTest(): void {
  describe('IteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_0100
     * @tc.name testIterator001
     * @tc.desc Verify next() with no arguments returns correct IteratorResult
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new StringIterator1();
      let result = iter.next();
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_0200
     * @tc.name testIterator002
     * @tc.desc Verify next() accepts only the valid no-argument call form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: Iterator<string> = new StringIterator1();
      let first: IteratorResult<string> = iter.next();
      let second: IteratorResult<string> = iter.next();
      expect(first.value).assertEqual("a");
      expect(first.done).assertFalse();
      expect(second.value).assertEqual("b");
      expect(second.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_0300
     * @tc.name testIterator003
     * @tc.desc Verify next() returns object with value and done properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new SimpleIterator1();
      let result = iter.next();
      expect(result.value).assertEqual(10);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_0400
     * @tc.name testIterator004
     * @tc.desc Verify Iterator<string> returns string values from next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new StringIter1();
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual("hello");
      let r2 = iter.next();
      expect(r2.value).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_0500
     * @tc.name testIterator005
     * @tc.desc Verify Iterator<number> returns number values from next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new NumberIter1();
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_0600
     * @tc.name testIterator006
     * @tc.desc Verify Iterator<boolean> returns boolean values from next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new BoolIter1();
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_0700
     * @tc.name testIterator007
     * @tc.desc Verify Iterator<object> returns object values from next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new ObjectIter1();
      let r1 = iter.next();
      let val = r1.value as ObjItem1;
      expect(val.name).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_0800
     * @tc.name testIterator008
     * @tc.desc Verify Iterator<number[]> returns array values from next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new ArrayIter1();
      let r1 = iter.next();
      let val = r1.value as number[];
      expect(val.length).assertEqual(2);
      expect(val[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_0900
     * @tc.name testIterator009
     * @tc.desc Verify consecutive next() calls return different elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new SeqIter1();
      let r1 = iter.next();
      expect(r1.value).assertEqual(100);
      expect(r1.done).assertFalse();
      let r2 = iter.next();
      expect(r2.value).assertEqual(200);
      expect(r2.done).assertFalse();
      let r3 = iter.next();
      expect(r3.value).assertEqual(300);
      expect(r3.done).assertFalse();
      let r4 = iter.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_1000
     * @tc.name testIterator010
     * @tc.desc Verify iteration completion returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new DoneIter1();
      iter.next();
      let finalResult = iter.next();
      expect(finalResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_1100
     * @tc.name testIterator011
     * @tc.desc Verify empty iterator returns done=true immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new EmptyIter1<number>();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_1200
     * @tc.name testIterator012
     * @tc.desc Verify completed iteration returns value as undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new UndefinedValIter1();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_1300
     * @tc.name testIterator013
     * @tc.desc Verify iterator containing null values returns null correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new NullableIter1();
      iter.next();
      let r2 = iter.next();
      expect(r2.value).assertEqual(null);
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_1400
     * @tc.name testIterator014
     * @tc.desc Verify next() return value structure has value and done properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new TypeCheckIter1();
      let r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_1500
     * @tc.name testIterator015
     * @tc.desc Verify done property is always boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new BoolDoneIter1();
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      let r2 = iter.next();
      expect(r2.done).assertFalse();
      let r3 = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_1600
     * @tc.name testIterator016
     * @tc.desc Verify value property type matches generic T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strIter: Iterator<string> = new GenericIter1<string>(["test"]);
      let sr = strIter.next();
      expect(sr.value).assertEqual("test");
      let numIter: Iterator<number> = new GenericIter1<number>([42]);
      let nr = numIter.next();
      expect(nr.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_1700
     * @tc.name testIterator017
     * @tc.desc Verify large iterator with 10000 elements completes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new LargeIter1();
      let totalCalls: number = 0;
      let r = iter.next();
      while (!r.done) {
        totalCalls++;
        r = iter.next();
      }
      expect(totalCalls).assertEqual(10000);
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_1800
     * @tc.name testIterator018
     * @tc.desc Verify single element iterator returns value then done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new SingleIter1();
      let r1 = iter.next();
      expect(r1.value).assertEqual("only");
      expect(r1.done).assertFalse();
      let r2 = iter.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_1900
     * @tc.name testIterator019
     * @tc.desc Verify empty iterator returns done=true on first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new EmptyIterator1<number>();
      let r = iter.next();
      expect(r.done).assertTrue();
      let r2 = iter.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_2000
     * @tc.name testIterator020
     * @tc.desc Verify class with next() implementation returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new GoodIter1();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_2100
     * @tc.name testIterator021
     * @tc.desc Verify next() return type must be IteratorResult
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new CorrectReturn1();
      let r = iter.next();
      expect(r instanceof IteratorResult).assertTrue();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_2200
     * @tc.name testIterator022
     * @tc.desc Verify next() throwing Error can be caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new ThrowingIter1();
      try {
        iter.next();
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual("Iterator error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_2300
     * @tc.name testIterator023
     * @tc.desc Verify custom Error subclass thrown from next() can be caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new CustomThrowIter1();
      try {
        iter.next();
        expect().assertFail();
      } catch (e) {
        expect(e instanceof IteratorError1).assertTrue();
        let err: IteratorError1 = e as IteratorError1;
        expect(err.name).assertEqual("IteratorError");
        expect(err.errorCode).assertEqual(500);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_2400
     * @tc.name testIterator024
     * @tc.desc Verify iterator next() error can be caught by try-catch with partial results collected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new ErrorIter1();
      let results: number[] = [];
      try {
        let r1 = iter.next();
        results.push(r1.value! as number);
        let r2 = iter.next();
        results.push(r2.value! as number);
        let r3 = iter.next();
        results.push(r3.value! as number);
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual("Too many iterations");
      }
      expect(results.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_2500
     * @tc.name testIterator025
     * @tc.desc Verify class can implement Iterator interface correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = new ArrayLikeIterator1<string>(["x", "y", "z"]);
      expect(iter.next().value).assertEqual("x");
      expect(iter.next().value).assertEqual("y");
      expect(iter.next().value).assertEqual("z");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_2600
     * @tc.name testIterator026
     * @tc.desc Verify multiple classes can implement the same Iterator interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rangeIter = new RangeIter1(1, 3);
      expect(rangeIter.next().value).assertEqual(1);
      let repeatIter = new RepeatIter1("hi", 2);
      expect(repeatIter.next().value).assertEqual("hi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_2700
     * @tc.name testIterator027
     * @tc.desc Verify Iterator type reference can point to different implementations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: Iterator<number> = new ListIter1<number>([10, 20]);
      let r1 = iter.next();
      expect(r1.value).assertEqual(10);
      expect(r1.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_2800
     * @tc.name testIterator028
     * @tc.desc Verify Iterator as function parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = consumeIterator<number>(new TestIter1());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_2900
     * @tc.name testIterator029
     * @tc.desc Verify function can return Iterator type for polymorphic return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter = createIterator1<string>(["p", "q"]);
      expect(iter.next().value).assertEqual("p");
      expect(iter.next().value).assertEqual("q");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_3000
     * @tc.name testIterator030
     * @tc.desc Verify different generic type instantiations of Iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strIter: Iterator<string> = new GenIter1<string>(["a"]);
      let numIter: Iterator<number> = new GenIter1<number>([1]);
      let boolIter: Iterator<boolean> = new GenIter1<boolean>([true]);
      expect(strIter.next().value).assertEqual("a");
      expect(numIter.next().value).assertEqual(1);
      expect(boolIter.next().value).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_3100
     * @tc.name testIterator031
     * @tc.desc Verify Iterator with reference type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1: Item1 = { id: 1, name: "A" } as Item1;
      let item2: Item1 = { id: 2, name: "B" } as Item1;
      let iter = new ItemIter1([item1, item2]);
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value!.id).assertEqual(1);
      expect(r1.value!.name).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_3200
     * @tc.name testIterator032
     * @tc.desc Verify Iterator out covariance: SubType to BaseType assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let derivedIter: Iterator<Derived1> = new DerivedIter1();
      let baseIter: Iterator<Base1> = derivedIter;
      let r = baseIter.next();
      expect(r.done).assertFalse();
      expect(r.value! instanceof Base1).assertTrue();
      expect(r.value!.id).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_3300
     * @tc.name testIterator033
     * @tc.desc Verify next() after iteration completes keeps returning done=true on subsequent calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: Iterator<number> = new GenIter1<number>([42]);
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual(42);
      let r2 = iter.next();
      expect(r2.done).assertTrue();
      let r3 = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_3400
     * @tc.name testIterator034
     * @tc.desc Verify Iterator with nullable generic Iterator<string|null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: Iterator<string | null> = new GenIter1<string | null>(["a", null as string | null]);
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual("a");
      let r2 = iter.next();
      expect(r2.done).assertFalse();
      expect(r2.value === null).assertTrue();
      let r3 = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_3600
     * @tc.name testIterator036
     * @tc.desc Verify two iterators over the same source are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter1: Iterator<number> = new GenIter1<number>([10, 20]);
      let iter2: Iterator<number> = new GenIter1<number>([10, 20]);
      let r1 = iter1.next();
      expect(r1.value).assertEqual(10);
      let r2 = iter2.next();
      expect(r2.value).assertEqual(10);
      expect(iter1.next().value).assertEqual(20);
      expect(iter2.next().value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_3700
     * @tc.name testIterator037
     * @tc.desc Verify Iterator<number> instance returns the stored value as IteratorResult.value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: Iterator<number> = new GenIter1<number>([42]);
      let r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(42);
    });
  });
}
