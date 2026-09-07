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

import { LightWeightSet } from '@kit.ArkTS';
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

export default function LightWeightSetSymbolTest(): void {
  describe('LightWeightSetSymbolTest', (): void => {
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_SYMBOL_TEST_0100
     * @tc.name      testLightWeightSetSymbolTest0100
     * @tc.desc      Verify LightWeightSet construction, add, membership, length, and empty-state behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightSetSymbolTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const set: LightWeightSet<Value> = new LightWeightSet<Value>();
      expect(set.length).assertEqual(0);
      expect(set.isEmpty()).assertTrue();
      expect(set.add(valueA)).assertTrue();
      expect(set.add(valueA)).assertFalse();
      expect(set.add(valueB)).assertTrue();
      expect(set.length).assertEqual(2);
      expect(set.has(valueA)).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_SYMBOL_TEST_0200
     * @tc.name      testLightWeightSetSymbolTest0200
     * @tc.desc      Verify LightWeightSet bulk addition, membership, and capacity behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightSetSymbolTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const valueC: Value = VALID_VALUES[2];
      const set: LightWeightSet<Value> = new LightWeightSet<Value>();
      const source: LightWeightSet<Value> = new LightWeightSet<Value>();
      source.add(valueA);
      source.add(valueB);
      set.add(valueC);
      expect(set.addAll(source)).assertTrue();
      expect(set.length).assertEqual(3);
      expect(set.hasAll(source)).assertTrue();
      set.increaseCapacityTo(16);
      expect(set.has(valueC)).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_SYMBOL_TEST_0300
     * @tc.name      testLightWeightSetSymbolTest0300
     * @tc.desc      Verify LightWeightSet indexed access, removal, and empty-state behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightSetSymbolTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const set: LightWeightSet<Value> = new LightWeightSet<Value>();
      set.add(valueA);
      set.add(valueB);
      const valueAIndex: number = set.getIndexOf(valueA);
      const valueBIndex: number = set.getIndexOf(valueB);
      expect(valueAIndex >= 0 && valueAIndex < set.length).assertTrue();
      expect(valueBIndex >= 0 && valueBIndex < set.length).assertTrue();
      expect(valueAIndex !== valueBIndex).assertTrue();
      expect(set.getValueAt(valueAIndex) === valueA).assertTrue();
      expect(set.getValueAt(valueBIndex) === valueB).assertTrue();
      expect(set.remove(valueA) === valueA).assertTrue();
      expect(set.removeAt(0)).assertTrue();
      expect(set.length).assertEqual(0);
      expect(set.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_SYMBOL_TEST_0400
     * @tc.name      testLightWeightSetSymbolTest0400
     * @tc.desc      Verify LightWeightSet equality, conversion, iteration, callback, and clear behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightSetSymbolTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueA: Value = VALID_VALUES[0];
      const valueB: Value = VALID_VALUES[1];
      const set: LightWeightSet<Value> = new LightWeightSet<Value>();
      set.add(valueA);
      set.add(valueB);
      const comparisonArray: Array<Value> = [valueA, valueB];
      expect(set.equal(comparisonArray)).assertFalse();
      const array: Array<Value> = set.toArray();
      expect(array.length).assertEqual(2);
      const arrayFirst: Value = array[0];
      const arraySecond: Value = array[1];
      expect(arrayFirst === valueA || arrayFirst === valueB).assertTrue();
      expect(arraySecond === valueA || arraySecond === valueB).assertTrue();
      expect(arrayFirst !== arraySecond).assertTrue();
      const values: IterableIterator<Value> = set.values();
      const firstValue: Value = values.next().value;
      const secondValue: Value = values.next().value;
      expect(firstValue === valueA || firstValue === valueB).assertTrue();
      expect(secondValue === valueA || secondValue === valueB).assertTrue();
      expect(firstValue !== secondValue).assertTrue();
      const entries: IterableIterator<[Value, Value]> = set.entries();
      const firstEntry: [Value, Value] = entries.next().value;
      const secondEntry: [Value, Value] = entries.next().value;
      expect(firstEntry[0] === firstEntry[1]).assertTrue();
      expect(secondEntry[0] === secondEntry[1]).assertTrue();
      expect(firstEntry[0] === valueA || firstEntry[0] === valueB).assertTrue();
      expect(secondEntry[0] === valueA || secondEntry[0] === valueB).assertTrue();
      let callbackCount: number = 0;
      set.forEach((value?: Value): void => {
        callbackCount++;
        expect(value === undefined).assertFalse();
      });
      expect(callbackCount).assertEqual(2);
      let iteratorCount: number = 0;
      for (const value of set) {
        expect(set.has(value)).assertTrue();
        iteratorCount++;
      }
      expect(iteratorCount).assertEqual(2);
      set.clear();
      expect(set.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_SYMBOL_TEST_0500
     * @tc.name      testLightWeightSetSymbolTest0500
     * @tc.desc      Verify LightWeightSet dynamic-value access and iterator behavior with Symbol values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightSetSymbolTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dynamicSet: LightWeightSet<AllValue> = new LightWeightSet<AllValue>();
      const dynamicValue: AllValue = ALL_VALUES[ALL_VALUES.length - 1];
      expect(dynamicSet.add(dynamicValue)).assertTrue();
      expect(dynamicSet.has(dynamicValue)).assertTrue();
      expect(dynamicSet.getValueAt(0)).assertEqual(dynamicValue);
      const iterator: IterableIterator<AllValue> = dynamicSet[Symbol.iterator]();
      expect(iterator.next().value).assertEqual(dynamicValue);
      expect(iterator.next().done).assertTrue();
    });
  });
}
