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
import * as ArrayWithJs from './array_with_test';

export default function ArrayWithTest() {
  describe('ArrayWithTest', () => {
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
     * @tc.name testArrayWithTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_0100
     * @tc.desc 使用正数索引替换数组中间的元素，验证返回新数组中对应位置值正确
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0100()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_0200
     * @tc.desc 使用负数索引从数组末尾计数替换元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0101()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_0300
     * @tc.desc 使用索引0替换数组的第一个元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0102()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_0400
     * @tc.desc 使用length-1索引替换数组最后一个元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0103()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_0500
     * @tc.desc 传入正整数索引，验证替换位置正确
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0104()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_0600
     * @tc.desc 传入负整数索引，验证从末尾计数替换位置正确
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0105()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_0700
     * @tc.desc 传入索引0，验证替换第一个元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0106()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_0800
     * @tc.desc 传入正浮点数，验证会被截断为整数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0107()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_0900
     * @tc.desc 传入负浮点数，验证转换后从末尾计数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0108()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_1000
     * @tc.desc 传入NaN作为索引，验证会被转换为0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0109()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_1100
     * @tc.desc 传入正Infinity作为索引，验证抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0110()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_1200
     * @tc.desc 传入负Infinity作为索引，验证抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0111()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_1300
     * @tc.desc 传入字符串"0"作为索引，验证转换为0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0112()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_1400
     * @tc.desc 传入字符串"2"作为索引，验证转换为整数2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0113()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_1500
     * @tc.desc 传入非数字字符串作为索引，验证转换为NaN再转为0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0114()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_1600
     * @tc.desc 传入null作为索引，验证转换为0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0115()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_1700
     * @tc.desc 传入undefined作为索引，验证转换为0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0116()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_1800
     * @tc.desc 传入true作为索引，验证转换为1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0117()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_1900
     * @tc.desc 传入false作为索引，验证转换为0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0118()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_2000
     * @tc.desc 传入等于数组长度的正索引，验证抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0119()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_2100
     * @tc.desc 传入大于数组长度的正索引，验证抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0120()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_2200
     * @tc.desc 传入等于负数组长度的负索引（-length），验证规范后为0可以替换
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0121()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_2300
     * @tc.desc 传入绝对值大于数组长度的负索引，验证抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0122()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_2400
     * @tc.desc 传入-(length+1)的负索引，验证抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0123()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_2500
     * @tc.desc 使用数字值替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0124()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_2600
     * @tc.desc 使用字符串值替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0125()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_2700
     * @tc.desc 使用布尔值true替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0126()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_2800
     * @tc.desc 使用布尔值false替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0127()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_2900
     * @tc.desc 使用null值替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0128()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_3000
     * @tc.desc 使用undefined值替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0129()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_3100
     * @tc.desc 使用Symbol值替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0130()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_3200
     * @tc.desc 使用BigInt值替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0131()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_3300
     * @tc.desc 使用普通对象替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0132()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_3400
     * @tc.desc 使用嵌套数组替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0133()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_3500
     * @tc.desc 使用函数值替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0134()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_3600
     * @tc.desc 使用Date对象替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0135()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_3700
     * @tc.desc 使用RegExp对象替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0136()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_3800
     * @tc.desc 使用Map对象替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0137()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_3900
     * @tc.desc 使用Set对象替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0138()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_4000
     * @tc.desc 使用NaN替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0139()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_4100
     * @tc.desc 使用Infinity替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0140()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_4200
     * @tc.desc 使用-Infinity替换数组元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0141()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_4300
     * @tc.desc 使用+0和-0替换数组元素，验证正确存储
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0142()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_4400
     * @tc.desc 用相同的值替换元素，验证返回新数组但内容看似不变
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0143()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_4500
     * @tc.desc 验证with()返回值是Array实例
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0144()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_4600
     * @tc.desc 验证返回数组的length与原数组一致
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0145()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_4700
     * @tc.desc 验证返回数组中指定索引位置被正确替换
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0146()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_4800
     * @tc.desc 验证返回数组中非替换位置的元素与原数组一致
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0147()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_4900
     * @tc.desc 验证返回值是一个全新的数组对象，与原数组引用不同
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0148()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_5000
     * @tc.desc 调用with()后验证原数组内容未被修改
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0149()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_5100
     * @tc.desc 调用with()后验证原数组变量仍指向同一对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0150()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_5200
     * @tc.desc 连续多次调用with()，验证原数组始终保持不变
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0151()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_5300
     * @tc.desc 在被Object.freeze冻结的数组上调用with()，验证不会抛出异常且原数组不变
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0152()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_5400
     * @tc.desc 在被Object.seal密封的数组上调用with()，验证不会抛出异常且原数组不变
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0153()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_5500
     * @tc.desc 稀疏数组中存在空洞，替换非空洞位置的元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0154()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_5600
     * @tc.desc 验证稀疏数组调用with()后空洞变为undefined（密集化）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0155()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_5700
     * @tc.desc 含有多个空洞的稀疏数组调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0156()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_5800
     * @tc.desc 数组完全由空洞组成时调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0157()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_5900
     * @tc.desc 替换数组中空洞位置的值，验证空洞被填充
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0158()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_6000
     * @tc.desc index为正数且大于等于数组length时抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0159()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_6100
     * @tc.desc index为负数且绝对值大于数组length时抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0160()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_6200
     * @tc.desc index为正Infinity时抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0161()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_6300
     * @tc.desc index为负Infinity时抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0162()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_6400
     * @tc.desc 当this值为null时抛出TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0163()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_6500
     * @tc.desc 当this值为undefined时抛出TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0164()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_6600
     * @tc.desc 当this值为数字原始类型时抛出TypeError（数字无length属性为对象）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0165()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_6700
     * @tc.desc 当this值为字符串原始类型时，验证行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0166()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_6800
     * @tc.desc 当this值为布尔原始类型时抛出TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0167()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_6900
     * @tc.desc with()返回新数组后链式调用map()进行映射
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0168()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_7000
     * @tc.desc with()返回新数组后链式调用filter()进行过滤
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0169()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_7100
     * @tc.desc with()返回新数组后链式调用reduce()进行累计
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0170()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_7200
     * @tc.desc with()返回新数组后链式调用find()查找元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0171()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_7300
     * @tc.desc with()返回新数组后链式调用includes()检测包含
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0172()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_7400
     * @tc.desc with()返回新数组后链式调用indexOf()查找索引
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0173()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_7500
     * @tc.desc with()返回新数组后链式调用slice()截取子数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0174()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_7600
     * @tc.desc with()返回新数组后链式调用concat()拼接
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0175()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_7700
     * @tc.desc with()返回新数组后链式调用forEach()遍历
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0176()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_7800
     * @tc.desc with()返回新数组后链式调用some()判断
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0177()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_7900
     * @tc.desc with()返回新数组后链式调用every()判断
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0178()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_8000
     * @tc.desc with()返回新数组后链式调用join()转字符串
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0179()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_8100
     * @tc.desc with()返回新数组后链式调用sort()排序
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0180()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_8200
     * @tc.desc with()返回新数组后链式调用toReversed()反转
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0181()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_8300
     * @tc.desc with()返回新数组后链式调用toSorted()排序
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0182()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_8400
     * @tc.desc with()返回新数组后链式调用toSpliced()删除插入
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0183()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_8500
     * @tc.desc 多次链式调用with()替换多个位置的元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0184()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_8600
     * @tc.desc 使用at()读取with()返回数组中指定位置的元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0185()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_8700
     * @tc.desc with()返回新数组后链式调用flat()展平
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0186()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_8800
     * @tc.desc with()返回新数组后链式调用flatMap()映射展平
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0187()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_8900
     * @tc.desc 通过Array.prototype.with.call()在含length和数字键的对象上调用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0188()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_9000
     * @tc.desc length属性值大于实际拥有的数字键数量，缺失位置为undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0189()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_9100
     * @tc.desc length属性值小于实际拥有的数字键数量，超出部分被忽略
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0190()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_9200
     * @tc.desc length为0的类数组对象调用with()，任何索引都应越界
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0191()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_9300
     * @tc.desc 含有非数字字符串键的对象，非数字键被忽略
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0192()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_9400
     * @tc.desc 含有Symbol键的对象，Symbol键被忽略
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0193()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_9500
     * @tc.desc 在arguments对象上通过call调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0194()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_9600
     * @tc.desc 在模拟NodeList的类数组对象上调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0195()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_9700
     * @tc.desc 在String对象上调用with()，String对象有length和索引属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0196()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_9800
     * @tc.desc 在模拟Buffer的类数组对象上调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0197()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_9900
     * @tc.desc 在空数组上调用with()，任何索引都应抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0198()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_10000
     * @tc.desc 在只有一个元素的数组上调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0199()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0200
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_10100
     * @tc.desc 在大数组上调用with()替换首尾和中间元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0200()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0201
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_10200
     * @tc.desc 在二维数组上调用with()替换整个子数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0201()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0202
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_10300
     * @tc.desc 数组中包含undefined元素时调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0202()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0203
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_10400
     * @tc.desc 数组中包含null元素时调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0203()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0204
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_10500
     * @tc.desc 数组所有元素相同时调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0204()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0205
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_10600
     * @tc.desc 在Object.freeze的数组上调用with()，原数组不变且返回新数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0205()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0206
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_10700
     * @tc.desc 通过Proxy代理的数组调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0206()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0207
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_10800
     * @tc.desc 先用with()替换元素，再用at()正索引读取替换后的值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0207()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0208
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_10900
     * @tc.desc 先用with()替换元素，再用at()负索引读取
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0208()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0209
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_11000
     * @tc.desc with()替换后调用toReversed()反转数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0209()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0210
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_11100
     * @tc.desc with()替换后调用toSorted()排序
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0210()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0211
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_11200
     * @tc.desc with()替换后调用toSpliced()进行删除/插入
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0211()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0212
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_11300
     * @tc.desc 对比with()和copyWithin()的行为差异，with()不修改原数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0212()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0213
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_11400
     * @tc.desc 对比with()和splice()的行为差异，with()不修改原数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0213()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0214
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_11500
     * @tc.desc 对比with()和fill()的行为差异，with()只替换单个位置
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0214()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0215
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_11600
     * @tc.desc 先调用toReversed/toSorted等返回新数组的方法，再调用with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0215()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0216
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_11700
     * @tc.desc 空数组调用with()应抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0216()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0217
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_11800
     * @tc.desc 单元素数组调用with()，索引0和-1都应有效
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0217()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0218
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_11900
     * @tc.desc 验证index为-1时正确替换最后一个元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0218()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0219
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_12000
     * @tc.desc 验证index为负length时正确替换第一个元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0219()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0220
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_12100
     * @tc.desc 使用超大正整数值作为索引，验证抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0220()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0221
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_12200
     * @tc.desc 使用超小负整数值作为索引，验证抛出RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0221()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0222
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_12300
     * @tc.desc 通过原型链调用with()方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0222()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0223
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_12400
     * @tc.desc 验证Array.prototype.with的writable属性为true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0223()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0224
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_12500
     * @tc.desc 验证Array.prototype.with的enumerable属性为false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0224()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0225
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_12600
     * @tc.desc 验证Array.prototype.with的configurable属性为true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0225()).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0226
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_TEST_12700
     * @tc.desc 自定义Symbol.species不影响with()返回类型，始终返回普通数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayWithJs.ArrayWithJs_0226()).assertEqual(true);
    })

  })
}
