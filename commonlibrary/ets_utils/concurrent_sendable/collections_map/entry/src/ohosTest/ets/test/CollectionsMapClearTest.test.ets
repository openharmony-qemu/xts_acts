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

export default function CollectionsMapClearTest() {
  describe('CollectionsMapClearTest', () => {
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
     * @tc.name    collectionsMapClearTest0100
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_0100
     * @tc.desc    Clear an empty ArkTS Map, check size is 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest0200
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_0200
     * @tc.desc    Clear a ArkTS Map with one element, check size is 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest0300
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_0300
     * @tc.desc    Clear a ArkTS Map with multiple elements, check size is 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, 'a');
      map.set(2, 'b');
      map.set(3, 'c');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest0400
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_0400
     * @tc.desc    After clear, check if original key exists
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.has('key')).assertEqual(false);
    });

    /**
     * @tc.name    collectionsMapClearTest0500
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_0500
     * @tc.desc    After clear, check if get returns undefined for original key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.name    collectionsMapClearTest0600
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_0600
     * @tc.desc    Clear a ArkTS Map with number keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(100, 'hundred');
      map.set(200, 'two hundred');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest0700
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_0700
     * @tc.desc    Clear a ArkTS Map with boolean keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest0800
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_0800
     * @tc.desc    Clear a ArkTS Map with null key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number | null, string> = new collections.Map<number | null, string>();
      map.set(null, 'null value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest0900
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_0900
     * @tc.desc    Clear a ArkTS Map with undefined key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number | undefined, string> = new collections.Map<number | undefined, string>();
      map.set(undefined, 'undefined value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest1000
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_1000
     * @tc.desc    Clear a ArkTS Map and check entries iterator is empty
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      const entries: [string, number][] = Array.from(map.entries());
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest1100
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_1100
     * @tc.desc    Clear a ArkTS Map and check keys iterator is empty
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapClearTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      const keys: string[] = Array.from(map.keys());
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest1200
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_1200
     * @tc.desc    Clear a ArkTS Map and check values iterator is empty
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      const values: number[] = Array.from(map.values());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest1300
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_1300
     * @tc.desc    Call clear multiple times on the same ArkTS Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.clear();
      map.clear();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest1400
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_1400
     * @tc.desc    Clear a ArkTS Map and then add new elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string,string> = new collections.Map<string, string>();
      map.set('old', 'value');
      map.clear();
      map.set('new', 'value');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.name    collectionsMapClearTest1500
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_1500
     * @tc.desc    Clear a ArkTS Map created from an array of pairs
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [string, number][] = [['a', 1], ['b', 2], ['c', 3]];
      const map: collections.Map<string, number> = new collections.Map<string, number>(pairs);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest1600
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_1600
     * @tc.desc    Clear a ArkTS Map created from another Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: collections.Map<string, number> = new collections.Map<string, number>();
      original.set('a', 1);
      const map: collections.Map<string, number> = new collections.Map<string, number>(Array.from(original.entries()));
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest1700
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_1700
     * @tc.desc    Clear a large ArkTS Map with 1000 elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i * 2);
      }
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest1800
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_1800
     * @tc.desc    Clear a ArkTS Map and check forEach doesn't execute
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1);
      map.clear();
      let count: number = 0;
      map.forEach((value: number, key: string) => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest1900
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_1900
     * @tc.desc    Clear a ArkTS Map with large integer keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(9007199254740991, 'max safe integer');
      map.set(9007199254740992, 'beyond max safe integer');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest2000
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_2000
     * @tc.desc    Clear a ArkTS Map and verify with has() for multiple keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      const key1 = 'key1';
      const key2 = 'key2';
      const key3 = 'key3';
      map.set(key1, 1);
      map.set(key2, 2);
      map.set(key3, 3);
      map.clear();
      expect(map.has(key1)).assertEqual(false);
      expect(map.has(key2)).assertEqual(false);
      expect(map.has(key3)).assertEqual(false);
    });

    /**
     * @tc.name    collectionsMapClearTest2100
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_2100
     * @tc.desc    Clear a ArkTS Map and check after setting same key again
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const key = 'key';
      map.set(key, 'old');
      map.clear();
      map.set(key, 'new');
      expect(map.get(key)).assertEqual('new');
    });

    /**
     * @tc.name    collectionsMapClearTest2200
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_2200
     * @tc.desc    Clear a ArkTS Map with Infinity as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(Infinity, 'infinite');
      map.set(-Infinity, 'negative infinite');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest2300
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_2300
     * @tc.desc    Clear a ArkTS Map with NaN as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(NaN, 'not a number');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest2400
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_2400
     * @tc.desc    Clear a ArkTS Map and check if it's iterable (should be empty)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      let count: number = 0;
      for (const entry of map) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest2500
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_2500
     * @tc.desc    Clear a ArkTS Map and check with JSON.stringify
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [string, number][] = [['a', 1]];
      const map: collections.Map<string, number> = new collections.Map<string, number>(pairs);
      map.clear();
      expect(JSON.stringify(Array.from(map))).assertEqual('[]');
    });

    /**
     * @tc.name    collectionsMapClearTest2600
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_2600
     * @tc.desc    Clear a ArkTS Map that's been assigned to another variable
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: collections.Map<string, string> = new collections.Map<string, string>();
      map1.set('key', 'value');
      const map2: collections.Map<string, string> = map1;
      map2.clear();
      expect(map1.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest2700
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_2700
     * @tc.desc    Clear a ArkTS Map and check prototype methods still work
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1);
      map.clear();
      map.set('b', 2);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapClearTest2800
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_2800
     * @tc.desc    Clear a ArkTS Map with elements added after previous clear
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('first', 1);
      map.clear();
      map.set('second', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest2900
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_2900
     * @tc.desc    Clear a ArkTS Map with Unicode string keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('café', 'coffee');
      map.set('café', 'coffee');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest3000
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_3000
     * @tc.desc    Clear a ArkTS Map with empty string key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('', 'empty string');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest3100
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_3100
     * @tc.desc    Clear a ArkTS Map with large integer keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(9007199254740991, 'max safe integer');
      map.set(9007199254740992, 'beyond max safe integer');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest3200
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_3200
     * @tc.desc    Clear a ArkTS Map with negative number keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(-1, 'negative one');
      map.set(-100, 'negative hundred');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest3300
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_3300
     * @tc.desc    Clear a ArkTS Map with floating point number keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(3.14, 'pi');
      map.set(2.718, 'e');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest3400
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_3400
     * @tc.desc    Clear a ArkTS Map and check if it's empty using Array.from
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(Array.from(map).length).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest3500
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_3500
     * @tc.desc    Clear a ArkTS Map and then delete a key (should have no effect)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [string, string][] = [['key', 'value']];
      const map: collections.Map<string, string> = new collections.Map<string, string>(pairs);
      map.clear();
      const result = map.delete('key');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name    collectionsMapClearTest3600
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_3600
     * @tc.desc    Clear a ArkTS Map with a ArkTS Map as a value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const innerMap = new collections.Map<string, string>([['inner', 'value']]);
      const outerMap = new collections.Map<string, collections.Map<string, string>>([['outer', innerMap]]);
      outerMap.clear();
      expect(outerMap.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest3700
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_3700
     * @tc.desc    Clear a ArkTS Map and check with Map.prototype.keys.next()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(map.keys().next().done).assertEqual(true);
    });

    /**
     * @tc.name    collectionsMapClearTest3800
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_3800
     * @tc.desc    Clear a ArkTS Map and check with Map.prototype.values.next()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(map.values().next().done).assertEqual(true);
    });

    /**
     * @tc.name    collectionsMapClearTest3900
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_3900
     * @tc.desc    Clear a ArkTS Map and check with Map.prototype.entries.next()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(map.entries().next().done).assertEqual(true);
    });

    /**
     * @tc.name    collectionsMapClearTest4000
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_4000
     * @tc.desc    Clear a ArkTS Map and then check with a for loop using keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      let iterationCount: number = 0;

      for (const key of map.keys()) {
        iterationCount++;
      }

      expect(iterationCount).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest4100
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_4100
     * @tc.desc    Clear a ArkTS Map and then check with a for loop using values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      let iterationCount: number = 0;

      for (const value of map.values()) {
        iterationCount++;
      }

      expect(iterationCount).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapClearTest4200
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_4200
     * @tc.desc    Clear a ArkTS Map and check with JSON.stringify after converting to array
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(JSON.stringify(Array.from(map.entries()))).assertEqual('[]');
    });

    /**
     * @tc.name    collectionsMapClearTest4300
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_4300
     * @tc.desc    Clear a ArkTS Map and then check if the map is equal to a new empty map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      const map = new collections.Map<number, string>([[1, 'a']]);
      map.clear();
      const emptyMap: collections.Map<string, string> = new collections.Map<string, string>();
      expect(Array.from(map)).assertDeepEquals(Array.from(emptyMap));
    });

    /**
     * @tc.name    collectionsMapClearTest4400
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_4400
     * @tc.desc    Clear a ArkTS Map and check that the map is an instance of Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(map instanceof collections.Map).assertEqual(true);
    });

    /**
     * @tc.name    collectionsMapClearTest4500
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_TEST_4500
     * @tc.desc    Clear a ArkTS Map and check that the clear method still exists
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapClearTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(typeof map.clear).assertEqual('function');
    });

  });
}