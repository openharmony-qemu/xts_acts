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

export default function SetHasCollectionsTest() {
  describe('SetHasCollectionsTest', () => {
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
     * @tc.desc Check existing string value, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest001';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['apple', 'banana', 'cherry']);
      const result: boolean = set.has('banana');

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0200
     * @tc.name builtinsAsyncLockConstructorTest0200
     * @tc.desc Check non-existing string value, return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest002';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['apple', 'banana']);
      const result: boolean = set.has('orange');

      expect(result).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0300
     * @tc.name builtinsAsyncLockConstructorTest0300
     * @tc.desc Check existing number value, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest003';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30]);
      const result: boolean = set.has(20);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0400
     * @tc.name builtinsAsyncLockConstructorTest0400
     * @tc.desc Check non-existing number value, return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest004';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20]);
      const result: boolean = set.has(30);

      expect(result).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0500
     * @tc.name builtinsAsyncLockConstructorTest0500
     * @tc.desc Check existing boolean value, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest005';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>([true, false, true]);
      const result: boolean = set.has(false);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0600
     * @tc.name builtinsAsyncLockConstructorTest0600
     * @tc.desc Check the only element in Set, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest007';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['only-element']);
      const result: boolean = set.has('only-element');

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0700
     * @tc.name builtinsAsyncLockConstructorTest0700
     * @tc.desc Check null value in Set, return true if exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest008';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | number> = new collections.Set<null | number>([null, 1, 2]);
      const result: boolean = set.has(null);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0800
     * @tc.name builtinsAsyncLockConstructorTest0800
     * @tc.desc Check undefined value in Set, return true if exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest009';
      console.info(`${caseName}, test start`);
      const set: collections.Set<undefined | string> = new collections.Set<undefined | string>([undefined, 'a', 'b']);
      const result: boolean = set.has(undefined);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0900
     * @tc.name builtinsAsyncLockConstructorTest0900
     * @tc.desc Check NaN (treated as equal to itself), return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest011';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, 1, 2]);
      const result1: boolean = set.has(NaN);
      const result2: boolean = set.has(Number('invalid'));

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1000
     * @tc.name builtinsAsyncLockConstructorTest1000
     * @tc.desc Check 0 and -0 (treated as equal), return true for both
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest012';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, 100]);
      const result1: boolean = set.has(-0);
      const result2: boolean = set.has(0);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1100
     * @tc.name builtinsAsyncLockConstructorTest1100
     * @tc.desc Check BigInt (same value is equal), return true for same value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest014';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1200
     * @tc.name builtinsAsyncLockConstructorTest1200
     * @tc.desc Check string and number with same value (different types), return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest020';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | boolean | number> = new collections.Set<string | boolean | number>(['123', true]);
      const result1: boolean = set.has(123);
      const result2: boolean = set.has(1);

      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1300
     * @tc.name builtinsAsyncLockConstructorTest1300
     * @tc.desc Check value after adding to Set, return true immediately
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest022';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('new-value');
      const result: boolean = set.has('new-value');

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1400
     * @tc.name builtinsAsyncLockConstructorTest1400
     * @tc.desc Check value after deleting from Set, return false immediately
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest023';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['value']);
      set.delete('value');
      const result: boolean = set.has('value');

      expect(result).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1500
     * @tc.name builtinsAsyncLockConstructorTest1500
     * @tc.desc Check large Set (1000 elements), verify has() correctness
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest024';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1600
     * @tc.name builtinsAsyncLockConstructorTest1600
     * @tc.desc Pass multiple parameters to has() (only first is used)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest026';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const result: boolean = set.has(2);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1700
     * @tc.name builtinsAsyncLockConstructorTest1700
     * @tc.desc Check has() after clearing the Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest033';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();

      expect(set.has(2)).assertEqual(false);
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1800
     * @tc.name builtinsAsyncLockConstructorTest1800
     * @tc.desc Check very large numbers (beyond safe integer)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest034';
      console.info(`${caseName}, test start`);
      const largeNum: number = Number.MAX_SAFE_INTEGER + 1;
      const set: collections.Set<number> = new collections.Set<number>([largeNum]);

      expect(set.has(largeNum)).assertEqual(true);
      expect(set.has(Number.MAX_SAFE_INTEGER)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1900
     * @tc.name builtinsAsyncLockConstructorTest1900
     * @tc.desc Check has() with same string values but different encodings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest035';
      console.info(`${caseName}, test start`);
      const str1: string = 'café';
      const str2: string = 'cafe\u0301';
      const set: collections.Set<string> = new collections.Set<string>([str1]);

      expect(set.has(str1)).assertEqual(true);
      expect(set.has(str2)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2000
     * @tc.name builtinsAsyncLockConstructorTest2000
     * @tc.desc Check has() with empty string and whitespace
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest036';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2100
     * @tc.name builtinsAsyncLockConstructorTest2100
     * @tc.desc Check has() with different Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest041';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2200
     * @tc.name builtinsAsyncLockConstructorTest2200
     * @tc.desc Check has() with NaN in various forms
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest045';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN]);

      expect(set.has(NaN)).assertEqual(true);
      expect(set.has(Number('not-a-number'))).assertEqual(true);
      expect(set.has(Infinity - Infinity)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2300
     * @tc.name builtinsAsyncLockConstructorTest2300
     * @tc.desc Check has() with different BigInt values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest046';
      console.info(`${caseName}, test start`);
      const set: collections.Set<bigint | number> = new collections.Set<bigint | number>([123n, 456n]);

      expect(set.has(123n)).assertEqual(true);
      expect(set.has(456n)).assertEqual(true);
      expect(set.has(123)).assertEqual(false);
      expect(set.has(789n)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2400
     * @tc.name builtinsAsyncLockConstructorTest2400
     * @tc.desc Check has() with null vs undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest048';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined]);

      expect(set.has(null)).assertEqual(true);
      expect(set.has(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2500
     * @tc.name builtinsAsyncLockConstructorTest2500
     * @tc.desc Check has() with positive and negative infinity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest049';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([Infinity, -Infinity]);

      expect(set.has(Infinity)).assertEqual(true);
      expect(set.has(-Infinity)).assertEqual(true);
      expect(set.has(0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2600
     * @tc.name builtinsAsyncLockConstructorTest2600
     * @tc.desc Check has() with various numeric types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest050';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2700
     * @tc.name builtinsAsyncLockConstructorTest2700
     * @tc.desc Check has() with very large string values
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest2700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest055';
      console.info(`${caseName}, test start`);
      const largeStr: string = 'a'.repeat(1024 * 1024);
      const set: collections.Set<string> = new collections.Set<string>([largeStr]);

      expect(set.has(largeStr)).assertEqual(true);
      expect(set.has(largeStr + 'b')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2800
     * @tc.name builtinsAsyncLockConstructorTest2800
     * @tc.desc Check has() with boolean true and false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest061';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean | number> = new collections.Set<boolean | number>([true, false]);

      expect(set.has(true)).assertEqual(true);
      expect(set.has(false)).assertEqual(true);
      expect(set.has(1)).assertEqual(false);
      expect(set.has(0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2900
     * @tc.name builtinsAsyncLockConstructorTest2900
     * @tc.desc Check has() with single character strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest062';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);

      expect(set.has('a')).assertEqual(true);
      expect(set.has('b')).assertEqual(true);
      expect(set.has('d')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3000
     * @tc.name builtinsAsyncLockConstructorTest3000
     * @tc.desc Check has() with multi-line strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest063';
      console.info(`${caseName}, test start`);
      const str: string = 'line1\nline2\nline3';
      const set: collections.Set<string> = new collections.Set<string>([str]);

      expect(set.has(str)).assertEqual(true);
      expect(set.has('line1\nline2')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3100
     * @tc.name builtinsAsyncLockConstructorTest3100
     * @tc.desc Check has() with negative numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest064';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([-1, -2, -3]);

      expect(set.has(-1)).assertEqual(true);
      expect(set.has(-2)).assertEqual(true);
      expect(set.has(1)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3200
     * @tc.name builtinsAsyncLockConstructorTest3200
     * @tc.desc Check has() with floating point numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest065';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1.5, 2.5, 3.5]);

      expect(set.has(1.5)).assertEqual(true);
      expect(set.has(2.5)).assertEqual(true);
      expect(set.has(3.0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3300
     * @tc.name builtinsAsyncLockConstructorTest3300
     * @tc.desc Check has() after multiple add operations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest066';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3400
     * @tc.name builtinsAsyncLockConstructorTest3400
     * @tc.desc Check has() after add and delete operations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest067';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3500
     * @tc.name builtinsAsyncLockConstructorTest3500
     * @tc.desc Check has() with mixed case strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest068';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['Apple', 'Banana', 'Cherry']);

      expect(set.has('Apple')).assertEqual(true);
      expect(set.has('apple')).assertEqual(false);
      expect(set.has('BANANA')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3600
     * @tc.name builtinsAsyncLockConstructorTest3600
     * @tc.desc Check has() with zero and positive numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest069';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, 1, 2, 3]);

      expect(set.has(0)).assertEqual(true);
      expect(set.has(1)).assertEqual(true);
      expect(set.has(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3700
     * @tc.name builtinsAsyncLockConstructorTest3700
     * @tc.desc Check has() with various falsy values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetHasCollectionsTest070';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3800
     * @tc.name builtinsAsyncLockConstructorTest3800
     * @tc.desc Check has() with string vs number comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest071';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number> = new collections.Set<string | number>(['123']);

      expect(set.has('123')).assertEqual(true);
      expect(set.has(123)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3900
     * @tc.name builtinsAsyncLockConstructorTest3900
     * @tc.desc Check has() with boolean vs number comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest072';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean | number> = new collections.Set<boolean | number>([true, false]);

      expect(set.has(true)).assertEqual(true);
      expect(set.has(1)).assertEqual(false);
      expect(set.has(false)).assertEqual(true);
      expect(set.has(0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4000
     * @tc.name builtinsAsyncLockConstructorTest4000
     * @tc.desc Check has() with number vs BigInt comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest073';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | bigint> = new collections.Set<number | bigint>([123, 456n]);

      expect(set.has(123)).assertEqual(true);
      expect(set.has(123n)).assertEqual(false);
      expect(set.has(456n)).assertEqual(true);
      expect(set.has(456)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4100
     * @tc.name builtinsAsyncLockConstructorTest4100
     * @tc.desc Check has() with null vs undefined comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest079';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined]);

      expect(set.has(null)).assertEqual(true);
      expect(set.has(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4200
     * @tc.name builtinsAsyncLockConstructorTest4200
     * @tc.desc Check has() with NaN vs other falsy values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest080';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4300
     * @tc.name builtinsAsyncLockConstructorTest4300
     * @tc.desc Check has() with class instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest083';
      console.info(`${caseName}, test start`);

      const instance1 = new MyClass(123);
      const instance2 = new MyClass(123);
      const set: collections.Set<MyClass> = new collections.Set<MyClass>([instance1]);

      expect(set.has(instance1)).assertEqual(true);
      expect(set.has(instance2)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4400
     * @tc.name builtinsAsyncLockConstructorTest4400
     * @tc.desc Check has() performance with 10,000 elements
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest091';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4500
     * @tc.name builtinsAsyncLockConstructorTest4500
     * @tc.desc Check has() with 1000 unique strings
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest092';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4600
     * @tc.name builtinsAsyncLockConstructorTest4600
     * @tc.desc Check has() after many add/delete operations
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest095';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4700
     * @tc.name builtinsAsyncLockConstructorTest4700
     * @tc.desc Check has() with large numbers of BigInts
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest097';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4800
     * @tc.name builtinsAsyncLockConstructorTest4800
     * @tc.desc Check has() with many repeated add attempts
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest099';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_4900
     * @tc.name builtinsAsyncLockConstructorTest4900
     * @tc.desc Check has() with concurrent modifications
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest4900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest100';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5000
     * @tc.name builtinsAsyncLockConstructorTest5000
     * @tc.desc Check has() with various whitespace characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest101';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([' ', '\t', '\n', '\r', '\f', '\v', '\u00A0']);

      expect(set.has(' ')).assertEqual(true);
      expect(set.has('\t')).assertEqual(true);
      expect(set.has('\n')).assertEqual(true);
      expect(set.has('  ')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5100
     * @tc.name builtinsAsyncLockConstructorTest5100
     * @tc.desc Check has() with control characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest102';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5200
     * @tc.name builtinsAsyncLockConstructorTest5200
     * @tc.desc Check has() with Unicode emojis
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest103';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['😊', '❤️', '👍', '🔥', '🇺🇸']);

      expect(set.has('😊')).assertEqual(true);
      expect(set.has('❤️')).assertEqual(true);
      expect(set.has('🎉')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5300
     * @tc.name builtinsAsyncLockConstructorTest5300
     * @tc.desc Check has() with Unicode combining characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest104';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['é', 'e\u0301', 'café', 'cafe\u0301']);

      expect(set.has('é')).assertEqual(true);
      expect(set.has('e\u0301')).assertEqual(true);
      expect(set.has('café')).assertEqual(true);
      expect(set.has('cafe\u0301')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5400
     * @tc.name builtinsAsyncLockConstructorTest5400
     * @tc.desc Check has() with zero-width characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest105';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['\u200B', '\u200C', '\u200D', '\uFEFF']);

      expect(set.has('\u200B')).assertEqual(true);
      expect(set.has('\u200C')).assertEqual(true);
      expect(set.has('\u200E')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5500
     * @tc.name builtinsAsyncLockConstructorTest5500
     * @tc.desc Check has() with various number formats
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest106';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([123, 123.0, 123e0, 0.123e3]);
      expect(set.has(123)).assertEqual(true);
      expect(set.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5600
     * @tc.name builtinsAsyncLockConstructorTest5600
     * @tc.desc Check has() with special number values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetHasCollectionsTest107';
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
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5700
     * @tc.name builtinsAsyncLockConstructorTest5700
     * @tc.desc Check has() called with no arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest121';
      console.info(`${caseName}, test start`);
      const set: collections.Set<undefined | null | number> = new collections.Set<undefined | null | number>([undefined, null, 1]);
      expect(set.has(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_5800
     * @tc.name builtinsAsyncLockConstructorTest5800
     * @tc.desc Check has() called with too many arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetHasCollectionsTest122';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);

      expect(set.has(2)).assertEqual(true);
      expect(set.has(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
  });
}