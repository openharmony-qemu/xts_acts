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

export default function ArraySymbolUnscopables2Test() {
  describe('ArraySymbolUnscopables2Test', () => {
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
     * @tc.name testArraySymbolUnscopablesTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_9400
     * @tc.desc toSorted方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0193()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_9500
     * @tc.desc unscopables不影响通过对象显式调用toSorted方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0194()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_9600
     * @tc.desc toSpliced方法在with语句中不应被绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0195()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_9700
     * @tc.desc unscopables不影响通过对象显式调用toSpliced方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0196()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_9800
     * @tc.desc values方法在with语句中不应被绑定，这是unscopables设计的关键场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0197()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_9900
     * @tc.desc unscopables不影响通过对象显式调用values方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0198()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_10000
     * @tc.desc 验证unscopables对象的原型严格为null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0199()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0200
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_10100
     * @tc.desc null原型对象不是Object的实例
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0200()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0201
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_10200
     * @tc.desc null原型对象不能调用Object.prototype上的方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0201()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0202
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_10300
     * @tc.desc 验证unscopables对象不继承Object.prototype.toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0202()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0203
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_10400
     * @tc.desc 验证unscopables对象不继承Object.prototype.hasOwnProperty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0203()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0204
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_10500
     * @tc.desc 验证unscopables对象不继承Object.prototype.constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0204()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0205
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_10600
     * @tc.desc 验证unscopables对象不继承Object.prototype.isPrototypeOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0205()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0206
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_10700
     * @tc.desc 由于原型为null，toString不在unscopables中，with语句中可正常调用toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0206()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0207
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_10800
     * @tc.desc valueOf不在unscopables中，with语句中可正常调用valueOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0207()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0208
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_10900
     * @tc.desc 如果unscopables使用普通对象（原型非null），toString会被错误排除
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0208()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0209
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_11000
     * @tc.desc 将keys设为false后，keys在with中应绑定到Array.prototype.keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0209()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0210
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_11100
     * @tc.desc 将includes设为false后，includes在with中应绑定到Array.prototype.includes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0210()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0211
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_11200
     * @tc.desc 将keys设为非true的truthy值（如1、"yes"），仍应被排除
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0211()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0212
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_11300
     * @tc.desc 将find设为0（falsy），find在with中应绑定到Array.prototype.find
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0212()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0213
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_11400
     * @tc.desc 将push添加到unscopables并设为true，push在with中不再可用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0213()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0214
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_11500
     * @tc.desc 在unscopables中添加一个自定义属性名
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0214()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0215
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_11600
     * @tc.desc 删除unscopables中的keys属性后，keys在with中应绑定到Array.prototype.keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0215()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0216
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_11700
     * @tc.desc 删除unscopables中的values属性后，values在with中应绑定到Array.prototype.values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0216()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0217
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_11800
     * @tc.desc 用自定义的null原型对象替换unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0217()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0218
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_11900
     * @tc.desc 用空的null原型对象替换unscopables，所有方法在with中应可绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0218()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0219
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_12000
     * @tc.desc 将unscopables设为undefined，所有属性在with中应可绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0219()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0220
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_12100
     * @tc.desc 在运行时修改unscopables对象的属性，后续with语句应反映修改
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0220()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0221
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_12200
     * @tc.desc 普通数组实例通过原型链访问Array.prototype[Symbol.unscopables]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0221()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0222
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_12300
     * @tc.desc 数组实例在with语句中遵循unscopables规则
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0222()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0223
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_12400
     * @tc.desc 空数组和非空数组共享同一个unscopables对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0223()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0224
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_12500
     * @tc.desc 自定义Array子类应继承unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0224()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0225
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_12600
     * @tc.desc Array子类实例在with中应遵循相同的unscopables规则
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0225()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0226
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_12700
     * @tc.desc Array子类可以在原型上定义自己的Symbol.unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0226()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0227
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_12800
     * @tc.desc Object.create(Array.prototype)创建的对象应继承unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0227()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0228
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_12900
     * @tc.desc Object.create(Array.prototype)的对象在with中遵循unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0228()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0229
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_13000
     * @tc.desc 在Array.prototype[Symbol.unscopables]上添加属性影响所有实例的with行为
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0229()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0230
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_13100
     * @tc.desc 严格模式下with语句是语法错误，与unscopables无关
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0230()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0231
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_13200
     * @tc.desc 在函数内声明严格模式，with语句不可用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0231()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0232
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_13300
     * @tc.desc 非严格模式下unscopables机制正常生效
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0232()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0233
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_13400
     * @tc.desc 非严格模式下非unscopable方法在with中正常绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0233()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0234
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_13500
     * @tc.desc 严格模式下可以正常访问Array.prototype[Symbol.unscopables]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0234()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0235
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_13600
     * @tc.desc 严格模式下可以修改unscopables对象的属性值（unscopables对象本身不是冻结的）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0235()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0236
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_13700
     * @tc.desc 在严格模式下，unscopables对象仍然指向同一引用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0236()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0237
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_13800
     * @tc.desc 空数组的unscopables对象与有元素的数组相同
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0237()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0238
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_13900
     * @tc.desc 空数组在with语句中仍然遵循unscopables规则
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0238()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0239
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_14000
     * @tc.desc 冻结数组不影响unscopables的访问
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0239()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0240
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_14100
     * @tc.desc 冻结数组在with语句中仍遵循unscopables规则
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0240()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0241
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_14200
     * @tc.desc 密封数组不影响unscopables的访问
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0241()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0242
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_14300
     * @tc.desc 密封数组在with语句中仍遵循unscopables规则
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0242()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0243
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_14400
     * @tc.desc Proxy代理的数组可以通过get trap控制Symbol.unscopables的返回值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0243()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0244
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_14500
     * @tc.desc Proxy返回null作为unscopables，所有属性在with中可绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0244()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0245
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_14600
     * @tc.desc Proxy返回undefined作为unscopables，所有属性在with中可绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0245()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0246
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_14700
     * @tc.desc 普通对象（非数组）没有默认的Symbol.unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0246()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0247
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_14800
     * @tc.desc Arguments对象没有Symbol.unscopables属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0247()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0248
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_14900
     * @tc.desc TypedArray有自己的Symbol.unscopables，与Array的不同
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0248()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0249
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_15000
     * @tc.desc 字符串不是数组，不继承Array的unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0249()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0250
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_15100
     * @tc.desc with语句通过Symbol.unscopables键查找排除列表
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0250()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0251
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_15200
     * @tc.desc 对象没有Symbol.unscopables时，with绑定所有属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0251()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0252
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_15300
     * @tc.desc 对象的Symbol.unscopables为undefined时，所有属性都绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0252()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0253
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_15400
     * @tc.desc unscopables中属性值为true时该属性在with中被排除
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0253()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0254
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_15500
     * @tc.desc unscopables中属性值为false时该属性在with中可绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0254()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0255
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_15600
     * @tc.desc unscopables中属性值为undefined（falsy）时该属性在with中可绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0255()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0256
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_15700
     * @tc.desc unscopables中属性值为0（falsy）时该属性在with中可绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0256()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0257
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_15800
     * @tc.desc unscopables中属性值为''（falsy）时该属性在with中可绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0257()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0258
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_15900
     * @tc.desc unscopables中属性值为非空对象（truthy）时属性被排除
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0258()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0259
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_16000
     * @tc.desc with语句在unscopables对象中查找属性时会遍历原型链
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0259()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0260
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_16100
     * @tc.desc unscopables的null原型确保不会从Object.prototype继承属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0260()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0261
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_16200
     * @tc.desc 使用普通对象（非null原型）会导致Object.prototype上的方法也被排除
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0261()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0262
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_16300
     * @tc.desc NaN是falsy值，属性应可绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0262()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0263
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_16400
     * @tc.desc null是falsy值，属性应可绑定
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0263()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0264
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_16500
     * @tc.desc 被列入unscopables的方法通过arr.method()方式调用不受任何影响
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0264()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0265
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_16600
     * @tc.desc 通过call/apply调用unscopable方法不受影响
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0265()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0266
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_16700
     * @tc.desc 通过bind调用unscopable方法不受影响
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0266()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0267
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_16800
     * @tc.desc 在with语句内部仍可通过Array.prototype显式调用被排除的方法
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0267()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0268
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_16900
     * @tc.desc length属性不在unscopables列表中，在with中可直接访问
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0268()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0269
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_17000
     * @tc.desc 在with中可以修改数组的length属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0269()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0270
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_17100
     * @tc.desc Symbol.iterator不是unscopables排除的属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0270()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0271
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_17200
     * @tc.desc for...of循环不受unscopables影响
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0271()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0272
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_17300
     * @tc.desc ES2015引入的find, findIndex, fill, keys, values, entries等方法都在unscopables中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0272()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0273
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_17400
     * @tc.desc ES2016引入的includes方法在unscopables中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0273()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0274
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_17500
     * @tc.desc ES2019引入的flat和flatMap方法在unscopables中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0274()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0275
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_17600
     * @tc.desc ES2023引入的不可变方法在unscopables中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0275()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0276
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_17700
     * @tc.desc ES5及之前已有的方法不在unscopables中
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0276()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0277
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_17800
     * @tc.desc 模拟ES5代码中在with里使用keys变量的场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0277()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0278
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_17900
     * @tc.desc 模拟ES5代码中在with里使用values变量的场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0278()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0279
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_18000
     * @tc.desc 模拟ES5代码中在with里使用includes变量的场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0279()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0280
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_18100
     * @tc.desc 当外部变量名与unscopable属性同名时，with中应使用外部变量
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0280()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0281
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_18200
     * @tc.desc 当unscopable属性名在外部不存在时，with中应抛出ReferenceError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0281()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0282
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_18300
     * @tc.desc 函数参数名与unscopable属性同名时，with中应使用参数值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0282()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0283
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_18400
     * @tc.desc 闭包中的变量与unscopable属性同名时，with中应使用闭包变量
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0283()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0284
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_18500
     * @tc.desc 外层和内层with都使用数组时，各自遵循unscopables规则
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0284()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0285
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_18600
     * @tc.desc 外层数组with和内层普通对象with的组合
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0285()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0286
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_18700
     * @tc.desc 内层with的scopable属性覆盖外层的同名属性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0286()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0287
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_TEST_18800
     * @tc.desc 内层with中unscopable属性回退到外层with的scopable属性或外部变量
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0287()).assertEqual(true);
    })
  })
}
