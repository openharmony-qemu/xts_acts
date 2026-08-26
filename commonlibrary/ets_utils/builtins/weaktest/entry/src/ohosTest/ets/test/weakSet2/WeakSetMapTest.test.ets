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

class WeakSetKeyClassItem {
  id: number;
  label: string;
  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

interface WeakSetKeyObjectItem {
  id: number;
  label: string;
}

const OBJECT_KEY_A: WeakSetKeyObjectItem = { id: 1, label: 'object' };
const OBJECT_KEY_B: WeakSetKeyObjectItem = { id: 0, label: '' };
const ARRAY_KEY: Object = [1, 2, 3];
const FUNCTION_KEY: Object = (value: number): number => value + 1;
const CLASS_KEY: Object = new WeakSetKeyClassItem(-1, 'class');
const FROZEN_KEY: WeakSetKeyObjectItem = { id: 2, label: '冻结' };
const SEALED_KEY: WeakSetKeyObjectItem = { id: 3, label: '密封' };
const SAME_SHAPE_KEY: WeakSetKeyObjectItem = { id: 1, label: 'object' };
const KEY_VALUES: Array<Object> = [
  OBJECT_KEY_A, OBJECT_KEY_B, ARRAY_KEY, FUNCTION_KEY,
  CLASS_KEY, FROZEN_KEY, SEALED_KEY, SAME_SHAPE_KEY,
];

interface WeakSetMapInvalidObject { marker: string; }
const WEAKSET_MAP_INVALID_OBJECT: WeakSetMapInvalidObject = { marker: 'invalid' };
type WeakSetMapInvalidValue = string | number | null | undefined | WeakSetMapInvalidObject | Array<Object>;
type WeakSetMapAllValue = Map<string, number> | WeakSetMapInvalidValue;
const MAP_A: Map<string, number> = new Map<string, number>();
const MAP_B: Map<string, number> = new Map<string, number>();
const MAP_C: Map<string, number> = new Map<string, number>();
const MAP_D: Map<string, number> = new Map<string, number>();
const MAP_E: Map<string, number> = new Map<string, number>();
const MAP_F: Map<string, number> = new Map<string, number>();
const MAP_G: Map<string, number> = new Map<string, number>();
MAP_A.set('a', 1); MAP_B.set('b', 2); MAP_C.set('c', 3); MAP_D.set('', 0); MAP_E.set('\u200B', -1); MAP_F.set('max', Number.MAX_SAFE_INTEGER);
const VALID_VALUES: Array<Map<string, number>> = [MAP_A, MAP_B, MAP_C, MAP_D, MAP_E, MAP_F, MAP_G, MAP_A];

export default function weakSetMapTest() {
  describe('WeakSetMapTest', () => {
    beforeAll(() => {});
    beforeEach(async () => { await sleep(30); });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testWeakSetMapTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_MAP_TEST_0100
     * @tc.desc Verify empty and iterable constructors with Map values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptySet: WeakSet<Object> = new WeakSet<Object>();
      expect(emptySet.has(KEY_VALUES[0])).assertFalse();
      const iterable: Array<Object> = [KEY_VALUES[0], KEY_VALUES[1], KEY_VALUES[0]];
      const constructed: WeakSet<Object> = new WeakSet<Object>(iterable);
      expect(constructed.has(KEY_VALUES[0])).assertTrue();
      expect(constructed.has(KEY_VALUES[1])).assertTrue();
      expect(constructed.has(SAME_SHAPE_KEY)).assertFalse();
      expect(constructed.delete(KEY_VALUES[0])).assertTrue();
      expect(constructed.has(KEY_VALUES[0])).assertFalse();
    });

    /**
     * @tc.name testWeakSetMapTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_MAP_TEST_0200
     * @tc.desc Verify add return value and duplicate reference behavior with Map values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const value: Object = values[0] as Object;
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      const addResult: WeakSet<Object> = weakSet.add(value);
      expect(addResult).assertEqual(weakSet);
      expect(weakSet.has(value)).assertTrue();
      weakSet.add(value);
      expect(weakSet.has(value)).assertTrue();
      expect(weakSet.has(KEY_VALUES[1])).assertFalse();
      expect(weakSet.delete(value)).assertTrue();
      expect(weakSet.has(value)).assertFalse();
    });

    /**
     * @tc.name testWeakSetMapTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_MAP_TEST_0300
     * @tc.desc Verify delete and reference identity with Map values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const first: Object = values[0] as Object;
      const second: Object = values[1] as Object;
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      weakSet.add(first);
      weakSet.add(second);
      expect(weakSet.has(first)).assertTrue();
      expect(weakSet.has(second)).assertTrue();
      expect(weakSet.delete(first)).assertTrue();
      expect(weakSet.has(first)).assertFalse();
      expect(weakSet.delete(first)).assertFalse();
      expect(weakSet.has(SAME_SHAPE_KEY)).assertFalse();
    });

    /**
     * @tc.name testWeakSetMapTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_MAP_TEST_0400
     * @tc.desc Verify object, array, function, class, frozen and sealed references with Map values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      weakSet.add(OBJECT_KEY_A);
      weakSet.add(ARRAY_KEY);
      weakSet.add(FUNCTION_KEY);
      weakSet.add(CLASS_KEY);
      weakSet.add(FROZEN_KEY);
      weakSet.add(SEALED_KEY);
      expect(weakSet.has(OBJECT_KEY_A)).assertTrue();
      expect(weakSet.has(ARRAY_KEY)).assertTrue();
      expect(weakSet.has(FUNCTION_KEY)).assertTrue();
      expect(weakSet.has(CLASS_KEY)).assertTrue();
      expect(weakSet.has(FROZEN_KEY)).assertTrue();
      expect(weakSet.has(SEALED_KEY)).assertTrue();
      expect(weakSet.has(SAME_SHAPE_KEY)).assertFalse();
    });

    /**
     * @tc.name testWeakSetMapTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_MAP_TEST_0500
     * @tc.desc Verify primitive rejection and non-throwing has/delete behavior with Map values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalidNumber: Object = 123 as Object;
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      let addThrew: boolean = false;
      try { weakSet.add(invalidNumber); } catch (_error) { addThrew = true; }
      expect(addThrew).assertTrue();
      expect(weakSet.has(invalidNumber)).assertFalse();
      expect(weakSet.delete(invalidNumber)).assertFalse();
      expect(weakSet.has(KEY_VALUES[0])).assertFalse();
      expect(weakSet.delete(KEY_VALUES[0])).assertFalse();
      expect(weakSet.has(SAME_SHAPE_KEY)).assertFalse();
    });

    /**
     * @tc.name testWeakSetMapTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_MAP_TEST_0600
     * @tc.desc Verify all fixed dynamic Map object-like values are retained by WeakSet
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      for (let index: number = 0; index < values.length; index++) {
        weakSet.add(values[index] as Object);
      }
      const first: Object = values[0] as Object;
      const last: Object = values[values.length - 1] as Object;
      expect(weakSet.has(first)).assertTrue();
      expect(weakSet.has(last)).assertTrue();
      expect(weakSet.delete(last)).assertTrue();
      expect(weakSet.has(last)).assertFalse();
      expect(weakSet.has(first)).assertFalse();
      expect(weakSet.delete(last)).assertFalse();
    });
  });
}

