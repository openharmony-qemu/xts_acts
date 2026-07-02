'use static';

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
// Data Setup for instantiation_generic_function_overload_equivalent_0
// ============================================================================
namespace implicit_overload_0 {
  export function foo<T>(x: T): string { return "generic" }
  export function foo(x: number): string { return "non-generic" }

  export function main(): void {
    let a = foo(1)
    expect(a).assertEqual("generic") // Textually first function call expected
  }
}

// ============================================================================
// Data Setup for instantiation_generic_function_overload_equivalent_1
// ============================================================================
namespace implicit_overload_1 {
  export function foo(x: number): string { return "non-generic" }
  export function foo<T>(x: T): string { return "generic" }

  export function main(): void {
    let a = foo(1)
    expect(a).assertEqual("non-generic") // Textually first function call expected
  }
}

// ============================================================================
// Data Setup for instantiation_generic_function_overload_equivalent_2
// ============================================================================
namespace implicit_overload_2 {
  export function foo<T>(x: T): string { return "generic" }
  export function foo(x: number): string { return "non-generic" }

  export function main(): void {
    let a = foo<number>(1)
    expect(a).assertEqual("generic") // Generic function call expected explicitly
  }
}

// ============================================================================
// Data Setup for instantiation_generic_function_overload_equivalent_3
// ============================================================================
namespace implicit_overload_3 {
  export function foo(x: number): string { return "non-generic" }
  export function foo<T>(x: T): string { return "generic" }

  export function main(): void {
    let a = foo<number>(1)
    expect(a).assertEqual("generic") // Generic function call expected explicitly
  }
}

// ============================================================================
// Data Setup for instantiation_generic_function_overload_equivalent_4
// ============================================================================
namespace implicit_overload_4 {
  export function foo(x: number): string { return "non-generic" }
  export function foo<T>(x: T): string { return "generic" }

  export function main(): void {
    let a = foo("str")
    expect(a).assertEqual("generic") // Only generic matches string
  }
}

// ============================================================================
// Data Setup for instantiation_generic_function_overload_equivalent_5
// ============================================================================
namespace implicit_overload_5 {
  export class A {}
  export function foo(x: number): string { return "non-generic" }
  export function foo<T>(x: T): string { return "generic" }

  export function main(): void {
    let a = foo(new A())
    expect(a).assertEqual("generic") // Only generic matches Object
  }
}

// ============================================================================
// Data Setup for instantiation_generic_function_overload_equivalent_6
// ============================================================================
namespace implicit_overload_6 {
  export function foo(p1: number, p2: string): string { return "non-generic" }
  export function foo<U, V>(p1: U, p2: V): string { return "generic" }

  export function main(): void {
    let a = foo(1, '2')
    expect(a).assertEqual("non-generic") // Textually first function call expected
  }
}

// ============================================================================
// Data Setup for instantiation_generic_function_overload_equivalent_7
// ============================================================================
namespace implicit_overload_7 {
  export class A {}
  export class B extends A {}
  export function foo(x: B): string { return "non-generic" }
  export function foo<T extends A>(x: T): string { return "generic" }

  export function main(): void {
    let a = foo<B>(new B())
    expect(a).assertEqual("generic") // Generic function call expected explicitly
  }
}

export default function ImplicitFunctionOverloadingTest01():void {
  describe('ImplicitFunctionOverloadingTest01', () => {
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
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTONE_0100
     * @tc.name      testInstantiationGenericFunctionOverloadEquivalent0001
     * @tc.desc      An implicit overload with instantiation of a generic function and overload-equivalent non-generic
     *               function causes no CTE, and the textually first function is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericFunctionOverloadEquivalent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_overload_0.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTONE_0200
     * @tc.name      testInstantiationGenericFunctionOverloadEquivalent0002
     * @tc.desc      An implicit overload with instantiation of a generic function and overload-equivalent non-generic
     *               function causes no CTE, and the textually first function is used (Reversed order).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericFunctionOverloadEquivalent0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_overload_1.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTONE_0300
     * @tc.name      testInstantiationGenericFunctionOverloadEquivalent0003
     * @tc.desc      Explicit generic instantiation resolves to the generic function over the non-generic equivalent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericFunctionOverloadEquivalent0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_overload_2.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTONE_0400
     * @tc.name      testInstantiationGenericFunctionOverloadEquivalent0004
     * @tc.desc      Explicit generic instantiation resolves to the generic function over the non-generic equivalent (Reversed order).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericFunctionOverloadEquivalent0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_overload_3.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTONE_0500
     * @tc.name      testInstantiationGenericFunctionOverloadEquivalent0005
     * @tc.desc      Type narrowing ensures the generic function is called when argument doesn't match non-generic signature.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericFunctionOverloadEquivalent0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_overload_4.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTONE_0600
     * @tc.name      testInstantiationGenericFunctionOverloadEquivalent0006
     * @tc.desc      Type narrowing ensures the generic function is called when object argument doesn't match primitive signature.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericFunctionOverloadEquivalent0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_overload_5.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTONE_0700
     * @tc.name      testInstantiationGenericFunctionOverloadEquivalent0007
     * @tc.desc      Textually first function precedence holds true for multi-parameter overload equivalents.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericFunctionOverloadEquivalent0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_overload_6.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTONE_0800
     * @tc.name      testInstantiationGenericFunctionOverloadEquivalent0008
     * @tc.desc      Explicit generic instantiation resolves to generic function even when constrained type exactly matches non-generic overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstantiationGenericFunctionOverloadEquivalent0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      implicit_overload_7.main();
    });

  })
}