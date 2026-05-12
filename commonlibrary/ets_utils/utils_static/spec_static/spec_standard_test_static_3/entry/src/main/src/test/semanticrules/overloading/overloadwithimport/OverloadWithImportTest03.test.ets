
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

namespace import_2_sources_0_1 {
  export function foo(v1: boolean | number, v2: number | string): number {
    if (typeof v1 === 'boolean' && typeof v2 === 'number') {
      return 1; // From mock fooA
    }
    return 2;   // From mock fooB
  }
}

// ============================================================================
// Group 2: Arrays (Source 2)
// ============================================================================
namespace import_2_sources_2 {
  export function foo<T>(v: T[]): number {
    if (v.length > 0 && typeof v[0] === 'number') {
      return 1; // From mock fooA
    }
    return 2;   // From mock fooB
  }
}

// ============================================================================
// Group 3: Boxed vs Primitive overlapping simulation (Sources 3, 4)
// ============================================================================
namespace import_2_sources_3_4 {
  export function foo(v: boolean | number): number {
    if (typeof v === 'boolean') {
      return 1; // From mock fooA
    }
    return 2;   // From mock fooB
  }
}

// ============================================================================
// Group 4: Generics (Sources 5, 6)
// ============================================================================
namespace import_2_sources_5_6 {
  export function foo<T, U = Object>(v1: T, v2?: U): number {
    if (v2 !== undefined) {
      return 1; // From mock fooA (2 params)
    }
    return 2;   // From mock fooB (1 param)
  }
}

// ============================================================================
// Group 5: Primitives (Sources 7, 8)
// ============================================================================
namespace import_2_sources_7_8 {
  export function foo(v: boolean | number): number {
    if (typeof v === 'boolean') {
      return 1; // From mock fooA
    }
    return 2;   // From mock fooB
  }
}

// ============================================================================
// Group 6: Unions (Sources 9, 10, 11, 12)
// ============================================================================
namespace import_2_sources_9_to_12 {
  export function foo(v: string | null | boolean | number): number {
    if (v === null || typeof v === 'string') {
      return 1; // From mock fooA
    }
    if (typeof v === 'boolean' || typeof v === 'number') {
      return 2; // From mock fooB
    }
    return 0;
  }
}


// ============================================================================
// Test Suite Execution
// ============================================================================
export default function OverloadWithImportTest03():void {
  describe('OverloadWithImportTest03', () => {
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
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_0100
     * @tc.name      testFunctionImportTwoSource0001
     * @tc.desc      Overload function from 2 sources imported functions (boolean, number args).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_0_1.foo(true, 6)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_0200
     * @tc.name      testFunctionImportTwoSource0002
     * @tc.desc      Overload function from 2 sources imported functions (number, string args).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_0_1.foo(10.3, "Hi!")).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_0300
     * @tc.name      testFunctionImportTwoSource0003
     * @tc.desc      Overload function from 2 sources imported functions (array args).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_2.foo([1.1, 5.5])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_0400
     * @tc.name      testFunctionImportTwoSource0004
     * @tc.desc      Overload function from 2 sources imported functions (boxed/primitive boolean).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_3_4.foo(false)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_0500
     * @tc.name      testFunctionImportTwoSource0005
     * @tc.desc      Overload function from 2 sources imported functions (boxed/primitive number).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_3_4.foo(10)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_0600
     * @tc.name      testFunctionImportTwoSource0006
     * @tc.desc      Overload function from 2 sources imported functions (Generics with 2 args).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_5_6.foo<number, string>(1, "Hi!")).assertEqual(1);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_0700
     * @tc.name      testFunctionImportTwoSource0007
     * @tc.desc      Overload function from 2 sources imported functions (Generics with 1 arg).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_5_6.foo<boolean>(true)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_0800
     * @tc.name      testFunctionImportTwoSource0008
     * @tc.desc      Overload function from 2 sources imported functions (primitive boolean).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_7_8.foo(false)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_0900
     * @tc.name      testFunctionImportTwoSource0009
     * @tc.desc      Overload function from 2 sources imported functions (primitive number).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_7_8.foo(100)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_1000
     * @tc.name      testFunctionImportTwoSource0010
     * @tc.desc      Overload function from 2 sources imported functions (union null).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_9_to_12.foo(null)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_1100
     * @tc.name      testFunctionImportTwoSource0011
     * @tc.desc      Overload function from 2 sources imported functions (union boolean).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_9_to_12.foo(false)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_1200
     * @tc.name      testFunctionImportTwoSource0012
     * @tc.desc      Overload function from 2 sources imported functions (union string).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_9_to_12.foo("Hi!")).assertEqual(1);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTHREE_1300
     * @tc.name      testFunctionImportTwoSource0013
     * @tc.desc      Overload function from 2 sources imported functions (union number).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportTwoSource0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_2_sources_9_to_12.foo(12.45)).assertEqual(2);
    });

  })
}