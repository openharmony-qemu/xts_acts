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
   from '@ohos/hypium-binary/src/main/indexStatic';


 let res: number = 0

 class Base {
   foo(p: Derived): Derived {
     res = 1
     return p;
   }
 }

 class Derived extends Base {
   override foo(p: Base): Derived {
     res = 2
     return new Derived();
   }
 }

 class A2 {}

 class B2 extends A2 {}

 class C2 extends B2 {}

 function foo(b: B2): void {}

 export default function InvarianceCovarianceAndContravarianceContravarianceTest(): void {
  describe('InvarianceCovarianceAndContravarianceContravarianceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    
    beforeEach(async () => {
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
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_CONTRAVARIANCETEST_0100
     * @tc.name      testInvarianceCovarianceAndContravarianceContravariance0001
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceContravariance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {


        let a = new Base();
        let b = new Derived();

        a.foo(b);
        expect(res).assertEqual(1);

        b.foo(a);
        expect(res).assertEqual(2);
      });
  });
 }