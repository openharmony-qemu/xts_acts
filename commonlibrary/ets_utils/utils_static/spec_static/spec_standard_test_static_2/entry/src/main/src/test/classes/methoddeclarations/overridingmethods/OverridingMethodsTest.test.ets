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


class A {
  foo(): int {
    return 1;
  }
}

final class B extends A {
  override foo(): int {
    return 5;
  }
}

function getB(): B {
  return new B
}

class A1 {
  foo(): int {
    return 1;
  }
}

final class B1 extends A1 {
  override final foo(): int {
    return 5;
  }
}

class A2 {
  /* @ label */foo(a: int = 2): int {
  return a;
}
}

final class B2 extends A2 {
  override foo(a: int = 2): int {
    return a;
  }
}

class A3 {
  /* @ label */foo(a: int = 2): int {
  return a;
}
}

final class B3 extends A3 {
  override foo(a: int = 2): int {
    return a;
  }
}

class A4 {
  /* @ label */foo(a?: int): int | undefined {
  return a;
}
}

final class B4 extends A4 {
  override foo(a?: int): int | undefined {
    return a;
  }
}

class A5 {
  /* @ label */foo(a?: int): int | undefined {
  return a;
}
}

final class B5 extends A5 {
  override foo(a: int | undefined = undefined): int | undefined {
    return a;
  }
}

class A6 {
  /* @ label */foo(a: int | undefined = undefined): int | undefined {
  return a;
}
}

final class B6 extends A6 {
  override foo(a?: int): int | undefined {
    return a;
  }
}



export default function OverridingMethodsTest():void {
  describe('OverridingMethodsTest', () => {
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
     * @tc.number    SUB_OVERRIDING_METHODS_TEST_0100
     * @tc.name      testOverridingMethods0001
     * @tc.desc      Override method declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingMethods0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A = getB();
      expect(instance.foo()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_OVERRIDING_METHODS_TEST_0200
     * @tc.name      testOverridingMethods0002
     * @tc.desc      Override method declaration with keyword final
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingMethods0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A1 = (() => new B1)()
      expect(a.foo()).assertEqual(5)
    });

    /**
     * @tc.number    SUB_OVERRIDING_METHODS_TEST_0300
     * @tc.name      testOverridingMethods0003
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingMethods0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A2 = new B2()
      expect(b.foo()).assertEqual(2)
    });

    /**
     * @tc.number    SUB_OVERRIDING_METHODS_TEST_0400
     * @tc.name      testOverridingMethods0004
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingMethods0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A3 = new B3()
      expect(b.foo(5)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_OVERRIDING_METHODS_TEST_0500
     * @tc.name      testOverridingMethods0005
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingMethods0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A4 = new B4()
      expect(b.foo()).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OVERRIDING_METHODS_TEST_0600
     * @tc.name      testOverridingMethods0006
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingMethods0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A4 = new B4()
      expect(b.foo(5)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_OVERRIDING_METHODS_TEST_0700
     * @tc.name      testOverridingMethods0007
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingMethods0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A5 = new B5()
      expect(b.foo()).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OVERRIDING_METHODS_TEST_0800
     * @tc.name      testOverridingMethods0008
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingMethods0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A6 = new B6()
      expect(b.foo()).assertEqual(undefined)
    });

  })
}
