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

interface MapObjectItem {
  id: number;
  label: string;
  name?: string;
  age?: number;
  grade?: number;
  className?: string;
  extra?: number;
}
const OBJECT_A: MapObjectItem = { id: 1, label: '测试', name: '测试', age: 20 };
const OBJECT_B: MapObjectItem = { id: 0, label: '', name: '', age: 0 };
const OBJECT_C: MapObjectItem = { id: -1, label: '测试😀', name: 'a'.repeat(100), age: Number.MAX_SAFE_INTEGER };
const OBJECT_D: MapObjectItem = { id: 13800138000, label: '13800138000', name: 'test@example.com', age: 0, grade: 0 };
const OBJECT_E: MapObjectItem = { id: Number.MAX_SAFE_INTEGER, label: '<script>alert(1)</script>', name: 'https://test.com', age: Number.MIN_SAFE_INTEGER, className: '一班' };
const OBJECT_F: MapObjectItem = { id: 99999999, label: '2026-03-05', name: '138****8000', age: -1, extra: 1 };
const VALID_VALUES: Array<MapObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_E, OBJECT_F, OBJECT_A];

export default function mapObjectTest() {
  describe('MapObjectTest', () => {
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
     * @tc.name testMapObjectTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OBJECT_TEST_0100
     * @tc.desc Verify Map size and constructor behavior with Object dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapObjectItem> = VALID_VALUES;
      const emptyMap: Map<MapObjectItem, MapObjectItem> = new Map<MapObjectItem, MapObjectItem>();
      expect(emptyMap.size).assertEqual(0);

      const entries: Array<[MapObjectItem, MapObjectItem]> = [
        [values[0], values[1]], [values[1], values[2]], [values[0], values[3]],
      ];
      const constructed: Map<MapObjectItem, MapObjectItem> = new Map<MapObjectItem, MapObjectItem>(entries);
      expect(constructed.size).assertEqual(2);
      expect(constructed.get(values[0])).assertEqual(values[3]);
      expect(constructed.get(values[1])).assertEqual(values[2]);

      const copied: Map<MapObjectItem, MapObjectItem> = new Map<MapObjectItem, MapObjectItem>(constructed);
      expect(copied.size).assertEqual(constructed.size);
      expect(copied.get(values[0])).assertEqual(values[3]);
    });

    /**
     * @tc.name testMapObjectTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OBJECT_TEST_0200
     * @tc.desc Verify Map set, get, has and duplicate-key replacement with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapObjectItem> = VALID_VALUES;
      const map: Map<MapObjectItem, MapObjectItem> = new Map<MapObjectItem, MapObjectItem>();
      const setResult: Map<MapObjectItem, MapObjectItem> = map.set(values[0], values[1]);
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
     * @tc.name testMapObjectTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OBJECT_TEST_0300
     * @tc.desc Verify Map delete, clear and size transitions with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapObjectItem> = VALID_VALUES;
      const map: Map<MapObjectItem, MapObjectItem> = new Map<MapObjectItem, MapObjectItem>();
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
     * @tc.name testMapObjectTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OBJECT_TEST_0400
     * @tc.desc Verify Map entries, keys, values and forEach insertion order with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapObjectItem> = VALID_VALUES;
      const map: Map<MapObjectItem, MapObjectItem> = new Map<MapObjectItem, MapObjectItem>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const entryItem: IteratorResult<[MapObjectItem, MapObjectItem]> = map.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[1]);

      const keyItem: IteratorResult<MapObjectItem> = map.keys().next();
      expect(keyItem.value).assertEqual(values[0]);
      const valueItem: IteratorResult<MapObjectItem> = map.values().next();
      expect(valueItem.value).assertEqual(values[1]);

      let callbackCount: number = 0;
      let lastKey: MapObjectItem = values[0];
      let lastValue: MapObjectItem = values[1];
      map.forEach((value: MapObjectItem, key: MapObjectItem, _container: Map<MapObjectItem, MapObjectItem>): void => {
        callbackCount++;
        lastKey = key;
        lastValue = value;
      });
      expect(callbackCount).assertEqual(2);
      expect(lastKey).assertEqual(values[1]);
      expect(lastValue).assertEqual(values[2]);
    });

    /**
     * @tc.name testMapObjectTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OBJECT_TEST_0500
     * @tc.desc Verify Map SameValueZero duplicate-key semantics with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapObjectItem> = VALID_VALUES;
      const duplicateEntries: Array<[MapObjectItem, MapObjectItem]> = [
        [values[0], values[1]], [values[0], values[2]],
      ];
      const map: Map<MapObjectItem, MapObjectItem> = new Map<MapObjectItem, MapObjectItem>(duplicateEntries);
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
     * @tc.name testMapObjectTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OBJECT_TEST_0600
     * @tc.desc Verify Map Symbol.iterator and iterator completion with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapObjectItem> = VALID_VALUES;
      const map: Map<MapObjectItem, MapObjectItem> = new Map<MapObjectItem, MapObjectItem>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const iterator: Iterator<[MapObjectItem, MapObjectItem]> = map[Symbol.iterator]();
      const first: IteratorResult<[MapObjectItem, MapObjectItem]> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value[0]).assertEqual(values[0]);
      expect(first.value[1]).assertEqual(values[1]);

      const second: IteratorResult<[MapObjectItem, MapObjectItem]> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value[0]).assertEqual(values[1]);
      expect(second.value[1]).assertEqual(values[2]);

      const end: IteratorResult<[MapObjectItem, MapObjectItem]> = iterator.next();
      expect(end.done).assertTrue();
    });

  });
}
