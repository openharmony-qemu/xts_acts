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
  getStaticThisValue,
  getStaticThisMultiplied,
  testStaticComputedGet,
  testStaticComputedSet,
  testMultiStaticBlockResult,
  testStaticBlockInheritance,
  testStaticMixedOrder,
  testStaticInheritance
} from './classStaticTsHelper'

// design 010: static field external write
class StaticWriteField {
  public static counter: number = 0
}

// migrated from classDeclaration: static field, method, mutation
class Config {
  public static version: string = "1.0.0"
}

class MathUtil {
  public static square(x: number): number {
    return x * x
  }
}

class Counter {
  public static count: number = 0
  public static increment(): number {
    Counter.count = Counter.count + 1
    return Counter.count
  }
}

// design 023 + 024: child shadows/overrides base static field and method
class StaticShadowBase {
  public static label: string = 'base-label'

  public static getLabel(): string {
    return 'base-getLabel'
  }
}

class StaticShadowChild extends StaticShadowBase {
  public static label: string = 'child-label'

  public static getLabel(): string {
    return 'child-getLabel'
  }
}

export default function ClassStaticTest() {
  describe('ClassStaticTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
      StaticWriteField.counter = 0
      Counter.count = 0
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0100
     * @tc.name      testStaticFieldWrite0001
     * @tc.desc      ECMA-262 §15.2: Verify static field can be written and read externally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticFieldWrite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticWriteField.counter).assertEqual(0)
      StaticWriteField.counter = 5
      expect(StaticWriteField.counter).assertEqual(5)
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0200
     * @tc.name      testStaticThisAccess0001
     * @tc.desc      ArkTS dynamic: Verify this in static method accesses static field and method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticThisAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getStaticThisValue()).assertEqual(10)
      expect(getStaticThisMultiplied(3)).assertEqual(30)
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0300
     * @tc.name      testStaticInheritance0001
     * @tc.desc      ArkTS dynamic: Verify child class accesses inherited static field and method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticInheritance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = testStaticInheritance()
      expect(result).assertEqual('parent-field|parent-method')
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0400
     * @tc.name      testStaticShadow0001
     * @tc.desc      ArkTS dynamic: Verify parent and child independently declare same-name static field and method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticShadow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticShadowBase.label).assertEqual('base-label')
      expect(StaticShadowBase.getLabel()).assertEqual('base-getLabel')
      expect(StaticShadowChild.label).assertEqual('child-label')
      expect(StaticShadowChild.getLabel()).assertEqual('child-getLabel')
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0500
     * @tc.name      testStaticComputedAccessor0001
     * @tc.desc      ArkTS dynamic: Verify static computed getter/setter via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticComputedAccessor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testStaticComputedGet()).assertEqual('init-value')
      expect(testStaticComputedSet()).assertEqual('new-value')
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0600
     * @tc.name      testStaticMultiBlock0001
     * @tc.desc      ArkTS dynamic: Verify multiple static blocks execute in declaration order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticMultiBlock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = testMultiStaticBlockResult()
      expect(result).assertEqual('10|20|25')
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0700
     * @tc.name      testStaticBlockInheritance0001
     * @tc.desc      ArkTS dynamic: Verify child class access triggers parent static block
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticBlockInheritance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = testStaticBlockInheritance()
      expect(result).assertEqual('100|150')
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0800
     * @tc.name      testStaticMixedOrder0001
     * @tc.desc      ArkTS dynamic: Verify static field + static block mixed declaration order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticMixedOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = testStaticMixedOrder()
      expect(result).assertEqual('10|20|25')
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0900
     * @tc.name      testStaticFieldRead0001
     * @tc.desc      ECMA-262 §15.2: Verify static field is accessible on class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticFieldRead0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Config.version).assertEqual("1.0.0")
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_1000
     * @tc.name      testStaticMethodCall0001
     * @tc.desc      ECMA-262 §15.2: Verify static method is callable on class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticMethodCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(MathUtil.square(5)).assertEqual(25)
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_1100
     * @tc.name      testStaticFieldMutation0001
     * @tc.desc      ECMA-262 §15.2: Verify static field mutation persists across accesses
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticFieldMutation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Counter.increment()).assertEqual(1)
      expect(Counter.increment()).assertEqual(2)
      expect(Counter.count).assertEqual(2)
    })
  })
}
