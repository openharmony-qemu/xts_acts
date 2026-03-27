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
} from "../../../../../../hypium"


//  (从所有30)
class Cls_0<T, U> {
    a: T
    b: U
    constructor(a: T, b: U) {
        this.a = a
        this.b = b
    }
}

class Cls_1<T, U> {
    a: [T, U]
    constructor(a: T, b: U) {
        this.a = [a, b]
    }
}

class A_2<T>{
    a: T
    constructor(a: T) {
        this.a = a
    }
}

class B_2<T, U> extends A_2<T>{
    b: U
    constructor(a: T, b: U) {
        super(a)
        this.b = b
    }
}

class Cls_3<T> {
    a: T
    constructor(a: T) {
        this.a = a
    }
}

class Cls_4<T> {
    a: T
    constructor(a: T) {
        this.a = a
    }
}

class Cls_5<T> {
    a: T
    constructor(a: T) {
        this.a = a
    }
}

class Cls_6<T> {
    a: T
    constructor(a: T) {
        this.a = a
    }
}

class Cls_7<T> {
    a: T
    constructor(a: T) {
        this.a = a
    }
}

class Cls_8<T> {
    a: T
    constructor(a: T) {
        this.a = a
    }
}
function foo_8(): number { return 1 }

class Cls_9<T> {
    a: T
    constructor(a: T) {
        this.a = a
    }
}

class Cls_10<T> {
    a: T
    constructor(a: T) {
        this.a = a
    }
}

class Cls_11<T> {
    a: T
    constructor(a: T) {
        this.a = a
    }
}

interface I_12<T, U> {
    a: T
    b: U
}

// 函数定义
// no constraints
function foo_13<T, U>(p: T, q: U): [T, U] {
    return [p, q]
}

// no constraints, union
function foo_14<T, U>(p: T, q: U): T|U {
    return (p! as object).toString() > (q! as object).toString() ? p : q
}

function bar_15<T>(p: T): Array<T> {
    let x = Array<T>(5)
    return x.fill(p)
}
// no constraints
function foo_15<T, U>(p: T, q: U): [Array<T>, Array<U>] {
    return [bar_15(p), bar_15(q)]
}

class A_16 {}
class B_16 extends A_16 {}
// with class type constraints
function foo_16<T extends U, U extends Object>(p: T, q: U): boolean {
    return p.toString() + q.toString() > ""
}

class A_17 {}
class B_17 extends A_17 {}
class C_17 extends A_17 {}
// with union type constraints
function foo_17<T extends B_17|C_17, U extends number|never|B_17|null|boolean>(p: T, q: U): boolean {
    return "" + p + q > ""
}

// no constraints
function foo_18<T, U>(p: T, q: U): [T, U] {
    return [p, q]
}

// no constraints
function foo_19<T, U>(p: T, q: U): [T, U] {
    return [p, q]
}

// no constraints
function foo_20<T, U>(p: T, q: U): [T, U] {
    return [p, q]
}

function foo_21<T>(p: T): T {
    return p
}

function foo_22<T>(p: T): T {
    return p
}

function foo_23<T>(p: T): T {
    return p
}

function foo_24<T>(p: T): T {
    return p
}

function foo_25<T>(p: T): T {
    return p
}

function foo1_26(): number { return 1 }
function foo_26<T>(p: T): T {
    return p
}

function foo_27<T>(p: T): T {
    return p
}

function foo_28<T>(p: T): T {
    return p
}

function foo_29<T>(p: T): T {
    return p
}

interface I_30<T, U> {
  a: [T, U]
}

interface A_31<T> {
  a: T
}

interface B_31<T, U> extends A_31<T> {
  b: U
}

// 来自 meth_*.js
class Cls_32 {
  // no constraints
  foo<T, U>(p: T, q: U): [T, U] {
    return [p, q]
  }
}

class Cls_33 {
  // no constraints, union
  foo<T, U>(p: T, q: U): T|U {
    return (p! as object).toString() > (q! as object).toString() ? p : q
  }
}

class Bar_34 {
  static bar<T>(p: T): Array<T> {
    let x = Array<T>(5)
    return x.fill(p)
  }
}

class Foo_34 {
  // no constraints
  foo<T, U>(p: T, q: U): [Array<T>, Array<U>] {
    return [Bar_34.bar(p), Bar_34.bar(q)]
  }
}

class A_35 {}
class B_35 extends A_35 {}

class Cls_35 {
  // with class type constraints
  foo<T extends U, U extends Object>(p: T, q: U): boolean {
    return p.toString() + q.toString() > ""
  }
}

class A_36 {}
class B_36 extends A_36 {}
class C_36 extends A_36 {}

