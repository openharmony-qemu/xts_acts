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

interface WeakMapObjectItem {
  id: number;
  label: string;
  name?: string;
  age?: number;
  grade?: number;
  className?: string;
  extra?: number;
}
const OBJECT_A: WeakMapObjectItem = { id: 1, label: '测试', name: '测试', age: 20 };
const OBJECT_B: WeakMapObjectItem = { id: 0, label: '', name: '', age: 0 };
const OBJECT_C: WeakMapObjectItem = { id: -1, label: '测试😀', name: 'a'.repeat(100), age: Number.MAX_SAFE_INTEGER };
const OBJECT_D: WeakMapObjectItem = { id: 13800138000, label: '13800138000', name: 'test@example.com', age: 0, grade: 0 };
const OBJECT_E: WeakMapObjectItem = { id: Number.MAX_SAFE_INTEGER, label: '<script>alert(1)</script>', name: 'https://test.com', age: Number.MIN_SAFE_INTEGER, className: '一班' };
const OBJECT_F: WeakMapObjectItem = { id: 99999999, label: '2026-03-05', name: '138****8000', age: -1, extra: 1 };
interface WeakMapObjectInvalidObject { marker: string; }
const WEAKMAP_OBJECT_INVALID_OBJECT: WeakMapObjectInvalidObject = { marker: 'invalid' };
type WeakMapObjectInvalidValue = number | string | null | undefined | WeakMapObjectInvalidObject | Array<Object>;
type WeakMapObjectAllValue = WeakMapObjectItem | WeakMapObjectInvalidValue;
const VALID_VALUES: Array<WeakMapObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_E, OBJECT_F, OBJECT_A];
const ALL_VALUES: Array<WeakMapObjectAllValue> = [...VALID_VALUES, 123, 'object', null, undefined, WEAKMAP_OBJECT_INVALID_OBJECT, []];

export default function weakMapObjectTest() {
  describe('WeakMapObjectTest', () => {
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
     * @tc.name testWeakMapObjectTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_OBJECT_TEST_0100
     * @tc.desc Verify WeakMap empty and iterable constructors with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapObjectItem> = VALID_VALUES;
      const emptyMap: WeakMap<Object, WeakMapObjectItem> = new WeakMap<Object, WeakMapObjectItem>();
      expect(emptyMap.has(KEY_VALUES[0])).assertFalse();
      const entries: Array<[Object, WeakMapObjectItem]> = [[KEY_VALUES[0], values[0]], [KEY_VALUES[1], values[1]], [KEY_VALUES[0], values[2]]];
      const constructed: WeakMap<Object, WeakMapObjectItem> = new WeakMap<Object, WeakMapObjectItem>(entries);
      expect(constructed.has(KEY_VALUES[0])).assertTrue();
      expect(constructed.get(KEY_VALUES[0])).assertEqual(values[2]);
      expect(constructed.get(KEY_VALUES[1])).assertEqual(values[1]);
      expect(constructed.has(SAME_SHAPE_KEY)).assertFalse();
    });

    /**
     * @tc.name testWeakMapObjectTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_OBJECT_TEST_0200
     * @tc.desc Verify WeakMap set, get, has and replacement with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapObjectItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapObjectItem> = new WeakMap<Object, WeakMapObjectItem>();
      const setResult: WeakMap<Object, WeakMapObjectItem> = weakMap.set(KEY_VALUES[0], values[0]);
      expect(setResult).assertEqual(weakMap);
      expect(weakMap.has(KEY_VALUES[0])).assertTrue();
      expect(weakMap.get(KEY_VALUES[0])).assertEqual(values[0]);
      expect(weakMap.has(KEY_VALUES[1])).assertFalse();
      expect(weakMap.get(KEY_VALUES[1])).assertUndefined();
      weakMap.set(KEY_VALUES[0], values[1]);
      expect(weakMap.get(KEY_VALUES[0])).assertEqual(values[1]);
    });

    /**
     * @tc.name testWeakMapObjectTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_OBJECT_TEST_0300
     * @tc.desc Verify WeakMap delete, missing-key and reference identity with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapObjectItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapObjectItem> = new WeakMap<Object, WeakMapObjectItem>();
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
     * @tc.name testWeakMapObjectTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_OBJECT_TEST_0400
     * @tc.desc Verify object, array, function, class, frozen and sealed keys with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapObjectItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapObjectItem> = new WeakMap<Object, WeakMapObjectItem>();
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
     * @tc.name testWeakMapObjectTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_OBJECT_TEST_0500
     * @tc.desc Verify primitive key rejection and non-throwing lookup behavior with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapObjectItem> = VALID_VALUES;
      const weakMap: WeakMap<Object, WeakMapObjectItem> = new WeakMap<Object, WeakMapObjectItem>();
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
     * @tc.name testWeakMapObjectTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_OBJECT_TEST_0600
     * @tc.desc Verify all fixed dynamic Object values are retained by WeakMap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapObjectAllValue> = ALL_VALUES;
      const weakMap: WeakMap<Object, WeakMapObjectAllValue> = new WeakMap<Object, WeakMapObjectAllValue>();
      const first: WeakMapObjectAllValue = values[0];
      const last: WeakMapObjectAllValue = values[values.length - 1];
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


