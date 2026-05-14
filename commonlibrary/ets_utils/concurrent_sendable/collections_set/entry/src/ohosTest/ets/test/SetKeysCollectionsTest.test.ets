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

export default function SetKeysCollectionsTest() {
  describe('SetKeysCollectionsTest', () => {
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0100
     * @tc.name builtinsAsyncLockConstructorTest0100
     * @tc.desc Test basic functionality of Set.keys() with string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0001';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0200
     * @tc.name builtinsAsyncLockConstructorTest0200
     * @tc.desc Test Set.keys() with number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0002';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0300
     * @tc.name builtinsAsyncLockConstructorTest0300
     * @tc.desc Test Set.keys() on empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0003';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const keys = set.keys();
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0400
     * @tc.name builtinsAsyncLockConstructorTest0400
     * @tc.desc Test that Set.keys() preserves insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0004';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0500
     * @tc.name builtinsAsyncLockConstructorTest0500
     * @tc.desc Test Set.keys() with duplicate elements (which get ignored)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0005';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0600
     * @tc.name builtinsAsyncLockConstructorTest0600
     * @tc.desc Test Set.keys() with mixed data types (number, string, boolean, null, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0006';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0700
     * @tc.name builtinsAsyncLockConstructorTest0700
     * @tc.desc Test Set.keys() with NaN elements (which are considered equal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0008';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, NaN, 10]);
      const keys = set.keys();
      expect(Number.isNaN(keys.next().value as number)).assertEqual(true);
      expect(keys.next().value).assertEqual(10);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0800
     * @tc.name builtinsAsyncLockConstructorTest0800
     * @tc.desc Test Set.keys() with 0 and -0 (treated as equal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0009';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, -0, 1]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(0);
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0900
     * @tc.name builtinsAsyncLockConstructorTest0900
     * @tc.desc Test that each call to keys() returns a new iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0010';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1000
     * @tc.name builtinsAsyncLockConstructorTest1000
     * @tc.desc Test Set.keys() after adding new elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0011';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1100
     * @tc.name builtinsAsyncLockConstructorTest1100
     * @tc.desc Test Set.keys() after deleting an element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0012';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1200
     * @tc.name builtinsAsyncLockConstructorTest1200
     * @tc.desc Test Set.keys() with BigInt elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0013';
      console.info(`${caseName}, test start`);
      const set: collections.Set<bigint> = new collections.Set<bigint>([1n, 2n, 3n]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1n);
      expect(keys.next().value).assertEqual(2n);
      expect(keys.next().value).assertEqual(3n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1300
     * @tc.name builtinsAsyncLockConstructorTest1300
     * @tc.desc Test iterator state after complete iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0015';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1400
     * @tc.name builtinsAsyncLockConstructorTest1400
     * @tc.desc Test converting Set.keys() iterator to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0018';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1500
     * @tc.name builtinsAsyncLockConstructorTest1500
     * @tc.desc Test iterating over Set.keys() with for...of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0019';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1600
     * @tc.name builtinsAsyncLockConstructorTest1600
     * @tc.desc Test Set.keys() with SameValueZero comparison (0, -0, false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0020';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | boolean> = new collections.Set<number | boolean>([0, -0, false]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(0);
      expect(keys.next().value).assertEqual(false);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1700
     * @tc.name builtinsAsyncLockConstructorTest1700
     * @tc.desc Test Set.keys() with large number of elements (1000 elements)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0021';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1800
     * @tc.name builtinsAsyncLockConstructorTest1800
     * @tc.desc Test Set.keys() after calling clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0022';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();
      const keys = set.keys();
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1900
     * @tc.name builtinsAsyncLockConstructorTest1900
     * @tc.desc Test that keys() and values() return same iterator for Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0023';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b']);
      const keys = set.keys();
      const values = set.values();
      expect(keys.next().value).assertEqual(values.next().value);
      expect(keys.next().value).assertEqual(values.next().value);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2000
     * @tc.name builtinsAsyncLockConstructorTest2000
     * @tc.desc Test that keys() returns an iterator object with next() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0024';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const keys = set.keys();
      expect(typeof keys.next).assertEqual('function');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2100
     * @tc.name builtinsAsyncLockConstructorTest2100
     * @tc.desc Test partial iteration with Set.keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0027';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4, 5]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2200
     * @tc.name builtinsAsyncLockConstructorTest2200
     * @tc.desc Test Set.keys() with null and undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0028';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined, null, undefined]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(null);
      expect(keys.next().value).assertEqual(undefined);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2300
     * @tc.name builtinsAsyncLockConstructorTest2300
     * @tc.desc Test chained iteration with Set.keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0029';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2400
     * @tc.name builtinsAsyncLockConstructorTest2400
     * @tc.desc Test Set.keys() with elements added in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0031';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2500
     * @tc.name builtinsAsyncLockConstructorTest2500
     * @tc.desc Test Set.keys() with elements added and removed multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0032';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2600
     * @tc.name builtinsAsyncLockConstructorTest2600
     * @tc.desc Test Set.keys() with Symbol.iterator call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0033';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b']);
      const keys: Iterator<string> = set.keys();

      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual('b');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2700
     * @tc.name builtinsAsyncLockConstructorTest2700
     * @tc.desc Test Set.keys() with very large integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0034';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2800
     * @tc.name builtinsAsyncLockConstructorTest2800
     * @tc.desc Test Set.keys() with empty strings and whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0035';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['', ' ', '  ']);
      const keys = set.keys();
      expect(keys.next().value).assertEqual('');
      expect(keys.next().value).assertEqual(' ');
      expect(keys.next().value).assertEqual('  ');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2900
     * @tc.name builtinsAsyncLockConstructorTest2900
     * @tc.desc Test Set.keys() with iterating during concurrent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0038';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3000
     * @tc.name builtinsAsyncLockConstructorTest3000
     * @tc.desc Test Set.keys() with Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0040';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3100
     * @tc.name builtinsAsyncLockConstructorTest3100
     * @tc.desc Test Set.keys() with surrogate pair characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0041';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3200
     * @tc.name builtinsAsyncLockConstructorTest3200
     * @tc.desc Test Set.keys() with very long strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0042';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3300
     * @tc.name builtinsAsyncLockConstructorTest3300
     * @tc.desc Test Set.keys() with large dataset after many modifications
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0048';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3400
     * @tc.name builtinsAsyncLockConstructorTest3400
     * @tc.desc Test Set.keys() with multiple NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0064';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3500
     * @tc.name builtinsAsyncLockConstructorTest3500
     * @tc.desc Test Set.keys() with class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0079';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3600
     * @tc.name builtinsAsyncLockConstructorTest3600
     * @tc.desc Test Set.keys() with abstract class implementations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0080';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3700
     * @tc.name builtinsAsyncLockConstructorTest3700
     * @tc.desc Test Set.keys() with Infinity and -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0065';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([Infinity, -Infinity, Infinity]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(Infinity);
      expect(keys.next().value).assertEqual(-Infinity);
      expect(keys.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3800
     * @tc.name builtinsAsyncLockConstructorTest3800
     * @tc.desc Test Set.keys() with parameter properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0094';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3900
     * @tc.name builtinsAsyncLockConstructorTest3900
     * @tc.desc Test Set.keys() with static class properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0095';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4000
     * @tc.name builtinsAsyncLockConstructorTest4000
     * @tc.desc Test Set.keys() with private class methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0096';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4100
     * @tc.name builtinsAsyncLockConstructorTest4100
     * @tc.desc Test Set.keys() with protected class members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0097';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4200
     * @tc.name builtinsAsyncLockConstructorTest4200
     * @tc.desc Test Set.keys() with static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0098';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4300
     * @tc.name builtinsAsyncLockConstructorTest4300
     * @tc.desc Test Set.keys() with abstract methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysCollections0099';
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