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

import { LightWeightMap } from '@kit.ArkTS';
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { SYMBOL_A, SYMBOL_B, SYMBOL_C, SYMBOL_D, SYMBOL_E } from '../../../../js/hashmap/SymbolValues';

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

export default function LightWeightMapSymbolTest(): void {
  describe('LightWeightMapSymbolTest', (): void => {
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_SYMBOL_TEST_0100
     * @tc.name      testLightWeightMapSymbolTest0100
     * @tc.desc      Verify LightWeightMap construction, set, get, length, and empty-state behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapSymbolTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyA: Value = VALID_VALUES[0];
      const valueA: Value = VALID_VALUES[1];
      const map: LightWeightMap<Value, Value> = new LightWeightMap<Value, Value>();
      expect(map.length).assertEqual(0);
      expect(map.isEmpty()).assertTrue();
      const result: Object = map.set(keyA, valueA);
      expect(typeof result).assertEqual('object');
      expect(map.length).assertEqual(1);
      expect(map.hasKey(keyA)).assertTrue();
      expect(map.hasValue(valueA)).assertTrue();
      expect(map.get(keyA)).assertEqual(valueA);
      expect(map.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_SYMBOL_TEST_0200
     * @tc.name      testLightWeightMapSymbolTest0200
     * @tc.desc      Verify LightWeightMap key and value lookup behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapSymbolTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyA: Value = VALID_VALUES[0];
      const keyB: Value = VALID_VALUES[1];
      const valueA: Value = VALID_VALUES[2];
      const map: LightWeightMap<Value, Value> = new LightWeightMap<Value, Value>();
      const source: LightWeightMap<Value, Value> = new LightWeightMap<Value, Value>();
      map.set(keyA, valueA);
      source.set(keyB, keyA);
      map.setAll(source);
      expect(map.hasAll(source)).assertTrue();
      const keyAIndex: number = map.getIndexOfKey(keyA);
      const keyBIndex: number = map.getIndexOfKey(keyB);
      const valueAIndex: number = map.getIndexOfValue(valueA);
      const keyAValueIndex: number = map.getIndexOfValue(keyA);
      expect(keyAIndex >= 0 && keyAIndex < map.length).assertTrue();
      expect(keyBIndex >= 0 && keyBIndex < map.length).assertTrue();
      expect(keyAIndex !== keyBIndex).assertTrue();
      expect(valueAIndex).assertEqual(keyAIndex);
      expect(keyAValueIndex).assertEqual(keyBIndex);
      expect(map.getKeyAt(keyAIndex) === keyA).assertTrue();
      expect(map.getValueAt(keyAIndex) === valueA).assertTrue();
      expect(map.getKeyAt(keyBIndex) === keyB).assertTrue();
      expect(map.getValueAt(keyBIndex) === keyA).assertTrue();
      map.increaseCapacityTo(16);
      expect(map.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_SYMBOL_TEST_0300
     * @tc.name      testLightWeightMapSymbolTest0300
     * @tc.desc      Verify LightWeightMap update, replacement, removal, and missing-entry behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapSymbolTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyA: Value = VALID_VALUES[0];
      const keyB: Value = VALID_VALUES[1];
      const valueA: Value = VALID_VALUES[2];
      const valueB: Value = VALID_VALUES[3];
      const map: LightWeightMap<Value, Value> = new LightWeightMap<Value, Value>();
      map.set(keyA, valueA);
      map.set(keyB, valueB);
      const keys: IterableIterator<Value> = map.keys();
      const firstKey: Value = keys.next().value;
      const secondKey: Value = keys.next().value;
      expect(firstKey === keyA || firstKey === keyB).assertTrue();
      expect(secondKey === keyA || secondKey === keyB).assertTrue();
      expect(firstKey !== secondKey).assertTrue();
      const values: IterableIterator<Value> = map.values();
      const firstValue: Value = values.next().value;
      const secondValue: Value = values.next().value;
      const entries: IterableIterator<[Value, Value]> = map.entries();
      const firstEntry: [Value, Value] = entries.next().value;
      const secondEntry: [Value, Value] = entries.next().value;
      expect(firstEntry[0] === firstKey).assertTrue();
      expect(firstEntry[1] === firstValue).assertTrue();
      expect(secondEntry[0] === secondKey).assertTrue();
      expect(secondEntry[1] === secondValue).assertTrue();
      const iterator: IterableIterator<[Value, Value]> = map[Symbol.iterator]();
      const iteratorEntry: [Value, Value] = iterator.next().value;
      expect(iteratorEntry[0] === firstEntry[0]).assertTrue();
      expect(iteratorEntry[1] === firstEntry[1]).assertTrue();
      expect(iterator.next().done).assertFalse();
      let callbackCount: number = 0;
      let sawContainer: boolean = false;
      map.forEach((value?: Value, key?: Value, container?: LightWeightMap<Value, Value>): void => {
        callbackCount++;
        expect(map.hasKey(key as Value)).assertTrue();
        expect(value === undefined).assertFalse();
        sawContainer = sawContainer || container === map;
      });
      expect(callbackCount).assertEqual(2);
      expect(sawContainer).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_SYMBOL_TEST_0400
     * @tc.name      testLightWeightMapSymbolTest0400
     * @tc.desc      Verify LightWeightMap keys, values, and entries iteration behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapSymbolTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyA: Value = VALID_VALUES[0];
      const keyB: Value = VALID_VALUES[1];
      const valueA: Value = VALID_VALUES[2];
      const valueB: Value = VALID_VALUES[3];
      const map: LightWeightMap<Value, Value> = new LightWeightMap<Value, Value>();
      map.set(keyA, valueA);
      map.set(keyB, valueB);
      expect(map.setValueAt(0, valueA)).assertTrue();
      expect(map.getValueAt(0) === valueA).assertTrue();
      expect(map.remove(keyA) === valueA).assertTrue();
      expect(map.removeAt(0)).assertTrue();
      expect(map.length).assertEqual(0);
      map.clear();
      expect(map.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_SYMBOL_TEST_0500
     * @tc.name      testLightWeightMapSymbolTest0500
     * @tc.desc      Verify LightWeightMap forEach callback and iterator behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapSymbolTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dynamicMap: LightWeightMap<AllValue, AllValue> = new LightWeightMap<AllValue, AllValue>();
      const dynamicKey: AllValue = ALL_VALUES[ALL_VALUES.length - 1];
      const dynamicValue: AllValue = ALL_VALUES[ALL_VALUES.length - 2];
      dynamicMap.set(dynamicKey, dynamicValue);
      expect(dynamicMap.hasKey(dynamicKey)).assertTrue();
      expect(dynamicMap.hasValue(dynamicValue)).assertTrue();
      expect(dynamicMap.get(dynamicKey)).assertEqual(dynamicValue);
      const iterator: IterableIterator<[AllValue, AllValue]> = dynamicMap[Symbol.iterator]();
      expect(iterator.next().value[0]).assertEqual(dynamicKey);
      expect(iterator.next().done).assertTrue();
    });
  });
}
