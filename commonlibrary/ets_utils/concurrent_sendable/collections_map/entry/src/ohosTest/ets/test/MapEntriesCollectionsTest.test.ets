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

export default function MapEntriesCollectionsTest() {
  describe('MapEntriesCollectionsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0001
     * @tc.name mapEntriesCollectionsTest0001
     * @tc.desc Verify entries() returns iterator for non-empty ArkTS Map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapEntriesCollectionsTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      const entries = map.entries();
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify(['a', 1]));
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify(['b', 2]));
      expect(entries.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0002
     * @tc.name mapEntriesCollectionsTest0002
     * @tc.desc Verify entries() returns empty iterator for empty ArkTS Map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapEntriesCollectionsTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const entries = map.entries();
      expect(entries.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0003
     * @tc.name mapEntriesCollectionsTest0003
     * @tc.desc Verify entries() returns entries in insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapEntriesCollectionsTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(3, 'three');
      map.set(1, 'one');
      map.set(2, 'two');

      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[3, 'three'], [1, 'one'], [2, 'two']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0004
     * @tc.name mapEntriesCollectionsTest0004
     * @tc.desc Verify entries() works with number keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapEntriesCollectionsTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 'one'], [2, 'two']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0005
     * @tc.name mapEntriesCollectionsTest0005
     * @tc.desc Verify entries() works with string keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapEntriesCollectionsTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['one', 1], ['two', 2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['one', 1], ['two', 2]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0006
     * @tc.name mapEntriesCollectionsTest0006
     * @tc.desc Verify entries() works with boolean keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[true, 'yes'], [false, 'no']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0007
     * @tc.name mapEntriesCollectionsTest0007
     * @tc.desc Verify entries() works with Map containing null values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, null> = new collections.Map<string, null>([['a', null], ['b', null]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['a', null], ['b', null]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0008
     * @tc.name mapEntriesCollectionsTest0008
     * @tc.desc Verify entries() works with Map containing undefined values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, undefined> = new collections.Map<string, undefined>([['a', undefined], ['b', undefined]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['a', undefined], ['b', undefined]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0009
     * @tc.name mapEntriesCollectionsTest0009
     * @tc.desc Verify entries() works with large Map (100 entries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0010
     * @tc.name mapEntriesCollectionsTest0010
     * @tc.desc Verify entries() iterator can be iterated with for...of loop
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2], ['c', 3]]);
      const results: [string, number][] = [];

      for (const entry of map.entries()) {
        results.push(entry);
      }

      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([['a', 1], ['b', 2], ['c', 3]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0011
     * @tc.name mapEntriesCollectionsTest0011
     * @tc.desc Verify entries() returns new iterator each time it's called
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const entries1 = map.entries();
      const entries2 = map.entries();

      expect(JSON.stringify(entries1.next().value)).assertDeepEquals(JSON.stringify([1, 'one']));
      expect(JSON.stringify(entries2.next().value)).assertDeepEquals(JSON.stringify([1, 'one']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0012
     * @tc.name mapEntriesCollectionsTest0012
     * @tc.desc Verify entries() works with Map created from another Map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const original: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const map: collections.Map<number, string> = new collections.Map<number, string>(Array.from(original.entries()));
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 'one'], [2, 'two']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0013
     * @tc.name mapEntriesCollectionsTest0013
     * @tc.desc Verify entries() works with Map containing NaN keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapEntriesCollectionsTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[NaN, 'not a number'], [NaN, 'another NaN']]);
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(1);
      expect(isNaN(entries[0][0])).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0014
     * @tc.name mapEntriesCollectionsTest0014
     * @tc.desc Verify entries() iterator is not affected by value modifications
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const entries = map.entries();

      map.set(1, 'modified');

      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify([1, 'modified']));
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify([2, 'two']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0015
     * @tc.name mapEntriesCollectionsTest0015
     * @tc.desc Verify entries() iterator can be restarted by creating new iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      const entries1 = map.entries();
      entries1.next();

      const entries2 = map.entries();
      expect(JSON.stringify(entries2.next().value)).assertDeepEquals(JSON.stringify(['a', 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0016
     * @tc.name mapEntriesCollectionsTest0016
     * @tc.desc Verify entries() works with Map containing 0 and -0 as distinct keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapEntriesCollectionsTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[0, 'zero'], [-0, 'negative zero']]);
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(1);
      expect(JSON.stringify(entries[0])).assertDeepEquals(JSON.stringify([0, 'negative zero']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0017
     * @tc.name mapEntriesCollectionsTest0017
     * @tc.desc Verify entries() iterator can be converted to array using spread operator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, boolean> = new collections.Map<string, boolean>([['active', true], ['visible', false]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['active', true], ['visible', false]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0018
     * @tc.name mapEntriesCollectionsTest0018
     * @tc.desc Verify entries() works with Map after multiple set and delete operations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0019
     * @tc.name mapEntriesCollectionsTest0019
     * @tc.desc Test entries with KeyClass as key
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const key1 = new KeyClass(1);
      const key2 = new KeyClass(2);
      const map: collections.Map<KeyClass, string> = new collections.Map<KeyClass, string>([[key1, 'first'], [key2, 'second']]);
      const entries: [KeyClass, string][] = Array.from(map.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0].id).assertEqual(1);
      expect(entries[1][0].id).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0020
     * @tc.name mapEntriesCollectionsTest0020
     * @tc.desc Verify entries() works with Map containing empty string keys and values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['', 'empty key'], ['key', '']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['', 'empty key'], ['key', '']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0021
     * @tc.name mapEntriesCollectionsTest0021
     * @tc.desc Verify entries() iterator can be used in Array.from with mapping function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 10], [2, 20]]);
      const mapped: number[] = Array.from(map.entries(), (entry: [number, number]) => entry[0] * entry[1]);
      expect(JSON.stringify(mapped)).assertDeepEquals(JSON.stringify([10, 40]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0022
     * @tc.name mapEntriesCollectionsTest0022
     * @tc.desc Verify entries() works with Map containing Unicode characters in keys and values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['café', 'coffee'], ['cœur', 'heart']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['café', 'coffee'], ['cœur', 'heart']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0023
     * @tc.name mapEntriesCollectionsTest0023
     * @tc.desc Verify entries() works with Map containing Infinity and -Infinity as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['inf', Infinity], ['ninf', -Infinity]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['inf', Infinity], ['ninf', -Infinity]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0024
     * @tc.name mapEntriesCollectionsTest0024
     * @tc.desc Verify entries() works with Map containing multi-line string values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0025
     * @tc.name mapEntriesCollectionsTest0025
     * @tc.desc Verify entries() works with Map containing special Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0026
     * @tc.name mapEntriesCollectionsTest0026
     * @tc.desc Verify entries() works with Map containing numbers in scientific notation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0027
     * @tc.name mapEntriesCollectionsTest0027
     * @tc.desc Verify entries() works with Map after clear()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      map.clear();
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0028
     * @tc.name mapEntriesCollectionsTest0028
     * @tc.desc Verify entries() iterator continues correctly after partial iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0029
     * @tc.name mapEntriesCollectionsTest0029
     * @tc.desc Test entries with TestClass as key
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapEntriesCollectionsTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const instance1 = new TestClass(10);
      const instance2 = new TestClass(10);
      const map: collections.Map<TestClass, string> = new collections.Map<TestClass, string>([[instance1, 'first'], [instance2, 'second']]);
      const entries: [TestClass, string][] = Array.from(map.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(instance1);
      expect(entries[1][0]).assertEqual(instance2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ENTRIES_COLLECTIONS_TEST_0030
     * @tc.name mapEntriesCollectionsTest0030
     * @tc.desc Verify entries() works with Map containing large string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapEntriesCollectionsTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
