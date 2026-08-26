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
import { getSetUnionSymbolValue } from './SetUnionTest.js';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

class SetUnionClassItem {
  id: number;
  label: string;
  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

type SetUnionFunctionItem = (value: number) => number;

interface SetUnionObjectItem {
  id: number;
  label: string;
  name?: string;
  extra?: number;
}

type SetUnionSymbolItem = Object;
type SetUnionItem = number | string | null | undefined | boolean | bigint |
  SetUnionSymbolItem | SetUnionClassItem | Date | SetUnionFunctionItem |
  Map<string, number> | Set<number> | Array<number> | SetUnionObjectItem | RegExp;

const UNION_SYMBOL_VALUE: SetUnionSymbolItem = getSetUnionSymbolValue();

const UNION_CLASS_VALUE: SetUnionClassItem =
  new SetUnionClassItem(Number.MAX_SAFE_INTEGER, '测试😀');
const UNION_FUNCTION_VALUE: SetUnionFunctionItem =
  (value: number): number => value * value;
const UNION_OBJECT_VALUE: SetUnionObjectItem = {
  id: Number.MIN_SAFE_INTEGER,
  label: '\u200B',
  name: '测试😀',
  extra: Number.MAX_VALUE,
};
const UNION_MAP_VALUE: Map<string, number> = new Map<string, number>();
UNION_MAP_VALUE.set('\u200B', -1);
const UNION_SET_VALUE: Set<number> = new Set<number>([NaN, Infinity]);
const UNION_NESTED_VALUE: Array<number> = [NaN, Infinity];

const VALID_VALUES: Array<SetUnionItem> = [
  NaN, '\u0000', null, undefined, false, BigInt('123456789012345678901234567890'), UNION_SYMBOL_VALUE,
  UNION_CLASS_VALUE, new Date(NaN), UNION_FUNCTION_VALUE, UNION_MAP_VALUE, UNION_SET_VALUE,
  UNION_NESTED_VALUE, UNION_OBJECT_VALUE, /[\u0000-\u001F]/g,
];

const ALL_VALUES: Array<SetUnionItem> = [...VALID_VALUES];

export default function setUnionTest() {
  describe('SetUnionTest', () => {
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
     * @tc.name testSetUnionTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_UNION_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with Union dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<SetUnionItem> = VALID_VALUES;
      const emptySet: Set<SetUnionItem> = new Set<SetUnionItem>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<SetUnionItem> = new Set<SetUnionItem>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<SetUnionItem> = new Set<SetUnionItem>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetUnionTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_UNION_TEST_0200
     * @tc.desc Verify Set add and has semantics with Union dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<SetUnionItem> = VALID_VALUES;
      const set: Set<SetUnionItem> = new Set<SetUnionItem>();
      const addResult: Set<SetUnionItem> = set.add(values[0]);
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
     * @tc.name testSetUnionTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_UNION_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with Union dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<SetUnionItem> = VALID_VALUES;
      const set: Set<SetUnionItem> = new Set<SetUnionItem>([values[0], values[1]]);
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
     * @tc.name testSetUnionTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_UNION_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with Union dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<SetUnionItem> = VALID_VALUES;
      const set: Set<SetUnionItem> = new Set<SetUnionItem>([values[0], values[1]]);

      const entryItem: IteratorResult<[SetUnionItem, SetUnionItem]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(Number.isNaN(entryItem.value[0] as number)).assertTrue();
      expect(Number.isNaN(entryItem.value[1] as number)).assertTrue();

      const keyItem: IteratorResult<SetUnionItem> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(Number.isNaN(keyItem.value as number)).assertTrue();

      const valueItem: IteratorResult<SetUnionItem> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(Number.isNaN(valueItem.value as number)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetUnionTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_UNION_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with Union dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<SetUnionItem> = VALID_VALUES;
      const set: Set<SetUnionItem> = new Set<SetUnionItem>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: SetUnionItem = values[0];
      let lastKey: SetUnionItem = values[0];
      let callbackContainer: Set<SetUnionItem> = set;

      set.forEach((value: SetUnionItem, key: SetUnionItem, owner: Set<SetUnionItem>): void => {
        if (callbackCount === 0) {
          firstValue = value;
        }
        lastKey = key;
        callbackContainer = owner;
        callbackCount++;
      });

      expect(callbackCount).assertEqual(2);
      expect(Number.isNaN(firstValue as number)).assertTrue();
      expect(lastKey).assertEqual(values[1]);
      expect(callbackContainer).assertEqual(set);
      expect(set.has(values[0])).assertTrue();
      expect(set.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetUnionTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_UNION_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with Union dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<SetUnionItem> = VALID_VALUES;
      const set: Set<SetUnionItem> = new Set<SetUnionItem>([values[0], values[1]]);
      const iterator: Iterator<SetUnionItem> = set.values();
      const first: IteratorResult<SetUnionItem> = iterator.next();
      expect(first.done).assertFalse();
      expect(Number.isNaN(first.value as number)).assertTrue();

      const second: IteratorResult<SetUnionItem> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<SetUnionItem> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetUnionTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_UNION_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with Union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetUnionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<SetUnionItem> = VALID_VALUES;
      const allValues: Array<SetUnionItem> = ALL_VALUES;
      const dynamicSet: Set<SetUnionItem> = new Set<SetUnionItem>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<SetUnionItem> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(Number.isNaN(values[0] as number)).assertTrue();
    });

    /**
     * @tc.name testSetUnionTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_UNION_TEST_0800
     * @tc.desc Verify Set identity and duplicate behavior for Union special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetUnionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<SetUnionItem> = VALID_VALUES;
      const specialSet: Set<SetUnionItem> = new Set<SetUnionItem>([values[4], values[5], values[4]]);
      expect(specialSet.size).assertEqual(2);
      expect(specialSet.has(values[4])).assertTrue();
      expect(specialSet.has(values[5])).assertTrue();
      expect(specialSet.delete(values[4])).assertTrue();
      expect(specialSet.has(values[4])).assertFalse();
      expect(specialSet.size).assertEqual(1);
    });
  });
}




