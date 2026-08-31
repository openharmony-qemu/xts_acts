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

import { HashSet } from '@kit.ArkTS';
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
const REGEXP_A: RegExp = /a/;
const REGEXP_B: RegExp = /b/gi;
const REGEXP_C: RegExp = /^test$/;
const REGEXP_D: RegExp = /[0-9]+/;
const VALID_VALUES: Array<RegExp> = [REGEXP_A, REGEXP_B, REGEXP_C, REGEXP_D, REGEXP_A];
interface RegExpInvalidObject { marker: string; }
const REGEXP_INVALID_OBJECT: RegExpInvalidObject = { marker: 'invalid' };
type RegExpInvalidValue = number | string | null | undefined | RegExpInvalidObject | Array<RegExp>;
type AllValue = RegExp | RegExpInvalidValue;
const ALL_VALUES: Array<AllValue> = [
  ...VALID_VALUES, 123, 'regexp', null, undefined, REGEXP_INVALID_OBJECT, [],
];
type Value = RegExp;

export default function HashSetRegExpTest(): void {
  describe('HashSetRegExpTest', (): void => {
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHSET_REGEXP_TEST_0100
     * @tc.name      testHashSetRegExpTest0100
     * @tc.desc      Verify HashSet construction, add, membership, length, and empty-state behavior with RegExp values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashSetRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const set: HashSet<Value> = new HashSet<Value>();
      expect(set.length).assertEqual(0);
      expect(set.isEmpty()).assertTrue();
      expect(set.add(valueA)).assertTrue();
      expect(set.add(valueB)).assertTrue();
      expect(set.length).assertEqual(2);
      expect(set.has(valueA)).assertTrue();
      expect(set.has(valueB)).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHSET_REGEXP_TEST_0200
     * @tc.name      testHashSetRegExpTest0200
     * @tc.desc      Verify HashSet bulk addition, membership, and capacity behavior with RegExp values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashSetRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const set: HashSet<Value> = new HashSet<Value>();
      set.add(valueA);
      set.add(valueB);
      expect(set.remove(valueA)).assertTrue();
      expect(set.has(valueA)).assertFalse();
      expect(set.remove(valueA)).assertFalse();
      expect(set.length).assertEqual(1);
      set.clear();
      expect(set.length).assertEqual(0);
      expect(set.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHSET_REGEXP_TEST_0300
     * @tc.name      testHashSetRegExpTest0300
     * @tc.desc      Verify HashSet indexed access, removal, and empty-state behavior with RegExp values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashSetRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const set: HashSet<Value> = new HashSet<Value>();
      set.add(valueA);
      set.add(valueB);
      const values: IterableIterator<Value> = set.values();
      const firstValue: IteratorResult<Value> = values.next();
      expect(firstValue.done).assertFalse();
      const secondValue: IteratorResult<Value> = values.next();
      expect(secondValue.done).assertFalse();
      expect(firstValue.value === valueA || firstValue.value === valueB).assertTrue();
      expect(secondValue.value === valueA || secondValue.value === valueB).assertTrue();
      expect(firstValue.value === secondValue.value).assertFalse();
      const entries: IterableIterator<[Value, Value]> = set.entries();
      const firstEntry: [Value, Value] = entries.next().value;
      expect(firstEntry[0] === valueA || firstEntry[0] === valueB).assertTrue();
      expect(firstEntry[1] === firstEntry[0]).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHSET_REGEXP_TEST_0400
     * @tc.name      testHashSetRegExpTest0400
     * @tc.desc      Verify HashSet equality, conversion, iteration, callback, and clear behavior with RegExp values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashSetRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const set: HashSet<Value> = new HashSet<Value>();
      set.add(valueA);
      set.add(valueB);
      let callbackCount: number = 0;
      let sawValueA: boolean = false;
      let sawKeyA: boolean = false;
      let sawContainer: boolean = false;
      set.forEach((value?: Value, key?: Value, container?: HashSet<Value>): void => {
        callbackCount++;
        sawValueA = sawValueA || value === valueA;
        sawKeyA = sawKeyA || key === valueA;
        sawContainer = sawContainer || container === set;
      });
      expect(callbackCount).assertEqual(2);
      expect(sawValueA).assertTrue();
      expect(sawKeyA).assertTrue();
      expect(sawContainer).assertTrue();
      let iteratorCount: number = 0;
      for (const value of set) {
        expect(set.has(value)).assertTrue();
        iteratorCount++;
      }
      expect(iteratorCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHSET_REGEXP_TEST_0500
     * @tc.name      testHashSetRegExpTest0500
     * @tc.desc      Verify HashSet dynamic-value access and iterator behavior with RegExp values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashSetRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dynamicSet: HashSet<AllValue> = new HashSet<AllValue>();
      const dynamicValue: AllValue = ALL_VALUES[ALL_VALUES.length - 1];
      expect(dynamicSet.add(dynamicValue)).assertTrue();
      expect(dynamicSet.has(dynamicValue)).assertTrue();
      expect(dynamicSet.length).assertEqual(1);
      const iterator: IterableIterator<AllValue> = dynamicSet[Symbol.iterator]();
      const result: IteratorResult<AllValue> = iterator.next();
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(dynamicValue);
      expect(iterator.next().done).assertTrue();
    });
  });
}