class Cls_36 {
  // with union type constraints
  foo<T extends B_36|C_36, U extends number|never|B_36|null|boolean>(p: T, q: U): boolean {
    return "" + p + q > ""
  }
}

class Cls_37 {
  foo<T>(p: T): T {
    return p
  }
}

// 来自 variance_*.js
class Base_30 {}
class Derived_30 extends Base_30 {}

interface BaseI_30 {}
interface DerivedI_30 extends BaseI_30 {}

function fooBase_30(d1: Derived_30, d2: Derived_30): Base_30 { return d1 }
type fooBaseType_30 = (d1: Derived_30, d2: Derived_30) => Base_30
function fooSubtype_30(d1: Derived_30, d2: Base_30): Derived_30 { return d1 }

class Cls_38<T> {
  a: T
  constructor(a: T) {
    this.a = a
  }
}

function foo1_22(): number { return 1 }


class Cls_30<T> {
  a: T
  constructor(a: T) {
    this.a = a
  }
}

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
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_0100
     * @tc.name      testGenericInstantiations0001
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_0<number, string>(1, "abc");
      expect(cls.a instanceof number).assertTrue();
      expect(cls.b instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_0200
     * @tc.name      testGenericInstantiations0002
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_1<number, string>(1, "abc");
      expect(cls.a instanceof object).assertTrue();
      expect(cls.a[0] instanceof number).assertTrue();
      expect(cls.a[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_0300
     * @tc.name      testGenericInstantiations0003
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: B_2<number, string> = new B_2<number, string>(1, "abc");
      expect(cls.a instanceof number).assertTrue();
      expect(cls.b instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_0400
     * @tc.name      testGenericInstantiations0004
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_3<[number, string]>([1, "abc"]);
      expect(cls.a[0] instanceof number).assertTrue();
      expect(cls.a[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_0500
     * @tc.name      testGenericInstantiations0005
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_4<FixedArray<number>>([1]);
      expect(cls.a[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_0600
     * @tc.name      testGenericInstantiations0006
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_5<Any>(null);
      expect(cls.a instanceof Any).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_0700
     * @tc.name      testGenericInstantiations0007
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_6<bigint>(123n);
      expect(cls.a instanceof bigint).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_0800
     * @tc.name      testGenericInstantiations0008
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_7<"aa" | "bb">("aa");
      expect(cls.a instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_0900
     * @tc.name      testGenericInstantiations0009
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_8<() => number>(foo_8);
      expect(cls.a() instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_1000
     * @tc.name      testGenericInstantiations0010
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_9<undefined>(undefined);
      expect(cls.a === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_1100
     * @tc.name      testGenericInstantiations0011
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_10<Array<number>>([1]);
      expect(cls.a[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_1200
     * @tc.name      testGenericInstantiations0012
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_11<number[]>([1]);
      expect(cls.a[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_1300
     * @tc.name      testGenericInstantiations0013
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_13<number, boolean>(1.0, true);
      expect(z instanceof object && z[0] instanceof number && z[1] instanceof boolean).assertTrue();
      expect(z[0] == 1.0 && z[1]).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_1400
     * @tc.name      testGenericInstantiations0014
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo_14<double, double>(1.0, 11.0);
      expect(v as number).assertEqual(11.0);

      let w = foo_14<[string, string, string, string], [number, number]>(["a", "b", "c", "d"], [1, 2]);
      let x = foo_14<[string], [number, number]>(["a"], [1, 2]);
      expect(w instanceof object).assertTrue();
      expect(x instanceof object).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_1500
     * @tc.name      testGenericInstantiations0015
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new Error();
      let z = foo_15<float, Error>(42.0f, err);
      expect(z[0][0] == 42.0f && z[0][4] == 42.0f && z[1][0] == err && z[1][4] == err).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_1600
     * @tc.name      testGenericInstantiations0016
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_16<Object, Object>(new Object(), new Object())).assertTrue();
      expect(foo_16<A_16, Object>(new A_16(), new Object())).assertTrue();
      expect(foo_16<B_16, Object>(new B_16(), new Object())).assertTrue();
      expect(foo_16<A_16, A_16>(new A_16(), new A_16())).assertTrue();
      expect(foo_16<B_16, A_16>(new B_16(), new A_16())).assertTrue();
      expect(foo_16<B_16, B_16>(new B_16(), new B_16())).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_1700
     * @tc.name      testGenericInstantiations0017
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_17<C_17, boolean>(new C_17(), true)).assertTrue();
      expect(foo_17<B_17, B_17>(new B_17(), new B_17())).assertTrue();
      expect(foo_17<C_17, double>(new C_17(), 42.0)).assertTrue();
      expect(foo_17<B_17, null>(new B_17(), null)).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_1800
     * @tc.name      testGenericInstantiations0018
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y = foo_18<Error, string>(new Error(), "abc");
      expect(y instanceof object && y[0] instanceof object && y[1] instanceof string).assertTrue();
      expect(y[0] instanceof Error && y[1] == "abc").assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_1900
     * @tc.name      testGenericInstantiations0019
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_13<number, boolean>(1.0, true);
      let y = foo_18<Error, string>(new Error(), "abc");
      let x = foo_19<[Number, Boolean], [Error, string]>(z, y);
      expect(x[0][0] == 1.0 && x[0][1] && x[1][0] instanceof Error && x[1][1] == "abc").assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_2000
     * @tc.name      testGenericInstantiations0020
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let w = foo_20<null, undefined>(null, undefined);
      expect(w[0] === null && w[1] === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_2100
     * @tc.name      testGenericInstantiations0021
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_21<[number, string]>([1, "abc"]);
      expect(z[0] instanceof number).assertTrue();
      expect(z[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_2200
     * @tc.name      testGenericInstantiations0022
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_22<FixedArray<number>>([1]);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_2300
     * @tc.name      testGenericInstantiations0023
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_23<Any>(null);
      expect(z instanceof Any).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_2400
     * @tc.name      testGenericInstantiations0024
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_24<bigint>(123n);
      expect(z instanceof bigint).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_2500
     * @tc.name      testGenericInstantiations0025
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_25<"aa" | "bb">("aa");
      expect(z instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_2600
     * @tc.name      testGenericInstantiations0026
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_26<() => number>(foo1_26);
      expect(z() instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_2700
     * @tc.name      testGenericInstantiations0027
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_27<undefined>(undefined);
      expect(z === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_2800
     * @tc.name      testGenericInstantiations0028
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_28<Array<number>>([1]);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_2900
     * @tc.name      testGenericInstantiations0029
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_29<number[]>([1]);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_3000
     * @tc.name      testGenericInstantiations0030
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I_12<number, string> = {a: 1, b: "abc"};
      expect(i.a instanceof number).assertTrue();
      expect(i.b instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_3100
     * @tc.name      testGenericInstantiations0031
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I_30<number, string> = {a: [1, "abc"]};
      expect(i.a instanceof object).assertTrue();
      expect(i.a[0] instanceof number).assertTrue();
      expect(i.a[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_3200
     * @tc.name      testGenericInstantiations0032
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: B_31<number, string> = {a: 1, b: "abc"};
      expect(i.a instanceof number).assertTrue();
      expect(i.b instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_3300
     * @tc.name      testGenericInstantiations0033
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_31<[number, string]> = {a: [1, "abc"]};
      expect(i.a[0] instanceof number).assertTrue();
      expect(i.a[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_3400
     * @tc.name      testGenericInstantiations0034
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_31<FixedArray<number>> = {a: [1]};
      expect(i.a[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_3500
     * @tc.name      testGenericInstantiations0035
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_31<Any> = {a: null};
      expect(i.a instanceof Any).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_3600
     * @tc.name      testGenericInstantiations0036
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_31<bigint> = {a: 123n};
      expect(i.a instanceof bigint).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_3700
     * @tc.name      testGenericInstantiations0037
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_31<"aa" | "bb"> = {a: "aa"};
      expect(i.a instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_3800
     * @tc.name      testGenericInstantiations0038
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_31<() => number> = {a: foo_8};
      expect(i.a() instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_3900
     * @tc.name      testGenericInstantiations0039
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_31<undefined> = {a: undefined};
      expect(i.a === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_4000
     * @tc.name      testGenericInstantiations0040
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_31<Array<number>> = {a: [1]};
      expect(i.a[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_4100
     * @tc.name      testGenericInstantiations0041
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_31<number[]> = {a: [1]};
      expect(i.a[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_4200
     * @tc.name      testGenericInstantiations0042
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_32();
      let z = cls.foo<number, boolean>(1.0, true);
      expect(z instanceof object && z[0] instanceof number && z[1] instanceof boolean).assertTrue();
      expect(z[0] == 1.0 && z[1]).assertTrue();

      let y = cls.foo<Error, string>(new Error(), "abc");
      expect(y instanceof object && y[0] instanceof object && y[1] instanceof string).assertTrue();
      expect(y[0] instanceof Error && y[1] == "abc").assertTrue();

      let x = cls.foo<[Number, Boolean], [Error, string]>(z, y);
      expect(x[0][0] == 1.0 && x[0][1] && x[1][0] instanceof Error && x[1][1] == "abc").assertTrue();

      let w = cls.foo<null, undefined>(null, undefined);
      expect(w[0] === null && w[1] === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_4300
     * @tc.name      testGenericInstantiations0043
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_33();

      let v = cls.foo<number, number>(1.0, 11.0);
      expect(v as number).assertEqual(11.0);

      let w = cls.foo<[string, string, string, string], [number, number]>(["a", "b", "c", "d"], [1, 2]);
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_4400
     * @tc.name      testGenericInstantiations0044
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new Error();
      let z = new Foo_34().foo<float, Error>(42.0f, err);
      expect(z[0][0] == 42.0f && z[0][4] == 42.0f && z[1][0] == err && z[1][4] == err).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_4500
     * @tc.name      testGenericInstantiations0045
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_35();
      expect(cls.foo<Object, Object>(new Object(), new Object())).assertTrue();
      expect(cls.foo<A_35, Object>(new A_35(), new Object())).assertTrue();
      expect(cls.foo<B_35, Object>(new B_35(), new Object())).assertTrue();
      expect(cls.foo<A_35, A_35>(new A_35(), new A_35())).assertTrue();
      expect(cls.foo<B_35, A_35>(new B_35(), new A_35())).assertTrue();
      expect(cls.foo<B_35, B_35>(new B_35(), new B_35())).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_4600
     * @tc.name      testGenericInstantiations0046
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_36();
      expect(cls.foo<C_36, boolean>(new C_36(), true)).assertTrue();
      expect(cls.foo<B_36, B_36>(new B_36(), new B_36())).assertTrue();
      expect(cls.foo<C_36, double>(new C_36(), 42.0)).assertTrue();
      expect(cls.foo<B_36, null>(new B_36(), null)).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_4700
     * @tc.name      testGenericInstantiations0047
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_37().foo<[number, string]>([1, "abc"]);
      expect(z[0] instanceof number).assertTrue();
      expect(z[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_4800
     * @tc.name      testGenericInstantiations0048
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_37().foo<FixedArray<number>>([1]);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_4900
     * @tc.name      testGenericInstantiations0049
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_37().foo<Any>(null);
      expect(z instanceof Any).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_5000
     * @tc.name      testGenericInstantiations0050
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_37().foo<bigint>(123n);
      expect(z instanceof bigint).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_5100
     * @tc.name      testGenericInstantiations0051
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_37().foo<"aa" | "bb">("aa");
      expect(z instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_5200
     * @tc.name      testGenericInstantiations0052
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_37().foo<() => number>(foo1_22);
      expect(z() instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_5300
     * @tc.name      testGenericInstantiations0053
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_37().foo<undefined>(undefined);
      expect(z === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_5400
     * @tc.name      testGenericInstantiations0054
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_37().foo<Array<number>>([1]);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_5500
     * @tc.name      testGenericInstantiations0055
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_37().foo<number[]>([1]);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_5600
     * @tc.name      testGenericInstantiations0056
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_38<Base_30>(new Derived_30());
      expect(cls.a instanceof Derived_30).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_5700
     * @tc.name      testGenericInstantiations0057
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_38<fooBaseType_30>(fooSubtype_30);
      expect(cls.a instanceof fooBaseType_30).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_5800
     * @tc.name      testGenericInstantiations0058
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_38<[Base_30, fooBaseType_30]>([new Derived_30(), fooSubtype_30]);
      expect(cls.a[0] instanceof Derived_30).assertTrue();
      expect(cls.a[1] instanceof fooBaseType_30).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_5900
     * @tc.name      testGenericInstantiations0059
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_38<FixedArray<Base_30>>([new Derived_30()]);
      expect(cls.a[0] instanceof Derived_30).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_6000
     * @tc.name      testGenericInstantiations0060
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_38<Base_30 | fooBaseType_30>(new Derived_30());
      expect(cls.a instanceof Derived_30).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_6100
     * @tc.name      testGenericInstantiations0061
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_30<Base_30 | fooBaseType_30>(fooSubtype_30);
      expect(cls.a instanceof fooBaseType_30).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_6200
     * @tc.name      testGenericInstantiations0062
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_30<Array<Base_30>>([new Derived_30()]);
      expect(cls.a[0] instanceof Derived_30).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_6300
     * @tc.name      testGenericInstantiations0063
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_30<Array<fooBaseType_30>>([fooSubtype_30]);
      expect(cls.a[0] instanceof fooBaseType_30).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_6400
     * @tc.name      testGenericInstantiations0064
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_30<Base_30[]>([new Derived_30()]);
      expect(cls.a[0] instanceof Derived_30).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_6500
     * @tc.name      testGenericInstantiations0065
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_30<fooBaseType_30[]>([fooSubtype_30]);
      expect(cls.a[0] instanceof fooBaseType_30).assertTrue();
    })
  });
}