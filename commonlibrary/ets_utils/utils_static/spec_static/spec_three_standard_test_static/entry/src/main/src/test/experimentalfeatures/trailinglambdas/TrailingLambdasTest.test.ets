'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';
import Utils from '../../Util.test'

class A {
  static global: number = 0.0
  constructor(n: number, f: () => void) {
    f()
    A.global += n
  }
}

class A1 {
  static global: number = 0.0
  constructor(n: number, f?: () => void) {
    f?.()
    A1.global += n
  }
}

let globl: number = 0.0
function foo(n: number, f: () => void) {
  f()
  globl += n
}

type FF = () => void
let globl1: number = 0.0
function foo1(n: number, f?: FF) { // optional
  f?.()
  globl1 += n
}

type FF1 = () => void
let globl2: number = 0.0
function foo2(n: number, f: FF1) {
  f()
  globl2 += n
}

let globl3: number = 0.0
function foo3(n: number, f?: () => void) { // optional
  f?.()
  globl3 += n
}

let globl4: number = 0.0
function foo4(n: number, f: () => void) {
  f()
  globl4 += n
}

let globl5: number = 0.0
function foo5(n: number, f?: () => void) { // optional
  f?.()
  globl5 += n
}

let globl6: number = 0.0
function foo6(n: number, f: () => void) {
  f()
  globl6 += n
}

let globl7: number = 0.0
function foo7(n: number, f?: () => void) { // optional
  f?.()
  globl7 += n
}

let globl8: number = 0.0
function foo8(n: number) {
  globl8 += n
}

type FF2 = () => void
let globl9: number = 0.0
function foo9(n: number, f: FF2): number {
  f()
  return globl9 + n
}

type FF3 = () => void
let globl10: string = ""
function foo10(s: string, f: FF3): string {
  f()
  return globl10 += s
}

type FF4 = () => void
let globl11: number = 0.0
function foo11(n: number, f?: FF4): number { // optional
  f?.()
  return globl11 + n
}

type FF5 = () => void
let globl12: string = ""
function foo12(s: string, f?: FF5): string { // optional
  f?.()
  return globl12 += s
}

let globl13 = 0.0
function foo13(n: number, f: () => void) {
  f()
  return globl13 += n
}

class A2 {
  fld1: number = 0.0
  fld2: number = 0.0
}

let globl14 = ""
function foo14(s: string, f?: () => void): string {
  f?.()
  return globl14 + s
}

type FF6 = () => void
let g1 = 0.0
let g2 = 0.0
function foo15(f1: FF6, f2?: FF6): number {
  f1()
  f2?.()
  return g1 + 10.0 * g2
}

type StringProvider = () => string
function foo16(val1: String, val2?: String, lf?: StringProvider): string {
  return `${val1} ${val2} ${lf?.()}`
}

type StringProvider1 = () => string
function boo(val1: String, val2: String = 'Missed', lf?: StringProvider1): string {
  return `${val1} ${val2} ${lf?.()}`
}

type StringProvider2 = () => string
const stub: StringProvider2 = () => 'I am Stub'
function roo(val1: String, val2: String = 'Missed', lf: StringProvider2 = stub): string {
  return `${val1} ${val2} ${lf?.()}`
}

class A3 {
  static globl: number = 0.0
  foo(n: number, f: () => void) {
    f()
    A3.globl += n
  }
}

class A4 {
  static globl: number = 0.0
  foo(n: number, f?: () => void) { // optional
    f?.()
    A4.globl += n
  }
}

class A5 {
  static globl: number = 0.0
  foo(n: number, f: () => void) {
    f()
    A5.globl += n
  }
}

type FF7 = () => void
class A6 {
  static globl: number = 0.0
  foo(n: number, f?: FF7) { // optional
    f?.()
    A6.globl += n
  }
}

class A7 {
  static globl: number = 0.0
  foo(n: number, f: () => void) {
    f()
    A7.globl += n
  }
}

type FF8 = () => void
class A8 {
  static globl: number = 0.0
  foo(n: number, f?: FF8) { // optional
    f?.()
    A8.globl += n
  }
}

