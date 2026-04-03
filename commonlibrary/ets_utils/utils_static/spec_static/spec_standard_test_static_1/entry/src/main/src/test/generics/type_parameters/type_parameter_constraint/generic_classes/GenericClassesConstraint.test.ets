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
  value: number = 0
}

class Double1 {
  value: number = 0.0
}

class Byte1 {
  value: number = 0
}

class Short1 {
  value: number = 0
}

class Float1 {
  value: number = 0.0
}

class Long1 {
  value: number = 0
}

class NumberClass {
  value: number = 0
}

class BooleanClass {
  value: boolean = false
}

class StringClass {
  value: string = ""
}

// 泛型类定义
class Point<T extends Int1 | Double1> {}

final class FinalPoint<T extends Int1 | Double1> {}

class PointA<T extends "a" | "b"> {}

final class FinalPointA<T extends "a" | "b"> {}

class PointByte<T extends Byte1> {}

final class FinalPointByte<T extends Byte1> {}

class PointShort<T extends Short1> {}

final class FinalPointShort<T extends Short1> {}

class PointInt<T extends Int1> {}

final class FinalPointInt<T extends Int1> {}

class PointLong<T extends Long1> {}

final class FinalPointLong<T extends Long1> {}

class PointFloat<T extends Float1> {}

final class FinalPointFloat<T extends Float1> {}

class PointDouble<T extends Double1> {}

final class FinalPointDouble<T extends Double1> {}

class PointNumber<T extends NumberClass> {}

final class FinalPointNumber<T extends NumberClass> {}

class PointBoolean<T extends BooleanClass> {}

final class FinalPointBoolean<T extends BooleanClass> {}

class PointString<T extends StringClass> {}

final class FinalPointString<T extends StringClass> {}

// FixedArray 类型定义
type FixedArray<T> = T[]

// Color 枚举定义
enum Color { 
  Red, 
  Green, 
  Blue 
}

// 泛型类定义
class PointVoid<T extends void> {}
final class FinalPointVoid<T extends void> {}

class PointChar<T extends char> {}
final class FinalPointChar<T extends char> {}

class PointNull<T extends null> {}
final class FinalPointNull<T extends null> {}

class PointUndefined<T extends undefined> {}
final class FinalPointUndefined<T extends undefined> {}

class PointIntArray<T extends Int1[]> {}
final class FinalPointIntArray<T extends Int1[]> {}

class PointIntPrimitiveArray<T extends int[]> {}
final class FinalPointIntPrimitiveArray<T extends int[]> {}

class PointColor<T extends Color> {}
final class FinalPointColor<T extends Color> {}

class PointObjectInt<T extends Object, Z extends int> {}
final class FinalPointObjectInt<T extends Object, Z extends int> {}

class PointIntObject<T extends int, Z extends Object> {}
final class FinalPointIntObject<T extends int, Z extends Object> {}

class PointObject<T extends Object> {}
final class FinalPointObject<T extends Object> {}

// 集中定义的类型、接口、类
class A {
  foo(): number { return 1 }
}

// 泛型类定义

class PointAny<T> {}

final class FinalPointAny<T> {}


// 通用类定义
class C<T extends A> {
  constructor(i: T) {
    i.foo()
  }
}

// 全局变量用于跟踪状态
let res: number = 0

