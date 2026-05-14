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

export default function SetCollectionsTest() {
  describe('SetCollectionsTest', () => {
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0100
     * @tc.name builtinsAsyncLockConstructorTest0100
     * @tc.desc Basic functionality: set string key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest001';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('name', 'Alice');
      expect(map.has('name')).assertEqual(true);
      expect(map.get('name')).assertEqual('Alice');
      expect(map.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0200
     * @tc.name builtinsAsyncLockConstructorTest0200
     * @tc.desc Overwrite existing key with new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest002';
      console.info(`${caseName}, test start`);
      const map = new collections.Map<string, number>([['age', 20]]);
      map.set('age', 21);
      expect(map.get('age')).assertEqual(21);
      expect(map.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0300
     * @tc.name builtinsAsyncLockConstructorTest0300
     * @tc.desc Set number key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest003';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(42, 'answer');
      expect(map.has(42)).assertEqual(true);
      expect(map.get(42)).assertEqual('answer');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0400
     * @tc.name builtinsAsyncLockConstructorTest0400
     * @tc.desc Set boolean key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest004';
      console.info(`${caseName}, test start`);
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, 'active');
      expect(map.has(true)).assertEqual(true);
      expect(map.get(true)).assertEqual('active');
      expect(map.has(false)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0500
     * @tc.name builtinsAsyncLockConstructorTest0500
     * @tc.desc Set null key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest005';
      console.info(`${caseName}, test start`);
      const map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, 'null value');
      expect(map.has(null)).assertEqual(true);
      expect(map.get(null)).assertEqual('null value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0600
     * @tc.name builtinsAsyncLockConstructorTest0600
     * @tc.desc Set undefined key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest006';
      console.info(`${caseName}, test start`);
      const map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      map.set(undefined, 'undefined value');
      expect(map.has(undefined)).assertEqual(true);
      expect(map.get(undefined)).assertEqual('undefined value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0700
     * @tc.name builtinsAsyncLockConstructorTest0700
     * @tc.desc Set bigint key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest013';
      console.info(`${caseName}, test start`);
      const bigintKey = 123n;
      const map: collections.Map<bigint, string> = new collections.Map<bigint, string>();
      map.set(bigintKey, 'bigint value');
      expect(map.has(bigintKey)).assertEqual(true);
      expect(map.get(bigintKey)).assertEqual('bigint value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0800
     * @tc.name builtinsAsyncLockConstructorTest0800
     * @tc.desc Set multiple key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest014';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0900
     * @tc.name builtinsAsyncLockConstructorTest0900
     * @tc.desc Set with same value for different keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest015';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1000
     * @tc.name builtinsAsyncLockConstructorTest1000
     * @tc.desc Set returns the map instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest023';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const result = map.set('key', 'value');
      expect(result).assertEqual(map);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1100
     * @tc.name builtinsAsyncLockConstructorTest1100
     * @tc.desc Chaining set operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest024';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1200
     * @tc.name builtinsAsyncLockConstructorTest1200
     * @tc.desc Set with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest025';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('', 'empty string');
      expect(map.has('')).assertEqual(true);
      expect(map.get('')).assertEqual('empty string');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1300
     * @tc.name builtinsAsyncLockConstructorTest1300
     * @tc.desc Set with numeric string vs number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest026';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1400
     * @tc.name builtinsAsyncLockConstructorTest1400
     * @tc.desc Set with negative number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest027';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(-42, 'negative');
      expect(map.has(-42)).assertEqual(true);
      expect(map.get(-42)).assertEqual('negative');
      expect(map.has(42)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1500
     * @tc.name builtinsAsyncLockConstructorTest1500
     * @tc.desc Set with zero and negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest028';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(0, 'zero')
        .set(-0, 'negative zero');
      expect(map.size).assertEqual(1);
      expect(map.get(0)).assertEqual('negative zero');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1600
     * @tc.name builtinsAsyncLockConstructorTest1600
     * @tc.desc Set with NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest029';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(NaN, 'not a number');
      expect(map.has(NaN)).assertEqual(true);
      expect(map.get(NaN)).assertEqual('not a number');
      expect(map.has(Number('invalid'))).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1700
     * @tc.name builtinsAsyncLockConstructorTest1700
     * @tc.desc Set with Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest030';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(Infinity, 'infinite');
      expect(map.has(Infinity)).assertEqual(true);
      expect(map.get(Infinity)).assertEqual('infinite');
      expect(map.has(-Infinity)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1800
     * @tc.name builtinsAsyncLockConstructorTest1800
     * @tc.desc Set with -Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest031';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(-Infinity, 'negative infinite');
      expect(map.has(-Infinity)).assertEqual(true);
      expect(map.get(-Infinity)).assertEqual('negative infinite');
      expect(map.has(Infinity)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1900
     * @tc.name builtinsAsyncLockConstructorTest1900
     * @tc.desc Set with very large number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest032';
      console.info(`${caseName}, test start`);
      const largeNum = Number.MAX_SAFE_INTEGER;
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(largeNum, 'max safe integer');
      expect(map.has(largeNum)).assertEqual(true);
      expect(map.get(largeNum)).assertEqual('max safe integer');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2000
     * @tc.name builtinsAsyncLockConstructorTest2000
     * @tc.desc Set with very small number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest033';
      console.info(`${caseName}, test start`);
      const smallNum = Number.MIN_SAFE_INTEGER;
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(smallNum, 'min safe integer');
      expect(map.has(smallNum)).assertEqual(true);
      expect(map.get(smallNum)).assertEqual('min safe integer');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2100
     * @tc.name builtinsAsyncLockConstructorTest2100
     * @tc.desc Set with float number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest034';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(3.14, 'pi');
      expect(map.has(3.14)).assertEqual(true);
      expect(map.get(3.14)).assertEqual('pi');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2200
     * @tc.name builtinsAsyncLockConstructorTest2200
     * @tc.desc Set with string containing special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest035';
      console.info(`${caseName}, test start`);
      const key = '!@#$%^&*()_+{}:"<>?`~';
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set(key, 'special chars');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('special chars');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2300
     * @tc.name builtinsAsyncLockConstructorTest2300
     * @tc.desc Set with multi-line string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest036';
      console.info(`${caseName}, test start`);
      const key = 'line1\nline2';
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set(key, 'multi-line');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('multi-line');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2400
     * @tc.name builtinsAsyncLockConstructorTest2400
     * @tc.desc Set with Unicode character key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest037';
      console.info(`${caseName}, test start`);
      const key = '€';
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set(key, 'unicode');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('unicode');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2500
     * @tc.name builtinsAsyncLockConstructorTest2500
     * @tc.desc Set with Map instance as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest047';
      console.info(`${caseName}, test start`);
      const keyMap: collections.Map<string, string> = new collections.Map<string, string>();
      const map: collections.Map<collections.Map<string, string>, string> = new collections.Map<collections.Map<string, string>, string>();
      map.set(keyMap, 'map as key');
      expect(map.has(keyMap)).assertEqual(true);
      expect(map.get(keyMap)).assertEqual('map as key');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2600
     * @tc.name builtinsAsyncLockConstructorTest2600
     * @tc.desc Set with Set instance as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest048';
      console.info(`${caseName}, test start`);
      const keySet: collections.Set<string> = new collections.Set<string>();
      const map: collections.Map<collections.Set<string>, string> = new collections.Map<collections.Set<string>, string>();
      map.set(keySet, 'set as key');
      expect(map.has(keySet)).assertEqual(true);
      expect(map.get(keySet)).assertEqual('set as key');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2700
     * @tc.name builtinsAsyncLockConstructorTest2700
     * @tc.desc Set with class as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest053';
      console.info(`${caseName}, test start`);
      const instance = new TestClass();
      const map: collections.Map<TestClass, string> = new collections.Map<TestClass, string>();
      map.set(instance, 'class as key');
      expect(map.has(instance)).assertEqual(true);
      expect(map.get(instance)).assertEqual('class as key');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2800
     * @tc.name builtinsAsyncLockConstructorTest2800
     * @tc.desc Set with class instance as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest054';
      console.info(`${caseName}, test start`);
      const instance = new TestClass();
      const map: collections.Map<TestClass, string> = new collections.Map<TestClass, string>();
      map.set(instance, 'instance as key');
      expect(map.has(instance)).assertEqual(true);
      expect(map.get(instance)).assertEqual('instance as key');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2900
     * @tc.name builtinsAsyncLockConstructorTest2900
     * @tc.desc Set with empty map and add entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest068';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3000
     * @tc.name builtinsAsyncLockConstructorTest3000
     * @tc.desc Set after delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest069';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3100
     * @tc.name builtinsAsyncLockConstructorTest3100
     * @tc.desc Set after clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest070';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3200
     * @tc.name builtinsAsyncLockConstructorTest3200
     * @tc.desc Set with same key multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'MapSetCollectionsTest071';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3300
     * @tc.name builtinsAsyncLockConstructorTest3300
     * @tc.desc Set with large number of entries
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest3300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'MapSetCollectionsTest074';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3400
     * @tc.name builtinsAsyncLockConstructorTest3400
     * @tc.desc Set with key that is a number converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest077';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3500
     * @tc.name builtinsAsyncLockConstructorTest3500
     * @tc.desc Set with boolean true and number 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest078';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3600
     * @tc.name builtinsAsyncLockConstructorTest3600
     * @tc.desc Set with boolean false and number 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest079';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3700
     * @tc.name builtinsAsyncLockConstructorTest3700
     * @tc.desc Set with key that is a string with different cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest080';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3800
     * @tc.name builtinsAsyncLockConstructorTest3800
     * @tc.desc Set with key that is a string with whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest081';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3900
     * @tc.name builtinsAsyncLockConstructorTest3900
     * @tc.desc Set with key that is a BigInt and a Number with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest083';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4000
     * @tc.name builtinsAsyncLockConstructorTest4000
     * @tc.desc Set with class and its name as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest090';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4100
     * @tc.name builtinsAsyncLockConstructorTest4100
     * @tc.desc Set with undefined and string 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest091';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4200
     * @tc.name builtinsAsyncLockConstructorTest4200
     * @tc.desc Set with null and string 'null'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest092';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4300
     * @tc.name builtinsAsyncLockConstructorTest4300
     * @tc.desc Set with NaN and string 'NaN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest093';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4400
     * @tc.name builtinsAsyncLockConstructorTest4400
     * @tc.desc Set with Infinity and string 'Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'MapSetCollectionsTest094';
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
