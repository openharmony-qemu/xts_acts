'use static';
/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class C {
  static $_instantiate() { return 'abc' }
}

class C1 {
  static $_instantiate(f: () => C1) { return 'abc' }
}
function foo(): C1 {
  return new C1()
}

class C2 {
  static inst: C2 | null = null
  static $_instantiate(f: () => C2) { C2.inst = f() }
}

class C3 {
  static inst: C3 | null = null
  static $_instantiate(f: () => C3): void { C3.inst = f() }
}

type A4 = C4
class C4 {
  static $_instantiate(f: () => C4, p: string): string {
    return f().meth(p)
  }
  meth(p: string): string { return p + p }
}

class C5 {
  static instance: C5 | null | undefined = null
  static $_instantiate(f: () => C5): C5 {
    if (C5.instance == null) {
      C5.instance = f()
    }
    return C5.instance!
  }
}

class C6 {
  static instance: C6 | null | undefined = null
  static $_instantiate(f: () => C6): C6 {
    if (C6.instance == null) {
      C6.instance = f()
    }
    return C6.instance!
  }
}

enum Color { Red, Green, Blue }
class C7 {
  clr: Color | undefined
  static $_instantiate(f: () => C7, clr: Color): [C7, C7, C7] {
    let c = f()
    c.clr = clr
    return [c, c, c]
  }
}

class Conc {
  static $_instantiate(f: () => Conc, ...strings: string[]): Conc {
    let ss = ''
    for (let s of strings) ss += s
    let res = f()
    res.s = ss
    return res
  }
  s: string = 'X'
}

class A_9 {
  static $_instantiate(f: () => A_9): A_9 { return f() }
}
class B_9 extends A_9 {
  static $_instantiate(f: () => B_9): B_9 { return f() }
}
class C_9 extends B_9 {
  static $_instantiate(f: () => C_9): C_9 { return f() }
}

class A_10 {
  name: string = 'X'
  static $_instantiate(f: () => A_10, p: number): A_10 { return foo_10(f, 'A', p) }
}
class B_10 extends A_10 {
  static $_instantiate(f: () => B_10, p: number): B_10 { return foo_10(f, 'B', p) as B_10 }
}
class C_10 extends B_10 {
  static $_instantiate(f: () => C_10, p: number): C_10 { return foo_10(f, 'C', p) as C_10 }
}
function foo_10(f: () => A_10, p: string, n: number): A_10 {
  let r = f()
  r.name = p + n
  return r
}

class C11 {
  static $_instantiate(f: () => C11, p: number): number { return p + p }
  static $_instantiate(f: () => C11, p: string): string { return p + p }
}

class B_12 {
  static $_instantiate(f: () => B_12, p: number): number { return p + p }
}
class C_12 extends B_12 {
  static $_instantiate(f: () => C_12, p: number): number { return p + p }
  static $_instantiate(f: () => C_12, p: string): string { return p + p }
}

class B_13 {
  static $_instantiate(f: () => B_13, p: number): number {
    return f().$_instantiate(f, p)
  }
  $_instantiate(f: () => B_13, p: number): number { return p + p }
}
class C_13 extends B_13 {
  static $_instantiate(f: () => C_13, p: number): number {
    return f().$_instantiate(f, p)
  }
  static $_instantiate(f: () => C_13, p: string): string {
    return f().$_instantiate(f, p)
  }
  $_instantiate(f: () => C_13, p: number): number { return p + p }
  $_instantiate(f: () => C_13, p: string): string { return '1' + p }
}

class MyError extends Error {}
class C14 {
  static $_instantiate(f: () => C14, p: boolean): C14 {
    if (p) {
      throw new MyError()
    }
    return f()
  }
}

class MyError1 extends Error {}
class C15 {
  static $_instantiate(f: () => C15, p: boolean): C15 {
    return f()
  }
  constructor() {
    throw new MyError1()
  }
}

class C16 {
  fld: number = 0
  static $_instantiate(f: () => C16): C16 {
    let x = f()
    x.fld = 1
    return x
  }
}

class C17 {
  static $_instantiate(f: () => C17): () => C17 { return f }
}

