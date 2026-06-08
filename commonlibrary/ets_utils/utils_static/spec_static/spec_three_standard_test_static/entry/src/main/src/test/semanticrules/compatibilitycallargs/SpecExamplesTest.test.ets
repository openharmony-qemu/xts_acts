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

class B1 {
  bar1(p1: Object): void {
    expect(p1).assertEqual(1)
  }
}

function foo1(p1: Object): void {
  expect(p1).assertEqual(1)
}

type my_lambda1 = (p1: Object) => void

interface I1 {
  bar1(p1: Object): void
}

class B2 {
  bar2(p2: Object): void {
    expect(p2).assertEqual(1)
  }
}

function foo2(p2: Object): void {
  expect(p2).assertEqual(1)
}

type my_lambda2 = (p2: Object) => void

interface I2 {
  bar2(p2: Object): void
}

class A3 {
  constructor(p3: Object) {
    expect(p3).assertEqual(1)
  }
}


class B3 {
  bar(p3: Object): void {
    expect(p3).assertEqual(1)
  }
}

function foo3(p3: Object): void {
  expect(p3).assertEqual(1)
}

type my_lambda3 = (p3: Object) => void

interface I3 {
  bar3(p3: Object): void
}

class B4 {
  bar4(p4: Object): void {
    expect(p4).assertEqual(1)
  }
}

function foo4(p4: Object): void {
  expect(p4).assertEqual(1)
}

type my_lambda4 = (p4: Object) => void

interface I4 {
  bar4(p4: Object): void
}

class B5 {
  bar5(...p5: Object[]): void {
    expect(p5[0]).assertEqual(1)
    expect(p5[1]).assertEqual("111")
  }
}

function foo5(...p5: Object[]): void {
  expect(p5[0]).assertEqual(1)
  expect(p5[1]).assertEqual("111")
}

type my_lambda5 = (...p5: Object[]) => void

interface I5 {
  bar5(...p5: Object[]): void
}

class B6 {
  bar6(...p6: Object[]): void {
    expect(p6[0]).assertEqual(1)
    expect(p6[1]).assertEqual("111")
  }
}

type my_lambda6 = (...p6: Object[]) => void

interface I6 {
  bar6(...p6: Object[]): void
}

class A7 {
  constructor(...p7: Object[]) {
    expect(p7[0]).assertEqual(1)
    expect(p7[1]).assertEqual("111")
  }
}


class B7 {
  bar7(...p7: Object[]): void {
    expect(p7[0]).assertEqual(1)
    expect(p7[1]).assertEqual("111")
  }
}


type my_lambda7 = (...p7: Object[]) => void

interface I7 {
  bar7(...p7: Object[]): void
}

class B8 {
  bar8(...p8: Object[]): void {
    expect(p8[0]).assertEqual(1)
    expect(p8[1]).assertEqual("111")
  }
}

type my_lambda8 = (...p8: Object[]) => void

interface I8 {
  bar8(...p8: Object[]): void
}

class B9 {
  bar9(...p9: (number|string)[]): void {
    expect(p9[0]).assertEqual(1)
    expect(p9[1]).assertEqual("111")
  }
}

function foo9(...p9: (number|string)[]): void {
  expect(p9[0]).assertEqual(1)
  expect(p9[1]).assertEqual("111")
}

type my_lambda9 = (...p9: (number|string)[]) => void

interface I9 {
  bar9(...p9: (number|string)[]): void
}

class B10 {
  bar10(...p10: (number|string)[]): void {
    expect(p10[0]).assertEqual(1)
    expect(p10[1]).assertEqual("111")
  }
}

type my_lambda10 = (...p10: (number|string)[]) => void

interface I10 {
  bar10(...p10: (number|string)[]): void
}

class A11 {
  constructor(...p11: (number|string)[]) {
    expect(p11[0]).assertEqual(1)
    expect(p11[1]).assertEqual("111")
  }
}


class B11 {
  bar11(...p11: (number|string)[]): void {
    expect(p11[0]).assertEqual(1)
    expect(p11[1]).assertEqual("111")
  }
}

type my_lambda11 = (...p11: (number|string)[]) => void

interface I11 {
  bar11(...p11: (number|string)[]): void
}

class B12 {
  bar12(...p12: (number|string)[]): void {
    expect(p12[0]).assertEqual(1)
    expect(p12[1]).assertEqual("111")
  }
}

type my_lambda12 = (...p12: (number|string)[]) => void

interface I12 {
  bar12(...p12: (number|string)[]): void
}

class B13 {
  bar13(...p13: (number|string)[]): void {
    expect(p13[0]).assertEqual(1)
    expect(p13[1]).assertEqual("111")
  }
}

function foo13(...p13: Array<number | string>): void {
  expect(p13[0]).assertEqual(1)
  expect(p13[1]).assertEqual("111")
}

type my_lambda13 = (...p13: (number|string)[]) => void

interface I13 {
  bar13(...p13: (number|string)[]): void
}

class B14 {
  bar14(...p14: (number|string)[]): void {
    expect(p14[0]).assertEqual(1)
    expect(p14[1]).assertEqual("111")
  }
}


