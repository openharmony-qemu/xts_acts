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
  constructor(x: T) {}
}

class Pos<T extends number> {
  constructor(x: T) {}
}

namespace testNS2_8 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: III1) {
    expect(a instanceof C1).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I1).assertTrue();
    expect(a instanceof I2).assertTrue();
    expect((a as C1).v).assertEqual(123n);
  }
  function check_C2(a: III2) {
    expect(a instanceof C2).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I1).assertTrue();
    expect(a instanceof I2).assertTrue();
    expect((a as C2).v).assertEqual(321);
  }
  function check_C3(a: II2) {
    expect(a instanceof C3).assertTrue();
    expect(a instanceof II2).assertTrue();
    expect(a instanceof I1).assertTrue();
    expect(a instanceof I2).assertTrue();
    expect((a as C3).v).assertEqual(7.8);
  }
  function foo(v: I2): void {
    expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof I2) {
      foo(v);
      return f2(v as III1 | III2 | II2);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof II1) {
      check_C1(v as III1);
      return 1;
    }
    else {
      expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
      expect(v instanceof I2).assertTrue();
      foo(v);
      check_C3(v as II2);
      return 2;
    }
  }
  export function runTest(): boolean {
    let res: number = f1(new C1());
    expect(res).assertEqual(1);
    res = f1(new C3());
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_8 {}
interface I2_8 {}
interface II1_8 extends I1_8, I2_8 {}
interface II2_8 extends I1_8, I2_8 {}
interface III1_8 extends II1_8 {}
interface III2_8 extends II1_8 {}
class C1_8 implements III1_8 {v: bigint = 123n}
class C2_8 implements III2_8 {v: number = 321}
class C3_8 implements II2_8 {v: number = 7.8}
function check_C1_8(a: III1_8) {
  expect(a instanceof C1_8).assertTrue();
  expect(a instanceof III1_8).assertTrue();
  expect(a instanceof II1_8).assertTrue();
  expect(a instanceof I1_8).assertTrue();
  expect(a instanceof I2_8).assertTrue();
  expect((a as C1_8).v).assertEqual(123n);
}
function check_C2_8(a: III2_8) {
  expect(a instanceof C2_8).assertTrue();
  expect(a instanceof III2_8).assertTrue();
  expect(a instanceof II1_8).assertTrue();
  expect(a instanceof I1_8).assertTrue();
  expect(a instanceof I2_8).assertTrue();
  expect((a as C2_8).v).assertEqual(321);
}
function check_C3_8(a: II2_8) {
  expect(a instanceof C3_8).assertTrue();
  expect(a instanceof II2_8).assertTrue();
  expect(a instanceof I1_8).assertTrue();
  expect(a instanceof I2_8).assertTrue();
  expect((a as C3_8).v).assertEqual(7.8);
}
function foo_8(v: I1_8): void {
  expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
}
function f1_8(v: III1_8 | III2_8 | II2_8): number {
  if (v instanceof I1_8) {
    foo_8(v);
    return f2_8(v as III1_8 | III2_8 | II2_8);
  }
  else {
    return 0;
  }
}
function f2_8(v: III1_8 | III2_8 | II2_8): number {
  if (v instanceof II1_8) {
    check_C2_8(v as III2_8);
    return 1;
  }
  else {
    expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
    expect(v instanceof I1_8).assertTrue();
    foo_8(v);
    check_C3_8(v as II2_8);
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeTOnNonGenTest01(): void {
  describe('DiffTypeIsSubOfTypeTOnNonGenTest01', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0800
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0008
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res: number = f1_8(new C2_8())
      expect(res).assertEqual(1)
      res = f1_8(new C3_8())
      expect(res).assertEqual(2)

      expect(testNS2_8.runTest()).assertTrue()
    });
  })
}
