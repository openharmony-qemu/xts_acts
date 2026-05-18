/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  i = 0
  foo() {
    this.i += 1
  }
}

class A1 {
  i = 0
  foo() {
    this.i += 1
    return
  }
}

class A2 {
  s = "foo"
  foo() {
    return this.s
  }
}

class A3 {
  s: int = 42
  foo() {
    return this.s
  }
}

class A4 {
  s: number = 1.0
  foo() {
    return this.s
  }
}

class A5 {
  s = new Error()
  foo() {
    return this.s
  }
}

class A6 {
  s: number[] = [1.0, 2.0, 3.0]
  foo() {
    return this.s
  }
}

class A7 {
  s: Boolean[] = []
  foo() {
    return this.s
  }
}

class A8 {
  s: Long[][] = [[new Long(0)]]
  foo() {
    if (this.s != null)
      return this.s
    else
      return [[new Long(0), new Long(0)], [new Long(0), new Long(0)]]
  }
}

class A9 {
  s: long[][] = [[0 as long]]
  foo() {
    if (this.s != null)
      return this.s
    else
      return [[new Error()]]
  }
}

class A10 {
  s: Long[][] = [[new Long(0)]]
  foo() {
    if (this.s == null)
      return this.s
    else
      return [new Error()]
  }
}

class A11 {
  s: Long[][] | null = [[new Long(0)]]
  foo() {
    if (this.s != null)
      return this.s
    else
      return new Error()
  }
}

class A12 {}
class B12 extends A12 {}
class C12 extends A12 {}
type TypeB12 = B12
type TypeC12 = C12

class D12 {
  s = 1
  foo() {
    if (this.s == 0)
      return new TypeB12()
    else
      return new TypeC12()
  }
}

class A13 {}
class B13 extends A13 {}
class C13 extends B13 {}
class D13 extends B13 {}

class E13 {
  s = 1
  foo() {
    if (this.s == 0)
      return new C13()
    else
      return new D13()
  }
}

class A14 {
  s = 0
  async foo() {
    if (this.s == 0)
      return new Boolean(true)
    else
      return new Boolean(false)
  }
}

class A15 {
  s = new Object()
  foo() {
    if (this.s != null)
      return true
    else
      return [true]
  }
}

class B16<T, U> {}
class A16 {
  s = 1
  foo<T>() {
    if (this.s == 0)
      return new B16<T, Long>()
    else
      return new B16<T, Error>()
  }
}

class A17 {
  foo() {
    return this
  }
}

class A18 {
  static i = 0
  static foo() {
    A18.i = 1
  }
}

class A19 {
  static i = 0
  static foo() {
    A19.i = 1
    return
  }
}

class A20 {
  static foo() {
    let s = "foo"
    return s
  }
}

class A21 {
  static foo() {
    let s: number = 1.0
    return s
  }
}

class A22 {
  static foo() {
    let s = new Error()
    return s
  }
}

class A23 {
  static foo() {
    let s: number[] = [1.0, 2.0, 3.0]
    return s
  }
}

class A24 {
  static foo() {
    let s: Boolean[] = []
    return s
  }
}

class A25 {
  static foo() {
    let s: Long[][] = [[new Long(0)]]
    if (s != null)
      return s
    else
      return [[new Long(0), new Long(0)], [new Long(0), new Long(0)]]
  }
}

class A26 {
  static foo() {
    let s: long[][] = [[0 as long]]
    if (s != null)
      return s
    else
      return [[new Error()]]
  }
}

class A27 {
  static foo() {
    let s: Long[][] = [[new Long(0)]]
    if (s == null)
      return s
    else
      return [new Error()]
  }
}

class A28 {
  static foo() {
    let s: Long[][] | null = [[new Long(0)]]
    if (s != null)
      return s
    else
      return new Error()
  }
}

class A29 {}
class B29 extends A29 {}
class C29 extends A29 {}
type TypeB29 = B29
type TypeC29 = C29

class D29 {
  static foo() {
    let s = 1
    if (s == 0)
      return new TypeB29()
    else
      return new TypeC29()
  }
}

class A30 {}
class B30 extends A30 {}
class C30 extends B30 {}
class D30 extends B30 {}

class E30 {
  static foo() {
    let s = 1
    if (s == 0)
      return new C30()
    else
      return new D30()
  }
}

class A31 {
  static foo() {
    let s = new Object()
    if (s != null)
      return true
    else
      return [true]
  }
}

class B32<T, U> {}
class A32 {
  static foo<T>() {
    let s = 1
    if (s == 0)
      return new B32<T, Long>()
    else
      return new B32<T, Error>()
  }
}

