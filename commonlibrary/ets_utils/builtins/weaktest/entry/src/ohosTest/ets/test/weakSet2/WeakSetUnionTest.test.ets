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
import { getWeakSetUnionSymbolValue } from './WeakSetUnionTest.js';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

class WeakSetKeyClassItem {
  id: number;
  label: string;
  constructor(id: number, label: string) { this.id = id; this.label = label; }
}
interface WeakSetKeyObjectItem { id: number; label: string; }
const OBJECT_KEY_A: WeakSetKeyObjectItem = { id: 1, label: 'object' };
const OBJECT_KEY_B: WeakSetKeyObjectItem = { id: 0, label: '' };
const ARRAY_KEY: Object = [1, 2, 3];
const FUNCTION_KEY: Object = (value: number): number => value + 1;
const CLASS_KEY: Object = new WeakSetKeyClassItem(-1, 'class');
const FROZEN_KEY: WeakSetKeyObjectItem = { id: 2, label: '冻结' };
const SEALED_KEY: WeakSetKeyObjectItem = { id: 3, label: '密封' };
const SAME_SHAPE_KEY: WeakSetKeyObjectItem = { id: 1, label: 'object' };
const KEY_VALUES: Array<Object> = [OBJECT_KEY_A, OBJECT_KEY_B, ARRAY_KEY, FUNCTION_KEY, CLASS_KEY, FROZEN_KEY, SEALED_KEY, SAME_SHAPE_KEY];

class WeakSetUnionClassItem {
  id: number;
  label: string;
  constructor(id: number, label: string) { this.id = id; this.label = label; }
}
type WeakSetUnionFunctionItem = (value: number) => number;
interface WeakSetUnionObjectItem { id: number; label: string; name?: string; extra?: number; }
type WeakSetUnionSymbolItem = Object;
type WeakSetUnionItem = number | string | null | undefined | boolean | bigint | WeakSetUnionSymbolItem |
  WeakSetUnionClassItem | Date | WeakSetUnionFunctionItem | Map<string, number> | Set<number> |
  Array<number> | WeakSetUnionObjectItem | RegExp;
const UNION_CLASS_VALUE: WeakSetUnionClassItem = new WeakSetUnionClassItem(Number.MAX_SAFE_INTEGER, '测试😀');
const UNION_SYMBOL_VALUE: WeakSetUnionSymbolItem = getWeakSetUnionSymbolValue();
const UNION_FUNCTION_VALUE: WeakSetUnionFunctionItem = (value: number): number => value * value;
const UNION_OBJECT_VALUE: WeakSetUnionObjectItem = { id: Number.MIN_SAFE_INTEGER, label: '\u200B', name: '测试😀', extra: Number.MAX_VALUE };
const UNION_MAP_VALUE: Map<string, number> = new Map<string, number>();
UNION_MAP_VALUE.set('\u200B', -1);
const UNION_SET_VALUE: Set<number> = new Set<number>([NaN, Infinity]);
const UNION_NESTED_VALUE: Array<number> = [NaN, Infinity];
const VALID_VALUES: Array<WeakSetUnionItem> = [
  NaN, '\u0000', null, undefined, false, BigInt('123456789012345678901234567890'), UNION_SYMBOL_VALUE,
  UNION_CLASS_VALUE, new Date(NaN), UNION_FUNCTION_VALUE, UNION_MAP_VALUE, UNION_SET_VALUE,
  UNION_NESTED_VALUE, UNION_OBJECT_VALUE, /[\u0000-\u001F]/g,
];
const ALL_VALUES: Array<WeakSetUnionItem> = [...VALID_VALUES];
const UNION_OBJECT_LIKE_VALUES: Array<Object> = [
  UNION_SYMBOL_VALUE, UNION_CLASS_VALUE, new Date(NaN), UNION_FUNCTION_VALUE as Object,
  UNION_MAP_VALUE, UNION_SET_VALUE, UNION_NESTED_VALUE, UNION_OBJECT_VALUE, /[\u0000-\u001F]/g,
];

