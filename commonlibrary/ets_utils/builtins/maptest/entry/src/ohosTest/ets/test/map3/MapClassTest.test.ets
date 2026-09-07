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

class MapClassItem {
  id: number;
  label: string;
  constructor(id: number, label: string) { this.id = id; this.label = label; }
}
const CLASS_A = new MapClassItem(1, '测试');
const CLASS_B = new MapClassItem(0, '');
const CLASS_C = new MapClassItem(-1, '测试😀');
const CLASS_D = new MapClassItem(Number.MAX_SAFE_INTEGER, 'a'.repeat(100));
const CLASS_E = new MapClassItem(13800138000, '13800138000');
const CLASS_F = new MapClassItem(99999999, '<script>alert(1)</script>');
const VALID_VALUES: Array<MapClassItem> = [CLASS_A, CLASS_B, CLASS_C, CLASS_D, CLASS_E, CLASS_F, CLASS_A];

export default function mapClassTest() {
  describe('MapClassTest', () => {
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
     * @tc.name testMapClassTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLASS_TEST_0100
     * @tc.desc Verify Map size and constructor behavior with Class dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapClassTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapClassItem> = VALID_VALUES;
      const emptyMap: Map<MapClassItem, MapClassItem> = new Map<MapClassItem, MapClassItem>();
      expect(emptyMap.size).assertEqual(0);

      const entries: Array<[MapClassItem, MapClassItem]> = [
        [values[0], values[1]], [values[1], values[2]], [values[0], values[3]],
      ];
      const constructed: Map<MapClassItem, MapClassItem> = new Map<MapClassItem, MapClassItem>(entries);
      expect(constructed.size).assertEqual(2);
      expect(constructed.get(values[0])).assertEqual(values[3]);
      expect(constructed.get(values[1])).assertEqual(values[2]);

      const copied: Map<MapClassItem, MapClassItem> = new Map<MapClassItem, MapClassItem>(constructed);
      expect(copied.size).assertEqual(constructed.size);
      expect(copied.get(values[0])).assertEqual(values[3]);
    });

    /**
     * @tc.name testMapClassTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLASS_TEST_0200
     * @tc.desc Verify Map set, get, has and duplicate-key replacement with Class values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapClassTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapClassItem> = VALID_VALUES;
      const map: Map<MapClassItem, MapClassItem> = new Map<MapClassItem, MapClassItem>();
      const setResult: Map<MapClassItem, MapClassItem> = map.set(values[0], values[1]);
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
     * @tc.name testMapClassTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLASS_TEST_0300
     * @tc.desc Verify Map delete, clear and size transitions with Class values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapClassTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapClassItem> = VALID_VALUES;
      const map: Map<MapClassItem, MapClassItem> = new Map<MapClassItem, MapClassItem>();
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
     * @tc.name testMapClassTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLASS_TEST_0400
     * @tc.desc Verify Map entries, keys, values and forEach insertion order with Class values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapClassTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapClassItem> = VALID_VALUES;
      const map: Map<MapClassItem, MapClassItem> = new Map<MapClassItem, MapClassItem>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const entryItem: IteratorResult<[MapClassItem, MapClassItem]> = map.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[1]);

      const keyItem: IteratorResult<MapClassItem> = map.keys().next();
      expect(keyItem.value).assertEqual(values[0]);
      const valueItem: IteratorResult<MapClassItem> = map.values().next();
      expect(valueItem.value).assertEqual(values[1]);

      let callbackCount: number = 0;
      let lastKey: MapClassItem = values[0];
      let lastValue: MapClassItem = values[1];
      map.forEach((value: MapClassItem, key: MapClassItem, _container: Map<MapClassItem, MapClassItem>): void => {
        callbackCount++;
        lastKey = key;
        lastValue = value;
      });
      expect(callbackCount).assertEqual(2);
      expect(lastKey).assertEqual(values[1]);
      expect(lastValue).assertEqual(values[2]);
    });

    /**
     * @tc.name testMapClassTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLASS_TEST_0500
     * @tc.desc Verify Map SameValueZero duplicate-key semantics with Class values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapClassTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapClassItem> = VALID_VALUES;
      const duplicateEntries: Array<[MapClassItem, MapClassItem]> = [
        [values[0], values[1]], [values[0], values[2]],
      ];
      const map: Map<MapClassItem, MapClassItem> = new Map<MapClassItem, MapClassItem>(duplicateEntries);
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
     * @tc.name testMapClassTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLASS_TEST_0600
     * @tc.desc Verify Map Symbol.iterator and iterator completion with Class values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapClassTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapClassItem> = VALID_VALUES;
      const map: Map<MapClassItem, MapClassItem> = new Map<MapClassItem, MapClassItem>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const iterator: Iterator<[MapClassItem, MapClassItem]> = map[Symbol.iterator]();
      const first: IteratorResult<[MapClassItem, MapClassItem]> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value[0]).assertEqual(values[0]);
      expect(first.value[1]).assertEqual(values[1]);

      const second: IteratorResult<[MapClassItem, MapClassItem]> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value[0]).assertEqual(values[1]);
      expect(second.value[1]).assertEqual(values[2]);

      const end: IteratorResult<[MapClassItem, MapClassItem]> = iterator.next();
      expect(end.done).assertTrue();
    });

  });
}
