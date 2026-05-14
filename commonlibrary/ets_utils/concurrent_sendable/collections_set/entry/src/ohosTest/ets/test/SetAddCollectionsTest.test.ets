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

export default function SetAddCollectionsTest() {
  describe('SetAddCollectionsTest', () => {
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
     * @tc.desc Add single lowercase string to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetAddCollectionsTest001';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('javascript');
      expect(set.size).assertEqual(1);
      expect(set.has('javascript')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0200
     * @tc.name builtinsAsyncLockConstructorTest0200
     * @tc.desc Add single uppercase string to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetAddCollectionsTest002';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('TYPESCRIPT');
      expect(set.size).assertEqual(1);
      expect(set.has('TYPESCRIPT')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0300
     * @tc.name builtinsAsyncLockConstructorTest0300
     * @tc.desc Add positive integer to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetAddCollectionsTest003';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(42);
      expect(set.size).assertEqual(1);
      expect(set.has(42)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0400
     * @tc.name builtinsAsyncLockConstructorTest0400
     * @tc.desc Add negative integer to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetAddCollectionsTest004';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(-73);
      expect(set.size).assertEqual(1);
      expect(set.has(-73)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0500
     * @tc.name builtinsAsyncLockConstructorTest0500
     * @tc.desc Add positive floating-point number to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetAddCollectionsTest005';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(3.14159);
      expect(set.size).assertEqual(1);
      expect(set.has(3.14159)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0600
     * @tc.name builtinsAsyncLockConstructorTest0600
     * @tc.desc Add negative floating-point number to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetAddCollectionsTest006';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(-2.71828);
      expect(set.size).assertEqual(1);
      expect(set.has(-2.71828)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0700
     * @tc.name builtinsAsyncLockConstructorTest0700
     * @tc.desc Add boolean true to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetAddCollectionsTest007';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>();
      set.add(true);
      expect(set.size).assertEqual(1);
      expect(set.has(true)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0800
     * @tc.name builtinsAsyncLockConstructorTest0800
     * @tc.desc Add boolean false to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetAddCollectionsTest008';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>();
      set.add(false);
      expect(set.size).assertEqual(1);
      expect(set.has(false)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0900
     * @tc.name builtinsAsyncLockConstructorTest0900
     * @tc.desc Add duplicate strings to Set (should ignore duplicates)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest011';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('duplicate').add('duplicate');
      expect(set.size).assertEqual(1);
      expect(set.has('duplicate')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1000
     * @tc.name builtinsAsyncLockConstructorTest1000
     * @tc.desc Add duplicate numbers to Set (should ignore duplicates)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest012';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(100).add(100);
      expect(set.size).assertEqual(1);
      expect(set.has(100)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1100
     * @tc.name builtinsAsyncLockConstructorTest1100
     * @tc.desc Add string "7" and number 7 (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest013';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number> = new collections.Set<string | number>();
      set.add('7').add(7);
      expect(set.size).assertEqual(2);
      expect(set.has('7') && set.has(7)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1200
     * @tc.name builtinsAsyncLockConstructorTest1200
     * @tc.desc Add boolean true and number 1 (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest014';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean | number> = new collections.Set<boolean | number>();
      set.add(true).add(1);
      expect(set.size).assertEqual(2);
      expect(set.has(true) && set.has(1)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1300
     * @tc.name builtinsAsyncLockConstructorTest1300
     * @tc.desc Add 0 and -0 (should treat as equal)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest015';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(0).add(-0);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1400
     * @tc.name builtinsAsyncLockConstructorTest1400
     * @tc.desc Add multiple NaN values (should treat as equal)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest016';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(NaN).add(Number('invalid')).add(0/0.0);
      expect(set.size).assertEqual(1);
      expect(set.has(NaN)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1500
     * @tc.name builtinsAsyncLockConstructorTest1500
     * @tc.desc Add empty string and space string (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest017';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('').add(' ');
      expect(set.size).assertEqual(2);
      expect(set.has('') && set.has(' ')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1600
     * @tc.name builtinsAsyncLockConstructorTest1600
     * @tc.desc Add tab and newline characters (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest018';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('\t').add('\n');
      expect(set.size).assertEqual(2);
      expect(set.has('\t') && set.has('\n')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1700
     * @tc.name builtinsAsyncLockConstructorTest1700
     * @tc.desc Add Infinity and -Infinity (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest019';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(Infinity).add(-Infinity);
      expect(set.size).assertEqual(2);
      expect(set.has(Infinity) && set.has(-Infinity)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1800
     * @tc.name builtinsAsyncLockConstructorTest1800
     * @tc.desc Add max safe integer and its next value (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest020';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const maxSafe = Number.MAX_SAFE_INTEGER;
      set.add(maxSafe).add(maxSafe + 1);
      expect(set.size).assertEqual(2);
      expect(set.has(maxSafe) && set.has(maxSafe + 1)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1900
     * @tc.name builtinsAsyncLockConstructorTest1900
     * @tc.desc Add two BigInt values with same numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetAddCollectionsTest028';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2000
     * @tc.name builtinsAsyncLockConstructorTest2000
     * @tc.desc Use method chaining to add multiple distinct values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetAddCollectionsTest029';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number | boolean | null> = new collections.Set<string | number | boolean | null>();
      set.add('a').add(1).add(true).add(null);
      expect(set.size).assertEqual(4);
      expect(set.has('a') && set.has(1) && set.has(true) && set.has(null)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2100
     * @tc.name builtinsAsyncLockConstructorTest2100
     * @tc.desc Verify add() returns the original Set instance for chaining
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetAddCollectionsTest030';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      const result = set.add('test');
      expect(result).assertDeepEquals(set);
      expect(set.has('test')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2200
     * @tc.name builtinsAsyncLockConstructorTest2200
     * @tc.desc Add string with Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest031';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('café');
      expect(set.size).assertEqual(1);
      expect(set.has('café')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2300
     * @tc.name builtinsAsyncLockConstructorTest2300
     * @tc.desc Add string with emojis
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest032';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('😊👍');
      expect(set.size).assertEqual(1);
      expect(set.has('😊👍')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2400
     * @tc.name builtinsAsyncLockConstructorTest2400
     * @tc.desc Add very large positive integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest033';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(9007199254740991);
      expect(set.size).assertEqual(1);
      expect(set.has(9007199254740991)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2500
     * @tc.name builtinsAsyncLockConstructorTest2500
     * @tc.desc Add very small negative integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest034';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(-9007199254740991);
      expect(set.size).assertEqual(1);
      expect(set.has(-9007199254740991)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2600
     * @tc.name builtinsAsyncLockConstructorTest2600
     * @tc.desc Add number with high precision decimal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest035';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(0.1234567890123456789);
      expect(set.size).assertEqual(1);
      expect(set.has(0.1234567890123456789)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2700
     * @tc.name builtinsAsyncLockConstructorTest2700
     * @tc.desc Add string representation of number and number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest036';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | string> = new collections.Set<number | string>();
      set.add('123.45').add(123.45);
      expect(set.size).assertEqual(2);
      expect(set.has('123.45') && set.has(123.45)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2800
     * @tc.name builtinsAsyncLockConstructorTest2800
     * @tc.desc Add boolean false and 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest037';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean | number> = new collections.Set<boolean | number>();
      set.add(false).add(0);
      expect(set.size).assertEqual(2);
      expect(set.has(false) && set.has(0)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2900
     * @tc.name builtinsAsyncLockConstructorTest2900
     * @tc.desc Add multiple mixed primitives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest038';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number | boolean | null | undefined> = new collections.Set<string | number | boolean | null | undefined>();
      set.add('a').add(1).add(true).add(null).add(undefined);
      expect(set.size).assertEqual(5);
      expect(set.has('a') && set.has(1) && set.has(true) && set.has(null) && set.has(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3000
     * @tc.name builtinsAsyncLockConstructorTest3000
     * @tc.desc Add hexadecimal and decimal equivalents
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest039';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(0x10).add(16);
      expect(set.size).assertEqual(1);
      expect(set.has(16)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3100
     * @tc.name builtinsAsyncLockConstructorTest3100
     * @tc.desc Add octal and decimal equivalents
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest040';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(0o20).add(16);
      expect(set.size).assertEqual(1);
      expect(set.has(16)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3200
     * @tc.name builtinsAsyncLockConstructorTest3200
     * @tc.desc Add binary and decimal equivalents
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest041';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(0b10000).add(16);
      expect(set.size).assertEqual(1);
      expect(set.has(16)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3300
     * @tc.name builtinsAsyncLockConstructorTest3300
     * @tc.desc Add exponential notation numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest042';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(1e3).add(1000);
      expect(set.size).assertEqual(1);
      expect(set.has(1000)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3400
     * @tc.name builtinsAsyncLockConstructorTest3400
     * @tc.desc Add string with leading zeros and number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest043';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | string> = new collections.Set<number | string>();
      set.add('00123').add(123);
      expect(set.size).assertEqual(2);
      expect(set.has('00123') && set.has(123)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3500
     * @tc.name builtinsAsyncLockConstructorTest3500
     * @tc.desc Add empty string and string with zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest044';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('').add('0');
      expect(set.size).assertEqual(2);
      expect(set.has('') && set.has('0')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3600
     * @tc.name builtinsAsyncLockConstructorTest3600
     * @tc.desc Add Infinity and large number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest045';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(Infinity).add(1e308);
      expect(set.size).assertEqual(2);
      expect(set.has(Infinity) && set.has(1e308)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3700
     * @tc.name builtinsAsyncLockConstructorTest3700
     * @tc.desc Add -Infinity and very small number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest046';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(-Infinity).add(-1e308);
      expect(set.size).assertEqual(2);
      expect(set.has(-Infinity) && set.has(-1e308)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3800
     * @tc.name builtinsAsyncLockConstructorTest3800
     * @tc.desc Add Number.MIN_VALUE
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest047';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(Number.MIN_VALUE);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.MIN_VALUE)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3900
     * @tc.name builtinsAsyncLockConstructorTest3900
     * @tc.desc Add Number.EPSILON
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest048';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(Number.EPSILON);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.EPSILON)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4000
     * @tc.name builtinsAsyncLockConstructorTest4000
     * @tc.desc Add mixed case strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest049';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('JavaScript').add('javascript');
      expect(set.size).assertEqual(2);
      expect(set.has('JavaScript') && set.has('javascript')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4100
     * @tc.name builtinsAsyncLockConstructorTest4100
     * @tc.desc Add strings with whitespace variations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest050';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('test').add(' test').add('test ').add(' test ');
      expect(set.size).assertEqual(4);
      expect(set.has('test') && set.has(' test') && set.has('test ') && set.has(' test ')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4200
     * @tc.name builtinsAsyncLockConstructorTest4200
     * @tc.desc Add class instances with @Sendable annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetAddCollectionsTest058';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4300
     * @tc.name builtinsAsyncLockConstructorTest4300
     * @tc.desc Add BigInt with different values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetAddCollectionsTest064';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4400
     * @tc.name builtinsAsyncLockConstructorTest4400
     * @tc.desc Add very large number of elements
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'SetAddCollectionsTest071';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4500
     * @tc.name builtinsAsyncLockConstructorTest4500
     * @tc.desc Add elements to pre-initialized Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest072';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.add(4).add(5);
      expect(set.size).assertEqual(5);
      expect(set.has(3) && set.has(5)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4600
     * @tc.name builtinsAsyncLockConstructorTest4600
     * @tc.desc Add elements to Set created from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest073';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const set: collections.Set<number> = new collections.Set<number>(arr);
      set.add(4);
      expect(set.size).assertEqual(4);
      expect(set.has(4)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4700
     * @tc.name builtinsAsyncLockConstructorTest4700
     * @tc.desc Add elements to Set created from another Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest074';
      console.info(`${caseName}, test start`);
      const originalSet: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const set: collections.Set<number> = new collections.Set<number>(originalSet);
      set.add(4);
      expect(set.size).assertEqual(4);
      expect(originalSet.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4800
     * @tc.name builtinsAsyncLockConstructorTest4800
     * @tc.desc Add elements in chain after other operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetAddCollectionsTest075';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4900
     * @tc.name builtinsAsyncLockConstructorTest4900
     * @tc.desc Add same value after deleting it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest076';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5000
     * @tc.name builtinsAsyncLockConstructorTest5000
     * @tc.desc Add elements to cleared Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest077';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();
      set.add(4).add(5);
      expect(set.size).assertEqual(2);
      expect(set.has(4) && set.has(5)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5100
     * @tc.name builtinsAsyncLockConstructorTest5100
     * @tc.desc Add elements and check with Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest085';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('x').add('y').add('z');
      const arr = Array.from(set);
      expect(arr.length).assertEqual(3);
      expect(arr.includes('x') && arr.includes('y') && arr.includes('z')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5200
     * @tc.name builtinsAsyncLockConstructorTest5200
     * @tc.desc Add elements and check with Set.prototype.values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest086';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(10).add(20).add(30);
      const values = Array.from(set.values());
      expect(values.length).assertEqual(3);
      expect(values.includes(10) && values.includes(20) && values.includes(30)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5300
     * @tc.name builtinsAsyncLockConstructorTest5300
     * @tc.desc Add elements to nested Sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetAddCollectionsTest089';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5400
     * @tc.name builtinsAsyncLockConstructorTest5400
     * @tc.desc Add elements and check size after various operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest092';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5500
     * @tc.name builtinsAsyncLockConstructorTest5500
     * @tc.desc Add elements with same string representation but different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest093';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number | bigint> = new collections.Set<string | number | bigint>();
      set.add('123').add(123).add(123n);

      expect(set.size).assertEqual(3);
      expect(set.has('123') && set.has(123) && set.has(123n)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5600
     * @tc.name builtinsAsyncLockConstructorTest5600
     * @tc.desc Add elements to multiple Sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetAddCollectionsTest098';
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
