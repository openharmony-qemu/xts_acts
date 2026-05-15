/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace overloading_0 {
  export class A {}
  export class B extends A {}

  export interface K {
    meth(p: B, q: A, w: Object): A;
  }
  export interface I extends K {}
  export interface J extends I {
    // If number of parameters are different - method are overloaded
    meth(p: A, q: Object): B;
  }

  export class X implements J {
    meth(p: B, q: A, w: Object): A {
      return new A();
    }
    meth(p: A, q: Object): B {
      return new B();
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main(): void {
    expect(k.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(i.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(j.meth(new A(), new Object()) instanceof B).assertTrue();
  }
}

namespace overloading_1 {
  export class A {}
  export class B extends A {}

  export interface K {
    meth(p: B, q: A, w: Object): A;
  }
  export interface I extends K {}
  export interface J extends I {
    // Overloading - parameters are not contravariant
    meth(p: A, q: Object, w: A): B;
  }

  export class X implements J {
    meth(p: B, q: A, w: Object): A {
      return new A();
    }
    meth(p: A, q: Object, w: A): B {
      return new B();
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main(): void {
    expect(k.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(i.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(j.meth(new A(), new Object(), new A()) instanceof B).assertTrue();
  }
}

// ============================================================================
// Data Setup for overloading_2
// ============================================================================
namespace overloading_2 {
  export class A {}
  export class B extends A {}

  export interface K {
    meth(p: B, q: A, w: Object): A;
    meth(p: A, q: Object, w: string): B;
  }
  export interface I extends K {}
  export interface J extends I {}

  export class X implements J {
    // Explicitly implementing both to satisfy strict ArkTS mode requirements
    meth(p: B, q: A, w: Object): A {
      return new A();
    }
    meth(p: A, q: Object, w: string): B {
      return new B();
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main() : void{
    expect(k.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(i.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(j.meth(new A(), new Object(), "test") instanceof B).assertTrue();
  }
}

// ============================================================================
// Data Setup for overloading_3
// ============================================================================
namespace overloading_3 {
  export class A {}
  export class B extends A {}

  export interface K {
    meth<T extends B, U extends A, V extends Object>(p: T, q: U, w: V): A;
  }
  export interface I extends K {}
  export interface J extends I {
    // Overloading - different number of type parameters
    meth<T extends A, U extends Object>(p: T, q: U, w: Object, z: Object): B;
  }

  export class X implements J {
    meth<T extends B, U extends A, V extends Object>(p: T, q: U, w: V): A {
      return new A();
    }
    meth<T extends A, U extends Object>(p: T, q: U, w: Object, z: Object): B {
      return new B();
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main(): void {
    expect(k.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(i.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(j.meth(new A(), new Object(), new Object(), new Object()) instanceof B).assertTrue();
  }
}

// ============================================================================
// Data Setup for overloading_4
// ============================================================================
namespace overloading_4 {
  export class A {}
  export class B extends A {}

  export interface K {
    meth(p: B, q: A, w: Object): A;
  }
  export interface I extends K {}
  export interface J<T> extends I {
    // Overloading - parameters are not contravariant
    meth(p: A, q: T, w: A): B;
  }

  export class X implements J<Object> {
    meth(p: A, q: Object, w: A): B {
      return new B();
    }
    meth(p: B, q: A, w: Object): A {
      return new A();
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J<Object> = new X();
  export let x: X = new X();

  export function main(): void {
    expect(k.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(i.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(j.meth(new A(), new Object(), new A()) instanceof B).assertTrue();
    expect(x.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(x.meth(new A(), new Object(), new A()) instanceof B).assertTrue();
  }
}

// ============================================================================
// Data Setup for overloading_5
// ============================================================================
namespace overloading_5 {
  export class A {}
  export class B extends A {}

  export interface K {
    meth(p: B, q: A, w: Object): A;
    // Overload methods with different number of parameters in the same interface
    meth(p: A, q: Object): B;
  }
  export interface I extends K {}
  export interface J extends I {}

  export class X implements J {
    meth(p: A, q: Object): B {
      return new B();
    }
    meth(p: B, q: A, w: Object): A {
      return new A();
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();
  export let x: X = new X();

  export function main(): void {
    expect(k.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(i.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(j.meth(new A(), new Object()) instanceof B).assertTrue();
    expect(x.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(x.meth(new A(), new Object()) instanceof B).assertTrue();
  }
}
export default function InterfacesTest():void {
  describe('InterfacesTest', () => {
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
     * @tc.number    SUB_INTERFACESTEST_ONE_0100
     * @tc.name      testOverloading0001
     * @tc.desc      Overloading allows using the same name to call several methods with different signatures (different number of parameters).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloading0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overloading_0.main();
    });

    /**
     * @tc.number    SUB_INTERFACESTEST_ONE_0200
     * @tc.name      testOverloading0002
     * @tc.desc      Overloading allows using the same name to call several methods with different signatures (parameters are not contravariant).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloading0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overloading_1.main();
    });

    /**
     * @tc.number    SUB_INTERFACESTEST_ONE_0300
     * @tc.name      testOverloading0003
     * @tc.desc      Overloading allows using the same name to call several methods with different signatures (defined in the same interface).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloading0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overloading_2.main();
    });

    /**
     * @tc.number    SUB_INTERFACESTEST_ONE_0400
     * @tc.name      testOverloading0004
     * @tc.desc      Overloading allows using the same name to call several methods with different signatures (different number of type parameters).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloading0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overloading_3.main();
    });

    /**
     * @tc.number    SUB_INTERFACESTEST_ONE_0500
     * @tc.name      testOverloading0005
     * @tc.desc      Overloading allows using the same name to call several methods with different signatures (with generic interface extending).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloading0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overloading_4.main();
    });

    /**
     * @tc.number    SUB_INTERFACESTEST_ONE_0600
     * @tc.name      testOverloading0006
     * @tc.desc      Overloading allows using the same name to call several methods with different signatures (inherited from generic and specific).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloading0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overloading_5.main();
    });

  })
}