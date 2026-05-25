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
}

@Sendable
class MyClass {
  name : string;
  constructor(name: string) {
    this.name = name;
  }
}

export default function CollectionsSetTest() {
  describe('CollectionsSetTest', () => {
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
     * @tc.name    collectionsSetTest0100
     * @tc.number  SUB_COLLECTIONS_SET_TEST_0100
     * @tc.desc    Basic functionality: set string key-value pair
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest0100';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('name', 'Alice');
      expect(map.has('name')).assertEqual(true);
      expect(map.get('name')).assertEqual('Alice');
      expect(map.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest0200
     * @tc.number  SUB_COLLECTIONS_SET_TEST_0200
     * @tc.desc    Overwrite existing key with new value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest0200';
      console.info(`${caseName}, test start`);
      const map = new collections.Map<string, number>([['age', 20]]);
      map.set('age', 21);
      expect(map.get('age')).assertEqual(21);
      expect(map.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest0300
     * @tc.number  SUB_COLLECTIONS_SET_TEST_0300
     * @tc.desc    Set number key-value pair
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest0300';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(42, 'answer');
      expect(map.has(42)).assertEqual(true);
      expect(map.get(42)).assertEqual('answer');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest0400
     * @tc.number  SUB_COLLECTIONS_SET_TEST_0400
     * @tc.desc    Set boolean key-value pair
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest0400';
      console.info(`${caseName}, test start`);
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, 'active');
      expect(map.has(true)).assertEqual(true);
      expect(map.get(true)).assertEqual('active');
      expect(map.has(false)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest0500
     * @tc.number  SUB_COLLECTIONS_SET_TEST_0500
     * @tc.desc    Set null key-value pair
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest0500';
      console.info(`${caseName}, test start`);
      const map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, 'null value');
      expect(map.has(null)).assertEqual(true);
      expect(map.get(null)).assertEqual('null value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest0600
     * @tc.number  SUB_COLLECTIONS_SET_TEST_0600
     * @tc.desc    Set undefined key-value pair
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest0600';
      console.info(`${caseName}, test start`);
      const map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      map.set(undefined, 'undefined value');
      expect(map.has(undefined)).assertEqual(true);
      expect(map.get(undefined)).assertEqual('undefined value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest0700
     * @tc.number  SUB_COLLECTIONS_SET_TEST_0700
     * @tc.desc    Set bigint key-value pair
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest0700';
      console.info(`${caseName}, test start`);
      const bigintKey = 123n;
      const map: collections.Map<bigint, string> = new collections.Map<bigint, string>();
      map.set(bigintKey, 'bigint value');
      expect(map.has(bigintKey)).assertEqual(true);
      expect(map.get(bigintKey)).assertEqual('bigint value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest0800
     * @tc.number  SUB_COLLECTIONS_SET_TEST_0800
     * @tc.desc    Set multiple key-value pairs
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest0800';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1)
        .set('b', 2)
        .set('c', 3);
      expect(map.size).assertEqual(3);
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);
      expect(map.get('c')).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest0900
     * @tc.number  SUB_COLLECTIONS_SET_TEST_0900
     * @tc.desc    Set with same value for different keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest0900';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('x', 10)
        .set('y', 10)
        .set('z', 10);
      expect(map.get('x')).assertEqual(10);
      expect(map.get('y')).assertEqual(10);
      expect(map.get('z')).assertEqual(10);
      expect(map.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest1000
     * @tc.number  SUB_COLLECTIONS_SET_TEST_1000
     * @tc.desc    Set returns the map instance
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest1000';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const result = map.set('key', 'value');
      expect(result).assertEqual(map);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest1100
     * @tc.number  SUB_COLLECTIONS_SET_TEST_1100
     * @tc.desc    Chaining set operations
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest1100';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('a', 1)
        .set('b', 2)
        .set('c', 3);
      expect(map.size).assertEqual(3);
      expect(map.get('b')).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest1200
     * @tc.number  SUB_COLLECTIONS_SET_TEST_1200
     * @tc.desc    Set with empty string key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest1200';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('', 'empty string');
      expect(map.has('')).assertEqual(true);
      expect(map.get('')).assertEqual('empty string');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest1300
     * @tc.number  SUB_COLLECTIONS_SET_TEST_1300
     * @tc.desc    Set with numeric string vs number key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest1300';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string | number, string | number> = new collections.Map<string | number, string | number>();
      map.set('123', 'string')
        .set(123, 'number');
      expect(map.size).assertEqual(2);
      expect(map.get('123')).assertEqual('string');
      expect(map.get(123)).assertEqual('number');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest1400
     * @tc.number  SUB_COLLECTIONS_SET_TEST_1400
     * @tc.desc    Set with negative number key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest1400';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(-42, 'negative');
      expect(map.has(-42)).assertEqual(true);
      expect(map.get(-42)).assertEqual('negative');
      expect(map.has(42)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest1500
     * @tc.number  SUB_COLLECTIONS_SET_TEST_1500
     * @tc.desc    Set with zero and negative zero
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest1500';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(0, 'zero')
        .set(-0, 'negative zero');
      expect(map.size).assertEqual(1);
      expect(map.get(0)).assertEqual('negative zero');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest1600
     * @tc.number  SUB_COLLECTIONS_SET_TEST_1600
     * @tc.desc    Set with NaN as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest1600';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(NaN, 'not a number');
      expect(map.has(NaN)).assertEqual(true);
      expect(map.get(NaN)).assertEqual('not a number');
      expect(map.has(Number('invalid'))).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest1700
     * @tc.number  SUB_COLLECTIONS_SET_TEST_1700
     * @tc.desc    Set with Infinity as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest1700';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(Infinity, 'infinite');
      expect(map.has(Infinity)).assertEqual(true);
      expect(map.get(Infinity)).assertEqual('infinite');
      expect(map.has(-Infinity)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest1800
     * @tc.number  SUB_COLLECTIONS_SET_TEST_1800
     * @tc.desc    Set with -Infinity as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest1800';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(-Infinity, 'negative infinite');
      expect(map.has(-Infinity)).assertEqual(true);
      expect(map.get(-Infinity)).assertEqual('negative infinite');
      expect(map.has(Infinity)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest1900
     * @tc.number  SUB_COLLECTIONS_SET_TEST_1900
     * @tc.desc    Set with very large number key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest1900';
      console.info(`${caseName}, test start`);
      const largeNum = Number.MAX_SAFE_INTEGER;
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(largeNum, 'max safe integer');
      expect(map.has(largeNum)).assertEqual(true);
      expect(map.get(largeNum)).assertEqual('max safe integer');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest2000
     * @tc.number  SUB_COLLECTIONS_SET_TEST_2000
     * @tc.desc    Set with very small number key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest2000';
      console.info(`${caseName}, test start`);
      const smallNum = Number.MIN_SAFE_INTEGER;
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(smallNum, 'min safe integer');
      expect(map.has(smallNum)).assertEqual(true);
      expect(map.get(smallNum)).assertEqual('min safe integer');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest2100
     * @tc.number  SUB_COLLECTIONS_SET_TEST_2100
     * @tc.desc    Set with float number key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest2100';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(3.14, 'pi');
      expect(map.has(3.14)).assertEqual(true);
      expect(map.get(3.14)).assertEqual('pi');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest2200
     * @tc.number  SUB_COLLECTIONS_SET_TEST_2200
     * @tc.desc    Set with string containing special characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest2200';
      console.info(`${caseName}, test start`);
      const key = '!@#$%^&*()_+{}:"<>?`~';
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set(key, 'special chars');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('special chars');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest2300
     * @tc.number  SUB_COLLECTIONS_SET_TEST_2300
     * @tc.desc    Set with multi-line string key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest2300';
      console.info(`${caseName}, test start`);
      const key = 'line1\nline2';
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set(key, 'multi-line');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('multi-line');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest2400
     * @tc.number  SUB_COLLECTIONS_SET_TEST_2400
     * @tc.desc    Set with Unicode character key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest2400';
      console.info(`${caseName}, test start`);
      const key = '€';
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set(key, 'unicode');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('unicode');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest2500
     * @tc.number  SUB_COLLECTIONS_SET_TEST_2500
     * @tc.desc    Set with Map instance as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest2500';
      console.info(`${caseName}, test start`);
      const keyMap: collections.Map<string, string> = new collections.Map<string, string>();
      const map: collections.Map<collections.Map<string, string>, string> = new collections.Map<collections.Map<string, string>, string>();
      map.set(keyMap, 'map as key');
      expect(map.has(keyMap)).assertEqual(true);
      expect(map.get(keyMap)).assertEqual('map as key');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest2600
     * @tc.number  SUB_COLLECTIONS_SET_TEST_2600
     * @tc.desc    Set with Set instance as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest2600';
      console.info(`${caseName}, test start`);
      const keySet: collections.Set<string> = new collections.Set<string>();
      const map: collections.Map<collections.Set<string>, string> = new collections.Map<collections.Set<string>, string>();
      map.set(keySet, 'set as key');
      expect(map.has(keySet)).assertEqual(true);
      expect(map.get(keySet)).assertEqual('set as key');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest2700
     * @tc.number  SUB_COLLECTIONS_SET_TEST_2700
     * @tc.desc    Set with class as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest2700';
      console.info(`${caseName}, test start`);
      const instance = new TestClass();
      const map: collections.Map<TestClass, string> = new collections.Map<TestClass, string>();
      map.set(instance, 'class as key');
      expect(map.has(instance)).assertEqual(true);
      expect(map.get(instance)).assertEqual('class as key');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest2800
     * @tc.number  SUB_COLLECTIONS_SET_TEST_2800
     * @tc.desc    Set with class instance as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest2800';
      console.info(`${caseName}, test start`);
      const instance = new TestClass();
      const map: collections.Map<TestClass, string> = new collections.Map<TestClass, string>();
      map.set(instance, 'instance as key');
      expect(map.has(instance)).assertEqual(true);
      expect(map.get(instance)).assertEqual('instance as key');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest2900
     * @tc.number  SUB_COLLECTIONS_SET_TEST_2900
     * @tc.desc    Set with empty map and add entries
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest2900';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      expect(map.size).assertEqual(0);

      map.set('a', 1);
      map.set('b', 2);

      expect(map.size).assertEqual(2);
      expect(map.get('a')).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest3000
     * @tc.number  SUB_COLLECTIONS_SET_TEST_3000
     * @tc.desc    Set after delete
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest3000';
      console.info(`${caseName}, test start`);
      const map = new collections.Map<string, string>([['key', 'value']]);
      map.delete('key');
      expect(map.has('key')).assertEqual(false);

      map.set('key', 'new value');
      expect(map.has('key')).assertEqual(true);
      expect(map.get('key')).assertEqual('new value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest3100
     * @tc.number  SUB_COLLECTIONS_SET_TEST_3100
     * @tc.desc    Set after clear
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest3100';
      console.info(`${caseName}, test start`);
      const map = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      map.clear();
      expect(map.size).assertEqual(0);
      map.set('c', 3);
      expect(map.size).assertEqual(1);
      expect(map.get('c')).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest3200
     * @tc.number  SUB_COLLECTIONS_SET_TEST_3200
     * @tc.desc    Set with same key multiple times
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetTest3200';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'first');
      map.set('key', 'second');
      map.set('key', 'third');

      expect(map.size).assertEqual(1);
      expect(map.get('key')).assertEqual('third');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest3300
     * @tc.number  SUB_COLLECTIONS_SET_TEST_3300
     * @tc.desc    Set with large number of entries
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('collectionsSetTest3300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetTest3300';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      const count = 10000;
      for (let i = 0; i < count; i++) {
        map.set(`key-${i}`, i);
      }
      expect(map.size).assertEqual(count);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest3400
     * @tc.number  SUB_COLLECTIONS_SET_TEST_3400
     * @tc.desc    Set with key that is a number converted to string
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest3400';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number | string, string> = new collections.Map<number | string, string>();
      map.set(123, 'number')
        .set('123', 'string');

      expect(map.size).assertEqual(2);
      expect(map.get(123)).assertEqual('number');
      expect(map.get('123')).assertEqual('string');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest3500
     * @tc.number  SUB_COLLECTIONS_SET_TEST_3500
     * @tc.desc    Set with boolean true and number 1
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest3500';
      console.info(`${caseName}, test start`);
      const map: collections.Map<boolean | number, string> = new collections.Map<boolean | number, string>();
      map.set(true, 'boolean')
        .set(1, 'number');

      expect(map.size).assertEqual(2);
      expect(map.get(true)).assertEqual('boolean');
      expect(map.get(1)).assertEqual('number');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest3600
     * @tc.number  SUB_COLLECTIONS_SET_TEST_3600
     * @tc.desc    Set with boolean false and number 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest3600';
      console.info(`${caseName}, test start`);
      const map: collections.Map<boolean | number, string> = new collections.Map<boolean | number, string>();
      map.set(false, 'boolean')
        .set(0, 'number');

      expect(map.size).assertEqual(2);
      expect(map.get(false)).assertEqual('boolean');
      expect(map.get(0)).assertEqual('number');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest3700
     * @tc.number  SUB_COLLECTIONS_SET_TEST_3700
     * @tc.desc    Set with key that is a string with different cases
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest3700';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('Key', 'capitalized')
        .set('key', 'lowercase');

      expect(map.size).assertEqual(2);
      expect(map.get('Key')).assertEqual('capitalized');
      expect(map.get('key')).assertEqual('lowercase');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest3800
     * @tc.number  SUB_COLLECTIONS_SET_TEST_3800
     * @tc.desc    Set with key that is a string with whitespace
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest3800';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'no space')
        .set(' key ', 'with spaces');

      expect(map.size).assertEqual(2);
      expect(map.get('key')).assertEqual('no space');
      expect(map.get(' key ')).assertEqual('with spaces');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest3900
     * @tc.number  SUB_COLLECTIONS_SET_TEST_3900
     * @tc.desc    Set with key that is a BigInt and a Number with same value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest3900';
      console.info(`${caseName}, test start`);
      const map: collections.Map<bigint | number, string> = new collections.Map<bigint | number, string>();
      map.set(42n, 'bigint')
        .set(42, 'number');

      expect(map.size).assertEqual(2);
      expect(map.get(42n)).assertEqual('bigint');
      expect(map.get(42)).assertEqual('number');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest4000
     * @tc.number  SUB_COLLECTIONS_SET_TEST_4000
     * @tc.desc    Set with class and its name as keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest4000';
      console.info(`${caseName}, test start`);
      const myClass = new MyClass('');
      const map: collections.Map<MyClass | string, string> = new collections.Map<MyClass | string, string>();
      map.set(myClass as MyClass, 'class object')
        .set(myClass.name, 'class name');

      expect(map.size).assertEqual(2);
      expect(map.get(myClass)).assertEqual('class object');
      expect(map.get(myClass.name)).assertEqual('class name');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest4100
     * @tc.number  SUB_COLLECTIONS_SET_TEST_4100
     * @tc.desc    Set with undefined and string 'undefined'
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest4100';
      console.info(`${caseName}, test start`);
      const map: collections.Map<undefined | string, string> = new collections.Map<undefined | string, string>();
      map.set(undefined, 'undefined value')
        .set('undefined', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(undefined)).assertEqual('undefined value');
      expect(map.get('undefined')).assertEqual('string value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest4200
     * @tc.number  SUB_COLLECTIONS_SET_TEST_4200
     * @tc.desc    Set with null and string 'null'
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest4200';
      console.info(`${caseName}, test start`);
      const map: collections.Map<null | string, string> = new collections.Map<null | string, string>();
      map.set(null, 'null value')
        .set('null', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(null)).assertEqual('null value');
      expect(map.get('null')).assertEqual('string value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest4300
     * @tc.number  SUB_COLLECTIONS_SET_TEST_4300
     * @tc.desc    Set with NaN and string 'NaN'
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest4300';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number | string, string> = new collections.Map<number | string, string>();
      map.set(NaN, 'nan value')
        .set('NaN', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(NaN)).assertEqual('nan value');
      expect(map.get('NaN')).assertEqual('string value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetTest4400
     * @tc.number  SUB_COLLECTIONS_SET_TEST_4400
     * @tc.desc    Set with Infinity and string 'Infinity'
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetTest4400';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number | string, string> = new collections.Map<number | string, string>();
      map.set(Infinity, 'infinity value')
        .set('Infinity', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(Infinity)).assertEqual('infinity value');
      expect(map.get('Infinity')).assertEqual('string value');
      console.info(`${caseName}, test end`);
    });

  });
}


