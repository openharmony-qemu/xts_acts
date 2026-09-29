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

interface GeneratedTypeLiteralInterface_1 {
  type: string;
  value: number;
}

@Sendable
class ImmutableItem {
  public key: string;
  public value: string;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }
}

@Sendable
class TestModel {
  public code: string;
  public value: number;

  constructor(code: string, value: number) {
    this.code = code;
    this.value = value;
  }
}

@Sendable
class ImmutableData {
  public readonly key: string;
  public readonly value: number;

  constructor(key: string, value: number) {
    this.key = key;
    this.value = value;
  }
}

export default function CollectionsSetSizeTest() {
  describe('CollectionsSetSizeTest', () => {
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
     * @tc.name    collectionsSetSizeTest0100
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_0100
     * @tc.desc    Verify size of empty Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest0100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const size: number = set.size;

      expect(size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest0200
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_0200
     * @tc.desc    Verify size with unique string elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest0200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c', 'd']);
      const size: number = set.size;

      expect(size).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest0300
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_0300
     * @tc.desc    Verify size ignores duplicate number elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest0300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 2, 3, 3, 3]);
      const size: number = set.size;

      expect(size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest0400
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_0400
     * @tc.desc    Verify size updates after add operations
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest0400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>();

      set.add(true);
      expect(set.size).assertEqual(1);

      set.add(false);
      expect(set.size).assertEqual(2);

      set.add(true);
      expect(set.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest0500
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_0500
     * @tc.desc    Verify size updates after delete operations
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest0500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['x', 'y', 'z']);

      set.delete('y');
      expect(set.size).assertEqual(2);

      set.delete('a');
      expect(set.size).assertEqual(2);

      set.delete('x');
      expect(set.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest0600
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_0600
     * @tc.desc    Verify size after clear operation
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest0600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30]);

      set.clear();
      expect(set.size).assertEqual(0);

      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest0700
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_0700
     * @tc.desc    Verify size with NaN elements (treated as equal)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest0700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, NaN, 5, NaN]);
      expect(set.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest0800
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_0800
     * @tc.desc    Verify size with 0 and -0 elements (treated as equal)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest0800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, -0, 1, -0]);
      expect(set.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest0900
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_0900
     * @tc.desc    Verify size with BigInt elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest0900';
      console.info(`${caseName}, test start`);
      const big1: bigint = 100n;
      const big2: bigint = 200n;
      const big3: bigint = 100n;

      const set: collections.Set<bigint> = new collections.Set<bigint>([big1, big2, big3]);
      expect(set.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest1000
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_1000
     * @tc.desc    Verify size with mixed primitive types
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest1000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number | boolean | null> = new collections.Set<string | number | boolean | null>([
        'text', 42, true, null, 42, 'text', false
      ]);
      expect(set.size).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest1100
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_1100
     * @tc.desc    Verify size with large dataset (10,000+ elements)
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest1100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest1100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const targetSize: number = 15000;

      for (let i = 0; i < targetSize; i++) {
        set.add(i);
      }

      expect(set.size).assertEqual(targetSize);

      for (let i = 0; i < 5000; i++) {
        set.add(i);
      }

      expect(set.size).assertEqual(targetSize);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest1200
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_1200
     * @tc.desc    Verify size after consecutive add/delete operations
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest1200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();

      set.add('a');
      set.add('b');
      set.add('c');
      expect(set.size).assertEqual(3);

      set.delete('b');
      set.add('d');
      set.add('a');
      expect(set.size).assertEqual(3);

      set.add('e');
      set.delete('a');
      set.delete('x');
      set.add('f');
      expect(set.size).assertEqual(4);

      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest1300
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_1300
     * @tc.desc    Verify size with extremely large string values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest1300';
      console.info(`${caseName}, test start`);
      const longStr1: string = 'a'.repeat(10000);
      const longStr2: string = 'b'.repeat(10000);
      const longStr3: string = 'a'.repeat(10000);

      const set: collections.Set<string> = new collections.Set<string>([longStr1, longStr2, longStr3]);
      expect(set.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest1400
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_1400
     * @tc.desc    Verify size with mixed case-sensitive string elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest1400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['Apple', 'apple', 'APPLE', 'Banana']);
      expect(set.size).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest1500
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_1500
     * @tc.desc    Verify size after adding and deleting the same element multiple times
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest1500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();

      set.add(10);
      expect(set.size).assertEqual(1);

      set.delete(10);
      expect(set.size).assertEqual(0);

      set.add(10);
      expect(set.size).assertEqual(1);

      set.delete(10);
      expect(set.size).assertEqual(0);

      set.add(10);
      expect(set.size).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest1600
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_1600
     * @tc.desc    Verify size with maximum safe integer values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest1600';
      console.info(`${caseName}, test start`);
      const maxSafe: number = Number.MAX_SAFE_INTEGER;
      const maxSafePlus: number = Number.MAX_SAFE_INTEGER + 1;
      const set: collections.Set<number> = new collections.Set<number>([maxSafe, maxSafe, maxSafePlus, maxSafePlus]);

      expect(set.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest1700
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_1700
     * @tc.desc    Verify size with negative zero and positive zero in mixed types
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest1700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | string> = new collections.Set<number | string>([0, -0, '0', '-0', 0, -0]);
      expect(set.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest1800
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_1800
     * @tc.desc    Verify size with elements added during iteration
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest1800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      let iterationCount: number = 0;

      for (const item of set) {
        iterationCount++;
        if (item === 2) {
          set.add(4);
          set.add(5);
        }
      }

      expect(set.size).assertEqual(5);
      expect(iterationCount).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest1900
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_1900
     * @tc.desc    Verify size with elements removed during iteration
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest1900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4, 5]);
      const values: Iterator<number> = set.values();

      let result: IteratorResult<number> = values.next();
      while (!result.done) {
        const resultValue = result.value;
        if (resultValue! % 2 === 0) {
          set.delete(resultValue!);
        }
        result = values.next();
      }

      expect(set.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest2000
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_2000
     * @tc.desc    Verify size with maximum capacity elements (performance test)
     * @tc.type    Performance
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest2000', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest2000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const targetSize: number = 1000;

      const startTime: number = Date.now();
      for (let i = 0; i < targetSize; i++) {
        set.add(i);
      }
      const addTime: number = Date.now() - startTime;

      expect(set.size).assertEqual(targetSize);

      expect(addTime).assertLess(500);

      const clearStartTime: number = Date.now();
      set.clear();
      const clearTime: number = Date.now() - clearStartTime;

      expect(set.size).assertEqual(0);
      expect(clearTime).assertLess(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest2100
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_2100
     * @tc.desc    Verify size with empty and whitespace strings
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest2100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['', ' ', '  ', '\t', '\n', '']);
      expect(set.size).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest2200
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_2200
     * @tc.desc    Verify size with numbers in different formats (octal, hex, decimal)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest2200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([
        10,
        0o12,
        0xa,
        20,
        0o24
      ]);
      expect(set.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest2300
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_2300
     * @tc.desc    Verify size with multiple NaN values mixed with other numbers
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest2300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([
        NaN,
        Number('invalid'),
        10,
        20,
        NaN
      ]);
      expect(set.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest2400
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_2400
     * @tc.desc    Verify size with elements added via spread operator
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest2400';
      console.info(`${caseName}, test start`);
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [3, 4, 5];
      const set: collections.Set<number> = new collections.Set<number>([...arr1, ...arr2]);

      expect(set.size).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest2500
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_2500
     * @tc.desc    Verify size with elements added from another Set
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest2500';
      console.info(`${caseName}, test start`);
      const sourceSet: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      const targetSet: collections.Set<string> = new collections.Set<string>(['c', 'd', 'e']);

      sourceSet.forEach((item) => targetSet.add(item));

      expect(targetSet.size).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest2600
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_2600
     * @tc.desc    Verify size with elements removed using multiple delete calls in sequence
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest2600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30, 40, 50, 60]);

      [20, 40, 60].forEach((num) => set.delete(num));

      expect(set.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest2700
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_2700
     * @tc.desc    Verify size with large negative numbers
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest2700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([
        -1, -10, -100, -1000,
        -1, -100,
        -Infinity, -Infinity
      ]);
      expect(set.size).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest2800
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_2800
     * @tc.desc    Verify size with elements that are class instances with same values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest2800';
      console.info(`${caseName}, test start`);
      const item1: ImmutableItem = new ImmutableItem('key', 'value');
      const item2: ImmutableItem = new ImmutableItem('key', 'value');
      const item3: ImmutableItem = item1;

      const set: collections.Set<ImmutableItem> = new collections.Set<ImmutableItem>([item1, item2, item3]);
      expect(set.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest2900
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_2900
     * @tc.desc    Verify size with elements added in different orders
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest2900';
      console.info(`${caseName}, test start`);
      const set1: collections.Set<string> = new collections.Set<string>(['x', 'y', 'z']);
      const set2: collections.Set<string> = new collections.Set<string>(['z', 'y', 'x']);

      expect(set1.size).assertEqual(3);
      expect(set2.size).assertEqual(3);
      expect(set1.size).assertEqual(set2.size);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest3000
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_3000
     * @tc.desc    Verify size consistency across multiple operations
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest3000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest3000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const operations: Array<GeneratedTypeLiteralInterface_1> = [];

      for (let i = 0; i < 100; i++) {
        operations.push({
          type: Math.random() > 0.3 ? 'add' : 'delete',
          value: Math.floor(Math.random() * 1000)
        });
      }

      operations.forEach(op => {
        if (op.type === 'add') {
          set.add(op.value);
        } else {
          set.delete(op.value);
        }
      });

      const lastOperations: Map<number, string> = new Map<number, string>();
      operations.forEach(op => {
        lastOperations.set(op.value, op.type);
      });

      let expectedSize: number = 0;
      lastOperations.forEach((type): void => {
        if (type === 'add') {
          expectedSize++;
        }
      });

      expect(set.size).assertEqual(expectedSize);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest3100
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_3100
     * @tc.desc    Verify size with class instances
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest3100';
      console.info(`${caseName}, test start`);
      const inst1: TestModel = new TestModel('A', 10);
      const inst2: TestModel = new TestModel('B', 20);
      const inst3: TestModel = new TestModel('A', 10);

      const set: collections.Set<TestModel> = new collections.Set<TestModel>([inst1, inst2, inst3]);
      expect(set.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetSizeTest3200
     * @tc.number  SUB_COLLECTIONS_SET_SIZE_TEST_3200
     * @tc.desc    Verify size with mixed unique and duplicate complex objects
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetSizeTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetSizeTest3200';
      console.info(`${caseName}, test start`);
      const data1: ImmutableData = new ImmutableData('key1', 100);
      const data2: ImmutableData = new ImmutableData('key2', 200);
      const data3: ImmutableData = new ImmutableData('key1', 100);
      const data4: ImmutableData = data1;

      const set: collections.Set<ImmutableData> = new collections.Set<ImmutableData>([data1, data2, data3, data4]);
      expect(set.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

  });
}
