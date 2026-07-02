'use static';
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

class A1 { id1: number = 1}
final class B1 extends A1 {id1: number = 2}
class C1<T1 extends A1> {
  t1: T1
  constructor (t1: T1) {this.t1 = t1}
  foo1(): number {return this.t1.id1}
}
final class D1<T1 extends A1> extends C1<T1> {
  constructor (t1: T1) {super(t1)}
}

class B2<T2> {}

class A3 { id3: number = 1 }
final class B3 extends A3 { id3: number = 2 }
final class C3<T3 extends A3> {
  t3: T3
  constructor (t3: T3) { this.t3 = t3 }
  foo3(): number { return this.t3.id3 }
}

class A4 {}
final class B4<T4> extends A4 {}

class D5 {}
class E5 extends D5 {}
class A5<T5,S5> {}
class B5<T5,S5> extends A5<T5,S5> {}
let t5: A5<D5,E5>

class D6 {}
class E6 extends D6 {}
class A6<T6,S6> {}
class B6<T6,S6> extends A6<T6,S6> {}
let t6: Object

class D7 {}
class E7 extends D7 {}
interface A7<T7,S7> {}
class B7<T7,S7> implements A7<T7,S7> {}
let a7: A7<D7,E7>
let s7: B7<D7,E7> = new B7<D7,E7>
let t7: A7<D7,E7>

class Da8 {}
class E8 extends Da8 {}
interface A8<T8,S8> {}
interface B8<T8,S8> extends A8<T8,S8> {}
let a8: A8<Da8,E8>
let s8: B8<Da8,E8>
let t8: A8<Da8,E8>
class X8<T8,S8> implements A8<T8,S8> {}
class Y8<T8,S8> implements B8<T8,S8> {}
t8 = new X8<Da8,E8>
s8 = new Y8<Da8,E8>

class D9 {}
class E9 extends D9 {}
interface A9<T9,S9> {}
class B9<T9,S9> implements A9<T9,S9> {}
let a9: Object
let s9: A9<D9,E9> = new B9<D9,E9>;

class D10 {}
class E10 extends D10 {}
class A10<T10,S10> {}
class B10<T10,S10> extends A10<T10,S10> {}
function foo10(t10: A10<D10,E10>): A10<D10,E10> {
  return t10
}

class D11 {}
class E11 extends D11 {}
class A11<T11,S11> {}
class B11<T11,S11> extends A11<T11,S11> {}
function foo11(t11: Object): Object {
  return t11
}

class D12 {}
class E12 extends D12 {}
interface A12<T12,S12> {}
class B12<T12,S12> implements A12<T12,S12> {}
function foo12(t12: A12<D12,E12>): A12<D12,E12> {
  return t12
}
let s12: B12<D12,E12> = new B12<D12,E12>
let t12: A12<D12,E12>

class D13 {}
class E13 extends D13 {}
interface A13<T13,S13> {}
interface B13<T13,S13> extends A13<T13,S13> {}
function foo13(t13: A13<D13,E13>): A13<D13,E13> {
  return t13
}
let t13: A13<D13,E13>
let s13: B13<D13,E13>
class X13<T13,S13> implements A13<T13,S13> {}
class Y13<T13,S13> implements B13<T13,S13> {}
t13 = new X13<D13,E13>
s13 = new Y13<D13,E13>

class D14 {}
class E14 extends D14 {}
interface A14<T14,S14> {}
class B14<T14,S14> implements A14<T14,S14> {}
function foo14(t14: Object): Object {
  return t14
}
let s14: A14<D14,E14> = new B14<D14,E14>;

class D15 {}
class E15 extends D15 {}
class A15<T15,S15> {}
class B15<T15,S15> extends A15<T15,S15> {}
class C15 {
  foo15(t15: A15<D15,E15>): A15<D15,E15> {
    return t15
  }
}

class D16 {}
class E16 extends D16 {}
class A16<T16,S16> {}
class B16<T16,S16> extends A16<T16,S16> {}
class C16 {
  foo16(t16: Object): Object {
    return t16
  }
}

class D17 {}
class E17 extends D17 {}
interface A17<T17,S17> {}
class B17<T17,S17> implements A17<T17,S17> {}
class C17 {
  foo17(t17: A17<D17,E17>): A17<D17,E17>{
    return t17
  }
}
let s17: B17<D17,E17> = new B17<D17,E17>
let t17: A17<D17,E17>

