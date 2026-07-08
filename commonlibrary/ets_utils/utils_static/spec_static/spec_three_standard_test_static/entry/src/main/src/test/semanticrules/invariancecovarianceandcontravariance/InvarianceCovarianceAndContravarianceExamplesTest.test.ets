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



class Base1 {
  methodThree1(p: Base1): Base1 {
    return p;
  }
}

class Derived1 extends Base1 {
  override methodThree1(p: Base1): Base1 {
    return p;
  }
}

class Base2 {
  methodThree(p: Base2): Base2 {
    return p;
  }
}

class Derived2 extends Base2 {
  override methodThree(p: Base2): Base2 {
    return p;
  }
}

class Base3 {
  methodOne(p: Base3): Base3 {
    return p;
  }
}

class Derived3 extends Base3 {
  override methodOne(p: Base3): Base3 {
    return p;
  }
}

class Base5 {
  methodOne(p: Base5): Base5 {
    return p;
  }
}

class Derived5 extends Base5 {
  override methodOne(p: Base5): Base5 {
    return p;
  }
}

class Base6 {
  methodOne(p: Base6): Base6 {
    return p;
  }
}

class Derived6 extends Base6 {
  override methodOne(p: Base6): Base6 {
    return p;
  }
}

interface IBase7 {
  methodOne(p: IBase7): IBase7;
}

class Base7 implements IBase7 {
  methodOne(p: IBase7): IBase7 {
    return p;
  }
}

class Derived7 extends Base7 {
  override methodOne(p: IBase7): IBase7 {
    return p;
  }
}

class Base10 {
  methodOne(p: Base10): Base10 {
    return p;
  }
}

class Derived10 extends Base10 {
  override methodOne(p: Base10): Base10 {
    return p;
  }
}

class Base11 {
  methodOne(p: Base11): Base11 {
    return p;
  }
}

class Derived11 extends Base11 {
  override methodOne(p: Base11): Base11 {
    return p;
  }
}

interface IBase15 {
  methodOne(p: IBase15): IBase15;
}

class Base15 implements IBase15{
  methodOne(p: IBase15): IBase15 {
    return p;
  }
}

class Derived15 extends Base15 {
  override methodOne(p: IBase15): IBase15 {
    return p;
  }
}

class Base18 {
  methodOne(p: Base18): Base18 {
    return p;
  }
}

class Derived18 extends Base18 {
  override methodOne(p: Base18): Base18 {
    return p;
  }
}

interface IBase19 {
  methodOne(p: IBase19): IBase19;
}

class Base19 implements IBase19 {
  methodOne(p: IBase19): IBase19 {
    return p;
  }
}

class Derived19 extends Base19 {
  override methodOne(p: IBase19): IBase19 {
    return p;
  }
}

interface IBase22 {
  methodOne(p: IBase22): IBase22;
}

class Base22 implements IBase22 {
  methodOne(p: IBase22): IBase22 {
    return p;
  }
}

class Derived22 extends Base22 {
  override methodOne(p: IBase22): IBase22 {
    return p;
  }
}

export default function InvarianceCovarianceAndContravarianceExamplesTest(): void {
  describe('InvarianceCovarianceAndContravarianceExamplesTest', () => {
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
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_0100
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0001
     * @tc.desc      Ensuring that method_one in subclasses keeps parameter and return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {


      let a = new Base1();
      let b = new Derived1();

      let resultA = a.methodThree1(a);
      let resultB = b.methodThree1(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_0200
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0002
     * @tc.desc      Ensuring that method_one in subclasses keeps parameter and return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

      let a = new Base2();
      let b = new Derived2();

      let resultA = a.methodThree(a);
      let resultB = b.methodThree(a);

      expect(resultA).assertEqual(resultB);
      });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_0300
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0003
     * @tc.desc      Ensuring that method_one in subclasses allows contravariant parameter types
                     with derived class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

      let a = new Base3();
      let b = new Derived3();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
      });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_0400
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0004
     * @tc.desc      Ensuring that method_one in subclasses does not allow contravariant parameter
                     types with base class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

      let a = new Base5();
      let b = new Derived5();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(b);

        expect(resultA).assertEqual(a);
        expect(resultB).assertEqual(b);
      });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_0500
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0005
     * @tc.desc      Ensuring that method_one in subclasses does not allow covariant parameter types
                     with derived class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

      let a = new Base6();
      let b = new Derived6();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(b);

        expect(resultA).assertEqual(a);
        expect(resultB).assertEqual(b);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_0600
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0006
     * @tc.desc      Ensuring that method_one in subclasses does not allow covariant parameter types
    with derived class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

      let a = new Base7();
      let b = new Derived7();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });


    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_0700
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0007
     * @tc.desc      Ensuring that method_one in subclasses keeps parameter and return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

      let a = new Base10();
      let b = new Derived10();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
      });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_0800
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0008
     * @tc.desc      Ensuring that method_one in subclasses keeps parameter types unchanged with
                     derived class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

      let a = new Base11();
      let b = new Derived11();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_0900
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0009
     * @tc.desc      Ensuring that method_one in subclasses allows contravariant parameter types
                     with interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
     ;
      let a = new Base15();
      let b = new Derived15();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_1000
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0010
     * @tc.desc      Ensuring that method_one in subclasses does not allow covariant parameter types
                     with base class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

      let a = new Base18();
      let b = new Derived18();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_1100
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0011
     * @tc.desc      Ensuring that method_one in subclasses does not allow covariant parameter types
                     with interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let a = new Base19();
        let b = new Derived19();

        let resultA = a.methodOne(a);
        let resultB = b.methodOne(a);

        expect(resultA).assertEqual(resultB);
      });

    /**
     * @tc.number    SUB_INVARIANCE_COVARIANCE_AND_CONTRAVARIANCE_EXAMPLE_1200
     * @tc.name      testInvarianceCovarianceAndContravarianceExamples0012
     * @tc.desc      Ensuring that method_one in subclasses keeps parameter and return types unchanged
                     with interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInvarianceCovarianceAndContravarianceExamples0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      let a = new Base22();
      let b = new Derived22();

      let resultA = a.methodOne(a);
      let resultB = b.methodOne(a);

      expect(resultA).assertEqual(resultB);
    });
    })
}