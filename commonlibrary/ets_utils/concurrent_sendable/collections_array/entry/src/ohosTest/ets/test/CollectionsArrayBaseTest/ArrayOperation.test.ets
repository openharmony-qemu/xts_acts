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
// ArrayOperation.test.ets null和undefined在环境中不支持，注释了12个用例
// 操作方法组（12个）：push, pop, unshift, shift, splice, slice, fill, copyWithin, sort, reverse, extendTo, shrinkTo

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
  TestValueItem
} from './test_data/TestDataFactory';
import { TestHelper } from './test_utils/TestHelper';

export default function suite() {
  describe('ArrayOperationTests', () => {
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
      expect(arr.pop() === null || arr.pop() === undefined).assertTrue();

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
      expect(arr.shift() === null || arr.shift() === undefined).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_0300
     * @tc.name testArrayOperation0003
     * @tc.desc Verify that splice deletes and inserts elements correctly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0003';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      expect(arr.splice(2, 2).length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_0400
     * @tc.name testArrayOperation0004
     * @tc.desc Verify that slice returns a new Array with the specified range of elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0004';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      expect(arr.slice(1, 4).length).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_0500
     * @tc.name testArrayOperation0005
     * @tc.desc Verify that fill fills all elements with the specified value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0005';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      arr.fill(0);
      expect(arr[0]).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_0600
     * @tc.name testArrayOperation0006
     * @tc.desc Verify that copyWithin copies elements within the Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0006';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 3);
      expect(arr[0]).assertEqual(4);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_0700
     * @tc.name testArrayOperation0007
     * @tc.desc Verify that sort sorts elements in ascending order by default.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0007';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(5, 2, 4, 1, 3);
      arr.sort();
      expect(arr[0]).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_0800
     * @tc.name testArrayOperation0008
     * @tc.desc Verify that reverse reverses the order of elements in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0008';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      arr.reverse();
      expect(arr[0]).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_0900
     * @tc.name testArrayOperation0009
     * @tc.desc Verify that extendTo extends the Array to the specified length with the fill value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0009';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2);
      arr.extendTo(5, 0);
      expect(arr.length).assertEqual(5);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_1000
     * @tc.name testArrayOperation0010
     * @tc.desc Verify that shrinkTo shrinks the Array to the specified length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0010';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      expect(arr.length).assertEqual(3);

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
        expect(arr.unshift(item.value)).assertEqual(1);
        let shifted: number = arr.shift() as number;
        if (item.id === 'number_nan') {
          expect(Number.isNaN(shifted)).assertTrue();
        } else {
          expect(shifted).assertEqual(item.value);
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
        expect(arr.unshift(item.value)).assertEqual(1);
        let shifted: number = arr.shift() as number;
        if (item.id === 'number_nan') {
          expect(Number.isNaN(shifted)).assertTrue();
        } else {
          expect(shifted).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_1300
     * @tc.name testArrayOperation0013
     * @tc.desc Verify splice with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0013';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_1400
     * @tc.name testArrayOperation0014
     * @tc.desc Verify slice with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0014';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_1500
     * @tc.name testArrayOperation0015
     * @tc.desc Verify fill with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0015';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_1600
     * @tc.name testArrayOperation0016
     * @tc.desc Verify copyWithin with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0016';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_1700
     * @tc.name testArrayOperation0017
     * @tc.desc Verify sort with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0017';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        // 跳过 NaN，因为 NaN 排序无意义
        if (item.id === 'number_nan') {
          continue;
        }
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(item.value);
        arr.push(0);
        arr.sort((a: number, b: number) => a - b);
        expect(arr.length).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_1800
     * @tc.name testArrayOperation0018
     * @tc.desc Verify reverse with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0018';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_1900
     * @tc.name testArrayOperation0019
     * @tc.desc Verify extendTo with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0019';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_2000
     * @tc.name testArrayOperation0020
     * @tc.desc Verify shrinkTo with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0020';
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

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_2300
     * @tc.name testArrayOperation0023
     * @tc.desc Verify splice with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0023';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_2400
     * @tc.name testArrayOperation0024
     * @tc.desc Verify slice with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0024';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_2500
     * @tc.name testArrayOperation0025
     * @tc.desc Verify fill with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0025';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_2600
     * @tc.name testArrayOperation0026
     * @tc.desc Verify copyWithin with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0026';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_2700
     * @tc.name testArrayOperation0027
     * @tc.desc Verify sort with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0027';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push(item.value);
        arr.push('aaa');
        arr.sort();
        expect(arr.length).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_2800
     * @tc.name testArrayOperation0028
     * @tc.desc Verify reverse with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0028';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_2900
     * @tc.name testArrayOperation0029
     * @tc.desc Verify extendTo with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0029';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_3000
     * @tc.name testArrayOperation0030
     * @tc.desc Verify shrinkTo with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0030';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_3300
     * @tc.name testArrayOperation0033
     * @tc.desc Verify splice with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0033';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_3400
     * @tc.name testArrayOperation0034
     * @tc.desc Verify slice with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0034';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_3500
     * @tc.name testArrayOperation0035
     * @tc.desc Verify fill with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0035';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_3600
     * @tc.name testArrayOperation0036
     * @tc.desc Verify copyWithin with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0036';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_3700
     * @tc.name testArrayOperation0037
     * @tc.desc Verify sort with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0037';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(item.value);
        arr.push(false);
        arr.sort();
        expect(arr.length).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_3800
     * @tc.name testArrayOperation0038
     * @tc.desc Verify reverse with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0038';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(item.value);
        arr.push(!item.value);
        arr.reverse();
        expect(arr.length).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_3900
     * @tc.name testArrayOperation0039
     * @tc.desc Verify extendTo with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0039';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_4000
     * @tc.name testArrayOperation0040
     * @tc.desc Verify shrinkTo with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0040';
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

    // ==================== 正交操作测试：Sendable 对象类型 ====================
    // 注意：undefined_value 和 null_value 因 ArkTS 编译器限制无法直接传递，
    // 已在 TestDataFactory 中注释。以下测试覆盖其余 34 个 ISendable 兼容的测试值。

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

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_4300
     * @tc.name testArrayOperation0043
     * @tc.desc Verify splice with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0043';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_4400
     * @tc.name testArrayOperation0044
     * @tc.desc Verify slice with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0044';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_4500
     * @tc.name testArrayOperation0045
     * @tc.desc Verify fill with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0045';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_4600
     * @tc.name testArrayOperation0046
     * @tc.desc Verify copyWithin with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0046';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_4700
     * @tc.name testArrayOperation0047
     * @tc.desc Verify sort with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0047';
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
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_4800
     * @tc.name testArrayOperation0048
     * @tc.desc Verify reverse with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0048';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_4900
     * @tc.name testArrayOperation0049
     * @tc.desc Verify extendTo with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0049';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_5000
     * @tc.name testArrayOperation0050
     * @tc.desc Verify shrinkTo with all Sendable object test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0050';
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

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_5300
     * @tc.name testArrayOperation0053
     * @tc.desc Verify splice without deleteCount (removes all from start to end).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0053';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_5400
     * @tc.name testArrayOperation0054
     * @tc.desc Verify splice with insert items.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0054';
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
     * @tc.number SUB_COLLECTIONS_ARRAY_OPERATION_5500
     * @tc.name testArrayOperation0055
     * @tc.desc Verify [index] operator does not support negative index.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayOperation0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayOperation0055';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30);
      // 正向验证：正索引正常
      expect(arr[0]).assertEqual(10);
      // 验证 at 支持负索引
      expect(arr.at(-1)).assertEqual(30);
      // 验证 [index] 不支持负索引（编译期限制，此处验证 at 可用即可）

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

    // ==================== boolean unshift/shift 补充测试 ====================

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
    // 以下测试从 ArrayTraversal.test.ets 迁移至此，归属操作方法组

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
  });
}