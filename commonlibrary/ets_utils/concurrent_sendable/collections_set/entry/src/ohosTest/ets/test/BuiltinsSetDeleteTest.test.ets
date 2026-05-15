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
function deleteElement(set: collections.Set<number>, element: number): boolean {
  return set.delete(element);
}

@Sendable
class SetManager {
  set: collections.Set<string>;

  constructor() {
    this.set = new collections.Set<string>(['x', 'y', 'z']);
  }

  removeItem(item: string): boolean {
    return this.set.delete(item);
  }
}

@Sendable
class MyClass {
  id: number;

  constructor(id: number) {
    this.id = id;
  }
}

export default function BuiltinsSetDeleteTest() {
  describe('BuiltinsSetDeleteTest', () => {
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
     * @tc.name    builtinsSetDeleteTest0100
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_0100
     * @tc.desc    Delete existing string value, verify return true and size decreases
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetDeleteTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetDeleteTest0100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['apple', 'banana', 'cherry']);
      const result = set.delete('banana');

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has('banana')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest0200
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_0200
     * @tc.desc    Delete non-existing string value, verify return false and size unchanged
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetDeleteTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetDeleteTest0200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['apple', 'banana']);
      const result = set.delete('orange');

      expect(result).assertEqual(false);
      expect(set.size).assertEqual(2);
      expect(set.has('orange')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest0300
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_0300
     * @tc.desc    Delete existing number value, verify return true and size decreases
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetDeleteTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetDeleteTest0300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30]);
      const result = set.delete(20);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(20)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest0400
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_0400
     * @tc.desc    Delete non-existing number value, verify return false and size unchanged
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetDeleteTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetDeleteTest0400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20]);
      const result = set.delete(30);

      expect(result).assertEqual(false);
      expect(set.size).assertEqual(2);
      expect(set.has(30)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest0500
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_0500
     * @tc.desc    Delete existing boolean value, verify return true and size decreases
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetDeleteTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetDeleteTest0500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>([true, false, true]);
      const result = set.delete(false);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(1);
      expect(set.has(false)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest0600
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_0600
     * @tc.desc    Delete the only element in Set, verify return true and size becomes 0
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetDeleteTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetDeleteTest0600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['only-element']);
      const result = set.delete('only-element');

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(0);
      expect(set.has('only-element')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest0700
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_0700
     * @tc.desc    Call delete() on empty Set, verify return false
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetDeleteTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetDeleteTest0700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      const result = set.delete('any-value');

      expect(result).assertEqual(false);
      expect(set.size).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest0800
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_0800
     * @tc.desc    Delete same value twice, verify only first returns true
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetDeleteTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetDeleteTest0800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const result1 = set.delete(2);
      const result2 = set.delete(2);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
      expect(set.size).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest0900
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_0900
     * @tc.desc    Delete null value, verify return true if exists
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetDeleteTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetDeleteTest0900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | null> = new collections.Set<number | null>([null, 1, 2]);
      const result = set.delete(null);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(null)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest1000
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_1000
     * @tc.desc    Delete undefined value, verify return true if exists
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetDeleteTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetDeleteTest1000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | undefined> = new collections.Set<string | undefined>([undefined, 'a', 'b']);
      const result = set.delete(undefined);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(undefined)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest1100
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_1100
     * @tc.desc    Delete NaN (treated as equal to itself), verify return true
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest1100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([NaN, 1, 2]);
      const result = set.delete(NaN);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(NaN)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest1200
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_1200
     * @tc.desc    Delete 0 and -0 (treated as equal), verify delete both with one call
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest1200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([0, -0, 100]);
      const result = set.delete(0);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertEqual(false);
      expect(set.has(-0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest1300
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_1300
     * @tc.desc    Delete existing BigInt value, verify return true
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest1300';
      console.info(`${caseName}, test start`);
      const bigInt1 = 123n;
      const set: collections.Set<bigint | number | string> = new collections.Set<bigint | number | string>([bigInt1, 456, 'test']);
      const result = set.delete(bigInt1);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(bigInt1)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest1400
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_1400
     * @tc.desc    Delete element and re-add same value, verify normal addition
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest1400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.delete(2);
      expect(set.size).assertEqual(2);

      set.add(2);
      expect(set.size).assertEqual(3);
      expect(set.has(2)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest1500
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_1500
     * @tc.desc    Delete element and verify iterator has no deleted element
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest1500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      set.delete('b');

      const values = Array.from(set.values());
      expect(values.length).assertEqual(2);
      expect(values.includes('b')).assertEqual(false);
      expect(values).assertDeepEquals(['a', 'c']);
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('c');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest1600
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_1600
     * @tc.desc    Multiple references to same Set, delete affects all references
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest1600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const ref1 = set;
      const ref2 = set;

      ref1.delete(2);

      expect(set.size).assertEqual(2);
      expect(ref1.size).assertEqual(2);
      expect(ref2.size).assertEqual(2);
      expect(set.has(2)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest1700
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_1700
     * @tc.desc    Delete element and verify forEach has no deleted element
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest1700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.delete(2);

      let iterationCount = 0;
      const elements: number[] = [];
      set.forEach(item => {
        iterationCount++;
        elements.push(item);
      });

      expect(iterationCount).assertEqual(2);
      expect(elements.length).assertEqual(2);
      expect(elements[0]).assertEqual(1);
      expect(elements[1]).assertEqual(3);
      expect(JSON.stringify(elements)).assertDeepEquals(JSON.stringify([1, 3]));
      expect(elements.includes(2)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest1800
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_1800
     * @tc.desc    Delete element and verify for...of loop has no deleted element
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest1800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['x', 'y', 'z']);
      set.delete('y');

      let iterationCount = 0;
      const elements: string[] = [];
      for (const item of set) {
        iterationCount++;
        elements.push(item);
      }

      expect(iterationCount).assertEqual(2);
      expect(elements.length).assertEqual(2);
      expect(elements).assertDeepEquals(['x', 'z']);
      expect(elements).assertDeepEquals(['x', 'z']);
      expect(elements[0]).assertEqual('x');
      expect(elements[1]).assertEqual('z');
      expect(elements.includes('y')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest1900
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_1900
     * @tc.desc    Delete element during for...of iteration
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest1900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c', 'd']);
      const deletedValues: string[] = [];

      for (const item of set) {
        if (item === 'b' || item === 'd') {
          set.delete(item);
          deletedValues.push(item);
        }
      }

      expect(deletedValues.length).assertEqual(2);
      expect(deletedValues).assertDeepEquals(['b', 'd']);
      expect(deletedValues.includes('b')).assertEqual(true);
      expect(deletedValues.includes('d')).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has('a')).assertEqual(true);
      expect(set.has('c')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest2000
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_2000
     * @tc.desc    Delete elements in reverse order
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest2000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30, 40]);
      const values = Array.from(set);

      for (let i = values.length - 1; i >= 0; i--) {
        set.delete(values[i]);
      }

      expect(set.size).assertEqual(0);
      expect(set.has(10)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest2100
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_2100
     * @tc.desc    Delete element and check entries() iterator
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest2100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['x', 'y', 'z']);
      set.delete('y');

      const entries = Array.from(set.entries());
      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual('x');
      expect(entries[0][1]).assertEqual('x');
      expect(entries[1][0]).assertEqual('z');
      expect(entries[1][1]).assertEqual('z');
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['x', 'x'], ['z', 'z']]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest2200
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_2200
     * @tc.desc    Delete element from Set created with Set constructor
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest2200';
      console.info(`${caseName}, test start`);
      const originalSet: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const newSet: collections.Set<number> = new collections.Set<number>(originalSet);

      const result = newSet.delete(2);

      expect(result).assertEqual(true);
      expect(newSet.size).assertEqual(2);
      expect(originalSet.size).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest2300
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_2300
     * @tc.desc    Delete element from Set created with array
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest2300';
      console.info(`${caseName}, test start`);
      const arr = ['a', 'b', 'c'];
      const set: collections.Set<string> = new collections.Set<string>(arr);

      const result = set.delete('b');

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(arr.length).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest2400
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_2400
     * @tc.desc    Delete element with same value but different type
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest2400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | string> = new collections.Set<number | string>([1, '1', 2, '2']);

      const result1 = set.delete(1);
      const result2 = set.delete('2');

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has('1')).assertEqual(true);
      expect(set.has(2)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest2500
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_2500
     * @tc.desc    Delete element from large Set (1000 elements)
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest2500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest2500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }

      const result = set.delete(500);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(999);
      expect(set.has(500)).assertEqual(false);
      expect(set.has(999)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest2600
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_2600
     * @tc.desc    Delete all elements from large Set using delete()
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest2600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest2600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>();
      const elements: string[] = [];
      for (let i = 0; i < 1000; i++) {
        const elem = `item-${i}`;
        set.add(elem);
        elements.push(elem);
      }

      elements.forEach((elem) => {set.delete(elem)});

      expect(set.size).assertEqual(0);
      expect(set.has(elements[0])).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest2700
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_2700
     * @tc.desc    Delete BigInt with same value but different instance
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest2700';
      console.info(`${caseName}, test start`);
      const bigInt1 = 123n;
      const bigInt2 = 123n;
      const set: collections.Set<bigint> = new collections.Set<bigint>([bigInt1]);

      const result = set.delete(bigInt2);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(0);
      expect(set.has(bigInt1)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest2800
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_2800
     * @tc.desc    Delete element and check with Array.from()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest2800';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['p', 'q', 'r']);
      set.delete('q');

      const arr = Array.from(set);

      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('p');
      expect(arr[1]).assertEqual('r');
      expect(arr.includes('q')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest2900
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_2900
     * @tc.desc    Delete element using a variable reference
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest2900';
      console.info(`${caseName}, test start`);
      const value = 'target';
      const set: collections.Set<string> = new collections.Set<string>(['a', value, 'b']);

      const result = set.delete(value);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(value)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest3000
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_3000
     * @tc.desc    Delete element and check with Set.prototype.keys()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest3000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30]);
      set.delete(20);

      const keys = Array.from(set.keys());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(10);
      expect(keys[1]).assertEqual(30);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest3100
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_3100
     * @tc.desc    Delete element and then clear the Set
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest3100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['x', 'y', 'z']);

      set.delete('y');
      expect(set.size).assertEqual(2);

      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has('x')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest3200
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_3200
     * @tc.desc    Delete element from Set and check with Array.includes()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest3200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([5, 10, 15]);
      set.delete(10);

      const arr = Array.from(set);

      expect(arr.includes(5)).assertEqual(true);
      expect(arr.includes(10)).assertEqual(false);
      expect(arr.includes(15)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest3300
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_3300
     * @tc.desc    Delete element and verify after setTimeout
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const caseName = 'builtinsSetDeleteTest3300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      set.delete('b');

      await new Promise<void>((resolve) => { setTimeout(() => resolve(), 10); });

      const values = Array.from(set.values());

      expect(values).assertDeepEquals(['a', 'c']);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest3400
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_3400
     * @tc.desc    Delete element using delete() in a function
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest3400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const result = deleteElement(set, 2);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(2)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest3500
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_3500
     * @tc.desc    Delete element from Set in a class method
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest3500';
      console.info(`${caseName}, test start`);
      const manager = new SetManager();
      const result = manager.removeItem('y');

      expect(result).assertEqual(true);
      expect(manager.set.size).assertEqual(2);
      expect(manager.set.has('y')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest3600
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_3600
     * @tc.desc    Delete element from Set and check with JSON serialization
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest3600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.delete(2);

      const jsonStr = JSON.stringify(Array.from(set));

      expect(jsonStr).assertEqual('[1,3]');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest3700
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_3700
     * @tc.desc    Delete element and verify after setTimeout
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const caseName = 'builtinsSetDeleteTest3700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['p', 'q', 'r']);
      set.delete('q');

      await new Promise<void>((resolve): void => { setTimeout(() => resolve(), 10); });

      expect(set.has('q')).assertEqual(false);
      expect(set.has('p')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest3800
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_3800
     * @tc.desc    Delete class instance from Set
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest3800';
      console.info(`${caseName}, test start`);

      const obj1 = new MyClass(1);
      const obj2 = new MyClass(2);
      const set: collections.Set<MyClass> = new collections.Set<MyClass>([obj1, obj2]);

      set.delete(obj1);

      expect(set.size).assertEqual(1);
      expect(set.has(obj1)).assertEqual(false);
      expect(set.has(obj2)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest3900
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_3900
     * @tc.desc    Delete element and then add a different element with same string representation
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetDeleteTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetDeleteTest3900';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number | string> = new collections.Set<number | string>([123, '123']);

      set.delete(123);
      set.add('new 123');

      expect(set.size).assertEqual(2);
      expect(set.has(123)).assertEqual(false);
      expect(set.has('123')).assertEqual(true);
      expect(set.has('new 123')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest4000
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_4000
     * @tc.desc    Delete element and check with Array.filter()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest063';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30, 40]);
      set.delete(20);

      const filtered = Array.from(set).filter((num: number) => num > 25);

      expect(filtered.length).assertEqual(2);
      expect(filtered).assertDeepEquals([30, 40]);
      expect(filtered[0]).assertEqual(30);
      expect(filtered[1]).assertEqual(40);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest4100
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_4100
     * @tc.desc    Delete element and check with Array.map()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest064';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      set.delete('b');
      const mapped = Array.from(set).map((item: string) => item.toUpperCase());
      expect(mapped.length).assertEqual(2);
      expect(mapped).assertDeepEquals(['A', 'C']);
      expect(mapped[0]).assertEqual('A');
      expect(mapped[1]).assertEqual('C');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest4200
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_4200
     * @tc.desc    Delete element from Set and check with Array.reduce()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest066';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4]);
      set.delete(3);
      const sum = Array.from(set).reduce((acc: number, curr: number) => (acc + curr), 0);
      expect(sum).assertEqual(7);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest4300
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_4300
     * @tc.desc    Delete element from Set and check with Array.every()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest067';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([2, 4, 6, 8, 9]);
      set.delete(9);

      const allEven = Array.from(set).every((num: number) => num % 2 === 0);

      expect(allEven).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest4400
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_4400
     * @tc.desc    Delete element from Set and check with Array.some()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest068';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['apple', 'banana', 'cherry', 'date']);
      set.delete('banana');

      const hasLongWord = Array.from(set).some((word: string) => word.length > 5);

      expect(hasLongWord).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest4500
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_4500
     * @tc.desc    Delete element from Set and check with Array.findIndex()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest069';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c', 'd']);
      set.delete('b');

      const arr = Array.from(set);
      const index = arr.findIndex((item: string) => item === 'c');

      expect(index).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest4600
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_4600
     * @tc.desc    Delete element from Set and check with Array.indexOf()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest070';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30, 40]);
      set.delete(20);

      const arr = Array.from(set);
      const index = arr.indexOf(30);

      expect(index).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest4700
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_4700
     * @tc.desc    Delete element and check with Array.includes() after transformation
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest075';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4]);
      set.delete(3);

      const transformed = Array.from(set).map((num: number) => num * 2);

      expect(transformed.includes(6)).assertEqual(false);
      expect(transformed.includes(4)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest4800
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_4800
     * @tc.desc    Delete element from Set and use with Promise.all
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const caseName = 'builtinsSetDeleteTest4000';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.delete(2);

      const promises = Array.from(set).map((num: number) =>
        new Promise<number>((resolve) => { setTimeout(() => resolve(num * 2), 10); })
      );

      const results = await Promise.all(promises);

      expect(results).assertDeepEquals([2, 6]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest4900
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_4900
     * @tc.desc    Delete element from Set and check with Array.sort()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest079';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([5, 2, 8, 1, 9]);
      set.delete(8);

      const sorted = Array.from(set).sort((a: number, b: number) => a - b);

      expect(sorted.length).assertEqual(4);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(5);
      expect(sorted[3]).assertEqual(9);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest5000
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_5000
     * @tc.desc    Delete element from Set and check with Array.reverse()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest080';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c', 'd']);
      set.delete('b');

      const reversed = Array.from(set).reverse();

      expect(reversed.length).assertEqual(3);
      expect(reversed[0]).assertEqual('d');
      expect(reversed[1]).assertEqual('c');
      expect(reversed[2]).assertEqual('a');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest5100
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_5100
     * @tc.desc    Delete element from Set and check with Array.slice()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest081';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30, 40, 50]);
      set.delete(30);

      const arr = Array.from(set);
      const sliced = arr.slice(1, 3);

      expect(sliced.length).assertEqual(2);
      expect(sliced[0]).assertEqual(20);
      expect(sliced[1]).assertEqual(40);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest5200
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_5200
     * @tc.desc    Delete element from Set and check with Array.join()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest083';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['Hello', 'world', 'test']);
      set.delete('test');

      const joined = Array.from(set).join(' ');

      expect(joined).assertEqual('Hello world');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest5300
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_5300
     * @tc.desc    Delete element from Set and check with Array.includes() after filter
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest088';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30, 40, 50]);
      set.delete(30);

      const filtered = Array.from(set).filter((num: number) => num > 25);

      expect(filtered.includes(30)).assertEqual(false);
      expect(filtered.includes(40)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest5400
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_5400
     * @tc.desc    Delete element from Set and check with Array.indexOf() after map
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest089';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c', 'd']);
      set.delete('b');

      const mapped = Array.from(set).map((item: string): string => item.toUpperCase());
      const index = mapped.indexOf('C');

      expect(index).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest5500
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_5500
     * @tc.desc    Delete element from Set and check with Array.lastIndexOf()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'SetDeleteTest090';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([5, 10, 15, 20]);
      set.delete(10);

      const arr = Array.from(set);
      const lastIndex = arr.lastIndexOf(10);

      expect(lastIndex).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest5600
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_5600
     * @tc.desc    Delete element from Set and check with Array.reduceRight()
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest4100';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      set.delete('b');

      const reversedString = Array.from(set).reduceRight((acc, curr) => acc + curr, '');

      expect(reversedString).assertEqual('ca');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest5700
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_5700
     * @tc.desc    Delete element from Set and check with Array.every() after transformation
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest4200';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([2, 4, 6, 7, 8]);
      set.delete(7);

      const allMultiplesOfTwo = Array.from(set)
        .map(num => num / 2)
        .every(num => Number.isInteger(num));

      expect(allMultiplesOfTwo).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest5800
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_5800
     * @tc.desc    Delete element from Set and check with Array.findIndex() after transformation
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest4300';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30, 40, 50]);
      set.delete(30);

      const index = Array.from(set)
        .map(num => num / 10)
        .findIndex(value => value === 4);

      expect(index).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest5900
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_5900
     * @tc.desc    Delete element from Set and check with Array.filter() after transformation
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest4400';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'B', 'c', 'D', 'e']);
      set.delete('B');

      const lowercaseLetters = Array.from(set)
        .map((letter) : string => letter.toLowerCase())
        .filter(letter => letter === letter.toLowerCase());

      expect(lowercaseLetters.length).assertEqual(4);
      expect(lowercaseLetters.includes('a')).assertEqual(true);
      expect(lowercaseLetters.includes('c')).assertEqual(true);
      expect(lowercaseLetters.includes('d')).assertEqual(true);
      expect(lowercaseLetters.includes('e')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest6000
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_6000
     * @tc.desc    Delete element from Set and check with Array.map() after filter
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest4500';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4, 5, 6]);
      set.delete(4);

      const transformed = Array.from(set)
        .filter(num => num % 2 === 0)
        .map(num => num * 2);

      expect(transformed.length).assertEqual(2);
      expect(transformed.includes(4)).assertEqual(true);
      expect(transformed.includes(12)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest6100
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_6100
     * @tc.desc    Delete element from Set and check with Array.reduce() after filter
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest4600';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30, 40, 50]);
      set.delete(30);

      const sum = Array.from(set)
        .filter(num => num > 25)
        .reduce((acc: number, curr: number) => acc + curr, 0);

      expect(sum).assertEqual(90);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetDeleteTest6200
     * @tc.number  SUB_BUILTINS_SET_DELETE_TEST_6200
     * @tc.desc    Delete element from Set and check with Array.sort() after filter
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL3
     */
    it('builtinsSetDeleteTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const caseName = 'builtinsSetDeleteTest4700';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['orange', 'apple', 'banana', 'grape', 'cherry']);
      set.delete('banana');

      const sorted = Array.from(set)
        .filter(fruit => fruit.length > 5)
        .sort();

      expect(sorted.length).assertEqual(2);
      expect(sorted[0]).assertEqual('cherry');
      expect(sorted[1]).assertEqual('orange');
      console.info(`${caseName}, test end`);
    });

  });
}


