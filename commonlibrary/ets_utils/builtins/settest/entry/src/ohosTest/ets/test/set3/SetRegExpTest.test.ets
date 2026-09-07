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

const VALID_VALUES: Array<RegExp> = [
  /abc/gi, /def/m, /^test$/u, new RegExp(''), /测试😀/u, /[\u0000-\u001F]/g, /abc/gi,
];

interface RegExpInvalidObject { marker: string; }
const REGEXP_INVALID_OBJECT: RegExpInvalidObject = { marker: 'invalid' };
type RegExpInvalidValue = string | number | null | undefined | RegExpInvalidObject | Array<RegExp>;
type RegExpAllValue = RegExp | RegExpInvalidValue;
const ALL_VALUES: Array<RegExpAllValue> = [
  ...VALID_VALUES, 'abc', 123, null, undefined, REGEXP_INVALID_OBJECT, [],
];

export default function setRegExpTest() {
  describe('SetRegExpTest', () => {
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
     * @tc.name testSetRegExpTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_REGEXP_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with RegExp dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const emptySet: Set<RegExp> = new Set<RegExp>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<RegExp> = new Set<RegExp>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<RegExp> = new Set<RegExp>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetRegExpTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_REGEXP_TEST_0200
     * @tc.desc Verify Set add and has semantics with RegExp dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const set: Set<RegExp> = new Set<RegExp>();
      const addResult: Set<RegExp> = set.add(values[0]);
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
     * @tc.name testSetRegExpTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_REGEXP_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with RegExp dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const set: Set<RegExp> = new Set<RegExp>([values[0], values[1]]);
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
     * @tc.name testSetRegExpTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_REGEXP_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with RegExp dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const set: Set<RegExp> = new Set<RegExp>([values[0], values[1]]);

      const entryItem: IteratorResult<[RegExp, RegExp]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[0]);

      const keyItem: IteratorResult<RegExp> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(keyItem.value).assertEqual(values[0]);

      const valueItem: IteratorResult<RegExp> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(valueItem.value).assertEqual(values[0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetRegExpTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_REGEXP_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with RegExp dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const set: Set<RegExp> = new Set<RegExp>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: RegExp = values[0];
      let lastKey: RegExp = values[0];
      let callbackContainer: Set<RegExp> = set;

      set.forEach((value: RegExp, key: RegExp, owner: Set<RegExp>): void => {
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
     * @tc.name testSetRegExpTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_REGEXP_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with RegExp dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetRegExpTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const set: Set<RegExp> = new Set<RegExp>([values[0], values[1]]);
      const iterator: Iterator<RegExp> = set.values();
      const first: IteratorResult<RegExp> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(values[0]);

      const second: IteratorResult<RegExp> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<RegExp> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetRegExpTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_REGEXP_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetRegExpTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const allValues: Array<RegExpAllValue> = ALL_VALUES;
      const dynamicSet: Set<RegExpAllValue> = new Set<RegExpAllValue>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<RegExpAllValue> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(values[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name testSetRegExpTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_REGEXP_TEST_0800
     * @tc.desc Verify Set identity and duplicate behavior for RegExp special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetRegExpTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const specialSet: Set<RegExp> = new Set<RegExp>([values[4], values[5], values[4]]);
      expect(specialSet.size).assertEqual(2);
      expect(specialSet.has(values[4])).assertTrue();
      expect(specialSet.has(values[5])).assertTrue();
      expect(specialSet.delete(values[4])).assertTrue();
      expect(specialSet.has(values[4])).assertFalse();
      expect(specialSet.size).assertEqual(1);
    });
  });
}
