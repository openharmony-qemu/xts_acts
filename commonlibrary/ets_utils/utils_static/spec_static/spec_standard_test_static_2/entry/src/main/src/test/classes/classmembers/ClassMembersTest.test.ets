'use static';
/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../Util.test.ets'

class A {
  public foo(): int { return 5; }
}

class B extends A {
  public fee(): int {
    return this.foo();
  }
}

class A1 {
  static foo(): int { return 5; }
}

class B1 extends A1 {
  public fee(): int {
    return A1.foo();
  }
}

class A2 {
  protected foo(): int { return 5; }
}

class B2 extends A2 {
  public fee(): int {
    return this.foo();
  }
}

class A3 {
  public result: int = 5;
}

class B3 extends A3 {
  public fee(): int {
    return this.result;
  }
}

class A4 {
  protected result: int = 5;
}

class B4 extends A4 {
  public fee(): int {
    return this.result;
  }
}

class A5 {
  static result: int = 5;
}

class B5 extends A5 {
  public fee(): int {
    return A5.result;
  }
}

class A6 {
  i: int = 0; get val(): int { return this.i; }
}

class B6 extends A6 {
  public fee(): int {
    return this.val;
  }
}

class A7 {
  i: int = 0; set val(i: int) { this.i = i; }
}

class B7 extends A7 {
  public fee(): int {
    this.val = 1; return this.i
  }
}

interface I {
  foo(): int { return 5; }
}

class C implements I {

}

interface I1 {
  get bar(): int;
  set bar(f: int)
}

class C1 implements I1 {
  foo: int; get bar(): int { return this.foo; }; set bar(foo: int) { this.foo = foo; }
}

class C2 {
  f: int = 2;
}

class C3 {
  f: int = 3; set F(f: int) { this.f = f; }; get F(): int { return this.f; }
}

class CA {
  f: int = 0;
  constructor() {
    this.f += 1;
  }
}

class CB extends CA {
  constructor() {
    this.f += 5;
  }
}

let iteration_number = 0;

class CA1 {
  static f: int = 1;
  static {
    CA1.f += 2;
  }
}

class CB1 extends CA1 {
  static {
    CA1.f += 4;
  }
}

class A8 {
  foo: int = 2;
  static foo(): int {
    return 1;
  }
}




export default function ClassMembersTest():void {
  describe('ClassMembersTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_CLASS_MEMBERS_TEST_0100
     * @tc.name      testClassMembers0001
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: B = new B();
      expect( x.fee()).assertEqual( 5 );
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_0200
     * @tc.name      testClassMembers0002
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: B1 = new B1();
      expect( x.fee()).assertEqual( 5 );
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_0300
     * @tc.name      testClassMembers0003
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: B2 = new B2();
      expect( x.fee()).assertEqual( 5 );
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_0400
     * @tc.name      testClassMembers0004
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: B3 = new B3();
      expect( x.fee()).assertEqual( 5 );
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_0500
     * @tc.name      testClassMembers0005
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: B4 = new B4();
      expect( x.fee()).assertEqual( 5 );
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_0600
     * @tc.name      testClassMembers0006
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: B5 = new B5();
      expect( x.fee()).assertEqual( 5 );
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_0700
     * @tc.name      testClassMembers0007
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: B6 = new B6();
      expect( x.fee()).assertEqual( 0 );
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_0800
     * @tc.name      testClassMembers0008
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: B7 = new B7();
      expect( x.fee()).assertEqual( 1 );
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_0900
     * @tc.name      testClassMembers0009
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: C = new C();
      expect( x.foo() == 5).assertTrue();
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_1000
     * @tc.name      testClassMembers0010
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: C1 = new C1();
      x.foo = 3;
      expect( x.foo == 3).assertTrue();
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_1100
     * @tc.name      testClassMembers0011
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: C2 = new C2();
      expect(y.f == 2).assertTrue();
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_1200
     * @tc.name      testClassMembers0012
     * @tc.desc      class members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: C3 = new C3();
      y.F = 10;
      expect(y.F == 10).assertTrue();
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_1300
     * @tc.name      testClassMembers0013
     * @tc.desc      Constructors and class initializers are not members and are not inherited
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new CB();
      expect( a.f).assertEqual( 6 );
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_1400
     * @tc.name      testClassMembers0014
     * @tc.desc      Constructors and class initializers are not members and are not inherited
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      if (iteration_number < 1) {
        expect(CA1.f).assertEqual(3);
      } else {
        expect(CA1.f).assertEqual(7);
      }
      let a = new CB1();
      expect(CA1.f).assertEqual(7);
      iteration_number += 1;
    });

    /**
     * @tc.number    SUB_CLASS_MEMBERS_TEST_1500
     * @tc.name      testClassMembers0015
     * @tc.desc      All names in both static and non-static class declaration scopes (see Scopes) must be unique,
     * i.e., fields and methods cannot have the same name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassMembers0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A8 = new A8();
      expect( i.foo).assertEqual(2);
      expect( A8.foo()).assertEqual(1);
    });
  })
}
