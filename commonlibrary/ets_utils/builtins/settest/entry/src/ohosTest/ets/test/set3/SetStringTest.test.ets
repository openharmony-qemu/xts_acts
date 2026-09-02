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

interface StringInvalidObject { marker: string; }
const STRING_INVALID_OBJECT: StringInvalidObject = { marker: 'invalid' };
type StringInvalidValue = number | bigint | StringInvalidObject | Array<string>;
type StringAllValue = string | StringInvalidValue;
const ALL_VALUES: Array<StringAllValue> = [
  ...VALID_VALUES, 123, 0n, STRING_INVALID_OBJECT, [], 'Symbol()',
];

export default function setStringTest() {
  describe('SetStringTest', () => {
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
     * @tc.name testSetStringTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_STRING_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with String dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<string> = VALID_VALUES;
      const emptySet: Set<string> = new Set<string>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<string> = new Set<string>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<string> = new Set<string>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetStringTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_STRING_TEST_0200
     * @tc.desc Verify Set add and has semantics with String dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<string> = VALID_VALUES;
      const set: Set<string> = new Set<string>();
      const addResult: Set<string> = set.add(values[0]);
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
     * @tc.name testSetStringTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_STRING_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with String dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<string> = VALID_VALUES;
      const set: Set<string> = new Set<string>([values[0], values[1]]);
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
     * @tc.name testSetStringTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_STRING_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with String dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<string> = VALID_VALUES;
      const set: Set<string> = new Set<string>([values[0], values[1]]);

      const entryItem: IteratorResult<[string, string]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[0]);

      const keyItem: IteratorResult<string> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(keyItem.value).assertEqual(values[0]);

      const valueItem: IteratorResult<string> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(valueItem.value).assertEqual(values[0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetStringTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_STRING_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with String dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<string> = VALID_VALUES;
      const set: Set<string> = new Set<string>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: string = values[0];
      let lastKey: string = values[0];
      let callbackContainer: Set<string> = set;

      set.forEach((value: string, key: string, owner: Set<string>): void => {
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
     * @tc.name testSetStringTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_STRING_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with String dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<string> = VALID_VALUES;
      const set: Set<string> = new Set<string>([values[0], values[1]]);
      const iterator: Iterator<string> = set.values();
      const first: IteratorResult<string> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(values[0]);

      const second: IteratorResult<string> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<string> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetStringTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_STRING_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with String values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetStringTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<string> = VALID_VALUES;
      const allValues: Array<StringAllValue> = ALL_VALUES;
      const dynamicSet: Set<StringAllValue> = new Set<StringAllValue>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<StringAllValue> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(values[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name testSetStringTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_STRING_TEST_0800
     * @tc.desc Verify Set identity and duplicate behavior for String special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetStringTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<string> = VALID_VALUES;
      const specialSet: Set<string> = new Set<string>([values[4], values[5], values[4]]);
      expect(specialSet.size).assertEqual(2);
      expect(specialSet.has(values[4])).assertTrue();
      expect(specialSet.has(values[5])).assertTrue();
      expect(specialSet.delete(values[4])).assertTrue();
      expect(specialSet.has(values[4])).assertFalse();
      expect(specialSet.size).assertEqual(1);
    });
  });
}
