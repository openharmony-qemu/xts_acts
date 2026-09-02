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

const VALID_VALUES: Array<Array<number>> = [
  [1, 2, 3], [0, -1], [NaN, Infinity], new Array<number>(3), [],
  [Number.MAX_SAFE_INTEGER], [1, 2, 3],
];

interface NestedInvalidObject { length: number; }
const NESTED_INVALID_OBJECT: NestedInvalidObject = { length: 3 };
type NestedInvalidValue = Array<string> | Array<null | undefined> | NestedInvalidObject | Array<number | string>;
type NestedAllValue = Array<number> | NestedInvalidValue;
const ALL_VALUES: Array<NestedAllValue> = [
  ...VALID_VALUES, [1, 'a'], [null, undefined], NESTED_INVALID_OBJECT, ['Symbol()'], [1, 2, '3'],
];

export default function setNestedTest() {
  describe('SetNestedTest', () => {
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
     * @tc.name testSetNestedTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NESTED_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with Nested dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNestedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const emptySet: Set<Array<number>> = new Set<Array<number>>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<Array<number>> = new Set<Array<number>>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<Array<number>> = new Set<Array<number>>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetNestedTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NESTED_TEST_0200
     * @tc.desc Verify Set add and has semantics with Nested dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNestedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const set: Set<Array<number>> = new Set<Array<number>>();
      const addResult: Set<Array<number>> = set.add(values[0]);
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
     * @tc.name testSetNestedTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NESTED_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with Nested dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNestedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const set: Set<Array<number>> = new Set<Array<number>>([values[0], values[1]]);
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
     * @tc.name testSetNestedTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NESTED_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with Nested dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNestedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const set: Set<Array<number>> = new Set<Array<number>>([values[0], values[1]]);

      const entryItem: IteratorResult<[Array<number>, Array<number>]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[0]);

      const keyItem: IteratorResult<Array<number>> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(keyItem.value).assertEqual(values[0]);

      const valueItem: IteratorResult<Array<number>> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(valueItem.value).assertEqual(values[0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetNestedTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NESTED_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with Nested dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNestedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const set: Set<Array<number>> = new Set<Array<number>>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: Array<number> = values[0];
      let lastKey: Array<number> = values[0];
      let callbackContainer: Set<Array<number>> = set;

      set.forEach((value: Array<number>, key: Array<number>, owner: Set<Array<number>>): void => {
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
     * @tc.name testSetNestedTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NESTED_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with Nested dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNestedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const set: Set<Array<number>> = new Set<Array<number>>([values[0], values[1]]);
      const iterator: Iterator<Array<number>> = set.values();
      const first: IteratorResult<Array<number>> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(values[0]);

      const second: IteratorResult<Array<number>> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<Array<number>> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetNestedTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NESTED_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with Nested values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNestedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const allValues: Array<NestedAllValue> = ALL_VALUES;
      const dynamicSet: Set<NestedAllValue> = new Set<NestedAllValue>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<NestedAllValue> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(values[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name testSetNestedTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NESTED_TEST_0800
     * @tc.desc Verify Set identity and duplicate behavior for Nested special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNestedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const specialSet: Set<Array<number>> = new Set<Array<number>>([values[4], values[5], values[4]]);
      expect(specialSet.size).assertEqual(2);
      expect(specialSet.has(values[4])).assertTrue();
      expect(specialSet.has(values[5])).assertTrue();
      expect(specialSet.delete(values[4])).assertTrue();
      expect(specialSet.has(values[4])).assertFalse();
      expect(specialSet.size).assertEqual(1);
    });
  });
}
