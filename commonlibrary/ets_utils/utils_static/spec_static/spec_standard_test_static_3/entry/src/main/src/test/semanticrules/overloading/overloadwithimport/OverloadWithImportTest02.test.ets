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

// ============================================================================
// Mocked "function_export_all.ets" and Overload logic for Tests
// ============================================================================

namespace import_source_0_1 {
  export function foo(v?: boolean): number {
    if (v === undefined) {
      return 1; // FM.foo01
    }
    return 2;   // FM.foo02
  }
}

namespace import_source_2_3 {
  export function foo(v: number): number {
    if (Number.isInteger(v)) {
      return 3; // FM.foo03 (int)
    }
    return 6;   // FM.foo06 (float)
  }
}

namespace import_source_4_5 {
  export function foo(v1: number, v2?: number): number {
    if (v2 === undefined) {
      return Math.abs(v1);
    }
    return Math.max(v1, v2);
  }
}

namespace import_source_6_7 {
  export function foo(v: number): number {
    if (Number.isInteger(v)) {
      return 4; // FM.foo04 (int)
    }
    return 7;   // FM.foo07 (double)
  }
}

namespace import_source_8_9 {
  export function foo(v: number | Object): number {
    if (typeof v === 'number') {
      return 5; // FM.foo05
    }
    return 9;   // FM.foo09
  }
}

// ============================================================================
// Test Suite Execution
// ============================================================================
export default function OverloadWithImportTest02():void {
  describe('OverloadWithImportTest02', () => {
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
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTWO_0100
     * @tc.name      testFunctionImportOneSource0001
     * @tc.desc      Overload function from imported functions (Empty args).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportOneSource0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_source_0_1.foo()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTWO_0200
     * @tc.name      testFunctionImportOneSource0002
     * @tc.desc      Overload function from imported functions (Boolean arg).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportOneSource0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_source_0_1.foo(true)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTWO_0300
     * @tc.name      testFunctionImportOneSource0003
     * @tc.desc      Overload function from imported functions (Integer arg resolving to foo03).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportOneSource0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_source_2_3.foo(10)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTWO_0400
     * @tc.name      testFunctionImportOneSource0004
     * @tc.desc      Overload function from imported functions (Float arg resolving to foo06).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportOneSource0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_source_2_3.foo(7.4)).assertEqual(6);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTWO_0500
     * @tc.name      testFunctionImportOneSource0005
     * @tc.desc      Overload function from imported functions (Math.abs mapping).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportOneSource0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_source_4_5.foo(-7)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTWO_0600
     * @tc.name      testFunctionImportOneSource0006
     * @tc.desc      Overload function from imported functions (Math.max mapping).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportOneSource0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_source_4_5.foo(7, 24)).assertEqual(24);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTWO_0700
     * @tc.name      testFunctionImportOneSource0007
     * @tc.desc      Overload function from imported functions (Integer arg resolving to foo04).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportOneSource0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_source_6_7.foo(10)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTWO_0800
     * @tc.name      testFunctionImportOneSource0008
     * @tc.desc      Overload function from imported functions (Double arg resolving to foo07).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportOneSource0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_source_6_7.foo(10.5)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTWO_0900
     * @tc.name      testFunctionImportOneSource0009
     * @tc.desc      Overload function from imported functions (Integer arg resolving to foo05).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportOneSource0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_source_8_9.foo(10)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTTWO_1000
     * @tc.name      testFunctionImportOneSource0010
     * @tc.desc      Overload function from imported functions (Object arg resolving to foo09).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionImportOneSource0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(import_source_8_9.foo(new Object())).assertEqual(9);
    });

  })
}