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
import * as ToSplicedJs from './ToSpliced';

export default function ArrayToSplicedMindMapTest() {
  describe('ArrayToSplicedMindMapTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   testToSplicedTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0100
     * @tc.desc   1.1.1 从数组中间删除元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0100()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0200
     * @tc.desc   1.1.2 从数组头部删除元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0101()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0300
     * @tc.desc   1.1.3 从数组尾部删除元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0102()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0400
     * @tc.desc   1.1.4 删除数组所有元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0103()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0500
     * @tc.desc   1.2.1 在数组中间插入元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0104()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0600
     * @tc.desc   1.2.2 在数组头部插入元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0105()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0700
     * @tc.desc   1.2.3 在数组尾部追加元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0106()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0800
     * @tc.desc   1.2.4 插入单个元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0107()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0900
     * @tc.desc   1.2.5 插入多个元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0108()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1000
     * @tc.desc   1.3.1 用一个元素替换一个元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0109()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1100
     * @tc.desc   1.3.2 用多个元素替换一个元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0110()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1200
     * @tc.desc   1.3.3 用一个元素替换多个元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0111()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1300
     * @tc.desc   1.3.4 用多个元素替换多个元素（数量不同）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0112()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1400
     * @tc.desc   1.4.1 start和deleteCount均为0且无item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0113()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1500
     * @tc.desc   1.4.2 start等于数组长度且无item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0114()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1600
     * @tc.desc   2.1.1 start=0（从头部开始）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0115()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1700
     * @tc.desc   2.1.2 start在数组中间
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0116()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1800
     * @tc.desc   2.1.3 start等于array.length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0117()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1900
     * @tc.desc   2.1.4 start大于array.length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0118()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2000
     * @tc.desc   2.2.1 start为-1（从末尾倒数第1个）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0119()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2100
     * @tc.desc   2.2.2 start为负数且在范围内
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0120()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2200
     * @tc.desc   2.2.3 start为负数且绝对值等于array.length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0121()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2300
     * @tc.desc   2.2.4 start为负数且绝对值大于array.length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0122()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2400
     * @tc.desc   2.3.1 start省略（不传start参数）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0123()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2500
     * @tc.desc   2.3.2 start为NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0124()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2600
     * @tc.desc   2.3.3 start为Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0125()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2700
     * @tc.desc   2.3.4 start为-Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0126()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2800
     * @tc.desc   2.3.5 start为浮点数（向下取整）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0127()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2900
     * @tc.desc   2.3.6 start为字符串数字
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0128()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3000
     * @tc.desc   2.3.7 start为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0129()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3100
     * @tc.desc   2.3.8 start为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0130()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3200
     * @tc.desc   2.3.9 start为true/false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0131()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3300
     * @tc.desc   3.1.1 deleteCount=0（不删除）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0132()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3400
     * @tc.desc   3.1.2 deleteCount小于从start到末尾的元素数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0133()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3500
     * @tc.desc   3.1.3 deleteCount等于从start到末尾的元素数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0134()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3600
     * @tc.desc   3.1.4 deleteCount大于从start到末尾的元素数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0135()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3700
     * @tc.desc   3.2.1 deleteCount省略
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0136()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3800
     * @tc.desc   3.2.2 deleteCount为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0137()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3900
     * @tc.desc   3.2.3 deleteCount为undefined且传item参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0138()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4000
     * @tc.desc   3.2.4 deleteCount为Infinity且传item参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0139()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4100
     * @tc.desc   3.2.5 deleteCount为负数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0140()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4200
     * @tc.desc   3.2.6 deleteCount为NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0141()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4300
     * @tc.desc   3.2.7 deleteCount为浮点数（截断取整）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0142()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4400
     * @tc.desc   3.2.8 deleteCount为字符串数字
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0143()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4500
     * @tc.desc   3.2.9 deleteCount为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0144()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4600
     * @tc.desc   3.2.10 deleteCount为true/false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0145()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4700
     * @tc.desc   4.1.1 item为数字
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0146()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4800
     * @tc.desc   4.1.2 item为字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0147()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4900
     * @tc.desc   4.1.3 item为对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0148()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5000
     * @tc.desc   4.1.4 item为数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0149()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5100
     * @tc.desc   4.1.5 item为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0150()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5200
     * @tc.desc   4.1.6 item为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0151()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5300
     * @tc.desc   4.1.7 item为布尔值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0152()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5400
     * @tc.desc   4.1.8 item为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0153()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5500
     * @tc.desc   4.1.9 item为Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0154()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5600
     * @tc.desc   4.1.10 item为BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0155()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5700
     * @tc.desc   4.2.1 不传item参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0156()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5800
     * @tc.desc   4.2.2 传入一个item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0157()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5900
     * @tc.desc   4.2.3 传入多个item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0158()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6000
     * @tc.desc   4.2.4 传入大量item（性能关注点）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0159()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6100
     * @tc.desc   4.3.1 item为Date对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0160()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6200
     * @tc.desc   4.3.2 item为RegExp对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0161()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6300
     * @tc.desc   4.3.3 item为Map/Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0162()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6400
     * @tc.desc   4.3.4 item为稀疏数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0163()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6500
     * @tc.desc   5.1.1 返回值是新数组对象（引用不同）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0164()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6600
     * @tc.desc   5.1.2 返回值的length属性正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0165()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6700
     * @tc.desc   5.1.3 返回值是Array实例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0166()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6800
     * @tc.desc   5.1.4 返回值包含正确的元素顺序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0167()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6900
     * @tc.desc   5.2.1 原数组内容不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0168()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7000
     * @tc.desc   5.2.2 原数组length不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0169()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7100
     * @tc.desc   5.2.3 原数组的元素引用不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0170()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7200
     * @tc.desc   5.2.4 多次调用toSpliced互不影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0171()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7300
     * @tc.desc   5.3.1 对象元素是浅拷贝（引用相同）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0172()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7400
     * @tc.desc   5.3.2 未被删除的对象元素保留原引用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0173()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7500
     * @tc.desc   6.1.1 稀疏数组的空槽转为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0174()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7600
     * @tc.desc   6.1.2 返回的数组是密集数组（无空槽）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0175()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7700
     * @tc.desc   6.1.3 稀疏数组中空槽在删除范围内
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0176()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7800
     * @tc.desc   6.1.4 稀疏数组中空槽在保留范围内
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0177()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7900
     * @tc.desc   6.2.1 全部为空槽的数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0178()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8000
     * @tc.desc   6.2.2 大间隔稀疏数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0179()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8100
     * @tc.desc   7.1.1 空数组上调用toSpliced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0180()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8200
     * @tc.desc   7.1.2 空数组不传参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0181()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8300
     * @tc.desc   7.1.3 空数组仅传start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0182()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8400
     * @tc.desc   7.2.1 单元素数组删除唯一元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0183()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8500
     * @tc.desc   7.2.2 单元素数组替换唯一元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0184()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8600
     * @tc.desc   7.2.3 单元素数组在元素前插入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0185()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8700
     * @tc.desc   7.3.1 数组包含多种类型元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0186()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8800
     * @tc.desc   7.3.2 插入不同类型元素到混合数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0187()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8900
     * @tc.desc   7.4.1 大数组删除操作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0188()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9000
     * @tc.desc   7.4.2 大数组插入操作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0189()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9100
     * @tc.desc   7.5.1 冻结数组上调用toSpliced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0190()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9200
     * @tc.desc   7.5.2 密封数组上调用toSpliced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0191()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9300
     * @tc.desc   8.1.1 具有length和整数键属性的普通对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0192()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9400
     * @tc.desc   8.1.2 arguments对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0193()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9500
     * @tc.desc   8.1.3 字符串对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0194()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9600
     * @tc.desc   8.1.4 NodeList/HTMLCollection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0195()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9700
     * @tc.desc   8.2.1 length为0的对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0196()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9800
     * @tc.desc   8.2.2 length大于实际属性数的对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0197()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9900
     * @tc.desc   8.2.3 length小于实际属性数的对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0198()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_10000
     * @tc.desc   8.2.4 length为负数的对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0199()).assertEqual(true);
    });
  });
}
