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

import { HashMap } from '@kit.ArkTS';
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { SYMBOL_C } from '../../../../js/hashmap/SymbolValues';

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
type HashMapUnionItem = number | string | boolean | bigint | Object | UnionClassItem | Date |
  UnionFunctionItem | Map<string, number> | Set<number> | Array<number> | UnionObjectItem | RegExp;
type HashMapUnionAllValue = HashMapUnionItem | null | undefined;

const UNION_CLASS: UnionClassItem = new UnionClassItem(1, 'class');
const UNION_DATE: Date = new Date('2026-03-05');
const UNION_FUNCTION: UnionFunctionItem = (value: number): number => value + 1;
const UNION_MAP: Map<string, number> = new Map<string, number>();
UNION_MAP.set('map', 1);
const UNION_SET: Set<number> = new Set<number>([1]);
const UNION_ARRAY: Array<number> = [1, 2, 3];
const UNION_OBJECT: UnionObjectItem = { id: 1, label: 'object' };
const UNION_REGEXP: RegExp = /abc/gi;

const VALID_VALUES: Array<HashMapUnionItem> = [
  100, -99, 'test', true, 100n, SYMBOL_C, UNION_CLASS, UNION_DATE,
  UNION_FUNCTION, UNION_MAP, UNION_SET, UNION_ARRAY, UNION_OBJECT, UNION_REGEXP, 100,
];
const ALL_VALUES: Array<HashMapUnionAllValue> = [...VALID_VALUES, null, undefined];

type AllValue = HashMapUnionAllValue;
type Value = HashMapUnionItem;

