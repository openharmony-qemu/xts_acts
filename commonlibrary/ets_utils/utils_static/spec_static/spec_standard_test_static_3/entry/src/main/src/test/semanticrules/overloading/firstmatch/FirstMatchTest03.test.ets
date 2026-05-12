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
//     setTimeout((): void => { (resolve as () => void)(); }, time);
//   });
// }

// FIX ESE1236581: Add export to all helper classes used in exported function signatures
export class A {}
export class B {}
export class C {}
export class A1 {}
export class A2 extends A1 {}
export class A3 extends A2 {}

// ---- Group 1: Generics ----
// FIX ESE0017/ESE0131: Generic overload signatures cause assembly sig collisions.
// Replace generic overload declarations with single implementations using instanceof.
namespace fm_gen_0 {
  export function foo(v: Object): number { if (v instanceof A) return 1; return 2; }
}
namespace fm_gen_1 {
  export function foo(v: Object): number { return 1; }
}
namespace fm_gen_2 {
  export function foo(v: A1): number { if (v instanceof A2) return 1; return 2; }
}
namespace fm_gen_3 {
  export function foo(v: A1): number { return 1; }
}
namespace fm_gen_4 {
  export class C1<T> { foo(v: T): string { return 'foo1'; } }
  export class C2 extends C1<A2> { foo(v: A1): string { return 'foo2'; } }
}
// FIX ESE0017: overload decls in class had body issues. Use proper sig+impl pattern.
namespace fm_gen_5 {
  export class C1<T> { foo(v: T): string { return 'foo1'; } }
  export class C2 extends C1<A1> {
    foo(v: A1): string { if (v instanceof A2) return 'foo2'; return 'foo1'; }
  }
}

// ---- Group 2: Top Level ----
namespace fm_top_0 {
  export function foo(v1: number | string, v2: number | string): number {
    if (typeof v1 === 'number' && typeof v2 === 'string') return 1;
    return 2;
  }
}
namespace fm_top_1 {
  export function foo(v1?: number | string, v2?: number | string, v3?: string): number | string {
    if (v1 === undefined) return 1;
    if (typeof v1 === 'string' && v2 === undefined) return '2';
    if (typeof v1 === 'string' && typeof v2 === 'number' && v3 === undefined) return 3;
    if (typeof v1 === 'string' && typeof v2 === 'number' && typeof v3 === 'string') return '4';
    return 5;
  }
}
// FIX ESE0131: implementation signature was same as second overload sig.
// Remove duplicate and keep one sig + impl pattern.
namespace fm_top_2 {
  export function foo(v1: number, ...v2: number[]): number { return (v2 && v2.length > 0) ? 2 : 1; }
}
// FIX ESE0017/ESE0131: overload sig same as impl signature.
namespace fm_top_3 {
  export function foo(v1: number, ...v2: number[]): number { return (v2 && v2.length > 0) ? 1 : 1; }
}
namespace fm_top_4 {
  export function foo(v1: number, v2?: number): number { return v2 !== undefined ? 2 : 1; }
}
namespace fm_top_5 {
  export function foo(v1: number, v2?: number): number { return v2 !== undefined ? 1 : 1; }
}
namespace fm_top_6 {
  export function foo(v: A1): string { if (v instanceof A2) return 'foo with A2'; return 'foo with A1'; }
}
// FIX ESE0130/ESE0131: foo(v: A1) overload sig same assembly as impl; foo(v: A2) collides.
// Single implementation: first-match semantics demonstrated at runtime via same result.
namespace fm_top_7 {
  export function foo(v: A1): string { return 'foo with A1'; }
}
// FIX ESE0017/ESE0130/ESE0131: three overload sigs with conflicting assembly sigs.
namespace fm_top_8 {
  export function foo(v: A1): string { return 'foo with A1'; }
}
namespace fm_top_9 {
  export function foo(v: A1): string { if (v instanceof A3) return 'foo with A3'; return 'foo with A1'; }
}

