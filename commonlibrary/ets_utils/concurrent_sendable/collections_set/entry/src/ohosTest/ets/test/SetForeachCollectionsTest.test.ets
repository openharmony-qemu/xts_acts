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
class Item {
  public id: number;

  constructor(id: number) {
    this.id = id;
  }

  getIdentifier(): string {
    return `item-${this.id}`;
  }
}

export default function SetForeachCollectionsTest() {
  describe('SetForeachCollectionsTest', () => {
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
     * @tc.desc Traverse non-empty Set with strings, verify callback call count and parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetForEachCollectionsTest001';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      const visited: string[] = [];

      set.forEach((value: string, key: string) => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(3);
      expect(visited.includes('a')).assertEqual(true);
      expect(visited.includes('b')).assertEqual(true);
      expect(visited.includes('c')).assertEqual(true);
      expect(visited).assertDeepEquals(['a', 'b', 'c']);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0200
     * @tc.name builtinsAsyncLockConstructorTest0200
     * @tc.desc Traverse empty Set, verify callback is not called
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetForEachCollectionsTest003';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      let callCount = 0;

      set.forEach(() => {
        callCount++;
      });

      expect(callCount).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0300
     * @tc.name builtinsAsyncLockConstructorTest0300
     * @tc.desc Traverse Set with number values, verify parameter correctness
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetForEachCollectionsTest004';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30]);
      const values: number[] = [];
      const keys: number[] = [];
      set.forEach((value, key) => {
        values.push(value);
        keys.push(key);
      });
      expect(values.length).assertEqual(3);
      expect(keys.length).assertEqual(3);
      expect(values[0]).assertEqual(keys[0]);
      expect(values[1]).assertEqual(keys[1]);
      expect(values[2]).assertEqual(keys[2]);
      expect(JSON.stringify(values)).assertDeepEquals(JSON.stringify([10, 20, 30]));
      expect(JSON.stringify(keys)).assertDeepEquals(JSON.stringify([10, 20, 30]));
      expect(values).assertDeepEquals(keys);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0400
     * @tc.name builtinsAsyncLockConstructorTest0400
     * @tc.desc Traverse Set with boolean values, verify callback parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetForEachCollectionsTest005';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>([true, false, true]);
      const visited: boolean[] = [];

      set.forEach((value) => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(visited.includes(true)).assertEqual(true);
      expect(visited.includes(false)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0500
     * @tc.name builtinsAsyncLockConstructorTest0500
     * @tc.desc Traverse Set with null and undefined, verify callback execution
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetForEachCollectionsTest006';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined, null]);
      const visited: (null | undefined)[] = [];

      set.forEach((value) => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(visited.includes(null)).assertEqual(true);
      expect(visited.includes(undefined)).assertEqual(true);
      expect(visited).assertDeepEquals([null, undefined]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0600
     * @tc.name builtinsAsyncLockConstructorTest0600
     * @tc.desc Verify callback receives the original Set as third parameter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetForEachCollectionsTest007';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1]);
      let receivedSetSize: number | null = null;

      set.forEach((_, __, currentSet) => {
        receivedSetSize = currentSet.size;
      });

      expect(receivedSetSize).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0700
     * @tc.name builtinsAsyncLockConstructorTest0700
     * @tc.desc Traverse Set with single element, verify callback is called once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetForEachCollectionsTest008';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['only-element']);
      let callCount = 0;

      set.forEach(() => {
        callCount++;
      });

      expect(callCount).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0800
     * @tc.name builtinsAsyncLockConstructorTest0800
     * @tc.desc Callback with no parameters (still executes normally)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetForEachCollectionsTest009';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      let callCount = 0;

      set.forEach(() => {
        callCount++;
      });

      expect(callCount).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0900
     * @tc.name builtinsAsyncLockConstructorTest0900
     * @tc.desc Traverse Set with duplicate values (only unique values are processed)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetForEachCollectionsTest010';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 1, 2, 2, 3]);
      const uniqueValues: number[] = [];

      set.forEach((value: number) => {
        uniqueValues.push(value);
      });

      expect(uniqueValues.length).assertEqual(3);
      expect(uniqueValues.includes(1)).assertEqual(true);
      expect(uniqueValues.includes(2)).assertEqual(true);
      expect(uniqueValues.includes(3)).assertEqual(true);
      expect(JSON.stringify(uniqueValues)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1000
     * @tc.name builtinsAsyncLockConstructorTest1000
     * @tc.desc Delete and re-add element during traversal (element is visited twice)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetForEachCollectionsTest015';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const visited: number[] = [];

      const values = Array.from(set);
      values.forEach(value => {
        visited.push(value);
        if (value === 1) {
          set.delete(1);
          set.add(1);
        }
      });

      expect(visited.length).assertEqual(2);
      expect(visited.includes(1)).assertEqual(true);
      expect(visited.includes(2)).assertEqual(true);
      expect(visited).assertDeepEquals([1, 2]);
      expect(set.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1100
     * @tc.name builtinsAsyncLockConstructorTest1100
     * @tc.desc Traverse Set with NaN (treated as equal to itself)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetForEachCollectionsTest016';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, 1, NaN]);
      const visited: number[] = [];

      set.forEach((value: number) => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(Number.isNaN(visited[0])).assertEqual(true);
      expect(visited[1]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1200
     * @tc.name builtinsAsyncLockConstructorTest1200
     * @tc.desc Traverse Set with 0 and -0 (treated as equal)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetForEachCollectionsTest017';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, -0, 100]);
      const visited: number[] = [];

      set.forEach((value: number) => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(0);
      expect(visited[1]).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1300
     * @tc.name builtinsAsyncLockConstructorTest1300
     * @tc.desc Traverse Set with BigInt values (same value is processed once)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetForEachCollectionsTest019';
      console.info(`${caseName}, test start`);
      const big1 = 123n;
      const big2 = 123n;
      const set: collections.Set<bigint> = new collections.Set<bigint>([big1, big2, 456n]);
      const visited: bigint[] = [];

      set.forEach(value => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(123n);
      expect(visited[1]).assertEqual(456n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1400
     * @tc.name builtinsAsyncLockConstructorTest1400
     * @tc.desc Callback throws error (traversal is interrupted)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetForEachCollectionsTest021';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const visited: number[] = [];
      let errorThrown = false;

      const callback = (value: number) => {
        visited.push(value);
        if (value === 2) {
          throw new Error('Traversal interrupted');
        }
      };

      try {
        set.forEach(callback);
      } catch (e) {
        errorThrown = (e as Error).message === 'Traversal interrupted';
      }

      expect(errorThrown).assertEqual(true);
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited).assertDeepEquals([1, 2]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1500
     * @tc.name builtinsAsyncLockConstructorTest1500
     * @tc.desc forEach() on Set with elements added via spread operator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetForEachCollectionsTest033';
      console.info(`${caseName}, test start`);
      const original: number[] = [1, 2, 3];
      const set: collections.Set<number> = new collections.Set<number>([...original]);
      const visited: number[] = [];

      set.forEach((value: number) => {visited.push(value)});

      expect(visited.length).assertEqual(3);
      expect(visited.includes(1)).assertEqual(true);
      expect(visited.includes(2)).assertEqual(true);
      expect(visited.includes(3)).assertEqual(true);
      expect(visited).assertDeepEquals(original);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1600
     * @tc.name builtinsAsyncLockConstructorTest1600
     * @tc.desc Callback uses all three parameters correctly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetForEachCollectionsTest034';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['test']);
      let paramsCorrect = true;

      set.forEach((value, key, currentSet) => {
        if (value !== 'test' || key !== 'test' || currentSet.size !== 1) {
          paramsCorrect = false;
        }
      });

      expect(paramsCorrect).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1700
     * @tc.name builtinsAsyncLockConstructorTest1700
     * @tc.desc forEach() with callback that returns a value (ignored)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetForEachCollectionsTest036';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const results: number[] = [];

      set.forEach((value) => {
        results.push(value * 2);
      });

      expect(results.length).assertEqual(2);
      expect(results[0]).assertEqual(2);
      expect(results[1]).assertEqual(4);
      expect(results).assertDeepEquals([2, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1800
     * @tc.name builtinsAsyncLockConstructorTest1800
     * @tc.desc Large values in Set (Number.MAX_SAFE_INTEGER)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetForEachCollectionsTest037';
      console.info(`${caseName}, test start`);
      const safeInt = Number.MAX_SAFE_INTEGER;
      const set: collections.Set<number> = new collections.Set<number>([safeInt, safeInt + 1]);
      const visited: number[] = [];

      set.forEach((value: number) => {visited.push(value)});

      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(safeInt);
      expect(visited[1]).assertEqual(safeInt + 1);
      expect(visited).assertDeepEquals([safeInt, safeInt + 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1900
     * @tc.name builtinsAsyncLockConstructorTest1900
     * @tc.desc forEach() on Set created from another Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetForEachCollectionsTest038';
      console.info(`${caseName}, test start`);
      const original: collections.Set<string> = new collections.Set<string>(['a', 'b']);
      const copy: collections.Set<string> = new collections.Set<string>(original);
      const visited: string[] = [];

      copy.forEach((value) => {visited.push(value)});

      expect(visited.length).assertEqual(2);
      expect(visited.includes('a')).assertEqual(true);
      expect(visited.includes('b')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2000
     * @tc.name builtinsAsyncLockConstructorTest2000
     * @tc.desc forEach() on Set with sparse array elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest042';
      console.info(`${caseName}, test start`);
      const sparseArr: (number | undefined)[] = [1, undefined, 3];
      const set: collections.Set<number | undefined> = new collections.Set<number | undefined>(sparseArr);
      const visited: (number | undefined)[] = [];

      set.forEach((value) => {visited.push(value)});

      expect(visited.length).assertEqual(3);
      expect(visited.includes(1)).assertEqual(true);
      expect(visited.includes(undefined)).assertEqual(true);
      expect(visited.includes(3)).assertEqual(true);
      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1, undefined, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2100
     * @tc.name builtinsAsyncLockConstructorTest2100
     * @tc.desc Very long string values in Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest047';
      console.info(`${caseName}, test start`);
      const longStr = 'a'.repeat(10000);
      const set: collections.Set<string> = new collections.Set<string>([longStr, 'short']);
      const visited: string[] = [];

      set.forEach((value) => {visited.push(value)});

      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(longStr);
      expect(visited[1]).assertEqual('short');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2200
     * @tc.name builtinsAsyncLockConstructorTest2200
     * @tc.desc Callback uses closure to modify external variable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest053';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      let sum = 0;

      set.forEach(value => {
        sum += value;
      });

      expect(sum).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2300
     * @tc.name builtinsAsyncLockConstructorTest2300
     * @tc.desc forEach() on Set with elements added in different ways
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest054';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('a');
      set.add('b');
      set.add('c');

      ['d', 'e'].forEach((item) => {set.add(item)});

      const visited: string[] = [];
      set.forEach((value) => {visited.push(value)});

      expect(visited.length).assertEqual(5);
      expect(visited.includes('a')).assertEqual(true);
      expect(visited.includes('b')).assertEqual(true);
      expect(visited.includes('c')).assertEqual(true);
      expect(visited.includes('d')).assertEqual(true);
      expect(visited.includes('e')).assertEqual(true);
      expect(visited).assertDeepEquals(['a', 'b', 'c', 'd', 'e']);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2400
     * @tc.name builtinsAsyncLockConstructorTest2400
     * @tc.desc forEach() called on a Set in a detached iframe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest062';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const visited: number[] = [];

      set.forEach((value: number) => {visited.push(value)});

      expect(visited.length).assertEqual(2);
      expect(visited.includes(1)).assertEqual(true);
      expect(visited.includes(2)).assertEqual(true);
      expect(visited).assertDeepEquals([1, 2] as number[]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2500
     * @tc.name builtinsAsyncLockConstructorTest2500
     * @tc.desc Callback that throws and catches its own error
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest063';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const visited: number[] = [];
      const errors: Error[] = [];

      const callback = (value: number) => {
        visited.push(value);
        try {
          if (value === 2) {
            throw new Error('Expected error');
          }
        } catch (e) {
          errors.push(e as Error);
        }
      };

      set.forEach(callback);

      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      expect(errors.length).assertEqual(1);
      expect(errors[0].message).assertEqual('Expected error');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2600
     * @tc.name builtinsAsyncLockConstructorTest2600
     * @tc.desc Set containing both NaN and other numeric values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest086';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, 1, NaN, 2, NaN]);
      const visited: number[] = [];

      set.forEach((value: number) => {visited.push(value)});

      expect(visited.length).assertEqual(3);
      expect(Number.isNaN(visited[0])).assertEqual(true);
      expect(visited[1]).assertEqual(1);
      expect(visited[2]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2700
     * @tc.name builtinsAsyncLockConstructorTest2700
     * @tc.desc forEach() in a strict mode function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest092';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const visited: number[] = [];

      const callback = (value: number) => {
        visited.push(value);
      };

      set.forEach(callback);

      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1, 2]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2800
     * @tc.name builtinsAsyncLockConstructorTest2800
     * @tc.desc Callback that modifies a closed-over variable in outer scope
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest093';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      let outerVar = 0;

      const createCallback = () => {
        return (value: number) => {
          outerVar += value;
        };
      };

      set.forEach(createCallback());

      expect(outerVar).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2900
     * @tc.name builtinsAsyncLockConstructorTest2900
     * @tc.desc Traverse Set with elements that are class instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest112';
      console.info(`${caseName}, test start`);
      const set: collections.Set<Item> = new collections.Set<Item>([new Item(1), new Item(2), new Item(1)]);
      const identifiers: string[] = [];

      set.forEach((item: Item) => {
        identifiers.push(item.getIdentifier());
      });

      expect(identifiers).assertDeepEquals(['item-1', 'item-2', 'item-1']);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3000
     * @tc.name builtinsAsyncLockConstructorTest3000
     * @tc.desc forEach() with callback that uses nullish coalescing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest113';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | null | string | undefined> = new collections.Set<number | null | string | undefined>([0, '', null, undefined, 42, 'hello']);
      const results: (string | number)[] = [];

      set.forEach((value) => {
        results.push(value ?? 'default');
      });

      expect(results.length).assertEqual(6);
      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual('');
      expect(results[2]).assertEqual('default');
      expect(results[3]).assertEqual('default');
      expect(results[4]).assertEqual(42);
      expect(results[5]).assertEqual('hello');
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([0, '', 'default', 'default', 42, 'hello']));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3100
     * @tc.name builtinsAsyncLockConstructorTest3100
     * @tc.desc forEach() with callback that uses String.prototype.replaceAll()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('builtinsAsyncLockConstructorTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, (): void => {
      const caseName = 'SetForEachCollectionsTest127';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a.b.c', 'x.y.z', '1.2.3']);
      const results: string[] = [];

      set.forEach(str => {
        results.push(str.replaceAll('.', '-'));
      });

      expect(results.length).assertEqual(3);
      expect(results.includes('a-b-c')).assertEqual(true);
      expect(results.includes('x-y-z')).assertEqual(true);
      expect(results.includes('1-2-3')).assertEqual(true);
      expect(results).assertDeepEquals(['a-b-c', 'x-y-z', '1-2-3']);
      console.info(`${caseName}, test end`);
    });
  });
}