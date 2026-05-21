/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import Utils from './Util.test';

@Sendable
class Person {
  name: string;
  age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

@Sendable
abstract class Shape {
  abstract getArea(): number;
}

@Sendable
class Circle extends Shape {
  radius: number;
  constructor(radius: number) {
    super();
    this.radius = radius;
  }
  getArea(): number {
    return Math.PI * this.radius * this.radius;
  }
}

@Sendable
class Square extends Shape {
  private side: number;
  constructor(side: number) {
    super();
    this.side = side;
  }
  getArea(): number {
    return this.side * this.side;
  }
}

@Sendable
class Car {
  public brand: string;
  private year: number;
  constructor(brand: string, year: number) {
    this.brand = brand;
    this.year = year;
  }
  getYear(): number {
    return this.year;
  }
}

@Sendable
class Configuration {
  static version: string = '1.0.0';
  public name: string;
  constructor(name: string) {
    this.name = name;
  }
}

@Sendable
class Counter {
  private count: number = 0;
  increment(): void {
    this.count++;
  }
  getCount(): number {
    return this.count;
  }
}

@Sendable
class Parent {
  protected value: number;
  constructor(val: number) {
    this.value = val;
  }
}

@Sendable
class Child extends Parent {
  constructor(value: number) {
    super(value);
    this.value = value;
  }
  getValue(): number {
    return this.value;
  }
}

@Sendable
class MathOperations {
  static multiply(a: number, b: number): number {
    return a * b;
  }
}

@Sendable
abstract class Device {
  abstract powerOn(): void;
}

@Sendable
class Phone extends Device {
  powerOn(): void {
    console.log('Phone powered on');
  }
}

@Sendable
class Laptop extends Device {
  powerOn(): void {
    console.log('Laptop powered on');
  }
}

export default function CollectionsSetKeysTest() {
  describe('CollectionsSetKeysTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name    collectionsSetKeysTest0100
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_0100
     * @tc.desc    Test basic functionality of Set.keys() with string elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest0100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      const keys = set.keys();
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual('b');
      expect(keys.next().value).assertEqual('c');
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest0200
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_0200
     * @tc.desc    Test Set.keys() with number elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest0200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(4);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest0300
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_0300
     * @tc.desc    Test Set.keys() on empty Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest0300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const keys = set.keys();
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest0400
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_0400
     * @tc.desc    Test that Set.keys() preserves insertion order
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest0400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('first');
      set.add('second');
      set.add('third');

      const keys = set.keys();
      expect(keys.next().value).assertEqual('first');
      expect(keys.next().value).assertEqual('second');
      expect(keys.next().value).assertEqual('third');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest0500
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_0500
     * @tc.desc    Test Set.keys() with duplicate elements (which get ignored)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest0500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 2, 3, 3, 3]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest0600
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_0600
     * @tc.desc    Test Set.keys() with mixed data types (number, string, boolean, null, undefined)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest0600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | string | boolean | null | undefined> = new collections.Set<number | string | boolean | null | undefined>([1, 'a', true, null, undefined]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual(true);
      expect(keys.next().value).assertEqual(null);
      expect(keys.next().value).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest0700
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_0700
     * @tc.desc    Test Set.keys() with NaN elements (which are considered equal)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest0700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, NaN, 10]);
      const keys = set.keys();
      expect(Number.isNaN(keys.next().value as number)).assertEqual(true);
      expect(keys.next().value).assertEqual(10);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest0800
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_0800
     * @tc.desc    Test Set.keys() with 0 and -0 (treated as equal)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest0800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, -0, 1]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(0);
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest0900
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_0900
     * @tc.desc    Test that each call to keys() returns a new iterator
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest0900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const keys1 = set.keys();
      expect(keys1.next().value).assertEqual(1);

      const keys2 = set.keys();
      expect(keys2.next().value).assertEqual(1);
      expect(keys1.next().value).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest1000
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_1000
     * @tc.desc    Test Set.keys() after adding new elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest1000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      set.add(3);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest1100
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_1100
     * @tc.desc    Test Set.keys() after deleting an element
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest1100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.delete(2);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest1200
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_1200
     * @tc.desc    Test Set.keys() with BigInt elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest1200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<bigint> = new collections.Set<bigint>([1n, 2n, 3n]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1n);
      expect(keys.next().value).assertEqual(2n);
      expect(keys.next().value).assertEqual(3n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest1300
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_1300
     * @tc.desc    Test iterator state after complete iteration
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest1300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const keys = set.keys();
      keys.next();
      keys.next();
      expect(keys.next().done).assertEqual(true);
      expect(keys.next().value).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest1400
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_1400
     * @tc.desc    Test converting Set.keys() iterator to array
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest1400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['x', 'y', 'z']);
      const keysArray: string[] = Array.from(set.keys());
      expect(keysArray.length).assertEqual(3);
      expect(keysArray[0]).assertEqual('x');
      expect(keysArray[1]).assertEqual('y');
      expect(keysArray[2]).assertEqual('z');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest1500
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_1500
     * @tc.desc    Test iterating over Set.keys() with for...of loop
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest1500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30]);
      const result: number[] = [];
      for (const key of set.keys()) {
        result.push(key);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest1600
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_1600
     * @tc.desc    Test Set.keys() with SameValueZero comparison (0, -0, false)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest1600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | boolean> = new collections.Set<number | boolean>([0, -0, false]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(0);
      expect(keys.next().value).assertEqual(false);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest1700
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_1700
     * @tc.desc    Test Set.keys() with large number of elements (1000 elements)
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest1700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest1700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const size: number = 1000;
      for (let i: number = 0; i < size; i++) {
        set.add(i);
      }

      const keys = set.keys();
      for (let i: number = 0; i < size; i++) {
        expect(keys.next().value).assertEqual(i);
      }
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest1800
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_1800
     * @tc.desc    Test Set.keys() after calling clear()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest1800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();
      const keys = set.keys();
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest1900
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_1900
     * @tc.desc    Test that keys() and values() return same iterator for Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest1900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b']);
      const keys = set.keys();
      const values = set.values();
      expect(keys.next().value).assertEqual(values.next().value);
      expect(keys.next().value).assertEqual(values.next().value);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest2000
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_2000
     * @tc.desc    Test that keys() returns an iterator object with next() method
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest2000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const keys = set.keys();
      expect(typeof keys.next).assertEqual('function');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest2100
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_2100
     * @tc.desc    Test partial iteration with Set.keys()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest2100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4, 5]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest2200
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_2200
     * @tc.desc    Test Set.keys() with null and undefined elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest2200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined, null, undefined]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(null);
      expect(keys.next().value).assertEqual(undefined);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest2300
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_2300
     * @tc.desc    Test chained iteration with Set.keys()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest2300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['p', 'q', 'r']);
      const keys = set.keys();

      const first = keys.next();
      expect(first.value).assertEqual('p');
      expect(first.done).assertEqual(false);

      const second = keys.next();
      expect(second.value).assertEqual('q');
      expect(second.done).assertEqual(false);

      const third = keys.next();
      expect(third.value).assertEqual('r');
      expect(third.done).assertEqual(false);

      const done = keys.next();
      expect(done.value).assertEqual(undefined);
      expect(done.done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest2400
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_2400
     * @tc.desc    Test Set.keys() with elements added in reverse order
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest2400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      [5, 4, 3, 2, 1].forEach((num: number) => set.add(num));
      const keys = set.keys();
      expect(keys.next().value).assertEqual(5);
      expect(keys.next().value).assertEqual(4);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest2500
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_2500
     * @tc.desc    Test Set.keys() with elements added and removed multiple times
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest2500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(1);
      set.add(2);
      set.delete(1);
      set.add(3);
      set.add(1);
      set.delete(2);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest2600
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_2600
     * @tc.desc    Test Set.keys() with Symbol.iterator call
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest2600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b']);
      const keys: Iterator<string> = set.keys();

      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual('b');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest2700
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_2700
     * @tc.desc    Test Set.keys() with very large integers
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest2700';
      console.info(`${caseName}, test start`);
      const largeNum1: bigint = 9007199254740991n;
      const largeNum2: bigint = 9007199254740992n;
      const set: collections.Set<bigint> = new collections.Set<bigint>([largeNum1, largeNum2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(largeNum1);
      expect(keys.next().value).assertEqual(largeNum2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest2800
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_2800
     * @tc.desc    Test Set.keys() with empty strings and whitespace
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest2800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['', ' ', '  ']);
      const keys = set.keys();
      expect(keys.next().value).assertEqual('');
      expect(keys.next().value).assertEqual(' ');
      expect(keys.next().value).assertEqual('  ');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest2900
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_2900
     * @tc.desc    Test Set.keys() with iterating during concurrent modification
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest2900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(1);
      set.add(4);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest3000
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_3000
     * @tc.desc    Test Set.keys() with Unicode characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest3000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['ä', 'ö', 'ü', 'ñ', 'ç']);
      const keys = set.keys();
      expect(keys.next().value).assertEqual('ä');
      expect(keys.next().value).assertEqual('ö');
      expect(keys.next().value).assertEqual('ü');
      expect(keys.next().value).assertEqual('ñ');
      expect(keys.next().value).assertEqual('ç');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest3100
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_3100
     * @tc.desc    Test Set.keys() with surrogate pair characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest3100';
      console.info(`${caseName}, test start`);
      const emoji1: string = '😊';
      const emoji2: string = '🎉';
      const set: collections.Set<string> = new collections.Set<string>([emoji1, emoji2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(emoji1);
      expect(keys.next().value).assertEqual(emoji2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest3200
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_3200
     * @tc.desc    Test Set.keys() with very long strings
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest3200';
      console.info(`${caseName}, test start`);
      const longStr1: string = 'a'.repeat(1000);
      const longStr2: string = 'b'.repeat(1000);
      const set: collections.Set<string> = new collections.Set<string>([longStr1, longStr2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(longStr1);
      expect(keys.next().value).assertEqual(longStr2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest3300
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_3300
     * @tc.desc    Test Set.keys() with large dataset after many modifications
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest3300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest3300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const initialSize: number = 1000;

      for (let i: number = 0; i < initialSize; i++) {
        set.add(i);
      }

      for (let i: number = 0; i < initialSize / 2; i++) {
        set.delete(i);
        set.add(initialSize + i);
      }

      const keysArray: number[] = Array.from(set.keys());
      expect(keysArray.length).assertEqual(initialSize);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest3400
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_3400
     * @tc.desc    Test Set.keys() with multiple NaN values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest3400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, NaN, NaN, 1, NaN]);
      const keys = set.keys();
      const firstResult = keys.next();
      expect(Number.isNaN(firstResult.value as number)).assertEqual(true);
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest3500
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_3500
     * @tc.desc    Test Set.keys() with class instances
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest3500';
      console.info(`${caseName}, test start`);
      const person1: Person = new Person('Alice', 25);
      const person2: Person = new Person('Bob', 30);
      const set: collections.Set<Person> = new collections.Set<Person>([person1, person2]);

      const keys: Iterator<Person> = set.keys();
      const firstPerson: Person | undefined = keys.next().value;
      expect(firstPerson?.name).assertEqual('Alice');
      expect(keys.next().value?.name).assertEqual('Bob');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest3600
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_3600
     * @tc.desc    Test Set.keys() with abstract class implementations
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest3600';
      console.info(`${caseName}, test start`);
      const circle: Shape = new Circle(5);
      const square: Shape = new Square(4);
      const set: collections.Set<Shape> = new collections.Set<Shape>([circle, square]);

      const keys: Iterator<Shape> = set.keys();
      const firstShape: Shape | undefined = keys.next().value;
      expect(firstShape?.getArea()).assertEqual(Math.PI * 25);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest3700
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_3700
     * @tc.desc    Test Set.keys() with Infinity and -Infinity
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest3700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([Infinity, -Infinity, Infinity]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(Infinity);
      expect(keys.next().value).assertEqual(-Infinity);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest3800
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_3800
     * @tc.desc    Test Set.keys() with parameter properties
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest3800';
      console.info(`${caseName}, test start`);
      const car1: Car = new Car('Toyota', 2020);
      const car2: Car = new Car('Honda', 2022);
      const set: collections.Set<Car> = new collections.Set<Car>([car1, car2]);

      const keys: Iterator<Car> = set.keys();
      const firstCar: Car = keys.next().value as Car;
      expect(firstCar?.brand).assertEqual('Toyota');
      expect(firstCar?.getYear()).assertEqual(2020);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest3900
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_3900
     * @tc.desc    Test Set.keys() with static class properties
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest3900';
      console.info(`${caseName}, test start`);
      const config1: Configuration = new Configuration('dev');
      const config2: Configuration = new Configuration('prod');
      const set: collections.Set<Configuration> = new collections.Set<Configuration>([config1, config2]);

      const keys: Iterator<Configuration> = set.keys();
      const firstConfig: Configuration | undefined = keys.next().value;
      expect(firstConfig?.name).assertEqual('dev');
      expect(Configuration.version).assertEqual('1.0.0');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest4000
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_4000
     * @tc.desc    Test Set.keys() with private class methods
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest4000';
      console.info(`${caseName}, test start`);
      const counter1: Counter = new Counter();
      const counter2: Counter = new Counter();
      counter1.increment();
      const set: collections.Set<Counter> = new collections.Set<Counter>([counter1, counter2]);

      const keys: Iterator<Counter> = set.keys();
      const firstCounter: Counter | undefined = keys.next().value;
      expect(firstCounter?.getCount()).assertEqual(1);
      expect(keys.next().value?.getCount()).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest4100
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_4100
     * @tc.desc    Test Set.keys() with protected class members
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest4100';
      console.info(`${caseName}, test start`);
      const child1: Child = new Child(10);
      const child2: Child = new Child(20);
      const set: collections.Set<Child> = new collections.Set<Child>([child1, child2]);

      const keys: Iterator<Child> = set.keys();
      const firstChild: Child | undefined = keys.next().value;
      expect(firstChild?.getValue()).assertEqual(10);
      expect(keys.next().value?.getValue()).assertEqual(20);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest4200
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_4200
     * @tc.desc    Test Set.keys() with static methods
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest4200';
      console.info(`${caseName}, test start`);
      const obj1: MathOperations = new MathOperations();
      const obj2: MathOperations = new MathOperations();
      const set: collections.Set<MathOperations> = new collections.Set<MathOperations>([obj1, obj2]);

      const keys: Iterator<MathOperations> = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
      expect(MathOperations.multiply(3, 4)).assertEqual(12);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetKeysTest4300
     * @tc.number  SUB_COLLECTIONS_SET_KEYS_TEST_4300
     * @tc.desc    Test Set.keys() with abstract methods
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetKeysTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetKeysTest4300';
      console.info(`${caseName}, test start`);
      const phone: Device = new Phone();
      const laptop: Device = new Laptop();
      const set: collections.Set<Device> = new collections.Set<Device>([phone, laptop]);

      const keys: Iterator<Device> = set.keys();
      expect(keys.next().value).assertEqual(phone);
      expect(keys.next().value).assertEqual(laptop);
      console.info(`${caseName}, test end`);
    });

  });
}