// sleep 函数紧挨在 export default function 前面
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericClassesConstraintTest() {
  describe("GenericClassesConstraintTest", () => {
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
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0100
     * @tc.name      testGenericClassesConstraint0001
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new Point<Int1>()
      expect(x instanceof Point).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0200
     * @tc.name      testGenericClassesConstraint0002
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPoint<Int1>()
      expect(x instanceof FinalPoint).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0300
     * @tc.name      testGenericClassesConstraint0003
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new Point<Double1>()
      expect(x instanceof Point).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0400
     * @tc.name      testGenericClassesConstraint0004
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPoint<Double1>()
      expect(x instanceof FinalPoint).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0500
     * @tc.name      testGenericClassesConstraint0005
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointA<"a">()
      expect(x instanceof PointA).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0600
     * @tc.name      testGenericClassesConstraint0006
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointA<"a">()
      expect(x instanceof FinalPointA).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0700
     * @tc.name      testGenericClassesConstraint0007
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointByte<Byte1>()
      expect(x instanceof PointByte).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0800
     * @tc.name      testGenericClassesConstraint0008
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointByte<Byte1>()
      expect(x instanceof FinalPointByte).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_0900
     * @tc.name      testGenericClassesConstraint0009
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointShort<Short1>()
      expect(x instanceof PointShort).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1000
     * @tc.name      testGenericClassesConstraint0010
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointShort<Short1>()
      expect(x instanceof FinalPointShort).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1100
     * @tc.name      testGenericClassesConstraint0011
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointInt<Int1>()
      expect(x instanceof PointInt).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1200
     * @tc.name      testGenericClassesConstraint0012
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointInt<Int1>()
      expect(x instanceof FinalPointInt).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1300
     * @tc.name      testGenericClassesConstraint0013
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointLong<Long1>()
      expect(x instanceof PointLong).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1400
     * @tc.name      testGenericClassesConstraint0014
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointLong<Long1>()
      expect(x instanceof FinalPointLong).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1500
     * @tc.name      testGenericClassesConstraint0015
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointFloat<Float1>()
      expect(x instanceof PointFloat).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1600
     * @tc.name      testGenericClassesConstraint0016
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointFloat<Float1>()
      expect(x instanceof FinalPointFloat).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1700
     * @tc.name      testGenericClassesConstraint0017
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointDouble<Double1>()
      expect(x instanceof PointDouble).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1800
     * @tc.name      testGenericClassesConstraint0018
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointDouble<Double1>()
      expect(x instanceof FinalPointDouble).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_1900
     * @tc.name      testGenericClassesConstraint0019
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointNumber<NumberClass>()
      expect(x instanceof PointNumber).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2000
     * @tc.name      testGenericClassesConstraint0020
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointNumber<NumberClass>()
      expect(x instanceof FinalPointNumber).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2100
     * @tc.name      testGenericClassesConstraint0021
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointBoolean<BooleanClass>()
      expect(x instanceof PointBoolean).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2200
     * @tc.name      testGenericClassesConstraint0022
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointBoolean<BooleanClass>()
      expect(x instanceof FinalPointBoolean).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2300
     * @tc.name      testGenericClassesConstraint0023
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointString<StringClass>()
      expect(x instanceof PointString).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2400
     * @tc.name      testGenericClassesConstraint0024
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointString<StringClass>()
      expect(x instanceof FinalPointString).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2500
     * @tc.name      testGenericClassesConstraint0025
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointVoid<void>()
      expect(x instanceof PointVoid).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2600
     * @tc.name      testGenericClassesConstraint0026
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointVoid<void>()
      expect(x instanceof FinalPointVoid).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2700
     * @tc.name      testGenericClassesConstraint0027
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointVoid<undefined>()
      expect(x instanceof PointVoid).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2800
     * @tc.name      testGenericClassesConstraint0028
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointVoid<undefined>()
      expect(x instanceof FinalPointVoid).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_2900
     * @tc.name      testGenericClassesConstraint0029
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointChar<char>()
      expect(x instanceof PointChar).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3000
     * @tc.name      testGenericClassesConstraint0030
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointChar<char>()
      expect(x instanceof FinalPointChar).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3100
     * @tc.name      testGenericClassesConstraint0031
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointNull<null>()
      expect(x instanceof PointNull).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3200
     * @tc.name      testGenericClassesConstraint0032
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointNull<null>()
      expect(x instanceof FinalPointNull).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3300
     * @tc.name      testGenericClassesConstraint0033
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointUndefined<undefined>()
      expect(x instanceof PointUndefined).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3400
     * @tc.name      testGenericClassesConstraint0034
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointUndefined<undefined>()
      expect(x instanceof FinalPointUndefined).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3500
     * @tc.name      testGenericClassesConstraint0035
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointIntArray<Int1[]>()
      expect(x instanceof PointIntArray).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3600
     * @tc.name      testGenericClassesConstraint0036
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointIntArray<Int1[]>()
      expect(x instanceof FinalPointIntArray).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3700
     * @tc.name      testGenericClassesConstraint0037
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointIntPrimitiveArray<int[]>()
      expect(x instanceof PointIntPrimitiveArray).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3800
     * @tc.name      testGenericClassesConstraint0038
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointIntPrimitiveArray<int[]>()
      expect(x instanceof FinalPointIntPrimitiveArray).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_3900
     * @tc.name      testGenericClassesConstraint0039
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointColor<Color>()
      expect(x instanceof PointColor).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_4000
     * @tc.name      testGenericClassesConstraint0040
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointColor<Color>()
      expect(x instanceof FinalPointColor).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_4100
     * @tc.name      testGenericClassesConstraint0041
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointObjectInt<Object, int>()
      expect(x instanceof PointObjectInt).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_4200
     * @tc.name      testGenericClassesConstraint0042
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointObjectInt<Object, int>()
      expect(x instanceof FinalPointObjectInt).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_4300
     * @tc.name      testGenericClassesConstraint0043
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointIntObject<int, Object>()
      expect(x instanceof PointIntObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_4400
     * @tc.name      testGenericClassesConstraint0044
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointIntObject<int, Object>()
      expect(x instanceof FinalPointIntObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_4500
     * @tc.name      testGenericClassesConstraint0045
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointObject<Object>()
      expect(x instanceof PointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_4600
     * @tc.name      testGenericClassesConstraint0046
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointObject<Object>()
      expect(x instanceof FinalPointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_4700
     * @tc.name      testGenericClassesConstraint0047
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointObject<string>()
      expect(x instanceof PointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_4800
     * @tc.name      testGenericClassesConstraint0048
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointObject<string>()
      expect(x instanceof FinalPointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_4900
     * @tc.name      testGenericClassesConstraint0049
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointObject<number>()
      expect(x instanceof PointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_5000
     * @tc.name      testGenericClassesConstraint0050
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointObject<number>()
      expect(x instanceof FinalPointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_5100
     * @tc.name      testGenericClassesConstraint0051
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointObject<Array<int>>()
      expect(x instanceof PointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_5200
     * @tc.name      testGenericClassesConstraint0052
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointObject<Array<int>>()
      expect(x instanceof FinalPointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_5300
     * @tc.name      testGenericClassesConstraint0053
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointObject<FixedArray<string>>()
      expect(x instanceof PointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_5400
     * @tc.name      testGenericClassesConstraint0054
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointObject<FixedArray<string>>()
      expect(x instanceof FinalPointObject).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_5500
     * @tc.name      testGenericClassesConstraint0055
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointAny<Any>()
      expect(x instanceof PointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_5600
     * @tc.name      testGenericClassesConstraint0056
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointAny<Any>()
      expect(x instanceof FinalPointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_5700
     * @tc.name      testGenericClassesConstraint0057
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointAny<Object>()
      expect(x instanceof PointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_5800
     * @tc.name      testGenericClassesConstraint0058
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointAny<Object>()
      expect(x instanceof FinalPointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_5900
     * @tc.name      testGenericClassesConstraint0059
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointAny<Object | undefined>()
      expect(x instanceof PointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_6000
     * @tc.name      testGenericClassesConstraint0060
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointAny<Object | undefined>()
      expect(x instanceof FinalPointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_6100
     * @tc.name      testGenericClassesConstraint0061
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointAny<Object | null>()
      expect(x instanceof PointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_6200
     * @tc.name      testGenericClassesConstraint0062
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointAny<Object | null>()
      expect(x instanceof FinalPointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_6300
     * @tc.name      testGenericClassesConstraint0063
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new PointAny<Object | undefined | null>()
      expect(x instanceof PointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_6400
     * @tc.name      testGenericClassesConstraint0064
     * @tc.desc      If possible instantiations need to be constrained, then an individual constraint
     *               can be set for each type parameter after the keyword extends. A constraint can have
     *               the form of any type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointAny<Object | undefined | null>()
      expect(x instanceof FinalPointAny).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_CLASSES_CONSTRAINT_6500
     * @tc.name      testGenericClassesConstraint0065
     * @tc.desc      If no constraint is specified, then type parameter is not compatible with Object,
     *               and has no methods or fields available for use. Lack of constraint effectively means
     *               extends Object|null|undefined. If the constraint S is a non-nullish type (see Nullish
     *               Types), then T is also non-nullish.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesConstraint0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res = 0
      new C<A>(new A())
      expect(res).assertEqual(0)
    });
  })
}