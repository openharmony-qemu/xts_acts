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

export default function BuiltinsSetHasTest() {
  describe('BuiltinsSetHasTest', () => {
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
     * @tc.name    builtinsSetHasTest0100
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_0100
     * @tc.desc    Check existing string value, return true
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest0100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['apple', 'banana', 'cherry']);
      const result: boolean = set.has('banana');

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest0200
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_0200
     * @tc.desc    Check non-existing string value, return false
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest0200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['apple', 'banana']);
      const result: boolean = set.has('orange');

      expect(result).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest0300
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_0300
     * @tc.desc    Check existing number value, return true
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest0300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30]);
      const result: boolean = set.has(20);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest0400
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_0400
     * @tc.desc    Check non-existing number value, return false
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest0400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20]);
      const result: boolean = set.has(30);

      expect(result).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest0500
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_0500
     * @tc.desc    Check existing boolean value, return true
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest0500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>([true, false, true]);
      const result: boolean = set.has(false);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest0600
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_0600
     * @tc.desc    Check the only element in Set, return true
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest0600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['only-element']);
      const result: boolean = set.has('only-element');

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest0700
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_0700
     * @tc.desc    Check null value in Set, return true if exists
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest0700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | number> = new collections.Set<null | number>([null, 1, 2]);
      const result: boolean = set.has(null);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest0800
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_0800
     * @tc.desc    Check undefined value in Set, return true if exists
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest0800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<undefined | string> = new collections.Set<undefined | string>([undefined, 'a', 'b']);
      const result: boolean = set.has(undefined);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest0900
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_0900
     * @tc.desc    Check NaN (treated as equal to itself), return true
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest0900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, 1, 2]);
      const result1: boolean = set.has(NaN);
      const result2: boolean = set.has(Number('invalid'));

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest1000
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_1000
     * @tc.desc    Check 0 and -0 (treated as equal), return true for both
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest1000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, 100]);
      const result1: boolean = set.has(-0);
      const result2: boolean = set.has(0);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest1100
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_1100
     * @tc.desc    Check BigInt (same value is equal), return true for same value
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest1100';
      console.info(`${caseName}, test start`);
      const big1: bigint = 123n;
      const big2: bigint = 123n;
      const set: collections.Set<bigint | number> = new collections.Set<bigint | number>([big1]);
      const result1: boolean = set.has(big1);
      const result2: boolean = set.has(big2);
      const result3: boolean = set.has(123);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest1200
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_1200
     * @tc.desc    Check string and number with same value (different types), return false
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest1200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | boolean | number> = new collections.Set<string | boolean | number>(['123', true]);
      const result1: boolean = set.has(123);
      const result2: boolean = set.has(1);

      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest1300
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_1300
     * @tc.desc    Check value after adding to Set, return true immediately
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest1300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('new-value');
      const result: boolean = set.has('new-value');

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest1400
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_1400
     * @tc.desc    Check value after deleting from Set, return false immediately
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest1400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['value']);
      set.delete('value');
      const result: boolean = set.has('value');

      expect(result).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest1500
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_1500
     * @tc.desc    Check large Set (1000 elements), verify has() correctness
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest1500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest1500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }

      const result1: boolean = set.has(500);
      const result2: boolean = set.has(999);
      const result3: boolean = set.has(1000);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest1600
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_1600
     * @tc.desc    Pass multiple parameters to has() (only first is used)
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest1600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const result: boolean = set.has(2);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest1700
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_1700
     * @tc.desc    Check has() after clearing the Set
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest1700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();

      expect(set.has(2)).assertEqual(false);
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest1800
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_1800
     * @tc.desc    Check very large numbers (beyond safe integer)
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest1800';
      console.info(`${caseName}, test start`);
      const largeNum: number = Number.MAX_SAFE_INTEGER + 1;
      const set: collections.Set<number> = new collections.Set<number>([largeNum]);

      expect(set.has(largeNum)).assertEqual(true);
      expect(set.has(Number.MAX_SAFE_INTEGER)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest1900
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_1900
     * @tc.desc    Check has() with same string values but different encodings
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest1900';
      console.info(`${caseName}, test start`);
      const str1: string = 'café';
      const str2: string = 'cafe\u0301';
      const set: collections.Set<string> = new collections.Set<string>([str1]);

      expect(set.has(str1)).assertEqual(true);
      expect(set.has(str2)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest2000
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_2000
     * @tc.desc    Check has() with empty string and whitespace
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest2000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['', ' ', '\t', '\n']);

      expect(set.has('')).assertEqual(true);
      expect(set.has(' ')).assertEqual(true);
      expect(set.has('\t')).assertEqual(true);
      expect(set.has('\n')).assertEqual(true);
      expect(set.has('  ')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest2100
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_2100
     * @tc.desc    Check has() with different Unicode characters
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest2100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'A', 'α', 'β', 'あ', 'ア']);

      expect(set.has('a')).assertEqual(true);
      expect(set.has('A')).assertEqual(true);
      expect(set.has('α')).assertEqual(true);
      expect(set.has('b')).assertEqual(false);
      expect(set.has('あ')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest2200
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_2200
     * @tc.desc    Check has() with NaN in various forms
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest2200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN]);

      expect(set.has(NaN)).assertEqual(true);
      expect(set.has(Number('not-a-number'))).assertEqual(true);
      expect(set.has(Infinity - Infinity)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest2300
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_2300
     * @tc.desc    Check has() with different BigInt values
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest2300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<bigint | number> = new collections.Set<bigint | number>([123n, 456n]);

      expect(set.has(123n)).assertEqual(true);
      expect(set.has(456n)).assertEqual(true);
      expect(set.has(123)).assertEqual(false);
      expect(set.has(789n)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest2400
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_2400
     * @tc.desc    Check has() with null vs undefined
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest2400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined]);

      expect(set.has(null)).assertEqual(true);
      expect(set.has(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest2500
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_2500
     * @tc.desc    Check has() with positive and negative infinity
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest2500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([Infinity, -Infinity]);

      expect(set.has(Infinity)).assertEqual(true);
      expect(set.has(-Infinity)).assertEqual(true);
      expect(set.has(0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest2600
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_2600
     * @tc.desc    Check has() with various numeric types
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest2600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([123, 123.45, 0x7B, 0o173, 0b1111011]);

      expect(set.has(123)).assertEqual(true);
      expect(set.has(123.45)).assertEqual(true);
      expect(set.has(0x7B)).assertEqual(true);
      expect(set.has(0o173)).assertEqual(true);
      expect(set.has(0b1111011)).assertEqual(true);
      expect(set.has(124)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest2700
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_2700
     * @tc.desc    Check has() with very large string values
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest2700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest2700';
      console.info(`${caseName}, test start`);
      const largeStr: string = 'a'.repeat(1024 * 1024);
      const set: collections.Set<string> = new collections.Set<string>([largeStr]);

      expect(set.has(largeStr)).assertEqual(true);
      expect(set.has(largeStr + 'b')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest2800
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_2800
     * @tc.desc    Check has() with boolean true and false
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest2800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean | number> = new collections.Set<boolean | number>([true, false]);

      expect(set.has(true)).assertEqual(true);
      expect(set.has(false)).assertEqual(true);
      expect(set.has(1)).assertEqual(false);
      expect(set.has(0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest2900
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_2900
     * @tc.desc    Check has() with single character strings
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest2900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);

      expect(set.has('a')).assertEqual(true);
      expect(set.has('b')).assertEqual(true);
      expect(set.has('d')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest3000
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_3000
     * @tc.desc    Check has() with multi-line strings
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest3000';
      console.info(`${caseName}, test start`);
      const str: string = 'line1\nline2\nline3';
      const set: collections.Set<string> = new collections.Set<string>([str]);

      expect(set.has(str)).assertEqual(true);
      expect(set.has('line1\nline2')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest3100
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_3100
     * @tc.desc    Check has() with negative numbers
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest3100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([-1, -2, -3]);

      expect(set.has(-1)).assertEqual(true);
      expect(set.has(-2)).assertEqual(true);
      expect(set.has(1)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest3200
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_3200
     * @tc.desc    Check has() with floating point numbers
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest3200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1.5, 2.5, 3.5]);

      expect(set.has(1.5)).assertEqual(true);
      expect(set.has(2.5)).assertEqual(true);
      expect(set.has(3.0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest3300
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_3300
     * @tc.desc    Check has() after multiple add operations
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest3300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('a');
      set.add('b');
      set.add('c');

      expect(set.has('a')).assertEqual(true);
      expect(set.has('b')).assertEqual(true);
      expect(set.has('c')).assertEqual(true);
      expect(set.has('d')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest3400
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_3400
     * @tc.desc    Check has() after add and delete operations
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest3400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      set.delete('b');
      set.add('d');

      expect(set.has('a')).assertEqual(true);
      expect(set.has('b')).assertEqual(false);
      expect(set.has('d')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest3500
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_3500
     * @tc.desc    Check has() with mixed case strings
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest3500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['Apple', 'Banana', 'Cherry']);

      expect(set.has('Apple')).assertEqual(true);
      expect(set.has('apple')).assertEqual(false);
      expect(set.has('BANANA')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest3600
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_3600
     * @tc.desc    Check has() with zero and positive numbers
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest3600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, 1, 2, 3]);

      expect(set.has(0)).assertEqual(true);
      expect(set.has(1)).assertEqual(true);
      expect(set.has(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest3700
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_3700
     * @tc.desc    Check has() with various falsy values
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetHasTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetHasTest3700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean | number | string | null | undefined> = new collections.Set<boolean | number | string | null | undefined>([false, 0, '', null, undefined, NaN]);

      expect(set.has(false)).assertEqual(true);
      expect(set.has(0)).assertEqual(true);
      expect(set.has('')).assertEqual(true);
      expect(set.has(null)).assertEqual(true);
      expect(set.has(undefined)).assertEqual(true);
      expect(set.has(NaN)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest3800
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_3800
     * @tc.desc    Check has() with string vs number comparison
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest3800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number> = new collections.Set<string | number>(['123']);

      expect(set.has('123')).assertEqual(true);
      expect(set.has(123)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest3900
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_3900
     * @tc.desc    Check has() with boolean vs number comparison
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest3900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean | number> = new collections.Set<boolean | number>([true, false]);

      expect(set.has(true)).assertEqual(true);
      expect(set.has(1)).assertEqual(false);
      expect(set.has(false)).assertEqual(true);
      expect(set.has(0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest4000
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_4000
     * @tc.desc    Check has() with number vs BigInt comparison
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest4000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | bigint> = new collections.Set<number | bigint>([123, 456n]);

      expect(set.has(123)).assertEqual(true);
      expect(set.has(123n)).assertEqual(false);
      expect(set.has(456n)).assertEqual(true);
      expect(set.has(456)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest4100
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_4100
     * @tc.desc    Check has() with null vs undefined comparison
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest4100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined]);

      expect(set.has(null)).assertEqual(true);
      expect(set.has(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest4200
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_4200
     * @tc.desc    Check has() with NaN vs other falsy values
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest4200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean | number | string | null | undefined> = new collections.Set<boolean | number | string | null | undefined>([NaN, 0, '', false, null, undefined]);

      expect(set.has(NaN)).assertEqual(true);
      expect(set.has(0)).assertEqual(true);
      expect(set.has('')).assertEqual(true);
      expect(set.has(false)).assertEqual(true);
      expect(set.has(null)).assertEqual(true);
      expect(set.has(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest4300
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_4300
     * @tc.desc    Check has() with class instances
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest4300';
      console.info(`${caseName}, test start`);

      const instance1 = new MyClass(123);
      const instance2 = new MyClass(123);
      const set: collections.Set<MyClass> = new collections.Set<MyClass>([instance1]);

      expect(set.has(instance1)).assertEqual(true);
      expect(set.has(instance2)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest4400
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_4400
     * @tc.desc    Check has() performance with 10,000 elements
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest4400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest4400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const target: number = 5000;

      for (let i: number = 0; i < 10000; i++) {
        set.add(i);
      }

      expect(set.has(target)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest4500
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_4500
     * @tc.desc    Check has() with 1000 unique strings
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest4500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest4500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      const uniqueStrings: string[] = [];

      for (let i: number = 0; i < 1000; i++) {
        const str: string = `string-${i}-${Math.random()}`;
        uniqueStrings.push(str);
        set.add(str);
      }

      expect(set.has(uniqueStrings[500])).assertEqual(true);
      expect(set.has(`non-existent-${Math.random()}`)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest4600
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_4600
     * @tc.desc    Check has() after many add/delete operations
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest4600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest4600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();

      for (let i: number = 0; i < 10000; i++) {
        set.add(i);
        if (i % 2 === 0) {
          set.delete(i);
        }
      }

      expect(set.has(1)).assertEqual(true);
      expect(set.has(999)).assertEqual(true);

      expect(set.has(0)).assertEqual(false);
      expect(set.has(1000)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest4700
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_4700
     * @tc.desc    Check has() with large numbers of BigInts
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest4700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest4700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<bigint> = new collections.Set<bigint>();
      const target: bigint = 12345678901234567890n;

      for (let i: number = 0; i < 1000; i++) {
        set.add(BigInt(i) * 1000000000000000000n);
      }
      set.add(target);

      expect(set.has(target)).assertEqual(true);
      expect(set.has(target + 1n)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest4800
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_4800
     * @tc.desc    Check has() with many repeated add attempts
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest4800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest4800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      const target: string = 'repeated-value';

      for (let i: number = 0; i < 1000; i++) {
        set.add(target);
      }

      expect(set.size).assertEqual(1);
      expect(set.has(target)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest4900
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_4900
     * @tc.desc    Check has() with concurrent modifications
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest4900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest4900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | string> = new collections.Set<number | string>();
      const testValue: string = 'concurrent-test';

      for (let i: number = 0; i < 500; i++) {
        set.add(i);
      }

      set.add(testValue);

      expect(set.has(testValue)).assertEqual(true);

      for (let i: number = 0; i < 250; i++) {
        set.delete(i);
      }

      expect(set.has(testValue)).assertEqual(true);
      expect(set.has(0)).assertEqual(false);
      expect(set.has(300)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest5000
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_5000
     * @tc.desc    Check has() with various whitespace characters
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest5000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([' ', '\t', '\n', '\r', '\f', '\v', '\u00A0']);

      expect(set.has(' ')).assertEqual(true);
      expect(set.has('\t')).assertEqual(true);
      expect(set.has('\n')).assertEqual(true);
      expect(set.has('  ')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest5100
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_5100
     * @tc.desc    Check has() with control characters
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest5100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([
        '\x00',
        '\x01',
        '\x1F',
        '\x7F'
      ]);

      expect(set.has('\x00')).assertEqual(true);
      expect(set.has('\x01')).assertEqual(true);
      expect(set.has('\x7F')).assertEqual(true);
      expect(set.has('\x02')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest5200
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_5200
     * @tc.desc    Check has() with Unicode emojis
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest5200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['😊', '❤️', '👍', '🔥', '🇺🇸']);

      expect(set.has('😊')).assertEqual(true);
      expect(set.has('❤️')).assertEqual(true);
      expect(set.has('🎉')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest5300
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_5300
     * @tc.desc    Check has() with Unicode combining characters
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest5300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['é', 'e\u0301', 'café', 'cafe\u0301']);

      expect(set.has('é')).assertEqual(true);
      expect(set.has('e\u0301')).assertEqual(true);
      expect(set.has('café')).assertEqual(true);
      expect(set.has('cafe\u0301')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest5400
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_5400
     * @tc.desc    Check has() with zero-width characters
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest5400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['\u200B', '\u200C', '\u200D', '\uFEFF']);

      expect(set.has('\u200B')).assertEqual(true);
      expect(set.has('\u200C')).assertEqual(true);
      expect(set.has('\u200E')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest5500
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_5500
     * @tc.desc    Check has() with various number formats
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest5500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([123, 123.0, 123e0, 0.123e3]);
      expect(set.has(123)).assertEqual(true);
      expect(set.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest5600
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_5600
     * @tc.desc    Check has() with special number values
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetHasTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetHasTest5600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([Infinity, -Infinity, NaN, 0, -0]);

      expect(set.has(Infinity)).assertEqual(true);
      expect(set.has(-Infinity)).assertEqual(true);
      expect(set.has(NaN)).assertEqual(true);
      expect(set.has(0)).assertEqual(true);
      expect(set.has(-0)).assertEqual(true);
      expect(set.size).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest5700
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_5700
     * @tc.desc    Check has() called with no arguments
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest5700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<undefined | null | number> = new collections.Set<undefined | null | number>([undefined, null, 1]);
      expect(set.has(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetHasTest5800
     * @tc.number  SUB_BUILTINS_SET_HAS_TEST_5800
     * @tc.desc    Check has() called with too many arguments
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetHasTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetHasTest5800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);

      expect(set.has(2)).assertEqual(true);
      expect(set.has(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
  });
}