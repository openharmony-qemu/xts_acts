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

interface I {
  foo() {}
}
class A implements I {}

interface I1 {
  i: int
  foo() { return }
}
class A1 implements I1 {
  i: int = 1
}

interface I2 {
  foo() {
  return "foo"
}
}
class A2 implements I2 {}

interface I3 {
  foo() { return 42 }
}
class A3 implements I3 {}

interface I4 {
  foo() { return 1.0 }
}
class A4 implements I4 {}

interface I5 {
  foo() { return new Error() }
}
class A5 implements I5 {}

interface I6 {
  foo() { return [1.0, 2.0, 3.0] }
}
class A6 implements I6 {}

interface I7 {
  foo() { return [] as Boolean[] }
}
class A7 implements I7 {}

interface I8 {
  foo(s: Long[][]) {
  if (s != null)
  return s
  else
  return [[new Long(0), new Long(0)], [new Long(0), new Long(0)]]
}
}
class A8 implements I8 {}

interface I9 {
  foo(s: long[][]) {
  if (s != null)
  return s
  else
  return [[new Error()]]
}
}
class A9 implements I9 {}

interface I10 {
  foo(s: Long[][]) {
  if (s == null)
  return s
  else
  return [new Error()]
}
}
class A10 implements I10 {}

interface I11 {
  foo(s: Long[][]|null) {
  if (s != null)
  return s
  else
  return new Error()
}
}
class A11 implements I11 {}

interface I12 {
  foo(s: Object) {
  if (s != null)
  return true
  else
  return [true]
}
}
class A12 implements I12 {}

export default function ReturnTypeInferenceTest05():void {
  describe('ReturnTypeInferenceTest05', () => {
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
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_0100
     * @tc.name      testRetTypeInterfaceMethod0001
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A = new A()
      a.foo()
      expect(true).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_0200
     * @tc.name      testRetTypeInterfaceMethod0002
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A1()
      a.foo()
      expect(a.i == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_0300
     * @tc.name      testRetTypeInterfaceMethod0003
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A2()
      let v = a.foo()
      expect(new A2().foo() == "foo").assertTrue()
      expect(v == "foo").assertTrue()
      expect(typeof v === 'string').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_0400
     * @tc.name      testRetTypeInterfaceMethod0004
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A3()
      let v = a.foo()
      expect(v).assertEqual(42)
      expect(new A3().foo()).assertEqual(42)
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_0500
     * @tc.name      testRetTypeInterfaceMethod0005
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A4()
      let v = a.foo()
      expect(new A4().foo() == 1.0).assertTrue()
      expect(v == 1.0).assertTrue()
      expect(typeof v === 'number').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_0600
     * @tc.name      testRetTypeInterfaceMethod0006
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A5()
      let v = a.foo()
      expect(new A5().foo() instanceof Error).assertTrue()
      expect(v instanceof Error).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_0700
     * @tc.name      testRetTypeInterfaceMethod0007
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A6()
      let v = a.foo()
      expect(v instanceof Array && v.length == 3).assertTrue()
      expect(typeof v[0] === 'number').assertTrue()
      expect(typeof v[1] === 'number').assertTrue()
      expect(typeof v[2] === 'number').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_0800
     * @tc.name      testRetTypeInterfaceMethod0008
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A7()
      let v = a.foo()
      expect(v instanceof Array && v.length == 0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_0900
     * @tc.name      testRetTypeInterfaceMethod0009
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A8()
      let v = a.foo([[new Long(1)]])
      expect(v instanceof Array).assertTrue()
      expect(v[0] instanceof Array).assertTrue()
      expect(v[0][0] instanceof Long).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_1000
     * @tc.name      testRetTypeInterfaceMethod0010
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A9()
      let v = a.foo([[1 as long]]) as long[][]
      v[0][0] = 0 as long
      expect(v[0][0] == 0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_1100
     * @tc.name      testRetTypeInterfaceMethod0011
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A10()
      let v = a.foo([[new Long(1)]]) as Error[]
      expect(v.length == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_1200
     * @tc.name      testRetTypeInterfaceMethod0012
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A11()
      let b: Long[][] = [[new Long(1)]]
      let v = a.foo(b)
      expect(v instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFIVE_1300
     * @tc.name      testRetTypeInterfaceMethod0013
     * @tc.desc      Implementation methods from interface with or without return.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInterfaceMethod0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new A12().foo(new Object())
      expect(typeof v === 'boolean' || v instanceof Array).assertTrue()
    });

  })
}