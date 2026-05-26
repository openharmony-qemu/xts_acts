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
class MyClass {
  value: number;
  constructor(value: number) {
    this.value = value;
  }
}

export default function CollectionsSetAddTest() {
  describe('CollectionsSetAddTest', () => {
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
     * @tc.name    collectionsSetAddTest0100
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_0100
     * @tc.desc    Add single lowercase string to empty Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetAddTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetAddTest0100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('javascript');
      expect(set.size).assertEqual(1);
      expect(set.has('javascript')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest0200
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_0200
     * @tc.desc    Add single uppercase string to empty Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetAddTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetAddTest0200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('TYPESCRIPT');
      expect(set.size).assertEqual(1);
      expect(set.has('TYPESCRIPT')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest0300
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_0300
     * @tc.desc    Add positive integer to empty Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetAddTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetAddTest0300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(42);
      expect(set.size).assertEqual(1);
      expect(set.has(42)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest0400
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_0400
     * @tc.desc    Add negative integer to empty Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetAddTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetAddTest0400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(-73);
      expect(set.size).assertEqual(1);
      expect(set.has(-73)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest0500
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_0500
     * @tc.desc    Add positive floating-point number to empty Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetAddTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetAddTest0500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(3.14159);
      expect(set.size).assertEqual(1);
      expect(set.has(3.14159)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest0600
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_0600
     * @tc.desc    Add negative floating-point number to empty Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetAddTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetAddTest0600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(-2.71828);
      expect(set.size).assertEqual(1);
      expect(set.has(-2.71828)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest0700
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_0700
     * @tc.desc    Add boolean true to empty Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetAddTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetAddTest0700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>();
      set.add(true);
      expect(set.size).assertEqual(1);
      expect(set.has(true)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest0800
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_0800
     * @tc.desc    Add boolean false to empty Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetAddTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetAddTest0800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>();
      set.add(false);
      expect(set.size).assertEqual(1);
      expect(set.has(false)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest0900
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_0900
     * @tc.desc    Add duplicate strings to Set (should ignore duplicates)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest1100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('duplicate').add('duplicate');
      expect(set.size).assertEqual(1);
      expect(set.has('duplicate')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest1000
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_1000
     * @tc.desc    Add duplicate numbers to Set (should ignore duplicates)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest1200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(100).add(100);
      expect(set.size).assertEqual(1);
      expect(set.has(100)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest1100
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_1100
     * @tc.desc    Add string "7" and number 7 (should treat as distinct)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest1300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number> = new collections.Set<string | number>();
      set.add('7').add(7);
      expect(set.size).assertEqual(2);
      expect(set.has('7') && set.has(7)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest1200
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_1200
     * @tc.desc    Add boolean true and number 1 (should treat as distinct)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest1400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean | number> = new collections.Set<boolean | number>();
      set.add(true).add(1);
      expect(set.size).assertEqual(2);
      expect(set.has(true) && set.has(1)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest1300
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_1300
     * @tc.desc    Add 0 and -0 (should treat as equal)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest1500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(0).add(-0);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest1400
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_1400
     * @tc.desc    Add multiple NaN values (should treat as equal)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest1600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(NaN).add(Number('invalid')).add(0/0.0);
      expect(set.size).assertEqual(1);
      expect(set.has(NaN)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest1500
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_1500
     * @tc.desc    Add empty string and space string (should treat as distinct)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest1700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('').add(' ');
      expect(set.size).assertEqual(2);
      expect(set.has('') && set.has(' ')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest1600
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_1600
     * @tc.desc    Add tab and newline characters (should treat as distinct)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest1800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('\t').add('\n');
      expect(set.size).assertEqual(2);
      expect(set.has('\t') && set.has('\n')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest1700
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_1700
     * @tc.desc    Add Infinity and -Infinity (should treat as distinct)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest1900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(Infinity).add(-Infinity);
      expect(set.size).assertEqual(2);
      expect(set.has(Infinity) && set.has(-Infinity)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest1800
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_1800
     * @tc.desc    Add max safe integer and its next value (should treat as distinct)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest2000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const maxSafe = Number.MAX_SAFE_INTEGER;
      set.add(maxSafe).add(maxSafe + 1);
      expect(set.size).assertEqual(2);
      expect(set.has(maxSafe) && set.has(maxSafe + 1)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest1900
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_1900
     * @tc.desc    Add two BigInt values with same numeric value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetAddTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetAddTest2800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<bigint> = new collections.Set<bigint>();
      const big1 = 42n;
      const big2 = 42n;
      set.add(big1).add(big2);
      expect(set.size).assertEqual(1);
      expect(set.has(big1) && set.has(big2)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest2000
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_2000
     * @tc.desc    Use method chaining to add multiple distinct values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetAddTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetAddTest2900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number | boolean | null> = new collections.Set<string | number | boolean | null>();
      set.add('a').add(1).add(true).add(null);
      expect(set.size).assertEqual(4);
      expect(set.has('a') && set.has(1) && set.has(true) && set.has(null)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest2100
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_2100
     * @tc.desc    Verify add() returns the original Set instance for chaining
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetAddTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetAddTest3000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      const result = set.add('test');
      expect(result).assertDeepEquals(set);
      expect(set.has('test')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest2200
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_2200
     * @tc.desc    Add string with Unicode characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest3100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('café');
      expect(set.size).assertEqual(1);
      expect(set.has('café')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest2300
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_2300
     * @tc.desc    Add string with emojis
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest3200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('😊👍');
      expect(set.size).assertEqual(1);
      expect(set.has('😊👍')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest2400
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_2400
     * @tc.desc    Add very large positive integer
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest3300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(9007199254740991);
      expect(set.size).assertEqual(1);
      expect(set.has(9007199254740991)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest2500
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_2500
     * @tc.desc    Add very small negative integer
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest3400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(-9007199254740991);
      expect(set.size).assertEqual(1);
      expect(set.has(-9007199254740991)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest2600
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_2600
     * @tc.desc    Add number with high precision decimal
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest3500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(0.1234567890123456789);
      expect(set.size).assertEqual(1);
      expect(set.has(0.1234567890123456789)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest2700
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_2700
     * @tc.desc    Add string representation of number and number
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest3600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | string> = new collections.Set<number | string>();
      set.add('123.45').add(123.45);
      expect(set.size).assertEqual(2);
      expect(set.has('123.45') && set.has(123.45)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest2800
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_2800
     * @tc.desc    Add boolean false and 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest3700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean | number> = new collections.Set<boolean | number>();
      set.add(false).add(0);
      expect(set.size).assertEqual(2);
      expect(set.has(false) && set.has(0)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest2900
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_2900
     * @tc.desc    Add multiple mixed primitives
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest3800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number | boolean | null | undefined> = new collections.Set<string | number | boolean | null | undefined>();
      set.add('a').add(1).add(true).add(null).add(undefined);
      expect(set.size).assertEqual(5);
      expect(set.has('a') && set.has(1) && set.has(true) && set.has(null) && set.has(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest3000
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_3000
     * @tc.desc    Add hexadecimal and decimal equivalents
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest3900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(0x10).add(16);
      expect(set.size).assertEqual(1);
      expect(set.has(16)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest3100
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_3100
     * @tc.desc    Add octal and decimal equivalents
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest4000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(0o20).add(16);
      expect(set.size).assertEqual(1);
      expect(set.has(16)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest3200
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_3200
     * @tc.desc    Add binary and decimal equivalents
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest4100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(0b10000).add(16);
      expect(set.size).assertEqual(1);
      expect(set.has(16)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest3300
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_3300
     * @tc.desc    Add exponential notation numbers
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest4200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(1e3).add(1000);
      expect(set.size).assertEqual(1);
      expect(set.has(1000)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest3400
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_3400
     * @tc.desc    Add string with leading zeros and number
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest4300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | string> = new collections.Set<number | string>();
      set.add('00123').add(123);
      expect(set.size).assertEqual(2);
      expect(set.has('00123') && set.has(123)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest3500
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_3500
     * @tc.desc    Add empty string and string with zero
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest4400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('').add('0');
      expect(set.size).assertEqual(2);
      expect(set.has('') && set.has('0')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest3600
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_3600
     * @tc.desc    Add Infinity and large number
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest4500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(Infinity).add(1e308);
      expect(set.size).assertEqual(2);
      expect(set.has(Infinity) && set.has(1e308)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest3700
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_3700
     * @tc.desc    Add -Infinity and very small number
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest4600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(-Infinity).add(-1e308);
      expect(set.size).assertEqual(2);
      expect(set.has(-Infinity) && set.has(-1e308)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest3800
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_3800
     * @tc.desc    Add Number.MIN_VALUE
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest4700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(Number.MIN_VALUE);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.MIN_VALUE)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest3900
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_3900
     * @tc.desc    Add Number.EPSILON
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest4800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(Number.EPSILON);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.EPSILON)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest4000
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_4000
     * @tc.desc    Add mixed case strings
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest4900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('JavaScript').add('javascript');
      expect(set.size).assertEqual(2);
      expect(set.has('JavaScript') && set.has('javascript')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest4100
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_4100
     * @tc.desc    Add strings with whitespace variations
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest5000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('test').add(' test').add('test ').add(' test ');
      expect(set.size).assertEqual(4);
      expect(set.has('test') && set.has(' test') && set.has('test ') && set.has(' test ')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest4200
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_4200
     * @tc.desc    Add class instances with @Sendable annotation
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetAddTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetAddTest5800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<MyClass> = new collections.Set<MyClass>();
      const instance1 = new MyClass(10);
      const instance2 = new MyClass(10);
      set.add(instance1).add(instance2);
      expect(set.size).assertEqual(2);
      expect(set.has(instance1) && set.has(instance2)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest4300
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_4300
     * @tc.desc    Add BigInt with different values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetAddTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetAddTest6400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<bigint> = new collections.Set<bigint>();
      const big1 = 123n;
      const big2 = 456n;
      set.add(big1).add(big2);
      expect(set.size).assertEqual(2);
      expect(set.has(big1) && set.has(big2)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest4400
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_4400
     * @tc.desc    Add very large number of elements
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('collectionsSetAddTest4400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetAddTest7100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const count = 10000;
      for (let i = 0; i < count; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(count);
      expect(set.has(count - 1)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest4500
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_4500
     * @tc.desc    Add elements to pre-initialized Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest7200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.add(4).add(5);
      expect(set.size).assertEqual(5);
      expect(set.has(3) && set.has(5)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest4600
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_4600
     * @tc.desc    Add elements to Set created from array
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest7300';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const set: collections.Set<number> = new collections.Set<number>(arr);
      set.add(4);
      expect(set.size).assertEqual(4);
      expect(set.has(4)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest4700
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_4700
     * @tc.desc    Add elements to Set created from another Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest7400';
      console.info(`${caseName}, test start`);
      const originalSet: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const set: collections.Set<number> = new collections.Set<number>(originalSet);
      set.add(4);
      expect(set.size).assertEqual(4);
      expect(originalSet.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest4800
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_4800
     * @tc.desc    Add elements in chain after other operations
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetAddTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetAddTest7500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(1).add(2);
      set.has(1);
      set.add(3).add(4);
      expect(set.size).assertEqual(4);
      expect(set.has(4)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest4900
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_4900
     * @tc.desc    Add same value after deleting it
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest7600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('value');
      set.delete('value');
      set.add('value');
      expect(set.size).assertEqual(1);
      expect(set.has('value')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest5000
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_5000
     * @tc.desc    Add elements to cleared Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest7700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();
      set.add(4).add(5);
      expect(set.size).assertEqual(2);
      expect(set.has(4) && set.has(5)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest5100
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_5100
     * @tc.desc    Add elements and check with Array.from
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest8500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('x').add('y').add('z');
      const arr = Array.from(set);
      expect(arr.length).assertEqual(3);
      expect(arr.includes('x') && arr.includes('y') && arr.includes('z')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest5200
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_5200
     * @tc.desc    Add elements and check with Set.prototype.values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest8600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(10).add(20).add(30);
      const values = Array.from(set.values());
      expect(values.length).assertEqual(3);
      expect(values.includes(10) && values.includes(20) && values.includes(30)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest5300
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_5300
     * @tc.desc    Add elements to nested Sets
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetAddTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetAddTest8900';
      console.info(`${caseName}, test start`);
      const outerSet: collections.Set<collections.Set<number>> = new collections.Set<collections.Set<number>>();
      const innerSet1: collections.Set<number> = new collections.Set<number>();
      const innerSet2: collections.Set<number> = new collections.Set<number>();

      innerSet1.add(1).add(2);
      innerSet2.add(3).add(4);

      outerSet.add(innerSet1).add(innerSet2);

      expect(outerSet.size).assertEqual(2);
      expect(innerSet1.size).assertEqual(2);
      expect(innerSet2.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest5400
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_5400
     * @tc.desc    Add elements and check size after various operations
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest9200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();

      set.add(1);
      expect(set.size).assertEqual(1);

      set.add(2).add(3);
      expect(set.size).assertEqual(3);

      set.delete(2);
      expect(set.size).assertEqual(2);

      set.add(3);
      expect(set.size).assertEqual(2);

      set.add(4);
      expect(set.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest5500
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_5500
     * @tc.desc    Add elements with same string representation but different types
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest9300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number | bigint> = new collections.Set<string | number | bigint>();
      set.add('123').add(123).add(123n);

      expect(set.size).assertEqual(3);
      expect(set.has('123') && set.has(123) && set.has(123n)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetAddTest5600
     * @tc.number  SUB_COLLECTIONS_SET_ADD_TEST_5600
     * @tc.desc    Add elements to multiple Sets
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetAddTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetAddTest9800';
      console.info(`${caseName}, test start`);
      const set1: collections.Set<string> = new collections.Set<string>();
      const set2: collections.Set<string> = new collections.Set<string>();
      const commonElement = 'shared';

      set1.add('a').add(commonElement);
      set2.add('b').add(commonElement);

      expect(set1.size).assertEqual(2);
      expect(set2.size).assertEqual(2);
      expect(set1.has(commonElement) && set2.has(commonElement)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

  });
}