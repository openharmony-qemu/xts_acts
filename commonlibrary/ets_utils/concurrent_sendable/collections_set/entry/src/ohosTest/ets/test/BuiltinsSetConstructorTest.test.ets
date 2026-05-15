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

export default function BuiltinsSetConstructorTest() {
  describe('BuiltinsSetConstructorTest', () => {
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
     * @tc.name    builtinsSetConstructorTest0100
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_0100
     * @tc.desc    Passing empty iterable object should create an empty Set
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetConstructorTest0100';
      console.info(`${caseName}, test start`);
      const s: collections.Set<string> = new collections.Set<string>([] as string[]);
      expect(s.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest0200
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_0200
     * @tc.desc    Set should distinguish between 0 and -0
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetConstructorTest0200';
      console.info(`${caseName}, test start`);
      const s: collections.Set<number> = new collections.Set<number>([0, -0]);
      expect(s.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest0300
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_0300
     * @tc.desc    Set should handle empty string and whitespace string as different
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetConstructorTest0300';
      console.info(`${caseName}, test start`);
      const s: collections.Set<string> = new collections.Set<string>(['', ' ']);
      expect(s.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest0400
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_0400
     * @tc.desc    Set should distinguish between number and string representations
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetConstructorTest0400';
      console.info(`${caseName}, test start`);
      const s: collections.Set<number | string> = new collections.Set<number | string>([1, '1']);
      expect(s.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest0500
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_0500
     * @tc.desc    Set should handle same array reference correctly
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest0500';
      console.info(`${caseName}, test start`);
      const arr: number[] = [1];
      const s: collections.Set<number> = new collections.Set<number>([arr[0], arr[0]]);
      expect(s.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest0600
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_0600
     * @tc.desc    Set should handle iterable with mixed primitive types
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetConstructorTest0600';
      console.info(`${caseName}, test start`);
      const s: collections.Set<number | string | boolean> = new collections.Set<number | string | boolean>([1, '1', true, 1, false, true]);
      expect(s.size).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest0700
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_0700
     * @tc.desc    Set created from another Set should not reference the original
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest0700';
      console.info(`${caseName}, test start`);
      const s1: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const s2: collections.Set<number> = new collections.Set<number>(s1);
      s1.delete(1);
      expect(s2.has(1)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest0800
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_0800
     * @tc.desc    Set should process iterable with null values
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetConstructorTest0800';
      console.info(`${caseName}, test start`);
      const s: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, null, undefined, null]);
      expect(s.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest0900
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_0900
     * @tc.desc    Set should handle sparse arrays correctly
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest0900';
      console.info(`${caseName}, test start`);
      const sparseArray: (number | undefined)[] = [1, undefined, 2, undefined, 1];
      const s: collections.Set<number | undefined> = new collections.Set<number | undefined>(sparseArray);
      expect(s.size).assertEqual(3);
      expect(s.has(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest1000
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_1000
     * @tc.desc    Set should not modify the original iterable
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest1000';
      console.info(`${caseName}, test start`);
      const original: number[] = [1, 2, 3];
      const s: collections.Set<number> = new collections.Set<number>(original);
      s.delete(1);
      expect(original.length).assertEqual(3);
      expect(original[0]).assertEqual(1);
      expect(JSON.stringify(original)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest1100
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_1100
     * @tc.desc    Set should process iterable with Infinity values
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest1100';
      console.info(`${caseName}, test start`);
      const s: collections.Set<number> = new collections.Set<number>([Infinity, Infinity, -Infinity, Infinity]);
      expect(s.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest1200
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_1200
     * @tc.desc    Set should distinguish between Infinity and other numbers
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest1200';
      console.info(`${caseName}, test start`);
      const s: collections.Set<number> = new collections.Set<number>([Infinity, 1000000, Infinity]);
      expect(s.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest1300
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_1300
     * @tc.desc    Set should handle BigInt and Number with same value as different
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest1300';
      console.info(`${caseName}, test start`);
      const s: collections.Set<number | bigint> = new collections.Set<number | bigint>([1n, 1, 2n, 2]);
      expect(s.size).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest1400
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_1400
     * @tc.desc    Set should handle multiple NaN values correctly
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetConstructorTest1400';
      console.info(`${caseName}, test start`);
      const s: collections.Set<number> = new collections.Set<number>([NaN, NaN, NaN]);
      expect(s.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest1500
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_1500
     * @tc.desc    Set should handle iterable with random unique values
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest1500';
      console.info(`${caseName}, test start`);
      const uniqueNumbers: collections.Set<number> = new collections.Set<number>();
      uniqueNumbers.add(1).add(2).add(3).add(4).add(5);
      const s: collections.Set<number> = new collections.Set<number>(uniqueNumbers);
      expect(s.size).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest1600
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_1600
     * @tc.desc    Set should handle very long strings as values
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest1600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest1600';
      console.info(`${caseName}, test start`);
      const longStr = 'a'.repeat(10000);
      const longStr2 = 'b'.repeat(10000);
      const s: collections.Set<string> = new collections.Set<string>([longStr, longStr, longStr2]);
      expect(s.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest1700
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_1700
     * @tc.desc    Set should handle iterable with various whitespace characters
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest1700';
      console.info(`${caseName}, test start`);
      const s: collections.Set<string> = new collections.Set<string>([' ', '\t', '\n', '\r', ' ', '\t']);
      expect(s.size).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest1800
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_1800
     * @tc.desc    Set should handle Unicode characters correctly
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest1800';
      console.info(`${caseName}, test start`);
      const s: collections.Set<string> = new collections.Set<string>(['a', 'á', 'à', 'a', 'á']);
      expect(s.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest1900
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_1900
     * @tc.desc    Set should handle surrogate pairs correctly
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest1900';
      console.info(`${caseName}, test start`);
      const emoji1 = '😊';
      const emoji2 = '😊';
      const emoji3 = '😂';
      const s: collections.Set<string> = new collections.Set<string>([emoji1, emoji2, emoji3]);
      expect(s.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest2000
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_2000
     * @tc.desc    Set should handle iterable with mixed Unicode and ASCII
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest2000';
      console.info(`${caseName}, test start`);
      const s: collections.Set<string> = new collections.Set<string>(['a', 'á', 'b', 'a', '😂']);
      expect(s.size).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest2100
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_2100
     * @tc.desc    Set should handle iterable with zero-width characters
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest2100';
      console.info(`${caseName}, test start`);
      const zeroWidthSpace = '\u200B';
      const zeroWidthJoiner = '\u200D';
      const s: collections.Set<string> = new collections.Set<string>([zeroWidthSpace, zeroWidthJoiner, zeroWidthSpace]);
      expect(s.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest2200
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_2200
     * @tc.desc    Set should handle iterable with control characters
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetConstructorTest2200';
      console.info(`${caseName}, test start`);
      const s: collections.Set<string> = new collections.Set<string>([String.fromCharCode(0), String.fromCharCode(1), String.fromCharCode(0)]);
      expect(s.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest2300
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_2300
     * @tc.desc    Set should handle iterable with mixed letter cases
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetConstructorTest2300';
      console.info(`${caseName}, test start`);
      const s: collections.Set<string> = new collections.Set<string>(['A', 'a', 'B', 'b', 'A']);
      expect(s.size).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetConstructorTest2400
     * @tc.number  SUB_BUILTINS_SET_CONSTRUCTOR_TEST_2400
     * @tc.desc    Set should handle iterable with numeric strings and numbers
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetConstructorTest2400';
      console.info(`${caseName}, test start`);
      const s: collections.Set<number | string> = new collections.Set<number | string>(['1', 1, '2', 2, '1']);
      expect(s.size).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

  });
}