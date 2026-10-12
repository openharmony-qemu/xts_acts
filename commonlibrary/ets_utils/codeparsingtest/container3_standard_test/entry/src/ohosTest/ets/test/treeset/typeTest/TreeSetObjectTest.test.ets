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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium-dynamic';
interface ObjectItem {
  id: number;
  label: string;
  name?: string;
  age?: number;
}
const OBJECT_A: ObjectItem = { id: 1, label: 'object-a', name: 'a', age: 20 };
const OBJECT_B: ObjectItem = { id: 2, label: 'object-b', age: 0 };
const OBJECT_C: ObjectItem = { id: 3, label: 'object-c' };
const OBJECT_D: ObjectItem = { id: 4, label: '' };
const VALID_VALUES: Array<ObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_A];
interface ObjectInvalidObject { marker: string; }
const OBJECT_INVALID_OBJECT: ObjectInvalidObject = { marker: 'invalid' };
type ObjectInvalidValue = number | string | null | undefined | ObjectInvalidObject | Array<ObjectItem>;
type AllValue = ObjectItem | ObjectInvalidValue;
const ALL_VALUES: Array<AllValue> = [
  ...VALID_VALUES, 123, 'object', null, undefined, OBJECT_INVALID_OBJECT, [],
];
type Value = ObjectItem;
const compareValues = (first: Value, second: Value): boolean => {
  if (first === second) {
    return false;
  }
  return VALID_VALUES.indexOf(first) > VALID_VALUES.indexOf(second);
};

export default function TreeSetObjectTest(): void {
  describe('TreeSetObjectTest', (): void => {
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREESET_OBJECT_TEST_0100
     * @tc.name      testTreeSetObjectTest0100
     * @tc.desc      Verify TreeSet construction, add, membership, length, and empty-state behavior with Object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeSetObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREESET_OBJECT_TEST_0200
     * @tc.name      testTreeSetObjectTest0200
     * @tc.desc      Verify TreeSet bulk addition, membership, and capacity behavior with Object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeSetObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREESET_OBJECT_TEST_0300
     * @tc.name      testTreeSetObjectTest0300
     * @tc.desc      Verify TreeSet indexed access, removal, and empty-state behavior with Object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeSetObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREESET_OBJECT_TEST_0400
     * @tc.name      testTreeSetObjectTest0400
     * @tc.desc      Verify TreeSet equality, conversion, iteration, callback, and clear behavior with Object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeSetObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREESET_OBJECT_TEST_0500
     * @tc.name      testTreeSetObjectTest0500
     * @tc.desc      Verify TreeSet dynamic-value access and iterator behavior with Object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeSetObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
