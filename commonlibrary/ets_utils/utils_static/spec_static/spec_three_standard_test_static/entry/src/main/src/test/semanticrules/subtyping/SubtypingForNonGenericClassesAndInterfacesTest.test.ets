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

class B1 {}

class A3 {
  foo(): int { return 1 }
}
class B3 extends A3 {
  override foo(): int { return 2 }
}
final class C3 extends B3 {
  override foo(): int { return 3 }
}

class T7 {}
class S7 extends T7 {}
let t7: T7

class T8 {}
class S8 extends T8 {}
let t8: Object

interface T9 {}
class S9 implements T9 {}
let a9: T9
let s9: S9 = new S9
let t9: T9

interface T10 {}
interface S10 extends T10 {}
let a10: T10
let s10: S10
let t10: T10
class A10 implements T10 {}
class B10 implements S10 {}
t10 = new A10
s10 = new B10

interface T11 {}
class S11 implements T11 {}
let a11: Object
let s11: T11 = new S11;

class T12 {}
class S12 extends T12 {}
function foo12(t12: T12): T12 {
  return t12
}

class T13 {}
class S13 extends T13 {}
function foo13(t13: Object): Object {
  return t13
}

interface T14 {}
class S14 implements T14 {}
function foo14(t14: T14): T14 {
  return t14
}
let s14: S14 = new S14
let t14: T14

interface T15 {}
interface S15 extends T15 {}
function foo15(t15: T15): T15 {
  return t15
}
let s15: S15
let t15: T15
class A15 implements T15 {}
class B15 implements S15 {}
t15 = new A15
s15 = new B15

interface T16 {}
class S16 implements T16 {}
function foo16(t16: Object): Object {
  return t16
}
let s16: T16 = new S16;

class T17 {}
class S17 extends T17 {}
class A17 {
  foo17(t17: T17): T17 {
    return t17
  }
}

interface T18 {}
class S18 implements T18 {}
class A18 {
  foo18(t18: T18): T18 {
    return t18
  }
}
let s18: S18 = new S18
let t18: T18

interface T19 {}
interface S19 extends T19 {}
class C19 {
  foo19(t19: T19): T19 {
    return t19
  }
}
let s19: S19
let t19: T19
class A19 implements T19 {}
class B19 implements S19 {}
t19 = new A19
s19 = new B19

interface T20 {}
class S20 implements T20 {}
class A20 {
  foo20(t20: Object): Object {
    return t20
  }
}
let s20: T20 = new S20;

class T21 {}
class S21 extends T21 {}
class A21 {
  static foo21(t21: T21): T21 {
    return t21
  }
}

class T22 {}
class S22 extends T22 {}
class A22 {
  static foo22(t22: Object): Object {
    return t22
  }
}

interface T23 {}
class S23 implements T23 {}
class A23 {
  static foo23(t23: T23): T23 {
    return t23
  }
}
let s23: S23 = new S23
let t23: T23

interface T24 {}
interface S24 extends T24 {}
class C24 {
  static foo24(t24: T24): T24 {
    return t24
  }
}
let s24: S24
let t24: T24
class A24 implements T24 {}
class B24 implements S24 {}
t24 = new A24
s24 = new B24

interface T25 {}
class S25 implements T25 {}
class A25 {
  static foo25(t25: Object): Object {
    return t25
  }
}
let s25: T25 = new S25;

class T26 {}
class S26 extends T26 {}
class A26 {
  a26: T26
  constructor(a26: T26) {
    this.a26 = a26
  }
}

class T27 {}
class S27 extends T27 {}
class A27 {
  a27: Object
  constructor(a27: Object) {
    this.a27 = a27
  }
}

interface T28 {}
class S28 implements T28 {}
class A28 {
  a28: T28
  constructor(a28: T28) {
    this.a28 = a28
  }
}
let s28: S28 = new S28
let t28: T28

interface T29 {}
interface S29 extends T29 {}
class C29 {
  c29: T29
  constructor(c29: T29) {
    this.c29 = c29
  }
}
let s29: S29
let t29: T29
class A29 implements T29 {}
class B29 implements S29 {}
t29 = new A29
s29 = new B29

interface T30 {}
class S30 implements T30 {}
class A30 {
  a30: Object
  constructor(a30: Object) {
    this.a30 = a30
  }
}
let s30: T30 = new S30;

interface A31 {}
interface B31 extends A31 {}

