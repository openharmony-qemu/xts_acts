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

const MAP_A: Map<string, number> = new Map<string, number>();
MAP_A.set('a', 1);
const MAP_B: Map<string, number> = new Map<string, number>();
MAP_B.set('b', 2);
const MAP_C: Map<string, number> = new Map<string, number>();
MAP_C.set('c', 3);
const MAP_D: Map<string, number> = new Map<string, number>();
MAP_D.set('', 0);
const MAP_E: Map<string, number> = new Map<string, number>();
MAP_E.set('\u200B', -1);
const MAP_F: Map<string, number> = new Map<string, number>();
MAP_F.set('max', Number.MAX_SAFE_INTEGER);
const MAP_G: Map<string, number> = new Map<string, number>();
const VALID_VALUES: Array<Map<string, number>> = [MAP_A, MAP_B, MAP_C, MAP_D, MAP_E, MAP_F, MAP_G, MAP_A];

interface MapInvalidObject { marker: string; }
const MAP_INVALID_OBJECT: MapInvalidObject = { marker: 'invalid' };
type MapInvalidValue = string | number | null | undefined | MapInvalidObject | Array<Map<string, number>>;
type MapAllValue = Map<string, number> | MapInvalidValue;
const ALL_VALUES: Array<MapAllValue> = [
  ...VALID_VALUES, 'key', 123, null, undefined, MAP_INVALID_OBJECT, [],
];

export default function setMapTest() {
  describe('SetMapTest', () => {
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
     * @tc.name testSetMapTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_MAP_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with Map dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const emptySet: Set<Map<string, number>> = new Set<Map<string, number>>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<Map<string, number>> = new Set<Map<string, number>>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<Map<string, number>> = new Set<Map<string, number>>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetMapTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_MAP_TEST_0200
     * @tc.desc Verify Set add and has semantics with Map dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const set: Set<Map<string, number>> = new Set<Map<string, number>>();
      const addResult: Set<Map<string, number>> = set.add(values[0]);
      expect(addResult).assertEqual(set);
      expect(set.size).assertEqual(1);
      expect(set.has(values[0])).assertTrue();

      set.add(values[1]);
      set.add(values[0]);
      expect(set.size).assertEqual(2);
      expect(set.has(values[1])).assertTrue();
      expect(set.has(values[2])).assertFalse();
    });

    /**
     * @tc.name testSetMapTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_MAP_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with Map dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([values[0], values[1]]);
      const beforeDeleteSize: number = set.size;
      expect(beforeDeleteSize).assertEqual(2);

      const deleted: boolean = set.delete(values[0]);
      expect(deleted).assertTrue();
      expect(set.has(values[0])).assertFalse();
      expect(set.size).assertEqual(beforeDeleteSize - 1);

      const missingDelete: boolean = set.delete(values[0]);
      expect(missingDelete).assertFalse();
      set.clear();
      expect(set.size).assertEqual(0);
      set.add(values[2]);
      expect(set.has(values[2])).assertTrue();
    });

    /**
     * @tc.name testSetMapTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_MAP_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with Map dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([values[0], values[1]]);

      const entryItem: IteratorResult<[Map<string, number>, Map<string, number>]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[0]);

      const keyItem: IteratorResult<Map<string, number>> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(keyItem.value).assertEqual(values[0]);

      const valueItem: IteratorResult<Map<string, number>> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(valueItem.value).assertEqual(values[0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetMapTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_MAP_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with Map dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: Map<string, number> = values[0];
      let lastKey: Map<string, number> = values[0];
      let callbackContainer: Set<Map<string, number>> = set;

      set.forEach((value: Map<string, number>, key: Map<string, number>, owner: Set<Map<string, number>>): void => {
        if (callbackCount === 0) {
          firstValue = value;
        }
        lastKey = key;
        callbackContainer = owner;
        callbackCount++;
      });

      expect(callbackCount).assertEqual(2);
      expect(firstValue).assertEqual(values[0]);
      expect(lastKey).assertEqual(values[1]);
      expect(callbackContainer).assertEqual(set);
      expect(set.has(values[0])).assertTrue();
      expect(set.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetMapTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_MAP_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with Map dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([values[0], values[1]]);
      const iterator: Iterator<Map<string, number>> = set.values();
      const first: IteratorResult<Map<string, number>> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(values[0]);

      const second: IteratorResult<Map<string, number>> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<Map<string, number>> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetMapTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_MAP_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with Map values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetMapTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const allValues: Array<MapAllValue> = ALL_VALUES;
      const dynamicSet: Set<MapAllValue> = new Set<MapAllValue>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<MapAllValue> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(values[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name testSetMapTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_MAP_TEST_0800
     * @tc.desc Verify Set identity and duplicate behavior for Map special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetMapTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const specialSet: Set<Map<string, number>> = new Set<Map<string, number>>([values[4], values[5], values[4]]);
      expect(specialSet.size).assertEqual(2);
      expect(specialSet.has(values[4])).assertTrue();
      expect(specialSet.has(values[5])).assertTrue();
      expect(specialSet.delete(values[4])).assertTrue();
      expect(specialSet.has(values[4])).assertFalse();
      expect(specialSet.size).assertEqual(1);
    });
  });
}
