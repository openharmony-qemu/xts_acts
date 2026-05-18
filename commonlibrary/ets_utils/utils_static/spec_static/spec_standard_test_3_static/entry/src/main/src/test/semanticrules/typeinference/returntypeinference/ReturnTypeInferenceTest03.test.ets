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
  meth<T>(p: T): string { return 'a' }
}

interface I {
  meth<T>(p: T): string
}
class ImplI implements I {
  meth<T>(p: T): string { return 'i' }
}

abstract class A1 {
  abstract meth<T>(p: T): string
}

class B1 extends A1 {
  meth<T>(p: T): string { return 'b' }
}

interface I1 {
  meth<T>(p: T): string
}
class ImplI1 implements I1 {
  meth<T>(p: T): string { return 'i' }
}

interface J1 extends I1 {
  meth<T>(p: T): string
}
class ImplJ1 implements J1 {
  meth<T>(p: T): string { return 'j' }
}

interface I2 {
  meth<T>(p: T): string
}
class ImplI2 implements I2 {
  meth<T>(p: T): string { return 'i' }
}

interface J2 extends I2 {
  meth<T>(p: T): string
}
class ImplJ2 implements J2 {
  meth<T>(p: T): string { return 'j' }
}

interface I3 {
  meth<T>(p: T): string
}
class ImplI3 implements I3 {
  meth<T>(p: T): string { return 'i' }
}

interface J3 extends I3 {}
class ImplJ3 implements J3 {
  meth<T>(p: T): string { return 'i' }
}

interface I4 {
  meth<T>(p: T): string
}
class A2 implements I4 {
  meth<T>(p: T): string { return 'a' }
}

interface I5 {
  meth<T>(p: T): string
}
class A3 implements I5 {
  meth<T>(p: T): string { return 'a' }
}

interface I6 {
  meth<T>(p: T): string
}
class A4 implements I6 {
  meth<T>(p: T): string { return 'i' }
}

export default function ReturnTypeInferenceTest03():void {
  describe('ReturnTypeInferenceTest03', () => {
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
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTHREE_0100
     * @tc.name      testRetTypeGen0001
     * @tc.desc      A missing function, method, getter, or lambda return type can be inferred from
     * the function, method, getter, or lambda body... If there are k return statements
     * (where k is 1 or more) with the same type expression R, then R is the return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A()
      expect(a.meth(1) == 'a').assertTrue()
      expect(a.meth<string>('') == 'a').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTHREE_0200
     * @tc.name      testRetTypeGen0002
     * @tc.desc      A missing function, method, getter, or lambda return type can be inferred from
     * the function, method, getter, or lambda body... If there are k return statements
     * (where k is 1 or more) with the same type expression R, then R is the return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I = new ImplI()
      expect(i.meth(1) == 'i').assertTrue()
      expect(i.meth<string>('') == 'i').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTHREE_0300
     * @tc.name      testRetTypeGen0003
     * @tc.desc      A missing function, method, getter, or lambda return type can be inferred from
     * the function, method, getter, or lambda body... If there are k return statements
     * (where k is 1 or more) with the same type expression R, then R is the return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A1 = new B1()
      let b: B1 = new B1()
      expect(a.meth(1) == 'b').assertTrue()
      expect(a.meth<string>('') == 'b').assertTrue()
      expect(b.meth(1) == 'b').assertTrue()
      expect(b.meth<string>('') == 'b').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTHREE_0400
     * @tc.name      testRetTypeGen0004
     * @tc.desc      A missing function, method, getter, or lambda return type can be inferred from
     * the function, method, getter, or lambda body... If there are k return statements
     * (where k is 1 or more) with the same type expression R, then R is the return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeGen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I1 = new ImplI1()
      let j: J1 = new ImplJ1()
      expect(i.meth(1) == 'i').assertTrue()
      expect(i.meth<string>('') == 'i').assertTrue()
      expect(j.meth(1) == 'j').assertTrue()
      expect(j.meth<string>('') == 'j').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTHREE_0500
     * @tc.name      testRetTypeGen0005
     * @tc.desc      A missing function, method, getter, or lambda return type can be inferred from
     * the function, method, getter, or lambda body... If there are k return statements
     * (where k is 1 or more) with the same type expression R, then R is the return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeGen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I2 = new ImplJ2() // ImplJ2 implements J2 which extends I2
      expect(i.meth(1) == 'j').assertTrue()
      expect(i.meth<string>('') == 'j').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTHREE_0600
     * @tc.name      testRetTypeGen0006
     * @tc.desc      A missing function, method, getter, or lambda return type can be inferred from
     * the function, method, getter, or lambda body... If there are k return statements
     * (where k is 1 or more) with the same type expression R, then R is the return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeGen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I3 = new ImplI3()
      let j: J3 = new ImplJ3()
      expect(i.meth(1) == 'i').assertTrue()
      expect(i.meth<string>('') == 'i').assertTrue()
      expect(j.meth(1) == 'i').assertTrue()
      expect(j.meth<string>('') == 'i').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTHREE_0700
     * @tc.name      testRetTypeGen0007
     * @tc.desc      A missing function, method, getter, or lambda return type can be inferred from
     * the function, method, getter, or lambda body... If there are k return statements
     * (where k is 1 or more) with the same type expression R, then R is the return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeGen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I4 = new A2()
      let a: A2 = new A2()
      expect(i.meth(1) == 'a').assertTrue()
      expect(i.meth<string>('') == 'a').assertTrue()
      expect(a.meth(1) == 'a').assertTrue()
      expect(a.meth<string>('') == 'a').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTHREE_0800
     * @tc.name      testRetTypeGen0008
     * @tc.desc      A missing function, method, getter, or lambda return type can be inferred from
     * the function, method, getter, or lambda body... If there are k return statements
     * (where k is 1 or more) with the same type expression R, then R is the return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeGen0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I5 = new A3()
      let a: A3 = new A3()
      expect(i.meth(1) == 'a').assertTrue()
      expect(i.meth<string>('') == 'a').assertTrue()
      expect(a.meth(1) == 'a').assertTrue()
      expect(a.meth<string>('') == 'a').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTHREE_0900
     * @tc.name      testRetTypeGen0009
     * @tc.desc      A missing function, method, getter, or lambda return type can be inferred from
     * the function, method, getter, or lambda body... If there are k return statements
     * (where k is 1 or more) with the same type expression R, then R is the return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeGen0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I6 = new A4()
      let a: A4 = new A4()
      expect(i.meth(1) == 'i').assertTrue()
      expect(i.meth<string>('') == 'i').assertTrue()
      expect(a.meth(1) == 'i').assertTrue()
      expect(a.meth<string>('') == 'i').assertTrue()
    });

  })
}