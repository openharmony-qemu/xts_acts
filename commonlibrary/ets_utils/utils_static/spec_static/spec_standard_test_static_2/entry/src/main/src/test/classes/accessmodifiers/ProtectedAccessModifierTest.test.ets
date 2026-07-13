'use static'
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
import Utils from '../../Util.test'

class A {
  protected x: int = 7
  foo(): int {
    return this.x
  }
}

class A1 {
  protected static x: int = 7
  foo(): int {
    return A1.x
  }
}

class A2 {
  protected getValue(): int {
    return 1
  }
  foo(): int {
    return this.getValue()
  }
}

class A3 {
  protected static getValue(): int {
    return 1
  }
  foo(): int {
    return A3.getValue()
  }
}

class A4 {
  protected _val: int = 0
  protected get val(): int {
    return this._val
  }
  foo(i: int): int {
    this._val = i
    return this.val
  }
}

class A5 {
  protected static _val: int = 0
  protected static get val(): int {
    return A5._val
  }
  static set val(i: int) {
    A5._val = i
  }
  foo(): int {
    return A5.val
  }
}

class A6 {
  protected _val: int = 0
  protected set val(i: int) {
    this._val = i
  }
  foo(i: int): int {
    this.val = i
    return this._val
  }
}

class A7 {
  protected static _val: int = 0
  protected static set val(i: int) {
    A7._val = i
  }
  foo(i: int): int {
    A7.val = i
    return A7._val
  }
}

class A8 {
  protected x: int = 7
}
class B extends A8 {
  foo(): int {
    return this.x
  }
}

class A9 {
  protected static x: int = 7
}
class B1 extends A9 {
  foo(): int {
    return A9.x
  }
}

class A10 {
  protected getValue(): int {
    return 1
  }
}
class B2 extends A10 {
  foo(): int {
    return this.getValue()
  }
}

class A11 {
  protected static getValue(): int {
    return 1
  }
}
class B3 extends A11 {
  foo(): int {
    return A11.getValue()
  }
}

class A12 {
  protected _val: int = 0
  protected get val(): int {
    return this._val
  }
}
class B4 extends A12 {
  foo(i: int): int {
    this._val = i
    return this.val
  }
}

class A13 {
  protected static _val: int = 0
  protected static get val(): int {
    return A13._val
  }
  static set val(i: int) {
    A13._val = i
  }
}
class B5 extends A13 {
  foo(): int {
    return A13.val
  }
}

class A14 {
  protected _val: int = 0
  protected set val(i: int) {
    this._val = i
  }
}
class B6 extends A14 {
  foo(i: int): int {
    this.val = i
    return this._val
  }
}

class A15 {
  protected static _val: int = 0
  protected static set val(i: int) {
    A15._val = i
  }
}
class B7 extends A15 {
  foo(i: int): int {
    A15.val = i
    return A15._val
  }
}

export default function ProtectedAccessModifierTest():void {
  describe('ProtectedAccessModifierTest', () => {
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
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_0100
     * @tc.name      testProtectedAccessModifier0001
     * @tc.desc      Check members with protected access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A().foo()).assertEqual(7)
    })

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_0200
     * @tc.name      testProtectedAccessModifier0002
     * @tc.desc      Check members with protected access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A1().foo()).assertEqual(7)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_0300
     * @tc.name      testProtectedAccessModifier0003
     * @tc.desc      Check members with protected access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A2().foo()).assertEqual(1)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_0400
     * @tc.name      testProtectedAccessModifier0004
     * @tc.desc      Check members with protected access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A3().foo()).assertEqual(1)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_0500
     * @tc.name      testProtectedAccessModifier0005
     * @tc.desc      Check members with protected access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A4().foo(7)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_0600
     * @tc.name      testProtectedAccessModifier0006
     * @tc.desc      Check members with protected access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      A5.val = 5
      expect(new A5().foo()).assertEqual(5)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_0700
     * @tc.name      testProtectedAccessModifier0007
     * @tc.desc      Check members with protected access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A6().foo(4)).assertEqual(4)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_0800
     * @tc.name      testProtectedAccessModifier0008
     * @tc.desc      Check members with protected access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A7().foo(6)).assertEqual(6)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_0900
     * @tc.name      testProtectedAccessModifier0009
     * @tc.desc      Check members with protected access modifier in derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new B().foo()).assertEqual(7)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_1000
     * @tc.name      testProtectedAccessModifier0010
     * @tc.desc      Check members with protected access modifier in derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new B1().foo()).assertEqual(7)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_1100
     * @tc.name      testProtectedAccessModifier0011
     * @tc.desc      Check members with protected access modifier in derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new B2().foo()).assertEqual(1)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_1200
     * @tc.name      testProtectedAccessModifier0012
     * @tc.desc      Check members with protected access modifier in derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new B3().foo()).assertEqual(1)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_1300
     * @tc.name      testProtectedAccessModifier0013
     * @tc.desc      Check members with protected access modifier in derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new B4().foo(7)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_1400
     * @tc.name      testProtectedAccessModifier0014
     * @tc.desc      Check members with protected access modifier in derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      A13.val = 5
      expect(new B5().foo()).assertEqual(5)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_1500
     * @tc.name      testProtectedAccessModifier0015
     * @tc.desc      Check members with protected access modifier in derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new B6().foo(4)).assertEqual(4)
    });

    /**
     * @tc.number    SUB_PROTECTED_ACCESS_MODIFIERTEST_1600
     * @tc.name      testProtectedAccessModifier0016
     * @tc.desc      Check members with protected access modifier in derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testProtectedAccessModifier0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new B7().foo(6)).assertEqual(6)
    });
  })
}
