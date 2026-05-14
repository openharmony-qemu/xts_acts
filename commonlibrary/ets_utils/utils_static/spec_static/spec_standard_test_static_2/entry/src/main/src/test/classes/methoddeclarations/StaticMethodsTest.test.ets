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
  public foo(): int {
    return 5;
  }
}

class B extends A {
  public x: int;

  public static run(): int {
    return 5;
  }

  public bar(): int {
    this.x = 5;
    return super.foo() + this.x;
  }
}

class A1 {
  public static run(): int {
    return 5;
  }
}

abstract class X {
  static foo(): int {
    return 1
  };
}

abstract class X1 {
  static foo(): int {
    return 1
  };

  abstract bar(): int;
}

class Y extends X1 {
  bar(): int {
    return 2
  };
}

class C {
  protected count: number

  constructor(count: number) {
    this.count = count
  }

  static getCount(c: C): number {
    return c.count
  }
}

class B1 {
  protected count: number

  constructor(count: number) {
    this.count = count
  }
}

class C1 extends B1 {
  constructor(count: number) {
    super(count)
  }

  static getCount(c: C1): number {
    return c.count
  }
}

class B2 {
  protected count: number

  constructor(count: number) {
    this.count = count
  }

  static getCount(c: C2): number {
    return c.count
  }
}

class C2 extends B2 {
  constructor(count: number) {
    super(count)
  }
}

class C3 {
  protected count: number

  constructor(count: number) {
    this.count = count
  }

  static getCount(i: number): number {
    let c: C3 = new C3(i + 1)
    return c.count
  }
}

class B3 {
  protected count: number

  constructor(count: number) {
    this.count = count
  }

  static getCount(i: number): number {
    let c: C4 = new C4(i + 1)
    return c.count
  }
}

class C4 extends B3 {
  constructor(count: number) {
    super(count)
  }
}

class C5 {
  private count: number

  constructor(count: number) {
    this.count = count
  }

  static getCount(c: C5): number {
    return c.count
  }
}

class B4 {
  private count: number

  constructor(count: number) {
    this.count = count
  }

  static getCount(c: C6): number {
    return c.count
  }
}

class C6 extends B4 {
  constructor(count: number) {
    super(count)
  }
}

class C7 {
  private count: number

  constructor(count: number) {
    this.count = count
  }

  static getCount(i: number): number {
    let c: C7 = new C7(i + 1)
    return c.count
  }
}

class B5 {
  private count: number

  constructor(count: number) {
    this.count = count
  }

  static getCount(i: number): number {
    let c: C8 = new C8(i + 1)
    return c.count
  }
}

class C8 extends B5 {
  constructor(count: number) {
    super(count)
  }
}

class C9 {
  protected count(): number {
    return 1
  }

  static getCount(c: C9): number {
    return c.count()
  }
}

class B6 {
  protected count(): number {
    return 1
  }
}

class C10 extends B6 {
  static getCount(c: C10): number {
    return c.count()
  }
}

class B7 {
  protected count(): number {
    return 1
  }

  static getCount(c: C11): number {
    return c.count()
  }
}

class C11 extends B7 {
}

class C12 {
  protected count(): number {
    return 1
  }

  static getCount(i: number): number {
    let c: C12 = new C12()
    return c.count() + i
  }
}

// class B8 {
//   protected count(): number {
//     return 1
//   }
//   static getCount(i: number): number {
//     let c: C13 = new C13()
//     return c.count() + i
//   }
// }
// class C13 extends B8 { }

class C14 {
  private count(): number {
    return 1
  }

  static getCount(c: C14): number {
    return c.count()
  }
}

// class B9 {
//   private count(): number {
//     return 1
//   }
//   static getCount(c: C15): number {
//     return c.count()
//   }
// }
// class C15 extends B9 { }

class C16 {
  private count(): number {
    return 1
  }

  static getCount(i: number): number {
    let c: C16 = new C16()
    return c.count() + i
  }
}

// class B10 {
//   private count(): number {
//     return 1
//   }
//   static getCount(i: number): number {
//     let c: C17 = new C17()
//     return c.count() + i
//   }
// }
// class C17 extends B10 { }

export default function StaticMethodsTest(): void {
  describe('StaticMethodsTest', () => {
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
     * @tc.number    SUB_STATIC_METHODS_TEST_0100
     * @tc.name      testStaticMethods0001
     * @tc.desc      Non-static method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B = new B();
      expect(instance.bar() == 10).assertTrue();
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_0200
     * @tc.name      testStaticMethods0002
     * @tc.desc      Static method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A1.run()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_0300
     * @tc.name      testStaticMethods0003
     * @tc.desc      Call static method of the abstract class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(X.foo()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_0400
     * @tc.name      testStaticMethods0004
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived one
     * represented as parameters or local variables Access protected field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C = new C(2)
      expect(C.getCount(c)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_0500
     * @tc.name      testStaticMethods0005
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived
     * one represented as parameters or local variables Access inherited protected field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C1 = new C1(2)
      expect(C1.getCount(c)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_0600
     * @tc.name      testStaticMethods0006
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived one
     * represented as parameters or local variables Access derived protected field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B2 = new B2(1)
      let c: C2 = new C2(2)
      expect(B2.getCount(c)).assertEqual(2)


    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_0700
     * @tc.name      testStaticMethods0007
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived one
     * represented as parameters or local variables Access protected field from local variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C3.getCount(2)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_0800
     * @tc.name      testStaticMethods0008
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived one
     * represented as parameters or local variables Access private field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C5 = new C5(2)
      expect(C5.getCount(c)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_0900
     * @tc.name      testStaticMethods0009
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived one
     * represented as parameters or local variables Access private field by derived class instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B4 = new B4(1)
      let c: C6 = new C6(2)
      expect(B4.getCount(c)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_1000
     * @tc.name      testStaticMethods0010
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived
     * one represented as parameters or local variables Access private field from local variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C7.getCount(2)).assertEqual(3)


    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_1100
     * @tc.name      testStaticMethods0011
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived one
     * represented as parameters or local variables Access protected method from local variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C9 = new C9()
      expect(C9.getCount(c)).assertEqual(1)
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_1200
     * @tc.name      testStaticMethods0012
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived one
     * represented as parameters or local variables Access inherited protected method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C10 = new C10()
      expect(C10.getCount(c)).assertEqual(1)
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_1300
     * @tc.name      testStaticMethods0013
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived one
     * represented as parameters or local variables Access derived protected method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C11 = new C11()
      expect(B7.getCount(c)).assertEqual(1)
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_1400
     * @tc.name      testStaticMethods0014
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived one
     * represented as parameters or local variables Access protected method from local variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C12.getCount(2)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_1500
     * @tc.name      testStaticMethods0015
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived
     * one represented as parameters or local variables Access private method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C14 = new C14()
      expect(C14.getCount(c)).assertEqual(1)
    });

    /**
     * @tc.number    SUB_STATIC_METHODS_TEST_1600
     * @tc.name      testStaticMethods0016
     * @tc.desc      Class static methods may access protected or private members of the same class type or derived one
     * represented as parameters or local variables Access private method from local variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticMethods0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C16.getCount(2)).assertEqual(3)
    });
  })
}
