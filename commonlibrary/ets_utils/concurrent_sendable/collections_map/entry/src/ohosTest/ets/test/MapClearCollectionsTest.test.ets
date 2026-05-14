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

export default function MapClearCollectionsTest() {
  describe('MapClearCollectionsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_001
     * @tc.name mapClearCollectionsTest001
     * @tc.desc Clear an empty ArkTS Map, check size is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_002
     * @tc.name mapClearCollectionsTest002
     * @tc.desc Clear a ArkTS Map with one element, check size is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_003
     * @tc.name mapClearCollectionsTest003
     * @tc.desc Clear a ArkTS Map with multiple elements, check size is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, 'a');
      map.set(2, 'b');
      map.set(3, 'c');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_004
     * @tc.name mapClearCollectionsTest004
     * @tc.desc After clear, check if original key exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.has('key')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_005
     * @tc.name mapClearCollectionsTest005
     * @tc.desc After clear, check if get returns undefined for original key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_006
     * @tc.name mapClearCollectionsTest006
     * @tc.desc Clear a ArkTS Map with number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(100, 'hundred');
      map.set(200, 'two hundred');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_007
     * @tc.name mapClearCollectionsTest007
     * @tc.desc Clear a ArkTS Map with boolean keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_008
     * @tc.name mapClearCollectionsTest008
     * @tc.desc Clear a ArkTS Map with null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number | null, string> = new collections.Map<number | null, string>();
      map.set(null, 'null value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_009
     * @tc.name mapClearCollectionsTest009
     * @tc.desc Clear a ArkTS Map with undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number | undefined, string> = new collections.Map<number | undefined, string>();
      map.set(undefined, 'undefined value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_010
     * @tc.name mapClearCollectionsTest010
     * @tc.desc Clear a ArkTS Map and check entries iterator is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      const entries: [string, number][] = Array.from(map.entries());
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_011
     * @tc.name mapClearCollectionsTest011
     * @tc.desc Clear a ArkTS Map and check keys iterator is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('mapClearCollectionsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      const keys: string[] = Array.from(map.keys());
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_012
     * @tc.name mapClearCollectionsTest012
     * @tc.desc Clear a ArkTS Map and check values iterator is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      const values: number[] = Array.from(map.values());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_013
     * @tc.name mapClearCollectionsTest013
     * @tc.desc Call clear multiple times on the same ArkTS Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.clear();
      map.clear();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_014
     * @tc.name mapClearCollectionsTest014
     * @tc.desc Clear a ArkTS Map and then add new elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string,string> = new collections.Map<string, string>();
      map.set('old', 'value');
      map.clear();
      map.set('new', 'value');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_015
     * @tc.name mapClearCollectionsTest015
     * @tc.desc Clear a ArkTS Map created from an array of pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [string, number][] = [['a', 1], ['b', 2], ['c', 3]];
      const map: collections.Map<string, number> = new collections.Map<string, number>(pairs);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_016
     * @tc.name mapClearCollectionsTest016
     * @tc.desc Clear a ArkTS Map created from another Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: collections.Map<string, number> = new collections.Map<string, number>();
      original.set('a', 1);
      const map: collections.Map<string, number> = new collections.Map<string, number>(Array.from(original.entries()));
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_017
     * @tc.name mapClearCollectionsTest017
     * @tc.desc Clear a large ArkTS Map with 1000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i * 2);
      }
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_018
     * @tc.name mapClearCollectionsTest018
     * @tc.desc Clear a ArkTS Map and check forEach doesn't execute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_019
     * @tc.name mapClearCollectionsTest019
     * @tc.desc Clear a ArkTS Map with large integer keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(9007199254740991, 'max safe integer');
      map.set(9007199254740992, 'beyond max safe integer');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_020
     * @tc.name mapClearCollectionsTest020
     * @tc.desc Clear a ArkTS Map and verify with has() for multiple keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_021
     * @tc.name mapClearCollectionsTest021
     * @tc.desc Clear a ArkTS Map and check after setting same key again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const key = 'key';
      map.set(key, 'old');
      map.clear();
      map.set(key, 'new');
      expect(map.get(key)).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_022
     * @tc.name mapClearCollectionsTest022
     * @tc.desc Clear a ArkTS Map with Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(Infinity, 'infinite');
      map.set(-Infinity, 'negative infinite');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_023
     * @tc.name mapClearCollectionsTest023
     * @tc.desc Clear a ArkTS Map with NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(NaN, 'not a number');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_024
     * @tc.name mapClearCollectionsTest024
     * @tc.desc Clear a ArkTS Map and check if it's iterable (should be empty)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_025
     * @tc.name mapClearCollectionsTest025
     * @tc.desc Clear a ArkTS Map and check with JSON.stringify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [string, number][] = [['a', 1]];
      const map: collections.Map<string, number> = new collections.Map<string, number>(pairs);
      map.clear();
      expect(JSON.stringify(Array.from(map))).assertEqual('[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_026
     * @tc.name mapClearCollectionsTest026
     * @tc.desc Clear a ArkTS Map that's been assigned to another variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: collections.Map<string, string> = new collections.Map<string, string>();
      map1.set('key', 'value');
      const map2: collections.Map<string, string> = map1;
      map2.clear();
      expect(map1.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_027
     * @tc.name mapClearCollectionsTest027
     * @tc.desc Clear a ArkTS Map and check prototype methods still work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1);
      map.clear();
      map.set('b', 2);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_028
     * @tc.name mapClearCollectionsTest028
     * @tc.desc Clear a ArkTS Map with elements added after previous clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('first', 1);
      map.clear();
      map.set('second', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_029
     * @tc.name mapClearCollectionsTest029
     * @tc.desc Clear a ArkTS Map with Unicode string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('café', 'coffee');
      map.set('café', 'coffee');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_030
     * @tc.name mapClearCollectionsTest030
     * @tc.desc Clear a ArkTS Map with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('', 'empty string');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_031
     * @tc.name mapClearCollectionsTest031
     * @tc.desc Clear a ArkTS Map with large integer keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(9007199254740991, 'max safe integer');
      map.set(9007199254740992, 'beyond max safe integer');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_032
     * @tc.name mapClearCollectionsTest032
     * @tc.desc Clear a ArkTS Map with negative number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(-1, 'negative one');
      map.set(-100, 'negative hundred');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_033
     * @tc.name mapClearCollectionsTest033
     * @tc.desc Clear a ArkTS Map with floating point number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(3.14, 'pi');
      map.set(2.718, 'e');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_034
     * @tc.name mapClearCollectionsTest034
     * @tc.desc Clear a ArkTS Map and check if it's empty using Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(Array.from(map).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_035
     * @tc.name mapClearCollectionsTest035
     * @tc.desc Clear a ArkTS Map and then delete a key (should have no effect)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [string, string][] = [['key', 'value']];
      const map: collections.Map<string, string> = new collections.Map<string, string>(pairs);
      map.clear();
      const result = map.delete('key');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_036
     * @tc.name mapClearCollectionsTest036
     * @tc.desc Clear a ArkTS Map with a ArkTS Map as a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const innerMap = new collections.Map<string, string>([['inner', 'value']]);
      const outerMap = new collections.Map<string, collections.Map<string, string>>([['outer', innerMap]]);
      outerMap.clear();
      expect(outerMap.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_037
     * @tc.name mapClearCollectionsTest037
     * @tc.desc Clear a ArkTS Map and check with Map.prototype.keys.next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(map.keys().next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_038
     * @tc.name mapClearCollectionsTest038
     * @tc.desc Clear a ArkTS Map and check with Map.prototype.values.next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(map.values().next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_039
     * @tc.name mapClearCollectionsTest039
     * @tc.desc Clear a ArkTS Map and check with Map.prototype.entries.next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(map.entries().next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_040
     * @tc.name mapClearCollectionsTest040
     * @tc.desc Clear a ArkTS Map and then check with a for loop using keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_041
     * @tc.name mapClearCollectionsTest041
     * @tc.desc Clear a ArkTS Map and then check with a for loop using values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_042
     * @tc.name mapClearCollectionsTest042
     * @tc.desc Clear a ArkTS Map and check with JSON.stringify after converting to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a'], [2, 'b']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(JSON.stringify(Array.from(map.entries()))).assertEqual('[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_043
     * @tc.name mapClearCollectionsTest043
     * @tc.desc Clear a ArkTS Map and then check if the map is equal to a new empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      const map = new collections.Map<number, string>([[1, 'a']]);
      map.clear();
      const emptyMap: collections.Map<string, string> = new collections.Map<string, string>();
      expect(Array.from(map)).assertDeepEquals(Array.from(emptyMap));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_044
     * @tc.name mapClearCollectionsTest044
     * @tc.desc Clear a ArkTS Map and check that the map is an instance of Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(map instanceof collections.Map).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_CLEAR_COLLECTIONS_TEST_045
     * @tc.name mapClearCollectionsTest045
     * @tc.desc Clear a ArkTS Map and check that the clear method still exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapClearCollectionsTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pairs: [number, string][] = [[1, 'a']];
      const map: collections.Map<number, string> = new collections.Map<number, string>(pairs);
      map.clear();
      expect(typeof map.clear).assertEqual('function');
    });

  });
}