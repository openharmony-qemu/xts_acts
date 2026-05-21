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
class Person {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }
}

export default function CollectionsMapGetTest() {
  describe('CollectionsMapGetTest', () => {
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
     * @tc.name    collectionsMapGetTest0100
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_0100
     * @tc.desc    Verify Map.get returns correct value for existing string key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('key1', 100);
      expect(map.get('key1')).assertEqual(100);
    });

    /**
     * @tc.name    collectionsMapGetTest0200
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_0200
     * @tc.desc    Verify Map.get returns undefined for non-existing key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('name', 'Alice');
      expect(map.get('age')).assertEqual(undefined);
    });

    /**
     * @tc.name    collectionsMapGetTest0300
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_0300
     * @tc.desc    Verify Map.get returns correct value for number key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(42, 'answer');
      expect(map.get(42)).assertEqual('answer');
    });

    /**
     * @tc.name    collectionsMapGetTest0400
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_0400
     * @tc.desc    Verify Map.get distinguishes between number and string keys with same value
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number | string, boolean> = new collections.Map<number | string, boolean>();
      map.set(123, true);
      map.set('123', false);
      expect(map.get(123)).assertEqual(true);
      expect(map.get('123')).assertEqual(false);
    });

    /**
     * @tc.name    collectionsMapGetTest0500
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_0500
     * @tc.desc    Verify Map.get returns correct value for boolean key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      expect(map.get(true)).assertEqual('yes');
      expect(map.get(false)).assertEqual('no');
    });

    /**
     * @tc.name    collectionsMapGetTest0600
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_0600
     * @tc.desc    Verify Map.get returns correct value after key is updated
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('count', 1);
      map.set('count', 2);
      expect(map.get('count')).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapGetTest0700
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_0700
     * @tc.desc    Verify Map.get returns undefined after key is deleted
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.delete('key');
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.name    collectionsMapGetTest0800
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_0800
     * @tc.desc    Verify Map.get works with null key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, 'null value');
      expect(map.get(null)).assertEqual('null value');
    });

    /**
     * @tc.name    collectionsMapGetTest0900
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_0900
     * @tc.desc    Verify Map.get works with undefined key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<undefined, number> = new collections.Map<undefined, number>();
      map.set(undefined, 123);
      expect(map.get(undefined)).assertEqual(123);
    });

    /**
     * @tc.name    collectionsMapGetTest1000
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_1000
     * @tc.desc    Verify Map.get distinguishes between null and undefined keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<null | undefined, string> = new collections.Map<null | undefined, string>();
      map.set(null, 'null');
      map.set(undefined, 'undefined');
      expect(map.get(null)).assertEqual('null');
      expect(map.get(undefined)).assertEqual('undefined');
    });

    /**
     * @tc.name    collectionsMapGetTest1100
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_1100
     * @tc.desc    Verify Map.get works with NaN as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(NaN, 'not a number');
      expect(map.get(NaN)).assertEqual('not a number');
    });

    /**
     * @tc.name    collectionsMapGetTest1200
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_1200
     * @tc.desc    Verify Map.get returns correct value for large integer key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const largeKey: bigint = 9007199254740991n;
      const map: collections.Map<bigint, string> = new collections.Map<bigint, string>();
      map.set(largeKey, 'large value');
      expect(map.get(largeKey)).assertEqual('large value');
    });

    /**
     * @tc.name    collectionsMapGetTest1300
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_1300
     * @tc.desc    Verify Map.get returns correct value for multiple keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('a', 'apple');
      map.set('b', 'banana');
      map.set('c', 'cherry');
      expect(map.get('a')).assertEqual('apple');
      expect(map.get('b')).assertEqual('banana');
      expect(map.get('c')).assertEqual('cherry');
    });

    /**
     * @tc.name    collectionsMapGetTest1400
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_1400
     * @tc.desc    Verify Map.get works with empty string key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('', 0);
      expect(map.get('')).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapGetTest1500
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_1500
     * @tc.desc    Verify Map.get returns undefined for empty map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      expect(map.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.name    collectionsMapGetTest1600
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_1600
     * @tc.desc    Verify Map.get works after clear
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.name    collectionsMapGetTest1700
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_1700
     * @tc.desc    Verify Map.get works with large number of entries
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('collectionsMapGetTest1700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      const size: number = 1000;

      for (let i: number = 0; i < size; i++) {
        map.set(i, i * 2);
      }

      expect(map.get(0)).assertEqual(0);
      expect(map.get(500)).assertEqual(1000);
      expect(map.get(999)).assertEqual(1998);
    });

    /**
     * @tc.name    collectionsMapGetTest1800
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_1800
     * @tc.desc    Verify Map.get returns correct value for boolean true key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, 'active');
      expect(map.get(true)).assertEqual('active');
    });

    /**
     * @tc.name    collectionsMapGetTest1900
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_1900
     * @tc.desc    Verify Map.get returns correct value for boolean false key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(false, 'inactive');
      expect(map.get(false)).assertEqual('inactive');
    });

    /**
     * @tc.name    collectionsMapGetTest2000
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_2000
     * @tc.desc    Verify Map.get works with negative number keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(-1, 'negative one');
      map.set(-100, 'negative hundred');
      expect(map.get(-1)).assertEqual('negative one');
      expect(map.get(-100)).assertEqual('negative hundred');
    });

    /**
     * @tc.name    collectionsMapGetTest2100
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_2100
     * @tc.desc    Verify Map.get works with float number keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(3.14, 'pi');
      map.set(2.718, 'e');
      expect(map.get(3.14)).assertEqual('pi');
      expect(map.get(2.718)).assertEqual('e');
    });

    /**
     * @tc.name    collectionsMapGetTest2200
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_2200
     * @tc.desc    Verify Map.get distinguishes between similar float keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1.0, 'one point zero');
      map.set(1.0000001, 'almost one');
      expect(map.get(1.0)).assertEqual('one point zero');
      expect(map.get(1.0000001)).assertEqual('almost one');
    });

    /**
     * @tc.name    collectionsMapGetTest2300
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_2300
     * @tc.desc    Verify Map.get works with string keys containing special characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('!@#$%', 'special chars');
      map.set('a=b&c=d', 'query string');
      expect(map.get('!@#$%')).assertEqual('special chars');
      expect(map.get('a=b&c=d')).assertEqual('query string');
    });

    /**
     * @tc.name    collectionsMapGetTest2400
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_2400
     * @tc.desc    Verify Map.get works with Unicode string keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('café', 'coffee');
      map.set('北京', 'Beijing');
      expect(map.get('café')).assertEqual('coffee');
      expect(map.get('北京')).assertEqual('Beijing');
    });

    /**
     * @tc.name    collectionsMapGetTest2500
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_2500
     * @tc.desc    Verify Map.get returns correct value for Sendable class instance keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person: Person = new Person('Alice');
      const map: collections.Map<Person, number> = new collections.Map<Person, number>();
      map.set(person, 30);

      expect(map.get(person)).assertEqual(30);
    });

    /**
     * @tc.name    collectionsMapGetTest2600
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_2600
     * @tc.desc    Verify Map.get distinguishes between different Sendable class instances
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<Person, number> = new collections.Map<Person, number>();
      map.set(new Person('Alice'), 30);

      expect(map.get(new Person('Alice'))).assertEqual(undefined);
    });

    /**
     * @tc.name    collectionsMapGetTest2700
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_2700
     * @tc.desc    Verify Map.get returns correct value after re-adding key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('key', 1);
      map.delete('key');
      map.set('key', 2);
      expect(map.get('key')).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapGetTest2800
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_2800
     * @tc.desc    Verify Map.get works with same key added multiple times
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, 'one');
      map.set(1, 'uno');
      map.set(1, 'un');
      expect(map.get(1)).assertEqual('un');
    });

    /**
     * @tc.name    collectionsMapGetTest2900
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_2900
     * @tc.desc    Verify Map.get returns correct value for key added in constructor
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([
        ['a', 1],
        ['b', 2],
        ['c', 3]
      ]);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapGetTest3000
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_3000
     * @tc.desc    Verify Map.get returns correct value after map is copied
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsMapGetTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const originalMap: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      const copiedMap: collections.Map<string, number> = new collections.Map<string, number>(Array.from(originalMap.entries()));

      expect(copiedMap.get('a')).assertEqual(1);
      expect(copiedMap.get('b')).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapGetTest3100
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_3100
     * @tc.desc    Verify Map.get works with keys from other realms (theoretical)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsMapGetTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const key: string = 'cross-realm';
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set(key, 'value');
      expect(map.get(key)).assertEqual('value');
    });

    /**
     * @tc.name    collectionsMapGetTest3200
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_3200
     * @tc.desc    Verify Map.get returns undefined for key that was never set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapGetTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('a', 'A');
      expect(map.get('b')).assertEqual(undefined);
    });

    /**
     * @tc.name   collectionsMapGetTest3300
     * @tc.number SUB_COLLECTIONS_MAP_GET_TEST_3300
     * @tc.desc   Verify Map.get works with very long string keys
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('collectionsMapGetTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = '';
      for (let i: number = 0; i < 1000; i++) {
        longKey += 'a';
      }
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set(longKey, 'long value');
      expect(map.get(longKey)).assertEqual('long value');
    });

    /**
     * @tc.name    collectionsMapGetTest3400
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_3400
     * @tc.desc    Verify Map.get returns correct value for key added in loop
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();

      for (let i: number = 0; i < 10; i++) {
        map.set(i, i * i);
      }

      expect(map.get(5)).assertEqual(25);
    });

    /**
     * @tc.name    collectionsMapGetTest3500
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_3500
     * @tc.desc    Verify Map.get returns correct value after map is modified
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['a', 'A'], ['b', 'B']]);

      map.set('c', 'C');
      map.delete('a');

      expect(map.get('b')).assertEqual('B');
      expect(map.get('c')).assertEqual('C');
    });

    /**
     * @tc.name    collectionsMapGetTest3600
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_3600
     * @tc.desc    Verify Map.get works with key that is a BigInt
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigKey: bigint = 9007199254740991n;
      const map: collections.Map<bigint, string> = new collections.Map<bigint, string>();
      map.set(bigKey, 'big integer');
      expect(map.get(bigKey)).assertEqual('big integer');
    });

    /**
     * @tc.name    collectionsMapGetTest3700
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_3700
     * @tc.desc    Verify Map.get distinguishes between BigInt and Number with same value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapGetTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<bigint | number, string> = new collections.Map<bigint | number, string>();
      map.set(42n, 'bigint');
      map.set(42, 'number');

      expect(map.get(42n)).assertEqual('bigint');
      expect(map.get(42)).assertEqual('number');
    });

    /**
     * @tc.name    collectionsMapGetTest3800
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_3800
     * @tc.desc    Verify Map.get returns correct value for key in large map
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('collectionsMapGetTest3800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const targetKey: number = 5000;

      for (let i: number = 0; i < 10000; i++) {
        map.set(i, `value${i}`);
      }

      expect(map.get(targetKey)).assertEqual(`value${targetKey}`);
    });

    /**
     * @tc.name    collectionsMapGetTest3900
     * @tc.number  SUB_COLLECTIONS_MAP_GET_TEST_3900
     * @tc.desc    Verify Map.get returns correct value after many key additions and deletions
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('collectionsMapGetTest3900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const specialKey: number = 9999;
      for (let i: number = 0; i < 10000; i++) {
        map.set(i, `value${i}`);
      }

      for (let i: number = 0; i < 10000; i++) {
        if (i !== specialKey) {
          map.delete(i);
        }
      }
      expect(map.get(specialKey)).assertEqual(`value${specialKey}`);
    });
  })
}

