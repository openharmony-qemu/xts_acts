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
  from '@ohos/hypium-binary/src/main/indexStatic';
import { A_1, B1_1, B2_1, C1_1, C2_1, Other_1 } from '../types.test';
import Utils from '../../Util.test'

function check_C1_1(a: object) {
  expect(a instanceof C1_1).assertTrue()
  expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
}
function check_B2_1(a: object) {
  expect(a instanceof B2_1).assertTrue()
  expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
}
function foo_1(v: object): void {
  expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue()
}
function f1_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
  expect(v instanceof object).assertTrue()
  foo_1(v as object)
  return f2_1(v)
}
function f2_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
  if (v instanceof B1_1 || v instanceof Other_1) {
    check_C1_1(v as object)
    return 1
  } else {
    expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue()
    expect(v instanceof object).assertTrue()
    foo_1(v as object)
    check_B2_1(v as object)
    return 2
  }
}

export interface I1_9<U, V> {}
export interface I2_9<U, V> {}
export interface II1_9<U, V> extends I1_9<U, V>, I2_9<U, V> {}
export interface II2_9<U, V> extends I1_9<U, V>, I2_9<U, V> {}
export interface III1_9<U, V> extends II1_9<U, V> {}
export interface III2_9<U, V> extends II1_9<U, V> {}

abstract class A_7<U, V> {}
abstract class B1_7<U, V> extends A_7<U, V> {}
class B2_7<U, V> extends A_7<U, V> {
  b2_v: U | V;
  constructor(p: U | V) {
    super();
    this.b2_v = p;
  }
}
class C1_7<U, V> extends B1_7<U, V> {
  c1_v: U | V;
  constructor(p: U | V) {
    super();
    this.c1_v = p;
  }
}
class C2_7<U, V> extends B1_7<U, V> {
  c2_v: U | V;
  constructor(p: U | V) {
    super();
    this.c2_v = p;
  }
}
class Other_7<T> {
  other_v: T;
  constructor(p: T) {
    this.other_v = p;
  }
}

function check_C1_7(a: object) {
  expect(a instanceof C1_7).assertTrue();
  expect((a as C1_7<number, null>).c1_v as number).assertEqual(321);
}
function check_B2_7(a: object) {
  expect(a instanceof B2_7).assertTrue();
  expect((a as B2_7<bigint, undefined>).b2_v as bigint).assertEqual(123n);
}

function foo_7(v: object): void {
  expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof B2_7 || v instanceof Other_7).assertTrue();
}

function f1_7(v: C1_7<number, null> | C2_7<number, string> | B2_7<bigint, undefined> | Other_7<string>): number {
  foo_7(v);
  return f2_7(v);
}

function f2_7(v: C1_7<number, null> | C2_7<number, string> | B2_7<bigint, undefined> | Other_7<string>): number {
  if (v instanceof B1_7 || v instanceof Other_7) {
    check_C1_7(v);
    return 1;
  } else {
    expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof B2_7 || v instanceof Other_7).assertTrue();
    expect(v instanceof object).assertTrue();
    foo_7(v);
    check_B2_7(v);
    return 2;
  }
}

namespace testNS3_9 {
  export class C1_9<U, V> implements III1_9<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }

  export class C2_9<U, V> implements III2_9<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }

  export class C3_9<U, V> implements II2_9<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }

  function check_C1_9(a: object) {
    expect(a instanceof C1_9).assertEqual(true);
    expect((a as C1_9<number, null>).c1_v as number).assertEqual(123);
  }

  function check_C2_9(a: object) {
    expect(a instanceof C2_9).assertEqual(true);
    expect((a as C2_9<number, string>).c2_v as number).assertEqual(6.7);
  }

  function check_C3_9(a: object) {
    expect(a instanceof C3_9).assertEqual(true);
    expect((a as C3_9<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }

  function foo_9(v: object): void {
    expect(v instanceof C1_9 || v instanceof C2_9 || v instanceof C3_9).assertEqual(true);
  }

  export function f1_9(v: III1_9<number, null> | III2_9<number, string> | II2_9<bigint, undefined>): number {
    foo_9(v);
    return f2_9(v);
  }

  export function f2_9(v: III1_9<number, null> | III2_9<number, string> | II2_9<bigint, undefined>): number {
    if (v instanceof C1_9 || v instanceof C2_9) {
      check_C1_9(v);
      return 1;
    } else {
      expect(v instanceof C1_9 || v instanceof C2_9 || v instanceof C3_9).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_9(v);
      check_C3_9(v);
      return 2;
    }
  }

  export function runTest_9(): boolean {
    let res: number = f1_9(new C1_9<number, null>(123));
    expect(res).assertEqual(1);
    res = f1_9(new C3_9<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

export default function DiffTypeIsSubOfTypeObjOnGenTest(): void {
  describe('DiffTypeIsSubOfTypeObjOnGenTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0100
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGenTest0001
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGenTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_1(new C1_1<number, null>(321))
      expect(res).assertEqual(1)
      res = f1_1(new B2_1<bigint, undefined>(123n))
      expect(res).assertEqual(2)
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0700
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGen0007
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_7(new C1_7<number, null>(321));
      expect(res).assertEqual(1);
      res = f1_7(new B2_7<bigint, undefined>(123n));
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0900
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGen0009
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGen0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = testNS3_9.f1_9(new testNS3_9.C1_9<number, null>(123));
      expect(res).assertEqual(1);
      res = testNS3_9.f1_9(new testNS3_9.C3_9<bigint, undefined>(321n));
      expect(res).assertEqual(2);
    });
  })
}
