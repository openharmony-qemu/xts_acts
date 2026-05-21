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
function processSet(s: collections.Set<number>): void {
  s.clear();
}

@Sendable
class BaseClass1{
  get value() {
    try {
      throw new Error('Malicious code');
    } catch (e) {
      return undefined;
    }
  }
}

export default function CollectionsSetClearTest() {
  describe('CollectionsSetClearTest', () => {
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
     * @tc.name    collectionsSetClearTest0100
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_0100
     * @tc.desc    Clear non-empty Set with string elements, verify size becomes 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetClearTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetClearTest0100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest0200
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_0200
     * @tc.desc    Clear non-empty Set with number elements, verify elements are removed
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetClearTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetClearTest0200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();
      expect(set.has(1)).assertEqual(false);
      expect(set.has(2)).assertEqual(false);
      expect(set.has(3)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest0300
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_0300
     * @tc.desc    Clear Set with boolean elements, verify size and elements
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetClearTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetClearTest0300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>([true, false, true]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(true)).assertEqual(false);
      expect(set.has(false)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest0400
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_0400
     * @tc.desc    Clear Set with null and undefined, verify removal
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetClearTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetClearTest0400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined> = new collections.Set<null | undefined>([null, undefined, null]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(null)).assertEqual(false);
      expect(set.has(undefined)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest0500
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_0500
     * @tc.desc    Clear Set with single element, verify size becomes 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetClearTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetClearTest0500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['only-element']);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has('only-element')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest0600
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_0600
     * @tc.desc    Clear Set with NaN (special equality), verify removal
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetClearTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetClearTest0600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, 1, NaN]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(NaN)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest0700
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_0700
     * @tc.desc    Clear Set with 0 and -0, verify removal
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetClearTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetClearTest0700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, -0, 100]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(0)).assertEqual(false);
      expect(set.has(-0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest0800
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_0800
     * @tc.desc    Clear Set with BigInt elements, verify removal
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetClearTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsSetClearTest0800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<bigint> = new collections.Set<bigint>([100n, 200n, 100n]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(100n)).assertEqual(false);
      expect(set.has(200n)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest0900
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_0900
     * @tc.desc    Call clear() on empty Set (no side effects)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetClearTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetClearTest0900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest1000
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_1000
     * @tc.desc    Clear Set with large number of elements (1000 elements)
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL2
     */
    it('collectionsSetClearTest1000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetClearTest1000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(1000);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(999)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest1100
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_1100
     * @tc.desc    Call clear() twice on non-empty Set (no extra effects)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetClearTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetClearTest1100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();
      const sizeAfterFirst = set.size;
      set.clear();
      const sizeAfterSecond = set.size;

      expect(sizeAfterFirst).assertEqual(0);
      expect(sizeAfterSecond).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest1200
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_1200
     * @tc.desc    Clear Set created from another Set, verify removal
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetClearTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetClearTest1200';
      console.info(`${caseName}, test start`);
      const originalSet: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const newSet: collections.Set<number> = new collections.Set<number>(originalSet);

      newSet.clear();
      expect(newSet.size).assertEqual(0);
      expect(originalSet.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest1300
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_1300
     * @tc.desc    Clear Set created from array, verify removal
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsSetClearTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'collectionsSetClearTest1300';
      console.info(`${caseName}, test start`);
      const arr: number[] = [1, 2, 3];
      const set: collections.Set<number> = new collections.Set<number>(arr);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(arr.length).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest1400
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_1400
     * @tc.desc    Add new elements after clear(), verify normal addition
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest1400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      set.clear();

      set.add(3);
      set.add(4);

      expect(set.size).assertEqual(2);
      expect(set.has(3)).assertEqual(true);
      expect(set.has(4)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest1500
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_1500
     * @tc.desc    Verify iterator has no elements after clear()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest1500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();

      const values = Array.from(set.values());
      const keys = Array.from(set.keys());

      expect(values.length).assertEqual(0);
      expect(keys.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest1600
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_1600
     * @tc.desc    Multiple references to same Set, clear() affects all references
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest1600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      const ref1 = set;
      const ref2 = set;

      ref1.clear();

      expect(set.size).assertEqual(0);
      expect(ref1.size).assertEqual(0);
      expect(ref2.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest1700
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_1700
     * @tc.desc    Clear Set with nested Set elements, verify removal
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest1700';
      console.info(`${caseName}, test start`);
      const innerSet1: collections.Set<number> = new collections.Set<number>([1, 2]);
      const innerSet2: collections.Set<number> = new collections.Set<number>([3, 4]);
      const outerSet: collections.Set<collections.Set<number>> = new collections.Set<collections.Set<number>>([innerSet1, innerSet2]);

      outerSet.clear();

      expect(outerSet.size).assertEqual(0);
      expect(outerSet.has(innerSet1)).assertEqual(false);
      expect(innerSet1.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest1800
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_1800
     * @tc.desc    Clear Set and verify forEach has no iterations
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest1800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();

      let iterationCount = 0;
      set.forEach(() => {
        iterationCount++;
      });

      expect(iterationCount).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest1900
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_1900
     * @tc.desc    Clear Set used in for...of loop (no iterations after clear)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest1900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.clear();

      let iterationCount = 0;
      for (const _ of set) {
        iterationCount++;
      }

      expect(iterationCount).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest2000
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_2000
     * @tc.desc    Comprehensive test: clear() + add() + clear() + add()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest2000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();

      set.add('a').add('b');
      expect(set.size).assertEqual(2);
      set.clear();
      expect(set.size).assertEqual(0);

      set.add('c').add('d');
      expect(set.size).assertEqual(2);
      set.clear();
      expect(set.size).assertEqual(0);
      set.add('e');
      expect(set.size).assertEqual(1);
      expect(set.has('e')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest2100
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_2100
     * @tc.desc    Clear Set during iteration
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest2100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4, 5]);
      const iterationLogs: number[] = [];

      for (const item of set) {
        iterationLogs.push(item);
        if (item === 3) {
          set.clear();
        }
      }

      expect(iterationLogs.length).assertEqual(3);
      expect(iterationLogs[0]).assertEqual(1);
      expect(iterationLogs[1]).assertEqual(2);
      expect(iterationLogs[2]).assertEqual(3);
      expect(JSON.stringify(iterationLogs)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest2200
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_2200
     * @tc.desc    Clear Set used in Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest2200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      map.set('key', set);

      set.clear();

      expect(set.size).assertEqual(0);
      expect((map.get('key') as collections.Set<number>).size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest2300
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_2300
     * @tc.desc    Clear Set used as key in Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest2300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const map: collections.Map<collections.Set<number>, string> = new collections.Map<collections.Set<number>, string>();
      map.set(set, 'value');

      set.clear();

      expect(set.size).assertEqual(0);
      expect(map.has(set)).assertEqual(true);
      expect(map.get(set)).assertEqual('value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest2400
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_2400
     * @tc.desc    Clear Set used in WeakMap
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest2400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const wm: WeakMap<object, string> = new WeakMap<object, string>();
      wm.set(set as object, 'value');

      set.clear();

      expect(set.size).assertEqual(0);
      expect(wm.has(set as object)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest2500
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_2500
     * @tc.desc    Clear Set after converting to array
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest2500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const arr: number[] = Array.from(set);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest2600
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_2600
     * @tc.desc    Clear Set used in JSON serialization
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest2600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);

      const jsonBefore = JSON.stringify(Array.from(set));

      set.clear();

      const jsonAfter = JSON.stringify(Array.from(set));

      expect(jsonBefore).assertEqual('[1,2,3]');
      expect(jsonAfter).assertEqual('[]');
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest2700
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_2700
     * @tc.desc    Clear Set used in function parameters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest2700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);

      processSet(set);
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest2800
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_2800
     * @tc.desc    Clear Set with elements that throw in getter
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest2800';
      console.info(`${caseName}, test start`);
      const maliciousObj = new BaseClass1();

      const set: collections.Set<number | BaseClass1> = new collections.Set<number | BaseClass1>([maliciousObj, 1, 2]);

      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest2900
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_2900
     * @tc.desc    Clear Set multiple times with additions in between
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest2900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest2900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      const iterations = 100;

      for (let i = 0; i < iterations; i++) {
        for (let j = 0; j < 10; j++) {
          set.add(`${i}_${j}`);
        }

        expect(set.size).assertEqual(10);

        set.clear();
        expect(set.size).assertEqual(0);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest3000
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_3000
     * @tc.desc    Clear Set with Unicode characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest3000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([
        'café', 'cafe', 'cafè',
        'à', 'á', 'â', 'ã', 'ä',
        'ñ', 'ç', 'ø'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('café')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest3100
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_3100
     * @tc.desc    Clear Set with emojis and special symbols
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest3100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([
        '😊', '😂', '😍', '👍', '❤️',
        '🇺🇸', '🇫🇷', '🇯🇵',
        '©', '®', '™', '§', '¶'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('😊')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest3200
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_3200
     * @tc.desc    Clear Set with bidirectional text characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest3200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([
        'א', 'ב', 'ג',
        'ا', 'ب', 'ت',
        'فارسی', 'عربی', 'हिन्दी'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('א')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest3300
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_3300
     * @tc.desc    Clear Set with zero-width characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest3300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([
        '\u200B',
        '\u200C',
        '\u200D',
        '\uFEFF'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('\u200B')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest3400
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_3400
     * @tc.desc    Clear Set with control characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest3400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([
        '\0',
        '\t',
        '\n',
        '\r',
        '\x1B'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('\n')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest3500
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_3500
     * @tc.desc    Clear Set with mathematical symbols
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest3500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([
        '∀', '∂', '∑', '∏', '√', '∞',
        '∫', '≈', '≠', '≤', '≥', '⊂',
        '⊃', '⊆', '⊇', '∈', '∉', '∅'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('∂')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest3600
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_3600
     * @tc.desc    Clear Set with rare Unicode planes
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest3600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([
        '𝌆',
        '𝄞',
        '𝓐',
        '𝔹',
        '😀',
        '🅰️'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('😀')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest3700
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_3700
     * @tc.desc    Clear Set with mixed direction text
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest3700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([
        'Hello א',
        'ב World',
        'مرحبا こんにちは',
        'abcdef 12345 あいうえお'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('Hello א')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    collectionsSetClearTest3800
     * @tc.number  SUB_COLLECTIONS_SET_CLEAR_TEST_3800
     * @tc.desc    Clear Set with surrogate pairs
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsSetClearTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'collectionsSetClearTest3800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>([
        'A\uD83D\uDE00B',
        '\uD834\uDD1E',
        '\uD835\uDC00',
        '\uD86D\uDE3A'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('A\uD83D\uDE00B')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

  });
}