export default function ReturnTypeInferenceTest02():void {
  describe('ReturnTypeInferenceTest02', () => {
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
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_0100
     * @tc.name      testRetTypeClassMethod0001
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A()
      a.foo()
      expect(a.i == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_0200
     * @tc.name      testRetTypeClassMethod0002
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A1()
      a.foo()
      expect(a.i == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_0300
     * @tc.name      testRetTypeClassMethod0003
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A2()
      let v = a.foo()
      expect(new A2().foo() == "foo").assertTrue()
      expect(v == "foo").assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_0400
     * @tc.name      testRetTypeClassMethod0004
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A3()
      let v = a.foo()
      expect(new A3().foo() == 42).assertTrue()
      expect(v == 42).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_0500
     * @tc.name      testRetTypeClassMethod0005
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A4()
      let v = a.foo()
      expect(new A4().foo() == 1.0).assertTrue()
      expect(v == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_0600
     * @tc.name      testRetTypeClassMethod0006
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A5()
      let v = a.foo()
      expect(new A5().foo() instanceof Error).assertTrue()
      expect(v instanceof Error).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_0700
     * @tc.name      testRetTypeClassMethod0007
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A6()
      let v = a.foo()
      expect(v instanceof Array && v.length == 3).assertTrue()
      expect(typeof v[0] === 'number').assertTrue()
      expect(typeof v[1] === 'number').assertTrue()
      expect(typeof v[2] === 'number').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_0800
     * @tc.name      testRetTypeClassMethod0008
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A7()
      let v = a.foo()
      expect(v instanceof Array && v.length == 0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_0900
     * @tc.name      testRetTypeClassMethod0009
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A8()
      let v = a.foo()
      expect(new A8().foo() instanceof Array).assertTrue()
      expect(v instanceof Array).assertTrue()
      expect(v[0] instanceof Array).assertTrue()
      expect(v[0][0] instanceof Long).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_1000
     * @tc.name      testRetTypeClassMethod0010
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A9()
      let v = a.foo() as long[][]
      v[0][0] = 0 as long
      expect(v[0][0] == 0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_1100
     * @tc.name      testRetTypeClassMethod0011
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A10()
      let v = a.foo() as Error[]
      expect(v.length == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_1200
     * @tc.name      testRetTypeClassMethod0012
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A11()
      let v = a.foo()
      expect(v instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_1300
     * @tc.name      testRetTypeClassMethod0013
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A12 = new D12().foo()
      expect(v instanceof A12).assertTrue()
      expect(new D12().foo() instanceof A12).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_1400
     * @tc.name      testRetTypeClassMethod0014
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B13[] = [new E13().foo()]
      expect(new E13().foo() instanceof D13).assertTrue()
      expect(v[0] instanceof D13).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_1500
     * @tc.name      testRetTypeClassMethod0015
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let v: Promise<Boolean> = new A14().foo()
      expect(v instanceof Promise).assertTrue()
      expect(new A14().foo() instanceof Promise).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_1600
     * @tc.name      testRetTypeClassMethod0016
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new A15().foo()
      expect(typeof v === 'boolean' || v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_1700
     * @tc.name      testRetTypeClassMethod0017
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new A16().foo<Boolean>()
      expect(v instanceof B16).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_1800
     * @tc.name      testRetTypeClassMethod0018
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A17()
      expect(a.foo() instanceof A17).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_1900
     * @tc.name      testRetTypeClassMethod0019
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      A18.foo()
      expect(A18.i == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_2000
     * @tc.name      testRetTypeClassMethod0020
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      A19.foo()
      expect(A19.i == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_2100
     * @tc.name      testRetTypeClassMethod0021
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A20.foo() == "foo").assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_2200
     * @tc.name      testRetTypeClassMethod0022
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A21.foo() == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_2300
     * @tc.name      testRetTypeClassMethod0023
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A22.foo() instanceof Error).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_2400
     * @tc.name      testRetTypeClassMethod0024
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = A23.foo()
      expect(v instanceof Array && v.length == 3).assertTrue()
      expect(typeof v[0] === 'number').assertTrue()
      expect(typeof v[1] === 'number').assertTrue()
      expect(typeof v[2] === 'number').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_2500
     * @tc.name      testRetTypeClassMethod0025
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = A24.foo()
      expect(v instanceof Array && v.length == 0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_2600
     * @tc.name      testRetTypeClassMethod0026
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = A25.foo()
      expect(v instanceof Array).assertTrue()
      expect(v[0] instanceof Array).assertTrue()
      expect(v[0][0] instanceof Long).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_2700
     * @tc.name      testRetTypeClassMethod0027
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = A26.foo() as long[][]
      v[0][0] = 0 as long
      expect(v[0][0] == 0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_2800
     * @tc.name      testRetTypeClassMethod0028
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = A27.foo() as Error[]
      expect(v.length == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_2900
     * @tc.name      testRetTypeClassMethod0029
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = A28.foo()
      expect(v instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_3000
     * @tc.name      testRetTypeClassMethod0030
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A29 = D29.foo()
      expect(v instanceof A29).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_3100
     * @tc.name      testRetTypeClassMethod0031
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B30[] = [E30.foo()]
      expect(v[0] instanceof D30).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_3200
     * @tc.name      testRetTypeClassMethod0032
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = A31.foo()
      expect(typeof v === 'boolean' || v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTTWO_3300
     * @tc.name      testRetTypeClassMethod0033
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeClassMethod0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = A32.foo<Boolean>()
      expect(v instanceof B32).assertTrue()
    });

  })
}