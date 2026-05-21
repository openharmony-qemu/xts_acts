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
class TestClass {
  public id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

class CustomError extends Error {
  constructor(message?: string) {
    super(message);
    this.name = 'CustomError';
  }
}

export default function CollectionsMapForeachTest() {
  describe('CollectionsMapForeachTest', () => {
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
     * @tc.name    collectionsMapForeachTest0100
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_0100
     * @tc.desc    Verify forEach executes callback for each key-value pair in insertion order
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapForeachTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2], ['c', 3]]);
      const result: string[] = [];
      map.forEach((value: number, key: string) => {
        result.push(`${key}:${value}`);
      });
      expect(result).assertDeepEquals(['a:1', 'b:2', 'c:3']);
    });

    /**
     * @tc.name    collectionsMapForeachTest0200
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_0200
     * @tc.desc    Verify callback receives value as first parameter
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapForeachTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'x'], [2, 'y']]);
      const values: string[] = [];
      map.forEach((value: string) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['x', 'y']);
    });

    /**
     * @tc.name    collectionsMapForeachTest0300
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_0300
     * @tc.desc    Verify callback receives key as second parameter
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapForeachTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, number> = new collections.Map<boolean, number>([[true, 10], [false, 20]]);
      const keys: boolean[] = [];
      map.forEach((_: number, key: boolean) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name    collectionsMapForeachTest0400
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_0400
     * @tc.desc    Verify callback receives map as third parameter
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapForeachTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, boolean> = new collections.Map<string, boolean>([['active', true]]);
      let targetMap: collections.Map<string, boolean> | null = null;
      map.forEach((_: boolean, __: string, currentMap: collections.Map<string, boolean>) => {
        targetMap = currentMap;
      });
      expect(targetMap).assertEqual(map);
    });

    /**
     * @tc.name    collectionsMapForeachTest0500
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_0500
     * @tc.desc    Verify forEach does not execute callback for deleted keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['a', 'foo'], ['b', 'bar']]);
      map.delete('a');
      const count: number[] = [];
      map.forEach(() => {
        count.push(1);
      });
      expect(count.length).assertEqual(1);
    });

    /**
     * @tc.name    collectionsMapForeachTest0600
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_0600
     * @tc.desc    Verify forEach executes callback for keys with undefined value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, undefined> = new collections.Map<number, undefined>([[1, undefined], [2, undefined]]);
      let count: number = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapForeachTest0700
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_0700
     * @tc.desc    Verify callback handles null values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapForeachTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, null> = new collections.Map<string, null>([['a', null], ['b', null]]);
      const values: null[] = [];
      map.forEach((value: null) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([null, null]);
    });

    /**
     * @tc.name    collectionsMapForeachTest0800
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_0800
     * @tc.desc    Verify forEach with bigint values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, bigint> = new collections.Map<string, bigint>([['a', 10n], ['b', 20n]]);
      let sum: bigint = 0n;
      map.forEach((value: bigint) => {
        sum += value;
      });
      expect(sum).assertEqual(30n);
    });

    /**
     * @tc.name    collectionsMapForeachTest0900
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_0900
     * @tc.desc    Verify forEach with Map containing one entry
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapForeachTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['key', 'value']]);
      let count: number = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name    collectionsMapForeachTest1000
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_1000
     * @tc.desc    Verify forEach with Map containing ten entries
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapForeachTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 1; i <= 10; i++) {
        map.set(i, i);
      }
      let count: number = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(10);
    });

    /**
     * @tc.name    collectionsMapForeachTest1100
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_1100
     * @tc.desc    Verify callback parameters order (value first, then key)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 10]]);
      let params: [number, string] | null = null;
      map.forEach((value: number, key: string) => {
        params = [value, key];
      });
      expect(JSON.stringify(params)).assertDeepEquals(JSON.stringify([10, 'a']));
    });

    /**
     * @tc.name    collectionsMapForeachTest1200
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_1200
     * @tc.desc    Verify forEach with callback that returns value (ignored)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 1], [2, 2]]);
      const result: number[] = [];
      map.forEach((value: number) => {
        result.push(value);
      });
      expect(result).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name    collectionsMapForeachTest1300
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_1300
     * @tc.desc    Verify forEach with Map containing NaN keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsMapForeachTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[NaN, 'nan1'], [NaN, 'nan2']]);
      const values: string[] = [];
      map.forEach((value: string) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['nan2']);
    });

    /**
     * @tc.name    collectionsMapForeachTest1400
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_1400
     * @tc.desc    Verify forEach with Map containing 0 and -0 keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsMapForeachTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[0, 'zero'], [-0, 'negZero']]);
      const values: string[] = [];
      map.forEach((value: string) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['negZero']);
    });

    /**
     * @tc.name    collectionsMapForeachTest1500
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_1500
     * @tc.desc    Verify forEach with callback that modifies its own closure
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsMapForeachTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 10], [2, 20], [3, 30]]);
      let multiplier: number = 1;
      const result: number[] = [];
      map.forEach((value: number) => {
        result.push(value * multiplier);
        multiplier++;
      });
      expect(result).assertDeepEquals([10, 40, 90]);
    });

    /**
     * @tc.name    collectionsMapForeachTest1600
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_1600
     * @tc.desc    Verify forEach does not iterate over prototype properties
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 1]]);
      let count: number = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name    collectionsMapForeachTest1700
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_1700
     * @tc.desc    Verify forEach with empty callback (no operation)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsMapForeachTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 1], [2, 2]]);
      let threwError: boolean = false;

      try {
        map.forEach(() => {
        });
      } catch (e) {
        threwError = true;
      }

      expect(threwError).assertEqual(false);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapForeachTest1800
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_1800
     * @tc.desc    Verify forEach with Map containing undefined keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<undefined, number> = new collections.Map<undefined, number>([[undefined, 10], [undefined, 20]]);
      const values: number[] = [];
      map.forEach((value: number) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([20]);
    });

    /**
     * @tc.name    collectionsMapForeachTest1900
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_1900
     * @tc.desc    Verify forEach with Map containing null keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<null, string> = new collections.Map<null, string>([[null, 'a'], [null, 'b']]);
      const values: string[] = [];
      map.forEach((value: string) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['b']);
    });

    /**
     * @tc.name    collectionsMapForeachTest2000
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_2000
     * @tc.desc    Verify forEach with large Map (100 entries)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 1; i <= 100; i++) {
        map.set(i, i * 2);
      }
      let sum: number = 0;
      map.forEach((value: number) => {
        sum += value;
      });
      expect(sum).assertEqual(10100);
    });

    /**
     * @tc.name    collectionsMapForeachTest2100
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_2100
     * @tc.desc    Verify callback is called with correct parameters for each entry
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      const params: [string, number][] = [];
      map.forEach((value: string, key: number) => {
        params.push([value, key]);
      });
      expect(JSON.stringify(params)).assertDeepEquals(JSON.stringify([['one', 1], ['two', 2], ['three', 3]]));
    });

    /**
     * @tc.name    collectionsMapForeachTest2200
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_2200
     * @tc.desc    Verify forEach with callback that uses all three parameters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      const result: string[] = [];
      map.forEach((value: number, key: string, currentMap: collections.Map<string, number>) => {
        result.push(`${key}:${value}:${currentMap.size}`);
      });
      expect(result).assertDeepEquals(['a:1:2', 'b:2:2']);
    });

    /**
     * @tc.name    collectionsMapForeachTest2300
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_2300
     * @tc.desc    Verify forEach with callback that returns undefined (no effect)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 10], [2, 20]]);
      const result: number[] = [];
      map.forEach((value: number) => {
        result.push(value);
        return undefined;
      });
      expect(result).assertDeepEquals([10, 20]);
    });

    /**
     * @tc.name    collectionsMapForeachTest2400
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_2400
     * @tc.desc    Verify forEach with callback that uses nullish coalescing on values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string | null | undefined> = new collections.Map<number, string | null | undefined>([[1, 'foo'], [2, null], [3, undefined]]);
      const results: string[] = [];
      map.forEach((value: string | null | undefined) => {
        results.push(value ?? 'default');
      });
      expect(results).assertDeepEquals(['foo', 'default', 'default']);
    });

    /**
     * @tc.name    collectionsMapForeachTest2500
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_2500
     * @tc.desc    Verify forEach with Map containing string keys with special characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a@b', 1], ['c#d', 2], ['e$f', 3]]);
      const keys: string[] = [];
      map.forEach((_: number, key: string) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals(['a@b', 'c#d', 'e$f']);
    });

    /**
     * @tc.name    collectionsMapForeachTest2600
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_2600
     * @tc.desc    Verify forEach with Map containing numeric keys as strings
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['1', 'one'], ['2', 'two'], ['3', 'three']]);
      const results: [string, string][] = [];
      map.forEach((value: string, key: string) => {
        results.push([key, value]);
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([['1', 'one'], ['2', 'two'], ['3', 'three']]));
    });

    /**
     * @tc.name    collectionsMapForeachTest2700
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_2700
     * @tc.desc    Verify forEach with Map containing boolean keys
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<boolean, number> = new collections.Map<boolean, number>([[true, 1], [false, 0]]);
      const results: [boolean, number][] = [];
      map.forEach((value: number, key: boolean) => {
        results.push([key, value]);
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([[true, 1], [false, 0]]));
    });

    /**
     * @tc.name    collectionsMapForeachTest2800
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_2800
     * @tc.desc    Verify forEach with Map that has duplicate entries (overwritten)
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['a', 2], ['b', 3]]);
      const results: [string, number][] = [];
      map.forEach((value: number, key: string) => {
        results.push([key, value]);
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([['a', 2], ['b', 3]]));
    });

    /**
     * @tc.name    collectionsMapForeachTest2900
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_2900
     * @tc.desc    Verify forEach with Map created from another Map
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const originalMap: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const newMap: collections.Map<number, string> = new collections.Map<number, string>(Array.from(originalMap.entries()));
      const results: string[] = [];
      newMap.forEach((value: string) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(['one', 'two']);
    });

    /**
     * @tc.name    collectionsMapForeachTest3000
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_3000
     * @tc.desc    Verify forEach with Map filtered via entries()
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 10], [2, 20], [3, 30]]);
      const filteredEntries: [number, number][] = Array.from(map.entries()).filter((entry: [number, number]) => entry[0] % 2 === 0);
      const filteredMap: collections.Map<number, number> = new collections.Map<number, number>(filteredEntries);
      const results: number[] = [];
      filteredMap.forEach((value: number) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([20]);
    });

    /**
     * @tc.name    collectionsMapForeachTest3100
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_3100
     * @tc.desc    Verify forEach throws CustomError
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('collectionsMapForeachTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one']]);
      try {
        map.forEach(() => {
          throw new CustomError('custom');
        });
        expect().assertFail();
      } catch (err) {
        expect(err?.name).assertEqual('CustomError');
        expect(err?.message).assertEqual('custom');
      }
    });

    /**
     * @tc.name    collectionsMapForeachTest3200
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_3200
     * @tc.desc    Verify forEach with Map containing undefined and null values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, undefined | null> = new collections.Map<string, undefined | null>([['a', undefined], ['b', null], ['c', undefined]]);
      const results: (undefined | null)[] = [];
      map.forEach((value: undefined | null) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([undefined, null, undefined]);
    });

    /**
     * @tc.name    collectionsMapForeachTest3300
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_3300
     * @tc.desc    Verify forEach with Map containing empty string values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, ""], [2, ""], [3, "non-empty"]]);
      const results: string[] = [];
      map.forEach((value: string) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(["", "", "non-empty"]);
    });

    /**
     * @tc.name    collectionsMapForeachTest3400
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_3400
     * @tc.desc    Verify forEach with Map containing multi-line string values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, "line1\nline2"], [2, "single line"]]);
      const results: string[] = [];
      map.forEach((value: string) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(["line1\nline2", "single line"]);
    });

    /**
     * @tc.name    collectionsMapForeachTest3500
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_3500
     * @tc.desc    Verify forEach with Map containing Unicode characters
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['emoji', '😊'], ['symbol', '★'], ['letter', 'ñ']]);
      const results: string[] = [];
      map.forEach((value: string) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(['😊', '★', 'ñ']);
    });

    /**
     * @tc.name    collectionsMapForeachTest3600
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_3600
     * @tc.desc    Verify forEach with TestClass as value
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst1 = new TestClass(1);
      const inst2 = new TestClass(2);
      const map: collections.Map<number, TestClass> = new collections.Map<number, TestClass>([[1, inst1], [2, inst2]]);
      const results: TestClass[] = [];
      map.forEach((value: TestClass) => {
        results.push(value);
      });
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(1);
      expect(results[1].id).assertEqual(2);
    });

    /**
     * @tc.name    collectionsMapForeachTest3700
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_3700
     * @tc.desc    Verify forEach with Map containing large number of entries (1000)
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest3700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>();
      for (let i: number = 1; i <= 1000; i++) {
        map.set(i, i);
      }
      let count: number = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name    collectionsMapForeachTest3800
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_3800
     * @tc.desc    Verify forEach with Map where callback uses template literals
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['width', 100], ['height', 200]]);
      const results: string[] = [];
      map.forEach((value: number, key: string) => {
        results.push(`${key}: ${value}px`);
      });
      expect(results).assertDeepEquals(['width: 100px', 'height: 200px']);
    });

    /**
     * @tc.name    collectionsMapForeachTest3900
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_TEST_3900
     * @tc.desc    Verify forEach with Map containing Infinity and -Infinity values
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('collectionsMapForeachTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['inf', Infinity], ['ninf', -Infinity]]);
      const results: number[] = [];
      map.forEach((value: number) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([Infinity, -Infinity]);
      expect(isFinite(results[0])).assertEqual(false);
      expect(isFinite(results[1])).assertEqual(false);
    });

  })
}

