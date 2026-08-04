'use static'
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

import Utils from '../../../Util.test'

abstract class C {
  static $_invoke(): number { return 42 }
}

class C1 {
  static $_invoke(): number { return 42 }
}

type A2 = C2
class C2 {
  static $_invoke(): number { return 42 }
}

type A3 = C3
abstract class C3 {
  static $_invoke(): number { return 42 }
}

class C4 {
  static res: number = 0
  static $_invoke() { C4.res = 1 }
}

class C5 {
  static res: number = 0
  static $_invoke(): void { C5.res = 1 }
}

class C6 {
  static instance: C6 | null | undefined = undefined
  static $_invoke(): C6 {
    if (C6.instance == undefined) {
      C6.instance = new C6()
    }
    return C6.instance!
  }
}

// ct_invoke_7: with parameters
class Add {
  static $_invoke(a: number, b: number): number { return a + b }
}
class Sub {
  static $_invoke(a: number, b: number): number { return a - b }
}
class Mul {
  static $_invoke(a: number, b: number): number { return a * b }
}
class Div {
  static $_invoke(a: number, b: number): number { return a / b }
}

// ct_invoke_8: arbitrary number of parameters
class Sum {
  static $_invoke(...numbers: number[]): number {
    let sum: number = 0
    for (let n of numbers) sum += n
    return sum
  }
}

// ct_invoke_9: shadowed invoke
class A_9<T> {
  static $_invoke(): string { return 'A' }
}
class B_9<T> extends A_9<T> {
  static $_invoke(): string { return 'B' }
}
class C_9<T> extends B_9<T> {
  static $_invoke(): string { return 'C' }
}

// ct_invoke_10: overloaded invoke
class B_10 {
  static $_invoke(n: number): number { return n + n }
  static $_invoke(p: string): string { return p }
}
class C_10 extends B_10 {
  static $_invoke(p: string): string { return p + p }
  static $_invoke(p: string, q: boolean): string { return p + q }
}

// ct_invoke_11: overloaded invoke
class B_11 {
  static $_invoke(n: number): number { return n + n }
  static $_invoke(p: string): string { return p }
}
class C_11 extends B_11 {
  static $_invoke(p: string): string { return p + p }
  static $_invoke(p: string, q: boolean): string { return p + q }
}

// ct_invoke_12: mix of static and instance invoke
class A_12 {
  static $_invoke(): string { return 'A' }
}
class B_12 extends A_12 {
  $_invoke(): string { return 'B' }
}
class C_12 extends B_12 {
  $_invoke(): string { return 'C' }
}

// ct_invoke_13: mix of static and instance invoke
class B_13 {
  static $_invoke(): string { return 'B' }
  $_invoke(): string { return 'b' }
}
class C_13 extends B_13 {
  static $_invoke(): C_13 { return new C_13() }
}

// ct_invoke_14: error propagation from invoke
class B_14 {
  static $_invoke(p: boolean): string {
    if (p) {
      throw new Error('invoke error')
    }
    return 'B'
  }
}
class C_14 extends B_14 {
  $_invoke(): C_14 { return new C_14() }
}
function foo(p: boolean): string {
  return C_14(p)
}

// ct_invoke_15: call chain of invoke
class A_15<T> {
  static $_invoke(): number { return 42 }
}
class B_15<T> {
  static $_invoke() { return A_15() }
}
class C_15<T> {
  static $_invoke() { return B_15() }
}

// ct_invoke_16: invoke calls another invoke
class C7 {
  static $_invoke() { return C7('abc') }
  static $_invoke(p: string) { return p }
}

// ct_invoke_17: invoke returns array
class C8 {
  static $_invoke(...numbers: number[]): number[] {
    return numbers
  }
}

// ct_invoke_access_0: private invoke from same-class another invoke
class C9 {
  private static $_invoke(p: string) { return p }
  public static $_invoke() { return C9('abc') }
}

// ct_invoke_access_1: private invoke from same-class method
class C10 {
  private static $_invoke(p: string) { return p + p }
  meth(): string {
    return C10('abc')
  }
}

// ct_invoke_access_2: protected invoke from same-class another invoke
class C11_1 {
  protected static $_invoke(p: string) { return p }
  public static $_invoke() { return C11_1('abc') }
}

// ct_invoke_access_3: protected invoke from same-class method
class C12_1 {
  protected static $_invoke(p: string) { return p + p }
  meth(): string {
    return C12_1('abc')
  }
}

// ct_invoke_access_4: protected invoke from subclass invoke
class B_22 {
  protected static $_invoke(p: string) { return p }
}
class C_22 extends B_22 {
  public static $_invoke() { return B_22('abc') }
}