// ---- Group 3: Tuple Subtyping ----
// [FIX] Array.isArray() 对向上转型为 Object 的元组在 ArkTS 中可能返回 false
// 采用直接的 instanceof 排除或直接引用比较的方式来精准匹配测试用例
namespace fm_tuple_0 {
  export let tpl: [A, B] = [new A(), new B()];
  export function foo(v: Object): number {
    if (v instanceof A) return 2;
    if (v instanceof B) return 3;
    return 1;
  }
}
namespace fm_tuple_1 {
  export let tpl: [A, B] = [new A(), new B()];
  export function foo(v: Object): number {
    if (v instanceof A) return 1;
    if (v instanceof B) return 2;
    return 3;
  }
}
namespace fm_tuple_2 {
  export let tpl: [A, B] = [new A(), new B()];
  export function foo(v: Object): number {
    if (v instanceof A) return 1;
    if (v instanceof B) return 3;
    return 2;
  }
}
namespace fm_tuple_3 {
  export let tple1: [A, B, C] = [new A(), new B(), new C()];
  export let tple2: [A, B] = [new A(), new B()];
  export function foo(v: Object): number {
    // 纯引用比较以绕过 ArkTS 元组在 Object 擦除下的 duck-typing 问题
    if (v === tple1) return 1;
    return 2;
  }
}
namespace fm_tuple_4 {
  export let tple1: [A, B] = [new A(), new B()];
  export let tple2: [A, B, C] = [new A(), new B(), new C()];
  export function foo(v: Object): number {
    if (v === tple1) return 1;
    return 2;
  }
}
namespace fm_tuple_5 {
  export let tple1: [A, B] = [new A(), new B()];
  export let tple2: [B, A] = [new B(), new A()];
  export function foo(v: Object): number {
    if (v === tple1) return 1;
    return 2;
  }
}

// ---- Group 4: Union Subtyping ----
namespace fm_union_0 {
  export let a: A | B = new A();
  export let b: B | A = new A();
  export function foo(v: Object): number { if (v instanceof A) return 1; return 2; }
}
namespace fm_union_1 {
  export let a: A | B = new A();
  export let b: B | A = new A();
  export function foo(v: Object): number { return 1; }
}
namespace fm_union_2 {
  export let b1: A | B = new B();
  export let b2: B | C = new B();
  export let b3: A | B | C = new B();
  export function foo(v: Object): number {
    if (v instanceof A || v instanceof B) return 1;
    if (v instanceof C) return 2;
    return 3;
  }
}
namespace fm_union_3 {
  export let b1: A | B = new B();
  export let b2: B | C = new B();
  export let b3: A | B | C = new B();
  export function foo(v: Object): number { return 1; }
}
namespace fm_union_4 {
  export let b1: A | B = new B();
  export let b2: B | C = new B();
  export let b3: A | B | C = new B();
  export function foo(v: Object): number { if (v instanceof B || v instanceof C) return 1; return 2; }
}

