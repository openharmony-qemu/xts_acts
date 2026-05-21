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

export default function CollectionsMapConstructorTest() {
  describe('CollectionsMapConstructorTest', () => {
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
     * @tc.name    collectionsMapConstructorTest0100
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_0100
     * @tc.desc    Create empty ArkTS Map using constructor
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapConstructorTest0200
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_0200
     * @tc.desc    Create ArkTS Map from array of key-value pairs
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapConstructorTest0300
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_0300
     * @tc.desc    Create ArkTS Map from another ArkTS Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const original: collections.Map<string, string> = new collections.Map<string, string>([['key', 'value']]);
      const map: collections.Map<string, string> = new collections.Map<string, string>(Array.from(original.entries()));
      expect(map.get('key')).assertEqual('value');
    });

    /**
     * @tc.name    collectionsMapConstructorTest0400
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_0400
     * @tc.desc    Create ArkTS Map with null as parameter
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>(null);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapConstructorTest0500
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_0500
     * @tc.desc    Create ArkTS Map with undefined as parameter
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>(undefined);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name    collectionsMapConstructorTest0600
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_0600
     * @tc.desc    ArkTS Map with boolean keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      expect(map.get(true)).assertEqual('yes');
      expect(map.get(false)).assertEqual('no');
    });

    /**
     * @tc.name    collectionsMapConstructorTest0700
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_0700
     * @tc.desc    ArkTS Map with number keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      expect(map.get(1)).assertEqual('one');
      expect(map.get(2)).assertEqual('two');
    });

    /**
     * @tc.name    collectionsMapConstructorTest0800
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_0800
     * @tc.desc    ArkTS Map with NaN as key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[NaN, 'not a number']]);
      expect(map.get(NaN)).assertEqual('not a number');
    });

    /**
     * @tc.name    collectionsMapConstructorTest0900
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_0900
     * @tc.desc    ArkTS Map with duplicate primitive keys in iterable
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['a', 2], ['a', 3]]);
      expect(map.size).assertEqual(1);
      expect(map.get('a')).assertEqual(3);
    });

    /**
     * @tc.name    collectionsMapConstructorTest1000
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_1000
     * @tc.desc    Check ArkTS Map is instance of collections.Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('collectionsMapConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      expect(map instanceof collections.Map).assertEqual(true);
    });

    /**
     * @tc.name    collectionsMapConstructorTest1100
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_1100
     * @tc.desc    ArkTS Map with key as null
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new collections.Map<null, string>([[null, 'null value']]);
      expect(map.get(null)).assertEqual('null value');
    });

    /**
     * @tc.name    collectionsMapConstructorTest1200
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_1200
     * @tc.desc    ArkTS Map with key as undefined
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new collections.Map<undefined, string>([[undefined, 'undefined value']]);
      expect(map.get(undefined)).assertEqual('undefined value');
    });

    /**
     * @tc.name    collectionsMapConstructorTest1300
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_1300
     * @tc.desc    ArkTS Map with key as Infinity
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[Infinity, 'infinity value']]);
      expect(map.get(Infinity)).assertEqual('infinity value');
    });

    /**
     * @tc.name    collectionsMapConstructorTest1400
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_1400
     * @tc.desc    ArkTS Map with key as -Infinity
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[-Infinity, 'negative infinity value']]);
      expect(map.get(-Infinity)).assertEqual('negative infinity value');
    });

    /**
     * @tc.name    collectionsMapConstructorTest1500
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_1500
     * @tc.desc    ArkTS Map with key as bigint
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const key: bigint = 123n;
      const map: collections.Map<bigint, string> = new collections.Map<bigint, string>([[key, 'bigint value']]);
      expect(map.get(key)).assertEqual('bigint value');
    });

    /**
     * @tc.name    collectionsMapConstructorTest1600
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_1600
     * @tc.desc    ArkTS Map with empty string key
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['', 'empty string']]);
      expect(map.get('')).assertEqual('empty string');
    });

    /**
     * @tc.name    collectionsMapConstructorTest1700
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_1700
     * @tc.desc    ArkTS Map with whitespace string keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([[' ', 'space'], ['\t', 'tab'], ['\n', 'newline']]);
      expect(map.get(' ')).assertEqual('space');
      expect(map.get('\t')).assertEqual('tab');
      expect(map.get('\n')).assertEqual('newline');
    });

    /**
     * @tc.name    collectionsMapConstructorTest1800
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_1800
     * @tc.desc    ArkTS Map with special character keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['!', 'exclamation'], ['@', 'at'], ['#', 'hash']]);
      expect(map.get('!')).assertEqual('exclamation');
      expect(map.get('@')).assertEqual('at');
      expect(map.get('#')).assertEqual('hash');
    });

    /**
     * @tc.name    collectionsMapConstructorTest1900
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_TEST_1900
     * @tc.desc    ArkTS Map with Unicode character keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['€', 'euro'], ['π', 'pi'], ['😊', 'smile']]);
      expect(map.get('€')).assertEqual('euro');
      expect(map.get('π')).assertEqual('pi');
      expect(map.get('😊')).assertEqual('smile');
    });

  })
}
