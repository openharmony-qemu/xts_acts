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
import { describe, expect, it, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';

class BaseGreet {
  public speak(): string {
    return 'base'
  }
}

class OverrideGreet extends BaseGreet {
  public speak(): string {
    return 'override'
  }
}

class BaseCompute {
  public compute(): number {
    return 10
  }
}

class OverrideCompute extends BaseCompute {
  public compute(): number {
    return super.compute() * 2
  }
}

class BaseGetter {
  public get value(): string {
    return 'base-getter'
  }
}

class OverrideGetter extends BaseGetter {
  public get value(): string {
    return 'override-getter'
  }
}

class BaseSetter {
  private _val: string = 'base'
  public get val(): string {
    return this._val
  }
  public set val(v: string) {
    this._val = v + '-set'
  }
}

class OverrideSetter extends BaseSetter {
  public get val(): string {
    return super.val
  }
  public set val(v: string) {
    super.val = v + '-overridden'
  }
}

class BaseStatic {
  public static whoami(): string {
    return 'base-static'
  }
}

class OverrideStatic extends BaseStatic {
  public static whoami(): string {
    return 'override-static'
  }
}

class BaseField {
  public name: string = 'base-name'
}

class ShadowField extends BaseField {
  public name: string = 'shadow-name'
}

export default function ClassOverrideTest() {
  describe('ClassOverrideTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_OVERRIDE_0100
     * @tc.name      testOverrideMethod0001
     * @tc.desc      ECMA-262 §15.2: Verify derived class method overrides base class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverrideMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: OverrideGreet = new OverrideGreet()
      expect(obj.speak()).assertEqual('override')
    })

    /**
     * @tc.number    SUB_CLASS_OVERRIDE_0200
     * @tc.name      testOverrideSuperCall0001
     * @tc.desc      ECMA-262 §15.2: Verify override method can call super.method() then add own logic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverrideSuperCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: OverrideCompute = new OverrideCompute()
      expect(obj.compute()).assertEqual(20)
    })

    /**
     * @tc.number    SUB_CLASS_OVERRIDE_0300
     * @tc.name      testBaseRefDerivedOverride0001
     * @tc.desc      ECMA-262 §15.2: Verify base type reference calls derived override method at runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBaseRefDerivedOverride0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: OverrideCompute = new OverrideCompute()
      let base: BaseCompute = obj
      expect(base.compute()).assertEqual(20)
    })

    /**
     * @tc.number    SUB_CLASS_OVERRIDE_0400
     * @tc.name      testOverrideGetter0001
     * @tc.desc      ECMA-262 §15.2: Verify derived class getter overrides base class getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverrideGetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: OverrideGetter = new OverrideGetter()
      expect(obj.value).assertEqual('override-getter')
    })

    /**
     * @tc.number    SUB_CLASS_OVERRIDE_0500
     * @tc.name      testOverrideSetter0001
     * @tc.desc      ECMA-262 §15.2: Verify derived class setter overrides base class setter with super call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverrideSetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: OverrideSetter = new OverrideSetter()
      obj.val = 'input'
      expect(obj.val).assertEqual('input-overridden-set')
    })

    /**
     * @tc.number    SUB_CLASS_OVERRIDE_0600
     * @tc.name      testOverrideStatic0001
     * @tc.desc      ECMA-262 §15.2: Verify derived class static method overrides base class static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverrideStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BaseStatic.whoami()).assertEqual('base-static')
      expect(OverrideStatic.whoami()).assertEqual('override-static')
    })

    /**
     * @tc.number    SUB_CLASS_OVERRIDE_0700
     * @tc.name      testFieldInitOrder0001
     * @tc.desc      ECMA-262 §15.2: Verify child field init runs after base field init (final value is child's, regardless of reference type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldInitOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let base: BaseField = new ShadowField()
      let shadow: ShadowField = new ShadowField()
      expect(base.name).assertEqual('shadow-name')
      expect(shadow.name).assertEqual('shadow-name')
    })
  })
}