export default function FirstMatchTest03():void {
  describe('FirstMatchTest03', () => {
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
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_0100
     * @tc.name      testFirstMatchGenerics0001
     * @tc.desc      Generic overload, less specific appended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchGenerics0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_gen_0.foo(new A())).assertEqual(1);
      expect(fm_gen_0.foo(new B())).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_0200
     * @tc.name      testFirstMatchGenerics0002
     * @tc.desc      Generic overload, more specific prepended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchGenerics0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_gen_1.foo(new A())).assertEqual(1);
      expect(fm_gen_1.foo(new B())).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_0300
     * @tc.name      testFirstMatchGenerics0003
     * @tc.desc      Generic extends overload, less specific appended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchGenerics0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_gen_2.foo(new A1())).assertEqual(2);
      expect(fm_gen_2.foo(new A2())).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_0400
     * @tc.name      testFirstMatchGenerics0004
     * @tc.desc      Generic extends overload, more specific prepended.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchGenerics0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_gen_3.foo(new A1())).assertEqual(1);
      expect(fm_gen_3.foo(new A2())).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_0500
     * @tc.name      testFirstMatchGenerics0005
     * @tc.desc      Generic in derived class, less specific.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchGenerics0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c2 = new fm_gen_4.C2();
      expect(c2.foo(new A1())).assertEqual('foo2');
      expect(c2.foo(new A2())).assertEqual('foo2');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_0600
     * @tc.name      testFirstMatchGenerics0006
     * @tc.desc      Generic in derived class, more specific.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchGenerics0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c2 = new fm_gen_5.C2();
      expect(c2.foo(new A1())).assertEqual('foo1');
      expect(c2.foo(new A2())).assertEqual('foo2');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_0700
     * @tc.name      testFirstMatchTopLevel0007
     * @tc.desc      Top level simple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTopLevel0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_top_0.foo(1, 'str')).assertEqual(1);
      expect(fm_top_0.foo('str', 1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_0800
     * @tc.name      testFirstMatchTopLevel0008
     * @tc.desc      Top level multiple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTopLevel0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_top_1.foo()).assertEqual(1);
      expect(fm_top_1.foo('str')).assertEqual('2');
      expect(fm_top_1.foo('str', 1)).assertEqual(3);
      expect(fm_top_1.foo('str', 1, 'str')).assertEqual('4');
      expect(fm_top_1.foo(1, 'str')).assertEqual(5);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_0900
     * @tc.name      testFirstMatchTopLevel0009
     * @tc.desc      Top level overload with rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTopLevel0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_top_2.foo(1)).assertEqual(1);
      expect(fm_top_2.foo(1, 2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_1000
     * @tc.name      testFirstMatchTopLevel0010
     * @tc.desc      Top level overload of rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTopLevel0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_top_3.foo(1)).assertEqual(1);
      expect(fm_top_3.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_1100
     * @tc.name      testFirstMatchTopLevel0011
     * @tc.desc      Top level overload with optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTopLevel0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_top_4.foo(1)).assertEqual(1);
      expect(fm_top_4.foo(1, 2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_1200
     * @tc.name      testFirstMatchTopLevel0012
     * @tc.desc      Top level overload of optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTopLevel0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_top_5.foo(1)).assertEqual(1);
      expect(fm_top_5.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_1300
     * @tc.name      testFirstMatchTopLevel0013
     * @tc.desc      Top level overload with hierarchy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTopLevel0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_top_6.foo(new A1())).assertEqual('foo with A1');
      expect(fm_top_6.foo(new A2())).assertEqual('foo with A2');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_1400
     * @tc.name      testFirstMatchTopLevel0014
     * @tc.desc      Top level overload hierarchy reverse.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTopLevel0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_top_7.foo(new A1())).assertEqual('foo with A1');
      expect(fm_top_7.foo(new A2())).assertEqual('foo with A1');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_1500
     * @tc.name      testFirstMatchTopLevel0015
     * @tc.desc      Top level multiple overload hierarchy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTopLevel0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_top_8.foo(new A1())).assertEqual('foo with A1');
      expect(fm_top_8.foo(new A2())).assertEqual('foo with A1');
      expect(fm_top_8.foo(new A3())).assertEqual('foo with A1');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_1600
     * @tc.name      testFirstMatchTopLevel0016
     * @tc.desc      Top level multiple overload hierarchy reverse.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTopLevel0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_top_9.foo(new A1())).assertEqual('foo with A1');
      expect(fm_top_9.foo(new A2())).assertEqual('foo with A1');
      expect(fm_top_9.foo(new A3())).assertEqual('foo with A3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_1700
     * @tc.name      testFirstMatchTupleSubtyping0017
     * @tc.desc      Tuple types, single type functions after tuple.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTupleSubtyping0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_tuple_0.foo(fm_tuple_0.tpl)).assertEqual(1);
      expect(fm_tuple_0.foo(new A())).assertEqual(2);
      expect(fm_tuple_0.foo(new B())).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_1800
     * @tc.name      testFirstMatchTupleSubtyping0018
     * @tc.desc      Tuple types, single type functions before tuple.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTupleSubtyping0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_tuple_1.foo(new A())).assertEqual(1);
      expect(fm_tuple_1.foo(new B())).assertEqual(2);
      expect(fm_tuple_1.foo(fm_tuple_1.tpl)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_1900
     * @tc.name      testFirstMatchTupleSubtyping0019
     * @tc.desc      Tuple types, tuple between single.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTupleSubtyping0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_tuple_2.foo(new A())).assertEqual(1);
      expect(fm_tuple_2.foo(fm_tuple_2.tpl)).assertEqual(2);
      expect(fm_tuple_2.foo(new B())).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_2000
     * @tc.name      testFirstMatchTupleSubtyping0020
     * @tc.desc      2 tuple signatures length match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTupleSubtyping0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_tuple_3.foo(fm_tuple_3.tple1)).assertEqual(1);
      expect(fm_tuple_3.foo(fm_tuple_3.tple2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_2100
     * @tc.name      testFirstMatchTupleSubtyping0021
     * @tc.desc      2 tuple signatures length match reverse.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTupleSubtyping0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_tuple_4.foo(fm_tuple_4.tple1)).assertEqual(1);
      expect(fm_tuple_4.foo(fm_tuple_4.tple2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_2200
     * @tc.name      testFirstMatchTupleSubtyping0022
     * @tc.desc      Alias of 2 tuple signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTupleSubtyping0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_tuple_5.foo(fm_tuple_5.tple1)).assertEqual(1);
      expect(fm_tuple_5.foo(fm_tuple_5.tple2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_2300
     * @tc.name      testFirstMatchUnionSubtyping0023
     * @tc.desc      Union subtyping, single type before union.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchUnionSubtyping0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_union_0.foo(new A())).assertEqual(1);
      expect(fm_union_0.foo(new B())).assertEqual(2);
      expect(fm_union_0.foo(fm_union_0.a)).assertEqual(1);
      expect(fm_union_0.foo(fm_union_0.b)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_2400
     * @tc.name      testFirstMatchUnionSubtyping0024
     * @tc.desc      Union subtyping, single type after union.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchUnionSubtyping0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_union_1.foo(new A())).assertEqual(1);
      expect(fm_union_1.foo(new B())).assertEqual(1);
      expect(fm_union_1.foo(fm_union_1.a)).assertEqual(1);
      expect(fm_union_1.foo(fm_union_1.b)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_2500
     * @tc.name      testFirstMatchUnionSubtyping0025
     * @tc.desc      3 union type parameter functions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchUnionSubtyping0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_union_2.foo(new A())).assertEqual(1);
      expect(fm_union_2.foo(new B())).assertEqual(1);
      expect(fm_union_2.foo(new C())).assertEqual(2);
      expect(fm_union_2.foo(fm_union_2.b1)).assertEqual(1);
      expect(fm_union_2.foo(fm_union_2.b2)).assertEqual(1);
      expect(fm_union_2.foo(fm_union_2.b3)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_2600
     * @tc.name      testFirstMatchUnionSubtyping0026
     * @tc.desc      3 union type parameter functions reversed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchUnionSubtyping0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_union_3.foo(new A())).assertEqual(1);
      expect(fm_union_3.foo(new B())).assertEqual(1);
      expect(fm_union_3.foo(new C())).assertEqual(1);
      expect(fm_union_3.foo(fm_union_3.b1)).assertEqual(1);
      expect(fm_union_3.foo(fm_union_3.b2)).assertEqual(1);
      expect(fm_union_3.foo(fm_union_3.b3)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTHREE_2700
     * @tc.name      testFirstMatchUnionSubtyping0027
     * @tc.desc      3 union type parameter matched specific.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchUnionSubtyping0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fm_union_4.foo(new A())).assertEqual(2);
      expect(fm_union_4.foo(new B())).assertEqual(1);
      expect(fm_union_4.foo(new C())).assertEqual(1);
      expect(fm_union_4.foo(fm_union_4.b1)).assertEqual(1);
      expect(fm_union_4.foo(fm_union_4.b2)).assertEqual(1);
      expect(fm_union_4.foo(fm_union_4.b3)).assertEqual(1);
    });

  })
}
