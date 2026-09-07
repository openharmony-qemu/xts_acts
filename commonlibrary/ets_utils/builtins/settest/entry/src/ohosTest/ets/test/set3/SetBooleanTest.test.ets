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

const VALID_VALUES: Array<boolean> = [true, false, true, false];

interface BooleanInvalidObject { marker: string; }
const BOOLEAN_INVALID_OBJECT: BooleanInvalidObject = { marker: 'invalid' };
type BooleanInvalidValue = number | string | null | undefined | BooleanInvalidObject | Array<boolean> | bigint;
type BooleanAllValue = boolean | BooleanInvalidValue;
const ALL_VALUES: Array<BooleanAllValue> = [
  ...VALID_VALUES, 1, 0, NaN, 'true', 'false', null, undefined, BOOLEAN_INVALID_OBJECT, [], 0n,
];

export default function setBooleanTest() {
  describe('SetBooleanTest', () => {
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
     * @tc.name testSetBooleanTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BOOLEAN_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with Boolean dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBooleanTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const emptySet: Set<boolean> = new Set<boolean>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<boolean> = new Set<boolean>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<boolean> = new Set<boolean>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetBooleanTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BOOLEAN_TEST_0200
     * @tc.desc Verify Set add and has semantics with Boolean dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBooleanTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const set: Set<boolean> = new Set<boolean>();
      const addResult: Set<boolean> = set.add(values[0]);
      expect(addResult).assertEqual(set);
      expect(set.size).assertEqual(1);
      expect(set.has(values[0])).assertTrue();

      set.add(values[1]);
      set.add(values[0]);
      expect(set.size).assertEqual(2);
      expect(set.has(values[1])).assertTrue();
      expect(set.has(values[2])).assertTrue();
    });

    /**
     * @tc.name testSetBooleanTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BOOLEAN_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with Boolean dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBooleanTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const set: Set<boolean> = new Set<boolean>([values[0], values[1]]);
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
     * @tc.name testSetBooleanTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BOOLEAN_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with Boolean dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBooleanTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const set: Set<boolean> = new Set<boolean>([values[0], values[1]]);

      const entryItem: IteratorResult<[boolean, boolean]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[0]);

      const keyItem: IteratorResult<boolean> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(keyItem.value).assertEqual(values[0]);

      const valueItem: IteratorResult<boolean> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(valueItem.value).assertEqual(values[0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetBooleanTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BOOLEAN_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with Boolean dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBooleanTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const set: Set<boolean> = new Set<boolean>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: boolean = values[0];
      let lastKey: boolean = values[0];
      let callbackContainer: Set<boolean> = set;

      set.forEach((value: boolean, key: boolean, owner: Set<boolean>): void => {
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
     * @tc.name testSetBooleanTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BOOLEAN_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with Boolean dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBooleanTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const set: Set<boolean> = new Set<boolean>([values[0], values[1]]);
      const iterator: Iterator<boolean> = set.values();
      const first: IteratorResult<boolean> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(values[0]);

      const second: IteratorResult<boolean> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<boolean> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetBooleanTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BOOLEAN_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with Boolean values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBooleanTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const allValues: Array<BooleanAllValue> = ALL_VALUES;
      const dynamicSet: Set<BooleanAllValue> = new Set<BooleanAllValue>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<BooleanAllValue> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(values[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name testSetBooleanTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BOOLEAN_TEST_0800
     * @tc.desc Verify Set identity and duplicate behavior for Boolean special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBooleanTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const specialSet: Set<boolean> = new Set<boolean>([values[0], values[1], values[0]]);
      expect(specialSet.size).assertEqual(2);
      expect(specialSet.has(values[0])).assertTrue();
      expect(specialSet.has(values[1])).assertTrue();
      expect(specialSet.delete(values[0])).assertTrue();
      expect(specialSet.has(values[0])).assertFalse();
      expect(specialSet.size).assertEqual(1);
    });
  });
}

