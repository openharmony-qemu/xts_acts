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

interface I1_13<U, V> {}
interface I2_13<U, V> {}
interface II1_13<U, V> extends I1_13<U, V>, I2_13<U, V> {}
interface II2_13<U, V> extends I1_13<U, V>, I2_13<U, V> {}
interface III1_13<U, V> extends II1_13<U, V> {}
interface III2_13<U, V> extends II1_13<U, V> {}
class C1_13<U, V> implements III1_13<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_13<U, V> implements III2_13<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_13<U, V> implements II2_13<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_13(a: Any) {
  expect(a instanceof C1_13).assertTrue();
  expect((a as C1_13<number, null>).c1_v as number).assertEqual(123);
}
function check_C3_13(a: Any) {
  expect(a instanceof C3_13).assertTrue();
  expect((a as C3_13<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_13(v: III1_13<number, null> | II2_13<bigint, undefined> | III2_13<number, string> | number): void {
  expect(v instanceof C1_13 || v instanceof C2_13 || v instanceof C3_13).assertTrue();
}
function f1_13(v: III1_13<number, null> | III2_13<number, string> | II2_13<bigint, undefined>): number {
  if (v instanceof C1_13 || v instanceof C2_13 || v instanceof C3_13) {
    foo_13(v as III1_13<number, null> | II2_13<bigint, undefined> | III2_13<number, string> | number);
    return f2_13(v);
  }
  else {
    return 0;
  }
}
function f2_13(v: III1_13<number, null> | III2_13<number, string> | II2_13<bigint, undefined>): number {
  if (v instanceof C1_13 || v instanceof C2_13) {
    check_C1_13(v);
    return 1;
  }
  else {
    expect(v instanceof C1_13 || v instanceof C2_13 || v instanceof C3_13).assertTrue();
    expect(v instanceof C1_13 || v instanceof C2_13 || v instanceof C3_13 || typeof v === 'number').assertTrue();
    foo_13(v as III1_13<number, null> | II2_13<bigint, undefined> | III2_13<number, string> | number);
    check_C3_13(v);
    return 2;
  }
}


export default function DiffTypeIsSubOfTypeTOnGenTest01(): void {
  describe('DiffTypeIsSubOfTypeTOnGenTest01', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1300
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0013
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_13(new C1_13<number, null>(123))
      expect(res).assertEqual(1)
      res = f1_13(new C3_13<bigint, undefined>(321n))
      expect(res).assertEqual(2)
    });
  })
}