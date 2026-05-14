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
import * as ToStringJs from './ToString';

export default function ArrayToStringMindMapTest() {
  describe('ArrayToStringMindMapTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // 用模块加载时快照恢复 join，避免前序用例 delete/覆盖 prototype 后仅「赋值」恢复与引擎内部不一致
      ToStringJs.restoreArrayPrototypeJoinSnapshot();
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
     * @tc.name   testToStringTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0100
     * @tc.desc   简单数组转字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0100()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0200
     * @tc.desc   混合类型数组转字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0101()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0300
     * @tc.desc   返回值类型验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0102()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0400
     * @tc.desc   空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0103()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0500
     * @tc.desc   单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0104()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0600
     * @tc.desc   大数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0105()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0700
     * @tc.desc   数值类型元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0106()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0800
     * @tc.desc   字符串类型元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0107()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0900
     * @tc.desc   布尔类型元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0108()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1000
     * @tc.desc   null 和 undefined 元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0109()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1100
     * @tc.desc   对象类型元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0110()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1200
     * @tc.desc   Symbol 类型元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0111()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1300
     * @tc.desc   BigInt 类型元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0112()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1400
     * @tc.desc   函数类型元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0113()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1500
     * @tc.desc   二维数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0114()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1600
     * @tc.desc   多层嵌套数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0115()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1700
     * @tc.desc   混合嵌套（数组与非数组元素混合）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0116()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1800
     * @tc.desc   含空槽的数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0117()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1900
     * @tc.desc   首尾空槽
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0118()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2000
     * @tc.desc   全空槽数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0119()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2100
     * @tc.desc   Array构造函数创建的稀疏数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0120()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2200
     * @tc.desc   数组自身引用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0121()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2300
     * @tc.desc   间接循环引用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0122()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2400
     * @tc.desc   深层循环引用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0123()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2500
     * @tc.desc   正常join方法调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0124()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2600
     * @tc.desc   join方法被覆盖为非函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0125()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2700
     * @tc.desc   join方法被删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0126()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2800
     * @tc.desc   join方法返回非字符串值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0127()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2900
     * @tc.desc   join方法抛出异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0128()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3000
     * @tc.desc   字符串拼接中的隐式调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0129()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3100
     * @tc.desc   模板字符串中的隐式调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0130()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3200
     * @tc.desc   String()显式转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0131()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3300
     * @tc.desc   加号运算符触发转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0132()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3400
     * @tc.desc   call绑定普通对象（有join方法）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0133()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3500
     * @tc.desc   call绑定普通对象（无join方法）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0134()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3600
     * @tc.desc   call绑定null或undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0135()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3700
     * @tc.desc   call绑定原始类型值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0136()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3800
     * @tc.desc   apply和bind方式调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0137()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3900
     * @tc.desc   toString与join对比
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0138()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4000
     * @tc.desc   toString与toLocaleString对比
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0139()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4100
     * @tc.desc   toString与valueOf交互
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0140()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4200
     * @tc.desc   toString与JSON.stringify对比
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0141()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4300
     * @tc.desc   修改join对toString的影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0142()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4400
     * @tc.desc   Array子类实例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0143()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4500
     * @tc.desc   类数组对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0144()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4600
     * @tc.desc   Proxy代理的数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0145()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4700
     * @tc.desc   冻结数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0146()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4800
     * @tc.desc   Object.create(Array.prototype)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 拆成两次 expect，全量失败时可区分是「空对象」分支还是「带下标」分支
      expect(ToStringJs.ToStringJs_0147_empty()).assertEqual(true);
      expect(ToStringJs.ToStringJs_0147_indexed()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4900
     * @tc.desc   分隔符验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0148()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_5000
     * @tc.desc   返回值不可变性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0149()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_5100
     * @tc.desc   toString不修改原数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0150()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_5200
     * @tc.desc   连续调用toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0151()).assertEqual(true);
    });
  });
}
