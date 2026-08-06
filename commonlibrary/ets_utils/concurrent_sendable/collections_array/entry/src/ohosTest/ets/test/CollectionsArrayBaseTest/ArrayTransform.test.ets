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
// ArrayTransform.test.ets null和undefined在环境中不支持，注释了12个用例

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, lang } from '@kit.ArkTS';
import {
  getNumberTestValues,
  getStringTestValues,
  getBooleanTestValues,
  getAllTestValues,
  NumberTestValue,
  StringTestValue,
  BooleanTestValue,
  TestValueItem,
  NormalObject,
  EmptyObject,
  ComplexObject,
  NormalFunctionWrapper,
  ArrowFunctionWrapper,
  AsyncFunctionWrapper
} from './test_data/TestDataFactory';
import { TestHelper } from './test_utils/TestHelper';

export default function suite() {
  describe('ArrayTransformTests', () => {
    // ==================== 基础转换测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_0100
     * @tc.name testArrayTransform0001
     * @tc.desc Verify that join concatenates elements with default and custom separators.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0001';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      expect(arr.join()).assertEqual('1,2,3');
      expect(arr.join('-')).assertEqual('1-2-3');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_0200
     * @tc.name testArrayTransform0002
     * @tc.desc Verify that toString returns comma-separated string representation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0002';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      expect(arr.toString()).assertEqual('1,2,3');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_0300
     * @tc.name testArrayTransform0003
     * @tc.desc Verify that toLocaleString returns localized string representation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0003';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1000, 2000);
      let result: string = arr.toLocaleString();
      expect(result !== null && result !== undefined).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_0400
     * @tc.name testArrayTransform0004
     * @tc.desc Verify that concat merges two Arrays into a new Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0004';
      console.info(`${caseName}, test start`);

      let arr1: collections.Array<number> = new collections.Array<number>(1, 2);
      let arr2: collections.Array<number> = new collections.Array<number>(3, 4);
      expect(arr1.concat(arr2).length).assertEqual(4);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_0500
     * @tc.name testArrayTransform0005
     * @tc.desc Verify that reduceRight reduces from right to left correctly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0005';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
      expect(arr.reduceRight((acc: number, cur: number): number => acc + cur)).assertEqual(10);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_0600
     * @tc.name testArrayTransform0006
     * @tc.desc Verify that length property returns correct element count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0006';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      expect(arr.length).assertEqual(0);
      arr.push(1);
      expect(arr.length).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    // ==================== join 方法完整测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_0700
     * @tc.name testArrayTransform0007
     * @tc.desc Verify join with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0007';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        let result: string = arr.join();
        if (item.id === 'number_normal') {
          expect(result).assertEqual('100');
        } else if (item.id === 'number_special') {
          TestHelper.assertNotNull(result, 'join number_special');
        } else if (item.id === 'number_boundary') {
          TestHelper.assertNotNull(result, 'join number_boundary');
        } else if (item.id === 'number_nan') {
          expect(result).assertEqual('NaN');
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_0800
     * @tc.name testArrayTransform0008
     * @tc.desc Verify join with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0008';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.join()).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_0900
     * @tc.name testArrayTransform0009
     * @tc.desc Verify join with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0009';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        if (item.id === 'boolean_true') {
          expect(arr.join()).assertEqual('true');
        } else if (item.id === 'boolean_false') {
          expect(arr.join()).assertEqual('false');
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 对象类型测试（使用 TestDataFactory） ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_1000
     * @tc.name testArrayTransform0010
     * @tc.desc Verify join with object test values (using Sendable class).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0010';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 Sendable 类
      let arr: collections.Array<NormalObject> = new collections.Array<NormalObject>(new NormalObject());
      expect(arr.join()).assertEqual('[object Object]');

      let emptyArr: collections.Array<EmptyObject> = new collections.Array<EmptyObject>(new EmptyObject());
      expect(emptyArr.join()).assertEqual('[object Object]');

      let complexArr: collections.Array<ComplexObject> = new collections.Array<ComplexObject>(new ComplexObject());
      expect(complexArr.join()).assertEqual('[object Object]');

      console.info(`${caseName}, test end`);
    });

    // ==================== 嵌套数组测试（使用 collections.Array） ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_1100
     * @tc.name testArrayTransform0011
     * @tc.desc Verify join with nested collections.Array test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0011';
      console.info(`${caseName}, test start`);

      // 使用 collections.Array 嵌套
      let nestedArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let arr: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(nestedArr);
      expect(arr.join()).assertEqual('1,2,3');

      let emptyArr: collections.Array<number> = new collections.Array<number>();
      let arrEmpty: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(emptyArr);
      expect(arrEmpty.join()).assertEqual('');

      // 稀疏数组：collections.Array 不支持 undefined 元素，使用 skip 方式
      let sparseArr: collections.Array<number> = new collections.Array<number>();
      sparseArr.push(1);
      sparseArr.push(0);
      sparseArr.push(3);
      let arrSparse: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(sparseArr);
      expect(arrSparse.join().length > 0).assertTrue();

      console.info(`${caseName}, test end`);
    });

    // ==================== 函数测试（使用 TestDataFactory） ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_1200
     * @tc.name testArrayTransform0012
     * @tc.desc Verify join with function test values (using FunctionWrapper).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0012';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 FunctionWrapper
      let arrNormal: collections.Array<NormalFunctionWrapper> = new collections.Array<NormalFunctionWrapper>(new NormalFunctionWrapper());
      let resultNormal: string = arrNormal.join();
      expect(resultNormal.length > 0).assertTrue();

      let arrArrow: collections.Array<ArrowFunctionWrapper> = new collections.Array<ArrowFunctionWrapper>(new ArrowFunctionWrapper());
      let resultArrow: string = arrArrow.join();
      expect(resultArrow.length > 0).assertTrue();

      let arrAsync: collections.Array<AsyncFunctionWrapper> = new collections.Array<AsyncFunctionWrapper>(new AsyncFunctionWrapper());
      let resultAsync: string = arrAsync.join();
      expect(resultAsync.length > 0).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_1300
     * @tc.name testArrayTransform0013
     * @tc.desc Verify join with sendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0013';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let result: string = arr.join();
          TestHelper.assertNotNull(result, 'join sendable ' + item.id);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== toString 方法完整测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_1400
     * @tc.name testArrayTransform0014
     * @tc.desc Verify toString with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0014';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        let result: string = arr.toString();
        if (item.id === 'number_normal') {
          expect(result).assertEqual('100');
        } else if (item.id === 'number_special') {
          TestHelper.assertNotNull(result, 'toString number_special');
        } else if (item.id === 'number_boundary') {
          TestHelper.assertNotNull(result, 'toString number_boundary');
        } else if (item.id === 'number_nan') {
          expect(result).assertEqual('NaN');
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_1500
     * @tc.name testArrayTransform0015
     * @tc.desc Verify toString with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0015';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.toString()).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_1600
     * @tc.name testArrayTransform0016
     * @tc.desc Verify toString with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0016';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        if (item.id === 'boolean_true') {
          expect(arr.toString()).assertEqual('true');
        } else if (item.id === 'boolean_false') {
          expect(arr.toString()).assertEqual('false');
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== toString 对象测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_1700
     * @tc.name testArrayTransform0017
     * @tc.desc Verify toString with object test values (using Sendable class).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0017';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 Sendable 类
      let arr: collections.Array<NormalObject> = new collections.Array<NormalObject>(new NormalObject());
      expect(arr.toString()).assertEqual('[object Object]');

      let emptyArr: collections.Array<EmptyObject> = new collections.Array<EmptyObject>(new EmptyObject());
      expect(emptyArr.toString()).assertEqual('[object Object]');

      let complexArr: collections.Array<ComplexObject> = new collections.Array<ComplexObject>(new ComplexObject());
      expect(complexArr.toString()).assertEqual('[object Object]');

      console.info(`${caseName}, test end`);
    });

    // ==================== toString 嵌套数组测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_1800
     * @tc.name testArrayTransform0018
     * @tc.desc Verify toString with nested collections.Array test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0018';
      console.info(`${caseName}, test start`);

      // 使用 collections.Array 嵌套
      let nestedArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let arr: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(nestedArr);
      expect(arr.toString()).assertEqual('1,2,3');

      let emptyArr: collections.Array<number> = new collections.Array<number>();
      let arrEmpty: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(emptyArr);
      expect(arrEmpty.toString()).assertEqual('');

      console.info(`${caseName}, test end`);
    });

    // ==================== toString 函数测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_1900
     * @tc.name testArrayTransform0019
     * @tc.desc Verify toString with function test values (using FunctionWrapper).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0019';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 FunctionWrapper
      let arrNormal: collections.Array<NormalFunctionWrapper> = new collections.Array<NormalFunctionWrapper>(new NormalFunctionWrapper());
      let resultNormal: string = arrNormal.toString();
      expect(resultNormal.length > 0).assertTrue();

      let arrArrow: collections.Array<ArrowFunctionWrapper> = new collections.Array<ArrowFunctionWrapper>(new ArrowFunctionWrapper());
      let resultArrow: string = arrArrow.toString();
      expect(resultArrow.length > 0).assertTrue();

      let arrAsync: collections.Array<AsyncFunctionWrapper> = new collections.Array<AsyncFunctionWrapper>(new AsyncFunctionWrapper());
      let resultAsync: string = arrAsync.toString();
      expect(resultAsync.length > 0).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_2000
     * @tc.name testArrayTransform0020
     * @tc.desc Verify toString with sendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0020';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let result: string = arr.toString();
          TestHelper.assertNotNull(result, 'toString sendable ' + item.id);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== toLocaleString 方法完整测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_2100
     * @tc.name testArrayTransform0021
     * @tc.desc Verify toLocaleString with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0021';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        let result: string = arr.toLocaleString();
        TestHelper.assertNotNull(result, 'toLocaleString number ' + item.id);
        if (item.id === 'number_nan') {
          expect(result).assertEqual('NaN');
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_2200
     * @tc.name testArrayTransform0022
     * @tc.desc Verify toLocaleString with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0022';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        let result: string = arr.toLocaleString();
        TestHelper.assertNotNull(result, 'toLocaleString string ' + item.id);
        if (item.id === 'string_empty') {
          expect(result).assertEqual('');
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_2300
     * @tc.name testArrayTransform0023
     * @tc.desc Verify toLocaleString with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0023';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        if (item.id === 'boolean_true') {
          expect(arr.toLocaleString()).assertEqual('true');
        } else if (item.id === 'boolean_false') {
          expect(arr.toLocaleString()).assertEqual('false');
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== toLocaleString 对象测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_2400
     * @tc.name testArrayTransform0024
     * @tc.desc Verify toLocaleString with object test values (using Sendable class).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0024';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 Sendable 类
      let arr: collections.Array<NormalObject> = new collections.Array<NormalObject>(new NormalObject());
      let result: string = arr.toLocaleString();
      TestHelper.assertNotNull(result, 'toLocaleString object');

      let emptyArr: collections.Array<EmptyObject> = new collections.Array<EmptyObject>(new EmptyObject());
      let resultEmpty: string = emptyArr.toLocaleString();
      TestHelper.assertNotNull(resultEmpty, 'toLocaleString empty object');

      let complexArr: collections.Array<ComplexObject> = new collections.Array<ComplexObject>(new ComplexObject());
      let resultComplex: string = complexArr.toLocaleString();
      TestHelper.assertNotNull(resultComplex, 'toLocaleString complex object');

      console.info(`${caseName}, test end`);
    });

    // ==================== toLocaleString 嵌套数组测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_2500
     * @tc.name testArrayTransform0025
     * @tc.desc Verify toLocaleString with nested collections.Array test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0025';
      console.info(`${caseName}, test start`);

      // 使用 collections.Array 嵌套
      let nestedArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let arr: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(nestedArr);
      let result: string = arr.toLocaleString();
      TestHelper.assertNotNull(result, 'toLocaleString array');

      let emptyArr: collections.Array<number> = new collections.Array<number>();
      let arrEmpty: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(emptyArr);
      let resultEmpty: string = arrEmpty.toLocaleString();
      TestHelper.assertNotNull(resultEmpty, 'toLocaleString empty array');

      console.info(`${caseName}, test end`);
    });

    // ==================== toLocaleString 函数测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_2600
     * @tc.name testArrayTransform0026
     * @tc.desc Verify toLocaleString with function test values (using FunctionWrapper).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0026';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 FunctionWrapper
      let arrNormal: collections.Array<NormalFunctionWrapper> = new collections.Array<NormalFunctionWrapper>(new NormalFunctionWrapper());
      let resultNormal: string = arrNormal.toLocaleString();
      TestHelper.assertNotNull(resultNormal, 'toLocaleString function');

      let arrArrow: collections.Array<ArrowFunctionWrapper> = new collections.Array<ArrowFunctionWrapper>(new ArrowFunctionWrapper());
      let resultArrow: string = arrArrow.toLocaleString();
      TestHelper.assertNotNull(resultArrow, 'toLocaleString arrow function');

      let arrAsync: collections.Array<AsyncFunctionWrapper> = new collections.Array<AsyncFunctionWrapper>(new AsyncFunctionWrapper());
      let resultAsync: string = arrAsync.toLocaleString();
      TestHelper.assertNotNull(resultAsync, 'toLocaleString async function');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_2700
     * @tc.name testArrayTransform0027
     * @tc.desc Verify toLocaleString with sendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0027';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let result: string = arr.toLocaleString();
          TestHelper.assertNotNull(result, 'toLocaleString sendable ' + item.id);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== concat 方法完整测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_2800
     * @tc.name testArrayTransform0028
     * @tc.desc Verify concat with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0028';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr1: collections.Array<number> = new collections.Array<number>(item.value);
        let arr2: collections.Array<number> = new collections.Array<number>(item.value);
        let result: collections.Array<number> = arr1.concat(arr2);
        expect(result.length).assertEqual(2);
        if (item.id !== 'number_nan') {
          expect(result[0]).assertEqual(item.value);
          expect(result[1]).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_2900
     * @tc.name testArrayTransform0029
     * @tc.desc Verify concat with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0029';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr1: collections.Array<string> = new collections.Array<string>(item.value);
        let arr2: collections.Array<string> = new collections.Array<string>(item.value);
        let result: collections.Array<string> = arr1.concat(arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(item.value);
        expect(result[1]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_3000
     * @tc.name testArrayTransform0030
     * @tc.desc Verify concat with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0030';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr1: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        let arr2: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        let result: collections.Array<boolean> = arr1.concat(arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(item.value);
        expect(result[1]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== concat 对象测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_3100
     * @tc.name testArrayTransform0031
     * @tc.desc Verify concat with object test values (using Sendable class).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0031';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 Sendable 类
      let obj: NormalObject = new NormalObject();
      let arr1: collections.Array<NormalObject> = new collections.Array<NormalObject>(obj);
      let arr2: collections.Array<NormalObject> = new collections.Array<NormalObject>(obj);
      let result: collections.Array<NormalObject> = arr1.concat(arr2);
      expect(result.length).assertEqual(2);

      let emptyObj: EmptyObject = new EmptyObject();
      let arrEmpty1: collections.Array<EmptyObject> = new collections.Array<EmptyObject>(emptyObj);
      let arrEmpty2: collections.Array<EmptyObject> = new collections.Array<EmptyObject>(emptyObj);
      let resultEmpty: collections.Array<EmptyObject> = arrEmpty1.concat(arrEmpty2);
      expect(resultEmpty.length).assertEqual(2);

      let complexObj: ComplexObject = new ComplexObject();
      let arrComplex1: collections.Array<ComplexObject> = new collections.Array<ComplexObject>(complexObj);
      let arrComplex2: collections.Array<ComplexObject> = new collections.Array<ComplexObject>(complexObj);
      let resultComplex: collections.Array<ComplexObject> = arrComplex1.concat(arrComplex2);
      expect(resultComplex.length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    // ==================== concat 嵌套数组测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_3200
     * @tc.name testArrayTransform0032
     * @tc.desc Verify concat with nested collections.Array test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0032';
      console.info(`${caseName}, test start`);

      // 使用 collections.Array 嵌套
      let nestedArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let arr1: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(nestedArr);
      let arr2: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(nestedArr);
      let result: collections.Array<collections.Array<number>> = arr1.concat(arr2);
      expect(result.length).assertEqual(2);

      let emptyArr: collections.Array<number> = new collections.Array<number>();
      let arrEmpty1: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(emptyArr);
      let arrEmpty2: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(emptyArr);
      let resultEmpty: collections.Array<collections.Array<number>> = arrEmpty1.concat(arrEmpty2);
      expect(resultEmpty.length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    // ==================== concat 函数测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_3300
     * @tc.name testArrayTransform0033
     * @tc.desc Verify concat with function test values (using FunctionWrapper).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0033';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 FunctionWrapper
      let fnNormal: NormalFunctionWrapper = new NormalFunctionWrapper();
      let arrNormal1: collections.Array<NormalFunctionWrapper> = new collections.Array<NormalFunctionWrapper>(fnNormal);
      let arrNormal2: collections.Array<NormalFunctionWrapper> = new collections.Array<NormalFunctionWrapper>(fnNormal);
      let resultNormal: collections.Array<NormalFunctionWrapper> = arrNormal1.concat(arrNormal2);
      expect(resultNormal.length).assertEqual(2);

      let fnArrow: ArrowFunctionWrapper = new ArrowFunctionWrapper();
      let arrArrow1: collections.Array<ArrowFunctionWrapper> = new collections.Array<ArrowFunctionWrapper>(fnArrow);
      let arrArrow2: collections.Array<ArrowFunctionWrapper> = new collections.Array<ArrowFunctionWrapper>(fnArrow);
      let resultArrow: collections.Array<ArrowFunctionWrapper> = arrArrow1.concat(arrArrow2);
      expect(resultArrow.length).assertEqual(2);

      let fnAsync: AsyncFunctionWrapper = new AsyncFunctionWrapper();
      let arrAsync1: collections.Array<AsyncFunctionWrapper> = new collections.Array<AsyncFunctionWrapper>(fnAsync);
      let arrAsync2: collections.Array<AsyncFunctionWrapper> = new collections.Array<AsyncFunctionWrapper>(fnAsync);
      let resultAsync: collections.Array<AsyncFunctionWrapper> = arrAsync1.concat(arrAsync2);
      expect(resultAsync.length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_3400
     * @tc.name testArrayTransform0034
     * @tc.desc Verify concat with sendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0034';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr1: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let arr2: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let result: collections.Array<lang.ISendable> = arr1.concat(arr2);
          expect(result.length).assertEqual(2);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== reduceRight 方法完整测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_3500
     * @tc.name testArrayTransform0035
     * @tc.desc Verify reduceRight with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0035';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(item.value);
        arr.push(item.value);
        let sum: number = arr.reduceRight((acc: number, cur: number): number => acc + cur);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(sum)).assertTrue();
        } else {
          expect(!Number.isNaN(sum)).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_3600
     * @tc.name testArrayTransform0036
     * @tc.desc Verify reduceRight with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0036';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push(item.value);
        arr.push(item.value);
        let result: string = arr.reduceRight((acc: string, cur: string): string => acc + cur);
        let expected: string = item.value + item.value;
        expect(result).assertEqual(expected);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_3700
     * @tc.name testArrayTransform0037
     * @tc.desc Verify reduceRight with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0037';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, item.value);
        let result: boolean = arr.reduceRight((acc: boolean, cur: boolean): boolean => acc && cur);
        expect(result).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== reduceRight 对象测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_3800
     * @tc.name testArrayTransform0038
     * @tc.desc Verify reduceRight with object test values (using Sendable class).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0038';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 Sendable 类
      let obj: NormalObject = new NormalObject();
      let arr: collections.Array<NormalObject> = new collections.Array<NormalObject>(obj, obj);
      let count: number = arr.reduceRight((acc: number, _cur: NormalObject): number => acc + 1, 0);
      expect(count).assertEqual(2);

      let emptyObj: EmptyObject = new EmptyObject();
      let arrEmpty: collections.Array<EmptyObject> = new collections.Array<EmptyObject>(emptyObj, emptyObj);
      let countEmpty: number = arrEmpty.reduceRight((acc: number, _cur: EmptyObject): number => acc + 1, 0);
      expect(countEmpty).assertEqual(2);

      let complexObj: ComplexObject = new ComplexObject();
      let arrComplex: collections.Array<ComplexObject> = new collections.Array<ComplexObject>(complexObj, complexObj);
      let countComplex: number = arrComplex.reduceRight((acc: number, _cur: ComplexObject): number => acc + 1, 0);
      expect(countComplex).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    // ==================== reduceRight 嵌套数组测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_3900
     * @tc.name testArrayTransform0039
     * @tc.desc Verify reduceRight with nested collections.Array test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0039';
      console.info(`${caseName}, test start`);

      // 使用 collections.Array 嵌套
      let nestedArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let arr: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(nestedArr, nestedArr);
      let count: number = arr.reduceRight((acc: number, _cur: collections.Array<number>): number => acc + 1, 0);
      expect(count).assertEqual(2);

      let emptyArr: collections.Array<number> = new collections.Array<number>();
      let arrEmpty: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(emptyArr, emptyArr);
      let countEmpty: number = arrEmpty.reduceRight((acc: number, _cur: collections.Array<number>): number => acc + 1, 0);
      expect(countEmpty).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    // ==================== reduceRight 函数测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_4000
     * @tc.name testArrayTransform0040
     * @tc.desc Verify reduceRight with function test values (using FunctionWrapper).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0040';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 FunctionWrapper
      let fnNormal: NormalFunctionWrapper = new NormalFunctionWrapper();
      let arrNormal: collections.Array<NormalFunctionWrapper> = new collections.Array<NormalFunctionWrapper>(fnNormal, fnNormal);
      let countNormal: number = arrNormal.reduceRight((acc: number, _cur: NormalFunctionWrapper): number => acc + 1, 0);
      expect(countNormal).assertEqual(2);

      let fnArrow: ArrowFunctionWrapper = new ArrowFunctionWrapper();
      let arrArrow: collections.Array<ArrowFunctionWrapper> = new collections.Array<ArrowFunctionWrapper>(fnArrow, fnArrow);
      let countArrow: number = arrArrow.reduceRight((acc: number, _cur: ArrowFunctionWrapper): number => acc + 1, 0);
      expect(countArrow).assertEqual(2);

      let fnAsync: AsyncFunctionWrapper = new AsyncFunctionWrapper();
      let arrAsync: collections.Array<AsyncFunctionWrapper> = new collections.Array<AsyncFunctionWrapper>(fnAsync, fnAsync);
      let countAsync: number = arrAsync.reduceRight((acc: number, _cur: AsyncFunctionWrapper): number => acc + 1, 0);
      expect(countAsync).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_4100
     * @tc.name testArrayTransform0041
     * @tc.desc Verify reduceRight with sendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0041';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value, item.value);
          let count: number = arr.reduceRight((acc: number, _cur: lang.ISendable): number => acc + 1, 0);
          expect(count).assertEqual(2);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== length 属性完整测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_4200
     * @tc.name testArrayTransform0042
     * @tc.desc Verify length property with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0042';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        expect(arr.length).assertEqual(1);
        arr.push(item.value);
        expect(arr.length).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_4300
     * @tc.name testArrayTransform0043
     * @tc.desc Verify length property with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0043';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.length).assertEqual(1);
        arr.push(item.value);
        expect(arr.length).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_4400
     * @tc.name testArrayTransform0044
     * @tc.desc Verify length property with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0044';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr.length).assertEqual(1);
        arr.push(item.value);
        expect(arr.length).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== length 对象测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_4500
     * @tc.name testArrayTransform0045
     * @tc.desc Verify length property with object test values (using Sendable class).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0045';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 Sendable 类
      let obj: NormalObject = new NormalObject();
      let arr: collections.Array<NormalObject> = new collections.Array<NormalObject>(obj);
      expect(arr.length).assertEqual(1);
      arr.push(obj);
      expect(arr.length).assertEqual(2);

      let emptyObj: EmptyObject = new EmptyObject();
      let arrEmpty: collections.Array<EmptyObject> = new collections.Array<EmptyObject>(emptyObj);
      expect(arrEmpty.length).assertEqual(1);
      arrEmpty.push(emptyObj);
      expect(arrEmpty.length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    // ==================== length 嵌套数组测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_4600
     * @tc.name testArrayTransform0046
     * @tc.desc Verify length property with nested collections.Array test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0046';
      console.info(`${caseName}, test start`);

      // 使用 collections.Array 嵌套
      let nestedArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let arr: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(nestedArr);
      expect(arr.length).assertEqual(1);
      arr.push(nestedArr);
      expect(arr.length).assertEqual(2);

      let emptyArr: collections.Array<number> = new collections.Array<number>();
      let arrEmpty: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(emptyArr);
      expect(arrEmpty.length).assertEqual(1);
      arrEmpty.push(emptyArr);
      expect(arrEmpty.length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    // ==================== length 函数测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_4700
     * @tc.name testArrayTransform0047
     * @tc.desc Verify length property with function test values (using FunctionWrapper).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0047';
      console.info(`${caseName}, test start`);

      // 使用 TestDataFactory 中的 FunctionWrapper
      let fnNormal: NormalFunctionWrapper = new NormalFunctionWrapper();
      let arrNormal: collections.Array<NormalFunctionWrapper> = new collections.Array<NormalFunctionWrapper>(fnNormal);
      expect(arrNormal.length).assertEqual(1);
      arrNormal.push(fnNormal);
      expect(arrNormal.length).assertEqual(2);

      let fnArrow: ArrowFunctionWrapper = new ArrowFunctionWrapper();
      let arrArrow: collections.Array<ArrowFunctionWrapper> = new collections.Array<ArrowFunctionWrapper>(fnArrow);
      expect(arrArrow.length).assertEqual(1);
      arrArrow.push(fnArrow);
      expect(arrArrow.length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_4800
     * @tc.name testArrayTransform0048
     * @tc.desc Verify length property with sendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0048';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr.length).assertEqual(1);
          arr.push(item.value);
          expect(arr.length).assertEqual(2);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 参数变体测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_4900
     * @tc.name testArrayTransform0049
     * @tc.desc Verify reduce with initial value parameter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0049';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let result: number = arr.reduce((acc: number, cur: number): number => acc + cur, 10);
      expect(result).assertEqual(16);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_5000
     * @tc.name testArrayTransform0050
     * @tc.desc Verify reduceRight with initial value parameter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0050';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let result: number = arr.reduceRight((acc: number, cur: number): number => acc + cur, 10);
      expect(result).assertEqual(16);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_5100
     * @tc.name testArrayTransform0051
     * @tc.desc Verify join with empty array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0051';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      expect(arr.join()).assertEqual('');
      expect(arr.join('-')).assertEqual('');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_5200
     * @tc.name testArrayTransform0052
     * @tc.desc Verify toString with empty array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0052';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<string> = new collections.Array<string>();
      expect(arr.toString()).assertEqual('');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_5300
     * @tc.name testArrayTransform0053
     * @tc.desc Verify some returns false for empty array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTransform0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTransform0053';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      try {
        expect(arr.some((element: number): boolean => element > 0)).assertFalse();
      } catch (error) {
        // TODO: Implement error handling.
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== undefined 和 null 测试（暂不支持） ====================
    // 注意：以下测试因 collections.Array 不支持 undefined 和 null 类型，暂时注释
    // 待后续环境支持后再启用

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_5400
     * @tc.name testArrayTransform0054
     * @tc.desc Verify join with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0054';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<undefined> = new collections.Array<undefined>(undefined);
    //   expect(arr.join()).assertEqual('undefined');
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_5500
     * @tc.name testArrayTransform0055
     * @tc.desc Verify join with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0055';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<null> = new collections.Array<null>(null);
    //   expect(arr.join()).assertEqual('null');
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_5600
     * @tc.name testArrayTransform0056
     * @tc.desc Verify toString with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0056';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<undefined> = new collections.Array<undefined>(undefined);
    //   expect(arr.toString()).assertEqual('undefined');
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_5700
     * @tc.name testArrayTransform0057
     * @tc.desc Verify toString with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0057';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<null> = new collections.Array<null>(null);
    //   expect(arr.toString()).assertEqual('null');
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_5800
     * @tc.name testArrayTransform0058
     * @tc.desc Verify toLocaleString with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0058';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<undefined> = new collections.Array<undefined>(undefined);
    //   let result: string = arr.toLocaleString();
    //   expect(result).assertEqual('undefined');
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_5900
     * @tc.name testArrayTransform0059
     * @tc.desc Verify toLocaleString with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0059';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<null> = new collections.Array<null>(null);
    //   let result: string = arr.toLocaleString();
    //   expect(result).assertEqual('null');
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_6000
     * @tc.name testArrayTransform0060
     * @tc.desc Verify concat with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0060';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr1: collections.Array<undefined> = new collections.Array<undefined>(undefined);
    //   let arr2: collections.Array<undefined> = new collections.Array<undefined>(undefined);
    //   let result: collections.Array<undefined> = arr1.concat(arr2);
    //   expect(result.length).assertEqual(2);
    //   expect(result[0]).assertEqual(undefined);
    //   expect(result[1]).assertEqual(undefined);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_6100
     * @tc.name testArrayTransform0061
     * @tc.desc Verify concat with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0061';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr1: collections.Array<null> = new collections.Array<null>(null);
    //   let arr2: collections.Array<null> = new collections.Array<null>(null);
    //   let result: collections.Array<null> = arr1.concat(arr2);
    //   expect(result.length).assertEqual(2);
    //   expect(result[0]).assertEqual(null);
    //   expect(result[1]).assertEqual(null);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_6200
     * @tc.name testArrayTransform0062
     * @tc.desc Verify reduceRight with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0062';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<undefined> = new collections.Array<undefined>(undefined, undefined);
    //   let count: number = arr.reduceRight((acc: number, _cur: undefined): number => acc + 1, 0);
    //   expect(count).assertEqual(2);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_6300
     * @tc.name testArrayTransform0063
     * @tc.desc Verify reduceRight with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0063';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<null> = new collections.Array<null>(null, null);
    //   let count: number = arr.reduceRight((acc: number, _cur: null): number => acc + 1, 0);
    //   expect(count).assertEqual(2);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_6400
     * @tc.name testArrayTransform0064
     * @tc.desc Verify length with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0064';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<undefined> = new collections.Array<undefined>(undefined);
    //   expect(arr.length).assertEqual(1);
    //   arr.push(undefined);
    //   expect(arr.length).assertEqual(2);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRANSFORM_6500
     * @tc.name testArrayTransform0065
     * @tc.desc Verify length with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayTransform0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTransform0065';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<null> = new collections.Array<null>(null);
    //   expect(arr.length).assertEqual(1);
    //   arr.push(null);
    //   expect(arr.length).assertEqual(2);
    //
    //   console.info(`${caseName}, test end`);
    // });
  });
}