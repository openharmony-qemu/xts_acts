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

export default function MapForeachCollectionsTest() {
  describe('MapForeachCollectionsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0001
     * @tc.name mapForeachCollectionsTest0001
     * @tc.desc Verify forEach executes callback for each key-value pair in insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapForeachCollectionsTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2], ['c', 3]]);
      const result: string[] = [];
      map.forEach((value: number, key: string) => {
        result.push(`${key}:${value}`);
      });
      expect(result).assertDeepEquals(['a:1', 'b:2', 'c:3']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0002
     * @tc.name mapForeachCollectionsTest0002
     * @tc.desc Verify callback receives value as first parameter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapForeachCollectionsTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'x'], [2, 'y']]);
      const values: string[] = [];
      map.forEach((value: string) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['x', 'y']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0003
     * @tc.name mapForeachCollectionsTest0003
     * @tc.desc Verify callback receives key as second parameter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapForeachCollectionsTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<boolean, number> = new collections.Map<boolean, number>([[true, 10], [false, 20]]);
      const keys: boolean[] = [];
      map.forEach((_: number, key: boolean) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0004
     * @tc.name mapForeachCollectionsTest0004
     * @tc.desc Verify callback receives map as third parameter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapForeachCollectionsTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, boolean> = new collections.Map<string, boolean>([['active', true]]);
      let targetMap: collections.Map<string, boolean> | null = null;
      map.forEach((_: boolean, __: string, currentMap: collections.Map<string, boolean>) => {
        targetMap = currentMap;
      });
      expect(targetMap).assertEqual(map);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0005
     * @tc.name mapForeachCollectionsTest0005
     * @tc.desc Verify forEach does not execute callback for deleted keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['a', 'foo'], ['b', 'bar']]);
      map.delete('a');
      const count: number[] = [];
      map.forEach(() => {
        count.push(1);
      });
      expect(count.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0006
     * @tc.name mapForeachCollectionsTest0006
     * @tc.desc Verify forEach executes callback for keys with undefined value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, undefined> = new collections.Map<number, undefined>([[1, undefined], [2, undefined]]);
      let count: number = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0007
     * @tc.name mapForeachCollectionsTest0007
     * @tc.desc Verify callback handles null values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapForeachCollectionsTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, null> = new collections.Map<string, null>([['a', null], ['b', null]]);
      const values: null[] = [];
      map.forEach((value: null) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([null, null]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0008
     * @tc.name mapForeachCollectionsTest0008
     * @tc.desc Verify forEach with bigint values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, bigint> = new collections.Map<string, bigint>([['a', 10n], ['b', 20n]]);
      let sum: bigint = 0n;
      map.forEach((value: bigint) => {
        sum += value;
      });
      expect(sum).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0009
     * @tc.name mapForeachCollectionsTest0009
     * @tc.desc Verify forEach with Map containing one entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapForeachCollectionsTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['key', 'value']]);
      let count: number = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0010
     * @tc.name mapForeachCollectionsTest0010
     * @tc.desc Verify forEach with Map containing ten entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapForeachCollectionsTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0011
     * @tc.name mapForeachCollectionsTest0011
     * @tc.desc Verify callback parameters order (value first, then key)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 10]]);
      let params: [number, string] | null = null;
      map.forEach((value: number, key: string) => {
        params = [value, key];
      });
      expect(JSON.stringify(params)).assertDeepEquals(JSON.stringify([10, 'a']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0012
     * @tc.name mapForeachCollectionsTest0012
     * @tc.desc Verify forEach with callback that returns value (ignored)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 1], [2, 2]]);
      const result: number[] = [];
      map.forEach((value: number) => {
        result.push(value);
      });
      expect(result).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0013
     * @tc.name mapForeachCollectionsTest0013
     * @tc.desc Verify forEach with Map containing NaN keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapForeachCollectionsTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[NaN, 'nan1'], [NaN, 'nan2']]);
      const values: string[] = [];
      map.forEach((value: string) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['nan2']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0014
     * @tc.name mapForeachCollectionsTest0014
     * @tc.desc Verify forEach with Map containing 0 and -0 keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapForeachCollectionsTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[0, 'zero'], [-0, 'negZero']]);
      const values: string[] = [];
      map.forEach((value: string) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['negZero']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0015
     * @tc.name mapForeachCollectionsTest0015
     * @tc.desc Verify forEach with callback that modifies its own closure
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapForeachCollectionsTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0016
     * @tc.name mapForeachCollectionsTest0016
     * @tc.desc Verify forEach does not iterate over prototype properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 1]]);
      let count: number = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0017
     * @tc.name mapForeachCollectionsTest0017
     * @tc.desc Verify forEach with empty callback (no operation)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mapForeachCollectionsTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0018
     * @tc.name mapForeachCollectionsTest0018
     * @tc.desc Verify forEach with Map containing undefined keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<undefined, number> = new collections.Map<undefined, number>([[undefined, 10], [undefined, 20]]);
      const values: number[] = [];
      map.forEach((value: number) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([20]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0019
     * @tc.name mapForeachCollectionsTest0019
     * @tc.desc Verify forEach with Map containing null keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<null, string> = new collections.Map<null, string>([[null, 'a'], [null, 'b']]);
      const values: string[] = [];
      map.forEach((value: string) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['b']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0020
     * @tc.name mapForeachCollectionsTest0020
     * @tc.desc Verify forEach with large Map (100 entries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0021
     * @tc.name mapForeachCollectionsTest0021
     * @tc.desc Verify callback is called with correct parameters for each entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      const params: [string, number][] = [];
      map.forEach((value: string, key: number) => {
        params.push([value, key]);
      });
      expect(JSON.stringify(params)).assertDeepEquals(JSON.stringify([['one', 1], ['two', 2], ['three', 3]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0022
     * @tc.name mapForeachCollectionsTest0022
     * @tc.desc Verify forEach with callback that uses all three parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2]]);
      const result: string[] = [];
      map.forEach((value: number, key: string, currentMap: collections.Map<string, number>) => {
        result.push(`${key}:${value}:${currentMap.size}`);
      });
      expect(result).assertDeepEquals(['a:1:2', 'b:2:2']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0023
     * @tc.name mapForeachCollectionsTest0023
     * @tc.desc Verify forEach with callback that returns undefined (no effect)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, number> = new collections.Map<number, number>([[1, 10], [2, 20]]);
      const result: number[] = [];
      map.forEach((value: number) => {
        result.push(value);
        return undefined;
      });
      expect(result).assertDeepEquals([10, 20]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0024
     * @tc.name mapForeachCollectionsTest0024
     * @tc.desc Verify forEach with callback that uses nullish coalescing on values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string | null | undefined> = new collections.Map<number, string | null | undefined>([[1, 'foo'], [2, null], [3, undefined]]);
      const results: string[] = [];
      map.forEach((value: string | null | undefined) => {
        results.push(value ?? 'default');
      });
      expect(results).assertDeepEquals(['foo', 'default', 'default']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0025
     * @tc.name mapForeachCollectionsTest0025
     * @tc.desc Verify forEach with Map containing string keys with special characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a@b', 1], ['c#d', 2], ['e$f', 3]]);
      const keys: string[] = [];
      map.forEach((_: number, key: string) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals(['a@b', 'c#d', 'e$f']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0026
     * @tc.name mapForeachCollectionsTest0026
     * @tc.desc Verify forEach with Map containing numeric keys as strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['1', 'one'], ['2', 'two'], ['3', 'three']]);
      const results: [string, string][] = [];
      map.forEach((value: string, key: string) => {
        results.push([key, value]);
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([['1', 'one'], ['2', 'two'], ['3', 'three']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0027
     * @tc.name mapForeachCollectionsTest0027
     * @tc.desc Verify forEach with Map containing boolean keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<boolean, number> = new collections.Map<boolean, number>([[true, 1], [false, 0]]);
      const results: [boolean, number][] = [];
      map.forEach((value: number, key: boolean) => {
        results.push([key, value]);
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([[true, 1], [false, 0]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0028
     * @tc.name mapForeachCollectionsTest0028
     * @tc.desc Verify forEach with Map that has duplicate entries (overwritten)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['a', 2], ['b', 3]]);
      const results: [string, number][] = [];
      map.forEach((value: number, key: string) => {
        results.push([key, value]);
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([['a', 2], ['b', 3]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0029
     * @tc.name mapForeachCollectionsTest0029
     * @tc.desc Verify forEach with Map created from another Map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const originalMap: collections.Map<number, string> = new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
      const newMap: collections.Map<number, string> = new collections.Map<number, string>(Array.from(originalMap.entries()));
      const results: string[] = [];
      newMap.forEach((value: string) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(['one', 'two']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0030
     * @tc.name mapForeachCollectionsTest0030
     * @tc.desc Verify forEach with Map filtered via entries()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0031
     * @tc.name mapForeachCollectionsTest0031
     * @tc.desc Verify forEach throws CustomError
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('mapForeachCollectionsTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0032
     * @tc.name mapForeachCollectionsTest0032
     * @tc.desc Verify forEach with Map containing undefined and null values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, undefined | null> = new collections.Map<string, undefined | null>([['a', undefined], ['b', null], ['c', undefined]]);
      const results: (undefined | null)[] = [];
      map.forEach((value: undefined | null) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([undefined, null, undefined]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0033
     * @tc.name mapForeachCollectionsTest0033
     * @tc.desc Verify forEach with Map containing empty string values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, ""], [2, ""], [3, "non-empty"]]);
      const results: string[] = [];
      map.forEach((value: string) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(["", "", "non-empty"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0034
     * @tc.name mapForeachCollectionsTest0034
     * @tc.desc Verify forEach with Map containing multi-line string values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<number, string> = new collections.Map<number, string>([[1, "line1\nline2"], [2, "single line"]]);
      const results: string[] = [];
      map.forEach((value: string) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(["line1\nline2", "single line"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0035
     * @tc.name mapForeachCollectionsTest0035
     * @tc.desc Verify forEach with Map containing Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, string> = new collections.Map<string, string>([['emoji', '😊'], ['symbol', '★'], ['letter', 'ñ']]);
      const results: string[] = [];
      map.forEach((value: string) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(['😊', '★', 'ñ']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0036
     * @tc.name mapForeachCollectionsTest0036
     * @tc.desc Verify forEach with TestClass as value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0037
     * @tc.name mapForeachCollectionsTest0037
     * @tc.desc Verify forEach with Map containing large number of entries (1000)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0037', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0038
     * @tc.name mapForeachCollectionsTest0038
     * @tc.desc Verify forEach with Map where callback uses template literals
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['width', 100], ['height', 200]]);
      const results: string[] = [];
      map.forEach((value: number, key: string) => {
        results.push(`${key}: ${value}px`);
      });
      expect(results).assertDeepEquals(['width: 100px', 'height: 200px']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_FOREACH_COLLECTIONS_TEST_0039
     * @tc.name mapForeachCollectionsTest0039
     * @tc.desc Verify forEach with Map containing Infinity and -Infinity values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mapForeachCollectionsTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
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
