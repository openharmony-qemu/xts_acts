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
class TestClass {
}

export default function BuiltinsMapHasTest() {
  describe('BuiltinsMapHasTest', () => {
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
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_0100
     * @tc.name builtinsMapHasTest0100
     * @tc.desc Verify that has() returns true for an existing string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['username', 'zhangsan']]);
      const hasKey: boolean = map.has('username');
      expect(hasKey).assertEqual(true);
      expect(typeof hasKey).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_0200
     * @tc.name builtinsMapHasTest0200
     * @tc.desc Verify that has() returns false for a non-existent key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['age', 25]]);
      const hasKey: boolean = map.has('gender');
      expect(hasKey).assertEqual(false);
      expect(typeof hasKey).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_0300
     * @tc.name builtinsMapHasTest0300
     * @tc.desc Verify the matchability when NaN is used as a key (SameValueZero algorithm)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[NaN, 'not a number']]);
      const hasNaN1: boolean = map.has(NaN);
      const hasNaN2: boolean = map.has(Number('abc'));
      expect(hasNaN1).assertEqual(true);
      expect(hasNaN2).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_0400
     * @tc.name builtinsMapHasTest0400
     * @tc.desc Verify the distinction between undefined and null as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<undefined | null, string> = new collections.Map<undefined | null, string>([[undefined, 'u'], [null, 'n']]);
      const hasUndefined: boolean = map.has(undefined);
      const hasNull: boolean = map.has(null);
      expect(hasUndefined).assertEqual(true);
      expect(hasNull).assertEqual(true);
      expect(map.has(undefined) === map.has(null)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_0500
     * @tc.name builtinsMapHasTest0500
     * @tc.desc Verify that has() returns false when called on an empty Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const emptyMap: collections.Map<string, string> = new collections.Map<string, string>();
      expect(emptyMap.has('any')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_0600
     * @tc.name builtinsMapHasTest0600
     * @tc.desc Verify that has() returns false after the key is deleted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['score', 90]]);
      map.delete('score');
      const hasScore: boolean = map.has('score');
      expect(hasScore).assertEqual(false);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_0700
     * @tc.name builtinsMapHasTest0700
     * @tc.desc Verify has() returns true for existing number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[42, 'answer']]);
      expect(map.has(42)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_0800
     * @tc.name builtinsMapHasTest0800
     * @tc.desc Verify has() returns false for non-existent number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[42, 'answer']]);
      expect(map.has(100)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_0900
     * @tc.name builtinsMapHasTest0900
     * @tc.desc Verify has() with boolean true as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[true, 'flag']]);
      expect(map.has(true)).assertEqual(true);
      expect(map.has(false)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_1000
     * @tc.name builtinsMapHasTest1000
     * @tc.desc Verify has() with boolean false as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[false, 'flag']]);
      expect(map.has(false)).assertEqual(true);
      expect(map.has(true)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_1100
     * @tc.name builtinsMapHasTest1100
     * @tc.desc Verify has() with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['', 'empty']]);
      expect(map.has('')).assertEqual(true);
      expect(map.has(' ')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_1200
     * @tc.name builtinsMapHasTest1200
     * @tc.desc Verify has() with negative number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[-42, 'negative']]);
      expect(map.has(-42)).assertEqual(true);
      expect(map.has(42)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_1300
     * @tc.name builtinsMapHasTest1300
     * @tc.desc Verify has() with zero as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[0, 'zero']]);
      expect(map.has(0)).assertEqual(true);
      expect(map.has(-0)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_1400
     * @tc.name builtinsMapHasTest1400
     * @tc.desc Verify has() after adding key with set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('newKey', 'value');
      expect(map.has('newKey')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_1500
     * @tc.name builtinsMapHasTest1500
     * @tc.desc Verify has() returns false after clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['key', 'value']]);
      map.clear();
      expect(map.has('key')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_1600
     * @tc.name builtinsMapHasTest1600
     * @tc.desc Verify has() with Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[Infinity, 'infinite']]);
      expect(map.has(Infinity)).assertEqual(true);
      expect(map.has(-Infinity)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_1700
     * @tc.name builtinsMapHasTest1700
     * @tc.desc Verify has() with -Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[-Infinity, 'negative infinite']]);
      expect(map.has(-Infinity)).assertEqual(true);
      expect(map.has(Infinity)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_1800
     * @tc.name builtinsMapHasTest1800
     * @tc.desc Verify has() with number precision edge cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsMapHasTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[0.1 + 0.2, 'precision']]);
      expect(map.has(0.3)).assertEqual(false);
      expect(map.has(0.1 + 0.2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_1900
     * @tc.name builtinsMapHasTest1900
     * @tc.desc Verify has() with very large number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const largeNum: number = Number.MAX_SAFE_INTEGER;
      const map: collections.Map<number, string> = new collections.Map<number, string>([[largeNum, 'max safe integer']]);
      expect(map.has(largeNum)).assertEqual(true);
      expect(map.has(largeNum + 1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_2000
     * @tc.name builtinsMapHasTest2000
     * @tc.desc Verify has() with very small number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const smallNum: number = Number.MIN_SAFE_INTEGER;
      const map: collections.Map<number, string> = new collections.Map<number, string>([[smallNum, 'min safe integer']]);
      expect(map.has(smallNum)).assertEqual(true);
      expect(map.has(smallNum - 1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_2100
     * @tc.name builtinsMapHasTest2100
     * @tc.desc Verify has() with multi-line string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: string = 'line1\nline2';
      const map: collections.Map<string, string> = new collections.Map<string, string>([[key, 'multi-line']]);
      expect(map.has(key)).assertEqual(true);
      expect(map.has('line1line2')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_2200
     * @tc.name builtinsMapHasTest2200
     * @tc.desc Verify has() with string containing special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: string = '!@#$%^&*()_+{}:"<>?`~';
      const map: collections.Map<string, string> = new collections.Map<string, string>([[key, 'special chars']]);
      expect(map.has(key)).assertEqual(true);
      expect(map.has('!@#$%^&*()_+{}:"<>?`~ ')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_2300
     * @tc.name builtinsMapHasTest2300
     * @tc.desc Verify has() with same string key added multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'first');
      map.set('key', 'second');
      expect(map.has('key')).assertEqual(true);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_2400
     * @tc.name builtinsMapHasTest2400
     * @tc.desc Verify has() with key after reassigning variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = 'original';
      const map: collections.Map<string, string> = new collections.Map<string, string>([[key, 'value']]);
      key = 'changed';
      expect(map.has(key)).assertEqual(false);
      expect(map.has('original')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_2500
     * @tc.name builtinsMapHasTest2500
     * @tc.desc Verify has() with key after many operations
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsMapHasTest2500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map: collections.Map<string | number, string | number> = new collections.Map<string | number, string | number>();
      const specialKey: string = 'special';
      for (let i: number = 0; i < 1000; i++) {
        map.set(i, i);
      }
      map.set(specialKey, 'value');
      for (let i: number = 0; i < 500; i++) {
        map.delete(i);
      }
      expect(map.has(specialKey)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_2600
     * @tc.name builtinsMapHasTest2600
     * @tc.desc Verify has() with key that is an instance of a Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance: TestClass = new TestClass();
      const map: collections.Map<TestClass, string> = new collections.Map<TestClass, string>([[instance, 'instance as key']]);
      expect(map.has(instance)).assertEqual(true);
      expect(map.has(new TestClass())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_2700
     * @tc.name builtinsMapHasTest2700
     * @tc.desc Verify has() with key after being deleted and re-added
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['key', 'value']]);

      map.delete('key');
      expect(map.has('key')).assertEqual(false);

      map.set('key', 'new value');
      expect(map.has('key')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_2800
     * @tc.name builtinsMapHasTest2800
     * @tc.desc Verify has() with key that is a BigInt with same numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigint1: bigint = 42n;
      const bigint2: bigint = 42n;
      const map: collections.Map<bigint, string> = new collections.Map<bigint, string>([[bigint1, 'bigint as key']]);
      expect(map.has(bigint1)).assertEqual(true);
      expect(map.has(bigint2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_2900
     * @tc.name builtinsMapHasTest2900
     * @tc.desc Verify has() with key that is a string with same value but different case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('builtinsMapHasTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['Key', 'value']]);
      expect(map.has('Key')).assertEqual(true);
      expect(map.has('key')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_3000
     * @tc.name builtinsMapHasTest3000
     * @tc.desc Verify has() with key that is a string with leading/trailing whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([[' key ', 'with spaces']]);
      expect(map.has(' key ')).assertEqual(true);
      expect(map.has('key')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_3100
     * @tc.name builtinsMapHasTest3100
     * @tc.desc Verify has() with key that is a Unicode character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: string = '�?;
      const map: collections.Map<string, string> = new collections.Map<string, string>([[key, 'unicode']]);

      expect(map.has(key)).assertEqual(true);
      expect(map.has('$')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_3200
     * @tc.name builtinsMapHasTest3200
     * @tc.desc Verify has() with key that is a Unicode escape sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: string = '\u00A9';
      const map: collections.Map<string, string> = new collections.Map<string, string>([[key, 'unicode escape']]);

      expect(map.has(key)).assertEqual(true);
      expect(map.has('©')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_3300
     * @tc.name builtinsMapHasTest3300
     * @tc.desc Verify has() with key that is a surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsMapHasTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: string = '😀';
      const map: collections.Map<string, string> = new collections.Map<string, string>([[key, 'surrogate pair']]);

      expect(map.has(key)).assertEqual(true);
      expect(map.has('😃')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_3400
     * @tc.name builtinsMapHasTest3400
     * @tc.desc Verify has() performance with large number of keys
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('builtinsMapHasTest3400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map: collections.Map<string, string | number> = new collections.Map<string, string | number>();
      const testKey: string = 'test-key-99999';
      for (let i: number = 0; i < 100000; i++) {
        map.set(`test-key-${i}`, i);
      }
      const start: number = Date.now();
      const result: boolean = map.has(testKey);
      const end: number = Date.now();

      expect(result).assertEqual(true);
      expect(end - start).assertLess(10);
    });
  })
}

