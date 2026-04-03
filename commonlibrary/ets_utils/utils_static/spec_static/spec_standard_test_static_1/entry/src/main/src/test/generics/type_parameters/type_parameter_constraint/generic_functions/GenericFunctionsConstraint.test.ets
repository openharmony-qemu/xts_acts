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
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level,
  expect
} from "../../../../../../../hypium"


// 集中定义的类型、接口、类
class Int1 {
  value: int = 0
  constructor() {}
}

class Double1 {
  value: double = 0.0
  constructor() {}
}

// 泛型函数约束测试相关定义
// 函数定义
function foo1<T extends Int1 | Double1>(p: T): T {
  return p
}

function foo2<T extends "a" | "b">(p: T): T {
  return p
}

function foo3<T extends byte>(p: T): T {
  return p
}

function foo4<T extends short>(p: T): T {
  return p
}

function foo5<T extends int>(p: T): T {
  return p
}

function foo6<T extends long>(p: T): T {
  return p
}

function foo7<T extends float>(p: T): T {
  return p
}

function foo8<T extends double>(p: T): T {
  return p
}

function foo9<T extends number>(p: T): T {
  return p
}

function foo10<T extends boolean>(p: T): T {
  return p
}

function foo11<T extends char>(p: T): T {
  return p
}

function foo12<T extends null>(p: T): T {
  return p
}

function foo13<T extends undefined>(p: T): T {
  return p
}

function foo14<T extends void>(p: T): T {
  return p
}

function foo15<T extends Object>(p: T): T {
  return p
}

// 箭头函数定义
function arrowFoo1<T extends Int1 | Double1>(p: T): T {
  return p;
}

function arrowFoo2<T extends "a" | "b">(p: T): T {
  return p;
}

function arrowFoo3<T extends byte>(p: T): T {
  return p;
}


// 函数表达式定义
function exprFoo1<T extends Int1 | Double1>(p: T): T {
  return p;
}

function exprFoo2<T extends "a" | "b">(p: T): T {
  return p;
}

function exprFoo3<T extends byte>(p: T): T {
  return p;
}

// sleep 函数紧挨在 export default function 前面
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericFunctionsConstraintTest() {
  describe("GenericFunctionsConstraintTest", () => {
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
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0100
     * @tc.name      testGenericFunctionsConstraint0001
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo1<Int1>(new Int1())
      expect(result instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0200
     * @tc.name      testGenericFunctionsConstraint0002
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo1<Double1>(new Double1())
      expect(result instanceof Double1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0300
     * @tc.name      testGenericFunctionsConstraint0003
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo2<"a">("a")
      expect(result).assertEqual("a")
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0400
     * @tc.name      testGenericFunctionsConstraint0004
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo2<"b">("b")
      expect(result).assertEqual("b")
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0500
     * @tc.name      testGenericFunctionsConstraint0005
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo3<byte>(1 as byte)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0600
     * @tc.name      testGenericFunctionsConstraint0006
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo4<short>(1 as short)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0700
     * @tc.name      testGenericFunctionsConstraint0007
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo5<int>(1 as int)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0800
     * @tc.name      testGenericFunctionsConstraint0008
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo6<long>(1 as long)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_0900
     * @tc.name      testGenericFunctionsConstraint0009
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo7<float>(1.1f)
      expect(result.toString()).assertEqual("1.1")
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_1000
     * @tc.name      testGenericFunctionsConstraint0010
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo8<double>(1.2 as double)
      expect(result).assertEqual(1.2)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_1100
     * @tc.name      testGenericFunctionsConstraint0011
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo9<number>(1.3 as number)
      expect(result).assertEqual(1.3)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_1200
     * @tc.name      testGenericFunctionsConstraint0012
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo10<boolean>(true)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_1300
     * @tc.name      testGenericFunctionsConstraint0013
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo11<char>(c'V')
      expect(result.toString()).assertEqual("V")
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_1400
     * @tc.name      testGenericFunctionsConstraint0014
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo12<null>(null)
      expect(result).assertNull()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_1500
     * @tc.name      testGenericFunctionsConstraint0015
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo13<undefined>(undefined)
      expect(result).assertUndefined()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_1600
     * @tc.name      testGenericFunctionsConstraint0016
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Int1()
      let result = foo15<Int1>(obj)
      expect(result instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_1700
     * @tc.name      testGenericFunctionsConstraint0017
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = arrowFoo1<Int1>(new Int1())
      expect(result instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_1800
     * @tc.name      testGenericFunctionsConstraint0018
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = arrowFoo1<Double1>(new Double1())
      expect(result instanceof Double1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_1900
     * @tc.name      testGenericFunctionsConstraint0019
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = arrowFoo2<"a">("a")
      expect(result).assertEqual("a")
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_2000
     * @tc.name      testGenericFunctionsConstraint0020
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = arrowFoo3<byte>(1 as byte)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_2100
     * @tc.name      testGenericFunctionsConstraint0021
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = exprFoo1<Int1>(new Int1())
      expect(result instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_2200
     * @tc.name      testGenericFunctionsConstraint0022
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = exprFoo1<Double1>(new Double1())
      expect(result instanceof Double1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_2300
     * @tc.name      testGenericFunctionsConstraint0023
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = exprFoo2<"a">("a")
      expect(result).assertEqual("a")
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_2400
     * @tc.name      testGenericFunctionsConstraint0024
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = exprFoo2<"b">("b")
      expect(result).assertEqual("b")
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_2500
     * @tc.name      testGenericFunctionsConstraint0025
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = exprFoo3<byte>(1 as byte)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_2600
     * @tc.name      testGenericFunctionsConstraint0026
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo8<double>(1.2 as double)
      expect(result).assertEqual(1.2)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_2700
     * @tc.name      testGenericFunctionsConstraint0027
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo8<number>(1.3 as number)
      expect(result).assertEqual(1.3)
    });

    /**
     * @tc.number    SUB_GENERIC_FUNCTIONS_CONSTRAINT_2800
     * @tc.name      testGenericFunctionsConstraint0028
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericFunctionsConstraint0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo9<double>(1.4 as double)
      expect(result).assertEqual(1.4)
    });
  })
}