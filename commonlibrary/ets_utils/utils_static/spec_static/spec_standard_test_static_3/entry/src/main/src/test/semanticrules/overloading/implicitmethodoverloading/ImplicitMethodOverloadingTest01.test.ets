
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
// Data Setup for testInstantiationGenericClassOverloadEquivalent0001
// ============================================================================
namespace implicit_method_overload_0 {
  export class Template<T> {
    foo(p: T): string { return "generic"; }
    foo(p: number): string { return "non-generic"; }
  }

  export function main(): void {
    let instantiation: Template<number> = new Template<number>();
    expect(instantiation.foo(1)).assertEqual("generic");
  }
}

// ============================================================================
// Data Setup for testInstantiationGenericClassOverloadEquivalent0002
// ============================================================================
namespace implicit_method_overload_1 {
  export class Template<T> {
    foo(p: number): string { return "non-generic"; }
    foo(p: T): string { return "generic"; }
  }

  export function main(): void {
    let instantiation: Template<number> = new Template<number>();
    expect(instantiation.foo(1)).assertEqual("non-generic");
  }
}

// ============================================================================
// Data Setup for testInstantiationGenericClassOverloadEquivalent0003
// ============================================================================
namespace implicit_method_overload_2 {
  export class Template<T> {
    foo(p: T): number { return 1; }
    foo(p: string): string { return p; }
  }

  export function main(): void {
    let instantiation: Template<string> = new Template<string>();
    expect(instantiation.foo("str")).assertEqual(1);
  }
}

// ============================================================================
// Data Setup for testInstantiationGenericClassOverloadEquivalent0004
// ============================================================================
namespace implicit_method_overload_3 {
  export class Template<U, V> {
    foo(p1: U, p2: V): string { return "generic"; }
    foo(p1: number, p2: string): string { return "non-generic"; }
  }

  export function main(): void {
    let instantiation: Template<number, string> = new Template<number, string>();
    expect(instantiation.foo(1, "str")).assertEqual("generic");
  }
}

// ============================================================================
// Data Setup for testInstantiationGenericClassOverloadEquivalent0005
// ============================================================================
namespace implicit_method_overload_4 {
  export class A {}
  export class B extends A {}
  export class Template<T extends A> {
    foo(x: T): string { return "generic"; }
    foo(x: B): string { return "non-generic"; }
  }

  export function main(): void {
    let instantiation: Template<B> = new Template<B>();
    expect(instantiation.foo(new B())).assertEqual("generic");
  }
}

// ============================================================================
// Data Setup for testInstantiationGenericClassOverloadEquivalent0006
// ============================================================================
namespace implicit_method_overload_5 {
  export class A {}
  export class B extends A {}
  export class Template<T extends A> {
    foo(x: B): string { return "non-generic"; }
    foo(x: T): string { return "generic"; }
  }

  export function main(): void {
    let instantiation: Template<B> = new Template<B>();
    expect(instantiation.foo(new B())).assertEqual("non-generic");
  }
}

export default function ImplicitMethodOverloadingTest01():void {
  describe('ImplicitMethodOverloadingTest01', () => {
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
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTONE_0100
     * @tc.name      testInstantiationGenericClassOverloadEquivalent0001
     * @tc.desc      If an instantiation of a generic class or a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called. (Generic first)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericClassOverloadEquivalent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_method_overload_0.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTONE_0200
     * @tc.name      testInstantiationGenericClassOverloadEquivalent0002
     * @tc.desc      If an instantiation of a generic class or a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called. (Non-generic first)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericClassOverloadEquivalent0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_method_overload_1.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTONE_0300
     * @tc.name      testInstantiationGenericClassOverloadEquivalent0003
     * @tc.desc      If an instantiation of a generic class or a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called. (Different return types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericClassOverloadEquivalent0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_method_overload_2.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTONE_0400
     * @tc.name      testInstantiationGenericClassOverloadEquivalent0004
     * @tc.desc      If an instantiation of a generic class or a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called. (Multiple generic parameters)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericClassOverloadEquivalent0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_method_overload_3.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTONE_0500
     * @tc.name      testInstantiationGenericClassOverloadEquivalent0005
     * @tc.desc      If an instantiation of a generic class or a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called. (Class constraint, Generic first)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericClassOverloadEquivalent0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_method_overload_4.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTONE_0600
     * @tc.name      testInstantiationGenericClassOverloadEquivalent0006
     * @tc.desc      If an instantiation of a generic class or a generic interface leads to an overload-equivalent
     *               method, then the textually first method is called. (Class constraint, Non-generic first)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericClassOverloadEquivalent0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_method_overload_5.main();
    });

  })
}