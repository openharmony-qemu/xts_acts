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
class C {}

export default function MapDeleteCollectionsTest() {
  describe('MapDeleteCollectionsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_001
     * @tc.name mapDeleteCollectionsTest001
     * @tc.desc delete existing string key should return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_002
     * @tc.name mapDeleteCollectionsTest002
     * @tc.desc delete existing number key should return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'x']]);
      const result: boolean = map.delete(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_003
     * @tc.name mapDeleteCollectionsTest003
     * @tc.desc delete non-existing string key should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const result: boolean = map.delete('b');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_004
     * @tc.name mapDeleteCollectionsTest004
     * @tc.desc delete from empty map should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const result: boolean = map.delete('a');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_005
     * @tc.name mapDeleteCollectionsTest005
     * @tc.desc size should decrease after deleting existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_006
     * @tc.name mapDeleteCollectionsTest006
     * @tc.desc size should not change when deleting non-existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.delete('b');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_007
     * @tc.name mapDeleteCollectionsTest007
     * @tc.desc should remove only target key not others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      expect(map.has('b')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_008
     * @tc.name mapDeleteCollectionsTest008
     * @tc.desc delete boolean true key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[true, 'yes']]);
      const result: boolean = map.delete(true);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_009
     * @tc.name mapDeleteCollectionsTest009
     * @tc.desc delete boolean false key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[false, 'no']]);
      const result: boolean = map.delete(false);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_010
     * @tc.name mapDeleteCollectionsTest010
     * @tc.desc delete null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<null, string> = new collections.Map<null, string>([[null, 'n']]);
      const result: boolean = map.delete(null);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_011
     * @tc.name mapDeleteCollectionsTest011
     * @tc.desc delete undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<undefined, string> = new collections.Map<undefined, string>([[undefined, 'u']]);
      const result: boolean = map.delete(undefined);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_012
     * @tc.name mapDeleteCollectionsTest012
     * @tc.desc delete twice should return false second time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const first: boolean = map.delete('a');
      const second: boolean = map.delete('a');
      expect(second).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_013
     * @tc.name mapDeleteCollectionsTest013
     * @tc.desc delete after clear should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.clear();
      const result: boolean = map.delete('a');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_014
     * @tc.name mapDeleteCollectionsTest014
     * @tc.desc delete correct key while others remain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      map.delete(2);
      expect(map.has(1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_015
     * @tc.name mapDeleteCollectionsTest015
     * @tc.desc delete should affect has() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one']]);
      map.delete(1);
      expect(map.has(1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_016
     * @tc.name mapDeleteCollectionsTest016
     * @tc.desc delete should affect get() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one']]);
      map.delete(1);
      expect(map.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_017
     * @tc.name mapDeleteCollectionsTest017
     * @tc.desc delete works after set overwrites value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one']]);
      map.set(1, 'uno');
      const result: boolean = map.delete(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_018
     * @tc.name mapDeleteCollectionsTest018
     * @tc.desc delete large map element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i);
      }
      const result: boolean = map.delete(500);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_019
     * @tc.name mapDeleteCollectionsTest019
     * @tc.desc delete multiple sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      map.delete(1);
      map.delete(2);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_020
     * @tc.name mapDeleteCollectionsTest020
     * @tc.desc delete all keys should empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      map.delete(1);
      map.delete(2);
      map.delete(3);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_021
     * @tc.name mapDeleteCollectionsTest021
     * @tc.desc delete should not affect unrelated keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      map.delete(1);
      expect(map.get(2)).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_022
     * @tc.name mapDeleteCollectionsTest022
     * @tc.desc delete should return boolean not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const result: boolean = map.delete('a');
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_023
     * @tc.name mapDeleteCollectionsTest023
     * @tc.desc delete should work after re-adding key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.delete('a');
      map.set('a', 2);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_024
     * @tc.name mapDeleteCollectionsTest024
     * @tc.desc delete key with boolean true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, boolean> = new collections.Map<string, boolean>([['a', true]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_025
     * @tc.name mapDeleteCollectionsTest025
     * @tc.desc delete key with boolean false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, boolean> = new collections.Map<string, boolean>([['a', false]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_026
     * @tc.name mapDeleteCollectionsTest026
     * @tc.desc delete key with big integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big: bigint = 9007199254740991n;
      const map: collections.Map<string, bigint> = new collections.Map<string, bigint>([['a', big]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_027
     * @tc.name mapDeleteCollectionsTest027
     * @tc.desc delete non-existing key in non-empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const result: boolean = map.delete('b');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_028
     * @tc.name mapDeleteCollectionsTest028
     * @tc.desc delete then check map size decreases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_029
     * @tc.name mapDeleteCollectionsTest029
     * @tc.desc delete all keys one by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      map.delete('b');
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_030
     * @tc.name mapDeleteCollectionsTest030
     * @tc.desc delete with forEach iteration afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      const keys: string[] = [];
      map.forEach((value: number, key: string) => {
        keys.push(key);
      });
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_031
     * @tc.name mapDeleteCollectionsTest031
     * @tc.desc delete key and reinsert same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.delete('a');
      map.set('a', 2);
      expect(map.get('a')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_032
     * @tc.name mapDeleteCollectionsTest032
     * @tc.desc delete key twice consecutively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const first: boolean = map.delete('a');
      const second: boolean = map.delete('a');
      expect(first).assertEqual(true);
      expect(second).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_033
     * @tc.name mapDeleteCollectionsTest033
     * @tc.desc delete key after clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.clear();
      const result: boolean = map.delete('a');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_034
     * @tc.name mapDeleteCollectionsTest034
     * @tc.desc delete undefined key after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<undefined, string> = new collections.Map<undefined, string>([[undefined, 'x']]);
      const result: boolean = map.delete(undefined);
      expect(result).assertEqual(true);
      expect(map.has(undefined)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_035
     * @tc.name mapDeleteCollectionsTest035
     * @tc.desc delete null key after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<null, string> = new collections.Map<null, string>([[null, 'x']]);
      const result: boolean = map.delete(null);
      expect(result).assertEqual(true);
      expect(map.has(null)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_036
     * @tc.name mapDeleteCollectionsTest036
     * @tc.desc delete on large map (1000 entries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i);
      }
      const result: boolean = map.delete(500);
      expect(result).assertEqual(true);
      expect(map.has(500)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_037
     * @tc.name mapDeleteCollectionsTest037
     * @tc.desc delete bigint key correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big: bigint = 123456789012345678901234567890n;
      const map: collections.Map<bigint, string> = new collections.Map<bigint, string>([[big, 'big']]);
      const result: boolean = map.delete(big);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_038
     * @tc.name mapDeleteCollectionsTest038
     * @tc.desc delete when value is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, null> = new collections.Map<string, null>([['a', null]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_039
     * @tc.name mapDeleteCollectionsTest039
     * @tc.desc delete when value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, undefined> = new collections.Map<string, undefined>([['a', undefined]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_040
     * @tc.name mapDeleteCollectionsTest040
     * @tc.desc delete multiple keys in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 10; i++) {
        map.set(i, i);
      }
      for (let i: number = 0; i < 5; i++) {
        map.delete(i);
      }
      expect(map.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_041
     * @tc.name mapDeleteCollectionsTest041
     * @tc.desc delete works with NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[NaN, 'nan']]);
      const result: boolean = map.delete(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_042
     * @tc.name mapDeleteCollectionsTest042
     * @tc.desc delete key that was never added
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const result: boolean = map.delete('ghost');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_043
     * @tc.name mapDeleteCollectionsTest043
     * @tc.desc delete after clear then add again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.clear();
      map.set('a', 2);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_044
     * @tc.name mapDeleteCollectionsTest044
     * @tc.desc delete works with class instance key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let inst = new C();
      let map: collections.Map<C, string> = new collections.Map<C, string>([[inst, 'cls']]);
      let result: boolean = map.delete(inst);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_045
     * @tc.name mapDeleteCollectionsTest045
     * @tc.desc delete key when map size is large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i);
      }
      const result: boolean = map.delete(500);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_046
     * @tc.name mapDeleteCollectionsTest046
     * @tc.desc delete non-existent key from large map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i);
      }
      const result: boolean = map.delete(2000);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_047
     * @tc.name mapDeleteCollectionsTest047
     * @tc.desc delete last key in map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      const result: boolean = map.delete(2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_048
     * @tc.name mapDeleteCollectionsTest048
     * @tc.desc delete first key in map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      const result: boolean = map.delete(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_049
     * @tc.name mapDeleteCollectionsTest049
     * @tc.desc delete same key twice in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a']]);
      const first: boolean = map.delete(1);
      const second: boolean = map.delete(1);
      expect(first && !second).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_050
     * @tc.name mapDeleteCollectionsTest050
     * @tc.desc delete after clearing map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a']]);
      map.clear();
      const result: boolean = map.delete(1);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_DELETE_COLLECTIONS_TEST_051
     * @tc.name mapDeleteCollectionsTest051
     * @tc.desc delete on map after re-insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapDeleteCollectionsTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, 'a');
      map.delete(1);
      map.set(1, 'b');
      const result: boolean = map.delete(1);
      expect(result).assertEqual(true);
    });

  })
}
