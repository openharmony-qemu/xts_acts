'use static'
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
import Utils from '../../../Util.test'

// ============================================================================
// Data Setup for overriding_0
// ============================================================================
namespace overriding_0 {
  export class A {}
  export class B extends A {}
  export class C extends B {}

  export interface K {
    meth(p: B, q: A, w: Object): A
  }
  export interface I extends K {}
  export interface J extends I {
    meth(p: A, q: Object, w: Object): B
  }

  export class X implements J {
    meth(p: A, q: Object, w: Object): B {
      return new B();
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main(): void {
    expect(k.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(i.meth(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(j.meth(new A(), new Object(), new Object()) instanceof B).assertTrue();
  }
}

// ============================================================================
// Data Setup for overriding_1
// ============================================================================
namespace overriding_1 {
  export class A {}
  export class B extends A {}
  export class C extends B {}

  export interface K {
    meth(p: B, q: A, w: Object): this
  }
  export interface I extends K {}
  export interface J extends I {
    meth(p: A, q: Object, w: Object): this
  }

  export class X implements J {
    meth(p: A, q: Object, w: Object): this {
      return this;
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main(): void {
    expect(k.meth(new B(), new A(), new Object()) instanceof K).assertTrue();
    expect(i.meth(new B(), new A(), new Object()) instanceof I).assertTrue();
    expect(j.meth(new A(), new Object(), new Object()) instanceof J).assertTrue();
  }
}

// ============================================================================
// Data Setup for overriding_2
// ============================================================================
namespace overriding_2 {
  export class A {}
  export class B extends A {}
  export class C extends B {}

  export interface K {
    meth(p: B, q: A, w: Object): Object
  }
  export interface I extends K {}
  export interface J extends I {
    meth(p: A, q: Object, w: Object): this
  }

  export class X implements J {
    meth(p: A, q: Object, w: Object): this {
      return this;
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main(): void {
    expect(k.meth(new B(), new A(), new Object()) instanceof K).assertTrue();
    expect(i.meth(new B(), new A(), new Object()) instanceof I).assertTrue();
    expect(j.meth(new A(), new Object(), new Object()) instanceof J).assertTrue();
  }
}

// ============================================================================
// Data Setup for overriding_3
// ============================================================================
namespace overriding_3 {
  export class A {}
  export class B extends A {}
  export class C extends B {}

  export interface K {
    meth<T extends B, U extends A, V extends Object>(p: T, q: U, w: V): A
  }
  export interface I extends K {}
  export interface J extends I {
    meth<T extends A, U extends Object, V extends Object>(p: T, q: U, w: V): B
  }

  export class X implements J {
    meth<T extends A, U extends Object, V extends Object>(p: T, q: U, w: V): B {
      return new B();
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main(): void {
    expect(k.meth<B, A, Object>(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(i.meth<B, A, Object>(new B(), new A(), new Object()) instanceof A).assertTrue();
    expect(j.meth<A, Object, Object>(new A(), new Object(), new Object()) instanceof B).assertTrue();
  }
}

// ============================================================================
// Data Setup for overriding_4
// ============================================================================
namespace overriding_4 {
  export class A {}
  export class B extends A {}
  export class C extends B {}

  export interface K {
    meth<T extends B, U extends A, V extends Object>(p: T, q: U, w: V): this
  }
  export interface I extends K {}
  export interface J extends I {
    meth<T extends A, U extends Object, V extends Object>(p: T, q: U, w: V): this
  }

  export class X implements J {
    meth<T extends A, U extends Object, V extends Object>(p: T, q: U, w: V): this {
      return this;
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main(): void {
    expect(k.meth<B, A, Object>(new B(), new A(), new Object()) instanceof K).assertTrue();
    expect(i.meth<B, A, Object>(new B(), new A(), new Object()) instanceof I).assertTrue();
    expect(j.meth<A, Object, Object>(new A(), new Object(), new Object()) instanceof J).assertTrue();
  }
}

// ============================================================================
// Data Setup for overriding_5
// ============================================================================
namespace overriding_5 {
  export class A {}
  export class B extends A {}
  export class C extends B {}

  export interface K {
    meth<T extends B, U extends A, V extends Object>(p: T, q: U, w: V): K
  }
  export interface I extends K {}
  export interface J extends I {
    meth<T extends A, U extends Object, V extends Object>(p: T, q: U, w: V): this
  }

  export class X implements J {
    meth<T extends A, U extends Object, V extends Object>(p: T, q: U, w: V): this {
      return this;
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main(): void {
    expect(k.meth<B, A, Object>(new B(), new A(), new Object()) instanceof K).assertTrue();
    expect(i.meth<B, A, Object>(new B(), new A(), new Object()) instanceof I).assertTrue();
    expect(j.meth<A, Object, Object>(new A(), new Object(), new Object()) instanceof J).assertTrue();
  }
}

// ============================================================================
// Data Setup for overriding_6
// ============================================================================
namespace overriding_6 {
  export class A {}
  export class B extends A {}
  export class C extends B {}

  export interface K {
    meth(p: C, q: B, w: A): A
    meth(p: B, q: A, w: Object): B
  }
  export interface I extends K {}
  export interface J extends I {
    meth(p: A, q: Object, w: Object): C
  }

  export class X implements J {
    meth(p: A, q: Object, w: Object): C {
      return new C();
    }
  }

  export let k: K = new X();
  export let i: I = new X();
  export let j: J = new X();

  export function main(): void {
    expect(k.meth(new C(), new B(), new A()) instanceof C).assertTrue();
    expect(i.meth(new B(), new A(), new Object()) instanceof C).assertTrue();
    expect(j.meth(new A(), new Object(), new Object()) instanceof C).assertTrue();
  }
}

export default function OverridingTest():void {
  describe('OverridingTest', () => {
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
     * @tc.number    SUB_OVERRIDING_IN_INTERFACESSTEST_0100
     * @tc.name      testOverriding0001
     * @tc.desc      A method is defined in a subinterface with the same name as the method in the
     *               superinterface. If signatures are override-compatible, then overriding is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverriding0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overriding_0.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_INTERFACESSTEST_0200
     * @tc.name      testOverriding0002
     * @tc.desc      A method is defined in a subinterface. If signatures are override-compatible,
     *               then overriding is used (returning this).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverriding0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overriding_1.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_INTERFACESSTEST_0300
     * @tc.name      testOverriding0003
     * @tc.desc      A method is defined in a subinterface. If signatures are override-compatible,
     *               then overriding is used (returning this vs Object).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverriding0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overriding_2.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_INTERFACESSTEST_0400
     * @tc.name      testOverriding0004
     * @tc.desc      A method is defined in a subinterface. If signatures are override-compatible,
     *               then overriding is used (Generic parameters).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverriding0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overriding_3.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_INTERFACESSTEST_0500
     * @tc.name      testOverriding0005
     * @tc.desc      A method is defined in a subinterface. If signatures are override-compatible,
     *               then overriding is used (Generic parameters returning this).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverriding0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overriding_4.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_INTERFACESSTEST_0600
     * @tc.name      testOverriding0006
     * @tc.desc      A method is defined in a subinterface. If signatures are override-compatible,
     *               then overriding is used (Generic parameters returning K vs this).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverriding0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overriding_5.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_INTERFACESSTEST_0700
     * @tc.name      testOverriding0007
     * @tc.desc      A method is defined in a subinterface. If signatures are override-compatible,
     *               then overriding is used (Multiple signature overrides).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverriding0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overriding_6.main();
    });
  })
}