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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class IterAnimal {
  kind: string = '';
  constructor(k: string) {
    this.kind = k;
  }
}

class IterDog extends IterAnimal {
  breed: string = '';
  constructor(k: string, b: string) {
    super(k);
    this.breed = b;
  }
}

class IterCat extends IterAnimal {
  color: string = '';
  constructor(k: string, c: string) {
    super(k);
    this.color = c;
  }
}

class IterItem {
  val: int = 0;
  constructor(v: int) {
    this.val = v;
  }
}

class IterHolder<T> {
  data: Array<T> = new Array<T>();
}

class IterGrandParent {
  arr: Array<int> = new Array<int>(1, 2, 3);
}

class IterParent extends IterGrandParent {
}

class IterChild extends IterParent {
}

class IterOverrideChild extends IterGrandParent {
  arr: Array<int> = new Array<int>(10, 20, 30);
}

class IterSubArray extends Array<int> {
}

function collectInts(iter: IterableIterator<int>): Array<int> {
  const result = new Array<int>();
  let n = iter.next();
  while (!n.done) {
    const val: int = n.value as int;
    result.pushOne(val);
    n = iter.next();
  }
  return result;
}

export default function ArrayIteratorTest2(): void {
  describe('ArrayIteratorTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0100
     * @tc.name testArrayIterator001
     * @tc.desc Verify iterator on Array<double> yields double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.5, 1.5, 2.5);
      const collected = new Array<double>();
      for (const val of arr) {
        collected.pushOne(val);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(0.5);
      expect(collected[2]).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0200
     * @tc.name testArrayIterator002
     * @tc.desc Verify iterator on Array<boolean> yields boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const collected = new Array<boolean>();
      for (const val of arr) {
        collected.pushOne(val);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertTrue();
      expect(collected[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0300
     * @tc.name testArrayIterator003
     * @tc.desc Verify iterator on Array<number | null> yields null and numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, null);
      const collected = new Array<number | null>();
      for (const val of arr) {
        collected.pushOne(val);
      }
      expect(collected.length).assertEqual(4);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0400
     * @tc.name testArrayIterator004
     * @tc.desc Verify for-of on Array<int> can break early and resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const firstHalf = new Array<int>();
      let count = 0;
      for (const val of arr) {
        if (count >= 3) {
          break;
        }
        firstHalf.pushOne(val);
        count++;
      }
      expect(firstHalf.length).assertEqual(3);
      expect(firstHalf[0]).assertEqual(10);
      expect(firstHalf[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0500
     * @tc.name testArrayIterator005
     * @tc.desc Verify forEach on Array<string> visits all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      let count = 0;
      arr.forEach((v: string): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0600
     * @tc.name testArrayIterator006
     * @tc.desc Verify iterator on huge 10000 element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 10000; i++) {
        arr.pushOne(i);
      }
      let sum = 0;
      for (const val of arr) {
        sum += val;
      }
      expect(sum).assertEqual(49995000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0700
     * @tc.name testArrayIterator007
     * @tc.desc Verify iterator on union typed array yields correct types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'hello', 2, 'world');
      const values = new Array<int | string>();
      for (const val of arr) {
        values.pushOne(val);
      }
      expect(values.length).assertEqual(4);
      expect(values[1]).assertEqual('hello');
      expect(values[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0800
     * @tc.name testArrayIterator008
     * @tc.desc Verify forEach on Array<int> visits all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 10, 15, 20);
      const collected = new Array<int>();
      arr.forEach((v: int): void => {
        collected.pushOne(v);
      });
      expect(collected.length).assertEqual(4);
      expect(collected[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0900
     * @tc.name testArrayIterator009
     * @tc.desc Verify iter.$_iterator() returns self: shared state means selfIter.next() returns second element after iter.next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iter = arr.$_iterator();
      const selfIter = iter.$_iterator();
      const first = iter.next();
      expect(first.value).assertEqual(1);
      const second = selfIter.next();
      expect(second.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1000
     * @tc.name testArrayIterator010
     * @tc.desc Verify iterator on Array<IterItem> with custom class returns correct references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<IterItem>(new IterItem(1), new IterItem(2));
      const collected = new Array<IterItem>();
      for (const val of arr) {
        collected.pushOne(val);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0].val).assertEqual(1);
      expect(collected[1].val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1100
     * @tc.name testArrayIterator011
     * @tc.desc Verify iterator on polymorphic Array<IterAnimal> with Dog and Cat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<IterAnimal>(new IterDog('mammal', 'husky'), new IterCat('mammal', 'orange'));
      const collected = new Array<IterAnimal>();
      for (const val of arr) {
        collected.pushOne(val);
      }
      expect(collected.length).assertEqual(2);
      const dog = collected[0] as IterDog;
      expect(dog.breed).assertEqual('husky');
      const cat = collected[1] as IterCat;
      expect(cat.color).assertEqual('orange');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1200
     * @tc.name testArrayIterator012
     * @tc.desc Verify iterator preserves Infinity and -Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, 0);
      const collected = new Array<number>();
      for (const val of arr) {
        collected.pushOne(val);
      }
      expect(collected[0]).assertEqual(Double.POSITIVE_INFINITY);
      expect(collected[1]).assertEqual(Double.NEGATIVE_INFINITY);
      expect(collected[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1300
     * @tc.name testArrayIterator013
     * @tc.desc Verify iterator preserves zero and negative zero distinction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, -0, 0);
      const collected = new Array<number>();
      for (const val of arr) {
        collected.pushOne(val);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(0);
      expect(collected[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1400
     * @tc.name testArrayIterator014
     * @tc.desc Verify iterator on generically typed IterHolder<string> yields correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new IterHolder<string>();
      holder.data = new Array<string>('hello', 'world');
      const collected = new Array<string>();
      for (const val of holder.data) {
        collected.pushOne(val);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual('hello');
      expect(collected[1]).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1500
     * @tc.name testArrayIterator015
     * @tc.desc Verify iterator on inherited array field from grandparent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new IterChild();
      const collected = collectInts(obj.arr.$_iterator());
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1600
     * @tc.name testArrayIterator016
     * @tc.desc Verify iterator on overridden array field in subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new IterOverrideChild();
      const collected = collectInts(obj.arr.$_iterator());
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(10);
      expect(collected[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1700
     * @tc.name testArrayIterator017
     * @tc.desc Verify iterator on Array<int> works normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 6, 7);
      const collected = collectInts(arr.$_iterator());
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(5);
      expect(collected[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1800
     * @tc.name testArrayIterator018
     * @tc.desc Verify iterator tracks push after creation (lazy expansion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(1);
      arr.pushOne(3);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1900
     * @tc.name testArrayIterator019
     * @tc.desc Verify iterator stops early when pop removes unread elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(1);
      arr.pop();
      const collected = collectInts(iter);
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2000
     * @tc.name testArrayIterator020
     * @tc.desc Verify iterator sees mid-iteration element modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(10);
      arr[1] = 99;
      expect(iter.next().value).assertEqual(99);
      expect(iter.next().value).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2100
     * @tc.name testArrayIterator021
     * @tc.desc Verify iterator terminates immediately when array is cleared mid-iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(1);
      arr.length = 0;
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2200
     * @tc.name testArrayIterator022
     * @tc.desc Verify two independent iterators on same array maintain separate state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const i1 = arr.$_iterator();
      const i2 = arr.$_iterator();
      expect(i1.next().value).assertEqual(1);
      expect(i1.next().value).assertEqual(2);
      expect(i2.next().value).assertEqual(1);
      expect(i1.next().value).assertEqual(3);
      expect(i2.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2300
     * @tc.name testArrayIterator023
     * @tc.desc Verify iterator consumed 5 times after done remains stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      const iter = arr.$_iterator();
      iter.next();
      for (let i = 0; i < 5; i++) {
        const r = iter.next();
        expect(r.done).assertTrue();
        expect(r.value).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2400
     * @tc.name testArrayIterator024
     * @tc.desc Verify iterator on huge array (200000 elements) completes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 200000; i++) {
        arr.pushOne(i);
      }
      const iter = arr.$_iterator();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(200000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2500
     * @tc.name testArrayIterator025
     * @tc.desc Verify iterator on subArray subclass returns correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new IterSubArray();
      arr.pushOne(100);
      arr.pushOne(200);
      const collected = collectInts(arr.$_iterator());
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(100);
      expect(collected[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2600
     * @tc.name testArrayIterator026
     * @tc.desc Verify iterator with spread-like collection reconstructs array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const collected = collectInts(arr.$_iterator());
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(10);
      expect(collected[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2700
     * @tc.name testArrayIterator027
     * @tc.desc Verify iterator on same array with for-of and next() match each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const forOfResult = new Array<int>();
      for (const v of arr) {
        forOfResult.pushOne(v);
      }
      const nextResult = collectInts(arr.$_iterator());
      expect(forOfResult.length).assertEqual(nextResult.length);
      expect(forOfResult[0]).assertEqual(nextResult[0]);
      expect(forOfResult[3]).assertEqual(nextResult[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2800
     * @tc.name testArrayIterator028
     * @tc.desc Verify iterator with zero-width space string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('visible', '​', 'end');
      const collected = new Array<string>();
      for (const v of arr) {
        collected.pushOne(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual('visible');
      expect(collected[1]).assertEqual('​');
      expect(collected[2]).assertEqual('end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2900
     * @tc.name testArrayIterator029
     * @tc.desc Verify iterator on Array<bigint> yields bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const collected = new Array<bigint>();
      for (const v of arr) {
        collected.pushOne(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1n);
      expect(collected[2]).assertEqual(3n);
    });
  });
}