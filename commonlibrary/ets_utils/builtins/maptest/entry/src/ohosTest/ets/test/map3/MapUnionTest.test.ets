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
import { getMapUnionSymbolValue } from './MapUnionTest.js';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

class MapUnionClassItem {
  id: number;
  label: string;
  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}
type MapUnionFunctionItem = (value: number) => number;
interface MapUnionObjectItem {
  id: number;
  label: string;
  name?: string;
  extra?: number;
}
type MapUnionSymbolItem = Object;
type MapUnionItem = number | string | null | undefined | boolean | bigint |
  MapUnionSymbolItem | MapUnionClassItem | Date | MapUnionFunctionItem |
  Map<string, number> | Set<number> | Array<number> | MapUnionObjectItem | RegExp;
const UNION_CLASS_VALUE: MapUnionClassItem = new MapUnionClassItem(Number.MAX_SAFE_INTEGER, '测试😀');
const UNION_SYMBOL_VALUE: MapUnionSymbolItem = getMapUnionSymbolValue();
const UNION_FUNCTION_VALUE: MapUnionFunctionItem = (value: number): number => value * value;
const UNION_OBJECT_VALUE: MapUnionObjectItem = {
  id: Number.MIN_SAFE_INTEGER,
  label: '\u200B',
  name: '测试😀',
  extra: Number.MAX_VALUE,
};
const UNION_MAP_VALUE: Map<string, number> = new Map<string, number>();
UNION_MAP_VALUE.set('\u200B', -1);
const UNION_SET_VALUE: Set<number> = new Set<number>([NaN, Infinity]);
const UNION_NESTED_VALUE: Array<number> = [NaN, Infinity];
const VALID_VALUES: Array<MapUnionItem> = [
  NaN, '\u0000', null, undefined, false, BigInt('123456789012345678901234567890'), UNION_SYMBOL_VALUE,
  UNION_CLASS_VALUE, new Date(NaN), UNION_FUNCTION_VALUE, UNION_MAP_VALUE, UNION_SET_VALUE,
  UNION_NESTED_VALUE, UNION_OBJECT_VALUE, /[\u0000-\u001F]/g,
];

export default function mapUnionTest() {
  describe('MapUnionTest', () => {
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
     * @tc.name testMapUnionTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_UNION_TEST_0100
     * @tc.desc Verify Map size and constructor behavior with Union dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapUnionItem> = VALID_VALUES;
      const emptyMap: Map<MapUnionItem, MapUnionItem> = new Map<MapUnionItem, MapUnionItem>();
      expect(emptyMap.size).assertEqual(0);

      const entries: Array<[MapUnionItem, MapUnionItem]> = [
        [values[0], values[1]], [values[1], values[2]], [values[0], values[3]],
      ];
      const constructed: Map<MapUnionItem, MapUnionItem> = new Map<MapUnionItem, MapUnionItem>(entries);
      expect(constructed.size).assertEqual(2);
      expect(constructed.get(values[0])).assertEqual(values[3]);
      expect(constructed.get(values[1])).assertEqual(values[2]);

      const copied: Map<MapUnionItem, MapUnionItem> = new Map<MapUnionItem, MapUnionItem>(constructed);
      expect(copied.size).assertEqual(constructed.size);
      expect(copied.get(values[0])).assertEqual(values[3]);
    });

    /**
     * @tc.name testMapUnionTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_UNION_TEST_0200
     * @tc.desc Verify Map set, get, has and duplicate-key replacement with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapUnionItem> = VALID_VALUES;
      const map: Map<MapUnionItem, MapUnionItem> = new Map<MapUnionItem, MapUnionItem>();
      const setResult: Map<MapUnionItem, MapUnionItem> = map.set(values[0], values[1]);
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
     * @tc.name testMapUnionTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_UNION_TEST_0300
     * @tc.desc Verify Map delete, clear and size transitions with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapUnionItem> = VALID_VALUES;
      const map: Map<MapUnionItem, MapUnionItem> = new Map<MapUnionItem, MapUnionItem>();
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
     * @tc.name testMapUnionTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_UNION_TEST_0400
     * @tc.desc Verify Map entries, keys, values and forEach insertion order with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapUnionItem> = VALID_VALUES;
      const map: Map<MapUnionItem, MapUnionItem> = new Map<MapUnionItem, MapUnionItem>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const entryItem: IteratorResult<[MapUnionItem, MapUnionItem]> = map.entries().next();
      expect(entryItem.done).assertFalse();
      expect(Number.isNaN(entryItem.value[0] as number)).assertTrue();
      expect(entryItem.value[1]).assertEqual(values[1]);

      const keyItem: IteratorResult<MapUnionItem> = map.keys().next();
      expect(Number.isNaN(keyItem.value as number)).assertTrue();
      const valueItem: IteratorResult<MapUnionItem> = map.values().next();
      expect(valueItem.value).assertEqual(values[1]);

      let callbackCount: number = 0;
      let lastKey: MapUnionItem = values[0];
      let lastValue: MapUnionItem = values[1];
      map.forEach((value: MapUnionItem, key: MapUnionItem, _container: Map<MapUnionItem, MapUnionItem>): void => {
        callbackCount++;
        lastKey = key;
        lastValue = value;
      });
      expect(callbackCount).assertEqual(2);
      expect(lastKey).assertEqual(values[1]);
      expect(lastValue).assertEqual(values[2]);
    });

    /**
     * @tc.name testMapUnionTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_UNION_TEST_0500
     * @tc.desc Verify Map SameValueZero duplicate-key semantics with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapUnionItem> = VALID_VALUES;
      const duplicateEntries: Array<[MapUnionItem, MapUnionItem]> = [
        [values[0], values[1]], [values[0], values[2]],
      ];
      const map: Map<MapUnionItem, MapUnionItem> = new Map<MapUnionItem, MapUnionItem>(duplicateEntries);
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
     * @tc.name testMapUnionTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_UNION_TEST_0600
     * @tc.desc Verify Map Symbol.iterator and iterator completion with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapUnionItem> = VALID_VALUES;
      const map: Map<MapUnionItem, MapUnionItem> = new Map<MapUnionItem, MapUnionItem>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const iterator: Iterator<[MapUnionItem, MapUnionItem]> = map[Symbol.iterator]();
      const first: IteratorResult<[MapUnionItem, MapUnionItem]> = iterator.next();
      expect(first.done).assertFalse();
      expect(Number.isNaN(first.value[0] as number)).assertTrue();
      expect(first.value[1]).assertEqual(values[1]);

      const second: IteratorResult<[MapUnionItem, MapUnionItem]> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value[0]).assertEqual(values[1]);
      expect(second.value[1]).assertEqual(values[2]);

      const end: IteratorResult<[MapUnionItem, MapUnionItem]> = iterator.next();
      expect(end.done).assertTrue();
    });

  });
}









