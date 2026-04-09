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

// 集中定义的类型、接口、类统一声明）
class Int1 {
  value: number = 0
  constructor() {}
}
class Double1 {
  value: number = 0.0
  constructor() {}
}

// 泛型类定义（基础类型约束）
class PointIntDouble<T extends Int1 | Double1> {}
abstract class AbstractPointIntDouble<T extends Int1 | Double1> {}
final class FinalPointIntDouble<T extends Int1 | Double1> {}
class PointAB<T extends "a" | "b"> {}
abstract class AbstractPointAB<T extends "a" | "b"> {}
final class FinalPointAB<T extends "a" | "b"> {}
class PointByte<T extends number> {}
abstract class AbstractPointByte<T extends number> {}
final class FinalPointByte<T extends number> {}
class PointShort<T extends number> {}
abstract class AbstractPointShort<T extends number> {}
final class FinalPointShort<T extends number> {}
class PointInt<T extends number> {}
abstract class AbstractPointInt<T extends number> {}
final class FinalPointInt<T extends number> {}
class PointLong<T extends number> {}
abstract class AbstractPointLong<T extends number> {}
final class FinalPointLong<T extends number> {}
class PointFloat<T extends number> {}
abstract class AbstractPointFloat<T extends number> {}
final class FinalPointFloat<T extends number> {}
class PointDouble<T extends number> {}
abstract class AbstractPointDouble<T extends number> {}
final class FinalPointDouble<T extends number> {}

// 派生类定义（继承抽象泛型类）
class ChildIntDouble<T extends Int1 | Double1> extends AbstractPointIntDouble<T> {}
class ChildAB<T extends "a" | "b"> extends AbstractPointAB<T> {}
class ChildByte<T extends number> extends AbstractPointByte<T> {}
class ChildShort<T extends number> extends AbstractPointShort<T> {}
class ChildInt<T extends number> extends AbstractPointInt<T> {}
class ChildLong<T extends number> extends AbstractPointLong<T> {}
class ChildFloat<T extends number> extends AbstractPointFloat<T> {}
class ChildDouble<T extends number> extends AbstractPointDouble<T> {}

// 泛型类定义（通用基础类型）
class PointNumber<T extends number> {}
abstract class AbstractPointNumber<T extends number> {}
final class FinalPointNumber<T extends number> {}
class PointBoolean<T extends boolean> {}
abstract class AbstractPointBoolean<T extends boolean> {}
final class FinalPointBoolean<T extends boolean> {}
class PointVoid<T extends void> {}
abstract class AbstractPointVoid<T extends void> {}
final class FinalPointVoid<T extends void> {}
class PointChar<T extends string> {}
abstract class AbstractPointChar<T extends string> {}
final class FinalPointChar<T extends string> {}
class PointNull<T extends null> {}
abstract class AbstractPointNull<T extends null> {}
final class FinalPointNull<T extends null> {}
class PointUndefined<T extends undefined> {}
abstract class AbstractPointUndefined<T extends undefined> {}
final class FinalPointUndefined<T extends undefined> {}
class PointIntArray<T extends Int1[]> {}
abstract class AbstractPointIntArray<T extends Int1[]> {}
final class FinalPointIntArray<T extends Int1[]> {}
class PointIntPrimitiveArray<T extends number[]> {}
abstract class AbstractPointIntPrimitiveArray<T extends number[]> {}
final class FinalPointIntPrimitiveArray<T extends number[]> {}

// Color枚举定义
enum Color {
  Red,
  Green,
  Blue
}
class PointColor<T extends Color> {}
abstract class AbstractPointColor<T extends Color> {}
final class FinalPointColor<T extends Color> {}

