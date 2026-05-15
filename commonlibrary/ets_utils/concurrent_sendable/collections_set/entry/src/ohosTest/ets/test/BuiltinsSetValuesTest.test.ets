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
class TestClass {
  public name: string;
  public version: number;
  constructor(name: string, version: number) {
    this.name = name;
    this.version = version;
  }
}

@Sendable
class CustomItem {
  public code: string;
  public value: number;
  constructor(code: string, value: number) {
    this.code = code;
    this.value = value;
  }
}

@Sendable
class CustomNumber {
  private num: number;
  constructor(num: number) {
    this.num = num;
  }
  valueOf(): number {
    return this.num;
  }
}

@Sendable
class Base1 {
  public id: number;
  constructor(id: number) {
    this.id = id;
  }
}

@Sendable
class Derived extends Base1 {
  public name: string;
  constructor(id: number, name: string) {
    super(id);
    this.name = name;
  }
}

export default function BuiltinsSetValuesTest() {
  describe('BuiltinsSetValuesTest', () => {
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
     * @tc.name    builtinsSetValuesTest0100
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_0100
     * @tc.desc    Test Set.values() iteration with basic string elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest0100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['alpha', 'beta', 'gamma']);
      const values = set.values();

      expect(values.next().value).assertEqual('alpha');
      expect(values.next().value).assertEqual('beta');
      expect(values.next().value).assertEqual('gamma');
      expect(values.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest0200
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_0200
     * @tc.desc    Test Set.values() iteration with basic number elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest0200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([5, 10, 15, 20]);
      const values = set.values();

      expect(values.next().value).assertEqual(5);
      expect(values.next().value).assertEqual(10);
      expect(values.next().value).assertEqual(15);
      expect(values.next().value).assertEqual(20);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest0300
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_0300
     * @tc.desc    Test Set.values() with empty Set
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest0300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>();
      const values = set.values();

      expect(values.next().done).assertEqual(true);
      expect(values.next().value).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest0400
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_0400
     * @tc.desc    Test that Set.values() maintains insertion order
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest0400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['first', 'second', 'third']);
      const values = set.values();
      const result: string[] = [];

      let current = values.next();
      while (!current.done) {
        result.push(current.value as string);
        current = values.next();
      }

      expect(result[0]).assertEqual('first');
      expect(result[1]).assertEqual('second');
      expect(result[2]).assertEqual('third');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest0500
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_0500
     * @tc.desc    Test that Set.values() filters duplicate elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest0500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([3, 3, 6, 6, 9]);
      const values = set.values();

      expect(values.next().value).assertEqual(3);
      expect(values.next().value).assertEqual(6);
      expect(values.next().value).assertEqual(9);
      expect(values.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest0600
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_0600
     * @tc.desc    Test Set.values() with boolean elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest0600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>([true, false, true]);
      const values = set.values();

      expect(values.next().value).assertEqual(true);
      expect(values.next().value).assertEqual(false);
      expect(values.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest0700
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_0700
     * @tc.desc    Test Set.values() with NaN elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest0700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, NaN, 7]);
      const values = set.values();

      const firstVal: number = values.next().value as number;
      expect(isNaN(firstVal)).assertEqual(true);
      expect(values.next().value).assertEqual(7);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest0800
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_0800
     * @tc.desc    Test Set.values() with 0 and -0 elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest0800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, -0, 4]);
      const values = set.values();

      expect(values.next().value).assertEqual(0);
      expect(values.next().value).assertEqual(4);
      expect(values.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest0900
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_0900
     * @tc.desc    Test independence of multiple iterators from Set.values()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest0900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      const values1 = set.values();
      const values2 = set.values();

      expect(values1.next().value).assertEqual('a');
      expect(values1.next().value).assertEqual('b');
      expect(values2.next().value).assertEqual('a');
      expect(values1.next().value).assertEqual('c');
      expect(values2.next().value).assertEqual('b');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest1000
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_1000
     * @tc.desc    Test Set.values() after adding elements dynamically
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest1000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      set.add(3);
      set.add(4);
      const values = set.values();

      expect(values.next().value).assertEqual(1);
      expect(values.next().value).assertEqual(2);
      expect(values.next().value).assertEqual(3);
      expect(values.next().value).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest1100
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_1100
     * @tc.desc    Test Set.values() after deleting elements dynamically
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest1100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['x', 'y', 'z']);
      set.delete('y');
      const values = set.values();

      expect(values.next().value).assertEqual('x');
      expect(values.next().value).assertEqual('z');
      expect(values.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest1200
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_1200
     * @tc.desc    Test Set.values() with BigInt elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest1200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<bigint> = new collections.Set<bigint>([100n, 200n, 300n]);
      const values = set.values();

      expect(values.next().value).assertEqual(100n);
      expect(values.next().value).assertEqual(200n);
      expect(values.next().value).assertEqual(300n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest1300
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_1300
     * @tc.desc    Test Set.values() state after full iteration
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest1300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const values = set.values();

      while (!values.next().done) {
      }
      expect(values.next().done).assertEqual(true);
      expect(values.next().value).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest1400
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_1400
     * @tc.desc    Test converting Set.values() iterator to array
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest1400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      const values = set.values();
      const result: string[] = [];

      let current = values.next();
      while (!current.done) {
        result.push(current.value as string);
        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest1500
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_1500
     * @tc.desc    Test iterating Set.values() with for...of loop
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest1500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30]);
      const values = set.values();
      const result: number[] = [];

      let current: IteratorResult<number> = values.next();
      while (!current.done) {
        const val: number = current.value!;
        result.push(val);
        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest1600
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_1600
     * @tc.desc    Test Set.values() with large dataset (1000+ elements)
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest1600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest1600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }

      const values = set.values();
      let count = 0;
      let current = values.next();

      while (!current.done) {
        count++;
        current = values.next();
      }

      expect(count).assertEqual(1000);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest1700
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_1700
     * @tc.desc    Test Set.values() after clear() operation
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest1700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      set.clear();
      const values = set.values();

      expect(values.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest1800
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_1800
     * @tc.desc    Test equivalence of Set.values() and Set.keys()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest1800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const values = set.values();
      const keys = set.keys();

      expect(values.next().value).assertEqual(keys.next().value);
      expect(values.next().value).assertEqual(keys.next().value);
      expect(values.next().value).assertEqual(keys.next().value);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest1900
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_1900
     * @tc.desc    Test explicit type annotation for Set.values() iterator
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest1900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['test']);
      const values = set.values();
      const value: string | undefined = values.next().value;

      expect(value).assertEqual('test');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest2000
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_2000
     * @tc.desc    Test partial iteration with Set.values()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest2000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['one', 'two', 'three', 'four']);
      const values = set.values();

      expect(values.next().value).assertEqual('one');
      expect(values.next().value).assertEqual('two');
      expect(values.next().done).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest2100
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_2100
     * @tc.desc    Test Set.values() with null and undefined elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest2100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined, null]);
      const values = set.values();

      expect(values.next().value).assertEqual(null);
      expect(values.next().value).assertEqual(undefined);
      expect(values.next().done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest2200
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_2200
     * @tc.desc    Test chained iteration with Set.values()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest2200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const values = set.values();

      const first = values.next();
      expect(first.value).assertEqual(1);
      expect(first.done).assertEqual(false);

      const second = values.next();
      expect(second.value).assertEqual(2);
      expect(second.done).assertEqual(false);

      const third = values.next();
      expect(third.value).assertEqual(3);
      expect(third.done).assertEqual(false);

      const done = values.next();
      expect(done.value).assertEqual(undefined);
      expect(done.done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest2300
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_2300
     * @tc.desc    Test Set.values() with mixed type elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest2300';
      console.info(`${caseName}, test start`);
      const mixedSet: collections.Set<string | number | boolean> = new collections.Set<string | number | boolean>(['text', 42, true]);
      const values = mixedSet.values();

      expect(values.next().value).assertEqual('text');
      expect(values.next().value).assertEqual(42);
      expect(values.next().value).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest2400
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_2400
     * @tc.desc    Test Set.values() with elements added after iterator creation
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest2400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const values = set.values();

      set.add(3);
      set.add(4);

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;

      expect(firstVal).assertEqual(1);
      expect(secondVal).assertEqual(2);
      expect(thirdVal).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest2500
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_2500
     * @tc.desc    Test Set.values() with elements deleted after iterator creation
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest2500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      const values = set.values();

      set.delete('b');

      const firstVal: string = values.next().value!;
      const secondVal: string | undefined = values.next().value;

      expect(firstVal).assertEqual('a');
      expect(secondVal).assertEqual('c');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest2600
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_2600
     * @tc.desc    Test Set.values() with iterator reusability
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest2600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20]);
      const values1 = set.values();
      const values2 = set.values();

      const val1: number = values1.next().value!;
      const val2: number = values1.next().value!;

      const val3: number = values2.next().value!;

      expect(val1).assertEqual(10);
      expect(val2).assertEqual(20);
      expect(val3).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest2700
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_2700
     * @tc.desc    Test Set.values() with class instances
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest2700';
      console.info(`${caseName}, test start`);
      const instance1: TestClass = new TestClass('test1', 1);
      const instance2: TestClass = new TestClass('test2', 2);
      const set: collections.Set<TestClass> = new collections.Set<TestClass>([instance1, instance2]);
      const values: Iterator<TestClass> = set.values();

      const firstVal: TestClass = values.next().value!;
      const secondVal: TestClass = values.next().value!;

      expect(firstVal.name).assertEqual('test1');
      expect(secondVal.version).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest2800
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_2800
     * @tc.desc    Test Set.values() with mixed primitive types
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest2800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number | boolean> = new collections.Set<string | number | boolean>(['text', 100, true]);
      const values = set.values();

      const firstVal: string | number | boolean = values.next().value!;
      const secondVal: string | number | boolean = values.next().value!;
      const thirdVal: string | number | boolean = values.next().value!;

      expect(firstVal).assertEqual('text');
      expect(secondVal).assertEqual(100);
      expect(thirdVal).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest2900
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_2900
     * @tc.desc    Test Set.values() with very large numbers
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest2900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([Number.MAX_SAFE_INTEGER, Number.MAX_VALUE]);
      const values = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;

      expect(firstVal).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(secondVal).assertEqual(Number.MAX_VALUE);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest3000
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_3000
     * @tc.desc    Test Set.values() with negative numbers
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest3000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([-1, -5, -10]);
      const values = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;

      expect(firstVal).assertEqual(-1);
      expect(secondVal).assertEqual(-5);
      expect(thirdVal).assertEqual(-10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest3100
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_3100
     * @tc.desc    Test Set.values() with empty strings and whitespace
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest3100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['', ' ', '  ']);
      const values = set.values();

      const firstVal: string = values.next().value!;
      const secondVal: string = values.next().value!;
      const thirdVal: string = values.next().value!;

      expect(firstVal).assertEqual('');
      expect(secondVal).assertEqual(' ');
      expect(thirdVal).assertEqual('  ');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest3200
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_3200
     * @tc.desc    Test Set.values() after multiple add/delete operations
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest3200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.delete(2);
      set.add(4);
      set.add(5);
      set.delete(3);
      const values = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;

      expect(firstVal).assertEqual(1);
      expect(secondVal).assertEqual(4);
      expect(thirdVal).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest3300
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_3300
     * @tc.desc    Test Set.values() with Symbol.iterator polyfill
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest3300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      const values = set.values();
      const result: string[] = [];

      let current: IteratorResult<string> = values.next();
      while (!current.done) {
        const currentVal: string = current.value!;
        result.push(currentVal);
        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest3400
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_3400
     * @tc.desc    Test Set.values() with null and undefined
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest3400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined, null]);
      const values = set.values();

      const firstVal: null | undefined = values.next().value;
      const secondVal: null | undefined = values.next().value;

      expect(firstVal).assertEqual(null);
      expect(secondVal).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest3500
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_3500
     * @tc.desc    Test Set.values() with iterating and modifying simultaneously
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest3500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const values = set.values();
      const result: number[] = [];

      let current: IteratorResult<number> = values.next();
      while (!current.done) {
        const val: number = current.value!;
        result.push(val);

        if (val === 2) {
          set.add(4);
          set.delete(3);
        }

        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest3600
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_3600
     * @tc.desc    Test Set.values() with maximum capacity elements
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest3600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest3600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const maxElements: number = 1000;

      for (let i = 0; i < maxElements; i++) {
        set.add(i);
      }

      const values = set.values();
      let count: number = 0;

      let current: IteratorResult<number> = values.next();
      while (!current.done && count < maxElements) {
        count++;
        current = values.next();
      }
      expect(count).assertEqual(maxElements);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest3700
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_3700
     * @tc.desc    Test Set.values() with elements added through constructor and add()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest3700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['init1', 'init2']);
      set.add('added1');
      set.add('added2');
      set.add('init1');

      const values = set.values();
      const result: string[] = [];
      let next: IteratorResult<string>;

      while (!(next = values.next()).done) {
        result.push(next.value as string);
      }

      expect(result.length).assertEqual(4);
      expect(result).assertContain('init1');
      expect(result).assertContain('init2');
      expect(result).assertContain('added1');
      expect(result).assertContain('added2');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest3800
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_3800
     * @tc.desc    Test Set.values() after clear() operation
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest3800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4]);
      set.clear();

      const values = set.values();
      const firstResult: IteratorResult<number> = values.next();

      expect(firstResult.done).assertEqual(true);
      expect(firstResult.value).assertUndefined();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest3900
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_3900
     * @tc.desc    Test Set.values() with elements removed during iteration
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest3900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30, 40, 50]);
      const values = set.values();
      const result: number[] = [];
      let next: IteratorResult<number>;

      while (!(next = values.next()).done) {
        result.push(next.value as number);
        if (next.value === 30) {
          set.delete(40);
          set.delete(20);
        }
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([10, 20, 30, 50]));
      expect(set.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest4000
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_4000
     * @tc.desc    Test Set.values() with large dataset and conversion to Array
     * @tc.type    Performance
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest4000', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest4000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const targetSize: number = 1000;

      for (let i = 0; i < targetSize; i++) {
        set.add(i);
      }

      const startTime: number = Date.now();
      const valuesArray: number[] = Array.from(set.values());
      const conversionTime: number = Date.now() - startTime;
      expect(valuesArray.length).assertEqual(targetSize);
      expect(valuesArray[0]).assertEqual(0);
      expect(valuesArray[(targetSize - 1) as number]).assertEqual(targetSize - 1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest4100
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_4100
     * @tc.desc    Test Set.values() with elements added/removed before and during iteration
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest4100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const values = set.values();

      expect(values.next().value).assertEqual(1);

      set.delete(2);
      set.add(4);
      set.add(5);

      expect(values.next().value).assertEqual(3);
      expect(values.next().value).assertEqual(4);
      expect(values.next().done).assertEqual(false);
      expect(values.next().done).assertEqual(true);

      expect(JSON.stringify(Array.from(set.values()))).assertDeepEquals(JSON.stringify([1, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest4200
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_4200
     * @tc.desc    Test Set.values() after multiple add/delete cycles
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest4200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();

      set.add('a');
      set.add('b');
      set.delete('a');
      set.add('c');
      set.add('a');
      set.delete('b');
      set.add('d');
      set.delete('c');
      set.add('b');
      set.add('e');

      const values: string[] = Array.from(set.values());

      expect(values).assertDeepEquals(['a', 'd', 'b', 'e']);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest4300
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_4300
     * @tc.desc    Test Set.values() with very large string elements (100k+ characters)
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest4300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest4300';
      console.info(`${caseName}, test start`);
      const str1: string = 'a'.repeat(100000);
      const str2: string = 'b'.repeat(100000);
      const str3: string = 'a'.repeat(100000);

      const set: collections.Set<string> = new collections.Set<string>([str1, str2, str3]);
      const values: string[] = Array.from(set.values());

      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(str1);
      expect(values[1]).assertEqual(str2);
      expect(values[0].length).assertEqual(100000);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest4400
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_4400
     * @tc.desc    Test Set.values() with elements added from another Set's values iterator
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest4400';
      console.info(`${caseName}, test start`);
      const sourceSet: collections.Set<number> = new collections.Set<number>([10, 20, 30, 40]);
      const targetSet: collections.Set<number> = new collections.Set<number>();

      const sourceValues = sourceSet.values();
      let next: IteratorResult<number>;
      while (!(next = sourceValues.next()).done) {
        if ((next?.value) as number % 20 === 0) {
          targetSet.add(next.value as number);
        }
      }

      const targetValues: number[] = Array.from(targetSet.values());
      expect(JSON.stringify(targetValues)).assertDeepEquals(JSON.stringify([20, 40]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest4500
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_4500
     * @tc.desc    Test Set.values() with BigInt values and their string representations
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest4500';
      console.info(`${caseName}, test start`);
      const big1: bigint = 123456789012345678901234567890n;
      const big2: bigint = 123456789012345678901234567890n;
      const bigStr: string = big1.toString();

      const set: collections.Set<bigint | string> = new collections.Set<bigint | string>([big1, big2, bigStr]);
      const values: (bigint | string)[] = Array.from(set.values());

      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(big1);
      expect(values[1]).assertEqual(bigStr);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest4600
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_4600
     * @tc.desc    Test Set.values() with multiple iterators operating simultaneously
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest4600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4, 5]);

      const iter1 = set.values();
      const iter2 = set.values();

      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
      expect(iter1.next().value).assertEqual(2);
      expect(iter2.next().value).assertEqual(2);

      set.delete(3);
      set.add(6);

      expect(iter1.next().value).assertEqual(4);
      expect(iter2.next().value).assertEqual(4);
      expect(iter1.next().value).assertEqual(5);
      expect(iter2.next().value).assertEqual(5);
      expect(iter1.next().value).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest4700
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_4700
     * @tc.desc    Test Set.values() with elements added and removed in high frequency
     * @tc.type    Performance
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest4700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest4700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const operations: number = 1000;

      const startModify: number = Date.now();
      for (let i = 0; i < operations; i++) {
        set.add(i);
        if (i % 3 === 0) {
          set.delete(i);
        }
      }
      const modifyTime: number = Date.now() - startModify;

      const startIter: number = Date.now();
      const values: number[] = Array.from(set.values());
      const iterateTime: number = Date.now() - startIter;

      const deletedCount: number = Math.floor((operations - 1) / 3) + 1;
      const expectedLen: number = operations - deletedCount;

      expect(values.length).assertEqual(expectedLen);
      expect(values[0]).assertEqual(1);
      expect(values[1] % 3 === 0).assertEqual(false);
      expect(values[values.length - 1] % 3 === 0).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest4800
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_4800
     * @tc.desc    Test Set.values() with mixed null/undefined and their string representations
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest4800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined | string> = new collections.Set<null | undefined | string>([
        null, null,
        undefined, undefined,
        'null', 'null',
        'undefined', 'undefined'
      ]);

      const values: (null | undefined | string)[] = Array.from(set.values());

      expect(values.length).assertEqual(4);
      expect(values[0]).assertNull();
      expect(values[1]).assertUndefined();
      expect(values[2]).assertEqual('null');
      expect(values[3]).assertEqual('undefined');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest4900
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_4900
     * @tc.desc    Test Set.values() with custom class instances
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest4900';
      console.info(`${caseName}, test start`);
      const item1: CustomItem = new CustomItem('A', 100);
      const item2: CustomItem = new CustomItem('B', 200);
      const item3: CustomItem = new CustomItem('A', 100);
      const set: collections.Set<CustomItem> = new collections.Set<CustomItem>([item1, item2, item3]);

      const valuesFromForEach: CustomItem[] = [];
      set.forEach((item) => valuesFromForEach.push(item));

      const valuesFromIterator: CustomItem[] = Array.from(set.values());

      expect(valuesFromIterator.length).assertEqual(3);
      expect(valuesFromIterator).assertDeepEquals(valuesFromForEach);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest5000
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_5000
     * @tc.desc    Test Set.values() with elements that are instances of derived classes
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetValuesTest5000';
      console.info(`${caseName}, test start`);
      const base1: Base1 = new Base1(1);
      const base2: Base1 = new Base1(1);
      const derived1: Derived = new Derived(2, 'test');
      const derived2: Derived = new Derived(2, 'test');

      const set: collections.Set<Base1 | Derived> = new collections.Set<Base1 | Derived>([base1, base2, derived1, derived2]);
      const values: (Base1 | Derived)[] = Array.from(set.values());

      expect(values.length).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetValuesTest5100
     * @tc.number  SUB_BUILTINS_SET_VALUES_TEST_5100
     * @tc.desc    Test Set.values() with extremely large dataset (1M+ elements)
     * @tc.type    Performance
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetValuesTest5100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetValues100';
      console.info(`${caseName}, test start`);
      const TARGET_SIZE = 100;
      const HEAD_TAKE   = 10;
      const PERF_FACTOR = 3;
      const POPULATE_BUDGET_MS = 1500 * PERF_FACTOR;
      const ITERATE_BUDGET_MS  = 1200 * PERF_FACTOR;

      const set: collections.Set<number> = new collections.Set<number>();

      const populateStart = Date.now();
      for (let i = 0; i < TARGET_SIZE; i++) {
        set.add(i);
      }
      const populateTime = Date.now() - populateStart;

      expect(set.size).assertEqual(TARGET_SIZE);
      for (let i = TARGET_SIZE - HEAD_TAKE; i < TARGET_SIZE; i++) {
        expect(set.has(i)).assertTrue();
      }

      const iterateStart = Date.now();
      const iterator = set.values();
      for (let i = 0; i < HEAD_TAKE; i++) {
        const r = iterator.next();
        expect(r.done).assertFalse();
        const v = r.value as number;
        expect(v).assertEqual(i);
      }
      const iterateTime = Date.now() - iterateStart;

      expect(populateTime).assertLess(POPULATE_BUDGET_MS);
      expect(iterateTime).assertLess(ITERATE_BUDGET_MS);
      console.info(`${caseName}, test end`);
    });

  });
}