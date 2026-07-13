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
  x: int;
  y: int;

  public constructor(x: int, y: int) {
    this.x = x;
    this.y = y;
  }

  public constructor(x: int) {
    this(x, 1);
  }
}

class A1 {
  public x: int = 1
  foo(): int {
    return this.x
  }
}

class A2 {
  public static x: int = 1
  foo(): int {
    return A2.x
  }
}

class A3 {
  public getValue(): int {
    return 1
  }
  foo(): int {
    return this.getValue()
  }
}

class A4 {
  public static getValue(): int {
    return 1
  }
  foo(): int {
    return A4.getValue()
  }
}

class A5 {
  public _val: int = 1
  public get val(): int {
    return this._val
  }
  foo(): int {
    return this.val
  }
}

class A6 {
  public static _val: int = 1
  public static get val(): int {
    return A6._val
  }
  foo(): int {
    return A6.val
  }
}

class A7 {
  public _val: int = 0
  public set val(i: int) {
    this._val = i
  }
  foo(): int {
    this.val = 1
    return this._val
  }
}

class A8 {
  public static _val: int = 0
  public static set val(i: int) {
    A8._val = i
  }
  foo(): int {
    A8.val = 1
    return A8._val
  }
}

class A9 {
  public x: int = 1
}

class A10 {
  public static x: int = 1
}

class A11 {
  public getValue(): int {
    return 1
  }
}

class A12 {
  public static getValue(): int {
    return 1
  }
}

class A13 {
  public _val: int = 1
  public get val(): int {
    return this._val
  }
}

class A14 {
  public static _val: int = 1
  public static get val(): int {
    return A14._val
  }
}

class A15 {
  public _val: int = 0
  public set val(i: int) {
    this._val = i
  }
  foo(): int {
    this.val = 1
    return this._val
  }
}

class A16 {
  public static _val: int = 0
  public static set val(i: int) {
    A16._val = i
  }
  foo(): int {
    A16.val = 1
    return A16._val
  }
}

export default function PublicAccessModifierTest():void {
  describe('PublicAccessModifierTest', () => {
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
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_0100
     * @tc.name      testPublicAccessModifier0001
     * @tc.desc      Check constructor with public access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A = new A(2);
      expect(instance.x).assertEqual(2);
      expect(instance.y).assertEqual(1);
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_0200
     * @tc.name      testPublicAccessModifier0002
     * @tc.desc      Check member with public access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A1().foo()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_0300
     * @tc.name      testPublicAccessModifier0003
     * @tc.desc      Check member with public access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A2().foo()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_0400
     * @tc.name      testPublicAccessModifier0004
     * @tc.desc      Check member with public access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A3().foo()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_0500
     * @tc.name      testPublicAccessModifier0005
     * @tc.desc      Check member with public access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A4().foo()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_0600
     * @tc.name      testPublicAccessModifier0006
     * @tc.desc      Check member with public access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A5().foo()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_0700
     * @tc.name      testPublicAccessModifier0007
     * @tc.desc      Check member with public access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A6().foo()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_0800
     * @tc.name      testPublicAccessModifier0008
     * @tc.desc      Check member with public access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A7().foo()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_0900
     * @tc.name      testPublicAccessModifier0009
     * @tc.desc      Check member with public access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A8().foo()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_1000
     * @tc.name      testPublicAccessModifier0010
     * @tc.desc      Check member with public access modifier out class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A9().x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_1100
     * @tc.name      testPublicAccessModifier0011
     * @tc.desc      Check member with public access modifier out class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A10.x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_1200
     * @tc.name      testPublicAccessModifier0012
     * @tc.desc      Check member with public access modifier out class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A11().getValue()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_1300
     * @tc.name      testPublicAccessModifier0013
     * @tc.desc      Check member with public access modifier out class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A12.getValue()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_1400
     * @tc.name      testPublicAccessModifier0014
     * @tc.desc      Check member with public access modifier out class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A13().val).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_1500
     * @tc.name      testPublicAccessModifier0015
     * @tc.desc      Check member with public access modifier out class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A14.val).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_1600
     * @tc.name      testPublicAccessModifier0016
     * @tc.desc      Check member with public access modifier out class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A15 = new A15()
      a.val = 1
      expect(a._val).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PUBLIC_ACCESS_MODIFIERTEST_1700
     * @tc.name      testPublicAccessModifier0017
     * @tc.desc      Check member with public access modifier out class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPublicAccessModifier0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      A16.val = 1
      expect(A16._val).assertEqual(1)
    })

  })
}