type my_lambda14 = (...p14: (number|string)[]) => void

interface I14 {
  bar14(...p14: (number|string)[]): void
}

class A15 {
  constructor(...p15: (number|string)[]) {
    expect(p15[0]).assertEqual(1)
    expect(p15[1]).assertEqual("111")
  }
}


class B15 {
  bar15(...p15: (number|string)[]): void {
    expect(p15[0]).assertEqual(1)
    expect(p15[1]).assertEqual("111")
  }
}


type my_lambda15 = (...p15: (number|string)[]) => void

interface I15 {
  bar15(...p15: (number|string)[]): void
}

class B16 {
  bar16(...p16: (number|string)[]): void {
    expect(p16[0]).assertEqual(1)
    expect(p16[1]).assertEqual("111")
  }
}

type my_lambda16 = (...p16: (number|string)[]) => void

interface I16 {
  bar16(...p16: (number|string)[]): void
}

class B17 {
  bar17(...p17: [number, string]): void {
    expect(p17[0]).assertEqual(1)
    expect(p17[1]).assertEqual("111")
  }
}

function foo17(...p17: [number, string]): void {
  expect(p17[0]).assertEqual(1)
  expect(p17[1]).assertEqual("111")
}

type my_lambda17 = (...p17: [number, string]) => void

interface I17 {
  bar17(...p17: [number, string]): void
}

class B18 {
  bar18(...p18: [number, string]): void {
    expect(p18[0]).assertEqual(1)
    expect(p18[1]).assertEqual("111")
  }
}

function foo18(...p18: [number, string]): void {
  expect(p18[0]).assertEqual(1)
  expect(p18[1]).assertEqual("111")
}

type my_lambda18 = (...p18: [number, string]) => void

interface I18 {
  bar18(...p: [number, string]): void
}

class A19 {
  constructor(...p19: [number, string]) {
    expect(p19[0]).assertEqual(1)
    expect(p19[1]).assertEqual("111")
  }
}


class B19 {
  bar19(...p19: [number, string]): void {
    expect(p19[0]).assertEqual(1)
    expect(p19[1]).assertEqual("111")
  }
}

function foo19(...p19: [number, string]): void {
  expect(p19[0]).assertEqual(1)
  expect(p19[1]).assertEqual("111")
}

type my_lambda19 = (...p19: [number, string]) => void

interface I19 {
  bar19(...p19: [number, string]): void
}

class B20 {
  bar20(...p20: [number, string]): void {
    expect(p20[0]).assertEqual(1)
    expect(p20[1]).assertEqual("111")
  }
}

function foo20(...p20: [number, string]): void {
  expect(p20[0]).assertEqual(1)
  expect(p20[1]).assertEqual("111")
}

type my_lambda20 = (...p20: [number, string]) => void

interface I20 {
  bar20(...p20: [number, string]): void
}

export default function SpecExamplesTest(): void {
  describe('SpecExamplesTest', () => {
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
     * @tc.number    SUB_SPEC_EXAMPLES_TEST_0600
     * @tc.name      testSpecExamples0006
     * @tc.desc      Specification examples for semantic checks that must be performed to arguments
     *               when checking the validity of any function, method, constructor, or lambda call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExamples0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSpecExamples0006';
      

      let my_lambda_var: my_lambda6 = (...p6: Object[]): void => { expect(p6[0]).assertEqual(1)
        expect(p6[1]).assertEqual("111") }
      my_lambda_var(1, "111")
    });

    /**
     * @tc.number    SUB_SPEC_EXAMPLES_TEST_1000
     * @tc.name      testSpecExamples0010
     * @tc.desc      Specification examples for semantic checks that must be performed to arguments
     *               when checking the validity of any function, method, constructor, or lambda call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExamples0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSpecExamples0010';
      let my_lambda_var: my_lambda10 = (...p10: (number|string)[]): void => { expect(p10[0]).assertEqual(1)
        expect(p10[1]).assertEqual("111") }
      my_lambda_var(1, "111")
    });

    /**
     * @tc.number    SUB_SPEC_EXAMPLES_TEST_1400
     * @tc.name      testSpecExamples0014
     * @tc.desc      Specification examples for semantic checks that must be performed to arguments
     *               when checking the validity of any function, method, constructor, or lambda call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExamples0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSpecExamples0014';
      let my_lambda_var: my_lambda14 = (...p14: (number|string)[]): void => {
        expect(p14[0]).assertEqual(1)
        expect(p14[1]).assertEqual("111") }
      my_lambda_var(...[1, "111"])
    });

    /**
     * @tc.number    SUB_SPEC_EXAMPLES_TEST_1800
     * @tc.name      testSpecExamples0018
     * @tc.desc      Specification examples for semantic checks that must be performed to arguments
     *               when checking the validity of any function, method, constructor, or lambda call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExamples0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSpecExamples0018';
      let my_lambda_var: my_lambda18 = (...p18: [number, string]): void => { expect(p18[0]).assertEqual(1)
        expect(p18[1]).assertEqual("111") }
      my_lambda_var(...[1, "111"])
    });
  })
}