type FF9 = () => void
class A9 {
  static globl: number = 0.0
  foo(n: number, f: FF9) {
    f()
    A9.globl += n
  }
}

class A10 {
  static globl: number = 0.0
  foo(n: number, f?: () => void) { // optional
    f?.()
    A10.globl += n
  }
}

class A11 {
  static globl: number = 0.0
  foo(n: number) {
    A11.globl += n
  }
}

type StringProvider3 = () => string
class Holder {
  foo(val1: String, val2?: String, lf?: StringProvider3): string {
    return `${val1} ${val2} ${lf?.()}`
  }
}

type StringProvider4 = () => string
class Holder1 {
  boo(val1: String, val2: String = 'Missed', lf?: StringProvider4): string {
    return `${val1} ${val2} ${lf?.()}`
  }
}

type StringProvider5 = () => string
const stub1: StringProvider5 = () => 'I am Stub'
class Holder2 {
  roo(val1: String, val2: String = 'Missed', lf: StringProvider5 = stub1): string {
    return `${val1} ${val2} ${lf?.()}`
  }
}

let counter = 0
interface ReceiverTarget {}
type CounterProvider = (this: ReceiverTarget) => void

class Holder3 implements ReceiverTarget {
  foo(lf: CounterProvider) { lf(this) }
  boo(lf: CounterProvider) { lf(this) }
}

type CounterProvider1 = (this: ReceiverTarget1) => void

class ReceiverTarget1 {
  counter: int = 0
  foo(lf: CounterProvider1) { lf(this) }
  boo(lf: CounterProvider1) { lf(this) }
}

type CounterProvider2 = (this: ReceiverTarget2) => void

class ReceiverTarget2 {
  counter: int = 0
  inc() {
    this.counter++
  }
  foo(lf: CounterProvider2) { lf(this) }
  boo(lf: CounterProvider2) { lf(this) }
}

class A12 {
  static globl: number = 0.0
  static foo(n: number, f: () => void) {
    f()
    A12.globl += n
  }
}

class A13 {
  static globl: number = 0.0
  static foo(n: number, f?: () => void) { // optional
    f?.()
    A13.globl += n
  }
}

class A14 {
  static globl: number = 0.0
  static foo(n: number, f: () => void) {
    f()
    A14.globl += n
  }
}

type FF10 = () => void
class A15 {
  static globl: number = 0.0
  static foo(n: number, f?: FF10) { // optional
    f?.()
    A15.globl += n
  }
}

class A16 {
  static globl: number = 0.0
  static foo(n: number, f: () => void) {
    f()
    A16.globl += n
  }
}

type FF11 = () => void
class A17 {
  static globl: number = 0.0
  static foo(n: number, f?: FF11) { // optional
    f?.()
    A17.globl += n
  }
}

type FF12 = () => void
class A18 {
  static globl: number = 0.0
  static foo(n: number, f: FF12) {
    f()
    A18.globl += n
  }
}

class A19 {
  static globl: number = 0.0
  static foo(n: number, f?: () => void) { // optional
    f?.()
    A19.globl += n
  }
}

class A20 {
  static globl: number = 0.0
  static foo(n: number) {
    A20.globl += n
  }
}

type StringProvider6 = () => string
class Holder4 {
  static foo(val1: String, val2?: String, lf?: StringProvider6): string {
    return `${val1} ${val2} ${lf?.()}`
  }
}

type StringProvider7 = () => string
class Holder5 {
  static boo(val1: String, val2: String = 'Missed', lf?: StringProvider7): string {
    return `${val1} ${val2} ${lf?.()}`
  }
}

type StringProvider8 = () => string
const stub2: StringProvider8 = () => 'I am Stub'
class Holder6 {
  static roo(val1: String, val2: String = 'Missed', lf: StringProvider8 = stub2): string {
    return `${val1} ${val2} ${lf?.()}`
  }
}

