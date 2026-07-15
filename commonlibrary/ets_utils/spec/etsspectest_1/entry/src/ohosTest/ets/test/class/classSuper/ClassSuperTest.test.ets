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
import utils from '../../Utils';
import { testGenericSuperCtor, testSuperSpreadArgs } from './classSuperTsHelper'

// design 017: subclass calls super.protectedMethod()
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

// design 019: class implements interface via inherited base method
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

// design 023: static method calls super.staticMethod()
class StaticSuperBase {
  public static getBaseLabel(): string {
    return 'static-base'
  }
}

class StaticSuperChild extends StaticSuperBase {
  public static getChildLabel(): string {
    return super.getBaseLabel() + '-child'
  }
}

class SuperComputedBase {
  public greet(): string {
    return 'hello'
  }

  public farewell(): string {
    return 'goodbye'
  }
}

class SuperComputedChild extends SuperComputedBase {
  public callMethod(name: string): string {
    if (name === 'greet') {
      return super.greet()
    }
    return super.farewell()
  }
}

export default function ClassSuperTest() {
  describe('ClassSuperTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0100
     * @tc.name      testSuperProtectedMethod0001
     * @tc.desc      Verify subclass calls base class protected method via super
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
     * @tc.desc      Verify subclass implements interface by inheriting base method
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
     * @tc.desc      Verify generic base constructor called via super()
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
     * @tc.desc      Verify derived class static method calls base class static method via super
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperStaticMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticSuperChild.getChildLabel()).assertEqual('static-base-child')
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0500
     * @tc.name      testSuperComputedMethod0001
     * @tc.desc      Verify super.method() with dynamic method name selection
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperComputedMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: SuperComputedChild = new SuperComputedChild()
      expect(obj.callMethod('greet')).assertEqual('hello')
      expect(obj.callMethod('farewell')).assertEqual('goodbye')
    })

    /**
     * @tc.number    SUB_CLASS_SUPER_0600
     * @tc.name      testSuperSpreadArgs0001
     * @tc.desc      Verify super(...args) spread passing to base constructor
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
