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

type ArrayFunctionItem = (value: number) => number;
const FUNCTION_A: ArrayFunctionItem = (value: number): number => value + 1;
const FUNCTION_B: ArrayFunctionItem = (value: number): number => value + 2;
const FUNCTION_C: ArrayFunctionItem = (value: number): number => value + 3;
const FUNCTION_D: ArrayFunctionItem = (value: number): number => value * value;
const FUNCTION_E: ArrayFunctionItem = (value: number): number => Math.max(value, 0);
const FUNCTION_F: ArrayFunctionItem = (value: number): number => value - 100.5;
const VALID_VALUES: Array<ArrayFunctionItem> = [
  FUNCTION_A, FUNCTION_B, FUNCTION_C, FUNCTION_D, FUNCTION_E, FUNCTION_F, FUNCTION_A,
];

interface FunctionInvalidObject { marker: string; }
const FUNCTION_INVALID_OBJECT: FunctionInvalidObject = { marker: 'invalid' };
type FunctionInvalidValue = number | string | null | undefined | FunctionInvalidObject | Array<ArrayFunctionItem>;
type FunctionAllValue = ArrayFunctionItem | FunctionInvalidValue;
const ALL_VALUES: Array<FunctionAllValue> = [
  ...VALID_VALUES, 123, 'test', null, undefined, FUNCTION_INVALID_OBJECT, [],
];

export default function setFunctionTest() {
  describe('SetFunctionTest', () => {
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
     * @tc.name testSetFunctionTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FUNCTION_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with Function dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const emptySet: Set<ArrayFunctionItem> = new Set<ArrayFunctionItem>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<ArrayFunctionItem> = new Set<ArrayFunctionItem>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<ArrayFunctionItem> = new Set<ArrayFunctionItem>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetFunctionTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FUNCTION_TEST_0200
     * @tc.desc Verify Set add and has semantics with Function dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const set: Set<ArrayFunctionItem> = new Set<ArrayFunctionItem>();
      const addResult: Set<ArrayFunctionItem> = set.add(values[0]);
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
     * @tc.name testSetFunctionTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FUNCTION_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with Function dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const set: Set<ArrayFunctionItem> = new Set<ArrayFunctionItem>([values[0], values[1]]);
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
     * @tc.name testSetFunctionTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FUNCTION_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with Function dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const set: Set<ArrayFunctionItem> = new Set<ArrayFunctionItem>([values[0], values[1]]);

      const entryItem: IteratorResult<[ArrayFunctionItem, ArrayFunctionItem]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[0]);

      const keyItem: IteratorResult<ArrayFunctionItem> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(keyItem.value).assertEqual(values[0]);

      const valueItem: IteratorResult<ArrayFunctionItem> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(valueItem.value).assertEqual(values[0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetFunctionTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FUNCTION_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with Function dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const set: Set<ArrayFunctionItem> = new Set<ArrayFunctionItem>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: ArrayFunctionItem = values[0];
      let lastKey: ArrayFunctionItem = values[0];
      let callbackContainer: Set<ArrayFunctionItem> = set;

      set.forEach((value: ArrayFunctionItem, key: ArrayFunctionItem, owner: Set<ArrayFunctionItem>): void => {
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
     * @tc.name testSetFunctionTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FUNCTION_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with Function dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const set: Set<ArrayFunctionItem> = new Set<ArrayFunctionItem>([values[0], values[1]]);
      const iterator: Iterator<ArrayFunctionItem> = set.values();
      const first: IteratorResult<ArrayFunctionItem> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(values[0]);

      const second: IteratorResult<ArrayFunctionItem> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<ArrayFunctionItem> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetFunctionTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FUNCTION_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with Function values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetFunctionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const allValues: Array<FunctionAllValue> = ALL_VALUES;
      const dynamicSet: Set<FunctionAllValue> = new Set<FunctionAllValue>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<FunctionAllValue> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(values[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name testSetFunctionTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FUNCTION_TEST_0800
     * @tc.desc Verify Set identity and duplicate behavior for Function special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetFunctionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const specialSet: Set<ArrayFunctionItem> = new Set<ArrayFunctionItem>([values[4], values[5], values[4]]);
      expect(specialSet.size).assertEqual(2);
      expect(specialSet.has(values[4])).assertTrue();
      expect(specialSet.has(values[5])).assertTrue();
      expect(specialSet.delete(values[4])).assertTrue();
      expect(specialSet.has(values[4])).assertFalse();
      expect(specialSet.size).assertEqual(1);
    });
  });
}
