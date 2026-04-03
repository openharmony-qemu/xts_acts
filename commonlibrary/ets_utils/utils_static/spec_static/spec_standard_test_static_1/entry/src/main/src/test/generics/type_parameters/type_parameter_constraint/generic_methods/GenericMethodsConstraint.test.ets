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
class Double1 {
  value: double = 0.0
  constructor() {}
}

// 泛型类定义
class PointIntOrDouble {
  static foo<X extends Int1 | Double1>(i: X): X { return i }
  foo<X extends Int1 | Double1>(i: X): X { return i }
}

class PointAOrB {
  static foo<X extends "a" | "b">(i: X): X { return i }
  foo<X extends "a" | "b">(i: X): X { return i }
}

class PointByte {
  static foo<X extends byte>(i: X): X { return i }
  foo<X extends byte>(i: X): X { return i }
}

class PointShort {
  static foo<X extends short>(i: X): X { return i }
  foo<X extends short>(i: X): X { return i }
}

class PointInt {
  static foo<X extends int>(i: X): X { return i }
  foo<X extends int>(i: X): X { return i }
}

class PointLong {
  static foo<X extends long>(i: X): X { return i }
  foo<X extends long>(i: X): X { return i }
}

class PointFloat {
  static foo<X extends float>(i: X): X { return i }
  foo<X extends float>(i: X): X { return i }
}

class PointDouble {
  static foo<X extends double>(i: X): X { return i }
  foo<X extends double>(i: X): X { return i }
}

class PointNumber {
  static foo<X extends number>(i: X): X { return i }
  foo<X extends number>(i: X): X { return i }
}

class PointBoolean {
  static foo<X extends boolean>(i: X): X { return i }
  foo<X extends boolean>(i: X): X { return i }
}

class PointChar {
  static foo<X extends char>(i: X): X { return i }
  foo<X extends char>(i: X): X { return i }
}

class PointNull {
  static foo<X extends null>(i: X): X { return i }
  foo<X extends null>(i: X): X { return i }
}

// 集中定义的类型、接口、类
class Int1 {
  value: int = 0
  constructor() {}
}

// Color 枚举定义
enum Color { 
  Red, 
  Green, 
  Blue 
}

// 泛型类定义
class PointUndefined {
  static foo<X extends undefined>(i: X): X { return i }
  foo<X extends undefined>(i: X): X { return i }
}

class PointIntArray {
  static foo<X extends Int1[]>(i: X): X { return i }
  foo<X extends Int1[]>(i: X): X { return i }
}

class PointIntPrimitiveArray {
  static foo<X extends int[]>(i: X): X { return i }
  foo<X extends int[]>(i: X): X { return i }
}

class PointColor {
  static foo<X extends Color>(i: X): X { return i }
  foo<X extends Color>(i: X): X { return i }
}

class PointObjectInt {
  static foo<X extends Object, Z extends int>(i: X, j: Z): X { return i }
  foo<X extends Object, Z extends int>(i: X, j: Z): X { return i }
}

class PointIntObject {
  static foo<X extends int, Z extends Object>(i: X, j: Z): X { return i }
  foo<X extends int, Z extends Object>(i: X, j: Z): X { return i }
}