export default function HashMapUnionTest(): void {
  describe('HashMapUnionTest', (): void => {
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_UNION_TEST_0100
     * @tc.name      testHashMapUnionTest0100
     * @tc.desc      Verify HashMap construction, set, get, length, and empty-state behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      expect(map.length).assertEqual(0);
      expect(map.isEmpty()).assertTrue();

      const setResult: Object = map.set(valueA, valueB);
      expect(setResult).assertEqual(map);
      expect(map.length).assertEqual(1);
      expect(map.get(valueA)).assertEqual(valueB);
      expect(map.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_UNION_TEST_0200
     * @tc.name      testHashMapUnionTest0200
     * @tc.desc      Verify HashMap key and value lookup behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      map.set(valueA, valueB);

      expect(map.hasKey(valueA)).assertTrue();
      expect(map.hasValue(valueB)).assertTrue();
      expect(map.get(valueA)).assertEqual(valueB);
      expect(map.hasKey(valueB)).assertFalse();
      expect(map.get(valueB)).assertEqual(undefined);
      expect(map.hasValue(valueA)).assertFalse();
      expect(map.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_UNION_TEST_0300
     * @tc.name      testHashMapUnionTest0300
     * @tc.desc      Verify HashMap update, replacement, removal, and missing-entry behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const valueC: Value = VALID_VALUES[2];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      const source: HashMap<Value, Value> = new HashMap<Value, Value>();

      map.set(valueA, valueB);
      const duplicateResult: Object = map.set(valueA, valueC);
      expect(duplicateResult).assertEqual(map);
      expect(map.length).assertEqual(1);
      expect(map.get(valueA)).assertEqual(valueC);

      source.set(valueB, valueA);
      map.setAll(source);
      expect(map.length).assertEqual(2);
      expect(map.hasKey(valueB)).assertTrue();
      expect(map.replace(valueB, valueC)).assertTrue();
      expect(map.get(valueB)).assertEqual(valueC);

      const removed: Value = map.remove(valueA);
      expect(removed).assertEqual(valueC);
      expect(map.length).assertEqual(1);
      expect(map.remove(valueA)).assertEqual(undefined);
      expect(map.replace(valueA, valueB)).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_UNION_TEST_0400
     * @tc.name      testHashMapUnionTest0400
     * @tc.desc      Verify HashMap keys, values, and entries iteration behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      map.set(valueA, valueB);
      map.set(valueB, valueA);

      let keyCount: number = 0;
      let sawKeyA: boolean = false;
      let sawKeyB: boolean = false;
      for (const key of map.keys()) {
        sawKeyA = sawKeyA || key === valueA;
        sawKeyB = sawKeyB || key === valueB;
        keyCount++;
      }
      expect(keyCount).assertEqual(2);
      expect(sawKeyA).assertTrue();
      expect(sawKeyB).assertTrue();

      let valueCount: number = 0;
      let sawValueA: boolean = false;
      let sawValueB: boolean = false;
      for (const value of map.values()) {
        sawValueA = sawValueA || value === valueA;
        sawValueB = sawValueB || value === valueB;
        valueCount++;
      }
      expect(valueCount).assertEqual(2);
      expect(sawValueA).assertTrue();
      expect(sawValueB).assertTrue();

      let entryCount: number = 0;
      let sawEntryAB: boolean = false;
      let sawEntryBA: boolean = false;
      for (const entry of map.entries()) {
        sawEntryAB = sawEntryAB || (entry[0] === valueA && entry[1] === valueB);
        sawEntryBA = sawEntryBA || (entry[0] === valueB && entry[1] === valueA);
        entryCount++;
      }
      expect(entryCount).assertEqual(2);
      expect(sawEntryAB).assertTrue();
      expect(sawEntryBA).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_UNION_TEST_0500
     * @tc.name      testHashMapUnionTest0500
     * @tc.desc      Verify HashMap forEach callback and iterator behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      map.set(valueA, valueB);
      map.set(valueB, valueA);

      let callbackCount: number = 0;
      let sawCallbackAB: boolean = false;
      let sawCallbackBA: boolean = false;
      let callbackMap: HashMap<Value, Value> | undefined = undefined;
      map.forEach((value?: Value, key?: Value, container?: HashMap<Value, Value>): void => {
        callbackCount++;
        sawCallbackAB = sawCallbackAB || (key === valueA && value === valueB);
        sawCallbackBA = sawCallbackBA || (key === valueB && value === valueA);
        callbackMap = container;
      });

      expect(callbackCount).assertEqual(2);
      expect(sawCallbackAB).assertTrue();
      expect(sawCallbackBA).assertTrue();
      expect(callbackMap).assertEqual(map);

      let iteratorCount: number = 0;
      let sawIteratorAB: boolean = false;
      let sawIteratorBA: boolean = false;
      for (const entry of map) {
        sawIteratorAB = sawIteratorAB || (entry[0] === valueA && entry[1] === valueB);
        sawIteratorBA = sawIteratorBA || (entry[0] === valueB && entry[1] === valueA);
        iteratorCount++;
      }
      expect(iteratorCount).assertEqual(2);
      expect(sawIteratorAB).assertTrue();
      expect(sawIteratorBA).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_UNION_TEST_0600
     * @tc.name      testHashMapUnionTest0600
     * @tc.desc      Verify HashMap Symbol.iterator, clear, and dynamic-value behavior with Union values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      map.set(valueA, valueB);
      const iterator: IterableIterator<[Value, Value]> = map[Symbol.iterator]();
      const firstEntryResult: IteratorResult<[Value, Value]> = iterator.next();
      const firstEntry: [Value, Value] = firstEntryResult.value;
      expect(firstEntryResult.done).assertFalse();
      expect(firstEntry[0]).assertEqual(valueA);
      expect(firstEntry[1]).assertEqual(valueB);
      expect(iterator.next().done).assertTrue();

      map.clear();
      expect(map.length).assertEqual(0);
      expect(map.isEmpty()).assertTrue();

      const dynamicMap: HashMap<AllValue, AllValue> = new HashMap<AllValue, AllValue>();
      const dynamicKey: AllValue = VALID_VALUES[0];
      const dynamicValue: AllValue = ALL_VALUES[ALL_VALUES.length - 1];
      dynamicMap.set(dynamicKey, dynamicValue);
      expect(dynamicMap.hasKey(dynamicKey)).assertTrue();
      expect(dynamicMap.hasValue(dynamicValue)).assertTrue();
      const dynamicResult: AllValue = dynamicMap.get(dynamicKey);
      expect(dynamicResult).assertEqual(dynamicValue);
    });
  });
}