class D18 {}
class E18 extends D18 {}
interface A18<T18,S18> {}
interface B18<T18,S18> extends A18<T18,S18> {}
class C18 {
  foo18(t18: A18<D18,E18>): A18<D18,E18> {
    return t18
  }
}
let s18: B18<D18,E18>
let t18: A18<D18,E18>
class X18<T18,S18> implements A18<T18,S18> {}
class Y18<T18,S18> implements B18<T18,S18> {}
t18 = new X18<D18,E18>
s18 = new Y18<D18,E18>

class D19 {}
class E19 extends D19 {}
interface A19<T19,S19> {}
class B19<T19,S19> implements A19<T19,S19> {}
class C19 {
  foo19(t19: Object): Object {
    return t19
  }
}
let s19: A19<D19,E19> = new B19<D19,E19>;

class D20 {}
class E20 extends D20 {}
class A20<T20,S20> {}
class B20<T20,S20> extends A20<T20,S20> {}
class C20 {
  static foo20(t20: A20<D20,E20>): A20<D20,E20> {
    return t20
  }
}

class D21 {}
class E21 extends D21 {}
class A21<T21,S21> {}
class B21<T21,S21> extends A21<T21,S21> {}
class C21 {
  static foo21(t21: Object): Object {
    return t21
  }
}

class D22 {}
class E22 extends D22 {}
interface A22<T22,S22> {}
class B22<T22,S22> implements A22<T22,S22> {}
class C22 {
  static foo22(t22: A22<D22,E22>): A22<D22,E22> {
    return t22
  }
}
let s22: B22<D22,E22> = new B22<D22,E22>
let t22: A22<D22,E22>

class D23 {}
class E23 extends D23 {}
interface A23<T23,S23> {}
interface B23<T23,S23> extends A23<T23,S23> {}
class C23 {
  static foo23(t23: A23<D23,E23>): A23<D23,E23> {
    return t23
  }
}
let s23: B23<D23,E23>
let t23: A23<D23,E23>
class X23<T23,S23> implements A23<T23,S23> {}
class Y23<T23,S23> implements B23<T23,S23> {}
t23 = new X23<D23,E23>
s23 = new Y23<D23,E23>

class D24 {}
class E24 extends D24 {}
interface A24<T24,S24> {}
class B24<T24,S24> implements A24<T24,S24> {}
class C24 {
  static foo24(t24: Object): Object {
    return t24
  }
}
let s24: A24<D24,E24> = new B24<D24,E24>;

class D25 {}
class E25 extends D25 {}
class A25<T25,S25> {}
class B25<T25,S25> extends A25<T25,S25> {}
class C25 {
  a25: A25<D25,E25>
  constructor(a25: A25<D25,E25>) {
    this.a25 = a25
  }
}

class D26 {}
class E26 extends D26 {}
class A26<T26,S26> {}
class B26<T26,S26> extends A26<T26,S26> {}
class C26 {
  a26: Object
  constructor(a26: Object) {
    this.a26 = a26
  }
}

class D27 {}
class E27 extends D27 {}
interface A27<T27,S27> {}
class B27<T27,S27> implements A27<T27,S27> {}
class C27 {
  a27: A27<D27,E27>
  constructor(a27: A27<D27,E27>) {
    this.a27 = a27
  }
}
let s27: B27<D27,E27> = new B27<D27,E27>
let t27: A27<D27,E27>

class D28 {}
class E28 extends D28 {}
interface A28<T28,S28> {}
interface B28<T28,S28> extends A28<T28,S28> {}
class C28 {
  c28: A28<D28,E28>
  constructor(c28: A28<D28,E28>) {
    this.c28 = c28
  }
}
let s28: B28<D28,E28>
let t28: A28<D28,E28>
class X28<T28,S28> implements A28<T28,S28> {}
class Y28<T28,S28> implements B28<T28,S28> {}
t28 = new X28<D28,E28>
s28 = new Y28<D28,E28>

class D29 {}
class E29 extends D29 {}
interface A29<T29,S29> {}
class B29<T29,S29> implements A29<T29,S29> {}
class C29 {
  a29: Object
  constructor(a29: Object) {
    this.a29 = a29
  }
}
let s29: A29<D29,E29> = new B29<D29,E29>;

interface C30<T30 extends String, G30 extends Number> {
  name: T30;
}
interface D30<T30 extends String, G30 extends Number> extends C30<T30, G30> {
  name: T30;
  id: G30;
}

