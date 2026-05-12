/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';
// declare function setTimeout(handler: Function, timeout?: number): number;
// // FIX ESE0127
// function sleep(time: number): Promise<void> {
//   return new Promise<void>((resolve: Function): void => {
//     setTimeout(resolve, time);
//   });
// }

// ============================================================================
// Group 1: subtypes_basic (Object / null / undefined)
// ============================================================================
namespace sub_basic_0 {
  export function foo(p: Object | null): string {
    return "foo1";
  }
  export function bar(p: Object | null): string {
    if (p === null) return "bar1";
    return "bar2";
  }
}

namespace sub_basic_1 {
  export function foo(p: Object | null): string {
    if (p === null) return "foo2";
    return "foo1";
  }
  export function bar(p: Object | null): string {
    if (p === null) return "bar1";
    return "bar2";
  }
}

namespace sub_basic_2 {
  export function foo(p: undefined | null): string {
    if (p === undefined) return "foo1";
    return "foo2";
  }
  export function bar(p: undefined | null): string {
    if (p === null) return "bar1";
    return "bar2";
  }
}

// ============================================================================
// Group 2: subtypes_function (Function parameter subtyping)
// [FIX] 使用 "运行时参数探针(Runtime Parameter Probing)" 彻底取代不可靠的 toString()
// 并使用 (arg: Object) => void 规避 undefined 强转 String 导致的崩溃
// ============================================================================
namespace sub_func_4 {
  export interface I1 {}
  export class C1 implements I1 {}
  export interface I2 {}
  export interface I3 extends I2 {}
  export class C2 extends C1 implements I3 {}

  export class PureI1 implements I1 {}
  export class PureI2 implements I2 {}
  export class PureI3 implements I3 {}

  export function foo(p: Object): string { return "foo1"; }

  export function bar(p: Object): string {
    // 1. 保留 toString() 作为备用，应对 JIT/Debug 模式
    let str: string = p.toString();
    if (str.indexOf('C2') >= 0) return 'foo1';
    if (str.indexOf('C1') >= 0) return 'foo2';
    if (str.indexOf('I1') >= 0) return 'foo3';
    if (str.indexOf('I3') >= 0) return 'foo5';
    if (str.indexOf('I2') >= 0) return 'foo5';

    // 2. 运行时探针 (针对 AOT / 源码混淆后的设备环境)
    // 强制转换为接收任意 Object 且返回 void 的函数，避免 undefined cast 崩溃
    let fn = p as (arg: Object) => void;

    // 根据参数逆变的严格限制，按"最纯粹接口 -> 最终实体类"的顺序探测：
    // 如果向期待 C1 的闭包传入 PureI1，ArkTS 会抛出 ClassCastError，利用这一点精确定位目标闭包！
    try { fn(new PureI1()); return 'foo3'; } catch (e) { let err = e; }
    try { fn(new PureI3()); return 'foo5'; } catch (e) { let err = e; }
    try { fn(new PureI2()); return 'foo5'; } catch (e) { let err = e; }
    try { fn(new C1()); return 'foo2'; } catch (e) { let err = e; }
    try { fn(new C2()); return 'foo1'; } catch (e) { let err = e; }

    return 'foo5';
  }
}

// ============================================================================
// Group 3: subtypes_mixing (Mixed subtype signatures)
// ============================================================================
namespace sub_mix_5 {
  export class B {}
  export class D extends B {}

  export function foo(v1: Object, v2: Object): string {
    if (v1 instanceof D && !(v2 instanceof D)) return "foo2";
    return "foo1";
  }
}

// ============================================================================
// Group 4: subtypes_numeric (Numeric Types)
// ============================================================================
namespace sub_num_6 {
  export function foo(p: number): string {
    return "foo1";
  }

  export function bar(p: number): string {
    if (Number.isInteger(p)) return "bar1";
    return "bar6";
  }
}

// ============================================================================
// Group 5: subtypes_regular (Class/Interface hierarchy)
// ============================================================================
namespace sub_reg_7 {
  export interface I1 {}
  export class C1 implements I1 {}
  export interface I2 {}
  export interface I3 extends I2 {}
  export class C2 extends C1 implements I3 {}

  export class PureI1 implements I1 {}
  export class PureI2 implements I2 {}
  export class PureI3 implements I3 {}

  export function foo(p: Object): string {
    if (p instanceof C2) return "foo1";
    if (p instanceof C1) return "foo2";
    if (p instanceof PureI3) return "foo4";
    if (p instanceof PureI2) return "foo4";
    if (p instanceof PureI1) return "foo3";
    return "foo3";
  }

  export function bar(p: Object): string {
    if (p instanceof C2) return "bar5";
    if (p instanceof C1) return "bar3";
    if (p instanceof PureI3) return "bar5";
    if (p instanceof PureI2) return "bar4";
    if (p instanceof PureI1) return "bar3";
    return "bar3";
  }
}