export default function SubtypingForNonGenericClassesAndInterfacesTest(): void {
  describe('SubtypingForNonGenericClassesAndInterfacesTest', () => {
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
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_0100
     * @tc.name      testNonGenericCastToObject0001
     * @tc.desc      Subtyping relation among the class and Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericCastToObject0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instance: Object = new B1();
      expect(instance instanceof B1).assertTrue()

    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_0300
     * @tc.name      testNonGenericCastToSuperclass0003
     * @tc.desc      Subtyping relation among the class types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericCastToSuperclass0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instanceA = new A3()
      let instanceB = new B3()
      let instanceC = new C3()

      instanceB = instanceC
      instanceA = instanceC
      instanceA = instanceB

      expect(instanceA instanceof C3).assertTrue()
      expect(instanceA instanceof B3).assertTrue()
      expect(instanceA instanceof A3).assertTrue()
      expect(instanceA.foo()).assertEqual(3)
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_0700
     * @tc.name      testNonGenericClsAndIntfSubtyping00007
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping00007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = (t7 = new T7)
      let derived = (t7 = new S7)
      expect(base instanceof T7).assertTrue()
      expect(base instanceof S7).assertFalse()
      base = derived
      expect(base instanceof T7).assertTrue()
      expect(base instanceof S7).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_0800
     * @tc.name      testNonGenericClsAndIntfSubtyping0008
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = (t8 = new Object)
      let derived = (t8 = new S8)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S8).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S8).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_0900
     * @tc.name      testNonGenericClsAndIntfSubtyping0009
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      t9 = {}
      let base = (a9 = t9)
      let derived = (a9 = t9 = s9)
      expect(base instanceof T9).assertTrue()
      expect(base instanceof S9).assertFalse()
      base = derived
      expect(base instanceof T9).assertTrue()
      expect(base instanceof S9).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_1000
     * @tc.name      testNonGenericClsAndIntfSubtyping0010
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = (a10 = t10)
      let derived = (a10 = s10)
      expect(base instanceof T10).assertTrue()
      expect(base instanceof S10).assertFalse()
      base = derived
      expect(base instanceof T10).assertTrue()
      expect(base instanceof S10).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_1100
     * @tc.name      testNonGenericClsAndIntfSubtyping0011
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = (a11 = new Object)
      let derived = (a11 = s11)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S11).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S11).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_1200
     * @tc.name      testNonGenericClsAndIntfSubtyping0012
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = foo12(new T12)
      let derived = foo12(new S12)
      expect(base instanceof T12).assertTrue()
      expect(base instanceof S12).assertFalse()
      base = derived
      expect(base instanceof T12).assertTrue()
      expect(base instanceof S12).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_1300
     * @tc.name      testNonGenericClsAndIntfSubtyping0013
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = foo13(new Object)
      let derived = foo13(new S13)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S13).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S13).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_1400
     * @tc.name      testNonGenericClsAndIntfSubtyping0014
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      t14 = {}
      let base = foo14(t14)
      let derived = foo14(t14 = s14)
      expect(base instanceof T14).assertTrue()
      expect(base instanceof S14).assertFalse()
      base = derived
      expect(base instanceof T14).assertTrue()
      expect(base instanceof S14).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_1500
     * @tc.name      testNonGenericClsAndIntfSubtyping0015
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = foo15(t15)
      let derived = foo15(s15)
      expect(base instanceof T15).assertTrue()
      expect(base instanceof S15).assertFalse()
      base = derived
      expect(base instanceof T15).assertTrue()
      expect(base instanceof S15).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_1600
     * @tc.name      testNonGenericClsAndIntfSubtyping0016
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = foo16(new Object())
      let derived = foo16(s16)
      expect(base instanceof T16).assertFalse()
      expect(base instanceof S16).assertFalse()
      base = derived
      expect(base instanceof T16).assertTrue()
      expect(base instanceof S16).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_1700
     * @tc.name      testNonGenericClsAndIntfSubtyping0017
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A17().foo17(new T17)
      let derived = new A17().foo17(new S17)
      expect(base instanceof T17).assertTrue()
      expect(base instanceof S17).assertFalse()
      base = derived
      expect(base instanceof T17).assertTrue()
      expect(base instanceof S17).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_1800
     * @tc.name      testNonGenericClsAndIntfSubtyping0018
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      t18 = {}
      let base = new A18().foo18(t18)
      let derived = new A18().foo18(t18 = s18)
      expect(base instanceof T18).assertTrue()
      expect(base instanceof S18).assertFalse()
      base = derived
      expect(base instanceof T18).assertTrue()
      expect(base instanceof S18).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_1900
     * @tc.name      testNonGenericClsAndIntfSubtyping0019
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new C19().foo19(t19)
      let derived = new C19().foo19(s19)
      expect(base instanceof T19).assertTrue()
      expect(base instanceof S19).assertFalse()
      base = derived
      expect(base instanceof T19).assertTrue()
      expect(base instanceof S19).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_2000
     * @tc.name      testNonGenericClsAndIntfSubtyping0020
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A20().foo20(new Object)
      let derived = new A20().foo20(s20)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S20).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S20).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_2100
     * @tc.name      testNonGenericClsAndIntfSubtyping0021
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = A21.foo21(new T21)
      let derived = A21.foo21(new S21)
      expect(base instanceof T21).assertTrue()
      expect(base instanceof S21).assertFalse()
      base = derived
      expect(base instanceof T21).assertTrue()
      expect(base instanceof S21).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_2200
     * @tc.name      testNonGenericClsAndIntfSubtyping0022
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = A22.foo22(new Object)
      let derived = A22.foo22(new S22)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S22).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S22).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_2300
     * @tc.name      testNonGenericClsAndIntfSubtyping0023
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      t23 = {}
      let base = A23.foo23(t23)
      let derived = A23.foo23(t23 = s23)
      expect(base instanceof T23).assertTrue()
      expect(base instanceof S23).assertFalse()
      base = derived
      expect(base instanceof T23).assertTrue()
      expect(base instanceof S23).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_2400
     * @tc.name      testNonGenericClsAndIntfSubtyping0024
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = C24.foo24(t24)
      let derived = C24.foo24(s24)
      expect(base instanceof T24).assertTrue()
      expect(base instanceof S24).assertFalse()
      base = derived
      expect(base instanceof T24).assertTrue()
      expect(base instanceof S24).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_2500
     * @tc.name      testNonGenericClsAndIntfSubtyping0025
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = A25.foo25(new Object)
      let derived = A25.foo25(s25)
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S25).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S25).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_2600
     * @tc.name      testNonGenericClsAndIntfSubtyping0026
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A26(new T26).a26
      let derived = new A26(new S26).a26
      expect(base instanceof T26).assertTrue()
      expect(base instanceof S26).assertFalse()
      base = derived
      expect(base instanceof T26).assertTrue()
      expect(base instanceof S26).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_2700
     * @tc.name      testNonGenericClsAndIntfSubtyping00227
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping00227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A27(new Object).a27
      let derived = new A27(new S27).a27
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S27).assertFalse()
      base = derived
      expect(base instanceof Object).assertTrue()
      expect(base instanceof S27).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_2800
     * @tc.name      testNonGenericClsAndIntfSubtyping0028
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      t28 = {}
      let base = new A28(t28).a28
      let derived = new A28(t28 = s28).a28
      expect(base instanceof T28).assertTrue()
      expect(base instanceof S28).assertFalse()
      base = derived
      expect(base instanceof T28).assertTrue()
      expect(base instanceof S28).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_2900
     * @tc.name      testNonGenericClsAndIntfSubtyping0029
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new C29(t29).c29
      let derived = new C29(s29).c29
      expect(base instanceof T29).assertTrue()
      expect(base instanceof S29).assertFalse()
      base = derived
      expect(base instanceof T29).assertTrue()
      expect(base instanceof S29).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_3000
     * @tc.name      testNonGenericClsAndIntfSubtyping0030
     * @tc.desc      Subtyping relation between non-generic classes and interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericClsAndIntfSubtyping0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let base = new A30(new Object()).a30
      let derived = new A30(s30).a30
      expect(base instanceof T30).assertFalse()
      expect(base instanceof S30).assertFalse()
      base = derived
      expect(base instanceof T30).assertTrue()
      expect(base instanceof S30).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_NON_GENERIC_CLASSES_AND_INTERFACESTEST_3100
     * @tc.name      testNonGenericSuperinterface0031
     * @tc.desc      SSubtyping relation among the interface types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonGenericSuperinterface0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instanceB: B31 = {}
      let instanceA: A31 = instanceB
      expect(instanceA instanceof B31).assertTrue()
    });
  })
}
