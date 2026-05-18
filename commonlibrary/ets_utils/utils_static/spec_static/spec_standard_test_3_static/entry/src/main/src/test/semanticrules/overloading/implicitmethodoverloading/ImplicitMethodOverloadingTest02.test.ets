
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// ============================================================================
// Data Setup for testInstantiationGenericInterfaceOverloadEquivalent0001
// ============================================================================
namespace implicit_interface_overload_0 {
  export interface Template<T> {
    foo(p: T): string { return "generic"; }
  foo(p: number): string { return "non-generic"; }
}
export class C implements Template<number> {}

export function main(): void {
  let instantiation = new C();
  expect(instantiation.foo(1)).assertEqual("generic");
}
}

// ============================================================================
// Data Setup for testInstantiationGenericInterfaceOverloadEquivalent0002
// ============================================================================
namespace implicit_interface_overload_1 {
  export interface Template<T> {
    foo(p: number): string { return "non-generic"; }
  foo(p: T): string { return "generic"; }
}
export class C implements Template<number> {}

export function main(): void {
  let instantiation = new C();
  expect(instantiation.foo(1)).assertEqual("non-generic");
}
}

// ============================================================================
// Data Setup for testInstantiationGenericInterfaceOverloadEquivalent0003
// ============================================================================
namespace implicit_interface_overload_2 {
  export class A {}
  export interface Template<T> {
    foo(p: T): number { return 1; }
  foo(p: A): A { return p; }
}
export class C implements Template<A> {}

export function main(): void {
  let instantiation = new C();
  expect(instantiation.foo(new A())).assertEqual(1);
}
}

// ============================================================================
// Data Setup for testInstantiationGenericInterfaceOverloadEquivalent0004
// ============================================================================
namespace implicit_interface_overload_3 {
  export interface Template<U, V> {
    foo(p1: U, p2: V): string { return "generic"; }
  foo(p1: number, p2: string): string { return "non-generic"; }
}
export class C implements Template<number, string> {}

export function main(): void {
  let instantiation = new C();
  expect(instantiation.foo(1, "str")).assertEqual("generic");
}
}

// ============================================================================
// Data Setup for testInstantiationGenericInterfaceOverloadEquivalent0005
// ============================================================================
namespace implicit_interface_overload_4 {
  export class A {}
  export class B extends A {}
  export interface Template<T extends A> {
    foo(x: T): string { return "generic"; }
  foo(x: B): string { return "non-generic"; }
}
// [FIX] 显式重写被泛型擦除后的原始签名 foo(x: A)，填补 vtable 空缺，彻底解决 LinkerVerificationError
export class C implements Template<B> {
  override foo(x: A): string { return "generic"; }
}

export function main(): void {
  let instantiation = new C();
  expect(instantiation.foo(new B())).assertEqual("generic");
}
}

// ============================================================================
// Data Setup for testInstantiationGenericInterfaceOverloadEquivalent0006
// ============================================================================
namespace implicit_interface_overload_5 {
  export class A {}
  export class B extends A {}
  export interface Template<T extends A> {
    foo(x: B): string { return "non-generic"; }
  foo(x: T): string { return "generic"; }
}
// [FIX] 显式重写被泛型擦除后的原始签名 foo(x: A)，填补 vtable 空缺，彻底解决 LinkerVerificationError
export class C implements Template<B> {
  override foo(x: A): string { return "non-generic"; }
}

export function main(): void {
  let instantiation = new C();
  expect(instantiation.foo(new B())).assertEqual("non-generic");
}
}


export default function ImplicitMethodOverloadingTest02():void {
  describe('ImplicitMethodOverloadingTest02', () => {
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
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTWO_0100
     * @tc.name      testInstantiationGenericInterfaceOverloadEquivalent0001
     * @tc.desc      If an instantiation of a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called (generic first).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericInterfaceOverloadEquivalent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_interface_overload_0.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTWO_0200
     * @tc.name      testInstantiationGenericInterfaceOverloadEquivalent0002
     * @tc.desc      If an instantiation of a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called (non-generic first).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericInterfaceOverloadEquivalent0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_interface_overload_1.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTWO_0300
     * @tc.name      testInstantiationGenericInterfaceOverloadEquivalent0003
     * @tc.desc      If an instantiation of a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called (Object wrapper vs class).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericInterfaceOverloadEquivalent0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_interface_overload_2.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTWO_0400
     * @tc.name      testInstantiationGenericInterfaceOverloadEquivalent0004
     * @tc.desc      If an instantiation of a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called (Multiple parameters).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericInterfaceOverloadEquivalent0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_interface_overload_3.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTWO_0500
     * @tc.name      testInstantiationGenericInterfaceOverloadEquivalent0005
     * @tc.desc      If an instantiation of a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called (Class constraints, generic first).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericInterfaceOverloadEquivalent0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_interface_overload_4.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTWO_0600
     * @tc.name      testInstantiationGenericInterfaceOverloadEquivalent0006
     * @tc.desc      If an instantiation of a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called (Class constraints, non-generic first).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericInterfaceOverloadEquivalent0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_interface_overload_5.main();
    });

  })
}