// 通用基础类型派生类
class ChildNumber<T extends number> extends AbstractPointNumber<T> {}
class ChildBoolean<T extends boolean> extends AbstractPointBoolean<T> {}
class ChildVoid<T extends void> extends AbstractPointVoid<T> {}
class ChildChar<T extends string> extends AbstractPointChar<T> {}
class ChildNull<T extends null> extends AbstractPointNull<T> {}
class ChildUndefined<T extends undefined> extends AbstractPointUndefined<T> {}
class ChildIntArray<T extends Int1[]> extends AbstractPointIntArray<T> {}
class ChildIntPrimitiveArray<T extends number[]> extends AbstractPointIntPrimitiveArray<T> {}
class ChildColor<T extends Color> extends AbstractPointColor<T> {}

// 接口/类型别名）
interface I1Type {}
type I1 = I1Type
interface I2Type {}
type I2 = I2Type

// 多重类型参数约束类定义
class PointObjectInt<T extends Object, Z extends number> {}
abstract class AbstractPointObjectInt<T extends Object, Z extends number> {}
final class FinalPointObjectInt<T extends Object, Z extends number> {}
class PointIntObject<T extends number, Z extends Object> {}
abstract class AbstractPointIntObject<T extends number, Z extends Object> {}
final class FinalPointIntObject<T extends number, Z extends Object> {}

// 接口定义（泛型）
interface PointIntDoubleType<T extends Int1 | Double1> {}
interface PointI1<T extends I1> {}
interface PointI1I2<T extends I1 | I2> {}
interface PointByteType<T extends number> {}
interface PointShortType<T extends number> {}

// 多重类型参数派生类
class ChildObjectInt<T extends Object, Z extends number> extends AbstractPointObjectInt<T, Z> {}
class ChildIntObject<T extends number, Z extends Object> extends AbstractPointIntObject<T, Z> {}

// 类型继承依赖相关定义统一）
class A {}
type AAlias = A
class B extends AAlias {}
type BAlias = B
class C {}
type CAlias = C
class D<T extends AAlias> {}
type DAlias<T extends AAlias> = D<T>
class E<T extends AAlias | CAlias> {}
type EAlias<T extends AAlias | CAlias> = E<T>
class D2<T, S extends T> {}
type DAlias2<T, S extends T> = D2<T, S>

// 示例测试相关定义）
class BaseType {}
type Base = BaseType
class DerivedType extends Base {}
type Derived = DerivedType
class SomeTypeType {}
type SomeType = SomeTypeType
class GType<T extends Base> {}
type G<T extends Base> = GType<T>
class HType<T extends Base | SomeType> {}
type H<T extends Base | SomeType> = HType<T>
class ExoticType<T extends "aa" | "bb"> {}
type Exotic<T extends "aa" | "bb"> = ExoticType<T>

// keyof泛型测试相关
class AType {
  f1: number = 0
  f2: string = ""
  f3: boolean = false
}
type ATypeKey = keyof AType
class BType<T extends ATypeKey> {}
type BGeneric<T extends ATypeKey> = BType<T>

// 类型参数依赖测试相关定义，避免循环依赖）
class SomeTypeCore {}
type TCore = SomeTypeCore
class TT<T> {}
class TTT<T> {}
interface X1<T extends SomeTypeCore> {}
interface X2<T extends TT<SomeTypeCore>> {}
interface X3<T extends TTT<TT<SomeTypeCore>>> {}
interface X4<T extends TT<TT<SomeTypeCore>>> {}
interface X5<T extends U, U extends SomeTypeCore> {}
interface X6<T extends U, U extends W, W extends SomeTypeCore> {}
interface X7<U extends TCore> {}
interface X8<U extends TT<TCore>> {}
interface X9<U extends TTT<TT<TCore>>> {}
interface X10<U extends TT<TT<TCore>>> {}
interface X11<U extends V, V extends TCore> {}
interface X12<U extends V, V extends W, W extends TCore> {}

class ATypeGeneric<T> {}
type AGeneric<T> = ATypeGeneric<T>

