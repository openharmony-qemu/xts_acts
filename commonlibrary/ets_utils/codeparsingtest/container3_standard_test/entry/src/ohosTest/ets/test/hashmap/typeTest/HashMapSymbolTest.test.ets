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
import {
  SYMBOL_A,
  SYMBOL_B,
  SYMBOL_C,
  SYMBOL_D,
  SYMBOL_E,
  SYMBOL_F,
  SYMBOL_KEY_FOR_RESULT,
} from '../../../../js/hashmap/SymbolValues';

interface SymbolInvalidObject { marker: string; }
const SYMBOL_INVALID_OBJECT: SymbolInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<Object> = [
  SYMBOL_A, SYMBOL_B, SYMBOL_C, SYMBOL_D, SYMBOL_E, SYMBOL_F, SYMBOL_A,
];
type HashMapSymbolInvalidValue =
  string | number | null | undefined | SymbolInvalidObject | Array<Object>;
type HashMapSymbolItem = Object;
type HashMapSymbolAllValue = HashMapSymbolItem | HashMapSymbolInvalidValue;
const ALL_VALUES: Array<HashMapSymbolAllValue> = [
  ...VALID_VALUES, 'Symbol', 123, null, undefined, SYMBOL_INVALID_OBJECT, [],
  SYMBOL_KEY_FOR_RESULT,
];

type AllValue = HashMapSymbolAllValue;
type Value = HashMapSymbolItem;

export default function HashMapSymbolTest(): void {
  describe('HashMapSymbolTest', (): void => {
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_SYMBOL_TEST_0100
     * @tc.name      testHashMapSymbolTest0100
     * @tc.desc      Verify HashMap construction, set, get, length, and empty-state behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapSymbolTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const symbolValue: Value = VALID_VALUES[0];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      expect(map.length).assertEqual(0);
      expect(map.isEmpty()).assertTrue();

      const setResult: Object = map.set(symbolValue, symbolValue);
      expect(setResult).assertEqual(map);
      expect(map.hasKey(symbolValue)).assertTrue();
      expect(map.get(symbolValue)).assertEqual(symbolValue);
      expect(map.length).assertEqual(1);
      expect(map.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_SYMBOL_TEST_0200
     * @tc.name      testHashMapSymbolTest0200
     * @tc.desc      Verify HashMap key and value lookup behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapSymbolTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const symbolValue: Value = VALID_VALUES[0];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      map.set(symbolValue, symbolValue);

      expect(map.hasKey(symbolValue)).assertTrue();
      expect(map.hasValue(symbolValue)).assertTrue();
      expect(map.get(symbolValue)).assertEqual(symbolValue);
      expect(map.length).assertEqual(1);
      expect(map.isEmpty()).assertFalse();
      expect(map.hasKey(VALID_VALUES[1])).assertFalse();
      expect(map.get(VALID_VALUES[1])).assertEqual(undefined);
      expect(map.hasValue(VALID_VALUES[1])).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_SYMBOL_TEST_0300
     * @tc.name      testHashMapSymbolTest0300
     * @tc.desc      Verify HashMap update, replacement, removal, and missing-entry behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapSymbolTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const symbolValue: Value = VALID_VALUES[0];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      const source: HashMap<Value, Value> = new HashMap<Value, Value>();

      map.set(symbolValue, symbolValue);
      const duplicateResult: Object = map.set(symbolValue, symbolValue);
      expect(duplicateResult).assertEqual(map);
      expect(map.length).assertEqual(1);

      source.set(symbolValue, symbolValue);
      map.setAll(source);
      expect(map.length).assertEqual(1);
      expect(map.replace(symbolValue, symbolValue)).assertTrue();
      expect(map.get(symbolValue)).assertEqual(symbolValue);

      expect(map.remove(symbolValue)).assertEqual(symbolValue);
      expect(map.length).assertEqual(0);
      expect(map.remove(symbolValue)).assertEqual(undefined);
      expect(map.replace(symbolValue, symbolValue)).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_SYMBOL_TEST_0400
     * @tc.name      testHashMapSymbolTest0400
     * @tc.desc      Verify HashMap keys, values, and entries iteration behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapSymbolTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const symbolValue: Value = VALID_VALUES[0];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      map.set(symbolValue, symbolValue);

      const keyIterator: IterableIterator<Value> = map.keys();
      const keyResult: IteratorResult<Value> = keyIterator.next();
      expect(keyResult.done).assertFalse();
      expect(keyResult.value).assertEqual(symbolValue);
      expect(keyIterator.next().done).assertTrue();

      const valueIterator: IterableIterator<Value> = map.values();
      const valueResult: IteratorResult<Value> = valueIterator.next();
      expect(valueResult.value).assertEqual(symbolValue);
      expect(valueIterator.next().done).assertTrue();

      const entryIterator: IterableIterator<[Value, Value]> = map.entries();
      const entryResult: IteratorResult<[Value, Value]> = entryIterator.next();
      expect(entryResult.value[0]).assertEqual(symbolValue);
      expect(entryResult.value[1]).assertEqual(symbolValue);
      expect(entryIterator.next().done).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_SYMBOL_TEST_0500
     * @tc.name      testHashMapSymbolTest0500
     * @tc.desc      Verify HashMap forEach callback and iterator behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapSymbolTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const symbolValue: Value = VALID_VALUES[0];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      map.set(symbolValue, symbolValue);

      let callbackCount: number = 0;
      let callbackMap: HashMap<Value, Value> | undefined = undefined;
      map.forEach((value?: Value, key?: Value, container?: HashMap<Value, Value>): void => {
        callbackCount++;
        expect(key).assertEqual(symbolValue);
        expect(value).assertEqual(symbolValue);
        callbackMap = container;
      });

      expect(callbackCount).assertEqual(1);
      expect(callbackMap).assertEqual(map);

      let iteratorCount: number = 0;
      for (const entry of map) {
        expect(entry[0]).assertEqual(symbolValue);
        expect(entry[1]).assertEqual(symbolValue);
        iteratorCount++;
      }
      expect(iteratorCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_SYMBOL_TEST_0600
     * @tc.name      testHashMapSymbolTest0600
     * @tc.desc      Verify HashMap Symbol.iterator, clear, and dynamic-value behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHashMapSymbolTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const symbolValue: Value = VALID_VALUES[0];
      const map: HashMap<Value, Value> = new HashMap<Value, Value>();
      map.set(symbolValue, symbolValue);

      const iterator: IterableIterator<[Value, Value]> = map[Symbol.iterator]();
      const entryResult: IteratorResult<[Value, Value]> = iterator.next();
      expect(entryResult.done).assertFalse();
      expect(entryResult.value[0]).assertEqual(symbolValue);
      expect(entryResult.value[1]).assertEqual(symbolValue);
      expect(iterator.next().done).assertTrue();

      map.clear();
      expect(map.length).assertEqual(0);
      expect(map.isEmpty()).assertTrue();

      const dynamicMap: HashMap<AllValue, AllValue> = new HashMap<AllValue, AllValue>();
      const dynamicKey: AllValue = VALID_VALUES[1];
      const dynamicValue: AllValue = ALL_VALUES[ALL_VALUES.length - 1];
      dynamicMap.set(dynamicKey, dynamicValue);
      expect(dynamicMap.hasKey(dynamicKey)).assertTrue();
      expect(dynamicMap.hasValue(dynamicValue)).assertTrue();
      expect(dynamicMap.get(dynamicKey)).assertEqual(dynamicValue);
    });
  });
}
