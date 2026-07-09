'use static';
/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../../Util.test'


abstract class A {
  abstract run(): number;
}

class B extends A {
  override run(): number {
    let result = 5 + 5;
    return result;
  };
}


class A1 {
  public m(): int {
    return 1;
  }
}

final class C extends A1 {
  override m(): int {
    return 5;
  }

  superm(): int {
    return super.m();
  }
}

class A2 {
  public m(): int {
    return 1;
  }
}

final class C1 extends A2 {
  override m(): int {
    return 5;
  }
}

class A3 {
  public m(): int {
    return 1;
  }
}

final class C2 extends A3 {
  override m(): int {
    return 5;
  }
}

class A4 {
  protected m(): int {
    return 1;
  }
}

final class C3 extends A4 {
  override m(): int {
    return 5;
  }
}

interface I {
  m(): int;
}

class C4 implements I {
  override m(): int {
    return 5;
  }
}

export default function OverridingByInstanceMethodsTest():void {
  describe('OverridingByInstanceMethodsTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODS_TEST_0100
     * @tc.name      testOverridingByInstanceMethods0001
     * @tc.desc      Overriding abstract method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A = new B();
      expect(b.run()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODS_TEST_0200
     * @tc.name      testOverridingByInstanceMethods0002
     * @tc.desc      Access to overridden method of superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C = new C();
      expect( instance.m() == 5 ).assertTrue();
      expect( instance.superm() == 1 ).assertTrue();
    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODS_TEST_0300
     * @tc.name      testOverridingByInstanceMethods0003
     * @tc.desc      Cast to superclass for access to overridden method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A2 = new C1() as A2;
      expect( instance.m() == 5 ).assertTrue();
    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODS_TEST_0400
     * @tc.name      testOverridingByInstanceMethods0004
     * @tc.desc      Overriding method of superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C2 = new C2();
      expect( instance.m() == 5 ).assertTrue();
    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODS_TEST_0500
     * @tc.name      testOverridingByInstanceMethods0005
     * @tc.desc      Overriding method of superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C3 = new C3();
      expect( instance.m() == 5 ).assertTrue();
    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODS_TEST_0600
     * @tc.name      testOverridingByInstanceMethods0006
     * @tc.desc      Overriding method of superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C4 = new C4();
      expect( instance.m() == 5 ).assertTrue();
    });
  })
}