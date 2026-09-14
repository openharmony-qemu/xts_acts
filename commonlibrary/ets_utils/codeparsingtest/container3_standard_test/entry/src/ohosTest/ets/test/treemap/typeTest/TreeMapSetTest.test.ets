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

import { TreeMap } from '@kit.ArkTS';
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
const SET_A: Set<number> = new Set<number>([1]);
const SET_B: Set<number> = new Set<number>([2]);
const SET_C: Set<number> = new Set<number>([3]);
const SET_D: Set<number> = new Set<number>();
const VALID_VALUES: Array<Set<number>> = [SET_A, SET_B, SET_C, SET_D, SET_A];
interface SetInvalidObject { marker: string; }
const SET_INVALID_OBJECT: SetInvalidObject = { marker: 'invalid' };
type SetInvalidValue = string | number | null | undefined | SetInvalidObject | Array<Set<number>>;
type AllValue = Set<number> | SetInvalidValue;
const ALL_VALUES: Array<AllValue> = [
  ...VALID_VALUES, 'set', 123, null, undefined, SET_INVALID_OBJECT, [],
];
type Value = Set<number>;
const compareValues = (first: Value, second: Value): boolean => {
  if (first === second) {
    return false;
  }
  return VALID_VALUES.indexOf(first) > VALID_VALUES.indexOf(second);
};

export default function TreeMapSetTest(): void {
  describe('TreeMapSetTest', (): void => {
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREEMAP_SET_TEST_0100
     * @tc.name      testTreeMapSetTest0100
     * @tc.desc      Verify TreeMap construction, set, get, length, and empty-state behavior with Set values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeMapSetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyA: Value = VALID_VALUES[0];
      const keyB: Value = VALID_VALUES[1];
      const valueA: Value = VALID_VALUES[2];
      const map: TreeMap<Value, Value> = new TreeMap<Value, Value>(compareValues);
      expect(map.length).assertEqual(0);
      expect(map.isEmpty()).assertTrue();
      const result: Object = map.set(keyA, valueA);
      expect(result === map).assertTrue();
      expect(map.length).assertEqual(1);
      expect(map.hasKey(keyA)).assertTrue();
      expect(map.get(keyA)).assertEqual(valueA);
      expect(map.hasValue(valueA)).assertTrue();
      map.set(keyB, keyA);
      expect(map.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREEMAP_SET_TEST_0200
     * @tc.name      testTreeMapSetTest0200
     * @tc.desc      Verify TreeMap key and value lookup behavior with Set values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeMapSetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyA: Value = VALID_VALUES[0];
      const keyB: Value = VALID_VALUES[1];
      const valueA: Value = VALID_VALUES[2];
      const valueB: Value = VALID_VALUES[3];
      const map: TreeMap<Value, Value> = new TreeMap<Value, Value>(compareValues);
      map.set(keyA, valueA);
      map.set(keyB, valueB);
      expect(map.getFirstKey() === undefined).assertFalse();
      expect(map.getLastKey() === undefined).assertFalse();
      expect(map.hasKey(keyA)).assertTrue();
      expect(map.hasValue(valueB)).assertTrue();
      expect(map.get(keyB)).assertEqual(valueB);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREEMAP_SET_TEST_0300
     * @tc.name      testTreeMapSetTest0300
     * @tc.desc      Verify TreeMap update, replacement, removal, and missing-entry behavior with Set values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeMapSetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyA: Value = VALID_VALUES[0];
      const keyB: Value = VALID_VALUES[1];
      const valueA: Value = VALID_VALUES[1];
      const valueB: Value = VALID_VALUES[3];
      const map: TreeMap<Value, Value> = new TreeMap<Value, Value>(compareValues);
      const source: TreeMap<Value, Value> = new TreeMap<Value, Value>(compareValues);
      map.set(keyA, valueA);
      source.set(keyB, valueB);
      map.setAll(source);
      expect(map.hasKey(keyB)).assertTrue();
      expect(map.get(keyB)).assertEqual(valueB);
      expect(map.replace(keyB, valueA)).assertTrue();
      expect(map.get(keyB)).assertEqual(valueA);
      expect(map.remove(keyA)).assertEqual(valueA);
      expect(map.hasKey(keyA)).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREEMAP_SET_TEST_0400
     * @tc.name      testTreeMapSetTest0400
     * @tc.desc      Verify TreeMap keys, values, and entries iteration behavior with Set values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeMapSetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyA: Value = VALID_VALUES[0];
      const keyB: Value = VALID_VALUES[1];
      const valueA: Value = VALID_VALUES[2];
      const valueB: Value = VALID_VALUES[3];
      const map: TreeMap<Value, Value> = new TreeMap<Value, Value>(compareValues);
      map.set(keyA, valueA);
      map.set(keyB, valueB);
      const lower: Value = map.getLowerKey(keyB);
      const higher: Value = map.getHigherKey(keyB);
      const hasLower: boolean = lower !== undefined;
      const hasHigher: boolean = higher !== undefined;
      expect(hasLower !== hasHigher).assertTrue();
      if (hasLower) {
        expect(map.hasKey(lower)).assertTrue();
        expect(lower === keyA).assertTrue();
      }
      if (hasHigher) {
        expect(map.hasKey(higher)).assertTrue();
        expect(higher === keyA).assertTrue();
      }
      const keys: IterableIterator<Value> = map.keys();
      const firstKey: Value = keys.next().value;
      expect(firstKey === keyA || firstKey === keyB).assertTrue();
      const values: IterableIterator<Value> = map.values();
      const firstValue: Value = values.next().value;
      expect(firstValue === valueA || firstValue === valueB).assertTrue();
      const entries: IterableIterator<[Value, Value]> = map.entries();
      const entry: [Value, Value] = entries.next().value;
      expect(map.get(entry[0]) === entry[1]).assertTrue();
      let callbackCount: number = 0;
      map.forEach((value?: Value, key?: Value): void => {
        callbackCount++;
        expect(map.hasKey(key as Value)).assertTrue();
        expect(value === undefined).assertFalse();
      });
      expect(callbackCount).assertEqual(2);
      let iteratorCount: number = 0;
      for (const entryValue of map) {
        expect(map.hasKey(entryValue[0])).assertTrue();
        iteratorCount++;
      }
      expect(iteratorCount).assertEqual(2);
      const symbolIterator: IterableIterator<[Value, Value]> = map[Symbol.iterator]();
      const symbolEntry: [Value, Value] = symbolIterator.next().value;
      expect(map.hasKey(symbolEntry[0])).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TREEMAP_SET_TEST_0500
     * @tc.name      testTreeMapSetTest0500
     * @tc.desc      Verify TreeMap forEach callback and iterator behavior with Set values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTreeMapSetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: TreeMap<AllValue, AllValue> = new TreeMap<AllValue, AllValue>(
        (first: AllValue, second: AllValue): boolean => {
          if (first === second) {
            return false;
          }
          return ALL_VALUES.indexOf(first) > ALL_VALUES.indexOf(second);
        });
      const dynamicKey: AllValue = ALL_VALUES[ALL_VALUES.length - 1];
      const dynamicValue: AllValue = ALL_VALUES[ALL_VALUES.length - 2];
      map.set(dynamicKey, dynamicValue);
      expect(map.hasKey(dynamicKey)).assertTrue();
      expect(map.get(dynamicKey)).assertEqual(dynamicValue);
      expect(map.getFirstKey()).assertEqual(dynamicKey);
      map.clear();
      expect(map.length).assertEqual(0);
      expect(map.isEmpty()).assertTrue();
    });
  });
}
