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

const VALID_VALUES: Array<bigint> = [
  100n, -99n, BigInt('9007199254740991'), BigInt(Number.MAX_SAFE_INTEGER), 9007199254740991n,
  -9007199254740991n, 0n, BigInt('0'), BigInt('123456789012345678901234567890'),
  BigInt('138001380001234567890'), BigInt('100000000000000000000000'), -1n,
];

interface BigIntInvalidObject { marker: string; }
const BIGINT_INVALID_OBJECT: BigIntInvalidObject = { marker: 'invalid' };
type BigIntInvalidValue = number | string | null | undefined | BigIntInvalidObject;
type BigIntAllValue = bigint | BigIntInvalidValue;
const ALL_VALUES: Array<BigIntAllValue> = [
  ...VALID_VALUES, 100, '100n', null, undefined, BIGINT_INVALID_OBJECT, NaN, Infinity,
];

export default function setBigIntTest() {
  describe('SetBigIntTest', () => {
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
     * @tc.name testSetBigIntTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BIGINT_TEST_0100
     * @tc.desc Verify Set size and constructor overloads with BigInt dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBigIntTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const emptySet: Set<bigint> = new Set<bigint>();
      expect(emptySet.size).assertEqual(0);

      const constructed: Set<bigint> = new Set<bigint>(values);
      expect(constructed.has(values[0])).assertTrue();
      expect(constructed.has(values[1])).assertTrue();
      expect(constructed.size).assertLargerOrEqual(2);

      const duplicateSet: Set<bigint> = new Set<bigint>([values[0], values[0], values[1]]);
      expect(duplicateSet.size).assertEqual(2);
      expect(duplicateSet.has(values[0])).assertTrue();
      expect(duplicateSet.has(values[1])).assertTrue();
    });

    /**
     * @tc.name testSetBigIntTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BIGINT_TEST_0200
     * @tc.desc Verify Set add and has semantics with BigInt dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBigIntTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const set: Set<bigint> = new Set<bigint>();
      const addResult: Set<bigint> = set.add(values[0]);
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
     * @tc.name testSetBigIntTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BIGINT_TEST_0300
     * @tc.desc Verify Set delete, clear and size transitions with BigInt dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBigIntTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const set: Set<bigint> = new Set<bigint>([values[0], values[1]]);
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
     * @tc.name testSetBigIntTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BIGINT_TEST_0400
     * @tc.desc Verify Set entries, keys and values iteration order with BigInt dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBigIntTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const set: Set<bigint> = new Set<bigint>([values[0], values[1]]);

      const entryItem: IteratorResult<[bigint, bigint]> = set.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[0]);

      const keyItem: IteratorResult<bigint> = set.keys().next();
      expect(keyItem.done).assertFalse();
      expect(keyItem.value).assertEqual(values[0]);

      const valueItem: IteratorResult<bigint> = set.values().next();
      expect(valueItem.done).assertFalse();
      expect(valueItem.value).assertEqual(values[0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetBigIntTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BIGINT_TEST_0500
     * @tc.desc Verify Set forEach callback values, keys and container with BigInt dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBigIntTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const set: Set<bigint> = new Set<bigint>([values[0], values[1]]);
      let callbackCount: number = 0;
      let firstValue: bigint = values[0];
      let lastKey: bigint = values[0];
      let callbackContainer: Set<bigint> = set;

      set.forEach((value: bigint, key: bigint, owner: Set<bigint>): void => {
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
     * @tc.name testSetBigIntTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BIGINT_TEST_0600
     * @tc.desc Verify Set Symbol.iterator and completion behavior with BigInt dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBigIntTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const set: Set<bigint> = new Set<bigint>([values[0], values[1]]);
      const iterator: Iterator<bigint> = set.values();
      const first: IteratorResult<bigint> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(values[0]);

      const second: IteratorResult<bigint> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(values[1]);

      const end: IteratorResult<bigint> = iterator.next();
      expect(end.done).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetBigIntTest0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BIGINT_TEST_0700
     * @tc.desc Verify dynamic and special Set inputs with BigInt values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBigIntTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const allValues: Array<BigIntAllValue> = ALL_VALUES;
      const dynamicSet: Set<BigIntAllValue> = new Set<BigIntAllValue>(allValues);
      expect(dynamicSet.has(allValues[0])).assertTrue();
      expect(dynamicSet.has(allValues[1])).assertTrue();
      expect(dynamicSet.has(allValues[VALID_VALUES.length])).assertTrue();
      expect(dynamicSet.size).assertLargerOrEqual(VALID_VALUES.length - 1);

      const added: Set<BigIntAllValue> = dynamicSet.add(allValues[allValues.length - 1]);
      expect(added).assertEqual(dynamicSet);
      expect(dynamicSet.has(allValues[allValues.length - 1])).assertTrue();
      expect(values[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name testSetBigIntTest0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_BIGINT_TEST_0800
     * @tc.desc Verify Set identity and duplicate behavior for BigInt special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetBigIntTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const specialSet: Set<bigint> = new Set<bigint>([values[4], values[5], values[4]]);
      expect(specialSet.size).assertEqual(2);
      expect(specialSet.has(values[4])).assertTrue();
      expect(specialSet.has(values[5])).assertTrue();
      expect(specialSet.delete(values[4])).assertTrue();
      expect(specialSet.has(values[4])).assertFalse();
      expect(specialSet.size).assertEqual(1);
    });
  });
}