// 方法调用测试相关定义）
let res: number = 0
class ATypeWithFoo {
  foo(): void { res = 1 }
}
type AWithFoo = ATypeWithFoo
class CType<T extends AWithFoo> {
  constructor(i: T) {
    i.foo()
  }
}
type CGeneric<T extends AWithFoo> = CType<T>

class A1<T extends SomeTypeCore> {}
abstract class A2<T extends SomeTypeCore> {}
final class A3<T extends SomeTypeCore> {}
class ChildBase<T extends SomeTypeCore> extends A2<T> {}

class A1Self<T extends TT<SomeTypeCore>> {}
abstract class A2Self<T extends TT<SomeTypeCore>> {}
final class A3Self<T extends TT<SomeTypeCore>> {}
class A4Self<T extends TTT<TT<SomeTypeCore>>> {}
abstract class A5Self<T extends TTT<TT<SomeTypeCore>>> {}
final class A6Self<T extends TTT<TT<SomeTypeCore>>> {}
class A7Self<T extends TT<TT<SomeTypeCore>>> {}
abstract class A8Self<T extends TT<TT<SomeTypeCore>>> {}
final class A9Self<T extends TT<TT<SomeTypeCore>>> {}
class A10Self<T extends U, U extends SomeTypeCore> {}
abstract class A11Self<T extends U, U extends SomeTypeCore> {}
final class A12Self<T extends U, U extends SomeTypeCore> {}
class A13Self<T extends U, U extends W, W extends SomeTypeCore> {}
abstract class A14Self<T extends U, U extends W, W extends SomeTypeCore> {}
final class A15Self<T extends U, U extends W, W extends SomeTypeCore> {}
class A16Self<U extends TCore> {}
abstract class A17Self<U extends TCore> {}
final class A18Self<U extends TCore> {}
class A19Self<U extends TT<TCore>> {}
abstract class A20Self<U extends TT<TCore>> {}
final class A21Self<U extends TT<TCore>> {}
class A22Self<U extends TTT<TT<TCore>>> {}
abstract class A23Self<U extends TTT<TT<TCore>>> {}
final class A24Self<U extends TTT<TT<TCore>>> {}
class A25Self<U extends TT<TT<TCore>>> {}
abstract class A26Self<U extends TT<TT<TCore>>> {}
final class A27Self<U extends TT<TT<TCore>>> {}
class A28Self<U extends V, V extends TCore> {}
abstract class A29Self<U extends V, V extends TCore> {}
final class A30Self<U extends V, V extends TCore> {}

class Child1Self<T extends TT<SomeTypeCore>> extends A2Self<TT<SomeTypeCore>> {}
class Child2Self<T extends TTT<TT<SomeTypeCore>>> extends A5Self<TTT<TT<SomeTypeCore>>> {}
class Child3Self<T extends TT<TT<SomeTypeCore>>> extends A8Self<TT<TT<SomeTypeCore>>> {}
class Child4Self<T extends SomeTypeCore, U extends SomeTypeCore> extends A11Self<SomeTypeCore, SomeTypeCore> {}
class Child5Self<T extends SomeTypeCore, U extends SomeTypeCore, W extends SomeTypeCore> extends A14Self<SomeTypeCore, SomeTypeCore, SomeTypeCore> {}
class Child6Self<T extends TCore> extends A17Self<TCore> {}
class Child7Self<T extends TT<TCore>> extends A20Self<TT<TCore>> {}
class Child8Self<T extends TTT<TT<TCore>>> extends A23Self<TTT<TT<TCore>>> {}
class Child9Self<T extends TT<TT<TCore>>> extends A26Self<TT<TT<TCore>>> {}
class Child10Self<T extends TCore, U extends TCore> extends A29Self<TCore, TCore> {}

class A1Three<T extends U, U extends W, W extends TCore> {}
abstract class A2Three<T extends U, U extends W, W extends TCore> {}
final class A3Three<T extends U, U extends W, W extends TCore> {}
class ChildThree<T extends TCore, U extends TCore, W extends TCore> extends A2Three<TCore, TCore, TCore> {}