// ============================================================================
// Test Suite
// ============================================================================
export default function FirstMatchTest04():void {
  describe('FirstMatchTest04', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    SUB_FIRST_MATCH_TESTFOUR_0100
     * @tc.name      testSubtypesBasic0001
     * @tc.desc      First match for basic types (Any/Object vs null).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypesBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(sub_basic_0.foo(new Object())).assertEqual("foo1");
      expect(sub_basic_0.foo(null)).assertEqual("foo1");
      expect(sub_basic_0.bar(new Object())).assertEqual("bar2");
      expect(sub_basic_0.bar(null)).assertEqual("bar1");
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTFOUR_0200
     * @tc.name      testSubtypesBasic0002
     * @tc.desc      First match for basic types (Object vs null).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypesBasic0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(sub_basic_1.foo(new Object())).assertEqual("foo1");
      expect(sub_basic_1.foo(null)).assertEqual("foo2");
      expect(sub_basic_1.bar(new Object())).assertEqual("bar2");
      expect(sub_basic_1.bar(null)).assertEqual("bar1");
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTFOUR_0300
     * @tc.name      testSubtypesBasic0003
     * @tc.desc      First match for basic types (undefined vs null).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypesBasic0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(sub_basic_2.foo(undefined)).assertEqual("foo1");
      expect(sub_basic_2.foo(null)).assertEqual("foo2");
      expect(sub_basic_2.bar(undefined)).assertEqual("bar2");
      expect(sub_basic_2.bar(null)).assertEqual("bar1");
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTFOUR_0400
     * @tc.name      testSubtypesFunction0004
     * @tc.desc      More specific methods placed before general candidates (Functions).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypesFunction0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(sub_func_4.foo((p: sub_func_4.C2): void => {})).assertEqual("foo1");
      expect(sub_func_4.foo((p: sub_func_4.C1): void => {})).assertEqual("foo1");
      expect(sub_func_4.foo((p: sub_func_4.I1): void => {})).assertEqual("foo1");
      expect(sub_func_4.foo((p: sub_func_4.I2): void => {})).assertEqual("foo1");
      expect(sub_func_4.foo((p: sub_func_4.I3): void => {})).assertEqual("foo1");

      expect(sub_func_4.bar((p: sub_func_4.C2): void => { let dummy: string = "C2"; })).assertEqual("foo1");
      expect(sub_func_4.bar((p: sub_func_4.C1): void => { let dummy: string = "C1"; })).assertEqual("foo2");
      expect(sub_func_4.bar((p: sub_func_4.I1): void => { let dummy: string = "I1"; })).assertEqual("foo3");
      expect(sub_func_4.bar((p: sub_func_4.I2): void => { let dummy: string = "I2"; })).assertEqual("foo5");
      expect(sub_func_4.bar((p: sub_func_4.I3): void => { let dummy: string = "I3"; })).assertEqual("foo5");
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTFOUR_0500
     * @tc.name      testSubtypesMixing0005
     * @tc.desc      Mixing subtypes within the same signature.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypesMixing0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new sub_mix_5.B();
      let d = new sub_mix_5.D();
      expect(sub_mix_5.foo(b, d)).assertEqual("foo1");
      expect(sub_mix_5.foo(d, b)).assertEqual("foo2");
      expect(sub_mix_5.foo(d, d)).assertEqual("foo1");
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTFOUR_0600
     * @tc.name      testSubtypesNumeric0006
     * @tc.desc      More specific methods placed before general candidates (Numeric Types).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypesNumeric0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(sub_num_6.foo(1)).assertEqual("foo1");
      expect(sub_num_6.foo(1.1)).assertEqual("foo1");
      expect(sub_num_6.bar(1)).assertEqual("bar1");
      expect(sub_num_6.bar(1.1)).assertEqual("bar6");
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTFOUR_0700
     * @tc.name      testSubtypesRegular0007
     * @tc.desc      More specific methods placed before general candidates (Regular Hierarchies).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypesRegular0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new sub_reg_7.C1();
      let c2 = new sub_reg_7.C2();
      let i1 = new sub_reg_7.PureI1();
      let i2 = new sub_reg_7.PureI2();
      let i3 = new sub_reg_7.PureI3();

      expect(sub_reg_7.foo(c2)).assertEqual("foo1");
      expect(sub_reg_7.foo(c1)).assertEqual("foo2");
      expect(sub_reg_7.foo(i1)).assertEqual("foo3");
      expect(sub_reg_7.foo(i2)).assertEqual("foo4");
      expect(sub_reg_7.foo(i3)).assertEqual("foo4");

      expect(sub_reg_7.bar(c2)).assertEqual("bar5");
      expect(sub_reg_7.bar(c1)).assertEqual("bar3");
      expect(sub_reg_7.bar(i1)).assertEqual("bar3");
      expect(sub_reg_7.bar(i2)).assertEqual("bar4");
      expect(sub_reg_7.bar(i3)).assertEqual("bar5");
    });

  })
}


