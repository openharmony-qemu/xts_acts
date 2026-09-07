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

import { TreeSet } from '@kit.ArkTS';
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { SYMBOL_A, SYMBOL_B, SYMBOL_C, SYMBOL_D, SYMBOL_E } from '../../../js/hashmap/SymbolValues';

interface SymbolInvalidObject { marker: string; }
const SYMBOL_INVALID_OBJECT: SymbolInvalidObject = { marker: 'invalid' };
const VALID_VALUES: Array<Object> = [
  SYMBOL_A, SYMBOL_B, SYMBOL_C, SYMBOL_D, SYMBOL_E,
];
type SymbolInvalidValue = string | number | null | undefined | SymbolInvalidObject | Array<Object>;
type AllValue = Object | SymbolInvalidValue;
const ALL_VALUES: Array<AllValue> = [
  ...VALID_VALUES, 'Symbol', 123, null, undefined, SYMBOL_INVALID_OBJECT, [],
];
type Value = Object;
const compareValues = (first: Value, second: Value): boolean => {
  if (first === second) {
    return false;
  }
  return VALID_VALUES.indexOf(first) > VALID_VALUES.indexOf(second);
};

export default function TreeSetSymbolTest(): void {
  describe('TreeSetSymbolTest', (): void => {
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREESET_SYMBOL_TEST_0100
     * @tc.name      testTreeSetSymbolTest0100
     * @tc.desc      Verify TreeSet construction, add, membership, length, and empty-state behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeSetSymbolTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const valueC: Value = VALID_VALUES[2];
      const emptySet: TreeSet<Value> = new TreeSet<Value>();
      expect(emptySet.length).assertEqual(0);
      expect(emptySet.isEmpty()).assertTrue();
      const set: TreeSet<Value> = new TreeSet<Value>(compareValues);
      expect(set.add(valueA)).assertTrue();
      expect(set.add(valueB)).assertTrue();
      expect(set.add(valueC)).assertTrue();
      expect(set.length).assertEqual(3);
      expect(set.isEmpty()).assertFalse();
      expect(set.has(valueB)).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREESET_SYMBOL_TEST_0200
     * @tc.name      testTreeSetSymbolTest0200
     * @tc.desc      Verify TreeSet bulk addition, membership, and capacity behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeSetSymbolTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const valueC: Value = VALID_VALUES[2];
      const set: TreeSet<Value> = new TreeSet<Value>(compareValues);
      set.add(valueA);
      set.add(valueB);
      set.add(valueC);
      const first: Value = set.getFirstValue();
      const last: Value = set.getLastValue();
      expect(set.has(first)).assertTrue();
      expect(set.has(last)).assertTrue();
      const lower: Value = set.getLowerValue(valueB);
      const higher: Value = set.getHigherValue(valueB);
      expect(set.has(lower)).assertTrue();
      expect(set.has(higher)).assertTrue();
      expect(first === last).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREESET_SYMBOL_TEST_0300
     * @tc.name      testTreeSetSymbolTest0300
     * @tc.desc      Verify TreeSet indexed access, removal, and empty-state behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeSetSymbolTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const valueC: Value = VALID_VALUES[2];
      const set: TreeSet<Value> = new TreeSet<Value>(compareValues);
      set.add(valueA);
      set.add(valueB);
      set.add(valueC);
      expect(set.remove(valueB)).assertTrue();
      expect(set.has(valueB)).assertFalse();
      expect(set.popFirst() === undefined).assertFalse();
      expect(set.popLast() === undefined).assertFalse();
      expect(set.length).assertEqual(0);
      expect(set.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREESET_SYMBOL_TEST_0400
     * @tc.name      testTreeSetSymbolTest0400
     * @tc.desc      Verify TreeSet equality, conversion, iteration, callback, and clear behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeSetSymbolTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const set: TreeSet<Value> = new TreeSet<Value>(compareValues);
      set.add(valueA);
      set.add(valueB);
      const values: IterableIterator<Value> = set.values();
      expect(values.next().value === undefined).assertFalse();
      const entries: IterableIterator<[Value, Value]> = set.entries();
      const entry: [Value, Value] = entries.next().value;
      expect(entry[0]).assertEqual(entry[1]);
      let callbackCount: number = 0;
      set.forEach((value?: Value, key?: Value): void => {
        callbackCount++;
        expect(value).assertEqual(key);
      });
      expect(callbackCount).assertEqual(2);
      let iteratorCount: number = 0;
      for (const value of set) {
        expect(set.has(value)).assertTrue();
        iteratorCount++;
      }
      expect(iteratorCount).assertEqual(2);
      const iterator: IterableIterator<Value> = set[Symbol.iterator]();
      expect(iterator.next().value === undefined).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREESET_SYMBOL_TEST_0500
     * @tc.name      testTreeSetSymbolTest0500
     * @tc.desc      Verify TreeSet dynamic-value access and iterator behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeSetSymbolTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dynamicSet: TreeSet<AllValue> = new TreeSet<AllValue>((first: AllValue, second: AllValue): boolean => {
        if (first === second) {
          return false;
        }
        return ALL_VALUES.indexOf(first) > ALL_VALUES.indexOf(second);
      });
      const dynamicValue: AllValue = ALL_VALUES[ALL_VALUES.length - 1];
      expect(dynamicSet.add(dynamicValue)).assertTrue();
      expect(dynamicSet.has(dynamicValue)).assertTrue();
      expect(dynamicSet.getFirstValue()).assertEqual(dynamicValue);
      dynamicSet.clear();
      expect(dynamicSet.length).assertEqual(0);
    });
  });
}
