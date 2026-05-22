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
import * as ArraySymbolSpeciesJs from './array_symbol_species_test';

export default function ArraySymbolSpeciesTest() {
  describe('ArraySymbolSpeciesTest', () => {
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
     * @tc.name testArraySymbolSpeciesTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_0100
     * @tc.desc 验证直接访问 Array[Symbol.species] 返回 Array 构造函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0100()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_0200
     * @tc.desc 使用 Symbol.species 符号访问属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0101()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_0300
     * @tc.desc 验证 Symbol.species 属性不可枚举
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0102()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_0400
     * @tc.desc 验证 Symbol.species 属性可配置
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0103()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_0500
     * @tc.desc 验证 Symbol.species 是 getter 访问器属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0104()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_0600
     * @tc.desc 验证返回值是函数类型
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0105()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_0700
     * @tc.desc 验证返回值与 Array 构造函数相同
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0106()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_0800
     * @tc.desc 验证多次访问返回同一个构造函数引用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0107()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_0900
     * @tc.desc 使用 Symbol.species 返回的构造函数创建数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0108()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_1000
     * @tc.desc 验证子类默认继承 Symbol.species 返回自身构造函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0109()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_1100
     * @tc.desc 通过子类实例访问 constructor[Symbol.species]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0110()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_1200
     * @tc.desc 验证二层继承的 species 行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0111()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_1300
     * @tc.desc 验证三层继承的 species 行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0112()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_1400
     * @tc.desc 验证子类 filter 方法返回实例类型
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0113()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_1500
     * @tc.desc 验证子类 map 方法返回实例类型
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0114()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_1600
     * @tc.desc 验证子类 concat 方法返回实例类型
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0115()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_1700
     * @tc.desc 子类覆盖 Symbol.species 返回 Array 构造函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0116()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_1800
     * @tc.desc 验证覆盖后 filter 返回 Array 实例而非 MyArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0117()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_1900
     * @tc.desc 子类覆盖 species 返回另一个自定义类
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0118()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_2000
     * @tc.desc 验证覆盖后 map 返回 CustomArray 实例
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0119()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_2100
     * @tc.desc 子类覆盖 species 返回 null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0120()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_2200
     * @tc.desc 子类覆盖 species 返回 undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0121()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_2300
     * @tc.desc 验证 map 方法使用 Symbol.species 构造返回值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0122()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_2400
     * @tc.desc 验证 map 对空数组的处理
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0123()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_2500
     * @tc.desc 验证 filter 方法使用 Symbol.species 构造返回值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0124()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_2600
     * @tc.desc 验证 filter 无匹配项时返回空数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0125()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_2700
     * @tc.desc 验证 concat 方法使用 Symbol.species 构造返回值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0126()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_2800
     * @tc.desc 验证 concat 不传参数时的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0127()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_2900
     * @tc.desc 验证 slice 方法使用 Symbol.species 构造返回值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0128()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_3000
     * @tc.desc 验证 slice 使用负索引的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0129()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_3100
     * @tc.desc 验证 flat 方法使用 Symbol.species 构造返回值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0130()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_3200
     * @tc.desc 验证 flatMap 方法使用 Symbol.species 构造返回值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0131()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_3300
     * @tc.desc 验证 splice 方法使用 Symbol.species 构造返回删除的元素数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0132()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_3400
     * @tc.desc 验证 species 可以返回非 Array 的构造函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0133()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_3500
     * @tc.desc 验证返回普通对象构造函数后的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0134()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_3600
     * @tc.desc species 返回 Set 构造函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0135()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_3700
     * @tc.desc species 返回 Map 构造函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0136()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_3800
     * @tc.desc 验证 species 返回 Proxy 包装的构造函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0137()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_3900
     * @tc.desc species 返回使用 bind 绑定的构造函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0138()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_4000
     * @tc.desc 验证空数组调用 map 方法时 species 的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0139()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_4100
     * @tc.desc 验证空数组调用 filter 方法时 species 的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0140()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_4200
     * @tc.desc 验证大数组 map 操作时 species 的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0141()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_4300
     * @tc.desc 验证稀疏数组 map 操作时 species 的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0142()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_4400
     * @tc.desc 验证数组包含 undefined 时 species 的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0143()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_4500
     * @tc.desc 验证数组包含 null 时 species 的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0144()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_4600
     * @tc.desc 验证数组包含 NaN 时 species 的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0145()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_4700
     * @tc.desc 验证 species getter 可以返回动态变化的构造函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0146()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_4800
     * @tc.desc 验证数组包含自身引用时 species 的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0147()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_4900
     * @tc.desc 验证 species getter 抛出异常时的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0148()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_5000
     * @tc.desc 验证 species getter 抛出 TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0149()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_5100
     * @tc.desc species 返回字符串时的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0150()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_5200
     * @tc.desc species 返回数字时的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0151()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_5300
     * @tc.desc species 返回普通对象时的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0152()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_5400
     * @tc.desc species 返回 Symbol 时的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0153()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_5500
     * @tc.desc 验证删除 Array[Symbol.species] 后的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0154()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_5600
     * @tc.desc 验证删除子类 Symbol.species 后回退到父类
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0155()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_5700
     * @tc.desc 验证将 species 设为只读后的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0156()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_5800
     * @tc.desc 验证 species 返回的构造函数在实例化时抛出错误
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0157()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_TEST_5900
     * @tc.desc 验证 constructor 被设为 null 时的行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0158()).assertEqual(true);
    })
  })
}
