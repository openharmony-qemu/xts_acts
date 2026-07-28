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

class PrivateFieldAccess {
  private secret: number = 42
  private label: string
  constructor(label: string) {
    this.label = label
  }
  public getSecret(): number {
    return this.secret
  }
  public getLabel(): string {
    return this.label
  }
}

class PrivateMethodAccess {
  private multiplier: number = 2
  private compute(input: number): number {
    return input * this.multiplier
  }
  public process(input: number): number {
    return this.compute(input)
  }
}

class PrivateStaticMethod {
  private static factor: number = 3
  private static scale(v: number): number {
    return v * PrivateStaticMethod.factor
  }
  public static apply(v: number): number {
    return PrivateStaticMethod.scale(v)
  }
}

class ProtectedFieldBase {
  protected baseValue: string = 'protected-base'
  public getBaseValue(): string {
    return this.baseValue
  }
}

class ProtectedFieldChild extends ProtectedFieldBase {
  public getParentValue(): string {
    return this.baseValue
  }
}

class MultiLevelBase {
  protected getLevel(): string {
    return 'level-one'
  }
}

class MultiLevelMid extends MultiLevelBase {
  protected getLevel(): string {
    return 'level-two'
  }
}

class MultiLevelLeaf extends MultiLevelMid {
  public fetchLevel(): string {
    return this.getLevel()
  }
}

class PublicOverrideBase {
  public greet(): string {
    return 'base'
  }
}

class PublicOverrideChild extends PublicOverrideBase {
  public greet(): string {
    return 'override'
  }
}

export default function ClassVisibilityTest() {
  describe('ClassVisibilityTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_VISIBILITY_0100
     * @tc.name      testPrivateFieldInClass0001
     * @tc.desc      ArkTS dynamic: Verify private field accessible within class method and constructor (positive only; compile-time constraint not testable in XTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrivateFieldInClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: PrivateFieldAccess = new PrivateFieldAccess('my-label')
      expect(obj.getSecret()).assertEqual(42)
      expect(obj.getLabel()).assertEqual('my-label')
    })

    /**
     * @tc.number    SUB_CLASS_VISIBILITY_0200
     * @tc.name      testPrivateMethodInClass0001
     * @tc.desc      ArkTS dynamic: Verify private method called by public method accesses private field (positive only; compile-time constraint not testable in XTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrivateMethodInClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: PrivateMethodAccess = new PrivateMethodAccess()
      expect(obj.process(5)).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_VISIBILITY_0300
     * @tc.name      testPrivateStaticMethod0001
     * @tc.desc      ArkTS dynamic: Verify private static method called by public static method (positive only; compile-time constraint not testable in XTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrivateStaticMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PrivateStaticMethod.apply(5)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_CLASS_VISIBILITY_0400
     * @tc.name      testProtectedFieldInClass0001
     * @tc.desc      ArkTS dynamic: Verify protected field accessible within own class (positive only; compile-time constraint not testable in XTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProtectedFieldInClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ProtectedFieldBase = new ProtectedFieldBase()
      expect(obj.getBaseValue()).assertEqual('protected-base')
    })

    /**
     * @tc.number    SUB_CLASS_VISIBILITY_0500
     * @tc.name      testProtectedFieldInChild0001
     * @tc.desc      ArkTS dynamic: Verify child class can access parent protected field (positive only; compile-time constraint not testable in XTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProtectedFieldInChild0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ProtectedFieldChild = new ProtectedFieldChild()
      expect(obj.getParentValue()).assertEqual('protected-base')
    })

    /**
     * @tc.number    SUB_CLASS_VISIBILITY_0600
     * @tc.name      testProtectedMethodMultiLevel0001
     * @tc.desc      ArkTS dynamic: Verify protected method accessible in multi-level inheritance (positive only; compile-time constraint not testable in XTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProtectedMethodMultiLevel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: MultiLevelLeaf = new MultiLevelLeaf()
      expect(obj.fetchLevel()).assertEqual('level-two')
    })

    /**
     * @tc.number    SUB_CLASS_VISIBILITY_0800
     * @tc.name      testPublicOverrideRemainsPublic0001
     * @tc.desc      ArkTS dynamic: Verify public override of public method remains callable (positive only; compile-time constraint not testable in XTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPublicOverrideRemainsPublic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: PublicOverrideChild = new PublicOverrideChild()
      expect(obj.greet()).assertEqual('override')
    })
  })
}
