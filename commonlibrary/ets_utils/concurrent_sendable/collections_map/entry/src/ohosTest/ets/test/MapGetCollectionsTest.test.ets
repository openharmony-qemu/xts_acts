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

export default function MapGetCollectionsTest() {
  describe('MapGetCollectionsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0001
     * @tc.name mapGetCollectionsTest0001
     * @tc.desc Verify Map.get returns correct value for existing string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('key1', 100);
      expect(map.get('key1')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0002
     * @tc.name mapGetCollectionsTest0002
     * @tc.desc Verify Map.get returns undefined for non-existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('name', 'Alice');
      expect(map.get('age')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0003
     * @tc.name mapGetCollectionsTest0003
     * @tc.desc Verify Map.get returns correct value for number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(42, 'answer');
      expect(map.get(42)).assertEqual('answer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0004
     * @tc.name mapGetCollectionsTest0004
     * @tc.desc Verify Map.get distinguishes between number and string keys with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number | string, boolean> = new collections.Map<number | string, boolean>();
      map.set(123, true);
      map.set('123', false);
      expect(map.get(123)).assertEqual(true);
      expect(map.get('123')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0005
     * @tc.name mapGetCollectionsTest0005
     * @tc.desc Verify Map.get returns correct value for boolean key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      expect(map.get(true)).assertEqual('yes');
      expect(map.get(false)).assertEqual('no');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0006
     * @tc.name mapGetCollectionsTest0006
     * @tc.desc Verify Map.get returns correct value after key is updated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('count', 1);
      map.set('count', 2);
      expect(map.get('count')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0007
     * @tc.name mapGetCollectionsTest0007
     * @tc.desc Verify Map.get returns undefined after key is deleted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.delete('key');
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0008
     * @tc.name mapGetCollectionsTest0008
     * @tc.desc Verify Map.get works with null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, 'null value');
      expect(map.get(null)).assertEqual('null value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0009
     * @tc.name mapGetCollectionsTest0009
     * @tc.desc Verify Map.get works with undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<undefined, number> = new collections.Map<undefined, number>();
      map.set(undefined, 123);
      expect(map.get(undefined)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0010
     * @tc.name mapGetCollectionsTest0010
     * @tc.desc Verify Map.get distinguishes between null and undefined keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<null | undefined, string> = new collections.Map<null | undefined, string>();
      map.set(null, 'null');
      map.set(undefined, 'undefined');
      expect(map.get(null)).assertEqual('null');
      expect(map.get(undefined)).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0011
     * @tc.name mapGetCollectionsTest0011
     * @tc.desc Verify Map.get works with NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(NaN, 'not a number');
      expect(map.get(NaN)).assertEqual('not a number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0012
     * @tc.name mapGetCollectionsTest0012
     * @tc.desc Verify Map.get returns correct value for large integer key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const largeKey: bigint = 9007199254740991n;
      const map: collections.Map<bigint, string> = new collections.Map<bigint, string>();
      map.set(largeKey, 'large value');
      expect(map.get(largeKey)).assertEqual('large value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0013
     * @tc.name mapGetCollectionsTest0013
     * @tc.desc Verify Map.get returns correct value for multiple keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('a', 'apple');
      map.set('b', 'banana');
      map.set('c', 'cherry');
      expect(map.get('a')).assertEqual('apple');
      expect(map.get('b')).assertEqual('banana');
      expect(map.get('c')).assertEqual('cherry');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0014
     * @tc.name mapGetCollectionsTest0014
     * @tc.desc Verify Map.get works with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('', 0);
      expect(map.get('')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0015
     * @tc.name mapGetCollectionsTest0015
     * @tc.desc Verify Map.get returns undefined for empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      expect(map.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0016
     * @tc.name mapGetCollectionsTest0016
     * @tc.desc Verify Map.get works after clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0017
     * @tc.name mapGetCollectionsTest0017
     * @tc.desc Verify Map.get works with large number of entries
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapGetCollectionsTest0017', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0018
     * @tc.name mapGetCollectionsTest0018
     * @tc.desc Verify Map.get returns correct value for boolean true key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, 'active');
      expect(map.get(true)).assertEqual('active');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0019
     * @tc.name mapGetCollectionsTest0019
     * @tc.desc Verify Map.get returns correct value for boolean false key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(false, 'inactive');
      expect(map.get(false)).assertEqual('inactive');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0020
     * @tc.name mapGetCollectionsTest0020
     * @tc.desc Verify Map.get works with negative number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(-1, 'negative one');
      map.set(-100, 'negative hundred');
      expect(map.get(-1)).assertEqual('negative one');
      expect(map.get(-100)).assertEqual('negative hundred');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0021
     * @tc.name mapGetCollectionsTest0021
     * @tc.desc Verify Map.get works with float number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(3.14, 'pi');
      map.set(2.718, 'e');
      expect(map.get(3.14)).assertEqual('pi');
      expect(map.get(2.718)).assertEqual('e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0022
     * @tc.name mapGetCollectionsTest0022
     * @tc.desc Verify Map.get distinguishes between similar float keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1.0, 'one point zero');
      map.set(1.0000001, 'almost one');
      expect(map.get(1.0)).assertEqual('one point zero');
      expect(map.get(1.0000001)).assertEqual('almost one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0023
     * @tc.name mapGetCollectionsTest0023
     * @tc.desc Verify Map.get works with string keys containing special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('!@#$%', 'special chars');
      map.set('a=b&c=d', 'query string');
      expect(map.get('!@#$%')).assertEqual('special chars');
      expect(map.get('a=b&c=d')).assertEqual('query string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0024
     * @tc.name mapGetCollectionsTest0024
     * @tc.desc Verify Map.get works with Unicode string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('café', 'coffee');
      map.set('北京', 'Beijing');
      expect(map.get('café')).assertEqual('coffee');
      expect(map.get('北京')).assertEqual('Beijing');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0025
     * @tc.name mapGetCollectionsTest0025
     * @tc.desc Verify Map.get returns correct value for Sendable class instance keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person: Person = new Person('Alice');
      const map: collections.Map<Person, number> = new collections.Map<Person, number>();
      map.set(person, 30);

      expect(map.get(person)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0026
     * @tc.name mapGetCollectionsTest0026
     * @tc.desc Verify Map.get distinguishes between different Sendable class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<Person, number> = new collections.Map<Person, number>();
      map.set(new Person('Alice'), 30);

      expect(map.get(new Person('Alice'))).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0027
     * @tc.name mapGetCollectionsTest0027
     * @tc.desc Verify Map.get returns correct value after re-adding key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('key', 1);
      map.delete('key');
      map.set('key', 2);
      expect(map.get('key')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0028
     * @tc.name mapGetCollectionsTest0028
     * @tc.desc Verify Map.get works with same key added multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, 'one');
      map.set(1, 'uno');
      map.set(1, 'un');
      expect(map.get(1)).assertEqual('un');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0029
     * @tc.name mapGetCollectionsTest0029
     * @tc.desc Verify Map.get returns correct value for key added in constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([
        ['a', 1],
        ['b', 2],
        ['c', 3]
      ]);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0030
     * @tc.name mapGetCollectionsTest0030
     * @tc.desc Verify Map.get returns correct value after map is copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapGetCollectionsTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const originalMap: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      const copiedMap: collections.Map<string, number> = new collections.Map<string, number>(Array.from(originalMap.entries()));

      expect(copiedMap.get('a')).assertEqual(1);
      expect(copiedMap.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0031
     * @tc.name mapGetCollectionsTest0031
     * @tc.desc Verify Map.get works with keys from other realms (theoretical)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapGetCollectionsTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const key: string = 'cross-realm';
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set(key, 'value');
      expect(map.get(key)).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0032
     * @tc.name mapGetCollectionsTest0032
     * @tc.desc Verify Map.get returns undefined for key that was never set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapGetCollectionsTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('a', 'A');
      expect(map.get('b')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0033
     * @tc.name mapGetCollectionsTest0033
     * @tc.desc Verify Map.get works with very long string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = '';
      for (let i: number = 0; i < 1000; i++) {
        longKey += 'a';
      }
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set(longKey, 'long value');
      expect(map.get(longKey)).assertEqual('long value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0034
     * @tc.name mapGetCollectionsTest0034
     * @tc.desc Verify Map.get returns correct value for key added in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();

      for (let i: number = 0; i < 10; i++) {
        map.set(i, i * i);
      }

      expect(map.get(5)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0035
     * @tc.name mapGetCollectionsTest0035
     * @tc.desc Verify Map.get returns correct value after map is modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['a', 'A'], ['b', 'B']]);

      map.set('c', 'C');
      map.delete('a');

      expect(map.get('b')).assertEqual('B');
      expect(map.get('c')).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0036
     * @tc.name mapGetCollectionsTest0036
     * @tc.desc Verify Map.get works with key that is a BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigKey: bigint = 9007199254740991n;
      const map: collections.Map<bigint, string> = new collections.Map<bigint, string>();
      map.set(bigKey, 'big integer');
      expect(map.get(bigKey)).assertEqual('big integer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0037
     * @tc.name mapGetCollectionsTest0037
     * @tc.desc Verify Map.get distinguishes between BigInt and Number with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapGetCollectionsTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<bigint | number, string> = new collections.Map<bigint | number, string>();
      map.set(42n, 'bigint');
      map.set(42, 'number');

      expect(map.get(42n)).assertEqual('bigint');
      expect(map.get(42)).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0038
     * @tc.name mapGetCollectionsTest0038
     * @tc.desc Verify Map.get returns correct value for key in large map
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapGetCollectionsTest0038', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const targetKey: number = 5000;

      for (let i: number = 0; i < 10000; i++) {
        map.set(i, `value${i}`);
      }

      expect(map.get(targetKey)).assertEqual(`value${targetKey}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_GET_COLLECTIONS_TEST_0039
     * @tc.name mapGetCollectionsTest0039
     * @tc.desc Verify Map.get returns correct value after many key additions and deletions
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapGetCollectionsTest0039', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
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