export default function weakSetUnionTest() {
  describe('WeakSetUnionTest', () => {
    beforeAll(() => {});
    beforeEach(async () => { await sleep(30); });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testWeakSetUnionTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_UNION_TEST_0100
     * @tc.desc Verify constructor with object-like Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptySet: WeakSet<Object> = new WeakSet<Object>();
      expect(emptySet.has(KEY_VALUES[0])).assertFalse();
      const constructed: WeakSet<Object> = new WeakSet<Object>(UNION_OBJECT_LIKE_VALUES);
      expect(constructed.has(UNION_SYMBOL_VALUE)).assertTrue();
      expect(constructed.has(UNION_CLASS_VALUE)).assertTrue();
      expect(constructed.has(UNION_OBJECT_VALUE)).assertTrue();
      expect(constructed.has(SAME_SHAPE_KEY)).assertFalse();
      expect(constructed.delete(UNION_OBJECT_VALUE)).assertTrue();
      expect(constructed.has(UNION_OBJECT_VALUE)).assertFalse();
    });

    /**
     * @tc.name testWeakSetUnionTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_UNION_TEST_0200
     * @tc.desc Verify add return value and duplicate Union object identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      const value: Object = UNION_CLASS_VALUE;
      const addResult: WeakSet<Object> = weakSet.add(value);
      expect(addResult).assertEqual(weakSet);
      expect(weakSet.has(value)).assertTrue();
      weakSet.add(value);
      expect(weakSet.has(value)).assertTrue();
      expect(weakSet.has(UNION_OBJECT_VALUE)).assertFalse();
      expect(weakSet.delete(value)).assertTrue();
      expect(weakSet.has(value)).assertFalse();
    });

    /**
     * @tc.name testWeakSetUnionTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_UNION_TEST_0300
     * @tc.desc Verify delete and reference identity across Union Map and Set values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      weakSet.add(UNION_MAP_VALUE);
      weakSet.add(UNION_SET_VALUE);
      expect(weakSet.has(UNION_MAP_VALUE)).assertTrue();
      expect(weakSet.has(UNION_SET_VALUE)).assertTrue();
      expect(weakSet.delete(UNION_MAP_VALUE)).assertTrue();
      expect(weakSet.has(UNION_MAP_VALUE)).assertFalse();
      expect(weakSet.delete(UNION_MAP_VALUE)).assertFalse();
      expect(weakSet.has(UNION_SET_VALUE)).assertTrue();
    });

    /**
     * @tc.name testWeakSetUnionTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_UNION_TEST_0400
     * @tc.desc Verify object-like Union values: symbol, class, Date, function, Map, Set, array, object and RegExp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      for (let index: number = 0; index < UNION_OBJECT_LIKE_VALUES.length; index++) {
        weakSet.add(UNION_OBJECT_LIKE_VALUES[index]);
      }
      expect(weakSet.has(UNION_SYMBOL_VALUE)).assertTrue();
      expect(weakSet.has(UNION_CLASS_VALUE)).assertTrue();
      expect(weakSet.has(UNION_FUNCTION_VALUE as Object)).assertTrue();
      expect(weakSet.has(UNION_MAP_VALUE)).assertTrue();
      expect(weakSet.has(UNION_SET_VALUE)).assertTrue();
      expect(weakSet.has(UNION_NESTED_VALUE)).assertTrue();
      expect(weakSet.has(UNION_OBJECT_VALUE)).assertTrue();
      expect(weakSet.has(UNION_OBJECT_LIKE_VALUES[8])).assertTrue();
    });

    /**
     * @tc.name testWeakSetUnionTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_UNION_TEST_0500
     * @tc.desc Verify primitive, null and undefined Union members are rejected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      const primitiveValues: Array<WeakSetUnionItem> = [NaN, '\u0000', null, undefined, false, BigInt('123')];
      let rejected: number = 0;
      for (let index: number = 0; index < primitiveValues.length; index++) {
        const candidate: Object = primitiveValues[index] as Object;
        try { weakSet.add(candidate); } catch (_error) { rejected++; }
        expect(weakSet.has(candidate)).assertFalse();
      }
      expect(rejected > 0).assertTrue();
      expect(weakSet.has(UNION_OBJECT_VALUE)).assertFalse();
      expect(weakSet.delete(UNION_OBJECT_VALUE)).assertFalse();
    });

    /**
     * @tc.name testWeakSetUnionTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_UNION_TEST_0600
     * @tc.desc Verify mixed Union values distinguish legal object-like values from primitives
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      let accepted: number = 0;
      let rejected: number = 0;
      for (let index: number = 0; index < ALL_VALUES.length; index++) {
        const candidate: Object = ALL_VALUES[index] as Object;
        try { weakSet.add(candidate); accepted++; } catch (_error) { rejected++; }
      }
      expect(accepted > 0).assertTrue();
      expect(rejected > 0).assertTrue();
      expect(weakSet.has(UNION_CLASS_VALUE)).assertTrue();
      expect(weakSet.delete(UNION_CLASS_VALUE)).assertTrue();
      expect(weakSet.has(UNION_CLASS_VALUE)).assertFalse();
    });
  });
}


