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
class KeyClass {
  public id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

@Sendable
class TestClass {
  public value: number = 0;

  constructor(value: number) {
    this.value = value;
  }
}

export default function CollectionsMapEntriesTest() {
  describe('CollectionsMapEntriesTest', () => {
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
     * @tc.name    collectionsMapEntriesTest0100
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_0100
     * @tc.desc    Verify entries() returns iterator for non-empty ArkTS Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapEntriesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      const entries = map.entries();
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify(['a', 1]));
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify(['b', 2]));
      expect(entries.next().done).assertEqual(true);
    });

    /**
     * @tc.name    collectionsMapEntriesTest0200
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_0200
     * @tc.desc    Verify entries() returns empty iterator for empty ArkTS Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapEntriesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const entries = map.entries();
      expect(entries.next().done).assertEqual(true);
    });

    /**
     * @tc.name    collectionsMapEntriesTest0300
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_0300
     * @tc.desc    Verify entries() returns entries in insertion order
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapEntriesTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(3, 'three');
      map.set(1, 'one');
      map.set(2, 'two');

      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[3, 'three'], [1, 'one'], [2, 'two']]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest0400
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_0400
     * @tc.desc    Verify entries() works with number keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapEntriesTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 'one'], [2, 'two']]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest0500
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_0500
     * @tc.desc    Verify entries() works with string keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapEntriesTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['one', 1], ['two', 2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['one', 1], ['two', 2]]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest0600
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_0600
     * @tc.desc    Verify entries() works with boolean keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[true, 'yes'], [false, 'no']]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest0700
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_0700
     * @tc.desc    Verify entries() works with Map containing null values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, null> = new collections.Map<string, null>([['a', null], ['b', null]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['a', null], ['b', null]]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest0800
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_0800
     * @tc.desc    Verify entries() works with Map containing undefined values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, undefined> = new collections.Map<string, undefined>([['a', undefined], ['b', undefined]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['a', undefined], ['b', undefined]]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest0900
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_0900
     * @tc.desc    Verify entries() works with large Map (100 entries)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 100; i++) {
        map.set(i, i * 2);
      }

      const entries = Array.from(map.entries());
      expect(entries.length).assertDeepEquals(100);
      expect(JSON.stringify(entries[50])).assertDeepEquals(JSON.stringify([50, 100]));
      expect(JSON.stringify(entries[99])).assertDeepEquals(JSON.stringify([99, 198]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest1000
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_1000
     * @tc.desc    Verify entries() iterator can be iterated with for...of loop
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2], ['c', 3]]);
      const results: [string, number][] = [];

      for (const entry of map.entries()) {
        results.push(entry);
      }

      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([['a', 1], ['b', 2], ['c', 3]]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest1100
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_1100
     * @tc.desc    Verify entries() returns new iterator each time it's called
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const entries1 = map.entries();
      const entries2 = map.entries();

      expect(JSON.stringify(entries1.next().value)).assertDeepEquals(JSON.stringify([1, 'one']));
      expect(JSON.stringify(entries2.next().value)).assertDeepEquals(JSON.stringify([1, 'one']));
    });

    /**
     * @tc.name    collectionsMapEntriesTest1200
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_1200
     * @tc.desc    Verify entries() works with Map created from another Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const map: collections.Map<number, string> = new collections.Map<number, string>(Array.from(original.entries()));
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 'one'], [2, 'two']]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest1300
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_1300
     * @tc.desc    Verify entries() works with Map containing NaN keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsMapEntriesTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[NaN, 'not a number'], [NaN, 'another NaN']]);
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(1);
      expect(isNaN(entries[0][0])).assertEqual(true);
    });

    /**
     * @tc.name    collectionsMapEntriesTest1400
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_1400
     * @tc.desc    Verify entries() iterator is not affected by value modifications
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const entries = map.entries();

      map.set(1, 'modified');

      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify([1, 'modified']));
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify([2, 'two']));
    });

    /**
     * @tc.name    collectionsMapEntriesTest1500
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_1500
     * @tc.desc    Verify entries() iterator can be restarted by creating new iterator
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      const entries1 = map.entries();
      entries1.next();

      const entries2 = map.entries();
      expect(JSON.stringify(entries2.next().value)).assertDeepEquals(JSON.stringify(['a', 1]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest1600
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_1600
     * @tc.desc    Verify entries() works with Map containing 0 and -0 as distinct keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsMapEntriesTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[0, 'zero'], [-0, 'negative zero']]);
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(1);
      expect(JSON.stringify(entries[0])).assertDeepEquals(JSON.stringify([0, 'negative zero']));
    });

    /**
     * @tc.name    collectionsMapEntriesTest1700
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_1700
     * @tc.desc    Verify entries() iterator can be converted to array using spread operator
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, boolean> = new collections.Map<string, boolean>([['active', true], ['visible', false]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['active', true], ['visible', false]]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest1800
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_1800
     * @tc.desc    Verify entries() works with Map after multiple set and delete operations
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, 'one');
      map.set(2, 'two');
      map.delete(1);
      map.set(3, 'three');
      map.set(2, 'modified two');

      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[2, 'modified two'], [3, 'three']]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest1900
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_1900
     * @tc.desc    Test entries with KeyClass as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key1 = new KeyClass(1);
      const key2 = new KeyClass(2);
      const map: collections.Map<KeyClass, string> = new collections.Map<KeyClass, string>([[key1, 'first'], [key2, 'second']]);
      const entries: [KeyClass, string][] = Array.from(map.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0].id).assertEqual(1);
      expect(entries[1][0].id).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapEntriesTest2000
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_2000
     * @tc.desc    Verify entries() works with Map containing empty string keys and values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['', 'empty key'], ['key', '']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['', 'empty key'], ['key', '']]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest2100
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_2100
     * @tc.desc    Verify entries() iterator can be used in Array.from with mapping function
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 10], [2, 20]]);
      const mapped: number[] = Array.from(map.entries(), (entry: [number, number]) => entry[0] * entry[1]);
      expect(JSON.stringify(mapped)).assertDeepEquals(JSON.stringify([10, 40]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest2200
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_2200
     * @tc.desc    Verify entries() works with Map containing Unicode characters in keys and values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['café', 'coffee'], ['cœur', 'heart']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['café', 'coffee'], ['cœur', 'heart']]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest2300
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_2300
     * @tc.desc    Verify entries() works with Map containing Infinity and -Infinity as values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['inf', Infinity], ['ninf', -Infinity]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['inf', Infinity], ['ninf', -Infinity]]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest2400
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_2400
     * @tc.desc    Verify entries() works with Map containing multi-line string values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([
        [1, 'line1\nline2'],
        [2, 'single line']
      ]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([
        [1, 'line1\nline2'],
        [2, 'single line']
      ]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest2500
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_2500
     * @tc.desc    Verify entries() works with Map containing special Unicode characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([
        ['emoji', '😊🎉'],
        ['math', '∑∫∂'],
        ['cyrillic', 'привет']
      ]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([
        ['emoji', '😊🎉'],
        ['math', '∑∫∂'],
        ['cyrillic', 'привет']
      ]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest2600
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_2600
     * @tc.desc    Verify entries() works with Map containing numbers in scientific notation
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([
        [1e3, 2e3],
        [3e-4, 4e-5]
      ]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([
        [1e3, 2e3],
        [3e-4, 4e-5]
      ]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest2700
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_2700
     * @tc.desc    Verify entries() works with Map after clear()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      map.clear();
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapEntriesTest2800
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_2800
     * @tc.desc    Verify entries() iterator continues correctly after partial iteration
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
      const entries = map.entries();

      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify(['a', 1]));
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify(['b', 2]));

      const remainingEntries: [string, number][] = [];
      let result: IteratorResult<[string, number]> = entries.next();
      while (!result.done) {
        if (result.value != undefined) remainingEntries.push(result.value!);
        result = entries.next();
      }
      expect(JSON.stringify(remainingEntries)).assertDeepEquals(JSON.stringify([['c', 3], ['d', 4]]));
    });

    /**
     * @tc.name    collectionsMapEntriesTest2900
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_2900
     * @tc.desc    Test entries with TestClass as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsMapEntriesTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const instance1 = new TestClass(10);
      const instance2 = new TestClass(10);
      const map: collections.Map<TestClass, string> = new collections.Map<TestClass, string>([[instance1, 'first'], [instance2, 'second']]);
      const entries: [TestClass, string][] = Array.from(map.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(instance1);
      expect(entries[1][0]).assertEqual(instance2);
    });

    /**
     * @tc.name    collectionsMapEntriesTest3000
     * @tc.number  SUB_COLLECTIONS_MAP_ENTRIES_TEST_3000
     * @tc.desc    Verify entries() works with Map containing large string values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapEntriesTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeString: string = '';
      for (let i: number = 0; i < 10000; i++) {
        largeString += 'a';
      }
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, largeString], [2, 'small']]);
      const entries = Array.from(map.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, largeString], [2, 'small']]));
      expect(entries[0][1].length).assertEqual(10000);
    });

  })
}

