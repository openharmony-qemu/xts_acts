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

interface WeakMapNumberInvalidObject { marker: string; }
const WEAKMAP_NUMBER_INVALID_OBJECT: WeakMapNumberInvalidObject = { marker: 'invalid' };
type WeakMapNumberInvalidValue = string | null | undefined | WeakMapNumberInvalidObject | Array<number> | boolean | bigint;
type WeakMapNumberAllValue = number | WeakMapNumberInvalidValue;
const VALID_VALUES: Array<number> = [
  1, 100.5, -99.9, 0, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010, NaN, Infinity, -Infinity,
  -0, Number.MAX_VALUE, Number.MIN_VALUE, Number.EPSILON, Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER,
  -128, 127, -32768, 32767, -2147483648, 2147483647, -1, 999999.99, 13800138000, 123456, -100.5,
];
const ALL_VALUES: Array<WeakMapNumberAllValue> = [
  ...VALID_VALUES, '123', null, undefined, WEAKMAP_NUMBER_INVALID_OBJECT, [], true, BigInt('9007199254740991'),
];

export default function weakMapNumberTest() {
  describe('WeakMapNumberTest', () => {
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
     * @tc.name testWeakMapNumberTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_NUMBER_TEST_0100
     * @tc.desc Verify WeakMap empty and iterable constructors with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapNumberTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const emptyMap: WeakMap<Object, number> = new WeakMap<Object, number>();
      expect(emptyMap.has(KEY_VALUES[0])).assertFalse();
      const entries: Array<[Object, number]> = [[KEY_VALUES[0], values[0]], [KEY_VALUES[1], values[1]], [KEY_VALUES[0], values[2]]];
      const constructed: WeakMap<Object, number> = new WeakMap<Object, number>(entries);
      expect(constructed.has(KEY_VALUES[0])).assertTrue();
      expect(constructed.get(KEY_VALUES[0])).assertEqual(values[2]);
      expect(constructed.get(KEY_VALUES[1])).assertEqual(values[1]);
      expect(constructed.has(SAME_SHAPE_KEY)).assertFalse();
    });

    /**
     * @tc.name testWeakMapNumberTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_NUMBER_TEST_0200
     * @tc.desc Verify WeakMap set, get, has and replacement with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapNumberTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const weakMap: WeakMap<Object, number> = new WeakMap<Object, number>();
      const setResult: WeakMap<Object, number> = weakMap.set(KEY_VALUES[0], values[0]);
      expect(setResult).assertEqual(weakMap);
      expect(weakMap.has(KEY_VALUES[0])).assertTrue();
      expect(weakMap.get(KEY_VALUES[0])).assertEqual(values[0]);
      expect(weakMap.has(KEY_VALUES[1])).assertFalse();
      expect(weakMap.get(KEY_VALUES[1])).assertUndefined();
      weakMap.set(KEY_VALUES[0], values[1]);
      expect(weakMap.get(KEY_VALUES[0])).assertEqual(values[1]);
    });

    /**
     * @tc.name testWeakMapNumberTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_NUMBER_TEST_0300
     * @tc.desc Verify WeakMap delete, missing-key and reference identity with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapNumberTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const weakMap: WeakMap<Object, number> = new WeakMap<Object, number>();
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
     * @tc.name testWeakMapNumberTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_NUMBER_TEST_0400
     * @tc.desc Verify object, array, function, class, frozen and sealed keys with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapNumberTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const weakMap: WeakMap<Object, number> = new WeakMap<Object, number>();
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
     * @tc.name testWeakMapNumberTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_NUMBER_TEST_0500
     * @tc.desc Verify primitive key rejection and non-throwing lookup behavior with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapNumberTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const weakMap: WeakMap<Object, number> = new WeakMap<Object, number>();
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
     * @tc.name testWeakMapNumberTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKMAP_NUMBER_TEST_0600
     * @tc.desc Verify all fixed dynamic Number values are retained by WeakMap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakMapNumberTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<WeakMapNumberAllValue> = ALL_VALUES;
      const weakMap: WeakMap<Object, WeakMapNumberAllValue> = new WeakMap<Object, WeakMapNumberAllValue>();
      const first: WeakMapNumberAllValue = values[0];
      const last: WeakMapNumberAllValue = values[values.length - 1];
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


