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
import { getWeakMapUnionSymbolValue } from './WeakMapUnionTest.js';
function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

class WeakMapKeyClassItem {
  id: number;
  label: string;
  constructor(id: number, label: string) { this.id = id; this.label = label; }
}

interface WeakMapKeyObjectItem {
  id: number;
  label: string;
}

const OBJECT_KEY_A: WeakMapKeyObjectItem = { id: 1, label: 'object' };
const OBJECT_KEY_B: WeakMapKeyObjectItem = { id: 0, label: '' };
const ARRAY_KEY: Object = [1, 2, 3];
const FUNCTION_KEY: Object = (value: number): number => value + 1;
const CLASS_KEY: Object = new WeakMapKeyClassItem(-1, 'class');
const FROZEN_KEY: WeakMapKeyObjectItem = { id: 2, label: '冻结' };
const SEALED_KEY: WeakMapKeyObjectItem = { id: 3, label: '密封' };
const SAME_SHAPE_KEY: WeakMapKeyObjectItem = { id: 1, label: 'object' };
const KEY_VALUES: Array<Object> = [OBJECT_KEY_A, OBJECT_KEY_B, ARRAY_KEY, FUNCTION_KEY, CLASS_KEY, FROZEN_KEY, SEALED_KEY, SAME_SHAPE_KEY];

class WeakMapUnionClassItem {
  id: number;
  label: string;
  constructor(id: number, label: string) { this.id = id; this.label = label; }
}
type WeakMapUnionFunctionItem = (value: number) => number;
interface WeakMapUnionObjectItem { id: number; label: string; name?: string; extra?: number; }
type WeakMapUnionSymbolItem = Object;
type WeakMapUnionItem = number | string | null | undefined | boolean | bigint | WeakMapUnionSymbolItem |
  WeakMapUnionClassItem | Date | WeakMapUnionFunctionItem | Map<string, number> | Set<number> |
  Array<number> | WeakMapUnionObjectItem | RegExp;
const UNION_CLASS_VALUE: WeakMapUnionClassItem = new WeakMapUnionClassItem(Number.MAX_SAFE_INTEGER, '测试😀');
const UNION_SYMBOL_VALUE: WeakMapUnionSymbolItem = getWeakMapUnionSymbolValue();
const UNION_FUNCTION_VALUE: WeakMapUnionFunctionItem = (value: number): number => value * value;
const UNION_OBJECT_VALUE: WeakMapUnionObjectItem = { id: Number.MIN_SAFE_INTEGER, label: '\u200B', name: '测试😀', extra: Number.MAX_VALUE };
const UNION_MAP_VALUE: Map<string, number> = new Map<string, number>();
UNION_MAP_VALUE.set('\u200B', -1);
const UNION_SET_VALUE: Set<number> = new Set<number>([NaN, Infinity]);
const UNION_NESTED_VALUE: Array<number> = [NaN, Infinity];
const VALID_VALUES: Array<WeakMapUnionItem> = [
  NaN, '\u0000', null, undefined, false, BigInt('123456789012345678901234567890'), UNION_SYMBOL_VALUE,
  UNION_CLASS_VALUE, new Date(NaN), UNION_FUNCTION_VALUE, UNION_MAP_VALUE, UNION_SET_VALUE,
  UNION_NESTED_VALUE, UNION_OBJECT_VALUE, /[\u0000-\u001F]/g,
];
const ALL_VALUES: Array<WeakMapUnionItem> = [...VALID_VALUES];

