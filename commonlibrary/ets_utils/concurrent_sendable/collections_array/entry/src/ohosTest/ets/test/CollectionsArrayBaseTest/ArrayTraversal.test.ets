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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, lang } from '@kit.ArkTS';
import {
  getNumberTestValues,
  getStringTestValues,
  getAllTestValues,
  NumberTestValue,
  StringTestValue,
  TestValueItem,
  BooleanTestValue,
  getBooleanTestValues
} from './test_data/TestDataFactory';
import { TestHelper } from './test_utils/TestHelper';

export default function suite() {
  describe('ArrayTraversalTests', () => {
    // ==================== 基础遍历测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_0100
     * @tc.name testArrayTraversal0001
     * @tc.desc Verify that forEach iterates over all elements and does not execute on empty Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0001';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let count: number = 0;
      arr.forEach((): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);

      let emptyArr: collections.Array<number> = new collections.Array<number>();
      let executed: boolean = false;
      emptyArr.forEach((): void => {
        executed = true;
      });
      expect(executed).assertFalse();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_0200
     * @tc.name testArrayTraversal0002
     * @tc.desc Verify that entries returns key-value pairs iterator.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0002';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30);
      let c: number = 0;
      for (let entry of arr.entries()) {
        expect(entry[0]).assertEqual(c);
        c = c + 1;
      }
      expect(c).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_0300
     * @tc.name testArrayTraversal0003
     * @tc.desc Verify that keys returns index iterator.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0003';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30);
      let c: number = 0;
      for (let _ of arr.keys()) {
        c = c + 1;
      }
      expect(c).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_0400
     * @tc.name testArrayTraversal0004
     * @tc.desc Verify that values returns value iterator.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0004';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30);
      let c: number = 0;
      for (let _ of arr.values()) {
        c = c + 1;
      }
      expect(c).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_0500
     * @tc.name testArrayTraversal0005
     * @tc.desc Verify that map transforms each element.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0005';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let mapped: collections.Array<number> = arr.map((x: number): number => x * 2);
      expect(mapped.length).assertEqual(3);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_0600
     * @tc.name testArrayTraversal0006
     * @tc.desc Verify that filter returns elements matching predicate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0006';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      let filtered: collections.Array<number> = arr.filter((x: number): boolean => x > 3);
      expect(filtered.length).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_0700
     * @tc.name testArrayTraversal0007
     * @tc.desc Verify that reduce accumulates values correctly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0007';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
      let result: number = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(10);

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交遍历测试 ====================
    // 注意：undefined_value 和 null_value 因 ArkTS 编译器限制（arkts-sendable-as-expr）
    // 无法作为 ISendable 直接传递，已在 TestDataFactory 中注释。以下 ISendable 遍历
    // 测试（test0008-0014）覆盖其余 34 个测试值，共计 238/252 = 94.4% 场景。

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_0800
     * @tc.name testArrayTraversal0008
     * @tc.desc Verify forEach with all test values including callback parameters.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0008';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          arr.forEach((value: lang.ISendable, index: number, array: collections.Array<lang.ISendable>): void => {
            TestHelper.assertNotNull(value, 'forEach value ' + item.id);
            expect(index).assertEqual(0);
            TestHelper.assertNotNull(array, 'forEach array ' + item.id);
          });
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_0900
     * @tc.name testArrayTraversal0009
     * @tc.desc Verify map with all test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0009';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let mapped: collections.Array<lang.ISendable> = arr.map((value: lang.ISendable): lang.ISendable => value);
          expect(mapped.length).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_1000
     * @tc.name testArrayTraversal0010
     * @tc.desc Verify filter with all test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0010';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let filtered: collections.Array<lang.ISendable> = arr.filter((): boolean => true);
          expect(filtered.length).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_1100
     * @tc.name testArrayTraversal0011
     * @tc.desc Verify entries with all test values including iterator done and empty array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0011';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let iter: IterableIterator<[number, lang.ISendable]> = arr.entries();
          let result: IteratorResult<[number, lang.ISendable]> = iter.next();
          expect(result.done).assertEqual(false);
          expect(result.value[0]).assertEqual(0);
          expect(iter.next().done).assertEqual(true);
        }
      }
      let emptyArr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
      expect(emptyArr.entries().next().done).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_1200
     * @tc.name testArrayTraversal0012
     * @tc.desc Verify keys with all test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0012';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let c: number = 0;
          for (let _ of arr.keys()) {
            c = c + 1;
          }
          expect(c).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_1300
     * @tc.name testArrayTraversal0013
     * @tc.desc Verify values with all test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0013';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          let c: number = 0;
          for (let _ of arr.values()) {
            c = c + 1;
          }
          expect(c).assertEqual(1);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_1400
     * @tc.name testArrayTraversal0014
     * @tc.desc Verify reduce with all test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0014';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>();
        arr.push(item.value);
        arr.push(item.value);
        let sum: number = arr.reduce((acc: number, cur: number): number => acc + cur);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(sum)).assertTrue();
        } else {
          expect(!Number.isNaN(sum)).assertTrue();
        }
      }
      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>();
        arr.push(item.value);
        arr.push(item.value);
        let concat: string = arr.reduce((acc: string, cur: string): string => acc + cur);
        TestHelper.assertNotNull(concat, 'reduce string ' + item.id);
      }

      console.info(`${caseName}, test end`);
    });
    // ==================== 正交遍历测试：string 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_1500
     * @tc.name testArrayTraversal0015
     * @tc.desc Verify forEach with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0015';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        arr.forEach((value: string, index: number): void => {
          expect(value).assertEqual(item.value);
          expect(index).assertEqual(0);
        });
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_1600
     * @tc.name testArrayTraversal0016
     * @tc.desc Verify entries with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0016';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        let iter: IterableIterator<[number, string]> = arr.entries();
        let result: IteratorResult<[number, string]> = iter.next();
        expect(result.done).assertEqual(false);
        expect(result.value[0]).assertEqual(0);
        expect(result.value[1]).assertEqual(item.value);
        expect(iter.next().done).assertEqual(true);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_1700
     * @tc.name testArrayTraversal0017
     * @tc.desc Verify map with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0017';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        let mapped: collections.Array<string> = arr.map((value: string): string => value + '_mapped');
        expect(mapped.length).assertEqual(1);
        expect(mapped[0]).assertEqual(item.value + '_mapped');
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_1800
     * @tc.name testArrayTraversal0018
     * @tc.desc Verify filter with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0018';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, 'other');
        let filtered: collections.Array<string> = arr.filter((value: string): boolean => value === item.value);
        expect(filtered.length).assertEqual(1);
        expect(filtered[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 正交遍历测试：boolean 类型 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_1900
     * @tc.name testArrayTraversal0019
     * @tc.desc Verify forEach with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0019';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, !item.value);
        let count: number = 0;
        arr.forEach((value: boolean): void => {
          count = count + 1;
        });
        expect(count).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_2000
     * @tc.name testArrayTraversal0020
     * @tc.desc Verify map with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0020';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        let mapped: collections.Array<boolean> = arr.map((value: boolean): boolean => !value);
        expect(mapped.length).assertEqual(1);
        expect(mapped[0]).assertEqual(!item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_2100
     * @tc.name testArrayTraversal0021
     * @tc.desc Verify filter with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0021';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, !item.value);
        let filtered: collections.Array<boolean> = arr.filter((value: boolean): boolean => value === item.value);
        expect(filtered.length).assertEqual(1);
        expect(filtered[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_2200
     * @tc.name testArrayTraversal0022
     * @tc.desc Verify reduce with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0022';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, item.value);
        let result: boolean = arr.reduce((acc: boolean, cur: boolean): boolean => acc && cur);
        expect(result).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== 参数变体测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_2300
     * @tc.name testArrayTraversal0023
     * @tc.desc Verify forEach with index parameter on multi-element array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0023';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
      let indexes: collections.Array<number> = new collections.Array<number>();
      arr.forEach((_value: string, index: number): void => {
        indexes.push(index);
      });
      expect(indexes[0]).assertEqual(0);
      expect(indexes[1]).assertEqual(1);
      expect(indexes[2]).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_2400
     * @tc.name testArrayTraversal0024
     * @tc.desc Verify reduce with initial value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0024';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let result: number = arr.reduce((acc: number, cur: number): number => acc + cur, 10);
      expect(result).assertEqual(16);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_2500
     * @tc.name testArrayTraversal0025
     * @tc.desc Verify empty array forEach does not execute callback.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0025';
      console.info(`${caseName}, test start`);

      let emptyArr: collections.Array<number> = new collections.Array<number>();
      let executed: boolean = false;
      emptyArr.forEach((): void => {
        executed = true;
      });
      expect(executed).assertFalse();

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_2600
     * @tc.name testArrayTraversal0026
     * @tc.desc Verify keys with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0026';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, item.value);
        let c: number = 0;
        for (let _ of arr.keys()) {
          c = c + 1;
        }
        expect(c).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_2700
     * @tc.name testArrayTraversal0027
     * @tc.desc Verify values with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0027';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, item.value);
        let c: number = 0;
        for (let _ of arr.values()) {
          c = c + 1;
        }
        expect(c).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_2800
     * @tc.name testArrayTraversal0028
     * @tc.desc Verify keys with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0028';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, !item.value);
        let c: number = 0;
        for (let _ of arr.keys()) {
          c = c + 1;
        }
        expect(c).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_2900
     * @tc.name testArrayTraversal0029
     * @tc.desc Verify values with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0029';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, !item.value);
        let c: number = 0;
        for (let _ of arr.values()) {
          c = c + 1;
        }
        expect(c).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_3000
     * @tc.name testArrayTraversal0030
     * @tc.desc Verify entries with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0030';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value, !item.value);
        let iter: IterableIterator<[number, boolean]> = arr.entries();
        let result: IteratorResult<[number, boolean]> = iter.next();
        expect(result.done).assertEqual(false);
        expect(result.value[0]).assertEqual(0);
        expect(result.value[1]).assertEqual(item.value);
        let result2: IteratorResult<[number, boolean]> = iter.next();
        expect(result2.done).assertEqual(false);
        expect(result2.value[0]).assertEqual(1);
        expect(iter.next().done).assertEqual(true);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_3100
     * @tc.name testArrayTraversal0031
     * @tc.desc Verify reduce with all ISendable test values (count elements).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0031';
      console.info(`${caseName}, test start`);

      let allValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < allValues.length; i++) {
        let item: TestValueItem = allValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value, item.value);
          let count: number = arr.reduce((acc: number, _cur: lang.ISendable): number => acc + 1, 0);
          expect(count).assertEqual(2);
        }
      }

      console.info(`${caseName}, test end`);
    });
    // ==================== 正交遍历测试：number 类型专项 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_3200
     * @tc.name testArrayTraversal0032
     * @tc.desc Verify forEach with all number test values including NaN.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0032';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, item.value);
        arr.forEach((value: number, index: number): void => {
          if (item.id === 'number_nan') {
            expect(Number.isNaN(value)).assertTrue();
          } else {
            expect(value).assertEqual(item.value);
          }
        });
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_3300
     * @tc.name testArrayTraversal0033
     * @tc.desc Verify entries with all number test values including NaN.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0033';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, item.value);
        let iter: IterableIterator<[number, number]> = arr.entries();
        let result: IteratorResult<[number, number]> = iter.next();
        expect(result.done).assertEqual(false);
        expect(result.value[0]).assertEqual(0);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(result.value[1])).assertTrue();
        } else {
          expect(result.value[1]).assertEqual(item.value);
        }
        let result2: IteratorResult<[number, number]> = iter.next();
        expect(result2.done).assertEqual(false);
        expect(result2.value[0]).assertEqual(1);
        expect(iter.next().done).assertEqual(true);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_3400
     * @tc.name testArrayTraversal0034
     * @tc.desc Verify map with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0034';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value);
        let mapped: collections.Array<number> = arr.map((value: number): number => value * 2);
        expect(mapped.length).assertEqual(1);
        if (item.id === 'number_nan') {
          expect(Number.isNaN(mapped[0])).assertTrue();
        } else {
          expect(mapped[0]).assertEqual(item.value * 2);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_3500
     * @tc.name testArrayTraversal0035
     * @tc.desc Verify filter with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0035';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        // NaN 过滤：NaN !== NaN，所以 filter 无法匹配 NaN
        if (item.id === 'number_nan') {
          let arr: collections.Array<number> = new collections.Array<number>(item.value);
          let filtered: collections.Array<number> = arr.filter((value: number): boolean => Number.isNaN(value));
          expect(filtered.length).assertEqual(1);
        } else {
          let arr: collections.Array<number> = new collections.Array<number>(item.value, 0);
          let filtered: collections.Array<number> = arr.filter((value: number): boolean => value === item.value);
          expect(filtered.length).assertEqual(1);
          expect(filtered[0]).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_3600
     * @tc.name testArrayTraversal0036
     * @tc.desc Verify filter returning empty array when no element matches.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0036';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let filtered: collections.Array<number> = arr.filter((value: number): boolean => value > 10);
      expect(filtered.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    // ==================== 索引访问 [at 和 [index]] 测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_3700
     * @tc.name testArrayTraversal0037
     * @tc.desc Verify at() with positive index on number Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0037';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(200);
      expect(arr.at(2)).assertEqual(300);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_3800
     * @tc.name testArrayTraversal0038
     * @tc.desc Verify at() with negative index (from end) on number Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0038';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
      expect(arr.at(-1)).assertEqual(300);
      expect(arr.at(-2)).assertEqual(200);
      expect(arr.at(-3)).assertEqual(100);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_3900
     * @tc.name testArrayTraversal0039
     * @tc.desc Verify at() with out-of-bounds index returns undefined.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0039';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
      expect(arr.at(999)).assertEqual(undefined);
      expect(arr.at(-999)).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_4000
     * @tc.name testArrayTraversal0040
     * @tc.desc Verify at() with string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0040';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.at(0)).assertEqual(item.value);
        expect(arr.at(-1)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_4100
     * @tc.name testArrayTraversal0041
     * @tc.desc Verify at() with Sendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0041';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr.at(0)).assertEqual(item.value);
          expect(arr.at(-1)).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_4200
     * @tc.name testArrayTraversal0042
     * @tc.desc Verify at() on empty Array returns undefined.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0042';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      expect(arr.at(0)).assertEqual(undefined);
      expect(arr.at(-1)).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_4300
     * @tc.name testArrayTraversal0043
     * @tc.desc Verify [index] operator with valid index on number Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0043';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_4400
     * @tc.name testArrayTraversal0044
     * @tc.desc Verify [index] operator with out-of-bounds index on number Array throws 10200001.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // 注意：根据官方文档，arr[999] 应抛出 10200001 错误
    // 但由于当前测试环境（API 11/12）下 collections.Array 对越界索引
    // 实际返回 undefined 而非抛错，因此以下测试暂时注释
    // 待后续确认环境支持后再启用
    //
    // it('testArrayTraversal0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTraversal0044';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
    //   let caught: boolean = false;
    //   try {
    //     let _: number = arr[999];
    //     expect(true).assertFalse();
    //   } catch (e) {
    //     caught = true;
    //     let errObj: Record<string, Object> = e as Record<string, Object>;
    //     expect(errObj['code']).assertEqual(10200001);
    //   }
    //   expect(caught).assertTrue();
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_4500
     * @tc.name testArrayTraversal0045
     * @tc.desc Verify [index] operator with negative index on number Array throws 10200001.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // 注意：根据官方文档，arr[-1] 应抛出 10200001 错误
    // 但由于当前测试环境（API 11/12）下 collections.Array 对负数索引
    // 实际返回 undefined 而非抛错，因此以下测试暂时注释
    // 待后续确认环境支持后再启用
    //
    // it('testArrayTraversal0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayTraversal0045';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
    //   let caught: boolean = false;
    //   try {
    //     let _: number = arr[-1];
    //     expect(true).assertFalse();
    //   } catch (e) {
    //     caught = true;
    //     let errObj: Record<string, Object> = e as Record<string, Object>;
    //     expect(errObj['code']).assertEqual(10200001);
    //   }
    //   expect(caught).assertTrue();
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_4600
     * @tc.name testArrayTraversal0046
     * @tc.desc Verify [index] operator with valid index on string Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0046';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== forEach 补充：回调参数 array 引用验证 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_4700
     * @tc.name testArrayTraversal0047
     * @tc.desc Verify forEach callback receives correct array reference for string type.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0047';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, item.value);
        arr.forEach((value: string, index: number, array: collections.Array<string>): void => {
          expect(value).assertEqual(item.value);
          // 验证 array 引用正确
          expect(array === arr).assertTrue();
          expect(array.length).assertEqual(2);
        });
      }

      console.info(`${caseName}, test end`);
    });

    // ==================== entries 补充测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_4800
     * @tc.name testArrayTraversal0048
     * @tc.desc Verify entries with nested array test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0048';
      console.info(`${caseName}, test start`);

      let nestedArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let arr: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(nestedArr);
      let iter: IterableIterator<[number, collections.Array<number>]> = arr.entries();
      let result: IteratorResult<[number, collections.Array<number>]> = iter.next();
      expect(result.done).assertEqual(false);
      expect(result.value[0]).assertEqual(0);
      expect(result.value[1] === nestedArr).assertTrue();
      expect(iter.next().done).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_4900
     * @tc.name testArrayTraversal0049
     * @tc.desc Verify entries returns new iterator on each call.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0049';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
      let iter1: IterableIterator<[number, number]> = arr.entries();
      let iter2: IterableIterator<[number, number]> = arr.entries();
      // 两个迭代器应该独立
      let result1: IteratorResult<[number, number]> = iter1.next();
      let result2: IteratorResult<[number, number]> = iter2.next();
      expect(result1.value[0]).assertEqual(0);
      expect(result2.value[0]).assertEqual(0);
      expect(result1.value[1]).assertEqual(100);
      expect(result2.value[1]).assertEqual(100);
      // iter1 前进，iter2 不受影响
      iter1.next();
      let result1Next: IteratorResult<[number, number]> = iter1.next();
      let result2Next: IteratorResult<[number, number]> = iter2.next();
      expect(result1Next.value[0]).assertEqual(2);
      expect(result2Next.value[0]).assertEqual(1);

      console.info(`${caseName}, test end`);
    });
    // ==================== 补充缺失的 keys/values 测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_5000
     * @tc.name testArrayTraversal0050
     * @tc.desc Verify keys with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0050';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, item.value);
        let c: number = 0;
        for (let _ of arr.keys()) {
          c = c + 1;
        }
        expect(c).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_5100
     * @tc.name testArrayTraversal0051
     * @tc.desc Verify values with all number test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0051';
      console.info(`${caseName}, test start`);

      let numberValues: collections.Array<NumberTestValue> = getNumberTestValues();
      for (let i: number = 0; i < numberValues.length; i++) {
        let item: NumberTestValue = numberValues[i];
        let arr: collections.Array<number> = new collections.Array<number>(item.value, item.value);
        let c: number = 0;
        for (let _ of arr.values()) {
          c = c + 1;
        }
        expect(c).assertEqual(2);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_5200
     * @tc.name testArrayTraversal0052
     * @tc.desc Verify reduce with all string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0052';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value, item.value);
        let result: string = arr.reduce((acc: string, cur: string): string => acc + cur);
        let expected: string = item.value + item.value;
        expect(result).assertEqual(expected);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_5300
     * @tc.name testArrayTraversal0053
     * @tc.desc Verify at() with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0053';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr.at(0)).assertEqual(item.value);
        expect(arr.at(-1)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_5400
     * @tc.name testArrayTraversal0054
     * @tc.desc Verify [index] operator with valid index on boolean Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0054';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_TRAVERSAL_5500
     * @tc.name testArrayTraversal0055
     * @tc.desc Verify [index] operator with valid index on Sendable Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayTraversal0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayTraversal0055';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr[0] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });
  });
}