// sleep 函数紧挨在 export default function 前面
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericMethodsConstraintTest_Continue() {
  describe("GenericMethodsConstraintTest_Continue", () => {
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
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_0100
     * @tc.name      testGenericMethodsConstraint0001
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Int1()
      let result = PointIntOrDouble.foo<Int1>(a)
      expect(result instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_0200
     * @tc.name      testGenericMethodsConstraint0002
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Int1()
      let result = new PointIntOrDouble().foo<Int1>(a)
      expect(result instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_0300
     * @tc.name      testGenericMethodsConstraint0003
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Double1()
      let result = PointIntOrDouble.foo<Double1>(a)
      expect(result instanceof Double1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_0400
     * @tc.name      testGenericMethodsConstraint0004
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Double1()
      let result = new PointIntOrDouble().foo<Double1>(a)
      expect(result instanceof Double1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_0500
     * @tc.name      testGenericMethodsConstraint0005
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointAOrB.foo<"a">("a")
      expect(result).assertEqual("a")
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_0600
     * @tc.name      testGenericMethodsConstraint0006
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointAOrB().foo<"a">("a")
      expect(result).assertEqual("a")
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_0700
     * @tc.name      testGenericMethodsConstraint0007
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointByte.foo<byte>(1 as byte)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_0800
     * @tc.name      testGenericMethodsConstraint0008
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointByte().foo<byte>(1 as byte)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_0900
     * @tc.name      testGenericMethodsConstraint0009
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointShort.foo<short>(1 as short)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_1000
     * @tc.name      testGenericMethodsConstraint0010
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointShort().foo<short>(1 as short)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_1100
     * @tc.name      testGenericMethodsConstraint0011
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointInt.foo<int>(1 as int)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_1200
     * @tc.name      testGenericMethodsConstraint0012
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointInt().foo<int>(1 as int)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_1300
     * @tc.name      testGenericMethodsConstraint0013
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointLong.foo<long>(1 as long)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_1400
     * @tc.name      testGenericMethodsConstraint0014
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointLong().foo<long>(1 as long)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_1500
     * @tc.name      testGenericMethodsConstraint0015
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointFloat.foo<float>(1.1f)
      expect(result.toString()).assertEqual("1.1")
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_1600
     * @tc.name      testGenericMethodsConstraint0016
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointFloat().foo<float>(1.1f)
      expect(result.toString()).assertEqual("1.1")
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_1700
     * @tc.name      testGenericMethodsConstraint0017
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointDouble.foo<double>(1.2 as double)
      expect(result).assertEqual(1.2)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_1800
     * @tc.name      testGenericMethodsConstraint0018
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointDouble().foo<double>(1.2 as double)
      expect(result).assertEqual(1.2)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_1900
     * @tc.name      testGenericMethodsConstraint0019
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointDouble.foo<number>(1.3 as number)
      expect(result).assertEqual(1.3)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_2000
     * @tc.name      testGenericMethodsConstraint0020
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointDouble().foo<number>(1.3 as number)
      expect(result).assertEqual(1.3)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_2100
     * @tc.name      testGenericMethodsConstraint0021
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointNumber.foo<double>(1.4 as double)
      expect(result).assertEqual(1.4)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_2200
     * @tc.name      testGenericMethodsConstraint0022
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointNumber().foo<double>(1.4 as double)
      expect(result).assertEqual(1.4)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_2300
     * @tc.name      testGenericMethodsConstraint0023
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointNumber.foo<number>(1.5 as number)
      expect(result).assertEqual(1.5)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_2400
     * @tc.name      testGenericMethodsConstraint0024
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointNumber().foo<number>(1.5 as number)
      expect(result).assertEqual(1.5)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_2500
     * @tc.name      testGenericMethodsConstraint0025
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointBoolean.foo<boolean>(true)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_2600
     * @tc.name      testGenericMethodsConstraint0026
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointBoolean().foo<boolean>(true)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_2700
     * @tc.name      testGenericMethodsConstraint0027
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointChar.foo<char>(c'V')
      expect(result.toString()).assertEqual("V")
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_2800
     * @tc.name      testGenericMethodsConstraint0028
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointChar().foo<char>(c'V')
      expect(result.toString()).assertEqual("V")
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_2900
     * @tc.name      testGenericMethodsConstraint0029
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointNull.foo<null>(null)
      expect(result).assertNull()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_3000
     * @tc.name      testGenericMethodsConstraint0030
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointNull().foo<null>(null)
      expect(result).assertNull()
    });
    
    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_3100
     * @tc.name      testGenericMethodsConstraint0031
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointUndefined.foo<undefined>(undefined)
      expect(result).assertUndefined()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_3200
     * @tc.name      testGenericMethodsConstraint0032
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointUndefined().foo<undefined>(undefined)
      expect(result).assertUndefined()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_3300
     * @tc.name      testGenericMethodsConstraint0033
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [new Int1()]
      let result = PointIntArray.foo<Int1[]>(a)
      expect(result[0] instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_3400
     * @tc.name      testGenericMethodsConstraint0034
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [new Int1()]
      let result = new PointIntArray().foo<Int1[]>(a)
      expect(result[0] instanceof Int1).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_3500
     * @tc.name      testGenericMethodsConstraint0035
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = [1 as int]
      let result = PointIntPrimitiveArray.foo<int[]>(i)
      expect(result[0]).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_3600
     * @tc.name      testGenericMethodsConstraint0036
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = [1 as int]
      let result = new PointIntPrimitiveArray().foo<int[]>(i)
      expect(result[0]).assertEqual(1)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_3700
     * @tc.name      testGenericMethodsConstraint0037
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointColor.foo<Color>(Color.Red)
      expect(result).assertEqual(Color.Red)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_3800
     * @tc.name      testGenericMethodsConstraint0038
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointColor().foo<Color>(Color.Red)
      expect(result).assertEqual(Color.Red)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_3900
     * @tc.name      testGenericMethodsConstraint0039
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter. A constraint of any type parameter can follow
     *               the keyword extends. The constraint is denoted as any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Object()
      let result = PointObjectInt.foo<Object, int>(a, 1 as int)
      expect(result instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_4000
     * @tc.name      testGenericMethodsConstraint0040
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter. A constraint of any type parameter can follow
     *               the keyword extends. The constraint is denoted as any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Object()
      let result = new PointObjectInt().foo<Object, int>(a, 1 as int)
      expect(result instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_4100
     * @tc.name      testGenericMethodsConstraint0041
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter. A constraint of any type parameter can follow
     *               the keyword extends. The constraint is denoted as any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = PointIntObject.foo<int, Object>(2 as int, new Object())
      expect(result).assertEqual(2)
    });

    /**
     * @tc.number    SUB_GENERIC_METHODS_CONSTRAIN_4200
     * @tc.name      testGenericMethodsConstraint0042
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter. A constraint of any type parameter can follow
     *               the keyword extends. The constraint is denoted as any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericMethodsConstraint0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new PointIntObject().foo<int, Object>(2 as int, new Object())
      expect(result).assertEqual(2)
    });
  })
}