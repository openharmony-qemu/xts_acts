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

let i1 = 0
let foo1 = () => {  // infer void
  i1 += 1
}

let i2 = 0
let foo2 = () => {  // infer void
  i2 += 1
  return
}

let s3 = "foo"
let foo3 = () => {  // infer string
  return s3
}

let s4: int = 42
let foo4 = () => {  // infer int
  return s4
}

let s5: number = 1.0
let foo5 = () => {  // infer number
  return s5
}

let s6 = new Error()
let foo6 = () => {  // infer Error
  return s6
}

let s7: number[] = [1.0, 2.0, 3.0]
let foo7 = () => {  // infer number[]
  return s7
}

let s8: Boolean[] = []
let foo8 = () => {  // infer Boolean[]
  return s8
}

let s9: Long[][] = [[new Long(0)]]
let foo9 = () => {  // infer Long[][]
  if (s9 != null)
    return s9
  else
    return [[new Long(0), new Long(0)], [new Long(0), new Long(0)]]
}

let s10: long[][] = [[0 as long]]
let foo10 = () => {
  if (s10 != null)
    return s10
  else
    return [[new Error()]]
}

let s11: Long[][] = [[new Long(0)]]
let foo11 = () => {
  if (s11 == null)
    return s11
  else
    return [new Error()]
}

let s12: Long[][] | null = [[new Long(0)]]
let foo12 = () => {
  if (s12 != null)
    return s12
  else
    return new Error()
}

class A13 {}
class B13 extends A13 {}
class C13 extends A13 {}
type TypeB13 = B13
type TypeC13 = C13
let s13 = 1

let foo13 = () => {
  if (s13 == 0)
    return new TypeB13()
  else
    return new TypeC13()
}

class A14 {}
class B14 extends A14 {}
class C14 extends B14 {}
class D14 extends B14 {}
let s14 = 1

let foo14 = () => {
  if (s14 == 0)
    return new C14()
  else
    return new D14()
}

let s15 = new Object()
let foo15 = () => {
  if (s15 != null)
    return true
  else
    return [true]
}

export default function ReturnTypeInferenceTest06():void {
  describe('ReturnTypeInferenceTest06', () => {
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
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_0100
     * @tc.name      testRetTypeLambda0001
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      i1 = 0
      foo1()
      expect(i1 == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_0200
     * @tc.name      testRetTypeLambda0002
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      i2 = 0
      foo2()
      expect(i2 == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_0300
     * @tc.name      testRetTypeLambda0003
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = foo3()
      expect(foo3() == "foo").assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_0400
     * @tc.name      testRetTypeLambda0004
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = foo4()
      expect(foo4() == 42).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_0500
     * @tc.name      testRetTypeLambda0005
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = foo5()
      expect(foo5() == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_0600
     * @tc.name      testRetTypeLambda0006
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Error = foo6()
      expect(foo6() instanceof Error).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_0700
     * @tc.name      testRetTypeLambda0007
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo7()
      expect(v instanceof Array && v.length == 3).assertTrue()
      expect(typeof v[0] === 'number').assertTrue()
      expect(typeof v[1] === 'number').assertTrue()
      expect(typeof v[2] === 'number').assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_0800
     * @tc.name      testRetTypeLambda0008
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo8()
      expect(v instanceof Array && v.length == 0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_0900
     * @tc.name      testRetTypeLambda0009
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long[][] = foo9()
      expect(foo9() instanceof Array).assertTrue()
      expect(v instanceof Array).assertTrue()
      expect(v[0] instanceof Array).assertTrue()
      expect(v[0][0] instanceof Long).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_1000
     * @tc.name      testRetTypeLambda0010
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long[][] = foo10() as long[][]
      v[0][0] = 0 as long
      expect(v[0][0] == 0).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_1100
     * @tc.name      testRetTypeLambda0011
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Error[] = foo11() as Error[]
      expect(v.length == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_1200
     * @tc.name      testRetTypeLambda0012
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo12()
      expect(v instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_1300
     * @tc.name      testRetTypeLambda0013
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A13 = foo13()
      expect(foo13() instanceof A13).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_1400
     * @tc.name      testRetTypeLambda0014
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B14[] = [foo14()]
      expect(foo14() instanceof D14).assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTSIX_1500
     * @tc.name      testRetTypeLambda0015
     * @tc.desc      An omitted function or method return type can be inferred from the lambda body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeLambda0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo15()
      expect(typeof v === 'boolean' || v instanceof Array).assertTrue()
    });

  })
}