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

export default function CollectionsMapDeleteTest() {
  describe('CollectionsMapDeleteTest', () => {
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
     * @tc.name    collectionsMapDeleteTest0100
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_0100
     * @tc.desc    delete existing string key should return true
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest0200
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_0200
     * @tc.desc    delete existing number key should return true
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'x']]);
      const result: boolean = map.delete(1);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest0300
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_0300
     * @tc.desc    delete non-existing string key should return false
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const result: boolean = map.delete('b');
      expect(result).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest0400
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_0400
     * @tc.desc    delete from empty map should return false
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const result: boolean = map.delete('a');
      expect(result).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest0500
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_0500
     * @tc.desc    size should decrease after deleting existing key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      expect(map.size).assertEqual(1);
    });

     /**
     * @tc.name    collectionsMapDeleteTest0600
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_0600
     * @tc.desc    size should not change when deleting non-existing key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.delete('b');
      expect(map.size).assertEqual(1);
    });

     /**
     * @tc.name    collectionsMapDeleteTest0700
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_0700
     * @tc.desc    should remove only target key not others
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      expect(map.has('b')).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest0800
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_0800
     * @tc.desc    delete boolean true key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[true, 'yes']]);
      const result: boolean = map.delete(true);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest0900
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_0900
     * @tc.desc    delete boolean false key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[false, 'no']]);
      const result: boolean = map.delete(false);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest1000
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_1000
     * @tc.desc    delete null key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<null, string> = new collections.Map<null, string>([[null, 'n']]);
      const result: boolean = map.delete(null);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest1100
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_1100
     * @tc.desc    delete undefined key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<undefined, string> = new collections.Map<undefined, string>([[undefined, 'u']]);
      const result: boolean = map.delete(undefined);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest1200
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_1200
     * @tc.desc    delete twice should return false second time
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const first: boolean = map.delete('a');
      const second: boolean = map.delete('a');
      expect(second).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest1300
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_1300
     * @tc.desc    delete after clear should return false
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.clear();
      const result: boolean = map.delete('a');
      expect(result).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest1400
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_1400
     * @tc.desc    delete correct key while others remain
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      map.delete(2);
      expect(map.has(1)).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest1500
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_1500
     * @tc.desc    delete should affect has() result
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one']]);
      map.delete(1);
      expect(map.has(1)).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest1600
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_1600
     * @tc.desc    delete should affect get() result
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one']]);
      map.delete(1);
      expect(map.get(1)).assertEqual(undefined);
    });

     /**
     * @tc.name    collectionsMapDeleteTest1700
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_1700
     * @tc.desc    delete works after set overwrites value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one']]);
      map.set(1, 'uno');
      const result: boolean = map.delete(1);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest1800
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_1800
     * @tc.desc    delete large map element
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i);
      }
      const result: boolean = map.delete(500);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest1900
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_1900
     * @tc.desc    delete multiple sequentially
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      map.delete(1);
      map.delete(2);
      expect(map.size).assertEqual(1);
    });

     /**
     * @tc.name    collectionsMapDeleteTest2000
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_2000
     * @tc.desc    delete all keys should empty map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      map.delete(1);
      map.delete(2);
      map.delete(3);
      expect(map.size).assertEqual(0);
    });

     /**
     * @tc.name    collectionsMapDeleteTest2100
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_2100
     * @tc.desc    delete should not affect unrelated keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      map.delete(1);
      expect(map.get(2)).assertEqual('b');
    });

     /**
     * @tc.name    collectionsMapDeleteTest2200
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_2200
     * @tc.desc    delete should return boolean not undefined
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const result: boolean = map.delete('a');
      expect(typeof result).assertEqual('boolean');
    });

     /**
     * @tc.name    collectionsMapDeleteTest2300
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_2300
     * @tc.desc    delete should work after re-adding key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.delete('a');
      map.set('a', 2);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest2400
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_2400
     * @tc.desc    delete key with boolean true value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, boolean> = new collections.Map<string, boolean>([['a', true]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest2500
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_2500
     * @tc.desc    delete key with boolean false value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, boolean> = new collections.Map<string, boolean>([['a', false]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest2600
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_2600
     * @tc.desc    delete key with big integer value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big: bigint = 9007199254740991n;
      const map: collections.Map<string, bigint> = new collections.Map<string, bigint>([['a', big]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest2700
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_2700
     * @tc.desc    delete non-existing key in non-empty map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const result: boolean = map.delete('b');
      expect(result).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest2800
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_2800
     * @tc.desc    delete then check map size decreases
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      expect(map.size).assertEqual(1);
    });

     /**
     * @tc.name    collectionsMapDeleteTest2900
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_2900
     * @tc.desc    delete all keys one by one
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      map.delete('b');
      expect(map.size).assertEqual(0);
    });

     /**
     * @tc.name    collectionsMapDeleteTest3000
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_3000
     * @tc.desc    delete with forEach iteration afterwards
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.name    collectionsMapDeleteTest3100
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_3100
     * @tc.desc    delete key and reinsert same key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.delete('a');
      map.set('a', 2);
      expect(map.get('a')).assertEqual(2);
    });

     /**
     * @tc.name    collectionsMapDeleteTest3200
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_3200
     * @tc.desc    delete key twice consecutively
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      const first: boolean = map.delete('a');
      const second: boolean = map.delete('a');
      expect(first).assertEqual(true);
      expect(second).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest3300
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_3300
     * @tc.desc    delete key after clear
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.clear();
      const result: boolean = map.delete('a');
      expect(result).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest3400
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_3400
     * @tc.desc    delete undefined key after set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<undefined, string> = new collections.Map<undefined, string>([[undefined, 'x']]);
      const result: boolean = map.delete(undefined);
      expect(result).assertEqual(true);
      expect(map.has(undefined)).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest3500
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_3500
     * @tc.desc    delete null key after set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<null, string> = new collections.Map<null, string>([[null, 'x']]);
      const result: boolean = map.delete(null);
      expect(result).assertEqual(true);
      expect(map.has(null)).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest3600
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_3600
     * @tc.desc    delete on large map (1000 entries)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i);
      }
      const result: boolean = map.delete(500);
      expect(result).assertEqual(true);
      expect(map.has(500)).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest3700
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_3700
     * @tc.desc    delete bigint key correctly
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big: bigint = 123456789012345678901234567890n;
      const map: collections.Map<bigint, string> = new collections.Map<bigint, string>([[big, 'big']]);
      const result: boolean = map.delete(big);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest3800
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_3800
     * @tc.desc    delete when value is null
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, null> = new collections.Map<string, null>([['a', null]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest3900
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_3900
     * @tc.desc    delete when value is undefined
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, undefined> = new collections.Map<string, undefined>([['a', undefined]]);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest4000
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_4000
     * @tc.desc    delete multiple keys in loop
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.name    collectionsMapDeleteTest4100
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_4100
     * @tc.desc    delete works with NaN key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[NaN, 'nan']]);
      const result: boolean = map.delete(NaN);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest4200
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_4200
     * @tc.desc    delete key that was never added
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const result: boolean = map.delete('ghost');
      expect(result).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest4300
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_4300
     * @tc.desc    delete after clear then add again
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1]]);
      map.clear();
      map.set('a', 2);
      const result: boolean = map.delete('a');
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest4400
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_4400
     * @tc.desc    delete works with class instance key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let inst = new C();
      let map: collections.Map<C, string> = new collections.Map<C, string>([[inst, 'cls']]);
      let result: boolean = map.delete(inst);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest4500
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_4500
     * @tc.desc    delete key when map size is large
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i);
      }
      const result: boolean = map.delete(500);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest4600
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_4600
     * @tc.desc    delete non-existent key from large map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i);
      }
      const result: boolean = map.delete(2000);
      expect(result).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest4700
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_4700
     * @tc.desc    delete last key in map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      const result: boolean = map.delete(2);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest4800
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_4800
     * @tc.desc    delete first key in map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      const result: boolean = map.delete(1);
      expect(result).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest4900
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_4900
     * @tc.desc    delete same key twice in loop
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a']]);
      const first: boolean = map.delete(1);
      const second: boolean = map.delete(1);
      expect(first && !second).assertEqual(true);
    });

     /**
     * @tc.name    collectionsMapDeleteTest5000
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_5000
     * @tc.desc    delete after clearing map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a']]);
      map.clear();
      const result: boolean = map.delete(1);
      expect(result).assertEqual(false);
    });

     /**
     * @tc.name    collectionsMapDeleteTest5100
     * @tc.number  SUB_COLLECTIONS_MAP_DELETE_TEST_5100
     * @tc.desc    delete on map after re-insertion
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapDeleteTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, 'a');
      map.delete(1);
      map.set(1, 'b');
      const result: boolean = map.delete(1);
      expect(result).assertEqual(true);
    });

  })
}

