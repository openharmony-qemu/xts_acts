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
// ArrayConstructor.test.ets  因为undefined 和 null 在环境中不支持 注释10个用例

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, lang } from '@kit.ArkTS';
import {
  BasicTypeTestData,
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
  describe('ArrayConstructorTests', () => {
    // ==================== 基础构造测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_0100
     * @tc.name testArrayConstructor0001
     * @tc.desc Verify that constructor() creates an empty Array with length 0 for various types.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0001';
      console.info(`${caseName}, test start`);

      let arrNum: collections.Array<number> = new collections.Array<number>();
      expect(arrNum instanceof collections.Array).assertTrue();
      expect(arrNum.length).assertEqual(0);

      let arrStr: collections.Array<string> = new collections.Array<string>();
      expect(arrStr instanceof collections.Array).assertTrue();
      expect(arrStr.length).assertEqual(0);

      let arrBool: collections.Array<boolean> = new collections.Array<boolean>();
      expect(arrBool instanceof collections.Array).assertTrue();
      expect(arrBool.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_0200
     * @tc.name testArrayConstructor0002
     * @tc.desc Verify that constructor(first, ...left) creates an Array with specified elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0002';
      console.info(`${caseName}, test start`);

      let arrNum: collections.Array<number> = new collections.Array<number>(BasicTypeTestData.NUMBER_NORMAL);
      expect(arrNum.length).assertEqual(1);
      expect(arrNum[0]).assertEqual(BasicTypeTestData.NUMBER_NORMAL);

      let arrStr: collections.Array<string> = new collections.Array<string>(BasicTypeTestData.STRING_NORMAL);
      expect(arrStr.length).assertEqual(1);
      expect(arrStr[0]).assertEqual(BasicTypeTestData.STRING_NORMAL);

      let arrBool: collections.Array<boolean> = new collections.Array<boolean>(BasicTypeTestData.BOOLEAN_TRUE);
      expect(arrBool.length).assertEqual(1);
      expect(arrBool[0]).assertEqual(BasicTypeTestData.BOOLEAN_TRUE);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_0300
     * @tc.name testArrayConstructor0003
     * @tc.desc Verify that constructor(...items) creates an Array with spread elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0003';
      console.info(`${caseName}, test start`);

      let arrNum: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      expect(arrNum.length).assertEqual(5);
      expect(arrNum[0]).assertEqual(1);
      expect(arrNum[4]).assertEqual(5);

      let arrStr: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
      expect(arrStr.length).assertEqual(3);
      expect(arrStr[0]).assertEqual('a');
      expect(arrStr[2]).assertEqual('c');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_0400
     * @tc.name testArrayConstructor0004
     * @tc.desc Verify that static create() creates an Array with specified length and fill value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0004';
      console.info(`${caseName}, test start`);

      let arrNum: collections.Array<number> = collections.Array.create<number>(3, BasicTypeTestData.NUMBER_NORMAL);
      expect(arrNum.length).assertEqual(3);
      expect(arrNum[0]).assertEqual(BasicTypeTestData.NUMBER_NORMAL);
      expect(arrNum[1]).assertEqual(BasicTypeTestData.NUMBER_NORMAL);
      expect(arrNum[2]).assertEqual(BasicTypeTestData.NUMBER_NORMAL);

      let arrStr: collections.Array<string> = collections.Array.create<string>(2, BasicTypeTestData.STRING_NORMAL);
      expect(arrStr.length).assertEqual(2);
      expect(arrStr[0]).assertEqual(BasicTypeTestData.STRING_NORMAL);

      let arrBool: collections.Array<boolean> = collections.Array.create<boolean>(4, true);
      expect(arrBool.length).assertEqual(4);
      expect(arrBool[0]).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_0500
     * @tc.name testArrayConstructor0005
     * @tc.desc Verify that static from() creates an Array from an ArrayLike object.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0005';
      console.info(`${caseName}, test start`);

      let nativeArr: number[] = [];
      nativeArr[0] = 1;
      nativeArr[1] = 2;
      nativeArr[2] = 3;
      nativeArr[3] = 4;
      nativeArr[4] = 5;
      let arr1: collections.Array<number> = collections.Array.from<number>(nativeArr);
      expect(arr1.length).assertEqual(5);
      expect(arr1[0]).assertEqual(1);

      let emptyNativeArr: number[] = [];
      let arr2: collections.Array<number> = collections.Array.from<number>(emptyNativeArr);
      expect(arr2.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交构造测试：number 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_0600
     * @tc.name testArrayConstructor0006
     * @tc.desc Verify that constructor() creates empty Array for all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0006';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        expect(arr.length).assertEqual(0);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_0700
     * @tc.name testArrayConstructor0007
     * @tc.desc Verify that constructor(items) creates Array for all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0007';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        expect(arr.length).assertEqual(1);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr[0])).assertTrue();
        } else {
          expect(arr[0]).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_0800
     * @tc.name testArrayConstructor0008
     * @tc.desc Verify that constructor(...items) creates Array for all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0008';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, item.value);
        expect(arr.length).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_0900
     * @tc.name testArrayConstructor0009
     * @tc.desc Verify that static create() works for all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0009';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = collections.Array.create<number>(2, item.value);
        expect(arr.length).assertEqual(2);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr[0])).assertTrue();
          expect(Number.isNaN(arr[1])).assertTrue();
        } else {
          expect(arr[0]).assertEqual(item.value);
          expect(arr[1]).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_1000
     * @tc.name testArrayConstructor0010
     * @tc.desc Verify that static from() works for all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0010';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let nativeArr: number[] = [];
        nativeArr[0] = item.value;
        let arr: collections.Array<number> = collections.Array.from<number>(nativeArr);
        expect(arr.length).assertEqual(1);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(arr[0])).assertTrue();
        } else {
          expect(arr[0]).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交构造测试：string 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_1100
     * @tc.name testArrayConstructor0011
     * @tc.desc Verify that constructor() creates empty Array for all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0011';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let arr: collections.Array<string> = new collections.Array<string>();
        expect(arr.length).assertEqual(0);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_1200
     * @tc.name testArrayConstructor0012
     * @tc.desc Verify that constructor(items) creates Array for all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0012';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_1300
     * @tc.name testArrayConstructor0013
     * @tc.desc Verify that constructor(...items) creates Array for all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0013';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, item.value);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(item.value);
        expect(arr[1]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_1400
     * @tc.name testArrayConstructor0014
     * @tc.desc Verify that static create() works for all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0014';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = collections.Array.create<string>(2, item.value);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(item.value);
        expect(arr[1]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_1500
     * @tc.name testArrayConstructor0015
     * @tc.desc Verify that static from() works for all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0015';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let nativeArr: string[] = [];
        nativeArr[0] = item.value;
        let arr: collections.Array<string> = collections.Array.from<string>(nativeArr);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交构造测试：boolean 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_1600
     * @tc.name testArrayConstructor0016
     * @tc.desc Verify that constructor() creates empty Array for all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0016';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        expect(arr.length).assertEqual(0);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_1700
     * @tc.name testArrayConstructor0017
     * @tc.desc Verify that constructor(items) creates Array for all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0017';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_1800
     * @tc.name testArrayConstructor0018
     * @tc.desc Verify that constructor(...items) creates Array for all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0018';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, item.value);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(item.value);
        expect(arr[1]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_1900
     * @tc.name testArrayConstructor0019
     * @tc.desc Verify that static create() works for all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0019';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = collections.Array.create<boolean>(3, item.value);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(item.value);
        expect(arr[1]).assertEqual(item.value);
        expect(arr[2]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_2000
     * @tc.name testArrayConstructor0020
     * @tc.desc Verify that static from() works for all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0020';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let nativeArr: boolean[] = [];
        nativeArr[0] = item.value;
        let arr: collections.Array<boolean> = collections.Array.from<boolean>(nativeArr);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交构造测试：Sendable 对象类型 ====================
    // 注意：undefined_value 和 null_value 因 ArkTS 限制（arkts-sendable-as-expr）
    // 无法作为 ISendable 直接传递，已在 TestDataFactory 中注释掉原始值写法。
    // 此处分 5 个测试（test0021-0025）覆盖其余 34 个 ISendable 测试值。

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_2100
     * @tc.name testArrayConstructor0021
     * @tc.desc Verify that constructor() creates empty Array for all Sendable types.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0021';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          expect(arr.length).assertEqual(0);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_2200
     * @tc.name testArrayConstructor0022
     * @tc.desc Verify that constructor(value) creates Array for all Sendable types.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0022';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr.length).assertEqual(1);
          expect(arr[0] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_2300
     * @tc.name testArrayConstructor0023
     * @tc.desc Verify that constructor(value, value) creates Array for all Sendable types.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0023';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value, item.value);
          expect(arr.length).assertEqual(2);
          expect(arr[0] === item.value).assertTrue();
          expect(arr[1] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_2400
     * @tc.name testArrayConstructor0024
     * @tc.desc Verify that static create() works for all Sendable types.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0024';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = collections.Array.create<lang.ISendable>(2, item.value);
          expect(arr.length).assertEqual(2);
          expect(arr[0] === item.value).assertTrue();
          expect(arr[1] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_2500
     * @tc.name testArrayConstructor0025
     * @tc.desc Verify that static from() works for all Sendable types.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConstructor0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayConstructor0025';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let nativeArr: lang.ISendable[] = [];
          nativeArr[0] = item.value;
          let arr: collections.Array<lang.ISendable> = collections.Array.from<lang.ISendable>(nativeArr);
          expect(arr.length).assertEqual(1);
          expect(arr[0] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });
    // ==================== undefined/null 构造测试（暂不支持） ====================
    // 注意：以下测试因 collections.Array 不支持 undefined 和 null 作为元素类型，暂时注释
    // 待后续环境支持后再启用

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_2600
     * @tc.name testArrayConstructor0026
     * @tc.desc Verify that constructor() creates empty Array for undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayConstructor0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayConstructor0026';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<undefined> = new collections.Array<undefined>();
    //   expect(arr.length).assertEqual(0);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_2700
     * @tc.name testArrayConstructor0027
     * @tc.desc Verify that constructor() creates empty Array for null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayConstructor0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayConstructor0027';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<null> = new collections.Array<null>();
    //   expect(arr.length).assertEqual(0);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_2800
     * @tc.name testArrayConstructor0028
     * @tc.desc Verify that constructor(items) creates Array with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayConstructor0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayConstructor0028';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<undefined> = new collections.Array<undefined>(undefined);
    //   expect(arr.length).assertEqual(1);
    //   expect(arr[0]).assertEqual(undefined);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_2900
     * @tc.name testArrayConstructor0029
     * @tc.desc Verify that constructor(items) creates Array with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayConstructor0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayConstructor0029';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<null> = new collections.Array<null>(null);
    //   expect(arr.length).assertEqual(1);
    //   expect(arr[0]).assertEqual(null);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_3000
     * @tc.name testArrayConstructor0030
     * @tc.desc Verify that constructor(...items) creates Array with spread undefined values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayConstructor0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayConstructor0030';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<undefined> = new collections.Array<undefined>(undefined, undefined);
    //   expect(arr.length).assertEqual(2);
    //   expect(arr[0]).assertEqual(undefined);
    //   expect(arr[1]).assertEqual(undefined);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_3100
     * @tc.name testArrayConstructor0031
     * @tc.desc Verify that constructor(...items) creates Array with spread null values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayConstructor0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayConstructor0031';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<null> = new collections.Array<null>(null, null);
    //   expect(arr.length).assertEqual(2);
    //   expect(arr[0]).assertEqual(null);
    //   expect(arr[1]).assertEqual(null);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_3200
     * @tc.name testArrayConstructor0032
     * @tc.desc Verify that static create() works with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayConstructor0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayConstructor0032';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<undefined> = collections.Array.create<undefined>(3, undefined);
    //   expect(arr.length).assertEqual(3);
    //   expect(arr[0]).assertEqual(undefined);
    //   expect(arr[1]).assertEqual(undefined);
    //   expect(arr[2]).assertEqual(undefined);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_3300
     * @tc.name testArrayConstructor0033
     * @tc.desc Verify that static create() works with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayConstructor0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayConstructor0033';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<null> = collections.Array.create<null>(3, null);
    //   expect(arr.length).assertEqual(3);
    //   expect(arr[0]).assertEqual(null);
    //   expect(arr[1]).assertEqual(null);
    //   expect(arr[2]).assertEqual(null);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_3400
     * @tc.name testArrayConstructor0034
     * @tc.desc Verify that static from() works with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayConstructor0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayConstructor0034';
    //   console.info(`${caseName}, test start`);
    //
    //   let nativeArr: undefined[] = [];
    //   nativeArr[0] = undefined;
    //   let arr: collections.Array<undefined> = collections.Array.from<undefined>(nativeArr);
    //   expect(arr.length).assertEqual(1);
    //   expect(arr[0]).assertEqual(undefined);
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONSTRUCTOR_3500
     * @tc.name testArrayConstructor0035
     * @tc.desc Verify that static from() works with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // it('testArrayConstructor0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayConstructor0035';
    //   console.info(`${caseName}, test start`);
    //
    //   let nativeArr: null[] = [];
    //   nativeArr[0] = null;
    //   let arr: collections.Array<null> = collections.Array.from<null>(nativeArr);
    //   expect(arr.length).assertEqual(1);
    //   expect(arr[0]).assertEqual(null);
    //
    //   console.info(`${caseName}, test end`);
    // });
  });
}