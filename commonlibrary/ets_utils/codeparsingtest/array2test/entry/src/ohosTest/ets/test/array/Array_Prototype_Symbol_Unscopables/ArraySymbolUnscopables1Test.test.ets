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
import * as ArraySymbolUnscopablesJs from './array_symbol_unscopables_test';

export default function ArraySymbolUnscopables1Test() {
  describe('ArraySymbolUnscopables1Test', () => {
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
     * @tc.name testArraySymbolUnscopablesTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_0100
     * @tc.desc 验证Array.prototype上是否存在Symbol.unscopables属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0100()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_0200
     * @tc.desc 验证不同数组实例引用的是同一个unscopables对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0101()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_0300
     * @tc.desc 验证Symbol.unscopables不出现在普通属性名列表中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0102()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_0400
     * @tc.desc 验证Symbol.unscopables出现在Symbol属性列表中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0103()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_0500
     * @tc.desc 验证Symbol.unscopables属性不可写
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0104()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_0600
     * @tc.desc 验证Symbol.unscopables属性不可枚举
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0105()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_0700
     * @tc.desc 验证Symbol.unscopables属性可配置
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0106()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_0800
     * @tc.desc 在严格模式下对Array.prototype[Symbol.unscopables]赋值应抛出TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0107()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_0900
     * @tc.desc 验证unscopables的值是object类型
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0108()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_1000
     * @tc.desc 验证unscopables不是Array的实例
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0109()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_1100
     * @tc.desc 验证unscopables属性值本身不是null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0110()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_1200
     * @tc.desc 验证unscopables对象的[[Prototype]]为null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0111()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_1300
     * @tc.desc 验证通过__proto__访问原型为null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0112()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_1400
     * @tc.desc 验证unscopables不继承Object.prototype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0113()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_1500
     * @tc.desc 验证unscopables对象包含at属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0114()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_1600
     * @tc.desc 验证unscopables对象包含copyWithin属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0115()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_1700
     * @tc.desc 验证unscopables对象包含entries属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0116()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_1800
     * @tc.desc 验证unscopables对象包含fill属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0117()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_1900
     * @tc.desc 验证unscopables对象包含find属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0118()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_2000
     * @tc.desc 验证unscopables对象包含findIndex属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0119()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_2100
     * @tc.desc 验证unscopables对象包含findLast属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0120()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_2200
     * @tc.desc 验证unscopables对象包含findLastIndex属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0121()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_2300
     * @tc.desc 验证unscopables对象包含flat属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0122()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_2400
     * @tc.desc 验证unscopables对象包含flatMap属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0123()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_2500
     * @tc.desc 验证unscopables对象包含includes属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0124()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_2600
     * @tc.desc 验证unscopables对象包含keys属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0125()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_2700
     * @tc.desc 验证unscopables对象包含toReversed属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0126()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_2800
     * @tc.desc 验证unscopables对象包含toSorted属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0127()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_2900
     * @tc.desc 验证unscopables对象包含toSpliced属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0128()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_3000
     * @tc.desc 验证unscopables对象包含values属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0129()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_3100
     * @tc.desc 验证unscopables对象中所有属性的值都是true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0130()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_3200
     * @tc.desc 验证at属性的值严格等于true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0131()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_3300
     * @tc.desc 验证includes属性的值严格等于true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0132()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_3400
     * @tc.desc 验证values属性的值严格等于true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0133()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_3500
     * @tc.desc 验证push方法不在unscopables列表中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0134()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_3600
     * @tc.desc 验证pop方法不在unscopables列表中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0135()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_3700
     * @tc.desc 验证map方法不在unscopables列表中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0136()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_3800
     * @tc.desc 验证forEach方法不在unscopables列表中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0137()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_3900
     * @tc.desc 验证length属性不在unscopables列表中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0138()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_4000
     * @tc.desc 验证indexOf方法不在unscopables列表中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0139()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_4100
     * @tc.desc 验证sort方法不在unscopables列表中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0140()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_4200
     * @tc.desc 验证slice方法不在unscopables列表中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0141()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_4300
     * @tc.desc 验证unscopables对象的自有属性数量为16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0142()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_4400
     * @tc.desc 验证unscopables对象不包含Symbol键的自有属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0143()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_4500
     * @tc.desc 验证unscopables包含完整的16个属性名列表
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0144()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_4600
     * @tc.desc 在with语句中，keys应解析为外部变量而非Array.prototype.keys方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0145()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_4700
     * @tc.desc 在with语句中，values应解析为外部变量而非Array.prototype.values方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0146()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_4800
     * @tc.desc 在with语句中，includes应解析为外部变量而非Array.prototype.includes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0147()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_4900
     * @tc.desc 在with语句中，find应解析为外部变量而非Array.prototype.find
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0148()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_5000
     * @tc.desc 在with语句中，fill应解析为外部变量而非Array.prototype.fill
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0149()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_5100
     * @tc.desc 在with语句中，entries应解析为外部变量而非Array.prototype.entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0150()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_5200
     * @tc.desc 在with语句中，at应解析为外部变量而非Array.prototype.at
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0151()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_5300
     * @tc.desc 在with语句中，flat应解析为外部变量而非Array.prototype.flat
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0152()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_5400
     * @tc.desc push不是unscopable，在with中应绑定到Array.prototype.push
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0153()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_5500
     * @tc.desc pop不是unscopable，在with中应绑定到Array.prototype.pop
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0154()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_5600
     * @tc.desc length不是unscopable，在with中应绑定到数组的length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0155()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_5700
     * @tc.desc map不是unscopable，在with中应绑定到Array.prototype.map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0156()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_5800
     * @tc.desc toString不在unscopables中（因为原型为null），在with中应正常调用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0157()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_5900
     * @tc.desc indexOf不是unscopable，在with中应绑定到Array.prototype.indexOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0158()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_6000
     * @tc.desc 当属性名在unscopables列表中时，with语句应从外部作用域查找
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0159()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_6100
     * @tc.desc 当unscopable属性名在外部作用域不存在时，访问应抛出ReferenceError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0160()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_6200
     * @tc.desc 当外部定义了与unscopable属性同名的函数时，with中应调用外部函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0161()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_6300
     * @tc.desc 在with语句内的嵌套函数中，unscopable属性名应回退到外部作用域
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0162()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_6400
     * @tc.desc join不是unscopable，在with中可直接调用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0163()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_6500
     * @tc.desc concat不是unscopable，在with中可直接调用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0164()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_6600
     * @tc.desc reduce不是unscopable，在with中可直接调用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0165()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_6700
     * @tc.desc splice不是unscopable，在with中可直接调用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0166()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_6800
     * @tc.desc at方法在with语句中不应被绑定，应回退到外部变量
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0167()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_6900
     * @tc.desc unscopables不影响通过对象显式调用at方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0168()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_7000
     * @tc.desc copyWithin方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0169()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_7100
     * @tc.desc unscopables不影响通过对象显式调用copyWithin方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0170()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_7200
     * @tc.desc entries方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0171()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_7300
     * @tc.desc unscopables不影响通过对象显式调用entries方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0172()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_7400
     * @tc.desc fill方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0173()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_7500
     * @tc.desc unscopables不影响通过对象显式调用fill方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0174()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_7600
     * @tc.desc find方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0175()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_7700
     * @tc.desc unscopables不影响通过对象显式调用find方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0176()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_7800
     * @tc.desc findIndex方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0177()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_7900
     * @tc.desc unscopables不影响通过对象显式调用findIndex方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0178()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_8000
     * @tc.desc findLast方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0179()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_8100
     * @tc.desc unscopables不影响通过对象显式调用findLast方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0180()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_8200
     * @tc.desc findLastIndex方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0181()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_8300
     * @tc.desc unscopables不影响通过对象显式调用findLastIndex方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0182()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_8400
     * @tc.desc flat方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0183()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_8500
     * @tc.desc unscopables不影响通过对象显式调用flat方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0184()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_8600
     * @tc.desc flatMap方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0185()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_8700
     * @tc.desc unscopables不影响通过对象显式调用flatMap方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0186()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_8800
     * @tc.desc includes方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0187()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_8900
     * @tc.desc unscopables不影响通过对象显式调用includes方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0188()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_9000
     * @tc.desc keys方法在with语句中不应被绑定，这是unscopables设计的主要场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0189()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_9100
     * @tc.desc unscopables不影响通过对象显式调用keys方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0190()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_9200
     * @tc.desc toReversed方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0191()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_9300
     * @tc.desc unscopables不影响通过对象显式调用toReversed方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0192()).assertEqual(true);
    })
  })
}
