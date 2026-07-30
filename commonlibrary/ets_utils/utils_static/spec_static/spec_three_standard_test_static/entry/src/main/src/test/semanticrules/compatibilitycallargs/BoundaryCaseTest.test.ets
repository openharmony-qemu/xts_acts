'use static';
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
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}
function checkTypeIdentity1(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}
function checkTypeIdentity2(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}

export default function BoundaryCaseTest(): void {
  describe('BoundaryCaseTest', () => {
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
     * @tc.number    SUB_BOUNDARY_CASE_TEST_0100
     * @tc.name      testBoundaryCase0001
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types
     *               on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBoundaryCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        

      const val1: Any = null;
      const val2: null = null;

      const result = checkTypeIdentity1(val1, val2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_BOUNDARY_CASE_TEST_0200
     * @tc.name      testBoundaryCase0002
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types
     *               on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBoundaryCase0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        

      const val1: null = null;
      const val2: undefined = undefined;

      const result = checkTypeIdentity2(val1, val2);
      expect(result).assertEqual(false);
    });
  })
}
