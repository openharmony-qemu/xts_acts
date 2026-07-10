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
  from '@ohos/hypium-binary/src/main/indexStatic';

class Base {
  foo(p: Base): Base {
    return p;
  }
}

class Derived extends Base {
  override foo(p: Base): Base {
    return p;
  }
}

function foo2( i: number): number {
  return i;
}

function foo3( i: Number): Number {
  return i;
}

function foo4( i: string): string {
  return i;
}

function foo5( i: String): String {
  return i;
}

function foo6( i: string): String {
  return i;
}

function foo14( i: Object): Object {
  return i;
}

class A {}

function foo15( i: A): A {
  return i;
}

enum E { S, M, L }

function foo16( i: E): E {
  return i;
}

class A17 {}
class B17 extends A17 {}

function foo17( i: B17): B17 {
  return i;
}

interface I {}
class A18 implements I {}

function foo18( i: A18): A18 {
  return i;
}

type tpl = [string, number]

function foo19( i: tpl): tpl {
  return i;
}

function foo20( i: number[]): number[] {
  return i;
}

function foo21( i: String|undefined|null): String|undefined|null {
  return i;
}

type Base24 = [ number ]
type Extended24 = [ Number ]

function logBase( b: Base24): Base24 {
  return b;
}

function logExt( callback: (e: Base24) => Base24, b: Base24): Base24 {
  return callback(b)
}

type Base25 = [ number ]
type Extended25 = [ Number ]

function logBase25( b: Base25) {
  return b;
}

function logExt25( callback: (e: Base25) => Base25, b: Base25) {
  return callback(b)
}

export default function InvarianceCovarianceAndContravarianceInvarianceTest(): void {
  describe('InvarianceCovarianceAndContravarianceInvarianceTest', () => {
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
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_0100
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0001
     * @tc.desc     'Variance is how subtyping between class types relates to subtyping between
     *               class member signatures (types of parameters, return type). Variance can be of three
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let a = new Base();
      let b = new Derived();

      expect(a.foo(a)).assertEqual(b.foo(a));
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_0200
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0002
     * @tc.desc      Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: number = 1;
      expect(foo2(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_0300
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0003
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
                     one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: Number = 1;
      expect(foo3(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_0400
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0004
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
    one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: string = "hey there";
      expect(foo4(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_0500
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0005
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
                     one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: String = "hey there";
      expect(foo5(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_0600
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0006
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
    one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: String = 'C'.toString();
      expect(foo6(i)).assertEqual(i)
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_0700
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0007
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
                     one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: String = 'C';
      expect(foo5(i)).assertEqual(i);
     });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_0800
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0008
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
    one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: number = 1;
      expect(foo2(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_0900
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0009
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: number = 1;
      expect(foo2(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_1000
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0010
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: number = 1.1;
      expect(foo2(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_1100
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0011
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: number = 1.2;
      expect(foo2(i)).assertEqual(i);
      });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_1200
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0012
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let i: number = -0.2f;
        expect(foo2(i)).assertEqual(i);
      });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_1300
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0013
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: number = -0.0000008f;
      expect(foo2(i)).assertEqual(i);
      });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_1400
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0014
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: Object = new Object();
      expect(foo14(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_1500
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0015
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: A = new A();
      expect(foo15(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_1600
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0016
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: E = E.S;
      expect(foo16(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_1700
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0017
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: B17 = new B17();
      expect(foo17(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_1800
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0018
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: A18 = new A18();
      expect(foo18(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_1900
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0019
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: tpl = ['v', 2.1];
      expect(foo19(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_2000
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0020
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: number[] = [1, 2.1];
      expect(foo20(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_2100
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0021
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: String|undefined|null = "abc";
      expect(foo21(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_2200
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0022
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: String|undefined|null = undefined;
      expect(foo21(i)).assertEqual(i);
      });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_2300
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0023
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let i: String|undefined|null = null;
      expect(foo21(i)).assertEqual(i);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_2400
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0024
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let b: Base24 = [1.2];
      expect(logBase(b)).assertEqual(logExt(logBase, b));
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_INVARIANCETEST_2500
     * @tc.name      testInvarianceCovarianceAndContravarianceInvariance0025
     * @tc.desc      desc: Invariance refers to the ability to use the originally-specified type as a derived
     *               one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceInvariance0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let b: Base25 = [1.2];
      expect(logBase25(b)).assertEqual(logExt25(logBase25, b));
      });
    })
}

