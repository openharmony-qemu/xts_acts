/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

type MapFunctionItem = (value: number) => number;
const FUNCTION_A: MapFunctionItem = (value: number): number => value + 1;
const FUNCTION_B: MapFunctionItem = (value: number): number => value + 2;
const FUNCTION_C: MapFunctionItem = (value: number): number => value + 3;
const FUNCTION_D: MapFunctionItem = (value: number): number => value * value;
const FUNCTION_E: MapFunctionItem = (value: number): number => Math.max(value, 0);
const FUNCTION_F: MapFunctionItem = (value: number): number => value - 100.5;
const VALID_VALUES: Array<MapFunctionItem> = [FUNCTION_A, FUNCTION_B, FUNCTION_C, FUNCTION_D, FUNCTION_E, FUNCTION_F, FUNCTION_A];

export default function mapFunctionTest() {
  describe('MapFunctionTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.name testMapFunctionTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FUNCTION_TEST_0100
     * @tc.desc Verify Map size and constructor behavior with Function dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapFunctionItem> = VALID_VALUES;
      const emptyMap: Map<MapFunctionItem, MapFunctionItem> = new Map<MapFunctionItem, MapFunctionItem>();
      expect(emptyMap.size).assertEqual(0);

      const entries: Array<[MapFunctionItem, MapFunctionItem]> = [
        [values[0], values[1]], [values[1], values[2]], [values[0], values[3]],
      ];
      const constructed: Map<MapFunctionItem, MapFunctionItem> = new Map<MapFunctionItem, MapFunctionItem>(entries);
      expect(constructed.size).assertEqual(2);
      expect(constructed.get(values[0])).assertEqual(values[3]);
      expect(constructed.get(values[1])).assertEqual(values[2]);

      const copied: Map<MapFunctionItem, MapFunctionItem> = new Map<MapFunctionItem, MapFunctionItem>(constructed);
      expect(copied.size).assertEqual(constructed.size);
      expect(copied.get(values[0])).assertEqual(values[3]);
    });

    /**
     * @tc.name testMapFunctionTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FUNCTION_TEST_0200
     * @tc.desc Verify Map set, get, has and duplicate-key replacement with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapFunctionItem> = VALID_VALUES;
      const map: Map<MapFunctionItem, MapFunctionItem> = new Map<MapFunctionItem, MapFunctionItem>();
      const setResult: Map<MapFunctionItem, MapFunctionItem> = map.set(values[0], values[1]);
      expect(setResult).assertEqual(map);
      expect(map.has(values[0])).assertTrue();
      expect(map.get(values[0])).assertEqual(values[1]);
      expect(map.has(values[1])).assertFalse();
      expect(map.get(values[1])).assertUndefined();

      map.set(values[0], values[2]);
      expect(map.size).assertEqual(1);
      expect(map.get(values[0])).assertEqual(values[2]);
    });

    /**
     * @tc.name testMapFunctionTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FUNCTION_TEST_0300
     * @tc.desc Verify Map delete, clear and size transitions with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapFunctionItem> = VALID_VALUES;
      const map: Map<MapFunctionItem, MapFunctionItem> = new Map<MapFunctionItem, MapFunctionItem>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);
      const beforeDeleteSize: number = map.size;
      expect(beforeDeleteSize).assertEqual(2);

      const deleted: boolean = map.delete(values[0]);
      expect(deleted).assertTrue();
      expect(map.has(values[0])).assertFalse();
      expect(map.size).assertEqual(beforeDeleteSize - 1);

      const missingDelete: boolean = map.delete(values[0]);
      expect(missingDelete).assertFalse();
      map.clear();
      expect(map.size).assertEqual(0);
      map.set(values[2], values[3]);
      expect(map.get(values[2])).assertEqual(values[3]);
    });

    /**
     * @tc.name testMapFunctionTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FUNCTION_TEST_0400
     * @tc.desc Verify Map entries, keys, values and forEach insertion order with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapFunctionItem> = VALID_VALUES;
      const map: Map<MapFunctionItem, MapFunctionItem> = new Map<MapFunctionItem, MapFunctionItem>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const entryItem: IteratorResult<[MapFunctionItem, MapFunctionItem]> = map.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[1]);

      const keyItem: IteratorResult<MapFunctionItem> = map.keys().next();
      expect(keyItem.value).assertEqual(values[0]);
      const valueItem: IteratorResult<MapFunctionItem> = map.values().next();
      expect(valueItem.value).assertEqual(values[1]);

      let callbackCount: number = 0;
      let lastKey: MapFunctionItem = values[0];
      let lastValue: MapFunctionItem = values[1];
      map.forEach((value: MapFunctionItem, key: MapFunctionItem, _container: Map<MapFunctionItem, MapFunctionItem>): void => {
        callbackCount++;
        lastKey = key;
        lastValue = value;
      });
      expect(callbackCount).assertEqual(2);
      expect(lastKey).assertEqual(values[1]);
      expect(lastValue).assertEqual(values[2]);
    });

    /**
     * @tc.name testMapFunctionTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FUNCTION_TEST_0500
     * @tc.desc Verify Map SameValueZero duplicate-key semantics with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapFunctionItem> = VALID_VALUES;
      const duplicateEntries: Array<[MapFunctionItem, MapFunctionItem]> = [
        [values[0], values[1]], [values[0], values[2]],
      ];
      const map: Map<MapFunctionItem, MapFunctionItem> = new Map<MapFunctionItem, MapFunctionItem>(duplicateEntries);
      expect(map.size).assertEqual(1);
      expect(map.get(values[0])).assertEqual(values[2]);
      expect(map.has(values[0])).assertTrue();

      map.set(values[1], values[3]);
      expect(map.size).assertEqual(2);
      expect(map.get(values[1])).assertEqual(values[3]);
      expect(map.delete(values[1])).assertTrue();
      expect(map.has(values[1])).assertFalse();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.name testMapFunctionTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FUNCTION_TEST_0600
     * @tc.desc Verify Map Symbol.iterator and iterator completion with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapFunctionItem> = VALID_VALUES;
      const map: Map<MapFunctionItem, MapFunctionItem> = new Map<MapFunctionItem, MapFunctionItem>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const iterator: Iterator<[MapFunctionItem, MapFunctionItem]> = map[Symbol.iterator]();
      const first: IteratorResult<[MapFunctionItem, MapFunctionItem]> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value[0]).assertEqual(values[0]);
      expect(first.value[1]).assertEqual(values[1]);

      const second: IteratorResult<[MapFunctionItem, MapFunctionItem]> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value[0]).assertEqual(values[1]);
      expect(second.value[1]).assertEqual(values[2]);

      const end: IteratorResult<[MapFunctionItem, MapFunctionItem]> = iterator.next();
      expect(end.done).assertTrue();
    });

  });
}