class X31 {}
class Y31 extends X31 {}
interface A31<T31> {
  x31: T31
}
interface B31<G31 extends X31> extends A31<X31> {
  y31: G31
}

class D32 {}
class E32 extends D32 {}
class F32 extends E32 {}

class A32<in T32, out S32> {
  readonly s32: S32
  constructor(s32: S32) { this.s32 = s32 }
  foo32(t32: T32): S32 { return this.s32 }
}

class D33 {}
class E33 extends D33 {}
class F33 extends E33 {}
class A33<in T33, out S33> {
  readonly s33: S33
  constructor(s33: S33) { this.s33 = s33 }
  foo33(t33: T33): S33 { return this.s33 }
}

class D34 {}
class E34 extends D34 {}
class F34 extends E34 {}
class A34<in T34, out S34> {
  readonly s34: S34
  constructor(s34: S34) { this.s34 = s34 }
  foo34(t34: T34): S34 { return this.s34 }
}

class D35 {}
class E35 extends D35 {}
class F35 extends E35 {}
class A35<in T35, out S35> {
  readonly s35: S35
  constructor(s35: S35) { this.s35 = s35 }
  foo35(t35: T35): S35 { return this.s35 }
}

class D36 {}
class E36 extends D36 {}
class F36 extends E36 {}
class A36<in T36, out S36> {
  readonly s36: S36
  constructor(s36: S36) { this.s36 = s36 }
  foo36(t36: T36): S36 { return this.s36 }
}

class D37 {}
class E37 extends D37 {}
class F37 extends E37 {}
class A37<in T37, out S37> {
  readonly s37: S37
  constructor(s37: S37) { this.s37 = s37 }
  foo37(t37: T37): S37 { return this.s37 }
}

class D38 {}
class E38 extends D38 {}
class F38 extends E38 {}
class A38<in T38, out S38> {
  readonly s38: S38
  constructor(s38: S38) { this.s38 = s38 }
  foo38(t38: T38): S38 { return this.s38 }
}

class D39 {}
class E39 extends D39 {}
class F39 extends E39 {}
class A39<in T39, out S39> {
  readonly s39: S39
  constructor(s39: S39) { this.s39 = s39 }
  foo39(t39: T39): S39 { return this.s39 }
}

class D40 {}
class E40 extends D40 {}
class A40<in T40, out S40> {
  readonly s40: S40
  constructor(s40: S40) { this.s40 = s40 }
  foo40(t40: T40): S40 { return this.s40 }
}

class D41 {}
class E41 extends D41 {}
class F41 extends E41 {}
class A41<in T41, out S41> {
  readonly s41: S41
  constructor(s41: S41) { this.s41 = s41 }
  foo41(t41: T41): S41 { return this.s41 }
}

