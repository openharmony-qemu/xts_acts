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
// ArrayQuery.test.ets
// 查询方法组（8个）：at, indexOf, lastIndexOf, includes, find, findIndex, some, every

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
import { TestHelper } from './test_utils/TestHelper';

export default function suite() {
  describe('ArrayQueryTests', () => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    // ==================== 基础查询测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_0100
     * @tc.name testArrayQuery0001
     * @tc.desc Verify that at returns correct element by index with positive, negative and out-of-bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0001';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30, 40, 50);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(-1)).assertEqual(50);
      expect(arr.at(10) === null || arr.at(10) === undefined).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_0200
     * @tc.name testArrayQuery0002
     * @tc.desc Verify that indexOf returns first occurrence index or -1 if not found.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0002';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30, 20, 40);
      expect(arr.indexOf(20)).assertEqual(1);
      expect(arr.indexOf(50)).assertEqual(-1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_0300
     * @tc.name testArrayQuery0003
     * @tc.desc Verify that lastIndexOf returns last occurrence index or -1 if not found.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0003';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30, 20, 40);
      expect(arr.lastIndexOf(20)).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_0400
     * @tc.name testArrayQuery0004
     * @tc.desc Verify that includes returns true if element exists, false otherwise.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0004';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30);
      expect(arr.includes(20)).assertTrue();
      expect(arr.includes(40)).assertFalse();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_0500
     * @tc.name testArrayQuery0005
     * @tc.desc Verify that find returns first matching element or undefined.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0005';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(5, 12, 8, 130, 44);
      expect(arr.find((element: number): boolean => element > 10)).assertEqual(12);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_0600
     * @tc.name testArrayQuery0006
     * @tc.desc Verify that findIndex returns first matching index or -1.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0006';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(5, 12, 8, 130);
      expect(arr.findIndex((element: number): boolean => element > 10)).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_0700
     * @tc.name testArrayQuery0007
     * @tc.desc Verify that some returns true if any element matches predicate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0007';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      expect(arr.some((element: number): boolean => element > 3)).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_0800
     * @tc.name testArrayQuery0008
     * @tc.desc Verify that every returns true if all elements match predicate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0008';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(2, 4, 6, 8);
      expect(arr.every((element: number): boolean => element % 2 === 0)).assertTrue();

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交查询测试：number 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_0900
     * @tc.name testArrayQuery0009
     * @tc.desc Verify at with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0009';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        let result: number | undefined = arr.at(0);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(result as number)).assertTrue();
        } else {
          expect(result).assertEqual(item.value);
        }
        expect(arr.at(10) === null || arr.at(10) === undefined).assertTrue();
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_1000
     * @tc.name testArrayQuery0010
     * @tc.desc Verify indexOf with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0010';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        // indexOf 使用 === 比较，NaN !== NaN，永远返回 -1，语言限制无法实现
        if (item.id === 'number_nan') {
          continue;
        }
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        expect(arr.indexOf(item.value)).assertEqual(0);
        expect(arr.indexOf(-999)).assertEqual(-1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_1100
     * @tc.name testArrayQuery0011
     * @tc.desc Verify lastIndexOf with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0011';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        // lastIndexOf 使用 === 比较，NaN !== NaN，永远返回 -1，语言限制无法实现
        if (item.id === 'number_nan') {
          continue;
        }
        let arr: collections.Array<number> = new collections.Array<number>(item.value, item.value);
        expect(arr.lastIndexOf(item.value)).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_1200
     * @tc.name testArrayQuery0012
     * @tc.desc Verify includes with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0012';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        if (item.id === 'number_nan') {
          expect(arr.includes(NaN)).assertTrue();
        } else {
          expect(arr.includes(item.value)).assertTrue();
        }
        expect(arr.includes(-999)).assertFalse();
      }

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_1300
     * @tc.name testArrayQuery0013
     * @tc.desc Verify find with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0013';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, 999);
        let found: number | undefined;
        // 注意：NaN !== NaN，因此对 NaN 需要使用 Number.isNaN() 进行判断
        if (item.id === 'number_nan') {
          found = arr.find((element: number): boolean => Number.isNaN(element));
        } else {
          found = arr.find((element: number): boolean => element === item.value);
        }
        expect(found !== undefined).assertTrue();
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_1400
     * @tc.name testArrayQuery0014
     * @tc.desc Verify findIndex with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0014';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, 999);
        // 注意：NaN !== NaN，因此对 NaN 需要使用 Number.isNaN() 进行判断
        if (item.id === 'number_nan') {
          expect(arr.findIndex((element: number): boolean => Number.isNaN(element))).assertEqual(0);
        } else {
          expect(arr.findIndex((element: number): boolean => element === item.value)).assertEqual(0);
        }
        expect(arr.findIndex((element: number): boolean => element === 999)).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_1500
     * @tc.name testArrayQuery0015
     * @tc.desc Verify some with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0015';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        // 注意：NaN !== NaN，因此对 NaN 需要使用 Number.isNaN() 进行判断
        if (item.id === 'number_nan') {
          expect(arr.some((element: number): boolean => Number.isNaN(element))).assertTrue();
          expect(arr.some((element: number): boolean => !Number.isNaN(element))).assertFalse();
        } else {
          expect(arr.some((element: number): boolean => element === item.value)).assertTrue();
          expect(arr.some((element: number): boolean => element !== item.value)).assertFalse();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_1600
     * @tc.name testArrayQuery0016
     * @tc.desc Verify every with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0016';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        // 注意：NaN !== NaN，因此对 NaN 需要使用 Number.isNaN() 进行判断
        if (item.id === 'number_nan') {
          expect(arr.every((element: number): boolean => Number.isNaN(element))).assertTrue();
        } else {
          expect(arr.every((element: number): boolean => element === item.value)).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交查询测试：string 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_1700
     * @tc.name testArrayQuery0017
     * @tc.desc Verify at with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0017';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.at(0)).assertEqual(item.value);
        expect(arr.at(10) === null || arr.at(10) === undefined).assertTrue();
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_1800
     * @tc.name testArrayQuery0018
     * @tc.desc Verify indexOf with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0018';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.indexOf(item.value)).assertEqual(0);
        expect(arr.indexOf('nonexistent')).assertEqual(-1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_1900
     * @tc.name testArrayQuery0019
     * @tc.desc Verify includes with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0019';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.includes(item.value)).assertTrue();
        expect(arr.includes('nonexistent')).assertFalse();
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交查询测试：boolean 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_2000
     * @tc.name testArrayQuery0020
     * @tc.desc Verify at with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0020';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr.at(0)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_2100
     * @tc.name testArrayQuery0021
     * @tc.desc Verify includes with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0021';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr.includes(item.value)).assertTrue();
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_2200
     * @tc.name testArrayQuery0022
     * @tc.desc Verify every with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0022';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, item.value);
        expect(arr.every((element: boolean): boolean => element === item.value)).assertTrue();
      }

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_2300
     * @tc.name testArrayQuery0023
     * @tc.desc Verify at with all ISendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0023';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          TestHelper.assertNotNull(arr.at(0), 'at(0) ' + item.id);
          TestHelper.assertNull(arr.at(10), 'at(10) ' + item.id);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_2400
     * @tc.name testArrayQuery0024
     * @tc.desc Verify indexOf with all ISendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0024';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.id === 'number_nan') {
          continue;
        }
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr.indexOf(item.value)).assertEqual(0);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_2500
     * @tc.name testArrayQuery0025
     * @tc.desc Verify includes with all ISendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0025';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr.includes(item.value)).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_2600
     * @tc.name testArrayQuery0026
     * @tc.desc Verify find with all ISendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0026';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          TestHelper.assertNotNull(arr.find((): boolean => true), 'find ' + item.id);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 参数变体测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_2700
     * @tc.name testArrayQuery0027
     * @tc.desc Verify indexOf with fromIndex parameter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0027';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30, 20, 40);
      // fromIndex 从位置2开始，跳过第一个20
      expect(arr.indexOf(20, 2)).assertEqual(3);
      // fromIndex 为负数，从末尾倒推
      expect(arr.indexOf(20, -3)).assertEqual(3);
      // fromIndex 超出范围
      expect(arr.indexOf(20, 10)).assertEqual(-1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_2800
     * @tc.name testArrayQuery0028
     * @tc.desc Verify lastIndexOf with fromIndex parameter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0028';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30, 20, 40);
      // fromIndex 限制在位置2之前
      expect(arr.lastIndexOf(20, 2)).assertEqual(1);
      // 不传 fromIndex 返回最后一个
      expect(arr.lastIndexOf(20)).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_2900
     * @tc.name testArrayQuery0029
     * @tc.desc Verify includes with fromIndex parameter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0029';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30, 40, 50);
      // fromIndex 从位置2开始，10不在范围内
      expect(arr.includes(10, 2)).assertFalse();
      // fromIndex 从位置0开始，10在范围内
      expect(arr.includes(10, 0)).assertTrue();
      // 负 fromIndex
      expect(arr.includes(50, -1)).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_3000
     * @tc.name testArrayQuery0030
     * @tc.desc Verify find returns undefined when no element matches.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0030';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let result: number | undefined = arr.find((element: number): boolean => element > 10);
      expect(result === undefined).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_3100
     * @tc.name testArrayQuery0031
     * @tc.desc Verify findIndex returns -1 when no element matches.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0031';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      expect(arr.findIndex((element: number): boolean => element > 10)).assertEqual(-1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_3200
     * @tc.name testArrayQuery0032
     * @tc.desc Verify some returns false when no element matches.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0032';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      expect(arr.some((element: number): boolean => element > 10)).assertFalse();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_3300
     * @tc.name testArrayQuery0033
     * @tc.desc Verify every returns true for empty array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0033';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      expect(arr.every((element: number): boolean => element > 0)).assertTrue();

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交查询测试：string 类型补充 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_3400
     * @tc.name testArrayQuery0034
     * @tc.desc Verify lastIndexOf with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0034';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, item.value);
        expect(arr.lastIndexOf(item.value)).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_3500
     * @tc.name testArrayQuery0035
     * @tc.desc Verify find with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0035';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, 'other');
        let found: string | undefined = arr.find((element: string): boolean => element === item.value);
        expect(found).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_3600
     * @tc.name testArrayQuery0036
     * @tc.desc Verify findIndex with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0036';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, 'other');
        expect(arr.findIndex((element: string): boolean => element === item.value)).assertEqual(0);
        expect(arr.findIndex((element: string): boolean => element === 'other')).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_3700
     * @tc.name testArrayQuery0037
     * @tc.desc Verify some with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0037';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.some((element: string): boolean => element === item.value)).assertTrue();
        expect(arr.some((element: string): boolean => element !== item.value)).assertFalse();
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_3800
     * @tc.name testArrayQuery0038
     * @tc.desc Verify every with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0038';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, item.value);
        expect(arr.every((element: string): boolean => element === item.value)).assertTrue();
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交查询测试：boolean 类型补充 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_3900
     * @tc.name testArrayQuery0039
     * @tc.desc Verify indexOf with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0039';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr.indexOf(item.value)).assertEqual(0);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_4000
     * @tc.name testArrayQuery0040
     * @tc.desc Verify lastIndexOf with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0040';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, item.value);
        expect(arr.lastIndexOf(item.value)).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_4100
     * @tc.name testArrayQuery0041
     * @tc.desc Verify find with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0041';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, !item.value);
        let found: boolean | undefined = arr.find((element: boolean): boolean => element === item.value);
        expect(found).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_4200
     * @tc.name testArrayQuery0042
     * @tc.desc Verify findIndex with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0042';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, !item.value);
        expect(arr.findIndex((element: boolean): boolean => element === item.value)).assertEqual(0);
        expect(arr.findIndex((element: boolean): boolean => element === !item.value)).assertEqual(1);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_4300
     * @tc.name testArrayQuery0043
     * @tc.desc Verify some with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0043';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr.some((element: boolean): boolean => element === item.value)).assertTrue();
        expect(arr.some((element: boolean): boolean => element !== item.value)).assertFalse();
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交查询测试：ISendable 类型补充 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_4400
     * @tc.name testArrayQuery0044
     * @tc.desc Verify findIndex with all ISendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0044';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value, item.value);
          expect(arr.findIndex((): boolean => true)).assertEqual(0);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_4500
     * @tc.name testArrayQuery0045
     * @tc.desc Verify some with all ISendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0045';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr.some((): boolean => true)).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_4600
     * @tc.name testArrayQuery0046
     * @tc.desc Verify every with all ISendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0046';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr.every((): boolean => true)).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_4700
     * @tc.name testArrayQuery0047
     * @tc.desc Verify lastIndexOf with all ISendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0047';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.id === 'number_nan') {
          continue;
        }
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value, item.value);
          expect(arr.lastIndexOf(item.value)).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_4800
     * @tc.name testArrayQuery0048
     * @tc.desc Verify at with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0048';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined);
      expect(arr.at(0)).assertEqual(undefined);
      expect(arr.at(10) === null || arr.at(10) === undefined).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_4900
     * @tc.name testArrayQuery0049
     * @tc.desc Verify at with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0049';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null);
      expect(arr.at(0)).assertEqual(null);
      expect(arr.at(10) === null || arr.at(10) === undefined).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_5000
     * @tc.name testArrayQuery0050
     * @tc.desc  Verify indexOf with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */

    it('testArrayQuery0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0050';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined);
      let index: number = arr.indexOf(undefined);
      expect(index).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_5100
     * @tc.name testArrayQuery0051
     * @tc.desc Verify indexOf with null value .
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */

    it('testArrayQuery0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0051';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null);
      let index: number = arr.indexOf(null);
      expect(index).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_5200
     * @tc.name testArrayQuery0052
     * @tc.desc Verify includes with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0052';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined);
      expect(arr.includes(undefined)).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_5300
     * @tc.name testArrayQuery0053
     * @tc.desc  Verify includes with null value .
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */

    it('testArrayQuery0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0053';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null);
      expect(arr.includes(null)).assertTrue();

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_5400
     * @tc.name testArrayQuery0054
     * @tc.desc Verify find with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0054';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined);
      let found: lang.ISendable | null | undefined = arr.find(
        (element: lang.ISendable | null | undefined): boolean => element === undefined
      );
      expect(found).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_5500
     * @tc.name testArrayQuery0055
     * @tc.desc Verify find with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0055';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null);
      let found: lang.ISendable | null | undefined = arr.find(
        (element: lang.ISendable | null | undefined): boolean => element === null
      );
      expect(found).assertEqual(null);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_5600
     * @tc.name testArrayQuery0056
     * @tc.desc Verify some with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0056';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined);
      expect(arr.some((element: lang.ISendable | null | undefined): boolean => element === undefined)).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_5700
     * @tc.name testArrayQuery0057
     * @tc.desc Verify some with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0057';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null);
      expect(arr.some((element: lang.ISendable | null | undefined): boolean => element === null)).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_5800
     * @tc.name testArrayQuery0058
     * @tc.desc Verify every with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0058';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined);
      expect(arr.every((element: lang.ISendable | null | undefined): boolean => element === undefined)).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_5900
     * @tc.name testArrayQuery0059
     * @tc.desc Verify every with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0059';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null);
      expect(arr.every((element: lang.ISendable | null | undefined): boolean => element === null)).assertTrue();

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_6000
     * @tc.name testArrayQuery0060
     * @tc.desc Verify lastIndexOf with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0060';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined, undefined);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_6100
     * @tc.name testArrayQuery0061
     * @tc.desc Verify lastIndexOf with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0061';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null, null);
      expect(arr.lastIndexOf(null)).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_6200
     * @tc.name testArrayQuery0062
     * @tc.desc Verify findIndex with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0062';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined);
      expect(arr.findIndex((element: lang.ISendable | null | undefined):
        boolean => element === undefined)).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_QUERY_6300
     * @tc.name testArrayQuery0063
     * @tc.desc Verify findIndex with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayQuery0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayQuery0063';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null);
      expect(arr.findIndex((element: lang.ISendable | null | undefined): boolean => element === null)).assertEqual(0);

      console.info(`${caseName}, test end`);
    });
  });
}
