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

class ArrayClassItem {
  id: number;
  label: string;
  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

const CLASS_A: ArrayClassItem = new ArrayClassItem(1, '测试');
const CLASS_B: ArrayClassItem = new ArrayClassItem(0, '');
const CLASS_C: ArrayClassItem = new ArrayClassItem(-1, '测试😀');
const CLASS_D: ArrayClassItem = new ArrayClassItem(Number.MAX_SAFE_INTEGER, 'a'.repeat(100));
const CLASS_E: ArrayClassItem = new ArrayClassItem(13800138000, '13800138000');
const CLASS_F: ArrayClassItem = new ArrayClassItem(99999999, '<script>alert(1)</script>');
const VALID_VALUES: Array<ArrayClassItem> = [CLASS_A, CLASS_B, CLASS_C, CLASS_D, CLASS_E, CLASS_F, CLASS_A];

interface ClassInvalidObject { marker: string; }
const CLASS_INVALID_OBJECT: ClassInvalidObject = { marker: 'invalid' };
type ClassInvalidValue = number | string | null | undefined | ClassInvalidObject | Array<ArrayClassItem>;
type ClassAllValue = ArrayClassItem | ClassInvalidValue;
const ALL_VALUES: Array<ClassAllValue> = [
  ...VALID_VALUES, 123, 'test', null, undefined, CLASS_INVALID_OBJECT, [],
];

export default function setClassTest() {
  describe('SetClassTest', () => {
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
     * @tc.name testSetClassTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLASS_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with Class dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClassTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const emptySet: Set<ArrayClassItem> = new Set<ArrayClassItem>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<ArrayClassItem> = new Set<ArrayClassItem>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<ArrayClassItem> = new Set<ArrayClassItem>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetClassTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLASS_TEST_0200
     * @tc.desc Verify Set add and has semantics with Class dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClassTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const set: Set<ArrayClassItem> = new Set<ArrayClassItem>();
      const addResult: Set<ArrayClassItem> = set.add(values[0]);
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
     * @tc.name testSetClassTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLASS_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with Class dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClassTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const set: Set<ArrayClassItem> = new Set<ArrayClassItem>([values[0], values[1]]);
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
     * @tc.name testSetClassTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLASS_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with Class dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClassTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const set: Set<ArrayClassItem> = new Set<ArrayClassItem>([values[0], values[1]]);

      const entryItem: IteratorResult<[ArrayClassItem, ArrayClassItem]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[0]);

      const keyItem: IteratorResult<ArrayClassItem> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(keyItem.value).assertEqual(values[0]);

      const valueItem: IteratorResult<ArrayClassItem> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(valueItem.value).assertEqual(values[0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetClassTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLASS_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with Class dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClassTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const set: Set<ArrayClassItem> = new Set<ArrayClassItem>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: ArrayClassItem = values[0];
      let lastKey: ArrayClassItem = values[0];
      let callbackContainer: Set<ArrayClassItem> = set;

      set.forEach((value: ArrayClassItem, key: ArrayClassItem, owner: Set<ArrayClassItem>): void => {
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
     * @tc.name testSetClassTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLASS_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with Class dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClassTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const set: Set<ArrayClassItem> = new Set<ArrayClassItem>([values[0], values[1]]);
      const iterator: Iterator<ArrayClassItem> = set.values();
      const first: IteratorResult<ArrayClassItem> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(values[0]);

      const second: IteratorResult<ArrayClassItem> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<ArrayClassItem> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetClassTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLASS_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with Class values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClassTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const allValues: Array<ClassAllValue> = ALL_VALUES;
      const dynamicSet: Set<ClassAllValue> = new Set<ClassAllValue>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<ClassAllValue> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(values[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name testSetClassTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLASS_TEST_0800
     * @tc.desc Verify Set identity and duplicate behavior for Class special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClassTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const specialSet: Set<ArrayClassItem> = new Set<ArrayClassItem>([values[4], values[5], values[4]]);
      expect(specialSet.size).assertEqual(2);
      expect(specialSet.has(values[4])).assertTrue();
      expect(specialSet.has(values[5])).assertTrue();
      expect(specialSet.delete(values[4])).assertTrue();
      expect(specialSet.has(values[4])).assertFalse();
      expect(specialSet.size).assertEqual(1);
    });
  });
}
