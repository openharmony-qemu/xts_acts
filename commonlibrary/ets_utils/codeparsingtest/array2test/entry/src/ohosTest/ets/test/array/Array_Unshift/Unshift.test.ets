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
import * as UnshiftJs from './Unshift';

export default function ArrayUnshiftMindMapTest() {
  describe('ArrayUnshiftMindMapTest', () => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name   testUnshiftTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0100
     * @tc.desc   向数组开头添加单个数字元素，验证数组内容和长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0100()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0200
     * @tc.desc   向数组开头添加单个字符串元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0101()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0300
     * @tc.desc   向数组开头添加布尔值元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0102()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0400
     * @tc.desc   向数组开头添加对象元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0103()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0500
     * @tc.desc   一次添加多个数字元素，验证插入顺序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0104()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0600
     * @tc.desc   一次添加多个不同类型元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0105()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0700
     * @tc.desc   添加两个引用类型元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0106()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0800
     * @tc.desc   验证多参数插入时保持参数顺序不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0107()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0900
     * @tc.desc   验证原数组元素被整体后移
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0108()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1000
     * @tc.desc   验证参数按块插入（非逐个倒序插入）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0109()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1100
     * @tc.desc   数字类型参数（浮点数）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0110()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1200
     * @tc.desc   数字类型参数（负数）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0111()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1300
     * @tc.desc   数字类型参数（0 和 -0）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0112()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1400
     * @tc.desc   空字符串参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0113()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1500
     * @tc.desc   布尔值参数（true）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0114()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1600
     * @tc.desc   布尔值参数（false）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0115()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1700
     * @tc.desc   undefined 作为参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0116()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1800
     * @tc.desc   null 作为参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0117()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1900
     * @tc.desc   NaN 作为参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0118()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2000
     * @tc.desc   -Infinity 作为参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0119()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2100
     * @tc.desc   Symbol 作为参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0120()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2200
     * @tc.desc   普通对象作为参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0121()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2300
     * @tc.desc   函数作为参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0122()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2400
     * @tc.desc   Date 对象作为参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0123()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2500
     * @tc.desc   RegExp 对象作为参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0124()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2600
     * @tc.desc   Set 对象作为参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0125()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2700
     * @tc.desc   混合多种引用类型参数一次添加
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0126()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2800
     * @tc.desc   空数组添加1个元素，返回值为1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0127()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2900
     * @tc.desc   非空数组添加1个元素，返回值为原长度+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0128()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3000
     * @tc.desc   返回值与数组实际 length 属性一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0129()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3100
     * @tc.desc   返回值类型为 number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0130()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3200
     * @tc.desc   无参数调用时返回值仍为 number（当前长度）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0131()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3300
     * @tc.desc   交替添加不同数量元素，返回值正确累加
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0132()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3400
     * @tc.desc   无参数调用 unshift()，数组不变，返回当前长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0133()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3500
     * @tc.desc   空数组无参数调用，返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0134()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3600
     * @tc.desc   分3次每次传入1个参数，元素顺序相反
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0135()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3700
     * @tc.desc   验证两种调用方式产生不同结果
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0136()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3800
     * @tc.desc   两两组合与一次全部添加的结果对比
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0137()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3900
     * @tc.desc   使用 Function.prototype.apply 传入参数数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0138()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4000
     * @tc.desc   使用 bind 绑定目标对象后调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0139()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4100
     * @tc.desc   使用 Reflect.apply 调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0140()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4200
     * @tc.desc   空数组上 unshift 多个元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0141()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4300
     * @tc.desc   单元素数组 unshift 后变为两元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0142()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4400
     * @tc.desc   包含100个元素的数组 unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0143()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4500
     * @tc.desc   含空洞（hole）的稀疏数组 unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0144()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4600
     * @tc.desc   用 delete 删除元素后的数组 unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0145()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4700
     * @tc.desc   Array(n) 创建的纯稀疏数组 unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0146()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4800
     * @tc.desc   unshift 不会返回新数组，返回值是数字
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0147()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4900
     * @tc.desc   原有元素的索引全部增加 unshift 的参数个数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0148()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5000
     * @tc.desc   验证所有原有元素的新索引位置正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0149()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5100
     * @tc.desc   连续 unshift 后 length 持续更新
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0150()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5200
     * @tc.desc   unshift 后原始元素整体后移且保持顺序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0151()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5300
     * @tc.desc   稀疏数组的空洞也被正确后移
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0152()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5400
     * @tc.desc   有 length 和数字索引属性的类数组对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0153()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5500
     * @tc.desc   类数组对象中只有 length 没有索引属性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0154()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5600
     * @tc.desc   没有 length 属性的纯对象，length 视为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0155()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5700
     * @tc.desc   纯对象上多次 unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0156()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5800
     * @tc.desc   arguments 对象已有元素后移
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0157()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5900
     * @tc.desc   在字符串上调用 unshift 应抛出 TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0158()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6000
     * @tc.desc   在 String 对象（包装类型）上调用也应失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0159()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6100
     * @tc.desc   length 接近 Number.MAX_SAFE_INTEGER 时 unshift 的行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0160()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6200
     * @tc.desc   length 为负数时视为 0 处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0161()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6300
     * @tc.desc   length 为 -0 时视为 0 处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0162()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6400
     * @tc.desc   length 为 3.9 时的截断处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0163()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6500
     * @tc.desc   length 为 NaN 时视为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0164()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6600
     * @tc.desc   length 为 Infinity 时的行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0165()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6700
     * @tc.desc   length 属性 writable 为 false 时 unshift 的行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0166()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6800
     * @tc.desc   完全没有 length 属性的对象，视为 length=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0167()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6900
     * @tc.desc   冻结数组上调用 unshift 抛出 TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0168()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7000
     * @tc.desc   密封数组上调用 unshift（不能添加新属性，已有属性可修改）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0169()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7100
     * @tc.desc   某个索引属性 configurable 为 false 时不影响 unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0170()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7200
     * @tc.desc   索引属性 writable 为 false，unshift 尝试移动时抛出 TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0171()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7300
     * @tc.desc   类数组对象的 length 不可写
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0172()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7400
     * @tc.desc   先 unshift 再 shift，实现元素替换效果
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0173()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7500
     * @tc.desc   循环 unshift + shift，数组长度不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0174()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7600
     * @tc.desc   先 push 再 unshift，两端都增长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0175()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7700
     * @tc.desc   unshift 在开头添加，pop 在末尾移除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0176()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7800
     * @tc.desc   unshift + pop 实现队列效果
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0177()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7900
     * @tc.desc   unshift 后 splice 修改数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0178()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8000
     * @tc.desc   unshift 后 sort 排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0179()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8100
     * @tc.desc   unshift 后 reverse 反转
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0180()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8200
     * @tc.desc   unshift 后 map 转换数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0181()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8300
     * @tc.desc   unshift 后 reduce 求和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0182()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8400
     * @tc.desc   unshift 与 concat 的区别（concat 不修改原数组）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0183()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8500
     * @tc.desc   spread 展开后再 unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0184()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8600
     * @tc.desc   unshift 后 indexOf 查找新元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0185()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8700
     * @tc.desc   unshift 后 includes 验证包含关系
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0186()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8800
     * @tc.desc   unshift 后 find 查找元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0187()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8900
     * @tc.desc   非严格模式下冻结数组 unshift 静默失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0188()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9000
     * @tc.desc   严格模式下密封数组 unshift 抛出 TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0189()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9100
     * @tc.desc   null 作为 this 抛出 TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0190()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9200
     * @tc.desc   数字作为 this，自动包装为 Number 对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0191()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9300
     * @tc.desc   布尔值作为 this
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0192()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9400
     * @tc.desc   Symbol 作为 this
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0193()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9500
     * @tc.desc   Proxy 拦截 set 操作阻止 unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0194()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9600
     * @tc.desc   Proxy 拦截 get 读取 length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0195()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9700
     * @tc.desc   一次传入大量参数（10000个）的 unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0196()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9800
     * @tc.desc   含循环引用的对象作为 unshift 参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0197()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9900
     * @tc.desc   数组自身作为参数（数组嵌套自身）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0198()).assertEqual(true);
    });
    /**
     * @tc.name   testUnshiftTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9999
     * @tc.desc   对象的数字索引有 getter 时 unshift 的行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0199()).assertEqual(true);
    });
  });
}
