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

interface I_7<U, V> {}
interface II1_7<U, V> extends I_7<U, V> {}
interface II2_7<U, V> extends I_7<U, V> {}
interface III1_7<U, V> extends II1_7<U, V> {}
interface III2_7<U, V> extends II1_7<U, V> {}
class C1_7<U, V> implements III1_7<U, V>, III2_7<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p;
  }
}
class C2_7<U, V> implements II2_7<U, V>, III2_7<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class C3_7<U, V> implements III1_7<U, V> {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_7(a: Any) {
  expect(a instanceof C1_7).assertTrue();
  expect((a as C1_7<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_7(a: Any) {
  expect(a instanceof C2_7).assertTrue();
  expect((a as C2_7<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_7(a: Any) {
  expect(a instanceof C3_7).assertTrue();
  expect((a as C3_7<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_7(v: III1_7<number, null> | II2_7<number, string> | III1_7<bigint, undefined> | number): void {
  expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof C3_7).assertTrue();
}
function f1_7(v: III1_7<number, null> | II2_7<number, string> | III1_7<bigint, undefined>): number {
  expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof C3_7).assertTrue();
  foo_7(v as III1_7<number, null> | II2_7<number, string> | III1_7<bigint, undefined> | number);
  return f2_7(v);
}
function f2_7(v: III1_7<number, null> | II2_7<number, string> | III1_7<bigint, undefined>): number {
  if (v instanceof C1_7 || v instanceof C2_7) {
    check_C1_7(v);
    return 1;
  }
  else {
    expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof C3_7).assertTrue();
    expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof C3_7 || typeof v === 'number').assertTrue();
    foo_7(v as III1_7<number, null> | II2_7<number, string> | III1_7<bigint, undefined> | number);
    check_C3_7(v);
    return 2;
  }
}

namespace testNS2_7 {
  interface I<U, V> {}
  interface II1<U, V> extends I<U, V> {}
  interface II2<U, V> extends I<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V>, III2<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements II2<U, V>, III2<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements III1<U, V> {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: II1<number, null> | II1<bigint, undefined> | II2<number, string>): void {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
  }
  function f1(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
    foo(v as II1<number, null> | II1<bigint, undefined> | II2<number, string>);
    return f2(v);
  }
  function f2(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
      foo(v as II1<number, null> | II1<bigint, undefined> | II2<number, string>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_7(): boolean {
    let res: number = f1(new C2<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

export default function DiffTypeIsSubOfTypeTOnGenTest01(): void {
  describe('DiffTypeIsSubOfTypeTOnGenTest01', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0700
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0007
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_7(new C1_7<number, null>(123))
      expect(res).assertEqual(1)
      res = f1_7(new C3_7<bigint, undefined>(321n))
      expect(res).assertEqual(2)
      expect(testNS2_7.runTest_7()).assertTrue()
    });
  })
}
