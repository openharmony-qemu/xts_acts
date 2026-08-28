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

type WeakMapFunctionItem = (value: number) => number;
const FUNCTION_A: WeakMapFunctionItem = (value: number): number => value * value;
const FUNCTION_B: WeakMapFunctionItem = (value: number): number => value + 1;
const FUNCTION_C: WeakMapFunctionItem = (value: number): number => value - 1;
interface WeakMapFunctionInvalidObject { marker: string; }
const WEAKMAP_FUNCTION_INVALID_OBJECT: WeakMapFunctionInvalidObject = { marker: 'invalid' };
type WeakMapFunctionInvalidValue = number | string | null | undefined | WeakMapFunctionInvalidObject | Array<Object>;
type WeakMapFunctionAllValue = WeakMapFunctionItem | WeakMapFunctionInvalidValue;
const VALID_VALUES: Array<WeakMapFunctionItem> = [FUNCTION_A, FUNCTION_B, FUNCTION_C, FUNCTION_A, FUNCTION_B, FUNCTION_C];
const ALL_VALUES: Array<WeakMapFunctionAllValue> = [...VALID_VALUES, 123, 'function', null, undefined, WEAKMAP_FUNCTION_INVALID_OBJECT, []];

export default function weakMapFunctionTest() {
  describe('WeakMapFunctionTest', () => {
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
     * @tc.name testWeakMapFunctionTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_FUNCTION_TEST_0100
     * @tc.desc Verify WeakMap empty and iterable constructors with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapFunctionItem> = VALID_VALUES;
      const emptyMap: WeakMap<Object, WeakMapFunctionItem> = new WeakMap<Object, WeakMapFunctionItem>();
      expect(emptyMap.has(KEY_VALUES[0])).assertFalse();
      const entries: Array<[Object, WeakMapFunctionItem]> = [[KEY_VALUES[0], values[0]], [KEY_VALUES[1], values[1]], [KEY_VALUES[0], values[2]]];
      const constructed: WeakMap<Object, WeakMapFunctionItem> = new WeakMap<Object, WeakMapFunctionItem>(entries);
      expect(constructed.has(KEY_VALUES[0])).assertTrue();
      expect(constructed.get(KEY_VALUES[0])).assertEqual(values[2]);
      expect(constructed.get(KEY_VALUES[1])).assertEqual(values[1]);
      expect(constructed.has(SAME_SHAPE_KEY)).assertFalse();
    });

    /**
     * @tc.name testWeakMapFunctionTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_FUNCTION_TEST_0200
     * @tc.desc Verify WeakMap set, get, has and replacement with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapFunctionItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapFunctionItem> = new WeakMap<Object, WeakMapFunctionItem>();
      const setResult: WeakMap<Object, WeakMapFunctionItem> = weakMap.set(KEY_VALUES[0], values[0]);
      expect(setResult).assertEqual(weakMap);
      expect(weakMap.has(KEY_VALUES[0])).assertTrue();
      expect(weakMap.get(KEY_VALUES[0])).assertEqual(values[0]);
      expect(weakMap.has(KEY_VALUES[1])).assertFalse();
      expect(weakMap.get(KEY_VALUES[1])).assertUndefined();
      weakMap.set(KEY_VALUES[0], values[1]);
      expect(weakMap.get(KEY_VALUES[0])).assertEqual(values[1]);
    });

    /**
     * @tc.name testWeakMapFunctionTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_FUNCTION_TEST_0300
     * @tc.desc Verify WeakMap delete, missing-key and reference identity with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapFunctionItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapFunctionItem> = new WeakMap<Object, WeakMapFunctionItem>();
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
     * @tc.name testWeakMapFunctionTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_FUNCTION_TEST_0400
     * @tc.desc Verify object, array, function, class, frozen and sealed keys with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapFunctionItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapFunctionItem> = new WeakMap<Object, WeakMapFunctionItem>();
      weakMap.set(OBJECT_KEY_A, values[0]);
      weakMap.set(ARRAY_KEY, values[1]);
      weakMap.set(FUNCTION_KEY, values[2]);
      weakMap.set(CLASS_KEY, values[3]);
      weakMap.set(FROZEN_KEY, values[4]);
      weakMap.set(SEALED_KEY, values[5]);
      expect(weakMap.get(OBJECT_KEY_A)).assertEqual(values[0]);
      expect(weakMap.get(ARRAY_KEY)).assertEqual(values[1]);
      expect(weakMap.get(FUNCTION_KEY)).assertEqual(values[2]);
      expect(weakMap.get(CLASS_KEY)).assertEqual(values[3]);
      expect(weakMap.get(FROZEN_KEY)).assertEqual(values[4]);
      expect(weakMap.get(SEALED_KEY)).assertEqual(values[5]);
    });

    /**
     * @tc.name testWeakMapFunctionTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_FUNCTION_TEST_0500
     * @tc.desc Verify primitive key rejection and non-throwing lookup behavior with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapFunctionItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapFunctionItem> = new WeakMap<Object, WeakMapFunctionItem>();
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
     * @tc.name testWeakMapFunctionTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_FUNCTION_TEST_0600
     * @tc.desc Verify all fixed dynamic Function values are retained by WeakMap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapFunctionAllValue> = ALL_VALUES;
      const weakMap: WeakMap<Object, WeakMapFunctionAllValue> = new WeakMap<Object, WeakMapFunctionAllValue>();
      const first: WeakMapFunctionAllValue = values[0];
      const last: WeakMapFunctionAllValue = values[values.length - 1];
      weakMap.set(KEY_VALUES[0], first);
      weakMap.set(KEY_VALUES[1], last);
      expect(weakMap.get(KEY_VALUES[0])).assertEqual(first);
      expect(weakMap.get(KEY_VALUES[1])).assertEqual(last);
      expect(weakMap.has(KEY_VALUES[0])).assertTrue();
      expect(weakMap.has(KEY_VALUES[1])).assertTrue();
      expect(weakMap.delete(KEY_VALUES[1])).assertTrue();
      expect(weakMap.has(KEY_VALUES[1])).assertFalse();
    });
  });
}



