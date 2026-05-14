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
  public prop: string = 'test';
}

export default function MapValuesCollectionsTest() {
  describe('MapValuesCollectionsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_001
     * @tc.name mapValuesCollectionsTest001
     * @tc.desc Basic functionality: values() of empty Map returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapValuesCollectionsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_002
     * @tc.name mapValuesCollectionsTest002
     * @tc.desc Basic functionality: values() with single key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapValuesCollectionsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a']]);
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_003
     * @tc.name mapValuesCollectionsTest003
     * @tc.desc Order preservation: values() maintains insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapValuesCollectionsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[3, 'c'], [1, 'a'], [2, 'b']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('c');
      expect(values[1]).assertEqual('a');
      expect(values[2]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_004
     * @tc.name mapValuesCollectionsTest004
     * @tc.desc Key override: values() keeps last set value for duplicate keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapValuesCollectionsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key', 'old');
      map.set('key', 'new');
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_005
     * @tc.name mapValuesCollectionsTest005
     * @tc.desc Iterator property: values() returns object with next method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const iterator: IterableIterator<string> = map.values();
      expect(typeof iterator.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_006
     * @tc.name mapValuesCollectionsTest006
     * @tc.desc Iterator traversal: complete value sequence via next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'x'], [2, 'y']]);
      const iterator: IterableIterator<string> = map.values();
      expect(iterator.next().value).assertEqual('x');
      expect(iterator.next().value).assertEqual('y');
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_007
     * @tc.name mapValuesCollectionsTest007
     * @tc.desc Consistency: values() match values in entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[10, 'foo'], [20, 'bar']]);
      const values: string[] = Array.from(map.values());
      const entries: [number, string][] = Array.from(map.entries());
      expect(values[0]).assertEqual(entries[0][1]);
      expect(values[1]).assertEqual(entries[1][1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_008
     * @tc.name mapValuesCollectionsTest008
     * @tc.desc Consistency: values() match get() results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[5, 'test']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual(map.get(5));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_009
     * @tc.name mapValuesCollectionsTest009
     * @tc.desc String keys: values() with string as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapValuesCollectionsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['name', 'test']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_010
     * @tc.name mapValuesCollectionsTest010
     * @tc.desc Boolean keys: values() with boolean as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapValuesCollectionsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, string> = new collections.Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('yes');
      expect(values[1]).assertEqual('no');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_011
     * @tc.name mapValuesCollectionsTest011
     * @tc.desc Null key: values() with null as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<null, string> = new collections.Map<null, string>([[null, 'null value']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('null value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_012
     * @tc.name mapValuesCollectionsTest012
     * @tc.desc Undefined key: values() with undefined as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<undefined, string> = new collections.Map<undefined, string>([[undefined, 'undefined value']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('undefined value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_013
     * @tc.name mapValuesCollectionsTest013
     * @tc.type Function
     * @tc.desc Original Map unchanged after values()
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('mapValuesCollectionsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a']]);
      Array.from(map.values());
      expect(map.size).assertEqual(1);
      expect(map.get(1)).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_014
     * @tc.name mapValuesCollectionsTest014
     * @tc.desc Iterator reuse: can traverse multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a']]);
      const values1: string[] = Array.from(map.values());
      const values2: string[] = Array.from(map.values());
      expect(JSON.stringify(values1)).assertEqual(JSON.stringify(values2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_015
     * @tc.name mapValuesCollectionsTest015
     * @tc.desc New iterator: each values() call returns new iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const iter1: IterableIterator<string> = map.values();
      const iter2: IterableIterator<string> = map.values();
      expect(iter1 === iter2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_016
     * @tc.name mapValuesCollectionsTest016
     * @tc.desc for...of loop over values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'x'], [2, 'y']]);
      const result: string[] = [];
      for (const value of map.values()) {
        result.push(value);
      }
      expect(result[0]).assertEqual('x');
      expect(result[1]).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_017
     * @tc.name mapValuesCollectionsTest017
     * @tc.desc values() with NaN as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, NaN]]);
      const values: number[] = Array.from(map.values());
      expect(values[0] !== values[0]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_018
     * @tc.name mapValuesCollectionsTest018
     * @tc.desc values() with Infinity as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, Infinity]]);
      const values: number[] = Array.from(map.values());
      expect(values[0]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_019
     * @tc.name mapValuesCollectionsTest019
     * @tc.desc values() with -Infinity as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, -Infinity]]);
      const values: number[] = Array.from(map.values());
      expect(values[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_020
     * @tc.name mapValuesCollectionsTest020
     * @tc.desc values() with BigInt as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, bigint> = new collections.Map<number, bigint>([[1, 42n]]);
      const values: bigint[] = Array.from(map.values());
      expect(values[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_021
     * @tc.name mapValuesCollectionsTest021
     * @tc.desc values() with class instance as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance: TestClass = new TestClass();
      const map: collections.Map<number, TestClass> = new collections.Map<number, TestClass>([[1, instance]]);
      const values: TestClass[] = Array.from(map.values());
      expect(values[0]).assertEqual(instance);
      expect(values[0].prop).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_022
     * @tc.name mapValuesCollectionsTest022
     * @tc.desc values() after clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      map.clear();
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_023
     * @tc.name mapValuesCollectionsTest023
     * @tc.desc values() with numeric zero and negative zero as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 0], [2, -0]]);
      const values: number[] = Array.from(map.values());
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(0);
      expect(1 / values[0]).assertEqual(Infinity);
      expect(1 / values[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_024
     * @tc.name mapValuesCollectionsTest024
     * @tc.desc values() with empty string as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, '']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('');
      expect(values[0].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_025
     * @tc.name mapValuesCollectionsTest025
     * @tc.desc values() with large string as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let largeStr: string = '';
      for (let i: number = 0; i < 1000; i++) {
        largeStr += 'a';
      }
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, largeStr]]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual(largeStr);
      expect(values[0].length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_026
     * @tc.name mapValuesCollectionsTest026
     * @tc.desc values() with multi-line string as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const multiStr: string = 'line1\nline2';
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, multiStr]]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual(multiStr);
      expect(values[0].split('\n').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_027
     * @tc.name mapValuesCollectionsTest027
     * @tc.desc values() with undefined as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapValuesCollectionsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, undefined> = new collections.Map<number, undefined>([[1, undefined]]);
      const values: undefined[] = Array.from(map.values());
      expect(values[0]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_028
     * @tc.name mapValuesCollectionsTest028
     * @tc.desc values() with large number of entries (1000)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest028', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const count: number = 1000;
      for (let i: number = 0; i < count; i++) {
        map.set(i, `value-${i}`);
      }
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(count);
      expect(values[999]).assertEqual('value-999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_029
     * @tc.name mapValuesCollectionsTest029
     * @tc.desc values() with Map that has NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[NaN, 'value']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_030
     * @tc.name mapValuesCollectionsTest030
     * @tc.desc values() with Map that has -0 as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[-0, 'value']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_031
     * @tc.name mapValuesCollectionsTest031
     * @tc.desc values() with Map that has 0 and -0 as separate keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[0, 'zero'], [-0, 'neg-zero']]);
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('neg-zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_032
     * @tc.name mapValuesCollectionsTest032
     * @tc.desc values() with Map created from another Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      const map: collections.Map<number, string> = new collections.Map<number, string>(Array.from(original.entries()));
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_033
     * @tc.name mapValuesCollectionsTest033
     * @tc.desc values() used with Array.prototype.map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 10], [2, 20], [3, 30]]);
      const values: number[] = Array.from(map.values());
      const doubled: number[] = values.map((v: number) => v * 2);
      expect(doubled[0]).assertEqual(20);
      expect(doubled[1]).assertEqual(40);
      expect(doubled[2]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_034
     * @tc.name mapValuesCollectionsTest034
     * @tc.desc values() used with Array.prototype.filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 5], [2, 15], [3, 25], [4, 5]]);
      const values: number[] = Array.from(map.values());
      const filtered: number[] = values.filter((v: number) => v > 10);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(15);
      expect(filtered[1]).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_035
     * @tc.name mapValuesCollectionsTest035
     * @tc.desc values() used with Array.prototype.reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 1], [2, 2], [3, 3], [4, 4]]);
      const values: number[] = Array.from(map.values());
      const sum: number = values.reduce((acc: number, curr: number) => acc + curr, 0);

      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_036
     * @tc.name mapValuesCollectionsTest036
     * @tc.desc values() used with Array.prototype.find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'apple'], [2, 'banana'], [3, 'cherry']]);
      const values: string[] = Array.from(map.values());
      const found: string | undefined = values.find((v: string) => v.startsWith('b'));
      expect(found).assertEqual('banana');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_037
     * @tc.name mapValuesCollectionsTest037
     * @tc.desc values() used with Array.prototype.every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: collections.Map<number, number> = new collections.Map<number, number>([[1, 5], [2, 10], [3, 15]]);
      const map2: collections.Map<number, number> = new collections.Map<number, number>([[1, 5], [2, 20], [3, 15]]);

      const values1: number[] = Array.from(map1.values());
      const values2: number[] = Array.from(map2.values());

      const allLessThan16: boolean = values1.every((v: number) => v < 16);
      const allLessThan10: boolean = values2.every((v: number) => v < 10);

      expect(allLessThan16).assertEqual(true);
      expect(allLessThan10).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_038
     * @tc.name mapValuesCollectionsTest038
     * @tc.desc values() used with Array.prototype.some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: collections.Map<number, string> = new collections.Map<number, string>([[1, 'cat'], [2, 'dog'], [3, 'bird']]);
      const map2: collections.Map<number, string> = new collections.Map<number, string>([[1, 'cat'], [2, 'dog'], [3, 'fish']]);

      const values1: string[] = Array.from(map1.values());
      const values2: string[] = Array.from(map2.values());

      const hasBird: boolean = values1.some((v: string) => v === 'bird');
      const hasBird2: boolean = values2.some((v: string) => v === 'bird');

      expect(hasBird).assertEqual(true);
      expect(hasBird2).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_039
     * @tc.name mapValuesCollectionsTest039
     * @tc.desc values() with empty values array and array methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      const values: string[] = Array.from(map.values());

      expect(values.length).assertEqual(0);
      expect(values.every((): boolean => false)).assertEqual(true);
      expect(values.some((): boolean => true)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_040
     * @tc.name mapValuesCollectionsTest040
     * @tc.desc values() iterator with spread operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
      expect(values[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_041
     * @tc.name mapValuesCollectionsTest041
     * @tc.desc values() with Map that has been converted to array and back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: collections.Map<number, string> = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
      const entries: [number, string][] = Array.from(original.entries());
      const newMap: collections.Map<number, string> = new collections.Map<number, string>(entries);

      const values: string[] = Array.from(newMap.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_042
     * @tc.name mapValuesCollectionsTest042
     * @tc.desc values() with very large values (memory usage test)
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('mapValuesCollectionsTest042', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const count: number = 100;
      let largeValue: string = '';
      for (let i: number = 0; i < 100000; i++) {
        largeValue += 'x';
      }
      for (let i: number = 0; i < count; i++) {
        map.set(i, largeValue);
      }
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(count);
      expect(values[0].length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_043
     * @tc.name mapValuesCollectionsTest043
     * @tc.desc values() with Map and same values added and removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, 'a');
      map.delete(1);
      map.set(1, 'a');
      const values: string[] = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_044
     * @tc.name mapValuesCollectionsTest044
     * @tc.desc values() with Map and numeric keys in descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[5, 'e'], [4, 'd'], [3, 'c'], [2, 'b'], [1, 'a']]);
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('e');
      expect(values[1]).assertEqual('d');
      expect(values[2]).assertEqual('c');
      expect(values[3]).assertEqual('b');
      expect(values[4]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_045
     * @tc.name mapValuesCollectionsTest045
     * @tc.desc values() with Map and string keys with varying cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([
        ['Apple', 'red'],
        ['banana', 'yellow'],
        ['Cherry', 'red']
      ]);
      const values: string[] = Array.from(map.values());

      expect(values[0]).assertEqual('red');
      expect(values[1]).assertEqual('yellow');
      expect(values[2]).assertEqual('red');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_VALUES_COLLECTIONS_TEST_046
     * @tc.name mapValuesCollectionsTest046
     * @tc.desc values() with Map and dynamic values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapValuesCollectionsTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let dynamicValue: string = 'initial';
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, dynamicValue]]);
      dynamicValue = 'modified';
      const values: string[] = Array.from(map.values());
      expect(values[0]).assertEqual('initial');
    });

  })
}
