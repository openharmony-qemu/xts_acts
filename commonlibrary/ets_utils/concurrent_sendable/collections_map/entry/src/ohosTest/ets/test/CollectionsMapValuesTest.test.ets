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
import Utils from './Util.test';
import { collections } from '@kit.ArkTS';

@Sendable
class TestClass {
  public prop: string = 'test';
}

export default function CollectionsMapValuesTest() {
  describe('CollectionsMapValuesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      await Utils.msSleep(30);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name    collectionsMapValuesTest0100
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_0100
     * @tc.desc    Basic functionality: values() of empty Map returns empty array
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapValuesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapValuesTest0200
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_0200
     * @tc.desc    Basic functionality: values() with single key-value pair
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapValuesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a']]);
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('a');
    });

    /**
     * @tc.name    collectionsMapValuesTest0300
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_0300
     * @tc.desc    Order preservation: values() maintains insertion order
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapValuesTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[3, 'c'], [1, 'a'], [2, 'b']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('c');
      expect(values[1]).assertEqual('a');
      expect(values[2]).assertEqual('b');
    });

    /**
     * @tc.name    collectionsMapValuesTest0400
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_0400
     * @tc.desc    Key override: values() keeps last set value for duplicate keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapValuesTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'old');
      map.set('key', 'new');
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('new');
    });

    /**
     * @tc.name    collectionsMapValuesTest0500
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_0500
     * @tc.desc    Iterator property: values() returns object with next method
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const iterator: IterableIterator<string> = map.values();
      expect(typeof iterator.next).assertEqual('function');
    });

    /**
     * @tc.name    collectionsMapValuesTest0600
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_0600
     * @tc.desc    Iterator traversal: complete value sequence via next()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'x'], [2, 'y']]);
      const iterator: IterableIterator<string> = map.values();
      expect(iterator.next().value).assertEqual('x');
      expect(iterator.next().value).assertEqual('y');
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.name    collectionsMapValuesTest0700
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_0700
     * @tc.desc    Consistency: values() match values in entries()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[10, 'foo'], [20, 'bar']]);
      const values: string[] = Array.from(map.values());
      const entries: [number, string][] = Array.from(map.entries());
      expect(values[0]).assertEqual(entries[0][1]);
      expect(values[1]).assertEqual(entries[1][1]);
    });

    /**
     * @tc.name    collectionsMapValuesTest0800
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_0800
     * @tc.desc    Consistency: values() match get() results
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[5, 'test']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual(map.get(5));
    });

    /**
     * @tc.name    collectionsMapValuesTest0900
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_0900
     * @tc.desc    String keys: values() with string as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapValuesTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['name', 'test']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('test');
    });

    /**
     * @tc.name    collectionsMapValuesTest1000
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_1000
     * @tc.desc    Boolean keys: values() with boolean as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapValuesTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('yes');
      expect(values[1]).assertEqual('no');
    });

    /**
     * @tc.name    collectionsMapValuesTest1100
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_1100
     * @tc.desc    Null key: values() with null as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<null, string> = new collections.Map<null, string>([[null, 'null value']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('null value');
    });

    /**
     * @tc.name    collectionsMapValuesTest1200
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_1200
     * @tc.desc    Undefined key: values() with undefined as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<undefined, string> = new collections.Map<undefined, string>([[undefined, 'undefined value']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('undefined value');
    });

    /**
     * @tc.name     collectionsMapValuesTest1300
     * @tc.number   SUB_COLLECTIONS_MAP_VALUES_TEST_1300
     * @tc.desc     Original Map unchanged after values()
     * @tc.type     Function
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it('collectionsMapValuesTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a']]);
      Array.from(map.values());
      expect(map.size).assertEqual(1);
      expect(map.get(1)).assertEqual('a');
    });

    /**
     * @tc.name    collectionsMapValuesTest1400
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_1400
     * @tc.desc    Iterator reuse: can traverse multiple times
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a']]);
      const values1: string[] = Array.from(map.values());
      const values2: string[] = Array.from(map.values());
      expect(JSON.stringify(values1)).assertEqual(JSON.stringify(values2));
    });

    /**
     * @tc.name    collectionsMapValuesTest1500
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_1500
     * @tc.desc    New iterator: each values() call returns new iterator
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const iter1: IterableIterator<string> = map.values();
      const iter2: IterableIterator<string> = map.values();
      expect(iter1 === iter2).assertFalse();
    });

    /**
     * @tc.name    collectionsMapValuesTest1600
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_1600
     * @tc.desc    for...of loop over values()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'x'], [2, 'y']]);
      const result: string[] = [];
      for (const value of map.values()) {
        result.push(value);
      }
      expect(result[0]).assertEqual('x');
      expect(result[1]).assertEqual('y');
    });

    /**
     * @tc.name    collectionsMapValuesTest1700
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_1700
     * @tc.desc    values() with NaN as value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, NaN]]);
      const values: number[] = Array.from(map.values());
      expect(values[0] !== values[0]).assertEqual(true);
    });

    /**
     * @tc.name    collectionsMapValuesTest1800
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_1800
     * @tc.desc    values() with Infinity as value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, Infinity]]);
      const values: number[] = Array.from(map.values());
      expect(values[0]).assertEqual(Infinity);
    });

    /**
     * @tc.name    collectionsMapValuesTest1900
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_1900
     * @tc.desc    values() with -Infinity as value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, -Infinity]]);
      const values: number[] = Array.from(map.values());
      expect(values[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.name    collectionsMapValuesTest2000
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_2000
     * @tc.desc    values() with BigInt as value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, bigint> = new collections.Map<number, bigint>([[1, 42n]]);
      const values: bigint[] = Array.from(map.values());
      expect(values[0]).assertEqual(42n);
    });

    /**
     * @tc.name    collectionsMapValuesTest2100
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_2100
     * @tc.desc    values() with class instance as value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance: TestClass = new TestClass();
      const map: collections.Map<number, TestClass> = new collections.Map<number, TestClass>([[1, instance]]);
      const values: TestClass[] = Array.from(map.values());
      expect(values[0]).assertEqual(instance);
      expect(values[0].prop).assertEqual('test');
    });

    /**
     * @tc.name    collectionsMapValuesTest2200
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_2200
     * @tc.desc    values() after clear()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      map.clear();
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapValuesTest2300
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_2300
     * @tc.desc    values() with numeric zero and negative zero as values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 0], [2, -0]]);
      const values: number[] = Array.from(map.values());
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(0);
      expect(1 / values[0]).assertEqual(Infinity);
      expect(1 / values[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.name    collectionsMapValuesTest2400
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_2400
     * @tc.desc    values() with empty string as value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, '']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('');
      expect(values[0].length).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapValuesTest2500
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_2500
     * @tc.desc    values() with large string as value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let largeStr: string = '';
      for (let i: number = 0; i < 1000; i++) {
        largeStr += 'a';
      }
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, largeStr]]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual(largeStr);
      expect(values[0].length).assertEqual(1000);
    });

    /**
     * @tc.name    collectionsMapValuesTest2600
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_2600
     * @tc.desc    values() with multi-line string as value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const multiStr: string = 'line1\nline2';
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, multiStr]]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual(multiStr);
      expect(values[0].split('\n').length).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapValuesTest2700
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_2700
     * @tc.desc    values() with undefined as value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapValuesTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, undefined> = new collections.Map<number, undefined>([[1, undefined]]);
      const values: undefined[] = Array.from(map.values());
      expect(values[0]).assertEqual(undefined);
    });

    /**
     * @tc.name    collectionsMapValuesTest2800
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_2800
     * @tc.desc    values() with large number of entries (1000)
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest2800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const count: number = 1000;
      for (let i: number = 0; i < count; i++) {
        map.set(i, `value-${i}`);
      }
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(count);
      expect(values[999]).assertEqual('value-999');
    });

    /**
     * @tc.name    collectionsMapValuesTest2900
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_2900
     * @tc.desc    values() with Map that has NaN as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[NaN, 'value']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('value');
    });

    /**
     * @tc.name    collectionsMapValuesTest3000
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_3000
     * @tc.desc    values() with Map that has -0 as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[-0, 'value']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('value');
    });

    /**
     * @tc.name    collectionsMapValuesTest3100
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_3100
     * @tc.desc    values() with Map that has 0 and -0 as separate keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[0, 'zero'], [-0, 'neg-zero']]);
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('neg-zero');
    });

    /**
     * @tc.name    collectionsMapValuesTest3200
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_3200
     * @tc.desc    values() with Map created from another Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      const map: collections.Map<number, string> = new collections.Map<number, string>(Array.from(original.entries()));
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
    });

    /**
     * @tc.name    collectionsMapValuesTest3300
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_3300
     * @tc.desc    values() used with Array.prototype.map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 10], [2, 20], [3, 30]]);
      const values: number[] = Array.from(map.values());
      const doubled: number[] = values.map((v: number) => v * 2);
      expect(doubled[0]).assertEqual(20);
      expect(doubled[1]).assertEqual(40);
      expect(doubled[2]).assertEqual(60);
    });

    /**
     * @tc.name    collectionsMapValuesTest3400
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_3400
     * @tc.desc    values() used with Array.prototype.filter
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 5], [2, 15], [3, 25], [4, 5]]);
      const values: number[] = Array.from(map.values());
      const filtered: number[] = values.filter((v: number) => v > 10);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(15);
      expect(filtered[1]).assertEqual(25);
    });

    /**
     * @tc.name    collectionsMapValuesTest3500
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_3500
     * @tc.desc    values() used with Array.prototype.reduce
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 1], [2, 2], [3, 3], [4, 4]]);
      const values: number[] = Array.from(map.values());
      const sum: number = values.reduce((acc: number, curr: number) => acc + curr, 0);

      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name    collectionsMapValuesTest3600
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_3600
     * @tc.desc    values() used with Array.prototype.find
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'apple'], [2, 'banana'], [3, 'cherry']]);
      const values: string[] = Array.from(map.values());
      const found: string | undefined = values.find((v: string) => v.startsWith('b'));
      expect(found).assertEqual('banana');
    });

    /**
     * @tc.name    collectionsMapValuesTest3700
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_3700
     * @tc.desc    values() used with Array.prototype.every
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: collections.Map<number, number> = new collections.Map<number, number>([[1, 5], [2, 10], [3, 15]]);
      const map2: collections.Map<number, number> = new collections.Map<number, number>([[1, 5], [2, 20], [3, 15]]);

      const values1: number[] = Array.from(map1.values());
      const values2: number[] = Array.from(map2.values());

      const allLessThan16: boolean = values1.every((v: number) => v < 16);
      const allLessThan10: boolean = values2.every((v: number) => v < 10);

      expect(allLessThan16).assertEqual(true);
      expect(allLessThan10).assertEqual(false);
    });

    /**
     * @tc.name    collectionsMapValuesTest3800
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_3800
     * @tc.desc    values() used with Array.prototype.some
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: collections.Map<number, string> = new collections.Map<number, string>([[1, 'cat'], [2, 'dog'], [3, 'bird']]);
      const map2: collections.Map<number, string> = new collections.Map<number, string>([[1, 'cat'], [2, 'dog'], [3, 'fish']]);

      const values1: string[] = Array.from(map1.values());
      const values2: string[] = Array.from(map2.values());

      const hasBird: boolean = values1.some((v: string) => v === 'bird');
      const hasBird2: boolean = values2.some((v: string) => v === 'bird');

      expect(hasBird).assertEqual(true);
      expect(hasBird2).assertEqual(false);
    });

    /**
     * @tc.name    collectionsMapValuesTest3900
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_3900
     * @tc.desc    values() with empty values array and array methods
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const values: string[] = Array.from(map.values());

      expect(values.length).assertEqual(0);
      expect(values.every((): boolean => false)).assertEqual(true);
      expect(values.some((): boolean => true)).assertEqual(false);
    });

    /**
     * @tc.name    collectionsMapValuesTest4000
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_4000
     * @tc.desc    values() iterator with spread operator
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
      expect(values[2]).assertEqual('c');
    });

    /**
     * @tc.name    collectionsMapValuesTest4100
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_4100
     * @tc.desc    values() with Map that has been converted to array and back
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      const entries: [number, string][] = Array.from(original.entries());
      const newMap: collections.Map<number, string> = new collections.Map<number, string>(entries);

      const values: string[] = Array.from(newMap.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
    });

    /**
     * @tc.name    collectionsMapValuesTest4200
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_4200
     * @tc.desc    values() with very large values (memory usage test)
     * @tc.type    Performance
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('collectionsMapValuesTest4200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const count: number = 100;
      let largeValue: string = '';
      for (let i: number = 0; i < 100000; i++) {
        largeValue += 'x';
      }
      for (let i: number = 0; i < count; i++) {
        map.set(i, largeValue);
      }
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(count);
      expect(values[0].length).assertEqual(100000);
    });

    /**
     * @tc.name    collectionsMapValuesTest4300
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_4300
     * @tc.desc    values() with Map and same values added and removed
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, 'a');
      map.delete(1);
      map.set(1, 'a');
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('a');
    });

    /**
     * @tc.name    collectionsMapValuesTest4400
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_4400
     * @tc.desc    values() with Map and numeric keys in descending order
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[5, 'e'], [4, 'd'], [3, 'c'], [2, 'b'], [1, 'a']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('e');
      expect(values[1]).assertEqual('d');
      expect(values[2]).assertEqual('c');
      expect(values[3]).assertEqual('b');
      expect(values[4]).assertEqual('a');
    });

    /**
     * @tc.name    collectionsMapValuesTest4500
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_4500
     * @tc.desc    values() with Map and string keys with varying cases
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([
        ['Apple', 'red'],
        ['banana', 'yellow'],
        ['Cherry', 'red']
      ]);
      const values: string[] = Array.from(map.values());

      expect(values[0]).assertEqual('red');
      expect(values[1]).assertEqual('yellow');
      expect(values[2]).assertEqual('red');
    });

    /**
     * @tc.name    collectionsMapValuesTest4600
     * @tc.number  SUB_COLLECTIONS_MAP_VALUES_TEST_4600
     * @tc.desc    values() with Map and dynamic values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapValuesTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let dynamicValue: string = 'initial';
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, dynamicValue]]);
      dynamicValue = 'modified';
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('initial');
    });

  })
}

