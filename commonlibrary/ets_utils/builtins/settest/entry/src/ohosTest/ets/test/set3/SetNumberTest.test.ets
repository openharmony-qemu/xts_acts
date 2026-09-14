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

const VALID_VALUES: Array<number> = [
  1, 100.5, -99.9, 0, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010, NaN, Infinity, -Infinity,
  -0, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MIN_VALUE, Number.MIN_VALUE - 1, Number.EPSILON,
  Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, -128, 127, -32768, 32767, -2147483648,
  2147483647, -9223372036854775808, 9223372036854775807, -1.40129846432481707e-45,
  1.40129846432481707e-45, -3.4028234663852886e38, 3.4028234663852886e38, 65535,
  -1, 999999.99, 13800138000, 123456, -100.5,
];

interface NumberInvalidObject { marker: string; }
const NUMBER_INVALID_OBJECT: NumberInvalidObject = { marker: 'invalid' };
type NumberInvalidValue = string | number | null | undefined | NumberInvalidObject | Array<number> | boolean | bigint;
type NumberAllValue = number | NumberInvalidValue;
const ALL_VALUES: Array<NumberAllValue> = [
  ...VALID_VALUES, '123', '0x12', null, undefined, NUMBER_INVALID_OBJECT, [], true,
  BigInt('16045690984833335006'), BigInt('9007199254740991'),
];

export default function setNumberTest() {
  describe('SetNumberTest', () => {
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
     * @tc.name testSetNumberTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NUMBER_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with Number dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNumberTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const emptySet: Set<number> = new Set<number>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<number> = new Set<number>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<number> = new Set<number>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetNumberTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NUMBER_TEST_0200
     * @tc.desc Verify Set add and has semantics with Number dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNumberTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const set: Set<number> = new Set<number>();
      const addResult: Set<number> = set.add(values[0]);
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
     * @tc.name testSetNumberTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NUMBER_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with Number dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNumberTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const set: Set<number> = new Set<number>([values[0], values[1]]);
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
     * @tc.name testSetNumberTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NUMBER_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with Number dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNumberTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const set: Set<number> = new Set<number>([values[0], values[1]]);

      const entryItem: IteratorResult<[number, number]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[0]);

      const keyItem: IteratorResult<number> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(keyItem.value).assertEqual(values[0]);

      const valueItem: IteratorResult<number> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(valueItem.value).assertEqual(values[0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetNumberTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NUMBER_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with Number dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNumberTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const set: Set<number> = new Set<number>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: number = values[0];
      let lastKey: number = values[0];
      let callbackContainer: Set<number> = set;

      set.forEach((value: number, key: number, owner: Set<number>): void => {
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
     * @tc.name testSetNumberTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NUMBER_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with Number dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNumberTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const set: Set<number> = new Set<number>([values[0], values[1]]);
      const iterator: Iterator<number> = set.values();
      const first: IteratorResult<number> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(values[0]);

      const second: IteratorResult<number> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<number> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetNumberTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NUMBER_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNumberTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const allValues: Array<NumberAllValue> = ALL_VALUES;
      const dynamicSet: Set<NumberAllValue> = new Set<NumberAllValue>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<NumberAllValue> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(values[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name testSetNumberTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_NUMBER_TEST_0800
     * @tc.desc Verify Set SameValueZero behavior for NaN and signed zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetNumberTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const specialSet: Set<number> = new Set<number>([NaN, -0, 0, Infinity]);
      expect(specialSet.has(NaN)).assertTrue();
      expect(specialSet.has(0)).assertTrue();
      expect(specialSet.has(-0)).assertTrue();
      expect(specialSet.size).assertEqual(3);
      expect(specialSet.delete(NaN)).assertTrue();
      expect(specialSet.has(NaN)).assertFalse();
    });
  });
}
