
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
// Data Setup for overload_function_0 to overload_function_3
// Testing zero-parameter overload resolution against other numeric/string overloads
// ============================================================================
namespace overload_0 {
  export function foo(): number { return 100; }
  export function foo(x: number): string { return 'number: ' + x; }
  export function main(): void {
    expect(foo()).assertEqual(100);
  }
}

namespace overload_1 {
  export function foo(): number { return 100; }
  export function foo(x: number, y: number): string { return 'num: ' + x; }
  export function main(): void {
    expect(foo()).assertEqual(100);
  }
}

namespace overload_2 {
  export function foo(): number { return 100; }
  export function foo(x: string): string { return x; }
  export function main(): void {
    expect(foo()).assertEqual(100);
  }
}

namespace overload_3 {
  export function foo(): number { return 100; }
  export function foo(x: boolean): string { return 'bool'; }
  export function main(): void {
    expect(foo()).assertEqual(100);
  }
}

// ============================================================================
// Data Setup for overload_function_4 to overload_function_7
// Testing exact parameter type match resolution
// ============================================================================
namespace overload_4 {
  export function foo(): number { return 100; }
  export function foo(x: number): string { return 'number: ' + x; }
  export function foo(x: string): string { return 'string: ' + x; }
  export function main(): void {
    // Testing number resolution
    expect(foo(20)).assertEqual("number: 20");
  }
}

namespace overload_5 {
  export function foo(): number { return 100; }
  export function foo(x: number): string { return 'number: ' + x; }
  export function foo(x: boolean): string { return 'boolean: ' + x; }
  export function main(): void {
    expect(foo(10)).assertEqual("number: 10");
  }
}

namespace overload_6 {
  export function foo(): number { return 100; }
  export function foo(x: number, y: number): number { return x + y; }
  export function foo(x: number): number { return x; }
  export function main(): void {
    expect(foo(1.2)).assertEqual(1.2);
  }
}

namespace overload_7 {
  export function foo(): number { return 100; }
  export function foo(x: number): string { return 'number: ' + x; }
  export function foo(x: string): string { return x; }
  export function main(): void {
    expect(foo("string")).assertEqual("string");
  }
}

// ============================================================================
// Data Setup for overload_function_8 to overload_function_11
// Testing literal resolution and fallback
// ============================================================================
namespace overload_8 {
  export function foo(): number { return 100; }
  export function foo(x: number): string { return 'int: ' + x; }
  export function foo(x: string): string { return x; }
  export function main(): void {
    expect(foo(5)).assertEqual("int: 5");
  }
}

namespace overload_9 {
  export function foo(): number { return 100; }
  export function foo(x: number): string { return 'int: ' + x; }
  export function foo(x: boolean): string { return 'bool: ' + x; }
  export function main(): void {
    expect(foo(5)).assertEqual("int: 5");
  }
}

namespace overload_10 {
  export function foo(): number { return 100; }
  export function foo(x: number): string { return 'int: ' + x; }
  export function foo(x: number, y: number): number { return x + y; }
  export function main(): void {
    expect(foo(5)).assertEqual("int: 5");
  }
}

namespace overload_11 {
  export function foo(): number { return 100; }
  export function foo(x: number): string { return 'int: ' + x; }
  export function foo(x: Object): string { return 'obj'; }
  export function main(): void {
    expect(foo(5)).assertEqual("int: 5");
  }
}

export default function ImplicitFunctionOverloadingTest02():void {
  describe('ImplicitFunctionOverloadingTest02', () => {
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
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_0100
     * @tc.name      testOverloadFunction0001
     * @tc.desc      Check overload code. Function overload: zero-argument resolution.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_0.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_0200
     * @tc.name      testOverloadFunction0002
     * @tc.desc      Check overload code. Function overload: zero-argument resolution against multi-arg.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_1.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_0300
     * @tc.name      testOverloadFunction0003
     * @tc.desc      Check overload code. Function overload: zero-argument resolution against string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_2.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_0400
     * @tc.name      testOverloadFunction0004
     * @tc.desc      Check overload code. Function overload: zero-argument resolution against boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_3.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_0500
     * @tc.name      testOverloadFunction0005
     * @tc.desc      Check overload code. Function overload: exact number parameter match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_4.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_0600
     * @tc.name      testOverloadFunction0006
     * @tc.desc      Check overload code. Function overload: exact number parameter match vs boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_5.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_0700
     * @tc.name      testOverloadFunction0007
     * @tc.desc      Check overload code. Function overload: float number parameter match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_6.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_0800
     * @tc.name      testOverloadFunction0008
     * @tc.desc      Check overload code. Function overload: exact string parameter match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_7.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_0900
     * @tc.name      testOverloadFunction0009
     * @tc.desc      Check overload code. Function overload: literal integer resolution.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_8.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_1000
     * @tc.name      testOverloadFunction0010
     * @tc.desc      Check overload code. Function overload: literal integer resolution vs boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_9.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_1100
     * @tc.name      testOverloadFunction0011
     * @tc.desc      Check overload code. Function overload: literal integer resolution vs multi-arg.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_10.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_FUNCTION_OVERLOADINGTESTTWO_1200
     * @tc.name      testOverloadFunction0012
     * @tc.desc      Check overload code. Function overload: literal integer resolution vs Object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadFunction0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_11.main();
    });

  })
}