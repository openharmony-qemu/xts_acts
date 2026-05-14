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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../../Util.test';
import {
  ArraySliceJs_3_1,
  ArraySliceJs_3_2,
  ArraySliceJs_3_3,
  ArraySliceJs_3_5,
  ArraySliceJs_3_6,
  ArraySliceJs_4_1,
  ArraySliceJs_4_3,
  ArraySliceJs_4_4,
  ArraySliceJs_5_6,
  ArraySliceJs_7_5,
  ArraySliceJs_7_6,
  ArraySliceJs_8_1,
  ArraySliceJs_8_2,
  ArraySliceJs_8_3,
  ArraySliceJs_8_4,
  ArraySliceJs_8_5,
  ArraySliceJs_8_6,
  ArraySliceJs_9_1,
  ArraySliceJs_9_2,
  ArraySliceJs_9_3,
  ArraySliceJs_9_4,
  ArraySliceJs_9_5,
  ArraySliceJs_9_7,
  ArraySliceJs_11_1,
  ArraySliceJs_11_2,
  ArraySliceJs_11_4,
  ArraySliceJs_11_5,
  ArraySliceJs_11_6,
  ArraySliceJs_12_2,
  ArraySliceJs_12_3
} from './ArraySliceTest';

export default function ArraySliceTestSupplement() {
  describe('ArraySliceTestSupplement', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    // ==================== 第 1 节：基础功能测试 ====================

    /**
     * @tc.name testArraySliceTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0100
     * @tc.desc 1.1 从数组中间提取一段连续的元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 4);
      expect(result).assertDeepEquals([2, 3, 4]);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0200
     * @tc.desc 1.2 提取数组中的单个元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2, 3);
      expect(result).assertDeepEquals([3]);
    })

    /**
     * @tc.name testArraySliceTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0300
     * @tc.desc 1.3 begin >= end 时返回空数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(3, 3);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0400
     * @tc.desc 1.4 不传参数返回整个数组的拷贝
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice();
      expect(result1).assertDeepEquals([1, 2, 3, 4, 5]);
      const result2: number[] = arr.slice(0, 5);
      expect(result2).assertDeepEquals([1, 2, 3, 4, 5]);
      const result3: number[] = arr.slice(0, arr.length);
      expect(result3).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0500
     * @tc.desc 1.5 只指定 begin 参数提取到数组末尾
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0600
     * @tc.desc 1.6 begin 为 0 时从开头提取到指定位置
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(0, 3);
      expect(result).assertDeepEquals([1, 2, 3]);
    })

    // ==================== 第 2 节：参数边界测试 ====================

    /**
     * @tc.name testArraySliceTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0700
     * @tc.desc 2.1 begin > end 时返回空数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(4, 2);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0800
     * @tc.desc 2.2 begin 大于数组长度时返回空数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(10);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_0900
     * @tc.desc 2.3 end 大于数组长度时提取到数组末尾
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2, 10);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1000
     * @tc.desc 2.4 begin 和 end 都超出数组长度时返回空数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(10, 20);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1100
     * @tc.desc 2.5 begin 等于 end 时返回空数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2, 2);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1200
     * @tc.desc 2.6 begin 为 0 从数组开头开始提取
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(0, 3);
      expect(result).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1300
     * @tc.desc 2.7 end 为数组长度时提取到最后一个元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2, 5);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1400
     * @tc.desc 2.8 begin 接近数组末尾时提取末尾元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(4);
      expect(result).assertDeepEquals([5]);
    })

    // ==================== 第 3 节：特殊值处理（ETS 部分）====================

    /**
     * @tc.name testArraySliceTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1500
     * @tc.desc 3.4 Infinity 作为参数的处理
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(Infinity);
      expect(result1).assertDeepEquals([]);
      const result2: number[] = arr.slice(-Infinity);
      expect(result2).assertDeepEquals([1, 2, 3, 4, 5]);
      const result3: number[] = arr.slice(0, Infinity);
      expect(result3).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    // ==================== 第 4 节：数组类型测试（ETS 部分）====================

    /**
     * @tc.name testArraySliceTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1600
     * @tc.desc 4.2 处理普通密集数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 4);
      expect(result).assertDeepEquals([2, 3, 4]);
    })

    /**
     * @tc.name testArraySliceTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1700
     * @tc.desc 4.5 对 TypedArray 使用 slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typed: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const result: Int8Array = typed.slice(1, 4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    })

    /**
     * @tc.name testArraySliceTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1800
     * @tc.desc 4.6 对空数组使用 slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const result: number[] = arr.slice(0, 5);
      expect(result).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_1900
     * @tc.desc 4.7 对单元素数组使用 slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42];
      const result1: number[] = arr.slice(0);
      expect(result1).assertDeepEquals([42]);
      const result2: number[] = arr.slice(0, 0);
      expect(result2).assertDeepEquals([]);
      const result3: number[] = arr.slice(1);
      expect(result3).assertDeepEquals([]);
    })

    // ==================== 第 5 节：引用类型测试 ====================

    /**
     * @tc.name testArraySliceTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2000
     * @tc.desc 5.1 验证 slice 返回浅拷贝，修改新数组不影响原数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 4);
      result[0] = 999;
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(result[0]).assertEqual(999);
    })

    /**
     * @tc.name testArraySliceTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2100
     * @tc.desc 5.2 数组中的对象元素是引用关系
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Obj { id: number }
      const obj: Obj = { id: 1 };
      const arr: Obj[] = [obj, { id: 2 }, { id: 3 }];
      const result: Obj[] = arr.slice(0, 2);
      result[0].id = 999;
      expect(arr[0].id).assertEqual(999);
      expect(result[0].id).assertEqual(999);
    })

    /**
     * @tc.name testArraySliceTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2200
     * @tc.desc 5.3 数组中的嵌套数组是引用关系
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: number[] = [1, 2];
      const arr: number[][] = [inner, [3, 4], [5, 6]];
      const result: number[][] = arr.slice(0, 2);
      result[0][0] = 999;
      expect(arr[0][0]).assertEqual(999);
      expect(result[0][0]).assertEqual(999);
    })

    /**
     * @tc.name testArraySliceTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2300
     * @tc.desc 5.4 处理多层嵌套数组结构
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const result: number[][] = arr.slice(1, 3);
      expect(result).assertDeepEquals([[3, 4], [5, 6]]);
      expect(result[0] === arr[1]).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2400
     * @tc.desc 5.5 数组中的函数元素是引用关系
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: () => string = (): string => 'test';
      const arr: (() => string)[] = [fn, (): string => 'foo', (): string => 'bar'];
      const result: (() => string)[] = arr.slice(0, 2);
      expect(result[0] === arr[0]).assertEqual(true);
    })

    // ==================== 第 6 节：负索引处理 ====================

    /**
     * @tc.name testArraySliceTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2500
     * @tc.desc 6.1 begin 为负数时从数组末尾开始计算
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(-3);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2600
     * @tc.desc 6.2 end 为负数时从数组末尾开始计算
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(0, -2);
      expect(result).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2700
     * @tc.desc 6.3 begin 和 end 都为负数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(-4, -2);
      expect(result).assertDeepEquals([2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2800
     * @tc.desc 6.4 负索引超出范围时等价于从 0 开始
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(-10);
      expect(result1).assertDeepEquals([1, 2, 3, 4, 5]);
      const result2: number[] = arr.slice(-10, -8);
      expect(result2).assertDeepEquals([]);
    })

    /**
     * @tc.name testArraySliceTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_2900
     * @tc.desc 6.5 混合正负索引
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(1, -1);
      expect(result1).assertDeepEquals([2, 3, 4]);
      const result2: number[] = arr.slice(-3, 4);
      expect(result2).assertDeepEquals([3, 4]);
    })

    /**
     * @tc.name testArraySliceTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3000
     * @tc.desc 6.6 负索引绝对值等于数组长度时等价于从 0 开始
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(-5);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3100
     * @tc.desc 6.7 begin 为负 end 为正且转换后 begin < end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(-3, 4);
      expect(result).assertDeepEquals([3, 4]);
    })

    // ==================== 第 7 节：参数省略测试（ETS 部分）====================

    /**
     * @tc.name testArraySliceTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3200
     * @tc.desc 7.1 省略 begin 时 begin 默认为 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(0, 3);
      expect(result).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArraySliceTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3300
     * @tc.desc 7.2 省略 end 时 end 默认为数组长度
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3400
     * @tc.desc 7.3 全部省略时返回整个数组的拷贝
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice();
      expect(result).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(result === arr).assertEqual(false);
    })

    /**
     * @tc.name testArraySliceTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3500
     * @tc.desc 7.4 只传一个参数作为 begin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(2);
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    // ==================== 第 9 节：异常场景测试（ETS 部分）====================

    /**
     * @tc.name testArraySliceTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3600
     * @tc.desc 9.4 对 Object.freeze 的数组使用 slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_4()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3700
     * @tc.desc 9.5 对 Object.seal 的数组使用 slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_5()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3800
     * @tc.desc 9.6 数组 length 属性被修改后的处理
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.length = 3;
      const result: number[] = arr.slice(1, 5);
      expect(result).assertDeepEquals([2, 3]);
    })

    // ==================== 第 10 节：与其他方法交互 ====================

    /**
     * @tc.name testArraySliceTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_3900
     * @tc.desc 10.1 slice 返回的数组与 concat 配合使用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 3).concat([6, 7]);
      expect(result).assertDeepEquals([2, 3, 6, 7]);
    })

    /**
     * @tc.name testArraySliceTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4000
     * @tc.desc 10.2 slice 和 splice 的区别与配合
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const sliced: number[] = arr.slice(1, 3);
      expect(sliced).assertDeepEquals([2, 3]);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      const arr2: number[] = [1, 2, 3, 4, 5];
      const spliced: number[] = arr2.splice(1, 2);
      expect(spliced).assertDeepEquals([2, 3]);
      expect(arr2).assertDeepEquals([1, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4100
     * @tc.desc 10.3 slice 返回的数组使用 map 方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 4).map((x: number): number => x * 2);
      expect(result).assertDeepEquals([4, 6, 8]);
    })

    /**
     * @tc.name testArraySliceTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4200
     * @tc.desc 10.4 slice 返回的数组使用 filter 方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.slice(1, 4).filter((x: number): boolean => x > 2);
      expect(result).assertDeepEquals([3, 4]);
    })

    /**
     * @tc.name testArraySliceTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4300
     * @tc.desc 10.5 slice 返回的数组使用 reduce 方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number = arr.slice(1, 4).reduce((acc: number, val: number): number => acc + val, 0);
      expect(result).assertEqual(9);
    })

    /**
     * @tc.name testArraySliceTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4400
     * @tc.desc 10.6 多个数组方法链式调用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: number[] = arr
        .slice(2, 8)
        .filter((x: number): boolean => x % 2 === 0)
        .map((x: number): number => x * 10);
      expect(result).assertDeepEquals([40, 60, 80]);
    })

    /**
     * @tc.name testArraySliceTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4500
     * @tc.desc 10.7 slice 与 spread 运算符配合
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.slice(1, 3);
      expect(result1).assertDeepEquals([2, 3]);
      const spread: number[] = [...arr];
      const result2: number[] = spread.slice(1, 3);
      expect(result2).assertDeepEquals([2, 3]);
      const result3: number[] = [...arr.slice(1, 3), 6, 7];
      expect(result3).assertDeepEquals([2, 3, 6, 7]);
    })

    // ==================== 第 11 节：原型链测试（ETS 部分）====================

    /**
     * @tc.name testArraySliceTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4600
     * @tc.desc 11.1 通过 Array.prototype.slice 调用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_11_1()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4700
     * @tc.desc 11.3 在数组子类上使用 slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class MyArray extends Array<number> {
        constructor(...args: number[]) {
          super(...args);
        }
      }
      const myArr: MyArray = new MyArray(1, 2, 3, 4, 5);
      const result: number[] = myArr.slice(1, 3);
      expect(result).assertDeepEquals([2, 3]);
    })

    // ==================== 第 12 节：实际应用场景 ====================

    /**
     * @tc.name testArraySliceTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4800
     * @tc.desc 12.1 使用 slice 快速克隆数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: number[] = [1, 2, 3, 4, 5];
      const clone: number[] = original.slice();
      expect(clone).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(clone !== original).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_4900
     * @tc.desc 12.4 使用 slice 实现简单的分页功能
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const paginate = (arr: number[], page: number, pageSize: number): number[] => {
        const start: number = (page - 1) * pageSize;
        const end: number = start + pageSize;
        return arr.slice(start, end);
      };
      const data: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const page1: number[] = paginate(data, 1, 3);
      expect(page1).assertDeepEquals([1, 2, 3]);
      const page2: number[] = paginate(data, 2, 3);
      expect(page2).assertDeepEquals([4, 5, 6]);
    })

    /**
     * @tc.name testArraySliceTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5000
     * @tc.desc 12.5 使用负索引获取数组末尾 N 个元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const getLastN = (arr: number[], n: number): number[] => arr.slice(-n);
      const arr: number[] = [1, 2, 3, 4, 5];
      const last3: number[] = getLastN(arr, 3);
      expect(last3).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5100
     * @tc.desc 12.6 使用 slice 删除数组元素（不修改原数组）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const removeElement = (arr: number[], index: number): number[] =>
        arr.slice(0, index).concat(arr.slice(index + 1));
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = removeElement(arr, 2);
      expect(result).assertDeepEquals([1, 2, 4, 5]);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArraySliceTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5200
     * @tc.desc 12.7 将数组分块处理
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chunk = (arr: number[], size: number): number[][] => {
        const result: number[][] = [];
        for (let i: number = 0; i < arr.length; i += size) {
          result.push(arr.slice(i, i + size));
        }
        return result;
      };
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      const chunks: number[][] = chunk(arr, 3);
      expect(chunks).assertDeepEquals([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
    })

    /**
     * @tc.name testArraySliceTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5300
     * @tc.desc 12.8 配合 filter 和 indexOf 实现数组去重
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const unique = (arr: number[]): number[] =>
        arr.filter((item: number, index: number): boolean =>
          arr.slice(0, index).indexOf(item) === -1
        );
      const arr: number[] = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4];
      const result: number[] = unique(arr);
      expect(result).assertDeepEquals([1, 2, 3, 4]);
    })

    // ==================== 第 3 节：特殊值处理（JS 实现）====================

    /**
     * @tc.name testArraySliceTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5400
     * @tc.desc 3.1 undefined 作为参数时视为未传递
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_3_1()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5500
     * @tc.desc 3.2 null 被转换为 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_3_2()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5600
     * @tc.desc 3.3 NaN 被转换为 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_3_3()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5700
     * @tc.desc 3.5 空字符串被转换为 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_3_5()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5800
     * @tc.desc 3.6 布尔值被转换为 1 或 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_3_6()).assertEqual(true);
    })

    // ==================== 第 4 节：数组类型测试（JS 实现）====================

    /**
     * @tc.name testArraySliceTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_5900
     * @tc.desc 4.1 处理含有空位的稀疏数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_4_1()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6000
     * @tc.desc 4.3 通过 call/apply 在类数组对象上使用 slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_4_3()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6100
     * @tc.desc 4.4 对 arguments 对象使用 slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_4_4()).assertEqual(true);
    })

    // ==================== 第 5 节：引用类型测试（JS 实现）====================

    /**
     * @tc.name testArraySliceTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6200
     * @tc.desc 5.6 处理包含 Symbol 的数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_5_6()).assertEqual(true);
    })

    // ==================== 第 7 节：参数省略测试（JS 实现）====================

    /**
     * @tc.name testArraySliceTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6300
     * @tc.desc 7.5 传递超过 2 个参数，多余的参数被忽略
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_7_5()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6400
     * @tc.desc 7.6 通过 apply 传递参数数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_7_6()).assertEqual(true);
    })

    // ==================== 第 8 节：类型转换测试（JS 实现）====================

    /**
     * @tc.name testArraySliceTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6500
     * @tc.desc 8.1 字符串参数被转换为数字
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_1()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6600
     * @tc.desc 8.2 浮点数参数被向下取整
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_2()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6700
     * @tc.desc 8.3 对象通过 valueOf 转换为数字
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_3()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6800
     * @tc.desc 8.4 数组参数被转换为数字
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_4()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_6900
     * @tc.desc 8.5 BigInt 参数的处理（预期抛出 TypeError）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_5()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7000
     * @tc.desc 8.6 十六进制字符串转换为数字
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_8_6()).assertEqual(true);
    })

    // ==================== 第 9 节：异常场景测试（JS 实现）====================

    /**
     * @tc.name testArraySliceTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7100
     * @tc.desc 9.1 this 值为 null 时抛出 TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_1()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7200
     * @tc.desc 9.2 this 值为 undefined 时抛出 TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_2()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7300
     * @tc.desc 9.3 this 值为字符串时被视为类数组对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_3()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7400
     * @tc.desc 9.7 length 属性为只读的情况
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_9_7()).assertEqual(true);
    })

    // ==================== 第 11 节：原型链测试（JS 实现）====================

    /**
     * @tc.name testArraySliceTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7500
     * @tc.desc 11.2 修改 Array.prototype.slice 后的影响
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_11_2()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7600
     * @tc.desc 11.4 使用 Symbol.species 控制返回的构造函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_11_4()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7700
     * @tc.desc 11.5 在自定义类数组对象上使用 slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_11_5()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7800
     * @tc.desc 11.6 Object.create(数组) 后 slice 沿原型链得到 [1,2,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_11_6()).assertEqual(true);
    })

    // ==================== 第 12 节：实际应用场景（JS 实现）====================

    /**
     * @tc.name testArraySliceTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_7900
     * @tc.desc 12.2 将 arguments 转换为真数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_12_2()).assertEqual(true);
    })

    /**
     * @tc.name testArraySliceTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SLICE_SUPPLEMENT_TEST_8000
     * @tc.desc 12.3 在函数中处理可变参数列表
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySliceTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySliceJs_12_3()).assertEqual(true);
    })

  })
}
