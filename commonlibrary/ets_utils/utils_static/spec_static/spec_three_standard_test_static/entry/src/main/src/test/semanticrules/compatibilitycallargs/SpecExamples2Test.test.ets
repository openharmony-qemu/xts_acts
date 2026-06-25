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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

class A1 {
  constructor(pa: number[]) {
    expect(pa[0]).assertEqual(1)
    expect(pa[1]).assertEqual(2)
    expect(pa[2]).assertEqual(3)
  }
}

class B1 {
  bar1(pa: number[]): void {
    expect(pa[0]).assertEqual(1)
    expect(pa[1]).assertEqual(2)
    expect(pa[2]).assertEqual(3)
  }
}

function foo1(pa: number[]): void {
  expect(pa[0]).assertEqual(1)
  expect(pa[1]).assertEqual(2)
  expect(pa[2]).assertEqual(3)
}

type my_lambda1 = (pa: number[]) => void

interface I1 {
  bar1(p: number[]): void
}

class A2 {
  constructor(p1: number, p2: number[]) {
    expect(p1).assertEqual(1)
    expect(p2[0]).assertEqual(2)
    expect(p2[1]).assertEqual(3)
  }
}

class B2 {
  bar2(p1: number, p2: number[]): void {
    expect(p1).assertEqual(1)
    expect(p2[0]).assertEqual(2)
    expect(p2[1]).assertEqual(3)
  }
}

function foo2(p1: number, p2: number[]): void {
  expect(p1).assertEqual(1)
  expect(p2[0]).assertEqual(2)
  expect(p2[1]).assertEqual(3)
}

type my_lambda2 = (p1: number, p2: number[]) => void

interface I2 {
  bar2(p1: number, p2: number[]): void
}

type TestMix = number | string | boolean;
class A3 {
  constructor(pc: TestMix[]) {
    expect(pc[0]).assertEqual(1)
    expect(pc[1]).assertEqual("str")
    expect(pc[2]).assertEqual(true)
    expect(pc[3]).assertEqual(123)
  }
}

class B3 {
  bar3(pc: TestMix[]): void {
    expect(pc[0]).assertEqual(1)
    expect(pc[1]).assertEqual("str")
    expect(pc[2]).assertEqual(true)
    expect(pc[3]).assertEqual(123)
  }
}

function foo3(pc: TestMix[]): void {
  expect(pc[0]).assertEqual(1)
  expect(pc[1]).assertEqual("str")
  expect(pc[2]).assertEqual(true)
  expect(pc[3]).assertEqual(123)
}

type my_lambda3 = (pc: TestMix[]) => void

interface I3 {
  bar3(pc: TestMix[]): void
}

class A4 {
  constructor(p: Object[]) {
    expect(p[0]).assertEqual(1)
    expect(p[1]).assertEqual("str")
    expect(p[2]).assertEqual(true)
    expect(p[3]).assertEqual(123)
  }
}

class B4 {
  bar4(p: Object[]): void {
    expect(p[0]).assertEqual(1)
    expect(p[1]).assertEqual("str")
    expect(p[2]).assertEqual(true)
    expect(p[3]).assertEqual(123)
  }
}

function foo4(p: Object[]): void {
  expect(p[0]).assertEqual(1)
  expect(p[1]).assertEqual("str")
  expect(p[2]).assertEqual(true)
  expect(p[3]).assertEqual(123)
}

type my_lambda4 = (p: Object[]) => void

interface I4 {
  bar4(p: Object[]): void
}

export default function SpecExamples2Test(): void {
  describe('SpecExamples2Test', () => {
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
     * @tc.number    SUB_SPEC_EXAMPLES2_TEST_0100
     * @tc.name      testSpecExamplesOne0001
     * @tc.desc      Specification examples for semantic checks that must be performed to arguments
     *               when checking the validity of any function, method, constructor, or lambda call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExamplesOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      let my_lambda_var: my_lambda1 = (pa: number[]): void => {
        expect(pa[0]).assertEqual(1)
        expect(pa[1]).assertEqual(2)
        expect(pa[2]).assertEqual(3)
      }
      my_lambda_var([1, 2, 3])

      foo1([1, 2, 3])

      let a = new A1([1, 2, 3])

      new B1().bar1([1, 2, 3])

      let i: I1 = {
        bar1: (pa: number[]): void => {
          expect(pa[0]).assertEqual(1)
          expect(pa[1]).assertEqual(2)
          expect(pa[2]).assertEqual(3)
        }
      }
      i.bar1([1, 2, 3])
    });

    /**
     * @tc.number    SUB_SPEC_EXAMPLES2_TEST_0200
     * @tc.name      testSpecExamplesOne0002
     * @tc.desc      Specification examples for semantic checks that must be performed to arguments
     *               when checking the validity of any function, method, constructor, or lambda call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExamplesOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      let my_lambda_var: my_lambda2 = (p1: number, p2: number[]): void => {
        expect(p1).assertEqual(1)
        expect(p2[0]).assertEqual(2)
        expect(p2[1]).assertEqual(3)
      }
      my_lambda_var(1, [2, 3])

      foo2(1, [2, 3])

      let a = new A2(1, [2, 3])

      new B2().bar2(1, [2, 3])

      let i: I2 = {
        bar2(p1: number, p2: number[]): void {
          expect(p1).assertEqual(1)
          expect(p2[0]).assertEqual(2)
          expect(p2[1]).assertEqual(3)
        }
      }
      i.bar2(1, [2, 3])
    });

    /**
     * @tc.number    SUB_SPEC_EXAMPLES2_TEST_0300
     * @tc.name      testSpecExamplesOne0003
     * @tc.desc      Specification examples for semantic checks that must be performed to arguments
     *               when checking the validity of any function, method, constructor, or lambda call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExamplesOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      let my_lambda_var: my_lambda3 = (pc: TestMix[]): void => {
        expect(pc[0]).assertEqual(1)
        expect(pc[1]).assertEqual("str")
        expect(pc[2]).assertEqual(true)
        expect(pc[3]).assertEqual(123)
      }
      my_lambda_var([1, "str", true, 123])

      foo3([1, "str", true, 123])

      let a = new A3([1, "str", true, 123])

      new B3().bar3([1, "str", true, 123])

      let i: I3 = {
        bar3(pc: TestMix[]): void {
          expect(pc[0]).assertEqual(1)
          expect(pc[1]).assertEqual("str")
          expect(pc[2]).assertEqual(true)
          expect(pc[3]).assertEqual(123)
        }
      }
      i.bar3([1, "str", true, 123])
    });

    /**
     * @tc.number    SUB_SPEC_EXAMPLES2_TEST_0400
     * @tc.name      testSpecExamplesOne0004
     * @tc.desc      Specification examples for semantic checks that must be performed to arguments
     *               when checking the validity of any function, method, constructor, or lambda call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExamplesOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      let my_lambda_var: my_lambda4 = (p: Object[]): void => {
        expect(p[0]).assertEqual(1)
        expect(p[1]).assertEqual("str")
        expect(p[2]).assertEqual(true)
        expect(p[3]).assertEqual(123)
      }
      my_lambda_var([1, "str", true, 123])

      foo4([1, "str", true, 123])

      let a = new A4([1, "str", true, 123])

      new B4().bar4([1, "str", true, 123])

      let i: I4 = {
        bar4(p: Object[]): void {
          expect(p[0]).assertEqual(1)
          expect(p[1]).assertEqual("str")
          expect(p[2]).assertEqual(true)
          expect(p[3]).assertEqual(123)
        }
      }
      i.bar4([1, "str", true, 123])
    });
  })
}