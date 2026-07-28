/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';
import {
  nullPlusOne,
  onePlusNull,
  stringPlusNull,
  nullPlusString,
  getNullUserData,
  combineWithNull,
  lengthOf,
  nullMinusOne,
  nullTimesTwo,
  nullLessThanOne,
  nullGreaterEqualZero
} from './CrossFeatureHelper.js'

// Module: CrossFeature
// 跨特性组合：null + 运算符、可选链+解构、null 参数+函数调用、class field null+继承。
// 标注: [ArkTS-COMPILE-LIMIT] 表示因 ArkTS 编译器规则限制无法在 .ets 中直接编写，
// 将原语句原样移至 CrossFeatureHelper.js 中。运行时行为与 ECMA-262 一致。

interface IUserData {
  user: IName
}

interface IName {
  name: string
}

class Base {
  baseField: string | null = null
}

class Derived extends Base {
  derivedField: string | null

  constructor() {
    super()
    this.derivedField = 'set'
  }
}

export default function CrossFeatureTest() {
  describe('CrossFeatureTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    // [ArkTS-COMPILE-LIMIT] null + 1 / 1 + null 不可直接在 .ets 中编写
    // 移至 helper: nullPlusOne(), onePlusNull()
    // ECMA-262 §13.8.1: ToNumber(null) = 0, null + 1 = 0 + 1 = 1
    /**
     * @tc.number    SUB_NULL_SAFETY_CROSS_0100
     * @tc.name      testNullPlusNumeric0001
     * @tc.desc      Verify ToNumber(null)=0 leading to null+1=1 (ECMA-262 §13.8.1) [ArkTS-COMPILE-LIMIT: null in + expr]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullPlusNumeric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(nullPlusOne()).assertEqual(1)
      expect(onePlusNull()).assertEqual(1)
    })

    // [ArkTS-COMPILE-LIMIT] "x" + null / null + "x" 不可直接在 .ets 中编写
    // 移至 helper: stringPlusNull(), nullPlusString()
    // ECMA-262 §13.8.1: ToString(null) = "null", "x" + null = "xnull"
    /**
     * @tc.number    SUB_NULL_SAFETY_CROSS_0200
     * @tc.name      testNullPlusStringConcat0002
     * @tc.desc      Verify ToString(null)="null" leading to "x"+null="xnull" (ECMA-262 §13.8.1) [ArkTS-COMPILE-LIMIT: null in + expr]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullPlusStringConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(stringPlusNull()).assertEqual('xnull')
      expect(nullPlusString()).assertEqual('nullx')
    })

    // [ArkTS-COMPILE-LIMIT] 直接赋值 null 后类型收窄为 never，?. 无法访问属性
    // 移至 helper: getNullUserData()
    // ECMA-262 OptionalChain §13.3.9: null?.prop 短路返回 undefined
    /**
     * @tc.number    SUB_NULL_SAFETY_CROSS_0300
     * @tc.name      testOptionalChainingWithPropertyAccess0003
     * @tc.desc      Verify optional chain returns undefined on null [ArkTS-COMPILE-LIMIT: null assignment narrows to never]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalChainingWithPropertyAccess0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let empty: IUserData | null = getNullUserData() as IUserData | null
      expect(empty?.user?.name).assertEqual(undefined)
    })

    // [ArkTS-COMPILE-LIMIT] null as string + 嵌套函数
    // 移至 helper: combineWithNull()
    // ECMA-262 FunctionDeclarationInstantiation §10.2.11: null 不触发默认值
    /**
     * @tc.number    SUB_NULL_SAFETY_CROSS_0400
     * @tc.name      testNullInDefaultParameter0004
     * @tc.desc      Verify null parameter does not trigger default, becomes "null" [ArkTS-COMPILE-LIMIT: null as string assertion]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullInDefaultParameter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(combineWithNull('hello')).assertEqual('hellonull')
    })

    // [ArkTS-COMPILE-LIMIT] 嵌套函数 (arkts-no-nested-funcs)
    // 移至 helper: lengthOf()
    // ECMA-262: 函数内允许嵌套定义函数
    /**
     * @tc.number    SUB_NULL_SAFETY_CROSS_0500
     * @tc.name      testNullParameterExplicitCheck0005
     * @tc.desc      Verify function explicitly checks for null [ArkTS-COMPILE-LIMIT: nested function]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullParameterExplicitCheck0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(lengthOf(null)).assertEqual(-1)
      expect(lengthOf('hello')).assertEqual(5)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_CROSS_0600
     * @tc.name      testClassFieldNullWithInheritance0006
     * @tc.desc      Verify inherited class field initialized to null can be read and updated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClassFieldNullWithInheritance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let d: Derived = new Derived()
      expect(d.baseField).assertEqual(null)
      expect(d.derivedField).assertEqual('set')
      d.baseField = 'modified'
      expect(d.baseField).assertEqual('modified')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_CROSS_0700
     * @tc.name      testNullArithmeticOperators0007
     * @tc.desc      Verify null arithmetic/subtraction/multiplication/comparison (ECMA-262 §13.7, §13.8.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullArithmeticOperators0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(nullMinusOne()).assertEqual(-1)
      expect(nullTimesTwo()).assertEqual(0)
      expect(nullLessThanOne()).assertTrue()
      expect(nullGreaterEqualZero()).assertTrue()
    })
  })
}
