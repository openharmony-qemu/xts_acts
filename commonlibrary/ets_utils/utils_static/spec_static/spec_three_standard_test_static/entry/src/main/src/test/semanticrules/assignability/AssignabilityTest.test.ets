'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';


enum SomeEnum {a, b, c}

enum SomeEnum1: int {a = 0, b = 1, c = 2}

enum SomeEnum2: long {a = 0, b = 1, c = 2}

enum SomeEnum3: double {a = 0.0, b = 1.0, c = 2.0}

function foo(i: int) {
  return 1;
}
function bar(i: int, j?: string) {
  return 2;
}

function bar1(i?: int, j?: string) {
  return 2;
}

function foo(i: int, j: string) {
  return 1;
}
function bar2(i: int, j?: string) {
  return 2;
}

function bar3(i?: int, j?: string) {
  return 2;
}

class C {
  name: string = ''
  constructor() {}
  constructor(name: string) {
    this.name = name
  }
}

class A {
  name: string = ''
  constructor() {}
  constructor(name: string) {
    this.name = name
  }
}
class B extends A {
  constructor() { super() }
  constructor(name: string) {
    super(name)
  }
}

class E<in T> {}

class E1<out T> {}

export default function AssignabilityTest(): void {
  describe('AssignabilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    SUB_ASSIGNABILITY_FUNCTIONS_COMPATIBILITY_OPT_0300
     * @tc.name      testFunctionsCompatibilityOpt0003
     * @tc.desc      Mixing function overload and signature overload will result in CTE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsCompatibilityOpt0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x2: (i2: int, j2: string) => int = bar2;
      expect(x2(1, "knock-knock")).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_FUNCTIONS_COMPATIBILITY_OPT_0400
     * @tc.name      testFunctionsCompatibilityOpt0004
     * @tc.desc      Mixing function overload and signature overload will result in CTE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsCompatibilityOpt0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x3: (i: int, j: string) => int = bar3;
      expect(x3(1, "who`s there")).assertEqual(2);
    });
  })
}