class C18 {
  static $_instantiate(f: () => C18): C18[] {
    let x: C18[] = [f(), f(), f()]
    return x
  }
}

class C19 {
  fld: string = ''
  public static $_instantiate(f: () => C19, p: number): C19 { return C19('' + p) }
  private static $_instantiate(f: () => C19, p: string): C19 {
    let x = f()
    x.fld = p
    return x
  }
}

class C20 {
  fld: string = ''
  private static $_instantiate(f: () => C20, p: string): C20 {
    let x = f()
    x.fld = p
    return x
  }
  meth(p: number): C20 {
    return C20('' + p)
  }
}

class C21 {
  fld: string = ''
  public static $_instantiate(f: () => C21, p: number): C21 { return C21('' + p) }
  protected static $_instantiate(f: () => C21, p: string): C21 {
    let x = f()
    x.fld = p
    return x
  }
}

class C22 {
  fld: string = ''
  protected static $_instantiate(f: () => C22, p: string): C22 {
    let x = f()
    x.fld = p
    return x
  }
  meth(p: number): C22 {
    return C22('' + p)
  }
}

class B_23 {
  fld: string = ''
  protected static $_instantiate(f: () => B_23, p: string): B_23 {
    let x = f()
    x.fld = p
    return x
  }
}
class C_23 extends B_23 {
  public static $_instantiate(f: () => C_23, p: number): B_23 {
    let x = f()
    x.fld = '' + p
    return x
  }
}

class B_24 {
  fld: string = ''
  protected static $_instantiate(f: () => B_24, p: string): B_24 {
    let x = f()
    x.fld = p
    return x
  }
}
class C_24 extends B_24 {
  static $_instantiate(f: () => C_24, p: string): B_24 {
    let x = f()
    x.fld = p
    return x
  }
  meth(p: number): B_24 {
    return C_24('' + p)
  }
}

class C25 {
  static $_instantiate(f: () => C25): C25 {
    return f()
  }
}

class C26 {
  static $_instantiate(f: () => C26, p: number[]): C26 {
    return f()
  }
}

class C27 {
  static $_instantiate(f: () => C27): C27 {
    return f()
  }
}
class D extends C27 {}

class C28 {
  static $_instantiate(f: () => C28, p: () => C28): C28 {
    return f()
  }
}
function foo_28(): C28 {
  return new C28()
}

class C29 {
  static $_instantiate(f: C29): C29 {
    return f
  }
}

class C30 {
  static $_instantiate(f: () => C30): C30 {
    return f()
  }
  constructor(p: string) {}
}

class C31<T extends String | Number | undefined> {
  fld: T = undefined as T
  static $_instantiate(f: () => C31<String>, p: String): C31<String> {
    let x: C31<String> = f()
    x.fld = p
    return x
  }
  static $_instantiate(f: () => C31<Number>, p: Number): C31<Number> {
    let x: C31<Number> = f()
    x.fld = p
    return x
  }
}

