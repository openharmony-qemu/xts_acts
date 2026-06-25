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


class Base {
  foo(p: Derived) {
    return new Base()
  }
}

class Derived extends Base {
  override foo(p: Derived) {
    return new Derived()
  }
}


class Base2 {}
class Derived2 extends Base2 {}

function foo2(i: Base2) {
  return 1;
}


export default function InvarianceCovarianceAndContravarianceCovarianceTest(): void {
  describe('InvarianceCovarianceAndContravarianceCovarianceTest', () => {
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
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_COVARIANCETEST_0100
     * @tc.name      testInvarianceCovarianceAndContravarianceCovariance0001
     * @tc.desc      desc: 'Variance is how subtyping between class types relates to subtyping between
                     class member signatures (types of parameters, return type). Variance can be of three
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceCovariance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

        let a = new Base();
        let b = new Derived();

        let res1 = a.foo(b);
        let res2 = b.foo(b);


        expect(res1 instanceof Base).assertTrue();

        expect(res1 instanceof Derived).assertFalse();

        expect(res2 instanceof Derived).assertTrue();

    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_COVARIANCETEST_0200
     * @tc.name      testInvarianceCovarianceAndContravarianceCovariance0002
     * @tc.desc      desc: covariance for parameter types is prohibited
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceCovariance0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

      expect(foo2(new Base2())).assertEqual(foo2(new Derived2()));
    });
  });
}