export default function weakMapUnionTest() {
  describe('WeakMapUnionTest', () => {
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
     * @tc.name testWeakMapUnionTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_UNION_TEST_0100
     * @tc.desc Verify WeakMap empty and iterable constructors with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapUnionItem> = VALID_VALUES;
      const emptyMap: WeakMap<Object, WeakMapUnionItem> = new WeakMap<Object, WeakMapUnionItem>();
      expect(emptyMap.has(KEY_VALUES[0])).assertFalse();
      const entries: Array<[Object, WeakMapUnionItem]> = [[KEY_VALUES[0], values[0]], [KEY_VALUES[1], values[1]], [KEY_VALUES[0], values[2]]];
      const constructed: WeakMap<Object, WeakMapUnionItem> = new WeakMap<Object, WeakMapUnionItem>(entries);
      expect(constructed.has(KEY_VALUES[0])).assertTrue();
      expect(constructed.get(KEY_VALUES[0])).assertEqual(values[2]);
      expect(constructed.get(KEY_VALUES[1])).assertEqual(values[1]);
      expect(constructed.has(SAME_SHAPE_KEY)).assertFalse();
    });

    /**
     * @tc.name testWeakMapUnionTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_UNION_TEST_0200
     * @tc.desc Verify WeakMap set, get, has and replacement with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapUnionItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapUnionItem> = new WeakMap<Object, WeakMapUnionItem>();
      const setResult: WeakMap<Object, WeakMapUnionItem> = weakMap.set(KEY_VALUES[0], values[0]);
      expect(setResult).assertEqual(weakMap);
      expect(weakMap.has(KEY_VALUES[0])).assertTrue();
      expect(Number.isNaN(weakMap.get(KEY_VALUES[0]) as number)).assertTrue();
      expect(weakMap.has(KEY_VALUES[1])).assertFalse();
      expect(weakMap.get(KEY_VALUES[1])).assertUndefined();
      weakMap.set(KEY_VALUES[0], values[1]);
      expect(weakMap.get(KEY_VALUES[0])).assertEqual(values[1]);
    });

    /**
     * @tc.name testWeakMapUnionTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_UNION_TEST_0300
     * @tc.desc Verify WeakMap delete, missing-key and reference identity with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapUnionItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapUnionItem> = new WeakMap<Object, WeakMapUnionItem>();
      weakMap.set(KEY_VALUES[0], values[0]);
      weakMap.set(KEY_VALUES[1], values[1]);
      expect(weakMap.delete(KEY_VALUES[0])).assertTrue();
      expect(weakMap.has(KEY_VALUES[0])).assertFalse();
      expect(weakMap.get(KEY_VALUES[0])).assertUndefined();
      expect(weakMap.delete(KEY_VALUES[0])).assertFalse();
      expect(weakMap.has(KEY_VALUES[1])).assertTrue();
      expect(weakMap.has(SAME_SHAPE_KEY)).assertFalse();
    });

    /**
     * @tc.name testWeakMapUnionTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_UNION_TEST_0400
     * @tc.desc Verify object, array, function, class, frozen and sealed keys with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapUnionItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapUnionItem> = new WeakMap<Object, WeakMapUnionItem>();
      weakMap.set(OBJECT_KEY_A, values[0]);
      weakMap.set(ARRAY_KEY, values[1]);
      weakMap.set(FUNCTION_KEY, values[2]);
      weakMap.set(CLASS_KEY, values[3]);
      weakMap.set(FROZEN_KEY, values[4]);
      weakMap.set(SEALED_KEY, values[5]);
      expect(Number.isNaN(weakMap.get(OBJECT_KEY_A) as number)).assertTrue();
      expect(weakMap.get(ARRAY_KEY)).assertEqual(values[1]);
      expect(weakMap.get(FUNCTION_KEY)).assertEqual(values[2]);
      expect(weakMap.get(CLASS_KEY)).assertEqual(values[3]);
      expect(weakMap.get(FROZEN_KEY)).assertEqual(values[4]);
      expect(weakMap.get(SEALED_KEY)).assertEqual(values[5]);
    });

    /**
     * @tc.name testWeakMapUnionTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_UNION_TEST_0500
     * @tc.desc Verify primitive key rejection and non-throwing lookup behavior with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapUnionItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapUnionItem> = new WeakMap<Object, WeakMapUnionItem>();
      const invalidNumberKey: Object = 123 as Object;
      let setThrew: boolean = false;
      try {
        weakMap.set(invalidNumberKey, values[0]);
      } catch (_error) {
        setThrew = true;
      }
      expect(setThrew).assertTrue();
      expect(weakMap.has(invalidNumberKey)).assertFalse();
      expect(weakMap.get(invalidNumberKey)).assertUndefined();
      expect(weakMap.delete(invalidNumberKey)).assertFalse();
      expect(weakMap.has(KEY_VALUES[0])).assertFalse();
      expect(weakMap.get(KEY_VALUES[0])).assertUndefined();
    });

    /**
     * @tc.name testWeakMapUnionTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_UNION_TEST_0600
     * @tc.desc Verify all fixed dynamic Union values are retained by WeakMap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapUnionItem> = ALL_VALUES;
      const weakMap: WeakMap<Object, WeakMapUnionItem> = new WeakMap<Object, WeakMapUnionItem>();
      const first: WeakMapUnionItem = values[0];
      const last: WeakMapUnionItem = values[values.length - 1];
      weakMap.set(KEY_VALUES[0], first);
      weakMap.set(KEY_VALUES[1], last);
      expect(Number.isNaN(weakMap.get(KEY_VALUES[0]) as number)).assertTrue();
      expect(weakMap.get(KEY_VALUES[1])).assertEqual(last);
      expect(weakMap.has(KEY_VALUES[0])).assertTrue();
      expect(weakMap.has(KEY_VALUES[1])).assertTrue();
      expect(weakMap.delete(KEY_VALUES[1])).assertTrue();
      expect(weakMap.has(KEY_VALUES[1])).assertFalse();
    });
  });
}




