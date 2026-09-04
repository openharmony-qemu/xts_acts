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
// ArrayContainsRetainAll.test.ets
// containsAll(Array), containsAll(BuiltinArray), retainAll(Array), retainAll(BuiltinArray), retainAll(predicate)

import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, BuiltinArray, lang } from '@kit.ArkTS';
import {
  getNumberTestValues,
  getStringTestValues,
  getBooleanTestValues,
  getAllTestValues,
  NumberTestValue,
  StringTestValue,
  BooleanTestValue,
  TestValueItem
} from './test_data/TestDataFactory';
import { TestHelper } from './test_utils/TestHelper';

export default function suite() {
  describe('ArrayContainsRetainAllTests', () => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    // ==================== containsAll(Array<T>) 类型遍历 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_TYPE_0100
     * @tc.name testContainsAllArrayType0001
     * @tc.desc Verify containsAll(Array) with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testContainsAllArrayType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsAllArrayType0001';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, item.value);
        let elements: collections.Array<number> = new collections.Array<number>(item.value);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr.at(0) as number)).assertTrue();
          expect(arr.containsAll(elements)).assertEqual(true);
        } else {
          expect(arr.containsAll(elements)).assertEqual(true);
        }
        let notFound: collections.Array<number> = new collections.Array<number>(item.value + 1);
        if (item.id === 'number_nan') {
          expect(arr.containsAll(notFound)).assertEqual(false);
        } else if (item.value === Infinity || item.value === -Infinity) {
          expect(arr.containsAll(notFound)).assertEqual(false);
        } else {
          expect(arr.containsAll(notFound)).assertEqual(false);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_TYPE_0200
     * @tc.name testContainsAllArrayType0002
     * @tc.desc Verify containsAll(Array) with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testContainsAllArrayType0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsAllArrayType0002';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, item.value);
        let elements: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.containsAll(elements)).assertEqual(true);
        let notFound: collections.Array<string> = new collections.Array<string>(item.value + '_x');
        expect(arr.containsAll(notFound)).assertEqual(false);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_TYPE_0300
     * @tc.name testContainsAllArrayType0003
     * @tc.desc Verify containsAll(Array) with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testContainsAllArrayType0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsAllArrayType0003';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, item.value);
        let elements: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr.containsAll(elements)).assertEqual(true);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_TYPE_0400
     * @tc.name testContainsAllArrayType0004
     * @tc.desc Verify containsAll(Array) with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testContainsAllArrayType0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsAllArrayType0004';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let elements: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr.containsAll(elements)).assertEqual(true);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== containsAll(BuiltinArray<T>) 类型遍历 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_TYPE_1100
     * @tc.name testContainsAllBuiltinType0011
     * @tc.desc Verify containsAll(BuiltinArray) with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testContainsAllBuiltinType0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsAllBuiltinType0011';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, item.value);
        let elements: BuiltinArray<number> = [item.value];
        if (item.id === 'number_nan') {
          expect(arr.containsAll(elements)).assertEqual(true);
        } else {
          expect(arr.containsAll(elements)).assertEqual(true);
        }
        let notFound: BuiltinArray<number> = [item.value + 1];
        expect(arr.containsAll(notFound)).assertEqual(false);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_TYPE_1200
     * @tc.name testContainsAllBuiltinType0012
     * @tc.desc Verify containsAll(BuiltinArray) with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testContainsAllBuiltinType0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsAllBuiltinType0012';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, item.value);
        let elements: BuiltinArray<string> = [item.value];
        expect(arr.containsAll(elements)).assertEqual(true);
        let notFound: BuiltinArray<string> = [item.value + '_x'];
        expect(arr.containsAll(notFound)).assertEqual(false);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_TYPE_1300
     * @tc.name testContainsAllBuiltinType0013
     * @tc.desc Verify containsAll(BuiltinArray) with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testContainsAllBuiltinType0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsAllBuiltinType0013';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, item.value);
        let elements: BuiltinArray<boolean> = [item.value];
        expect(arr.containsAll(elements)).assertEqual(true);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_TYPE_1400
     * @tc.name testContainsAllBuiltinType0014
     * @tc.desc Verify containsAll(BuiltinArray) with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testContainsAllBuiltinType0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsAllBuiltinType0014';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let elements: BuiltinArray<lang.ISendable> = [item.value];
          expect(arr.containsAll(elements)).assertEqual(true);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== retainAll(Array<T>) 类型遍历 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_TYPE_0100
     * @tc.name testRetainAllArrayType0001
     * @tc.desc Verify retainAll(Array) with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllArrayType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllArrayType0001';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, 999);
        let elements: collections.Array<number> = new collections.Array<number>(item.value);
        expect(arr.retainAll(elements)).assertEqual(true);
        expect(arr.length).assertEqual(1);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr.at(0) as number)).assertTrue();
        } else {
          expect(arr.at(0)).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_TYPE_0200
     * @tc.name testRetainAllArrayType0002
     * @tc.desc Verify retainAll(Array) with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllArrayType0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllArrayType0002';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, 'other');
        let elements: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.retainAll(elements)).assertEqual(true);
        expect(arr.length).assertEqual(1);
        expect(arr.at(0)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_TYPE_0300
     * @tc.name testRetainAllArrayType0003
     * @tc.desc Verify retainAll(Array) with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllArrayType0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllArrayType0003';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, !item.value);
        let elements: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr.retainAll(elements)).assertEqual(true);
        expect(arr.length).assertEqual(1);
        expect(arr.at(0)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_TYPE_0400
     * @tc.name testRetainAllArrayType0004
     * @tc.desc Verify retainAll(Array) with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllArrayType0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllArrayType0004';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let otherObj: lang.ISendable = new collections.Array<number>(0);
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value, otherObj);
          let elements: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr.retainAll(elements)).assertEqual(true);
          expect(arr.length).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== retainAll(BuiltinArray<T>) 类型遍历 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_TYPE_1100
     * @tc.name testRetainAllBuiltinType0011
     * @tc.desc Verify retainAll(BuiltinArray) with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllBuiltinType0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllBuiltinType0011';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, 999);
        let elements: BuiltinArray<number> = [item.value];
        expect(arr.retainAll(elements)).assertEqual(true);
        expect(arr.length).assertEqual(1);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr.at(0) as number)).assertTrue();
        } else {
          expect(arr.at(0)).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_TYPE_1200
     * @tc.name testRetainAllBuiltinType0012
     * @tc.desc Verify retainAll(BuiltinArray) with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllBuiltinType0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllBuiltinType0012';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, 'other');
        let elements: BuiltinArray<string> = [item.value];
        expect(arr.retainAll(elements)).assertEqual(true);
        expect(arr.length).assertEqual(1);
        expect(arr.at(0)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_TYPE_1300
     * @tc.name testRetainAllBuiltinType0013
     * @tc.desc Verify retainAll(BuiltinArray) with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllBuiltinType0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllBuiltinType0013';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, !item.value);
        let elements: BuiltinArray<boolean> = [item.value];
        expect(arr.retainAll(elements)).assertEqual(true);
        expect(arr.length).assertEqual(1);
        expect(arr.at(0)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_TYPE_1400
     * @tc.name testRetainAllBuiltinType0014
     * @tc.desc Verify retainAll(BuiltinArray) with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllBuiltinType0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllBuiltinType0014';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let otherObj: lang.ISendable = new collections.Array<number>(0);
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value, otherObj);
          let elements: BuiltinArray<lang.ISendable> = [item.value];
          expect(arr.retainAll(elements)).assertEqual(true);
          expect(arr.length).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== retainAll(predicate) 类型遍历 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PRED_TYPE_0100
     * @tc.name testRetainAllPredicateType0001
     * @tc.desc Verify retainAll(predicate) with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllPredicateType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllPredicateType0001';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, 999);
        let predicate: collections.ArrayElementPredicateFn<number> = (value: number): boolean => {
          return value === item.value;
        };
        expect(arr.retainAll(predicate)).assertEqual(true);
        expect(arr.length).assertEqual(1);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr.at(0) as number)).assertTrue();
        } else {
          expect(arr.at(0)).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PRED_TYPE_0200
     * @tc.name testRetainAllPredicateType0002
     * @tc.desc Verify retainAll(predicate) with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllPredicateType0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllPredicateType0002';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, 'other');
        let predicate: collections.ArrayElementPredicateFn<string> = (value: string): boolean => {
          return value === item.value;
        };
        expect(arr.retainAll(predicate)).assertEqual(true);
        expect(arr.length).assertEqual(1);
        expect(arr.at(0)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PRED_TYPE_0300
     * @tc.name testRetainAllPredicateType0003
     * @tc.desc Verify retainAll(predicate) with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllPredicateType0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllPredicateType0003';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, !item.value);
        let predicate: collections.ArrayElementPredicateFn<boolean> = (value: boolean): boolean => {
          return value === item.value;
        };
        expect(arr.retainAll(predicate)).assertEqual(true);
        expect(arr.length).assertEqual(1);
        expect(arr.at(0)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PRED_TYPE_0400
     * @tc.name testRetainAllPredicateType0004
     * @tc.desc Verify retainAll(predicate) with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRetainAllPredicateType0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRetainAllPredicateType0004';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let otherObj: lang.ISendable = new collections.Array<number>(0);
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value, otherObj);
          let targetValue: lang.ISendable = item.value;
          let predicate: collections.ArrayElementPredicateFn<lang.ISendable> = (value: lang.ISendable): boolean => {
            return value === targetValue;
          };
          expect(arr.retainAll(predicate)).assertEqual(true);
          expect(arr.length).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });
  });
}
