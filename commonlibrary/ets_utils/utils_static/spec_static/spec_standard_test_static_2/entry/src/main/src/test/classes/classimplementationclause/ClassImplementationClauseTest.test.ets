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
import Utils from '../../Util.test'

interface I {
  foo(): int {
  return 1
}
}

abstract class A implements I {}

class C extends A {}

interface I1 {
  foo(): int {
  return 1
}
}

abstract class A1 implements I1 {
  foo(): int {
    return 2
  }
}

class C1 extends A1 {}

final class A2 implements C2, B {
  override foo(): int {
    return 5;
  }

  override bar(): int {
    return 10;
  }
}

interface B {
  bar(): int;
}

interface C2 {
  foo(): int;
}

final class A3 implements C3 {
  override foo(): int {
    return 5;
  }
}

interface C3 {
  foo(): int;
}

class A4 {
  final foo(): int {
    return 5;
  }

  final bar(): int {
    return 10;
  }
}

final class D extends A4 implements B1, C4 {
}

interface B1 {
  bar(): int;
}

interface C4 {
  foo(): int;
}

interface A5 {
  foo(): int {
  return 5;
}

bar(): int {
  return 10;
}
}

final class D1 implements A5, B2, C5 {
}

interface B2 {
  bar(): int;
}

interface C5 {
  foo(): int;
}

class A6 implements C6 {
  public override foo(): int {
    return 10;
  }
}

interface C6 {
  foo(): int {
  return 5;
 };
}

interface C7 {
  foo(): int {
  return 5;
};
bar(): int {
  return 6;
}
}

class A7 implements C7 {
  bar(): int {
    return 7;
  }
}

export default function ClassImplementationClauseTest():void {
  describe('ClassImplementationClauseTest', () => {
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
     * @tc.number    SUB_CLASS_IMPLEMENTATION_CLAUSETEST_0100
     * @tc.name      testClassImplementationClause0001
     * @tc.desc      Abstract class inherits default method from superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassImplementationClause0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C().foo()).assertEqual(1)
    });


    /**
     * @tc.number    SUB_CLASS_IMPLEMENTATION_CLAUSETEST_0200
     * @tc.name      testClassImplementationClause0002
     * @tc.desc      Abstract class overrides default method of the superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassImplementationClause0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C1().foo()).assertEqual(2)
    });

    /**
     * @tc.number    SUB_CLASS_IMPLEMENTATION_CLAUSETEST_0300
     * @tc.name      testClassImplementationClause0003
     * @tc.desc      Abstract class overrides default method of the superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassImplementationClause0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I1 = new C1()
      expect(i.foo()).assertEqual(2)
    });

    /**
     * @tc.number    SUB_CLASS_IMPLEMENTATION_CLAUSETEST_0400
     * @tc.name      testClassImplementationClause0004
     * @tc.desc      Class overrides abstract methods from superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassImplementationClause0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: A2 = new A2();
      let b: A2 = new A2();
      expect(c.foo()).assertEqual(5);
      expect(b.bar()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_CLASS_IMPLEMENTATION_CLAUSETEST_0500
     * @tc.name      testClassImplementationClause0005
     * @tc.desc      Class overrides abstract methods from superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassImplementationClause0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A3 = new A3();
      expect(a.foo()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLASS_IMPLEMENTATION_CLAUSETEST_0600
     * @tc.name      testClassImplementationClause0006
     * @tc.desc      Class overrides abstract methods from superinterface by inheritance them from superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassImplementationClause0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: D = new D();
      let b: D = new D();
      expect(c.foo()).assertEqual(5);
      expect(b.bar()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_CLASS_IMPLEMENTATION_CLAUSETEST_0700
     * @tc.name      testClassImplementationClause0007
     * @tc.desc      Class overrides abstract methods from superinterface by inheritance them from superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassImplementationClause0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C5 = new D1();
      let b: B2 = new D1();
      expect(c.foo()).assertEqual(5);
      expect(b.bar()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_CLASS_IMPLEMENTATION_CLAUSETEST_0800
     * @tc.name      testClassImplementationClause0008
     * @tc.desc      Override default method from superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassImplementationClause0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A6 = new A6()

      expect(a.foo()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_CLASS_IMPLEMENTATION_CLAUSETEST_0900
     * @tc.name      testClassImplementationClause0009
     * @tc.desc      Override default method from superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassImplementationClause0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A7 = new A7();
      expect(a.foo()).assertEqual(5);
      expect(a.bar()).assertEqual(7);
    });
  })
}