export default function SubtypingForGenericClassesAndInterfacesTest(): void {
  describe('SubtypingForGenericClassesAndInterfacesTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_0100
     * @tc.name      testGenericCastToGenericSuperclass0001
     * @tc.desc      Subtyping relation among the generic class types with same parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericCastToGenericSuperclass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instance: C1<B1> = new D1<B1>(new B1());
      expect(instance.foo1()).assertEqual(2)
      expect(instance instanceof D1).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_0200
     * @tc.name      testGenericCastToObject0002
     * @tc.desc      Subtyping relation among the generic class and Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericCastToObject0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b2: B2<String> = new B2<String>();
      let instance: Object = b2
      expect(instance instanceof B2).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_0300
     * @tc.name      testGenericCastToObjectWithParameters0003
     * @tc.desc      Subtyping relation among the generic class and Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericCastToObjectWithParameters0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instance: Object = new C3<B3>(new B3());
      expect(instance.foo3()).assertEqual(2)
      expect(instance instanceof C3).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_0400
     * @tc.name      testGenericCastToSuperclass0004
     * @tc.desc      Subtyping relation among the generic class types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericCastToSuperclass0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instance: A4 = new B4<String>();
      let o4: Object = instance
      expect(o4 instanceof B4).assertTrue()
      expect(o4 instanceof A4).assertTrue()
      expect(instance instanceof B4).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_0500
     * @tc.name      testGenericClsAndIntfSubtyping0005
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = (t5 = new A5<D5,E5>)
      let derived = (t5 = new B5<D5,E5>)

      expect(base instanceof A5).assertTrue()
      expect(base instanceof B5).assertFalse()
      base = derived
      expect(base instanceof A5).assertTrue()
      expect(base instanceof B5).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_0600
     * @tc.name      testGenericClsAndIntfSubtyping0006
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = (t6 = new Object)
      let derived = (t6 = new B6<D6,E6>)

      expect(base instanceof Object).assertTrue()
      expect(base instanceof B6).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B6).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_0700
     * @tc.name      testGenericClsAndIntfSubtyping0007
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      t7 = {}
      let base = (a7 = t7)
      let derived = (a7 = t7 = s7)

      expect(base instanceof A7).assertTrue()
      expect(base instanceof B7).assertFalse()
      base = derived
      expect(base instanceof A7).assertTrue()
      expect(base instanceof B7).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_0800
     * @tc.name      testGenericClsAndIntfSubtyping0008
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = (a8 = t8)
      let derived = (a8 = s8)

      expect(base instanceof A8).assertTrue()
      expect(base instanceof B8).assertFalse()
      base = derived
      expect(base instanceof A8).assertTrue()
      expect(base instanceof B8).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_0900
     * @tc.name      testGenericClsAndIntfSubtyping0009
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = (a9 = new Object)
      let derived = (a9 = s9)

      expect(base instanceof Object).assertTrue()
      expect(base instanceof B9).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B9).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_1000
     * @tc.name      testGenericClsAndIntfSubtyping0010
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = foo10(new A10<D10,E10>)
      let derived = foo10(new B10<D10,E10>)
      expect(base instanceof A10).assertTrue()
      expect(base instanceof B10).assertFalse()
      base = derived
      expect(base instanceof A10).assertTrue()
      expect(base instanceof B10).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_1100
     * @tc.name      testGenericClsAndIntfSubtyping0011
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = foo11(new Object)
      let derived = foo11(new B11<D11,E11>)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B11).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B11).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_1200
     * @tc.name      testGenericClsAndIntfSubtyping0012
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      t12 = {}
      let base = foo12(t12)
      let derived = foo12(t12 = s12)
      expect(base instanceof A12).assertTrue()
      expect(base instanceof B12).assertFalse()
      base = derived
      expect(base instanceof A12).assertTrue()
      expect(base instanceof B12).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_1300
     * @tc.name      testGenericClsAndIntfSubtyping0013
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = foo13(t13)
      let derived = foo13(s13)
      expect(base instanceof A13).assertTrue()
      expect(base instanceof B13).assertFalse()
      base = derived
      expect(base instanceof A13).assertTrue()
      expect(base instanceof B13).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_1400
     * @tc.name      testGenericClsAndIntfSubtyping0014
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = foo14(new Object)
      let derived = foo14(s14)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B14).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B14).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_1500
     * @tc.name      testGenericClsAndIntfSubtyping0015
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new C15().foo15(new A15<D15,E15>)
      let derived = new C15().foo15(new B15<D15,E15>)
      expect(base instanceof A15).assertTrue()
      expect(base instanceof B15).assertFalse()
      base = derived
      expect(base instanceof A15).assertTrue()
      expect(base instanceof B15).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_1600
     * @tc.name      testGenericClsAndIntfSubtyping0016
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new C16().foo16(new Object)
      let derived = new C16().foo16(new B16<D16,E16>)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B16).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B16).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_1700
     * @tc.name      testGenericClsAndIntfSubtyping0017
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      t17 = {}
      let base = new C17().foo17(t17)
      let derived = new C17().foo17(t17 = s17)
      expect(base instanceof A17).assertTrue()
      expect(base instanceof B17).assertFalse()
      base = derived
      expect(base instanceof A17).assertTrue()
      expect(base instanceof B17).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_1800
     * @tc.name      testGenericClsAndIntfSubtyping0018
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new C18().foo18(t18)
      let derived = new C18().foo18(s18)
      expect(base instanceof A18).assertTrue()
      expect(base instanceof B18).assertFalse()
      base = derived
      expect(base instanceof A18).assertTrue()
      expect(base instanceof B18).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_1900
     * @tc.name      testGenericClsAndIntfSubtyping0019
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new C19().foo19(new Object)
      let derived = new C19().foo19(s19)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B19).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B19).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_2000
     * @tc.name      testGenericClsAndIntfSubtyping0020
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = C20.foo20(new A20<D20,E20>)
      let derived = C20.foo20(new B20<D20,E20>)
      expect(base instanceof A20).assertTrue()
      expect(base instanceof B20).assertFalse()
      base = derived
      expect(base instanceof A20).assertTrue()
      expect(base instanceof B20).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_2100
     * @tc.name      testGenericClsAndIntfSubtyping0021
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = C21.foo21(new Object)
      let derived = C21.foo21(new B21<D21,E21>)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B21).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B21).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_2200
     * @tc.name      testGenericClsAndIntfSubtyping0022
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      t22 = {}
      let base = C22.foo22(t22)
      let derived = C22.foo22(t22 = s22)
      expect(base instanceof A22).assertTrue()
      expect(base instanceof B22).assertFalse()
      base = derived
      expect(base instanceof A22).assertTrue()
      expect(base instanceof B22).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_2300
     * @tc.name      testGenericClsAndIntfSubtyping0023
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = C23.foo23(t23)
      let derived = C23.foo23(s23)
      expect(base instanceof A23).assertTrue()
      expect(base instanceof B23).assertFalse()
      base = derived
      expect(base instanceof A23).assertTrue()
      expect(base instanceof B23).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_2400
     * @tc.name      testGenericClsAndIntfSubtyping0024
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = C24.foo24(new Object)
      let derived = C24.foo24(s24)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B24).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B24).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_2500
     * @tc.name      testGenericClsAndIntfSubtyping0025
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new C25(new A25<D25,E25>).a25
      let derived = new C25(new B25<D25,E25>).a25
      expect(base instanceof A25).assertTrue()
      expect(base instanceof B25).assertFalse()
      base = derived
      expect(base instanceof A25).assertTrue()
      expect(base instanceof B25).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_2600
     * @tc.name      testGenericClsAndIntfSubtyping0026
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new C26(new Object).a26
      let derived = new C26(new B26<D26,E26>).a26
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B26).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B26).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_2700
     * @tc.name      testGenericClsAndIntfSubtyping0027
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      t27 = {}
      let base = new C27(t27).a27
      let derived = new C27(t27 = s27).a27
      expect(base instanceof A27).assertTrue()
      expect(base instanceof B27).assertFalse()
      base = derived
      expect(base instanceof A27).assertTrue()
      expect(base instanceof B27).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_2800
     * @tc.name      testGenericClsAndIntfSubtyping0028
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new C28(t28).c28
      let derived = new C28(s28).c28
      expect(base instanceof A28).assertTrue()
      expect(base instanceof B28).assertFalse()
      base = derived
      expect(base instanceof A28).assertTrue()
      expect(base instanceof B28).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_2900
     * @tc.name      testGenericClsAndIntfSubtyping0029
     * @tc.desc      Subtyping relation between generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsAndIntfSubtyping0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new C29(new Object).a29
      let derived = new C29(s29).a29
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B29).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof B29).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_3000
     * @tc.name      testGenericSubAndSuperinterfaces0030
     * @tc.desc      Subtyping relation among the generic interface types with same parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericSubAndSuperinterfaces0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instanceD: D30<String, Number> = { name: 'String2', id: 2.0 }
      let instanceC: C30<String, Number> = instanceD;
      expect(instanceC instanceof D30).assertTrue()
      expect(instanceC.name instanceof String).assertTrue()
      expect(instanceC.name).assertEqual('String2')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_3100
     * @tc.name      testGenericSubinterface0031
     * @tc.desc      Subtyping relation among the generic interface types with same parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericSubinterface0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instanceB: B31<Y31>  = {x31: new X31(), y31: new Y31()}
      let instanceA: A31<X31> = instanceB;
      expect(instanceA instanceof B31).assertTrue()
      expect(instanceA.x31 instanceof X31).assertTrue()
      expect(instanceA.y31 instanceof Y31).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_3200
     * @tc.name      testGenericClsSubtypingTypeVariance0032
     * @tc.desc      Subtyping relation between generic classes with type variance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsSubtypingTypeVariance0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A32<F32,E32>(new E32)
      let subtype = new A32<E32,F32>(new F32)
      expect(base.foo32(new F32) instanceof E32).assertTrue()
      base = subtype
      expect(base.foo32(new E32) instanceof E32).assertTrue()
      expect(base.foo32(new E32) instanceof F32).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_3300
     * @tc.name      testGenericClsSubtypingTypeVariance0033
     * @tc.desc      Subtyping relation between generic classes with type variance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsSubtypingTypeVariance0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A33<F33,D33>(new D33)
      let subtype = new A33<D33,F33>(new F33)
      expect(base.foo33(new F33) instanceof D33).assertTrue()
      base = subtype
      expect(base.foo33(new D33) instanceof D33).assertTrue()
      expect(base.foo33(new D33) instanceof F33).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_3400
     * @tc.name      testGenericClsSubtypingTypeVariance0034
     * @tc.desc      Subtyping relation between generic classes with type variance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsSubtypingTypeVariance0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A34<F34,D34>(new D34)
      let subtype = new A34<D34,F34>(new F34)
      expect(base.foo34(new F34) instanceof D34).assertTrue()
      base = subtype
      expect(base.foo34(new D34) instanceof D34).assertTrue()
      expect(base.foo34(new D34) instanceof E34).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_3500
     * @tc.name      testGenericClsSubtypingTypeVariance0035
     * @tc.desc      Subtyping relation between generic classes with type variance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsSubtypingTypeVariance0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A35<E35,F35>(new F35)
      let subtype = new A35<D35,F35>(new F35)
      expect(base.foo35(new F35) instanceof E35).assertTrue()
      base = subtype
      expect(base.foo35(new F35) instanceof E35).assertTrue()
      expect(base.foo35(new F35) instanceof D35).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_3600
     * @tc.name      testGenericClsSubtypingTypeVariance0036
     * @tc.desc      Subtyping relation between generic classes with type variance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsSubtypingTypeVariance0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A36<D36,E36>(new E36)
      let subtype = new A36<D36,F36>(new F36)
      expect(base.foo36(new D36) instanceof E36).assertTrue()
      base = subtype
      expect(base.foo36(new F36) instanceof E36).assertTrue()
      expect(base.foo36(new F36) instanceof F36).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_3700
     * @tc.name      testGenericClsSubtypingTypeVariance0037
     * @tc.desc      Subtyping relation between generic classes with type variance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsSubtypingTypeVariance0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A37<F37,F37>(new F37)
      let subtype = new A37<E37,F37>(new F37)
      expect(base.foo37(new F37) instanceof F37).assertTrue()
      base = subtype
      expect(base.foo37(new E37) instanceof F37).assertTrue()
      expect(base.foo37(new E37) instanceof F37).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_3800
     * @tc.name      testGenericClsSubtypingTypeVariance0038
     * @tc.desc      Subtyping relation between generic classes with type variance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsSubtypingTypeVariance0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A38<E38,E38>(new E38)
      let subtype = new A38<D38,F38>(new F38)
      expect(base.foo38(new E38) instanceof E38).assertTrue()
      base = subtype
      expect(base.foo38(new D38) instanceof E38).assertTrue()
      expect(base.foo38(new D38) instanceof F38).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_3900
     * @tc.name      testGenericClsSubtypingTypeVariance0039
     * @tc.desc      Subtyping relation between generic classes with type variance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsSubtypingTypeVariance0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A39<E39,F39>(new F39)
      let subtype = new A39<D39,F39>(new F39)
      expect(base.foo39(new E39) instanceof F39).assertTrue()
      base = subtype
      expect(base.foo39(new D39) instanceof F39).assertTrue()
      expect(base.foo39(new D39) instanceof F39).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_4000
     * @tc.name      testGenericClsSubtypingTypeVariance0040
     * @tc.desc      Subtyping relation between generic classes with type variance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsSubtypingTypeVariance0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A40<D40,D40>(new D40)
      let subtype = new A40<D40,E40>(new E40)
      expect(base.foo40(new D40) instanceof D40).assertTrue()
      base = subtype
      expect(base.foo40(new D40) instanceof D40).assertTrue()
      expect(base.foo40(new D40) instanceof E40).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_GENERIC_CLASSES_AND_INTERFACESTEST_4100
     * @tc.name      testGenericClsSubtypingTypeVariance0041
     * @tc.desc      Subtyping relation between generic classes with type variance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClsSubtypingTypeVariance0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A41<D41,D41>(new D41)
      let subtype = new A41<D41,F41>(new F41)
      expect(base.foo41(new D41) instanceof D41).assertTrue()
      base = subtype
      expect(base.foo41(new D41) instanceof D41).assertTrue()
      expect(base.foo41(new D41) instanceof F41).assertTrue()
    });

  })
}
