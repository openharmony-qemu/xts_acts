/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
// Data Setup for overload_method_0
// ============================================================================
namespace overload_method_0 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: number): string { return 'int: ' + x; }
    foo(x: string): string { return x; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo()).assertEqual(100);
  }
}

// ============================================================================
// Data Setup for overload_method_1
// ============================================================================
namespace overload_method_1 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: number, y: number): string { return 'int: ' + x; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo()).assertEqual(100);
  }
}

// ============================================================================
// Data Setup for overload_method_2
// ============================================================================
namespace overload_method_2 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: boolean): string { return 'bool'; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo()).assertEqual(100);
  }
}

// ============================================================================
// Data Setup for overload_method_3
// ============================================================================
namespace overload_method_3 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: Object): string { return 'obj'; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo()).assertEqual(100);
  }
}

// ============================================================================
// Data Setup for overload_method_4
// ============================================================================
namespace overload_method_4 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: number): string { return 'int: ' + x; }
    foo(x: string): string { return 'string: ' + x; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo(20)).assertEqual("int: 20");
  }
}

// ============================================================================
// Data Setup for overload_method_5
// ============================================================================
namespace overload_method_5 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: number): string { return 'int: ' + x; }
    foo(x: boolean): string { return 'bool: ' + x; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo(10)).assertEqual("int: 10");
  }
}

// ============================================================================
// Data Setup for overload_method_6
// ============================================================================
namespace overload_method_6 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: number): number { return x; }
    foo(x: number, y: number): number { return x + y; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo(1.2)).assertEqual(1.2);
  }
}

// ============================================================================
// Data Setup for overload_method_7
// ============================================================================
namespace overload_method_7 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: number): string { return 'int: ' + x; }
    foo(x: string): string { return x; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo("string")).assertEqual("string");
  }
}

// ============================================================================
// Data Setup for overload_method_8
// ============================================================================
namespace overload_method_8 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: number): string { return 'int: ' + x; }
    foo(x: string): string { return x; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo(5)).assertEqual("int: 5");
  }
}

// ============================================================================
// Data Setup for overload_method_9
// ============================================================================
namespace overload_method_9 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: number): string { return 'int: ' + x; }
    foo(x: boolean): string { return 'bool: ' + x; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo(5)).assertEqual("int: 5");
  }
}

// ============================================================================
// Data Setup for overload_method_10
// ============================================================================
namespace overload_method_10 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: number): string { return 'int: ' + x; }
    foo(x: number, y: number): number { return x + y; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo(5)).assertEqual("int: 5");
  }
}

// ============================================================================
// Data Setup for overload_method_11
// ============================================================================
namespace overload_method_11 {
  export class FuncTest {
    foo(): number { return 100; }
    foo(x: number): string { return 'int: ' + x; }
    foo(x: Object): string { return 'obj'; }
  }
  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.foo(5)).assertEqual("int: 5");
  }
}

export default function ImplicitMethodOverloadingTest03():void {
  describe('ImplicitMethodOverloadingTest03', () => {
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
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_0100
     * @tc.name      testOverloadMethod0001
     * @tc.desc      Check overload code. Class method overload: zero-argument resolution.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_0.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_0200
     * @tc.name      testOverloadMethod0002
     * @tc.desc      Check overload code. Class method overload: zero-argument resolution vs multi-arg.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_1.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_0300
     * @tc.name      testOverloadMethod0003
     * @tc.desc      Check overload code. Class method overload: zero-argument resolution vs boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_2.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_0400
     * @tc.name      testOverloadMethod0004
     * @tc.desc      Check overload code. Class method overload: zero-argument resolution vs Object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_3.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_0500
     * @tc.name      testOverloadMethod0005
     * @tc.desc      Check overload code. Class method overload: exact number parameter match vs string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_4.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_0600
     * @tc.name      testOverloadMethod0006
     * @tc.desc      Check overload code. Class method overload: exact number parameter match vs boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_5.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_0700
     * @tc.name      testOverloadMethod0007
     * @tc.desc      Check overload code. Class method overload: float number parameter match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_6.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_0800
     * @tc.name      testOverloadMethod0008
     * @tc.desc      Check overload code. Class method overload: exact string parameter match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_7.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_0900
     * @tc.name      testOverloadMethod0009
     * @tc.desc      Check overload code. Class method overload: literal integer resolution vs string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_8.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_1000
     * @tc.name      testOverloadMethod0010
     * @tc.desc      Check overload code. Class method overload: literal integer resolution vs boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_9.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_1100
     * @tc.name      testOverloadMethod0011
     * @tc.desc      Check overload code. Class method overload: literal integer resolution vs multi-arg.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_10.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_METHOD_OVERLOADINGTESTTHREE_1200
     * @tc.name      testOverloadMethod0012
     * @tc.desc      Check overload code. Class method overload: literal integer resolution vs Object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadMethod0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_method_11.main();
    });

  })
}