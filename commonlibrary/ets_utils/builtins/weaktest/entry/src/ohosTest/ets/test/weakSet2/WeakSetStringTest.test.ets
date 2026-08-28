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

interface WeakSetStringInvalidObject { marker: string; }
const WEAKSET_STRING_INVALID_OBJECT: WeakSetStringInvalidObject = { marker: 'invalid' };
type WeakSetStringInvalidValue = number | bigint | WeakSetStringInvalidObject | Array<string>;
type WeakSetStringAllValue = string | WeakSetStringInvalidValue;
const STRING_SPECIAL_CHARACTERS: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
const STRING_ASCII_VISIBLE: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
const STRING_SPECIAL_ESCAPES: string = "\\a \\b \\f \\n \\r \\t \\v \\\\ \\' \\\" \\? \\0 \\ddd \\xhh";
const STRING_CONTROL_ESCAPES: string = '\u0007\b\f\n\r\t\u000b\u0000';
const STRING_LONG_VALUE: string = 'a'.repeat(100000);
const VALID_VALUES: Array<string> = [
  'test', '测试', `模板字符串${123}`, '\u4e2d\u6587', '\x61', 'a\nb', '0', 'NaN', 'true', 'null',
  '', '   ', '\u200B', '\u0000', '\t', '\r\n', 'a', STRING_LONG_VALUE, '测试😀', STRING_SPECIAL_CHARACTERS,
  STRING_ASCII_VISIBLE, STRING_SPECIAL_ESCAPES, STRING_CONTROL_ESCAPES, '👆', '\uD83D\uDC40', '\uD83D\uDCAF',
  '\uD83C\uDF85', '\uD83C\uDC04', '\uD83C\uDFF4', '13800138000', '310101199001011234',
  'test@example.com', '<script>alert(1)</script>', 'https://test.com', '2026-03-05', '138****8000',
  '\udc04', '\ud83d', '\udff4',
];
const ALL_VALUES: Array<WeakSetStringAllValue> = [...VALID_VALUES, 123, 0n, WEAKSET_STRING_INVALID_OBJECT, []];

export default function weakSetStringTest() {
  describe('WeakSetStringTest', () => {
    beforeAll(() => {});
    beforeEach(async () => { await sleep(30); });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testWeakSetStringTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_STRING_TEST_0100
     * @tc.desc Verify empty and object iterable constructors for invalid String values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testWeakSetStringTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_STRING_TEST_0200
     * @tc.desc Verify add rejects primitive String values and accepts legal object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<string> = VALID_VALUES;
      const invalid: Object = values[0] as Object;
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      let addThrew: boolean = false;
      try { weakSet.add(invalid); } catch (_error) { addThrew = true; }
      expect(addThrew).assertTrue();
      expect(weakSet.has(invalid)).assertFalse();
      const addResult: WeakSet<Object> = weakSet.add(KEY_VALUES[0]);
      expect(addResult).assertEqual(weakSet);
      expect(weakSet.has(KEY_VALUES[0])).assertTrue();
      expect(weakSet.delete(KEY_VALUES[0])).assertTrue();
      expect(weakSet.has(KEY_VALUES[0])).assertFalse();
    });

    /**
     * @tc.name testWeakSetStringTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_STRING_TEST_0300
     * @tc.desc Verify has/delete behavior for primitive String values and object identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<string> = VALID_VALUES;
      const invalid: Object = values[0] as Object;
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      weakSet.add(KEY_VALUES[0]);
      weakSet.add(KEY_VALUES[1]);
      expect(weakSet.has(KEY_VALUES[0])).assertTrue();
      expect(weakSet.has(KEY_VALUES[1])).assertTrue();
      expect(weakSet.has(invalid)).assertFalse();
      expect(weakSet.delete(invalid)).assertFalse();
      expect(weakSet.delete(KEY_VALUES[0])).assertTrue();
      expect(weakSet.has(KEY_VALUES[0])).assertFalse();
    });

    /**
     * @tc.name testWeakSetStringTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_STRING_TEST_0400
     * @tc.desc Verify object, array, function, class, frozen and sealed references beside String inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testWeakSetStringTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_STRING_TEST_0500
     * @tc.desc Verify all fixed primitive String values are rejected by WeakSet.add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const allValues: Array<WeakSetStringAllValue> = ALL_VALUES;
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      let rejected: number = 0;
      for (let index: number = 0; index < allValues.length; index++) {
        const candidate: Object = allValues[index] as Object;
        try { weakSet.add(candidate); } catch (_error) { rejected++; }
      }
      expect(rejected > 0).assertTrue();
      expect(weakSet.has(KEY_VALUES[0])).assertFalse();
      expect(weakSet.delete(KEY_VALUES[0])).assertFalse();
      expect(weakSet.has(SAME_SHAPE_KEY)).assertFalse();
    });

    /**
     * @tc.name testWeakSetStringTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_WEAKSET_STRING_TEST_0600
     * @tc.desc Verify mixed fixed String values distinguish legal objects from primitives
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testWeakSetStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const allValues: Array<WeakSetStringAllValue> = ALL_VALUES;
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      let accepted: number = 0;
      let rejected: number = 0;
      for (let index: number = 0; index < allValues.length; index++) {
        const candidate: Object = allValues[index] as Object;
        try { weakSet.add(candidate); accepted++; } catch (_error) { rejected++; }
      }
      expect(accepted > 0).assertTrue();
      expect(rejected > 0).assertTrue();
      weakSet.add(ARRAY_KEY);
      expect(weakSet.has(ARRAY_KEY)).assertTrue();
      expect(weakSet.delete(ARRAY_KEY)).assertTrue();
      expect(weakSet.has(ARRAY_KEY)).assertFalse();
    });
  });
}

