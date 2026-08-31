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
import { SYMBOL_C } from '../../../js/hashmap/SymbolValues';

class UnionClassItem {
  id: number;
  label: string;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

interface UnionObjectItem { id: number; label: string; }
type UnionFunctionItem = (value: number) => number;
type UnionItem = number | string | boolean | bigint | Object | UnionClassItem | Date |
  UnionFunctionItem | Map<string, number> | Set<number> | Array<number> | UnionObjectItem | RegExp;
const UNION_CLASS: UnionClassItem = new UnionClassItem(1, 'class');
const UNION_DATE: Date = new Date('2026-03-05');
const UNION_FUNCTION: UnionFunctionItem = (value: number): number => value + 1;
const UNION_MAP: Map<string, number> = new Map<string, number>();
UNION_MAP.set('map', 1);
const UNION_SET: Set<number> = new Set<number>([1]);
const UNION_ARRAY: Array<number> = [1, 2, 3];
const UNION_OBJECT: UnionObjectItem = { id: 1, label: 'object' };
const UNION_REGEXP: RegExp = /abc/gi;
const VALID_VALUES: Array<UnionItem> = [
  100, -99, 'test', true, 100n, SYMBOL_C, UNION_CLASS, UNION_DATE,
  UNION_FUNCTION, UNION_MAP, UNION_SET, UNION_ARRAY, UNION_OBJECT, UNION_REGEXP,
];
type UnionInvalidValue = null | undefined;
type AllValue = UnionItem | UnionInvalidValue;
const ALL_VALUES: Array<AllValue> = [...VALID_VALUES, null, undefined];
type Value = UnionItem;

export default function HashSetUnionTest(): void {
  describe('HashSetUnionTest', (): void => {
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHSET_UNION_TEST_0100
     * @tc.name      testHashSetUnionTest0100
     * @tc.desc      Verify HashSet construction, add, membership, length, and empty-state behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashSetUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHSET_UNION_TEST_0200
     * @tc.name      testHashSetUnionTest0200
     * @tc.desc      Verify HashSet bulk addition, membership, and capacity behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashSetUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHSET_UNION_TEST_0300
     * @tc.name      testHashSetUnionTest0300
     * @tc.desc      Verify HashSet indexed access, removal, and empty-state behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashSetUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHSET_UNION_TEST_0400
     * @tc.name      testHashSetUnionTest0400
     * @tc.desc      Verify HashSet equality, conversion, iteration, callback, and clear behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashSetUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHSET_UNION_TEST_0500
     * @tc.name      testHashSetUnionTest0500
     * @tc.desc      Verify HashSet dynamic-value access and iterator behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashSetUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
