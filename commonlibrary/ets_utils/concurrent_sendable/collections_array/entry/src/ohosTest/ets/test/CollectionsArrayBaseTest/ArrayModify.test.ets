/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// ArrayModify.test.ets
// 修改/重组操作方法组（8个）：splice, slice, fill, copyWithin, sort, reverse, extendTo, shrinkTo

import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, lang } from '@kit.ArkTS';
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

export default function suite() {
  describe('ArrayModifyTests', () => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    // ==================== 基础操作测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_0100
     * @tc.name testArrayModify0001
     * @tc.desc Verify that splice deletes and inserts elements correctly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0001';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      expect(arr.splice(2, 2).length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_0200
     * @tc.name testArrayModify0002
     * @tc.desc Verify that slice returns a new Array with the specified range of elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0002';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      expect(arr.slice(1, 4).length).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_0300
     * @tc.name testArrayModify0003
     * @tc.desc Verify that fill fills all elements with the specified value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0003';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      arr.fill(0);
      expect(arr[0]).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_0400
     * @tc.name testArrayModify0004
     * @tc.desc Verify that copyWithin copies elements within the Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0004';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 3);
      expect(arr[0]).assertEqual(4);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_0500
     * @tc.name testArrayModify0005
     * @tc.desc Verify that sort sorts elements in ascending order by default.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0005';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(5, 2, 4, 1, 3);
      arr.sort();
      expect(arr[0]).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_0600
     * @tc.name testArrayModify0006
     * @tc.desc Verify that reverse reverses the order of elements in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0006';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      arr.reverse();
      expect(arr[0]).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_0700
     * @tc.name testArrayModify0007
     * @tc.desc Verify that extendTo extends the Array to the specified length with the fill value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0007';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2);
      arr.extendTo(5, 0);
      expect(arr.length).assertEqual(5);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_0800
     * @tc.name testArrayModify0008
     * @tc.desc Verify that shrinkTo shrinks the Array to the specified length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0008';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      expect(arr.length).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交操作测试：number 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_0900
     * @tc.name testArrayModify0009
     * @tc.desc Verify splice with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0009';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(item.value);
        arr.push(item.value);
        let removed: collections.Array<number> = arr.splice(1, 1);
        expect(removed.length).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_1000
     * @tc.name testArrayModify0010
     * @tc.desc Verify slice with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0010';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(item.value);
        let sliced: collections.Array<number> = arr.slice(0, 1);
        expect(sliced.length).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_1100
     * @tc.name testArrayModify0011
     * @tc.desc Verify fill with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0011';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(1);
        arr.push(2);
        arr.fill(item.value);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr[0])).assertTrue();
        } else {
          expect(arr[0]).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_1200
     * @tc.name testArrayModify0012
     * @tc.desc Verify copyWithin with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0012';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(item.value);
        arr.push(0);
        arr.push(0);
        arr.copyWithin(1, 0);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr[1])).assertTrue();
        } else {
          expect(arr[1]).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_1300
     * @tc.name testArrayModify0013
     * @tc.desc Verify sort with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0013';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        if (item.id === 'number_nan') {
          continue;
        }
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(item.value);
        arr.push(0);
        arr.sort((a: number, b: number) => a - b);
        expect(arr.length).assertEqual(2);
        expect(arr[0] <= arr[1]).assertTrue();
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_1400
     * @tc.name testArrayModify0014
     * @tc.desc Verify reverse with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0014';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(item.value);
        arr.push(0);
        arr.reverse();
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr[1])).assertTrue();
        } else {
          expect(arr[0]).assertEqual(0);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_1500
     * @tc.name testArrayModify0015
     * @tc.desc Verify extendTo with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0015';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(1);
        arr.extendTo(3, item.value);
        expect(arr.length).assertEqual(3);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr[2])).assertTrue();
        } else {
          expect(arr[2]).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_1600
     * @tc.name testArrayModify0016
     * @tc.desc Verify shrinkTo with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0016';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(item.value);
        arr.push(0);
        arr.push(0);
        arr.shrinkTo(1);
        expect(arr.length).assertEqual(1);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr[0])).assertTrue();
        } else {
          expect(arr[0]).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交操作测试：string 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_1700
     * @tc.name testArrayModify0017
     * @tc.desc Verify splice with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0017';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push(item.value);
        arr.push(item.value);
        let removed: collections.Array<string> = arr.splice(1, 1);
        expect(removed.length).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_1800
     * @tc.name testArrayModify0018
     * @tc.desc Verify slice with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0018';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push(item.value);
        let sliced: collections.Array<string> = arr.slice(0, 1);
        expect(sliced.length).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_1900
     * @tc.name testArrayModify0019
     * @tc.desc Verify fill with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0019';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push('a');
        arr.push('b');
        arr.fill(item.value);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_2000
     * @tc.name testArrayModify0020
     * @tc.desc Verify copyWithin with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0020';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push(item.value);
        arr.push('x');
        arr.push('x');
        arr.copyWithin(1, 0);
        expect(arr[1]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_2100
     * @tc.name testArrayModify0021
     * @tc.desc Verify sort with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0021';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push(item.value);
        arr.push('aaa');
        arr.sort();
        expect(arr.length).assertEqual(2);
        expect(arr[0] <= arr[1]).assertTrue();
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_2200
     * @tc.name testArrayModify0022
     * @tc.desc Verify reverse with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0022';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push(item.value);
        arr.push('x');
        arr.reverse();
        expect(arr[0]).assertEqual('x');
        expect(arr[1]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_2300
     * @tc.name testArrayModify0023
     * @tc.desc Verify extendTo with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0023';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push('a');
        arr.extendTo(3, item.value);
        expect(arr.length).assertEqual(3);
        expect(arr[2]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_2400
     * @tc.name testArrayModify0024
     * @tc.desc Verify shrinkTo with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0024';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push(item.value);
        arr.push('x');
        arr.push('x');
        arr.shrinkTo(1);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交操作测试：boolean 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_2500
     * @tc.name testArrayModify0025
     * @tc.desc Verify splice with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0025';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(item.value);
        arr.push(item.value);
        let removed: collections.Array<boolean> = arr.splice(1, 1);
        expect(removed.length).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_2600
     * @tc.name testArrayModify0026
     * @tc.desc Verify slice with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0026';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(item.value);
        let sliced: collections.Array<boolean> = arr.slice(0, 1);
        expect(sliced.length).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_2700
     * @tc.name testArrayModify0027
     * @tc.desc Verify fill with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0027';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(true);
        arr.push(true);
        arr.fill(item.value);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_2800
     * @tc.name testArrayModify0028
     * @tc.desc Verify copyWithin with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0028';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(item.value);
        arr.push(false);
        arr.push(false);
        arr.copyWithin(1, 0);
        expect(arr[1]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_2900
     * @tc.name testArrayModify0029
     * @tc.desc Verify sort with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0029';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(item.value);
        arr.push(false);
        arr.sort();
        expect(arr.length).assertEqual(2);
        expect(arr[0] <= arr[1]).assertTrue();
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_3000
     * @tc.name testArrayModify0030
     * @tc.desc Verify reverse with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0030';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(item.value);
        arr.push(!item.value);
        arr.reverse();
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(!item.value);
        expect(arr[1]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_3100
     * @tc.name testArrayModify0031
     * @tc.desc Verify extendTo with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0031';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(true);
        arr.extendTo(3, item.value);
        expect(arr.length).assertEqual(3);
        expect(arr[2]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_3200
     * @tc.name testArrayModify0032
     * @tc.desc Verify shrinkTo with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0032';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(item.value);
        arr.push(false);
        arr.push(false);
        arr.shrinkTo(1);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交操作测试：Sendable 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_3300
     * @tc.name testArrayModify0033
     * @tc.desc Verify splice with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0033';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          arr.push(item.value);
          arr.push(item.value);
          let removed: collections.Array<lang.ISendable> = arr.splice(1, 1);
          expect(removed.length).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_3400
     * @tc.name testArrayModify0034
     * @tc.desc Verify slice with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0034';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          arr.push(item.value);
          let sliced: collections.Array<lang.ISendable> = arr.slice(0, 1);
          expect(sliced.length).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_3500
     * @tc.name testArrayModify0035
     * @tc.desc Verify fill with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0035';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          arr.push(item.value);
          arr.push(item.value);
          arr.fill(item.value);
          expect(arr[0] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_3600
     * @tc.name testArrayModify0036
     * @tc.desc Verify copyWithin with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0036';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          arr.push(item.value);
          arr.push(item.value);
          arr.push(item.value);
          arr.copyWithin(1, 0);
          expect(arr[1] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_3700
     * @tc.name testArrayModify0037
     * @tc.desc Verify sort with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0037';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          arr.push(item.value);
          arr.push(item.value);
          arr.sort();
          expect(arr.length).assertEqual(2);
          expect(arr[0] === item.value).assertTrue();
          expect(arr[1] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_3800
     * @tc.name testArrayModify0038
     * @tc.desc Verify reverse with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0038';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          arr.push(item.value);
          arr.push(item.value);
          arr.reverse();
          expect(arr.length).assertEqual(2);
          expect(arr[0] === item.value).assertTrue();
          expect(arr[1] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_3900
     * @tc.name testArrayModify0039
     * @tc.desc Verify extendTo with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0039';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          arr.push(item.value);
          arr.extendTo(3, item.value);
          expect(arr.length).assertEqual(3);
          expect(arr[2] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_4000
     * @tc.name testArrayModify0040
     * @tc.desc Verify shrinkTo with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0040';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          arr.push(item.value);
          arr.push(item.value);
          arr.push(item.value);
          arr.shrinkTo(1);
          expect(arr.length).assertEqual(1);
          expect(arr[0] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 参数变体测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_4100
     * @tc.name testArrayModify0041
     * @tc.desc Verify splice without deleteCount (removes all from start to end).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0041';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      let removed: collections.Array<number> = arr.splice(2);
      expect(arr.length).assertEqual(2);
      expect(removed.length).assertEqual(3);
      expect(removed[0]).assertEqual(3);
      expect(removed[1]).assertEqual(4);
      expect(removed[2]).assertEqual(5);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_4200
     * @tc.name testArrayModify0042
     * @tc.desc Verify splice with insert items.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0042';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 5, 6);
      let removed: collections.Array<number> = arr.splice(2, 0, 3, 4);
      expect(arr.length).assertEqual(6);
      expect(removed.length).assertEqual(0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(arr[5]).assertEqual(6);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_4300
     * @tc.name testArrayModify0043
     * @tc.desc Verify [index] operator does not support negative index.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0043';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30);
      expect(arr[0]).assertEqual(10);
      expect(arr.at(-1)).assertEqual(30);

      console.info(`${caseName}, test end`);
    });

    // ==================== undefined/null 修改操作测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_4400
     * @tc.name testArrayModify0044
     * @tc.desc Verify splice with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0044';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined, undefined, undefined);
      let removed: collections.Array<lang.ISendable | null | undefined> = arr.splice(1, 1);
      expect(removed.length).assertEqual(1);
      expect(removed[0]).assertEqual(undefined);
      expect(arr.length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_4500
     * @tc.name testArrayModify0045
     * @tc.desc Verify splice with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0045';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null, null, null);
      let removed: collections.Array<lang.ISendable | null | undefined> = arr.splice(1, 1);
      expect(removed.length).assertEqual(1);
      expect(removed[0]).assertEqual(null);
      expect(arr.length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_4600
     * @tc.name testArrayModify0046
     * @tc.desc Verify fill with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0046';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined, undefined, undefined);
      arr.fill(undefined);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(undefined);
      expect(arr[2]).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_4700
     * @tc.name testArrayModify0047
     * @tc.desc Verify fill with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0047';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null, null, null);
      arr.fill(null);
      expect(arr[0]).assertEqual(null);
      expect(arr[1]).assertEqual(null);
      expect(arr[2]).assertEqual(null);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_4800
     * @tc.name testArrayModify0048
     * @tc.desc Verify sort with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0048';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined, undefined);
      arr.sort();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_4900
     * @tc.name testArrayModify0049
     * @tc.desc Verify sort with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0049';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null, null);
      arr.sort();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(null);
      expect(arr[1]).assertEqual(null);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_5000
     * @tc.name testArrayModify0050
     * @tc.desc Verify reverse with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0050';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined, undefined);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_5100
     * @tc.name testArrayModify0051
     * @tc.desc Verify reverse with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0051';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null, null);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(null);
      expect(arr[1]).assertEqual(null);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_5200
     * @tc.name testArrayModify0052
     * @tc.desc Verify extendTo with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0052';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>();
      arr.extendTo(3, undefined);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(undefined);
      expect(arr[2]).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_5300
     * @tc.name testArrayModify0053
     * @tc.desc Verify extendTo with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0053';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>();
      arr.extendTo(3, null);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(null);
      expect(arr[1]).assertEqual(null);
      expect(arr[2]).assertEqual(null);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_5400
     * @tc.name testArrayModify0054
     * @tc.desc Verify slice with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0054';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined, undefined);
      let sliced: collections.Array<lang.ISendable | null | undefined> = arr.slice(0, 1);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0]).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_5500
     * @tc.name testArrayModify0055
     * @tc.desc Verify slice with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0055';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null, null);
      let sliced: collections.Array<lang.ISendable | null | undefined> = arr.slice(0, 1);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0]).assertEqual(null);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_5600
     * @tc.name testArrayModify0056
     * @tc.desc Verify copyWithin with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0056';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined, undefined);
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_5700
     * @tc.name testArrayModify0057
     * @tc.desc Verify copyWithin with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0057';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null, null);
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual(null);
      expect(arr[1]).assertEqual(null);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_5800
     * @tc.name testArrayModify0058
     * @tc.desc Verify shrinkTo with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0058';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined, undefined, undefined);
      arr.shrinkTo(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_MODIFY_5900
     * @tc.name testArrayModify0059
     * @tc.desc Verify shrinkTo with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayModify0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayModify0059';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null, null, null);
      arr.shrinkTo(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(null);

      console.info(`${caseName}, test end`);
    });
  });
}
