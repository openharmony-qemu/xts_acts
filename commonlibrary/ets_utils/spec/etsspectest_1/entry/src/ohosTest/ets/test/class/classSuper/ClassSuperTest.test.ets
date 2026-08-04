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
import { testGenericSuperCtor, testSuperSpreadArgs, testSuperComputed, testSuperStaticMethod, testSuperComputedSymbol, testSuperComputedGetter, testSuperComputedSideEffect } from './classSuperTsHelper'

class SuperProtectedBase {
  protected getBaseValue(): string {
    return 'protected-base'
  }
}

class SuperProtectedChild extends SuperProtectedBase {
  public fetchBase(): string {
    return super.getBaseValue()
  }
}

interface Named {
  getName(): string
}

class NamedBase {
  public getName(): string {
    return 'base-implementation'
  }
}

class NamedChild extends NamedBase implements Named {
}

export default function ClassSuperTest() {
  describe('ClassSuperTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0100
     * @tc.name      testSuperProtectedMethod0001
     * @tc.desc      ArkTS dynamic: Verify subclass calls base class protected method via super
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperProtectedMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: SuperProtectedChild = new SuperProtectedChild()
      expect(obj.fetchBase()).assertEqual('protected-base')
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0200
     * @tc.name      testSuperInterfaceViaInheritance0001
     * @tc.desc      ArkTS dynamic: Verify subclass implements interface by inheriting base method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperInterfaceViaInheritance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: NamedChild = new NamedChild()
      let n: Named = obj
      expect(n.getName()).assertEqual('base-implementation')
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0300
     * @tc.name      testSuperGenericCtor0001
     * @tc.desc      ArkTS dynamic: Verify generic base constructor called via super()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperGenericCtor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let v: number = testGenericSuperCtor()
      expect(v).assertEqual(42)
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0400
     * @tc.name      testSuperStaticMethod0001
     * @tc.desc      ArkTS dynamic: Verify derived class static method calls base class static method via super
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperStaticMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testSuperStaticMethod()).assertEqual('static-base-child')
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0500
     * @tc.name      testSuperComputedMethod0001
     * @tc.desc      ArkTS dynamic: Verify super[name]() computed property access with method name string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperComputedMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testSuperComputed('greet')).assertEqual('hello')
      expect(testSuperComputed('farewell')).assertEqual('goodbye')
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0600
     * @tc.name      testSuperComputedSymbol0001
     * @tc.desc      ArkTS dynamic: Verify super[sym]() computed property access with Symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperComputedSymbol0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testSuperComputedSymbol()).assertEqual('symbol-result')
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0700
     * @tc.name      testSuperComputedGetter0001
     * @tc.desc      ArkTS dynamic: Verify super[name] computed property access with getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperComputedGetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testSuperComputedGetter()).assertEqual('getter-value')
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0800
     * @tc.name      testSuperComputedSideEffect0001
     * @tc.desc      ArkTS dynamic: Verify super[expr]() evaluates key expression before method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperComputedSideEffect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = testSuperComputedSideEffect()
      let parts: string[] = result.split("|")
      expect(parts[0]).assertEqual('hello')
      expect(parts[1]).assertEqual('1')
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0900
     * @tc.name      testSuperSpreadArgs0001
     * @tc.desc      ArkTS dynamic: Verify super(...args) spread passing to base constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperSpreadArgs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = testSuperSpreadArgs()
      expect(result).assertEqual('10|x')
    })
  })
}
