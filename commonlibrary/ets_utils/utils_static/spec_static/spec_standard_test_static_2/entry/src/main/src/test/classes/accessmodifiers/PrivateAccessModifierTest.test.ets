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
} from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  x: int;
  y: int;

  private constructor(x: int, y: int) {
    this.x = x;
    this.y = y;
  }

  public constructor(x: int) {
    this(x, 1);
  }
}

abstract class A1 {
  private x: int = 7
  foo(): int {
    return this.x
  }
}
class C extends A1 { }

abstract class A2 {
  private static x: int = 7
  foo(): int {
    return A2.x
  }
}
class C1 extends A2 { }

abstract class A3 {
  private getValue(): int {
    return 1
  }
  foo(): int {
    return this.getValue()
  }
}
class C2 extends A3 { }

abstract class A4 {
  private static getValue(): int {
    return 1
  }
  foo(): int {
    return A4.getValue()
  }
}
class C3 extends A4 { }

abstract class A5 {
  private _val: int = 0
  private get val(): int {
    return this._val
  }
  foo(i: int): int {
    this._val = i
    return this.val
  }
}
class C4 extends A5 { }

abstract class A6 {
  private static _val: int = 0
  private static get val(): int {
    return A6._val
  }
  static set val(i: int) {
    A6._val = i
  }
  foo(): int {
    return A6.val
  }
}
class C5 extends A6 { }

abstract class A7 {
  private _val: int = 0
  private set val(i: int) {
    this._val = i
  }
  foo(i: int): int {
    this.val = i
    return this._val
  }
}
class C6 extends A7 { }

abstract class A8 {
  private static _val: int = 0
  private static set val(i: int) {
    A8._val = i
  }
  foo(i: int): int {
    A8.val = i
    return A8._val
  }
}
class C7 extends A8 { }

class A9 {
  private x: int = 7
  foo(): int {
    return this.x
  }
}

class A10 {
  private static x: int = 7
  foo(): int {
    return A10.x
  }
}

class A11 {
  private getValue(): int {
    return 1
  }
  foo(): int {
    return this.getValue()
  }
}

class A12 {
  private static getValue(): int {
    return 1
  }
  foo(): int {
    return A12.getValue()
  }
}

class A13 {
  private _val: int = 0
  private get val(): int {
    return this._val
  }
  foo(i: int): int {
    this._val = i
    return this.val
  }
}

class A14 {
  private static _val: int = 0
  private static get val(): int {
    return A14._val
  }
  static set val(i: int) {
    A14._val = i
  }
  foo(): int {
    return A14.val
  }
}

class A15 {
  private _val: int = 0
  private set val(i: int) {
    this._val = i
  }
  foo(i: int): int {
    this.val = i
    return this._val
  }
}

class A16 {
  private static _val: int = 0
  private static set val(i: int) {
    A16._val = i
  }
  foo(i: int): int {
    A16.val = i
    return A16._val
  }
}

class C8 {
  private count: number = 1
  private hello() {}
  getCount(): number {
    return this.count
  }
  sayHello() {
    this.hello()
  }
}

class D2 extends C8 {
  count: number = 100  // OK to reuse name since 'count' in base is inaccessible
  hello() {}           // OK to reuse name since 'hello' in base is inaccessible
  foo() {
    this.count++       // OK - accesses D2's own count field
    this.hello()       // OK - accesses D2's own hello method
  }
}


export default function PrivateAccessModifierTest():void {
  describe('PrivateAccessModifierTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_0100
     * @tc.name      testPrivateAccessModifier0001
     * @tc.desc      Check constructor with private access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A = new A(2);
      expect(instance.x).assertEqual(2);
      expect(instance.y).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_0200
     * @tc.name      testPrivateAccessModifier0002
     * @tc.desc      Check members with private access modifier in abstract class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C().foo()).assertEqual(7)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_0300
     * @tc.name      testPrivateAccessModifier0003
     * @tc.desc      Check members with private access modifier in abstract class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C1().foo()).assertEqual(7)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_0400
     * @tc.name      testPrivateAccessModifier0004
     * @tc.desc      Check members with private access modifier in abstract class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C2().foo()).assertEqual(1)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_0500
     * @tc.name      testPrivateAccessModifier0005
     * @tc.desc      Check members with private access modifier in abstract class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C3().foo()).assertEqual(1)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_0600
     * @tc.name      testPrivateAccessModifier0006
     * @tc.desc      Check members with private access modifier in abstract class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C4().foo(7)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_0700
     * @tc.name      testPrivateAccessModifier0007
     * @tc.desc      Check members with private access modifier in abstract class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      A6.val = 5
      expect(new C5().foo()).assertEqual(5)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_0800
     * @tc.name      testPrivateAccessModifier0008
     * @tc.desc      Check members with private access modifier in abstract class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C6().foo(4)).assertEqual(4)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_0900
     * @tc.name      testPrivateAccessModifier0009
     * @tc.desc      Check members with private access modifier in abstract class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C7().foo(6)).assertEqual(6)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_1000
     * @tc.name      testPrivateAccessModifier0010
     * @tc.desc      Check members with private access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A9().foo()).assertEqual(7)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_1100
     * @tc.name      testPrivateAccessModifier0011
     * @tc.desc      Check members with private access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A10().foo()).assertEqual(7)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_1200
     * @tc.name      testPrivateAccessModifier0012
     * @tc.desc      Check members with private access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A11().foo()).assertEqual(1)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_1300
     * @tc.name      testPrivateAccessModifier0013
     * @tc.desc      Check members with private access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A12().foo()).assertEqual(1)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_1400
     * @tc.name      testPrivateAccessModifier0014
     * @tc.desc      Check members with private access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A13().foo(7)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_1500
     * @tc.name      testPrivateAccessModifier0015
     * @tc.desc      Check members with private access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      A14.val = 5
      expect(new A14().foo()).assertEqual(5)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_1600
     * @tc.name      testPrivateAccessModifier0016
     * @tc.desc      Check members with private access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A15().foo(4)).assertEqual(4)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_1700
     * @tc.name      testPrivateAccessModifier0017
     * @tc.desc      Check members with private access modifier in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A16().foo(6)).assertEqual(6)
    });

    /**
     * @tc.number    SUB_PRIVATE_ACCESS_MODIFIERTEST_1800
     * @tc.name      testPrivateAccessModifier0018
     * @tc.desc      A derived class can declare a field or method with the same name as a private member in the base
     * class, since the private member is inaccessible
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrivateAccessModifier0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: D2 = new D2();
      expect(d.count).assertEqual(100);
      d.foo();
      expect(d.count).assertEqual(101);
    });
  })
}