// 普通类定义（联合类型约束）
class CTypeFloatInt<T extends number | Int1> {} // -> Numeric
final class FinalCTypeFloatInt<T extends number | Int1> {} // -> Numeric
abstract class ACTypeFloatInt<T extends number | Int1> {} // -> Numeric
class CTypeExtends<T extends number | Int1> extends ACTypeFloatInt<T> {} // -> Numeric
class CTypeFloatNumber<T extends number> {} // -> Floating
final class FinalCTypeFloatNumber<T extends number> {} // -> Floating
abstract class ACTypeFloatNumber<T extends number> {} // -> Floating
class CTypeExtendsFloatNumber<T extends number> extends ACTypeFloatNumber<T> {} // -> Floating
class CTypeNumberNumber<T extends number> {} // -> number
class CTypeLiteralString<T extends "literal" | string> {} // -> string

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericTypeAliasConstraintTest() {
  describe("GenericTypeAliasConstraintTest", () => {
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
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0100
     * @tc.name      testGenericTypeAliasConstraintGroup0001
     * @tc.desc      Generic type alias constraint test for PointIntDouble and ChildIntDouble with Int1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointIntDouble<Int1>()
      let x2 = new ChildIntDouble<Int1>()
      expect(x1 instanceof PointIntDouble).assertTrue()
      expect(x2 instanceof AbstractPointIntDouble).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0200
     * @tc.name      testGenericTypeAliasConstraintGroup0002
     * @tc.desc      Generic type alias constraint test for FinalPointIntDouble and PointIntDouble with Double1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new FinalPointIntDouble<Int1>()
      let x2 = new PointIntDouble<Double1>()
      expect(x1 instanceof FinalPointIntDouble).assertTrue()
      expect(x2 instanceof PointIntDouble).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0300
     * @tc.name      testGenericTypeAliasConstraintGroup0003
     * @tc.desc      Generic type alias constraint test for ChildIntDouble and FinalPointIntDouble with Double1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new ChildIntDouble<Double1>()
      let x2 = new FinalPointIntDouble<Double1>()
      expect(x1 instanceof AbstractPointIntDouble).assertTrue()
      expect(x2 instanceof FinalPointIntDouble).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0400
     * @tc.name      testGenericTypeAliasConstraintGroup0004
     * @tc.desc      Generic type alias constraint test for PointAB and ChildAB with "a"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointAB<"a">()
      let x2 = new ChildAB<"a">()
      expect(x1 instanceof PointAB).assertTrue()
      expect(x2 instanceof AbstractPointAB).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0500
     * @tc.name      testGenericTypeAliasConstraintGroup0005
     * @tc.desc      Generic type alias constraint test for FinalPointAB and PointByte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new FinalPointAB<"a">()
      let x2 = new PointByte<number>()
      expect(x1 instanceof FinalPointAB).assertTrue()
      expect(x2 instanceof PointByte).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0600
     * @tc.name      testGenericTypeAliasConstraintGroup0006
     * @tc.desc      Generic type alias constraint test for ChildByte and FinalPointByte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new ChildByte<number>()
      let x2 = new FinalPointByte<number>()
      expect(x1 instanceof AbstractPointByte).assertTrue()
      expect(x2 instanceof FinalPointByte).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0700
     * @tc.name      testGenericTypeAliasConstraintGroup0007
     * @tc.desc      Generic type alias constraint test for PointShort and ChildShort
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointShort<number>()
      let x2 = new ChildShort<number>()
      expect(x1 instanceof PointShort).assertTrue()
      expect(x2 instanceof AbstractPointShort).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0800
     * @tc.name      testGenericTypeAliasConstraintGroup0008
     * @tc.desc      Generic type alias constraint test for FinalPointShort
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointShort<number>()
      expect(x instanceof FinalPointShort).assertTrue()
    });

  })
}