export default function TrailingLambdasTest(): void {
  describe('TrailingLambdasTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await Utils.msSleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_0100
     * @tc.name      testTrailingLambdas0001
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // regular lambda in constructor
      A.global = 0.0
      new A(10.0, () => { A.global = 3.0 })
      expect(A.global).assertEqual(13.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_0200
     * @tc.name      testTrailingLambdas0002
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // regular optional lambda in constructor
      A1.global = 0.0
      new A1(10.0, () => { A1.global = 3.0 } )
      expect(A1.global).assertEqual(13.0)

      A1.global = 0.0
      new A1(10.0)
      expect(A1.global).assertEqual(10.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_0300
     * @tc.name      testTrailingLambdas0003
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // regular lambda
      foo(10.0, () => {
        globl = 3.0
      })
      expect(globl).assertEqual(13.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_0400
     * @tc.name      testTrailingLambdas0004
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // regular lambda
      foo1(10.0, () => {
        globl1 = 3.0
      })
      expect(globl1).assertEqual(13.0)

      foo1(10.0)
      expect(globl1).assertEqual(23.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_0500
     * @tc.name      testTrailingLambdas0005
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      foo2(10.0)  // trailing lambda
      {
        globl2 = 3.0
      }
      expect(globl2).assertEqual(13.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_0600
     * @tc.name      testTrailingLambdas0006
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      foo3(10.0)  // trailing lambda
      {
        globl3 = 3.0
      }
      expect(globl3).assertEqual(13.0)

      foo3(10.0)
      expect(globl3).assertEqual(23.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_0700
     * @tc.name      testTrailingLambdas0007
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // regular lambda
      foo4(10.0, () => { globl4 = 3.0 })
      {
        globl4 = 4.0
      }
      expect(globl4).assertEqual(4.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_0800
     * @tc.name      testTrailingLambdas0008
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // regular lambda
      foo5(10.0, () => { globl5 = 3.0 })
      {
        globl5 = 4.0
      }
      expect(globl5).assertEqual(4.0)

      foo5(10.0) // trailing lambda
      {
        globl5 = 5.0
      }
      expect(globl5).assertEqual(15.0)

      foo5(10.0)  // no trailing lambda
      expect(globl5).assertEqual(25.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_0900
     * @tc.name      testTrailingLambdas0009
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // not a trailing lambda, block separated by semicolon
      foo6(10.0, () => { globl6 = 3.0 }); { globl6 = 4.0 }
      expect(globl6).assertEqual(4.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_1000
     * @tc.name      testTrailingLambdas0010
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // not a trailing lambda, block separated with semicolon
      foo7(10.0, () => { globl7 = 3.0 }); { globl7 = 4.0 }
      expect(globl7).assertEqual(4.0)

      foo7(10.0) { globl7 = 13.0 }  // trailing lambda
      expect(globl7).assertEqual(23.0)

      foo7(10.0); { globl7 = 13.0 } // not a trailing lambda
      expect(globl7).assertEqual(13.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_1100
     * @tc.name      testTrailingLambdas0011
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl8 = 1.0
      foo8(10.0); { globl8 = 4.0 } // no last function parameter
      expect(globl8).assertEqual(4.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_1200
     * @tc.name      testTrailingLambdas0012
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl9 = 0.0
      expect(foo9(foo9(3.0) { globl9 = 6.0 }) { globl9 = 2.0 }).assertEqual(11.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_1300
     * @tc.name      testTrailingLambdas0013
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl10 = ""
      expect(foo10(foo10("A") { globl10 += "B" }) { globl10 += "C" }).assertEqual("BACBA")
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_1400
     * @tc.name      testTrailingLambdas0014
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl11 = 0.0
      expect(foo11(foo11(3.0) 
        {
          globl11 = 6.0
        }
      ) { globl11 = 2.0 }).assertEqual(11.0)

      globl11 = 0.0
      expect(foo11(foo11(3.0) {}) {}).assertEqual(3.0)
      expect(foo11(foo11(3.0)) { globl11 = 1.0 }).assertEqual(4.0)
      expect(foo11(foo11(3.0) { globl11 = 1.0 })).assertEqual(5.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_1500
     * @tc.name      testTrailingLambdas0015
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl12 = ""
      expect(foo12(foo12("A") { globl12 += "B" }) { globl12 += "C" }).assertEqual("BACBA")

      globl12 = ""
      expect(foo12(foo12("A")) {
        globl12 += "C"
      }).assertEqual("ACA")

      globl12 = ""
      expect(foo12(foo12("A") { globl12 += "B" })).assertEqual("BABA")

      globl12 = ""
      expect(foo12(foo12("A"))).assertEqual("AA")
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_1600
     * @tc.name      testTrailingLambdas0016
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl13 = 0.0
      let v: A2 = { fld1: foo13(1.0) { globl13 = 3.0 }, fld2: foo13(2.0) { globl13 += 5.0 } }
      expect(v.fld1 == 4.0 && v.fld2 == 11.0).assertTrue()
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_1700
     * @tc.name      testTrailingLambdas0017
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl14 = ""
      let s = `abc ${foo14("A") { globl14 = "Z" }} def ${foo14("B")} ghi ${foo14("C") {}} jkl`
      expect(s).assertEqual("abc ZA def ZB ghi ZC jkl")
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_1800
     * @tc.name      testTrailingLambdas0018
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      g1 = 0.0
      g2 = 0.0
      expect(foo15(() => { g1 = 2.0 }, () => { g2 = 4.0 })).assertEqual(42.0)
      g1 = 0.0
      g2 = 0.0
      expect(foo15(() => { g1 = 2.0 }) { g2 = 4.0 }).assertEqual(42.0)
      g1 = 0.0
      g2 = 0.0
      expect(foo15(() => { g1 = 2.0 })).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_1900
     * @tc.name      testTrailingLambdas0019
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo16('Hello', 'World', () => 'of Trailing Lambdas')
      expect('Hello World of Trailing Lambdas').assertEqual(result);

      result = foo16('Hello') {
        return 'of Trailing Lambdas'
      }
      expect('Hello undefined of Trailing Lambdas').assertEqual(result);

      result = foo16('Hello'); {
        // This is not a trailing lambda block
      }
      expect('Hello undefined undefined').assertEqual(result);
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_2000
     * @tc.name      testTrailingLambdas0020
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = boo('Hello', 'World', () => 'of Trailing Lambdas')
      expect('Hello World of Trailing Lambdas').assertEqual(result);

      result = boo('Hello') {
        return 'of Trailing Lambdas'
      }
      expect('Hello Missed of Trailing Lambdas').assertEqual(result);

      result = boo('Hello'); {
        // This is not a trailing lambda block
      }
      expect('Hello Missed undefined').assertEqual(result);
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_2100
     * @tc.name      testTrailingLambdas0021
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = roo('Hello', 'World', () => 'of Trailing Lambdas')
      expect('Hello World of Trailing Lambdas').assertEqual(result);

      result = roo('Hello'); {
        // This is not a trailing lambda block
      }
      expect('Hello Missed I am Stub').assertEqual(result);
    });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_3400
     * @tc.name      testTrailingLambdas0034
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
      it('testTrailingLambdas0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        counter = 0;
        let ld = (this: ReceiverTarget) => { counter++ }

        let holder = new Holder3
        holder.foo(ld)
        holder.foo() { counter++ }
        holder.boo(ld)
        holder.boo() { counter ++ }
        expect(4).assertEqual(counter)
      });

    /**
     * @tc.number    SUB_TRAILING_LAMBDAS_TEST_3600
     * @tc.name      testTrailingLambdas0036
     * @tc.desc      The trailing lambda mechanism allows using a special form of function or method
     *               call when the last parameter of a function or a method is of function type, and
     *               the argument is passed as a lambda using the {} notation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingLambdas0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ld = (this: ReceiverTarget2) => { this.inc() }

      let holder = new ReceiverTarget2
      holder.foo(ld)
      holder.foo() { holder.inc() }
      holder.boo(ld)
      holder.boo() { holder.inc() }
      expect(4).assertEqual(holder.counter)
    });
  })
}