export default function CallableTypesWithInstantiateMethodTest(): void {
  describe('CallableTypesWithInstantiateMethodTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_0100
     * @tc.name      testCallableTypesWithInstantiateMethod0001
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C.$_instantiate()).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_0200
     * @tc.name      testCallableTypesWithInstantiateMethod0002
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C1.$_instantiate(foo)).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_0300
     * @tc.name      testCallableTypesWithInstantiateMethod0003
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      C2.inst = null
      C2()
      expect(C2.inst instanceof C2).assertTrue()
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_0400
     * @tc.name      testCallableTypesWithInstantiateMethod0004
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      C3.inst = null
      C3()
      expect(C3.inst instanceof C3).assertTrue()
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_0500
     * @tc.name      testCallableTypesWithInstantiateMethod0005
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A4('abc')).assertEqual('abcabc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_0800
     * @tc.name      testCallableTypesWithInstantiateMethod0008
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = C7(Color.Green)
      expect(x[0]).assertEqual(x[1])
      expect(x[1]).assertEqual(x[2])
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_0900
     * @tc.name      testCallableTypesWithInstantiateMethod0009
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Conc().s).assertEqual('')
      expect(Conc('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h').s).assertEqual('abcdefgh')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_1000
     * @tc.name      testCallableTypesWithInstantiateMethod0010
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = A_9()
      expect(a instanceof A_9).assertTrue()
      expect(a instanceof B_9).assertFalse()
      expect(a instanceof C_9).assertFalse()
      let b = B_9()
      expect(b instanceof A_9).assertTrue()
      expect(b instanceof B_9).assertTrue()
      expect(b instanceof C_9).assertFalse()
      let c = C_9()
      expect(c instanceof A_9).assertTrue()
      expect(c instanceof B_9).assertTrue()
      expect(c instanceof C_9).assertTrue()
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_1100
     * @tc.name      testCallableTypesWithInstantiateMethod0011
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_10(1).name).assertEqual('A1')
      expect(B_10(2).name).assertEqual('B2')
      expect(C_10(3).name).assertEqual('C3')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_1200
     * @tc.name      testCallableTypesWithInstantiateMethod0012
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C11(42)).assertEqual(84)
      expect(C11('abc')).assertEqual('abcabc')
      expect(C11.$_instantiate(() => { return new C11() }, 42)).assertEqual(84)
      expect(C11.$_instantiate(() => { return new C11() }, 'abc')).assertEqual('abcabc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_1300
     * @tc.name      testCallableTypesWithInstantiateMethod0013
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C_12(42)).assertEqual(84)
      expect(C_12('abc')).assertEqual('abcabc')
      expect(C_12.$_instantiate(() => { return new C_12() }, 42)).assertEqual(84)
      expect(C_12.$_instantiate(() => { return new C_12() }, 'abc')).assertEqual('abcabc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_1400
     * @tc.name      testCallableTypesWithInstantiateMethod0014
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C_13('abc')).assertEqual('1abc')
      expect(B_13(42)).assertEqual(84)
      expect(C_13(42)).assertEqual(84)
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_1700
     * @tc.name      testCallableTypesWithInstantiateMethod0017
     * @tc.desc      The method instantiate can have an arbitrary signature by itself.
     *               If it is to be used in a type call expression, then its first
     *               parameter must be a factory. The method can have or not have other
     *               parameters, and those parameters can be arbitrary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInstantiateMethod0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = C16.$_instantiate(() => new C16());
      expect(x.fld).assertEqual(1);
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_1800
   * @tc.name      testCallableTypesWithInstantiateMethod0018
   * @tc.desc      The method instantiate can have an arbitrary signature by itself.
   *               If it is to be used in a type call expression, then its first
   *               parameter must be a factory. The method can have or not have other
   *               parameters, and those parameters can be arbitrary.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    expect(C17()() instanceof C17).assertTrue()
    expect(C17.$_instantiate(() => { return new C17() })() instanceof C17).assertTrue()
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_1900
   * @tc.name      testCallableTypesWithInstantiateMethod0019
   * @tc.desc      The method instantiate can have an arbitrary signature by itself.
   *               If it is to be used in a type call expression, then its first
   *               parameter must be a factory. The method can have or not have other
   *               parameters, and those parameters can be arbitrary.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    for (let z of C18()) {
      expect(z instanceof C18).assertTrue();
    }

    for (let z of C18.$_instantiate(() => new C18())) {
      expect(z instanceof C18).assertTrue();
    }
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_2000
   * @tc.name      testCallableTypesWithInstantiateMethod0020
   * @tc.desc      The method instantiate can have an arbitrary signature by itself.
   *               If it is to be used in a type call expression, then its first
   *               parameter must be a factory. The method can have or not have other
   *               parameters, and those parameters can be arbitrary.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    expect(C19(42).fld).assertEqual('42')
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_2100
   * @tc.name      testCallableTypesWithInstantiateMethod0021
   * @tc.desc      The method instantiate can have an arbitrary signature by itself.
   *               If it is to be used in a type call expression, then its first
   *               parameter must be a factory. The method can have or not have other
   *               parameters, and those parameters can be arbitrary.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    expect(new C20().meth(42).fld).assertEqual('42')
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_2200
   * @tc.name      testCallableTypesWithInstantiateMethod0022
   * @tc.desc      The method instantiate can have an arbitrary signature by itself.
   *               If it is to be used in a type call expression, then its first
   *               parameter must be a factory. The method can have or not have other
   *               parameters, and those parameters can be arbitrary.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    expect(C21(42).fld).assertEqual('42')
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_2300
   * @tc.name      testCallableTypesWithInstantiateMethod0023
   * @tc.desc      The method instantiate can have an arbitrary signature by itself.
   *               If it is to be used in a type call expression, then its first
   *               parameter must be a factory. The method can have or not have other
   *               parameters, and those parameters can be arbitrary.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    expect(new C22().meth(42).fld).assertEqual('42')
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_2400
   * @tc.name      testCallableTypesWithInstantiateMethod0024
   * @tc.desc      The method instantiate can have an arbitrary signature by itself.
   *               If it is to be used in a type call expression, then its first
   *               parameter must be a factory. The method can have or not have other
   *               parameters, and those parameters can be arbitrary.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    expect(C_23(42).fld).assertEqual('42')
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_2500
   * @tc.name      testCallableTypesWithInstantiateMethod0025
   * @tc.desc      The method instantiate can have an arbitrary signature by itself.
   *               If it is to be used in a type call expression, then its first
   *               parameter must be a factory. The method can have or not have other
   *               parameters, and those parameters can be arbitrary.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    expect(new C_24().meth(42).fld).assertEqual('42')
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_2600
   * @tc.name      testCallableTypesWithInstantiateMethod0026
   * @tc.desc      If the method instantiate has additional parameters, then the call
   *               must contain corresponding arguments.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let x = C25()
    expect(x instanceof C25).assertTrue()
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_2700
   * @tc.name      testCallableTypesWithInstantiateMethod0027
   * @tc.desc      If the method instantiate has additional parameters, then the call
   *               must contain corresponding arguments.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let ii: number[] = [1, 2, 3]
    let x = C26(ii)
    expect(x instanceof C26).assertTrue()
  });

  /**
   * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_2800
   * @tc.name      testCallableTypesWithInstantiateMethod0028
   * @tc.desc      If the method instantiate has additional parameters, then the call
   *               must contain corresponding arguments.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testCallableTypesWithInstantiateMethod0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let x = C27.$_instantiate(() => new D());
    expect(x instanceof C27).assertTrue();
});

/**
 * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_2900
 * @tc.name      testCallableTypesWithInstantiateMethod0029
 * @tc.desc      If the method instantiate has additional parameters, then the call
 *               must contain corresponding arguments.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it("testCallableTypesWithInstantiateMethod0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  let x = C28.$_instantiate(foo_28, foo_28)
  expect(x instanceof C28).assertTrue()
});

/**
 * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_3000
 * @tc.name      testCallableTypesWithInstantiateMethod0030
 * @tc.desc      If the method instantiate has additional parameters, then the call
 *               must contain corresponding arguments.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it("testCallableTypesWithInstantiateMethod0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  let x = C29.$_instantiate(new C29())
  expect(x instanceof C29).assertTrue()
});

/**
 * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_3100
 * @tc.name      testCallableTypesWithInstantiateMethod0031
 * @tc.desc      If the method instantiate has additional parameters, then the call
 *               must contain corresponding arguments.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it("testCallableTypesWithInstantiateMethod0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  let x = C30.$_instantiate(() => new C30(''));
  expect(x instanceof C30).assertTrue();
});

/**
 * @tc.number    SUB_CALLABLE_TYPES_WITH_INSTANTIATE_METHOD_TEST_3200
 * @tc.name      testCallableTypesWithInstantiateMethod0032
 * @tc.desc      If the method instantiate has additional parameters, then the call
 *               must contain corresponding arguments.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it("testCallableTypesWithInstantiateMethod0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  let x = C31.$_instantiate(() => new C31<string>(), '');
  expect(x.fld).assertEqual('');

  let y = C31.$_instantiate(() => new C31<number>(), 42);
  expect(y.fld).assertEqual(42);
});

});
}
