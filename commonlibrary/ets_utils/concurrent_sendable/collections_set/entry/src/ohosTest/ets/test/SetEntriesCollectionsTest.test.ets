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
  id: number;
  constructor(id: number) {
    this.id = id;
  }
}

export default function SetEntriesCollectionsTest() {
  describe('SetEntriesCollectionsTest', () => {
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
     * @tc.desc Iterate non-empty Set with strings, verify each entry is [value, value]
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest001';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      const iterator = set.entries();
      const entries: [string, string][] = [];

      let result = iterator.next();
      while (!result.done) {
        entries.push(result.value as [string, string]);
        result = iterator.next();
      }

      expect(entries.length).assertEqual(3);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['a', 'a'], ['b', 'b'], ['c', 'c']]));
      expect(entries[0][0]).assertEqual('a');
      expect(entries[0][1]).assertEqual('a');
      expect(entries[1][0]).assertEqual('b');
      expect(entries[1][1]).assertEqual('b');
      expect(entries[2][0]).assertEqual('c');
      expect(entries[2][1]).assertEqual('c');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0200
     * @tc.name builtinsAsyncLockConstructorTest0200
     * @tc.desc Iterate non-empty Set with numbers, verify entry format
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest002';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30]);
      const entries = Array.from(set.entries());
      expect(entries.every(entry => entry[0] === entry[1])).assertEqual(true);
      expect(entries.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(10);
      expect(entries[1][0]).assertEqual(20);
      expect(entries[2][0]).assertEqual(30);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0300
     * @tc.name builtinsAsyncLockConstructorTest0300
     * @tc.desc Iterate empty Set, verify iterator is empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest003';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      const iterator = set.entries();
      const result = iterator.next();

      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
      expect(Array.from(set.entries()).length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0400
     * @tc.name builtinsAsyncLockConstructorTest0400
     * @tc.desc Verify iteration order matches insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest004';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      set.add('third');
      set.add('first');
      set.add('second');

      const entries = Array.from(set.entries());
      const values = entries.map((entry) : [string, string] => entry);
      expect(entries.length).assertEqual(3);
      expect(JSON.stringify(values)).assertDeepEquals(JSON.stringify([['third', 'third'], ['first', 'first'], ['second', 'second']]));
      expect(entries[0][0]).assertEqual('third');
      expect(entries[1][0]).assertEqual('first');
      expect(entries[2][0]).assertEqual('second');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0500
     * @tc.name builtinsAsyncLockConstructorTest0500
     * @tc.desc Verify each call to entries() returns new iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest005';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const iterator1 = set.entries();
      const iterator2 = set.entries();

      iterator1.next();

      expect(iterator1.next().value[0]).assertEqual(2);
      expect(iterator2.next().value[0]).assertEqual(1);
      expect(iterator1 !== iterator2).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0600
     * @tc.name builtinsAsyncLockConstructorTest0600
     * @tc.desc Iterate Set with boolean values, verify entry format
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest006';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>([true, false, true]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[true, true], [false, false]]));
      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(true);
      expect(entries[1][0]).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0700
     * @tc.name builtinsAsyncLockConstructorTest0700
     * @tc.desc Iterate Set with null and undefined, verify entries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest007';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined, null]);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(2);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[null, null], [undefined, undefined]]));
      expect(entries[0][0]).assertEqual(null);
      expect(entries[1][0]).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0800
     * @tc.name builtinsAsyncLockConstructorTest0800
     * @tc.desc Use for...of loop to iterate entries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest008';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['x', ' y', 'z']);
      const entries: [string, string][] = [];

      for (const entry of set.entries()) {
        entries.push(entry);
      }

      expect(entries.length).assertEqual(3);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['x', 'x'], [' y', ' y'], ['z', 'z']]));
      expect(entries[0][0]).assertEqual('x');
      expect(entries[1][0]).assertEqual(' y');
      expect(entries[2][0]).assertEqual('z');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0900
     * @tc.name builtinsAsyncLockConstructorTest0900
     * @tc.desc Iterate Set with single element, verify entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest009';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['only-element']);
      const iterator = set.entries();
      const firstEntry = iterator.next().value as [string, string];
      const done = iterator.next().done;

      expect(firstEntry[0]).assertEqual('only-element');
      expect(firstEntry[1]).assertEqual('only-element');
      expect(JSON.stringify(firstEntry)).assertDeepEquals(JSON.stringify(['only-element', 'only-element']));
      expect(done).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1000
     * @tc.name builtinsAsyncLockConstructorTest1000
     * @tc.desc Verify entries() ignores passed parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest010';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const iterator = set.entries();
      const entries = Array.from(iterator);

      expect(entries.length).assertEqual(3);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 1], [2, 2], [3, 3]]));
      expect(entries[0][0]).assertEqual(1);
      expect(entries[1][0]).assertEqual(2);
      expect(entries[2][0]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1100
     * @tc.name builtinsAsyncLockConstructorTest1100
     * @tc.desc Iterate Set with NaN (treated as equal to itself)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetEntriesCollectionsTest011';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, 1, NaN]);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(2);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[NaN, NaN], [1, 1]]));
      expect(Number.isNaN(entries[0][0])).assertEqual(true);
      expect(Number.isNaN(entries[0][1])).assertEqual(true);
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1200
     * @tc.name builtinsAsyncLockConstructorTest1200
     * @tc.desc Iterate Set with 0 and -0 (treated as equal)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetEntriesCollectionsTest012';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, -0, 100]);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[1][0]).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1300
     * @tc.name builtinsAsyncLockConstructorTest1300
     * @tc.desc Iterate Set with BigInt values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetEntriesCollectionsTest014';
      console.info(`${caseName}, test start`);
      const big1 = 123n;
      const big2 = 123n;
      const set: collections.Set<bigint> = new collections.Set<bigint>([big1, big2, 456n]);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(123n);
      expect(entries[1][0]).assertEqual(456n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1400
     * @tc.name builtinsAsyncLockConstructorTest1400
     * @tc.desc Modify Set during iteration, verify iterator uses snapshot (no new elements)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetEntriesCollectionsTest021';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const iterator = set.entries();
      const entries: [number, number][] = [];

      entries.push(iterator.next().value as [number, number]);
      set.add(3);
      const nextResult = iterator.next();

      expect(entries.length).assertEqual(1);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 1]]));
      expect(entries[0][0]).assertEqual(1);
      expect(nextResult.value[0]).assertEqual(2);
      expect(JSON.stringify(nextResult.value)).assertDeepEquals(JSON.stringify([2, 2]));
      expect(nextResult.done).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1500
     * @tc.name builtinsAsyncLockConstructorTest1500
     * @tc.desc Delete Set element during iteration, verify iterator skips deleted element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('builtinsAsyncLockConstructorTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetEntriesCollectionsTest022';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const iterator = set.entries();
      const entries: [number, number][] = [];

      entries.push(iterator.next().value as [number, number]);
      set.delete(2);
      const nextResult = iterator.next();

      expect(entries.length).assertEqual(1);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 1]]));
      expect(entries[0][0]).assertEqual(1);
      expect(nextResult.value[0]).assertEqual(3);
      expect(JSON.stringify(nextResult.value)).assertDeepEquals(JSON.stringify([3, 3]));
      expect(nextResult.done).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1600
     * @tc.name builtinsAsyncLockConstructorTest1600
     * @tc.desc Verify iterator doesn't include elements added after iterator creation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetEntriesCollectionsTest035';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const iterator = set.entries();

      set.add(3);
      const entries = Array.from(iterator);

      expect(entries.length).assertEqual(3);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 1], [2, 2], [3, 3]]));
      expect(entries[0][0]).assertEqual(1);
      expect(entries[1][0]).assertEqual(2);
      expect(entries[2][0]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1700
     * @tc.name builtinsAsyncLockConstructorTest1700
     * @tc.desc Verify entries() works with very large numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetEntriesCollectionsTest036';
      console.info(`${caseName}, test start`);
      const largeNum = Number.MAX_SAFE_INTEGER;
      const set: collections.Set<number> = new collections.Set<number>([largeNum, largeNum + 1]);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(2);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[largeNum, largeNum], [largeNum + 1, largeNum + 1]]));
      expect(entries[0][0]).assertEqual(largeNum);
      expect(entries[1][0]).assertEqual(largeNum + 1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1800
     * @tc.name builtinsAsyncLockConstructorTest1800
     * @tc.desc Verify entries() with Set containing negative numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest037';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([-1, -2, -3]);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(3);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[-1, -1], [-2, -2], [-3, -3]]));
      expect(entries[0][0]).assertEqual(-1);
      expect(entries[1][0]).assertEqual(-2);
      expect(entries[2][0]).assertEqual(-3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1900
     * @tc.name builtinsAsyncLockConstructorTest1900
     * @tc.desc Verify entries() with Set containing float numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest038';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1.5, 2.5, 3.5]);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(3);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1.5, 1.5], [2.5, 2.5], [3.5, 3.5]]));
      expect(entries[0][0]).assertEqual(1.5);
      expect(entries[1][0]).assertEqual(2.5);
      expect(entries[2][0]).assertEqual(3.5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2000
     * @tc.name builtinsAsyncLockConstructorTest2000
     * @tc.desc Verify entries() with Set containing empty strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest039';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['', '', 'non-empty']);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(2);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['', ''], ['non-empty', 'non-empty']]));
      expect(entries[0][0]).assertEqual('');
      expect(entries[1][0]).assertEqual('non-empty');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2100
     * @tc.name builtinsAsyncLockConstructorTest2100
     * @tc.desc Verify entries() with Set containing multi-line strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest040';
      console.info(`${caseName}, test start`);
      const multiLine = 'line1\nline2';
      const set: collections.Set<string> = new collections.Set<string>([multiLine]);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(1);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[multiLine, multiLine]]));
      expect(entries[0][0]).assertEqual(multiLine);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2200
     * @tc.name builtinsAsyncLockConstructorTest2200
     * @tc.desc Verify entries() with Set containing special characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'SetEntriesCollectionsTest041';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['!', '@', '#', '$', '%']);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(5);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['!', '!'], ['@', '@'], ['#', '#'], ['$', '$'], ['%', '%']]));
      expect(entries[0][0]).assertEqual('!');
      expect(entries[1][0]).assertEqual('@');
      expect(entries[2][0]).assertEqual('#');
      expect(entries[3][0]).assertEqual('$');
      expect(entries[4][0]).assertEqual('%');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2300
     * @tc.name builtinsAsyncLockConstructorTest2300
     * @tc.desc Verify entries() with Set containing Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetEntriesCollectionsTest042';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['😀', '🌍', '📚']);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(3);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['😀', '😀'], ['🌍', '🌍'], ['📚', '📚']]));
      expect(entries[0][0]).assertEqual('😀');
      expect(entries[1][0]).assertEqual('🌍');
      expect(entries[2][0]).assertEqual('📚');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2400
     * @tc.name builtinsAsyncLockConstructorTest2400
     * @tc.desc Verify entries() with Set containing class instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetEntriesCollectionsTest045';
      console.info(`${caseName}, test start`);

      const instance1 = new MyClass(1);
      const instance2 = new MyClass(2);
      const set: collections.Set<MyClass> = new collections.Set<MyClass>([instance1, instance2]);
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0].id).assertEqual(1);
      expect(entries[1][0].id).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2500
     * @tc.name builtinsAsyncLockConstructorTest2500
     * @tc.desc Verify iterator continues correctly after partial iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetEntriesCollectionsTest051';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4, 5]);
      const iterator = set.entries();

      expect(iterator.next().value[0]).assertEqual(1);
      expect(JSON.stringify(iterator.next().value)).assertDeepEquals(JSON.stringify([2, 2]));

      const remainingEntries: [number, number][] = [];
      let result = iterator.next();
      while (!result.done) {
        remainingEntries.push(result.value as [number, number]);
        result = iterator.next();
      }

      expect(remainingEntries.length).assertEqual(3);
      expect(JSON.stringify(remainingEntries)).assertDeepEquals(JSON.stringify([[3, 3], [4, 4], [5, 5]]));
      expect(remainingEntries[0][0]).assertEqual(3);
      expect(remainingEntries[1][0]).assertEqual(4);
      expect(remainingEntries[2][0]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2600
     * @tc.name builtinsAsyncLockConstructorTest2600
     * @tc.desc Verify entries() works after clearing the Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetEntriesCollectionsTest052';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2700
     * @tc.name builtinsAsyncLockConstructorTest2700
     * @tc.desc Verify entries() on a Set that has had elements added and removed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsAsyncLockConstructorTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const caseName = 'SetEntriesCollectionsTest053';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.add(1);
      set.add(2);
      set.delete(1);
      set.add(3);
      set.add(2);
      set.delete(3);
      set.add(4);

      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(2);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[2, 2], [4, 4]]));
      expect(entries[0][0]).assertEqual(2);
      expect(entries[1][0]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

  });
}