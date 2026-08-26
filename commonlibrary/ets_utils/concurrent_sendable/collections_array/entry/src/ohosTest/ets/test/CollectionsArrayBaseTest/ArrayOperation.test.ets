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
// ArrayOperation.test.ets
// 栈/队列操作方法组（4个）：push, pop, unshift, shift

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
  describe('ArrayOperationTests', () => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    // ==================== 基础操作测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_0100
     * @tc.name testArrayOperation0001
     * @tc.desc Verify that push adds elements and pop removes and returns the last element.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0001';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      expect(arr.push(10)).assertEqual(1);
      expect(arr.pop()).assertEqual(10);
      const popped: number | null | undefined = arr.pop();
      expect(popped === null || popped === undefined).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_0200
     * @tc.name testArrayOperation0002
     * @tc.desc Verify that unshift adds elements to the front and shift removes and returns the first element.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0002';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      expect(arr.unshift(10)).assertEqual(1);
      expect(arr.shift()).assertEqual(10);
      const shifted: number | null | undefined = arr.shift();
      expect(shifted === null || shifted === undefined).assertTrue();

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交操作测试：number 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_1100
     * @tc.name testArrayOperation0011
     * @tc.desc Verify push and pop with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0011';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(item.value);
        let popped: number | undefined = arr.pop();
        if (item.id === 'number_nan') {
          expect(Number.isNaN(popped as number)).assertTrue();
        } else {
          expect(popped).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_1200
     * @tc.name testArrayOperation0012
     * @tc.desc Verify unshift and shift with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0012';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.unshift(item.value);
        let shifted: number | undefined = arr.shift();
        if (item.id === 'number_nan') {
          expect(Number.isNaN(shifted as number)).assertTrue();
        } else {
          expect(shifted).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交操作测试：string 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_2100
     * @tc.name testArrayOperation0021
     * @tc.desc Verify push and pop with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0021';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        expect(arr.push(item.value)).assertEqual(1);
        expect(arr.pop()).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_2200
     * @tc.name testArrayOperation0022
     * @tc.desc Verify unshift and shift with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0022';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        expect(arr.unshift(item.value)).assertEqual(1);
        expect(arr.shift()).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交操作测试：boolean 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_3100
     * @tc.name testArrayOperation0031
     * @tc.desc Verify push and pop with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0031';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        expect(arr.push(item.value)).assertEqual(1);
        expect(arr.pop()).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_3200
     * @tc.name testArrayOperation0032
     * @tc.desc Verify unshift and shift with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0032';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        expect(arr.unshift(item.value)).assertEqual(1);
        expect(arr.shift()).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_4100
     * @tc.name testArrayOperation0041
     * @tc.desc Verify push/pop with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0041';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          expect(arr.push(item.value)).assertEqual(1);
          TestHelper.assertNotNull(arr.pop(), 'pop ' + item.id);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_4200
     * @tc.name testArrayOperation0042
     * @tc.desc Verify unshift/shift with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0042';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          expect(arr.unshift(item.value)).assertEqual(1);
          TestHelper.assertNotNull(arr.shift(), 'shift ' + item.id);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 参数变体测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_5100
     * @tc.name testArrayOperation0051
     * @tc.desc Verify push with multiple arguments.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0051';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      let newLength: number = arr.push(10, 20, 30);
      expect(newLength).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_5200
     * @tc.name testArrayOperation0052
     * @tc.desc Verify unshift with multiple arguments.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0052';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2);
      let newLength: number = arr.unshift(-1, 0);
      expect(newLength).assertEqual(4);
      expect(arr[0]).assertEqual(-1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    // ==================== unshift/shift 补充测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_5600
     * @tc.name testArrayOperation0056
     * @tc.desc Verify unshift with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0056';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        let len: number = arr.unshift(item.value);
        expect(len).assertEqual(1);
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_5700
     * @tc.name testArrayOperation0057
     * @tc.desc Verify shift with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0057';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        let shifted: number | undefined = arr.shift();
        expect(arr.length).assertEqual(0);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(shifted as number)).assertTrue();
        } else {
          expect(shifted).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_5800
     * @tc.name testArrayOperation0058
     * @tc.desc Verify unshift with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0058';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        expect(arr.unshift(item.value)).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_5900
     * @tc.name testArrayOperation0059
     * @tc.desc Verify shift with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0059';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.shift()).assertEqual(item.value);
        expect(arr.length).assertEqual(0);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_6000
     * @tc.name testArrayOperation0060
     * @tc.desc Verify unshift with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0060';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        let len: number = arr.unshift(item.value);
        expect(len).assertEqual(1);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_6100
     * @tc.name testArrayOperation0061
     * @tc.desc Verify shift with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0061';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        let shifted: boolean | undefined = arr.shift();
        expect(shifted).assertEqual(item.value);
        expect(arr.length).assertEqual(0);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== push/pop 补充测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_6200
     * @tc.name testArrayOperation0062
     * @tc.desc Verify push returns new length and updates Array for number.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0062';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      let len: number = arr.push(100);
      expect(len).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);

      len = arr.push(200, 300);
      expect(len).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_6300
     * @tc.name testArrayOperation0063
     * @tc.desc Verify push with string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0063';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        let len: number = arr.push(item.value);
        expect(len).assertEqual(1);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_6400
     * @tc.name testArrayOperation0064
     * @tc.desc Verify push with Sendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0064';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
          let len: number = arr.push(item.value);
          expect(len).assertEqual(1);
          expect(arr.length).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_6500
     * @tc.name testArrayOperation0065
     * @tc.desc Verify pop returns removed element and updates length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0065';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
      let popped: number | undefined = arr.pop();
      expect(popped).assertEqual(300);
      expect(arr.length).assertEqual(2);

      popped = arr.pop();
      expect(popped).assertEqual(200);
      expect(arr.length).assertEqual(1);

      popped = arr.pop();
      expect(popped).assertEqual(100);
      expect(arr.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_6600
     * @tc.name testArrayOperation0066
     * @tc.desc Verify pop on empty Array returns undefined.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0066';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      let popped: number | undefined = arr.pop();
      expect(popped).assertEqual(undefined);
      expect(arr.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_6700
     * @tc.name testArrayOperation0067
     * @tc.desc Verify pop with string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0067';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        let popped: string | undefined = arr.pop();
        expect(popped).assertEqual(item.value);
        expect(arr.length).assertEqual(0);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_6800
     * @tc.name testArrayOperation0068
     * @tc.desc Verify push with all number test values using factory data.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0068';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        let len: number = arr.push(item.value);
        expect(len).assertEqual(1);
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_6900
     * @tc.name testArrayOperation0069
     * @tc.desc Verify pop with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0069';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        let popped: number | undefined = arr.pop();
        expect(arr.length).assertEqual(0);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(popped as number)).assertTrue();
        } else {
          expect(popped).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_7000
     * @tc.name testArrayOperation0070
     * @tc.desc Verify push with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0070';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        let len: number = arr.push(item.value);
        expect(len).assertEqual(1);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_7100
     * @tc.name testArrayOperation0071
     * @tc.desc Verify pop with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0071';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        let popped: boolean | undefined = arr.pop();
        expect(popped).assertEqual(item.value);
        expect(arr.length).assertEqual(0);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_7200
     * @tc.name testArrayOperation0072
     * @tc.desc Verify pop with all Sendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0072';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let popped: lang.ISendable | undefined = arr.pop();
          TestHelper.assertNotNull(popped, 'pop sendable ' + item.id);
          expect(arr.length).assertEqual(0);
        }
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== undefined/null 操作测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_7300
     * @tc.name testArrayOperation0073
     * @tc.desc Verify push with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0073';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>();
      let len: number = arr.push(undefined);
      expect(len).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_7400
     * @tc.name testArrayOperation0074
     * @tc.desc Verify push with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0074';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>();
      let len: number = arr.push(null);
      expect(len).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(null);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_7500
     * @tc.name testArrayOperation0075
     * @tc.desc Verify pop with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0075';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined);
      let popped: lang.ISendable | null | undefined = arr.pop();
      expect(popped).assertEqual(undefined);
      expect(arr.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_7600
     * @tc.name testArrayOperation0076
     * @tc.desc Verify pop with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0076';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null);
      let popped: lang.ISendable | null | undefined = arr.pop();
      expect(popped).assertEqual(null);
      expect(arr.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_7700
     * @tc.name testArrayOperation0077
     * @tc.desc Verify unshift with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0077';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>();
      let len: number = arr.unshift(undefined);
      expect(len).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_7800
     * @tc.name testArrayOperation0078
     * @tc.desc Verify unshift with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0078';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>();
      let len: number = arr.unshift(null);
      expect(len).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(null);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_7900
     * @tc.name testArrayOperation0079
     * @tc.desc Verify shift with undefined value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0079';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(undefined);
      let shifted: lang.ISendable | null | undefined = arr.shift();
      expect(shifted).assertEqual(undefined);
      expect(arr.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_8000
     * @tc.name testArrayOperation0080
     * @tc.desc Verify shift with null value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0080';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<lang.ISendable | null | undefined> =
        new collections.Array<lang.ISendable | null | undefined>(null);
      let shifted: lang.ISendable | null | undefined = arr.shift();
      expect(shifted).assertEqual(null);
      expect(arr.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });
  });
}
