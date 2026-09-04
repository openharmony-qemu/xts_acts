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

interface ArrayObjectItem {
  id: number;
  label: string;
  name?: string;
  age?: number;
  grade?: number;
  className?: string;
  extra?: number;
}

const OBJECT_A: ArrayObjectItem = { id: 1, label: '测试' };
const OBJECT_B: ArrayObjectItem = { id: 0, label: '' };
const OBJECT_C: ArrayObjectItem = { id: -1, label: '测试😀', name: '13800138000' };
const OBJECT_D: ArrayObjectItem = { id: Number.MAX_SAFE_INTEGER, label: 'a'.repeat(100), age: 18 };
const OBJECT_E: ArrayObjectItem = { id: 13800138000, label: 'test@example.com', grade: 100 };
const OBJECT_F: ArrayObjectItem = { id: Number.MIN_SAFE_INTEGER, label: 'https://test.com', className: '2026-03-05', extra: Number.MAX_VALUE };
const VALID_VALUES: Array<ArrayObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_E, OBJECT_F, OBJECT_A];

interface ObjectInvalidObject { marker: string; }
const OBJECT_INVALID_OBJECT: ObjectInvalidObject = { marker: 'invalid' };
interface ObjectInvalidShape { name: number; age: string; }
const OBJECT_INVALID_SHAPE: ObjectInvalidShape = { name: 123, age: '20' };
type ObjectInvalidValue = number | string | null | undefined | ObjectInvalidObject | ObjectInvalidShape | Array<ArrayObjectItem>;
type ObjectAllValue = ArrayObjectItem | ObjectInvalidValue;
const ALL_VALUES: Array<ObjectAllValue> = [
  ...VALID_VALUES, 123, 'test', null, undefined, OBJECT_INVALID_OBJECT, OBJECT_INVALID_SHAPE, [],
];

export default function setObjectTest() {
  describe('SetObjectTest', () => {
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
     * @tc.name testSetObjectTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_OBJECT_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with Object dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const emptySet: Set<ArrayObjectItem> = new Set<ArrayObjectItem>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<ArrayObjectItem> = new Set<ArrayObjectItem>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<ArrayObjectItem> = new Set<ArrayObjectItem>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetObjectTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_OBJECT_TEST_0200
     * @tc.desc Verify Set add and has semantics with Object dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const set: Set<ArrayObjectItem> = new Set<ArrayObjectItem>();
      const addResult: Set<ArrayObjectItem> = set.add(values[0]);
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
     * @tc.name testSetObjectTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_OBJECT_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with Object dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const set: Set<ArrayObjectItem> = new Set<ArrayObjectItem>([values[0], values[1]]);
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
     * @tc.name testSetObjectTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_OBJECT_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with Object dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const set: Set<ArrayObjectItem> = new Set<ArrayObjectItem>([values[0], values[1]]);

      const entryItem: IteratorResult<[ArrayObjectItem, ArrayObjectItem]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[0]);

      const keyItem: IteratorResult<ArrayObjectItem> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(keyItem.value).assertEqual(values[0]);

      const valueItem: IteratorResult<ArrayObjectItem> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(valueItem.value).assertEqual(values[0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetObjectTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_OBJECT_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with Object dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const set: Set<ArrayObjectItem> = new Set<ArrayObjectItem>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: ArrayObjectItem = values[0];
      let lastKey: ArrayObjectItem = values[0];
      let callbackContainer: Set<ArrayObjectItem> = set;

      set.forEach((value: ArrayObjectItem, key: ArrayObjectItem, owner: Set<ArrayObjectItem>): void => {
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
     * @tc.name testSetObjectTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_OBJECT_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with Object dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const set: Set<ArrayObjectItem> = new Set<ArrayObjectItem>([values[0], values[1]]);
      const iterator: Iterator<ArrayObjectItem> = set.values();
      const first: IteratorResult<ArrayObjectItem> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(values[0]);

      const second: IteratorResult<ArrayObjectItem> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<ArrayObjectItem> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetObjectTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_OBJECT_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with Object values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetObjectTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const allValues: Array<ObjectAllValue> = ALL_VALUES;
      const dynamicSet: Set<ObjectAllValue> = new Set<ObjectAllValue>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<ObjectAllValue> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(values[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name testSetObjectTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_OBJECT_TEST_0800
     * @tc.desc Verify Set identity and duplicate behavior for Object special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetObjectTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const specialSet: Set<ArrayObjectItem> = new Set<ArrayObjectItem>([values[4], values[5], values[4]]);
      expect(specialSet.size).assertEqual(2);
      expect(specialSet.has(values[4])).assertTrue();
      expect(specialSet.has(values[5])).assertTrue();
      expect(specialSet.delete(values[4])).assertTrue();
      expect(specialSet.has(values[4])).assertFalse();
      expect(specialSet.size).assertEqual(1);
    });
  });
}
