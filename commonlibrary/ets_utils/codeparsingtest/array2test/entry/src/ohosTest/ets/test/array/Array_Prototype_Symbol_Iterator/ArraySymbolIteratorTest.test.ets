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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import Utils from '../../Util.test';
import * as ArraySymbolIteratorJs from './array_symbol_iterator_test';

export default function ArraySymbolIteratorTest() {
  describe('ArraySymbolIteratorTest', () => {
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
    /**
     * @tc.name testArraySymbolIteratorTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_0100
     * @tc.desc 验证[Symbol.iterator]()返回的是迭代器对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0100()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_0200
     * @tc.desc 验证[Symbol.iterator]()返回对象的Symbol.toStringTag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0101()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_0300
     * @tc.desc 验证每次调用[Symbol.iterator]()返回新的迭代器对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0102()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_0400
     * @tc.desc 验证[Symbol.iterator]是Symbol类型属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0103()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_0500
     * @tc.desc 验证基本数组的迭代输出顺序和值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0104()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_0600
     * @tc.desc 验证迭代输出的是值而非索引
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0105()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_0700
     * @tc.desc 验证迭代顺序与数组索引顺序一致
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0106()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_0800
     * @tc.desc 验证[Symbol.iterator]()不接受任何参数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0107()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_0900
     * @tc.desc 验证传入参数时参数被忽略
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0108()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_1000
     * @tc.desc 验证next()返回包含value和done属性的对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0109()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_1100
     * @tc.desc 验证逐次调用next()依次返回每个元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0110()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_1200
     * @tc.desc 验证迭代未完成时done为false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0111()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_1300
     * @tc.desc 验证迭代完成后done为true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0112()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_1400
     * @tc.desc 验证空数组第一次调用next()即返回done为true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0113()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_1500
     * @tc.desc 验证迭代完成后继续调用next()始终返回done为true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0114()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_1600
     * @tc.desc 验证迭代器返回的value与数组元素值一致
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0115()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_1700
     * @tc.desc 验证迭代完成后value为undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0116()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_1800
     * @tc.desc 验证迭代器对象具有[Symbol.iterator]方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0117()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_1900
     * @tc.desc 验证迭代器的[Symbol.iterator]()返回自身
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0118()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_2000
     * @tc.desc 验证迭代器可以在for...of中直接使用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0119()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_2100
     * @tc.desc 验证for...of自动调用Symbol.iterator遍历数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0120()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_2200
     * @tc.desc 验证for...of遍历不改变原数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0121()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_2300
     * @tc.desc 验证for...of中无法获取当前索引
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0122()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_2400
     * @tc.desc 验证break终止后迭代器保留当前位置
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0123()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_2500
     * @tc.desc 验证break在第一个元素处终止后恢复
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0124()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_2600
     * @tc.desc 验证多次break分段消费迭代器
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0125()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_2700
     * @tc.desc 验证continue跳过当前元素但迭代继续
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0126()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_2800
     * @tc.desc 验证throw异常中断迭代后迭代器状态保留
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0127()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_2900
     * @tc.desc 验证迭代器耗尽后for...of不再产出任何值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0128()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_3000
     * @tc.desc 验证迭代器耗尽后用next()调用也返回done为true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0129()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_3100
     * @tc.desc 验证耗尽后next()始终返回{value: undefined, done: true}
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0130()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_3200
     * @tc.desc 验证同一迭代器只能有效遍历一次
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0131()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_3300
     * @tc.desc 验证部分消耗后的迭代器可继续遍历剩余元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0132()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_3400
     * @tc.desc 验证Array.prototype.values === Array.prototype[Symbol.iterator]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0133()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_3500
     * @tc.desc 验证在实例上values和Symbol.iterator指向相同函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0134()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_3600
     * @tc.desc 验证values()和[Symbol.iterator]()返回相同类型的迭代器
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0135()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_3700
     * @tc.desc 验证两个迭代器独立遍历产生相同结果
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0136()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_3800
     * @tc.desc 验证for...of直接遍历数组等价于手动调用[Symbol.iterator]()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0137()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_3900
     * @tc.desc 验证修改数组的Symbol.iterator后for...of行为改变
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0138()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_4000
     * @tc.desc 验证修改Symbol.iterator不影响已获取的迭代器
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0139()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_4100
     * @tc.desc 验证数字类型数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0140()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_4200
     * @tc.desc 验证字符串类型数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0141()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_4300
     * @tc.desc 验证布尔类型数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0142()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_4400
     * @tc.desc 验证BigInt类型数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0143()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_4500
     * @tc.desc 验证对象元素迭代返回引用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0144()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_4600
     * @tc.desc 验证数组作为元素嵌套迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0145()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_4700
     * @tc.desc 验证函数作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0146()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_4800
     * @tc.desc 验证Date对象作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0147()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_4900
     * @tc.desc 验证不同类型混合数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0148()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_5000
     * @tc.desc 验证undefined作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0149()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_5100
     * @tc.desc 验证null作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0150()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_5200
     * @tc.desc 验证NaN作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0151()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_5300
     * @tc.desc 验证Symbol作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0152()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_5400
     * @tc.desc 验证正则表达式作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0153()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_5500
     * @tc.desc 验证Infinity和-Infinity作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0154()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_5600
     * @tc.desc 验证稀疏数组空槽作为undefined迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0155()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_5700
     * @tc.desc 验证中间有空槽的数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0156()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_5800
     * @tc.desc 验证全空槽数组迭代输出全为undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0157()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_5900
     * @tc.desc 验证通过Array构造函数创建的空数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0158()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_6000
     * @tc.desc 验证数组开头有空槽的迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0159()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_6100
     * @tc.desc 验证数组末尾有空槽的迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0160()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_6200
     * @tc.desc 验证空槽与显式undefined元素的区别（迭代行为一致）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0161()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_6300
     * @tc.desc 验证用delete创建空槽后的迭代行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0162()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_6400
     * @tc.desc 验证空数组[Symbol.iterator]()返回的迭代器立即done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0163()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_6500
     * @tc.desc 验证for...of遍历空数组不执行循环体
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0164()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_6600
     * @tc.desc 验证空数组展开运算符产生空数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0165()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_6700
     * @tc.desc 验证单元素数组正确迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0166()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_6800
     * @tc.desc 验证单元素为undefined的数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0167()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_6900
     * @tc.desc 验证单元素为空字符串的数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0168()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_7000
     * @tc.desc 验证单元素为0的数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0169()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_7100
     * @tc.desc 验证大数组迭代完整性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0170()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_7200
     * @tc.desc 验证含大量空槽的大数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0171()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_7300
     * @tc.desc 验证迭代过程中修改未访问元素的值会影响迭代结果
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0172()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_7400
     * @tc.desc 验证迭代过程中修改已访问元素的值不影响后续迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0173()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_7500
     * @tc.desc 验证迭代过程中修改当前正在被访问的元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0174()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_7600
     * @tc.desc 验证迭代期间通过push添加元素会被迭代到
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0175()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_7700
     * @tc.desc 验证迭代期间通过索引添加元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0176()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_7800
     * @tc.desc 验证迭代期间用delete删除元素，空槽变为undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0177()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_7900
     * @tc.desc 验证迭代期间用pop删除末尾元素影响迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0178()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_8000
     * @tc.desc 验证迭代期间用shift删除头部元素的影响
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0179()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_8100
     * @tc.desc 验证迭代期间用splice删除中间元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0180()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_8200
     * @tc.desc 验证迭代期间缩短length导致迭代提前结束
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0181()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_8300
     * @tc.desc 验证迭代期间增大length不影响已有元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0182()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_8400
     * @tc.desc 验证迭代期间将length设为0导致迭代立即结束
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0183()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_8500
     * @tc.desc 验证对类数组对象调用[Symbol.iterator]()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0184()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_8600
     * @tc.desc 验证类数组对象中超出length的属性被忽略
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0185()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_8700
     * @tc.desc 验证arguments对象调用[Symbol.iterator]()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0186()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_8800
     * @tc.desc 验证NodeList类数组对象调用[Symbol.iterator]()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0187()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_8900
     * @tc.desc 验证对字符串调用[Symbol.iterator]()（通过Array.prototype.call）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0188()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_9000
     * @tc.desc 验证空字符串调用结果
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0189()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_9100
     * @tc.desc 验证仅有length属性的对象迭代输出全为undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0190()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_9200
     * @tc.desc 验证length为0的对象迭代立即结束
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0191()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_9300
     * @tc.desc 验证length为非整数时向下取整
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0192()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_9400
     * @tc.desc 验证对null调用[Symbol.iterator]()抛出TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0193()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_9500
     * @tc.desc 验证对undefined调用[Symbol.iterator]()抛出TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0194()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_9600
     * @tc.desc 验证对数字调用[Symbol.iterator]()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0195()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_9700
     * @tc.desc 验证对布尔值调用[Symbol.iterator]()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0196()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_9800
     * @tc.desc 验证负数length的对象迭代立即结束
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0197()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_9900
     * @tc.desc 验证NaN作为length的对象迭代立即结束
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0198()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_10000
     * @tc.desc 验证Infinity作为length的对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0199()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0200
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_10100
     * @tc.desc 验证length为字符串数字时的转换
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0200()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0201
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_10200
     * @tc.desc 验证用生成器函数替换数组的Symbol.iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0201()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0202
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_10300
     * @tc.desc 验证自定义Symbol.iterator返回常量序列
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0202()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0203
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_10400
     * @tc.desc 验证自定义Symbol.iterator为空生成器
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0203()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0204
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_10500
     * @tc.desc 验证自定义Symbol.iterator后for...of使用新行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0204()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0205
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_10600
     * @tc.desc 验证删除实例的Symbol.iterator后for...of仍使用原型方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0205()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0206
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_10700
     * @tc.desc 验证Object.create(null)创建的无原型对象无法迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0206()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0207
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_10800
     * @tc.desc 验证用普通函数替换Symbol.iterator但不符合迭代协议时for...of报错
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0207()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0208
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_10900
     * @tc.desc 验证替换为返回迭代器对象的普通函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0208()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0209
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_11000
     * @tc.desc 验证keys()、entries()、values()和Symbol.iterator()返回不同迭代器
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0209()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0210
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_11100
     * @tc.desc 验证values和Symbol.iterator产生的结果完全一致
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0210()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0211
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_11200
     * @tc.desc 验证多个迭代器互不影响
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0211()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0212
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_11300
     * @tc.desc 验证数组继承了Array.prototype[Symbol.iterator]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0212()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0213
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_11400
     * @tc.desc 验证子类继承Symbol.iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0213()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0214
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_11500
     * @tc.desc 验证子类可以覆盖Symbol.iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0214()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0215
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_11600
     * @tc.desc 验证展开运算符配合[Symbol.iterator]()使用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0215()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0216
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_11700
     * @tc.desc 验证展开运算符配合手动获取的迭代器
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0216()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0217
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_11800
     * @tc.desc 验证展开运算符合并数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0217()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0218
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_11900
     * @tc.desc 验证展开运算符在函数参数中消费迭代器
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0218()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0219
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_12000
     * @tc.desc 验证展开运算符在数组字面量中间使用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0219()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0220
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_12100
     * @tc.desc 验证对数组进行解构赋值（隐式调用Symbol.iterator）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0220()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0221
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_12200
     * @tc.desc 验证解构赋值使用rest参数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0221()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0222
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_12300
     * @tc.desc 验证解构赋值跳过元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0222()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0223
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_12400
     * @tc.desc 验证解构赋值默认值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0223()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0224
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_12500
     * @tc.desc 验证嵌套解构
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0224()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0225
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_12600
     * @tc.desc 验证解构赋值对耗尽的迭代器不产出值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0225()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0226
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_12700
     * @tc.desc 验证Array.from转换迭代器为数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0226()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0227
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_12800
     * @tc.desc 验证Array.from配合映射函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0227()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0228
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_12900
     * @tc.desc 验证Array.from转换部分消耗的迭代器
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0228()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0229
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_13000
     * @tc.desc 验证使用Set构造函数从数组创建集合
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0229()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0230
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_13100
     * @tc.desc 验证使用Map构造函数配合entries创建映射
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0230()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0231
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_13200
     * @tc.desc 验证WeakSet消费数组中的对象元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0231()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0232
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_13300
     * @tc.desc 验证WeakMap消费entries格式的对象数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0232()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0233
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_13400
     * @tc.desc 验证Promise.all消费可迭代数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const arr = [Promise.resolve(1), Promise.resolve(2), Promise.resolve(3)];
      const result = await Promise.all(arr);
      expect(JSON.stringify(result)).assertEqual('[1,2,3]');
    })

    /**
     * @tc.name testArraySymbolIteratorTest0234
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_13500
     * @tc.desc 验证Promise.race消费可迭代数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const arr = [Promise.resolve('fast'), Promise.resolve('slow')];
      const result = await Promise.race(arr);
      expect(result).assertEqual('fast');
    })

    /**
     * @tc.name testArraySymbolIteratorTest0235
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_13600
     * @tc.desc 验证Promise.allSettled消费可迭代数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const arr = [Promise.resolve(1), Promise.reject('err'), Promise.resolve(3)];
      const results = await Promise.allSettled(arr);
      expect(results.length).assertEqual(3);
      expect(results[0].status).assertEqual('fulfilled');
      expect(results[1].status).assertEqual('rejected');
      expect(results[2].status).assertEqual('fulfilled');
    })

    /**
     * @tc.name testArraySymbolIteratorTest0236
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_13700
     * @tc.desc 验证Promise.any消费可迭代数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const arr = [Promise.reject('err'), Promise.resolve('ok')];
      const result = await Promise.any(arr);
      expect(result).assertEqual('ok');
    })

    /**
     * @tc.name testArraySymbolIteratorTest0237
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_13800
     * @tc.desc 验证yield*委托给数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0237()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0238
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_13900
     * @tc.desc 验证yield*委托给手动获取的迭代器
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0238()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolIteratorTest0239
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_ITERATOR_TEST_14000
     * @tc.desc 验证yield*委托给嵌套数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolIteratorTest0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolIteratorJs.ArraySymbolIteratorJs_0239()).assertEqual(true);
    })

  })
}
