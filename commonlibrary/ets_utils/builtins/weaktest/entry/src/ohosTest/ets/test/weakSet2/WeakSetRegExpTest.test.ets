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

interface WeakSetRegExpInvalidObject { marker: string; }
const WEAKSET_REGEXP_INVALID_OBJECT: WeakSetRegExpInvalidObject = { marker: 'invalid' };
type WeakSetRegExpInvalidValue = string | number | null | undefined | WeakSetRegExpInvalidObject | Array<Object>;
type WeakSetRegExpAllValue = RegExp | WeakSetRegExpInvalidValue;
const VALID_VALUES: Array<RegExp> = [/abc/gi, /def/m, /^test$/u, new RegExp(''), /测试😀/u, /[\u0000-\u001F]/g, /abc/gi];

export default function weakSetRegExpTest() {
  describe('WeakSetRegExpTest', () => {
    beforeAll(() => {});
    beforeEach(async () => { await sleep(30); });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testWeakSetRegExpTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_REGEXP_TEST_0100
     * @tc.desc Verify empty and iterable constructors with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testWeakSetRegExpTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_REGEXP_TEST_0200
     * @tc.desc Verify add return value and duplicate reference behavior with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
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
     * @tc.name testWeakSetRegExpTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_REGEXP_TEST_0300
     * @tc.desc Verify delete and reference identity with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
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
     * @tc.name testWeakSetRegExpTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_REGEXP_TEST_0400
     * @tc.desc Verify object, array, function, class, frozen and sealed references with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testWeakSetRegExpTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_REGEXP_TEST_0500
     * @tc.desc Verify primitive rejection and non-throwing has/delete behavior with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testWeakSetRegExpTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_REGEXP_TEST_0600
     * @tc.desc Verify all fixed dynamic RegExp object-like values are retained by WeakSet
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetRegExpTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
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
      expect(weakSet.has(first)).assertTrue();
      expect(weakSet.delete(last)).assertFalse();
    });
  });
}

