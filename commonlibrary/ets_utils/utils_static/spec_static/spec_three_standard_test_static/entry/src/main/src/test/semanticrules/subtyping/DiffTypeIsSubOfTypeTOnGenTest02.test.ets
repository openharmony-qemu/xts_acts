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

namespace testNS2_14 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U, V> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I2<number, null> | I2<number, string> | I2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as I2<number, null> | I2<number, string> | I2<bigint, undefined>);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) { // II1 check
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as I2<number, null> | I2<number, string> | I2<bigint, undefined>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_14(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_14<U, V> {}
interface I2_14<U, V> {}
interface II1_14<U, V> extends I1_14<U, V>, I2_14<U, V> {}
interface II2_14<U, V> extends I1_14<U, V>, I2_14<U, V> {}
interface III1_14<U, V> extends II1_14<U, V> {}
interface III2_14<U, V> extends II1_14<U, V> {}
class C1_14<U, V> implements III1_14<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_14<U, V> implements III2_14<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_14<U, V> implements II2_14<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_14(a: object) {
  expect(a instanceof C1_14).assertTrue();
  expect((a as C1_14<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_14(a: object) {
  expect(a instanceof C2_14).assertTrue();
  expect((a as C2_14<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_14(a: object) {
  expect(a instanceof C3_14).assertTrue();
  expect((a as C3_14<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_14(v: I1_14<number, null> | I1_14<number, string> | I1_14<bigint, undefined>): void {
  expect(v instanceof C1_14 || v instanceof C2_14 || v instanceof C3_14).assertTrue();
}
function f1_14(v: III1_14<number, null> | III2_14<number, string> | II2_14<bigint, undefined>): number {
  if (v instanceof C1_14 || v instanceof C2_14 || v instanceof C3_14) {
    foo_14(v as I1_14<number, null> | I1_14<number, string> | I1_14<bigint, undefined>);
    return f2_14(v);
  }
  else {
    return 0;
  }
}
function f2_14(v: III1_14<number, null> | III2_14<number, string> | II2_14<bigint, undefined>): number {
  if (v instanceof C1_14 || v instanceof C2_14) { // II1_14 check
    check_C2_14(v);
    return 1;
  }
  else {
    expect(v instanceof C1_14 || v instanceof C2_14 || v instanceof C3_14).assertTrue();
    expect(v instanceof C1_14 || v instanceof C2_14 || v instanceof C3_14).assertTrue();
    foo_14(v as I1_14<number, null> | I1_14<number, string> | I1_14<bigint, undefined>);
    check_C3_14(v);
    return 2;
  }
}

interface I_18<U, V> {}
interface II1_18<U, V> extends I_18<U, V> {}
interface II2_18<U, V> extends I_18<U, V> {}
interface III1_18<U, V> extends II1_18<U, V> {}
interface III2_18<U, V> extends II1_18<U, V> {}
class C1_18<U, V> implements III1_18<U, V>, III2_18<U, V> {
  c1_v: U | V;
  constructor(p: U | V) {
    this.c1_v = p;
  }
}
class C2_18<U, V> implements II2_18<U, V>, III2_18<U, V> {
  c2_v: U | V;
  constructor(p: U | V) {
    this.c2_v = p;
  }
}
class C3_18<U, V> implements III1_18<U, V> {
  c3_v: U | V;
  constructor(p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_18(a: object) {
  expect(a instanceof C1_18).assertTrue();
  expect((a as C1_18<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_18(a: object) {
  expect(a instanceof C2_18).assertTrue();
  expect((a as C2_18<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_18(a: object) {
  expect(a instanceof C3_18).assertTrue();
  expect((a as C3_18<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_18(v: I_18<number, null> | I_18<bigint, undefined> | I_18<number, string>): void {
  expect(v instanceof C1_18 || v instanceof C2_18 || v instanceof C3_18).assertTrue();
}
function f1_18(v: III1_18<number, null> | III1_18<bigint, undefined> | II2_18<number, string>): number {
  if (v instanceof C1_18 || v instanceof C2_18 || v instanceof C3_18) {
    foo_18(v as I_18<number, null> | I_18<bigint, undefined> | I_18<number, string>);
    return f2_18(v);
  } else {
    return 0;
  }
}
function f2_18(v: III1_18<number, null> | III1_18<bigint, undefined> | II2_18<number, string>): number {
  if (v instanceof C1_18 || v instanceof C2_18) { // III2_18 check
    check_C1_18(v);
    return 1;
  } else {
    expect(v instanceof C1_18 || v instanceof C2_18 || v instanceof C3_18).assertTrue();
    expect(v instanceof C1_18 || v instanceof C2_18 || v instanceof C3_18).assertTrue();
    foo_18(v as I_18<number, null> | I_18<bigint, undefined> | I_18<number, string>);
    check_C3_18(v);
    return 2;
  }
}

class C1_19<in T1, out T2> {
  readonly c1_v: T2;
  constructor(p: T2) {
    this.c1_v = p;
  }
}

class C2_19<out T1, in T2> {
  readonly c2_v: T1;
  constructor(p: T1) {
    this.c2_v = p;
  }
}

class Base_19 {
  b_v: bigint;
  constructor(p: bigint) {
    this.b_v = p;
  }
}

class Derived_19 extends Base_19 {
  d_v: number;
  constructor(p: number) {
    super(0n);
    this.d_v = p;
  }
}

function check_C1_19(a: object) {
  expect(a instanceof C1_19).assertTrue();
  expect(((a as C1_19<Base_19, Base_19>).c1_v as Base_19).b_v).assertEqual(123n);
}

function check_C2_19(a: object) {
  expect(a instanceof C2_19).assertTrue();
  expect(((a as C2_19<Derived_19, Base_19>).c2_v as Derived_19).d_v).assertEqual(321);
}

function foo_19(v: C1_19<Derived_19, Base_19> | C2_19<Base_19, Derived_19> | number): void {
  expect(v instanceof C1_19 || v instanceof C2_19).assertTrue();
}

function f1_19(v: C1_19<Derived_19, Base_19> | C2_19<Base_19, Derived_19>): number {
  if (v instanceof C1_19 || v instanceof C2_19) {
    foo_19(v);
    return f2_19(v);
  } else {
    return 0;
  }
}

function f2_19(v: C1_19<Derived_19, Base_19> | C2_19<Base_19, Derived_19>): number {
  if (v instanceof C2_19) {
    check_C2_19(v);
    return 1;
  } else {
    expect(v instanceof C1_19 || v instanceof C2_19).assertTrue();
    expect(v instanceof C1_19 || v instanceof C2_19 || typeof v === 'number').assertTrue();
    foo_19(v);
    check_C1_19(v);
    return 2;
  }
}

class C1_20<in T1, out T2> {
  readonly c1_v: T2;
  constructor(p: T2) {
    this.c1_v = p;
  }
}

class C2_20<out T1, in T2> {
  readonly c2_v: T1;
  constructor(p: T1) {
    this.c2_v = p;
  }
}

class Base_20 {
  b_v: bigint;
  constructor(p: bigint) {
    this.b_v = p;
  }
}

class Derived_20 extends Base_20 {
  d_v: number;
  constructor(p: number) {
    super(0n);
    this.d_v = p;
  }
}

function check_C1_20(a: object) {
  expect(a instanceof C1_20).assertTrue();
  expect(((a as C1_20<Base_20, Base_20>).c1_v as Base_20).b_v).assertEqual(123n);
}

function check_C2_20(a: object) {
  expect(a instanceof C2_20).assertTrue();
  expect(((a as C2_20<Derived_20, Base_20>).c2_v as Derived_20).d_v).assertEqual(321);
}

function foo_20(v: object): void {
  expect(v instanceof C1_20 || v instanceof C2_20).assertTrue();
}

function f1_20(v: C1_20<Derived_20, Base_20> | C2_20<Base_20, Derived_20>): number {
  if (typeof v !== 'undefined') {
    foo_20(v);
    return f2_20(v);
  } else {
    return 0;
  }
}

function f2_20(v: C1_20<Derived_20, Base_20> | C2_20<Base_20, Derived_20>): number {
  if (v instanceof C2_20) {
    check_C2_20(v);
    return 1;
  } else {
    expect(v instanceof C1_20 || v instanceof C2_20).assertTrue();
    foo_20(v);
    check_C1_20(v);
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeTOnGenTest02(): void {
  describe('DiffTypeIsSubOfTypeTOnGenTest02', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1400
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0014
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_14(new C2_14<number, string>(6.7))
      expect(res).assertEqual(1)
      res = f1_14(new C3_14<bigint, undefined>(321n))
      expect(res).assertEqual(2)
      expect(testNS2_14.runTest_14()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1800
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0018
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_18(new C1_18<number, null>(123))
      expect(res).assertEqual(1)
      res = f1_18(new C3_18<bigint, undefined>(321n))
      expect(res).assertEqual(2)
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1900
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0019
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_19(new C2_19<Derived_19, Base_19>(new Derived_19(321)))
      expect(res).assertEqual(1)
      res = f1_19(new C1_19<Base_19, Base_19>(new Base_19(123n)))
      expect(res).assertEqual(2)
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_2000
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0020
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_20(new C2_20<Derived_20, Base_20>(new Derived_20(321)))
      expect(res).assertEqual(1)
      res = f1_20(new C1_20<Base_20, Base_20>(new Base_20(123n)))
      expect(res).assertEqual(2)
    });
  })
}