// ct_invoke_access_5: protected invoke from subclass method
class B_23 {
  protected static $_invoke(p: string) { return p + p }
}
class C_23 extends B_23 {
  meth(): string {
    return B_23('abc')
  }
}

export default function CallableTypesWithInvokeMethodTest(): void {
  describe('CallableTypesWithInvokeMethodTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_0100
     * @tc.name      testCallableTypesWithInvokeMethod0001
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = C()
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_0200
     * @tc.name      testCallableTypesWithInvokeMethod0002
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C1.$_invoke()).assertEqual(42)
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_0300
     * @tc.name      testCallableTypesWithInvokeMethod0003
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = A2()
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_0400
     * @tc.name      testCallableTypesWithInvokeMethod0004
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = A3.$_invoke()
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_0500
     * @tc.name      testCallableTypesWithInvokeMethod0005
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      C4.res = 0
      C4()
      expect(C4.res).assertEqual(1)
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_0600
     * @tc.name      testCallableTypesWithInvokeMethod0006
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      C5.res = 0
      C5()
      expect(C5.res).assertEqual(1)
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_0700
     * @tc.name      testCallableTypesWithInvokeMethod0007
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C6.$_invoke()).assertEqual(C6())
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_0900
     * @tc.name      testCallableTypesWithInvokeMethod0009
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Sum()).assertEqual(0)
      expect(Sum(11)).assertEqual(11)
      expect(Sum(12, 13, 14, 15, 16, 17, 18, 19, -1, -2, -3)).assertEqual(118)

      expect(Sum.$_invoke()).assertEqual(0)
      expect(Sum.$_invoke(11)).assertEqual(11)
      expect(Sum.$_invoke(12, 13, 14, 15, 16, 17, 18, 19, -1, -2, -3)).assertEqual(118)
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_1000
     * @tc.name      testCallableTypesWithInvokeMethod0010
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C_9()).assertEqual('C')
      expect(B_9()).assertEqual('B')
      expect(A_9()).assertEqual('A')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_1100
     * @tc.name      testCallableTypesWithInvokeMethod0011
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C_10(33)).assertEqual(66)
      expect(C_10('abc')).assertEqual('abcabc')
      expect(C_10('abc', false)).assertEqual('abcfalse')

      expect(B_10(42)).assertEqual(84)
      expect(B_10('abc')).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_1200
     * @tc.name      testCallableTypesWithInvokeMethod0012
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C_11(33)).assertEqual(66)
      expect(C_11('abc')).assertEqual('abcabc')
      expect(C_11('abc', false)).assertEqual('abcfalse')

      expect(B_11(42)).assertEqual(84)
      expect(B_11('abc')).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_1300
     * @tc.name      testCallableTypesWithInvokeMethod0013
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C_12()).assertEqual('A')
      expect(B_12()).assertEqual('A')
      expect(A_12()).assertEqual('A')

      expect(new C_12().$_invoke()).assertEqual('C')
      expect(new B_12().$_invoke()).assertEqual('B')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_1400
     * @tc.name      testCallableTypesWithInvokeMethod0014
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C_13().$_invoke()).assertEqual('b')
      expect(B_13.$_invoke()).assertEqual('B')
      expect(new B_13().$_invoke()).assertEqual('b')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_1600
     * @tc.name      testCallableTypesWithInvokeMethod0016
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C_15()).assertEqual(42)
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_1700
     * @tc.name      testCallableTypesWithInvokeMethod0017
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C7()).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_1800
     * @tc.name      testCallableTypesWithInvokeMethod0018
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C8().length).assertEqual(0)
      expect(C8(1)[0]).assertEqual(1)
      expect(C8(1, 2, 3)[2]).assertEqual(3)
      expect(C8.$_invoke(1)[0]).assertEqual(1)
      expect(C8.$_invoke(1, 2, 3)[1]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_1900
     * @tc.name      testCallableTypesWithInvokeMethod0019
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C9()).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_2000
     * @tc.name      testCallableTypesWithInvokeMethod0020
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C10().meth()).assertEqual('abcabc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_2100
     * @tc.name      testCallableTypesWithInvokeMethod0021
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C11_1()).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_2200
     * @tc.name      testCallableTypesWithInvokeMethod0022
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C12_1().meth()).assertEqual('abcabc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_2300
     * @tc.name      testCallableTypesWithInvokeMethod0023
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C_22()).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_WITH_INVOKE_METHOD_TEST_2400
     * @tc.name      testCallableTypesWithInvokeMethod0024
     * @tc.desc      The method invoke can have an arbitrary signature. The method can
     *               be used in a type call expression in either case above. If the
     *               signature has parameters, then the call must contain corresponding
     *               arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypesWithInvokeMethod0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C_23().meth()).assertEqual('abcabc')
    });
  });
}
