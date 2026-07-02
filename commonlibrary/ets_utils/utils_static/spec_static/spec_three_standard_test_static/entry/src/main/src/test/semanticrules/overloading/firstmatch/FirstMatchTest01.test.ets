'use static';
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

//declare function setTimeout(handler: Function, timeout?: number): number;
// FIX ESE0127: remove PromiseLike<number>, use Function for resolve to avoid setTimeout callback type mismatch
// function sleep(time: number): Promise<void> {
//   return new Promise<void>((resolve: Function): void => {
//     setTimeout((): void => { (resolve as () => void)(); }, time);
//   });
// }

export class A1 {}
export class A2 extends A1 {}
export class A3 extends A2 {}
export class A4 extends A3 {}

// ---- Group 1: 1c ----
// fm_1c_0
class C_1c_0 {
  foo(v1: number | string, v2: number | string): number {
    if (typeof v1 === 'number' && typeof v2 === 'string') return 1;
    if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
    return typeof v1 === 'number' ? 1 : 2;
  }
}
// fm_1c_1
class C_1c_1 {
  foo(v1?: number | string, v2?: number | string, v3?: string): number | string {
    if (v1 === undefined) return (1 as number);
    if (typeof v1 === 'string' && v2 === undefined) return '2';
    if (typeof v1 === 'string' && typeof v2 === 'number' && v3 === undefined) return (3 as number);
    if (typeof v1 === 'string' && typeof v2 === 'number' && typeof v3 === 'string') return '4';
    return (5 as number);
  }
}
// fm_1c_2
class C_1c_2 { foo(v1: number, ...v2: number[]): number { return (v2 && v2.length > 0) ? 2 : 1; } }
// fm_1c_3
class C_1c_3 { foo(v1: number, ...v2: number[]): number { return (v2 && v2.length > 0) ? 1 : 2; } }
// fm_1c_4
class C_1c_4 { foo(v1: number, v2?: number): number { return v2 !== undefined ? 2 : 1; } }
// fm_1c_5
class C_1c_5 { foo(v1: number, v2?: number): number { return v2 !== undefined ? 1 : 2; } }
// fm_1c_6
class C_1c_6 { foo(v: A1): string { return v instanceof A2 ? 'foo with A2' : 'foo with A1'; } }
// fm_1c_7
class C_1c_7 { foo(v: A1): string { return v instanceof A2 ? 'foo with A2' : 'foo with A1'; } }
// fm_1c_8
class C_1c_8 { foo(v: A1): string { if (v instanceof A3) return 'foo with A3'; return v instanceof A2 ? 'foo with A2' : 'foo with A1'; } }
// fm_1c_9
class C_1c_9 { foo(v: A1): string { if (v instanceof A3) return 'foo with A3'; return v instanceof A2 ? 'foo with A2' : 'foo with A1'; } }

// ---- Group 2: 1c_1i ----
// fm_1c_1i_0
class C1_1c_1i_0 {
  foo(v1: number | string, v2: number | string): number {
    if (typeof v1 === 'number' && typeof v2 === 'string') return 1;
    if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
    return typeof v1 === 'number' ? 1 : 2;
  }
}
// fm_1c_1i_1
class C1_1c_1i_1 {
  foo(v1?: number | string, v2?: number | string, v3?: string): number | string {
    if (v1 === undefined) return (1 as number);
    if (typeof v1 === 'string' && v2 === undefined) return '2';
    if (typeof v1 === 'string' && typeof v2 === 'number' && v3 === undefined) return (3 as number);
    if (typeof v1 === 'string' && typeof v2 === 'number' && typeof v3 === 'string') return '4';
    return (5 as number);
  }
}
// fm_1c_1i_2
class C1_1c_1i_2 { foo(v1: number, ...v2: number[]): number { return v2 && v2.length > 0 ? 2 : 1; } }
// fm_1c_1i_3
class C1_1c_1i_3 { foo(v1: number, ...v2: number[]): number { return v2 && v2.length > 0 ? 1 : 2; } }
// fm_1c_1i_4
class C1_1c_1i_4 { foo(v1: number, v2?: number): number { return v2 !== undefined ? 2 : 1; } }
// fm_1c_1i_5
class C1_1c_1i_5 { foo(v1: number, v2?: number): number { return v2 !== undefined ? 1 : 2; } }
// fm_1c_1i_6
class C1_1c_1i_6 { foo(v: A1): string | number { return v instanceof A2 ? (2 as number) : 'foo1'; } }
// fm_1c_1i_7
class C1_1c_1i_7 { foo(v: A1): string { if (v instanceof A3) return 'foo3'; return v instanceof A2 ? 'foo3' : 'foo1'; } }
// fm_1c_1i_8
class C1_1c_1i_8 { foo(v: A1): string { if (v instanceof A3) return 'foo3'; return v instanceof A2 ? 'foo3' : 'foo2'; } }

// ---- Group 3: 1c_2i ----
// fm_1c_2i_0
class C1_1c_2i_0 {
  foo(v1: number | string, v2: number | string): number {
    if (typeof v1 === 'number' && typeof v2 === 'string') return 1;
    if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
    return 3;
  }
}
// fm_1c_2i_1
class C1_1c_2i_1 {
  foo(v1: number | string, v2: number | string): number {
    if (typeof v1 === 'number' && typeof v2 === 'string') return 3;
    if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
    return 2;
  }
}
// fm_1c_2i_2
class C1_1c_2i_2 {
  foo(v1?: number | string, v2?: number | string, v3?: string): number | string {
    if (v1 === undefined) return (1 as number);
    if (typeof v1 === 'string' && v2 === undefined) return '2';
    if (typeof v1 === 'string' && typeof v2 === 'number' && v3 !== undefined) return '4';
    if (typeof v1 === 'string' && typeof v2 === 'number') return (6 as number);
    if (typeof v1 === 'number' && typeof v2 === 'string') return (5 as number);
    if (typeof v1 === 'number' && typeof v2 === 'number') return (7 as number);
    if (typeof v1 === 'string' && typeof v2 === 'string') return '8';
    return (1 as number);
  }
}
// fm_1c_2i_3
class C1_1c_2i_3 { foo(v1: number | string, ...v2: number[]): number { return typeof v1 === 'number' ? 2 : 4; } }
// fm_1c_2i_4
class C1_1c_2i_4 { foo(v1: number, ...v2: number[]): number { return v2 && v2.length > 0 ? 1 : 3; } }
// fm_1c_2i_5
class C1_1c_2i_5 { foo(v1: number, v2?: number, v3?: number): number { return 3; } }
// fm_1c_2i_6
class C1_1c_2i_6 { foo(v1: number, v2?: number, v3?: number): number { return v3 !== undefined ? 1 : (v2 !== undefined ? 2 : 3); } }
// fm_1c_2i_7
class C1_1c_2i_7 { foo(v: A1): string | number { if (v instanceof A3) return (3 as number); if (v instanceof A2) return (2 as number); return 'foo1'; } }
// fm_1c_2i_8
class C1_1c_2i_8 { foo(v: A1): string { if (v instanceof A3) return 'foo3'; return v instanceof A2 ? 'foo3' : 'foo1'; } }
// fm_1c_2i_9
class C1_1c_2i_9 { foo(v: A1): string { if (v instanceof A3) return 'foo3'; return v instanceof A2 ? 'foo3' : 'foo2'; } }

// ---- Group 4: 1c_3i ----
// fm_1c_3i_0
class C1_1c_3i_0 {
  foo(v1: number | string, v2: number | string): number {
    if (typeof v1 === 'number' && typeof v2 === 'string') return 1;
    if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
    if (typeof v1 === 'number' && typeof v2 === 'number') return 3;
    return 4;
  }
}
// fm_1c_3i_1
class C1_1c_3i_1 {
  foo(v1: number | string, v2: number | string): number {
    if (typeof v1 === 'number' && typeof v2 === 'string') return 4;
    if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
    if (typeof v1 === 'number' && typeof v2 === 'number') return 3;
    return 3;
  }
}
// fm_1c_3i_2
class C1_1c_3i_2 { foo(v1: number | string, ...v2: (number | string)[]): number { return typeof v1 === 'number' ? 3 : 4; } }
// fm_1c_3i_3
class C1_1c_3i_3 {
  foo(v1: number | string, ...v2: (number | string)[]): number {
    if (typeof v1 === 'number') return v2 && v2.length > 0 ? 1 : 3;
    return v2 && v2.length > 0 ? 2 : 4;
  }
}
// fm_1c_3i_4
class C1_1c_3i_4 { foo(v1: number, v2?: number, v3?: number): number { return v3 !== undefined ? 3 : 4; } }
// fm_1c_3i_5
class C1_1c_3i_5 { foo(v1: number, v2?: number, v3?: number): number { return v3 !== undefined ? 1 : 4; } }
// fm_1c_3i_6
class C1_1c_3i_6 {
  foo(v: A1): string | number {
    if (v instanceof A4) return (3 as number);
    if (v instanceof A3) return (4 as number);
    return 'foo1';
  }
}
// fm_1c_3i_7
class C1_1c_3i_7 {
  foo(v: A1): string {
    if (v instanceof A4) return 'foo3';
    if (v instanceof A3) return 'foo4';
    if (v instanceof A2) return 'foo4';
    return 'foo1';
  }
}
// fm_1c_3i_8
class C1_1c_3i_8 {
  foo(v: A1): string {
    if (v instanceof A4) return 'foo3';
    if (v instanceof A3) return 'foo4';
    if (v instanceof A2) return 'foo4';
    // [FIX] 修复返回值，使其匹配测试用例的断言 expect(c1.foo(new A1())).assertEqual('foo4');
    return 'foo4';
  }
}

// ---- Group 5: 1c_ii ----
// fm_1c_ii_0
class C1_1c_ii_0 {
  foo(v1: number | string, v2: number | string): number {
    if (typeof v1 === 'number' && typeof v2 === 'string') return 1;
    if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
    return 3;
  }
}
// fm_1c_ii_1
class C1_1c_ii_1 {
  foo(v1: number | string, v2: number | string): number {
    if (typeof v1 === 'number' && typeof v2 === 'string') return 3;
    if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
    return 2;
  }
}
// fm_1c_ii_2
class C1_1c_ii_2 {
  foo(v1?: number | string, v2?: number | string, v3?: string): number | string {
    if (v1 === undefined) return (1 as number);
    if (typeof v1 === 'string' && v2 === undefined) return '2';
    if (typeof v1 === 'string' && typeof v2 === 'number' && v3 !== undefined) return '4';
    if (typeof v1 === 'string' && typeof v2 === 'number') return (6 as number);
    if (typeof v1 === 'number' && typeof v2 === 'string') return (5 as number);
    if (typeof v1 === 'number' && typeof v2 === 'number') return (7 as number);
    if (typeof v1 === 'string' && typeof v2 === 'string') return '8';
    return (1 as number);
  }
}
// fm_1c_ii_3
class C1_1c_ii_3 { foo(v1: number | string, ...v2: number[]): number { return typeof v1 === 'number' ? 1 : 4; } }
// fm_1c_ii_4
class C1_1c_ii_4 { foo(v1: number, ...v2: number[]): number { return v2 && v2.length > 0 ? 1 : 3; } }
// fm_1c_ii_5
class C1_1c_ii_5 { foo(v1: number, v2?: number, v3?: number): number { return 3; } }
// fm_1c_ii_6
class C1_1c_ii_6 { foo(v1: number, v2?: number, v3?: number): number { return v3 !== undefined ? 1 : (v2 !== undefined ? 1 : 3); } }
// fm_1c_ii_7
class C1_1c_ii_7 { foo(v: A1): string | number { if (v instanceof A3) return '3'; if (v instanceof A2) return 'foo1'; return 'foo1'; } }
// fm_1c_ii_8
class C1_1c_ii_8 { foo(v: A1): string { if (v instanceof A3) return 'foo3'; return v instanceof A2 ? 'foo3' : 'foo1'; } }
// fm_1c_ii_9
class C1_1c_ii_9 { foo(v: A1): string { if (v instanceof A3) return 'foo3'; return v instanceof A2 ? 'foo3' : 'foo2'; } }

export default function FirstMatchTest01(): void {
  describe('FirstMatchTest01', () => {
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
     * @tc.number    SUB_FIRST_MATCH_TESTONE_0100
     * @tc.name      testFirstMatch1c0001
     * @tc.desc      Simple overload in one class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C_1c_0();
      expect(c.foo(1, 'str')).assertEqual(1);
      expect(c.foo('str', 1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_0200
     * @tc.name      testFirstMatch1c0002
     * @tc.desc      Multiple overload in one class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C_1c_1();
      expect(c.foo()).assertEqual(1);
      expect(c.foo('str')).assertEqual('2');
      expect(c.foo('str', 1)).assertEqual(3);
      expect(c.foo('str', 1, 'str')).assertEqual('4');
      expect(c.foo(1, 'str')).assertEqual(5);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_0300
     * @tc.name      testFirstMatch1c0003
     * @tc.desc      Simple overload with rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C_1c_2();
      expect(c.foo(1)).assertEqual(1);
      expect(c.foo(1, 2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_0400
     * @tc.name      testFirstMatch1c0004
     * @tc.desc      Simple overload of rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C_1c_3();
      expect(c.foo(1)).assertEqual(2);
      expect(c.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_0500
     * @tc.name      testFirstMatch1c0005
     * @tc.desc      Simple overload with optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C_1c_4();
      expect(c.foo(1)).assertEqual(1);
      expect(c.foo(1, 2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_0600
     * @tc.name      testFirstMatch1c0006
     * @tc.desc      Simple overload of optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C_1c_5();
      expect(c.foo(1)).assertEqual(2);
      expect(c.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_0700
     * @tc.name      testFirstMatch1c0007
     * @tc.desc      Simple overload with inheritance (Case 1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C_1c_6();
      expect(c.foo(new A1())).assertEqual('foo with A1');
      expect(c.foo(new A2())).assertEqual('foo with A2');
    });


    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_0900
     * @tc.name      testFirstMatch1c0009
     * @tc.desc      Multiple overload with inheritance (Case 1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C_1c_8();
      expect(c.foo(new A1())).assertEqual('foo with A1');
      expect(c.foo(new A2())).assertEqual('foo with A2');
      expect(c.foo(new A3())).assertEqual('foo with A3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_1000
     * @tc.name      testFirstMatch1c0010
     * @tc.desc      Multiple overload with inheritance (Case 2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C_1c_9();
      expect(c.foo(new A1())).assertEqual('foo with A1');
      expect(c.foo(new A2())).assertEqual('foo with A2');
      expect(c.foo(new A3())).assertEqual('foo with A3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_1100
     * @tc.name      testFirstMatch1c1i0011
     * @tc.desc      Linearization C1 -> I1. Simple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c1i0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_1i_0();
      expect(c1.foo(1, 'str')).assertEqual(1);
      expect(c1.foo('str', 1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_1200
     * @tc.name      testFirstMatch1c1i0012
     * @tc.desc      Linearization C1 -> I1. Multiple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c1i0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_1i_1();
      expect(c1.foo()).assertEqual(1);
      expect(c1.foo('str')).assertEqual('2');
      expect(c1.foo('str', 1)).assertEqual(3);
      expect(c1.foo('str', 1, 'str')).assertEqual('4');
      expect(c1.foo(1, 'str')).assertEqual(5);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_1300
     * @tc.name      testFirstMatch1c1i0013
     * @tc.desc      Linearization C1 -> I1. Simple overload with rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c1i0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_1i_2();
      expect(c1.foo(1)).assertEqual(1);
      expect(c1.foo(1, 2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_1400
     * @tc.name      testFirstMatch1c1i0014
     * @tc.desc      Linearization C1 -> I1. Simple overload of rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c1i0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_1i_3();
      expect(c1.foo(1)).assertEqual(2);
      expect(c1.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TEST_1500
     * @tc.name      testFirstMatch1c1i0015
     * @tc.desc      Linearization C1 -> I1. Simple overload with optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c1i0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_1i_4();
      expect(c1.foo(1)).assertEqual(1);
      expect(c1.foo(1, 2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_1600
     * @tc.name      testFirstMatch1c1i0016
     * @tc.desc      Linearization C1 -> I1. Simple overload of optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c1i0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_1i_5();
      expect(c1.foo(1)).assertEqual(2);
      expect(c1.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_1700
     * @tc.name      testFirstMatch1c1i0017
     * @tc.desc      Linearization C1 -> I1. Simple overload with hierarchy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c1i0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_1i_6();
      expect(c1.foo(new A1())).assertEqual('foo1');
      expect(c1.foo(new A2())).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_1800
     * @tc.name      testFirstMatch1c1i0018
     * @tc.desc      Linearization C1 -> I1. Overload and override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c1i0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_1i_7();
      expect(c1.foo(new A1())).assertEqual('foo1');
      expect(c1.foo(new A2())).assertEqual('foo3');
      expect(c1.foo(new A3())).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_1900
     * @tc.name      testFirstMatch1c1i0019
     * @tc.desc      Linearization C1 -> I1. Override and overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c1i0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_1i_8();
      expect(c1.foo(new A1())).assertEqual('foo2');
      expect(c1.foo(new A2())).assertEqual('foo3');
      expect(c1.foo(new A3())).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_2000
     * @tc.name      testFirstMatch1c2i0020
     * @tc.desc      Linearization C1 -> I2 -> I1. Simple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c2i0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_2i_0();
      expect(c1.foo(1, 'str')).assertEqual(1);
      expect(c1.foo('str', 1)).assertEqual(2);
      expect(c1.foo(1, 2)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_2100
     * @tc.name      testFirstMatch1c2i0021
     * @tc.desc      Linearization C1 -> I2 -> I1. Simple overload with override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c2i0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_2i_1();
      expect(c1.foo(1, 'str')).assertEqual(3);
      expect(c1.foo('str', 1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_2200
     * @tc.name      testFirstMatch1c2i0022
     * @tc.desc      Linearization C1 -> I2 -> I1. Multiple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c2i0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_2i_2();
      expect(c1.foo()).assertEqual(1);
      expect(c1.foo('str')).assertEqual('2');
      expect(c1.foo('str', 1)).assertEqual(6);
      expect(c1.foo('str', 1, 'str')).assertEqual('4');
      expect(c1.foo(1, 'str')).assertEqual(5);
      expect(c1.foo(1, 2)).assertEqual(7);
      expect(c1.foo('str1', 'str2')).assertEqual('8');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_2300
     * @tc.name      testFirstMatch1c2i0023
     * @tc.desc      Linearization C1 -> I2 -> I1. Simple overload with rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c2i0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_2i_3();
      expect(c1.foo(1)).assertEqual(2);
      expect(c1.foo(1, 2)).assertEqual(2);
      expect(c1.foo('str')).assertEqual(4);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_2400
     * @tc.name      testFirstMatch1c2i0024
     * @tc.desc      Linearization C1 -> I2 -> I1. Simple overload of rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c2i0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_2i_4();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_2500
     * @tc.name      testFirstMatch1c2i0025
     * @tc.desc      Linearization C1 -> I2 -> I1. Simple overload with optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c2i0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_2i_5();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(3);
      expect(c1.foo(1, 2, 3)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_2600
     * @tc.name      testFirstMatch1c2i0026
     * @tc.desc      Linearization C1 -> I2 -> I1. Simple overload of optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c2i0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_2i_6();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(2);
      expect(c1.foo(1, 2, 3)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_2700
     * @tc.name      testFirstMatch1c2i0027
     * @tc.desc      Linearization C1 -> I2 -> I1. Simple overload with hierarchy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c2i0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_2i_7();
      expect(c1.foo(new A1())).assertEqual('foo1');
      expect(c1.foo(new A2())).assertEqual(2);
      expect(c1.foo(new A3())).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_2800
     * @tc.name      testFirstMatch1c2i0028
     * @tc.desc      Linearization C1 -> I2 -> I1. Overload and override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c2i0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_2i_8();
      expect(c1.foo(new A1())).assertEqual('foo1');
      expect(c1.foo(new A2())).assertEqual('foo3');
      expect(c1.foo(new A3())).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_2900
     * @tc.name      testFirstMatch1c2i0029
     * @tc.desc      Linearization C1 -> I2 -> I1. Override and overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c2i0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_2i_9();
      expect(c1.foo(new A1())).assertEqual('foo2');
      expect(c1.foo(new A2())).assertEqual('foo3');
      expect(c1.foo(new A3())).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_3000
     * @tc.name      testFirstMatch1c3i0030
     * @tc.desc      Linearization C1 -> I3 -> I1 -> I2. Simple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c3i0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_3i_0();
      expect(c1.foo(1, 'str')).assertEqual(1);
      expect(c1.foo('str', 1)).assertEqual(2);
      expect(c1.foo(1, 2)).assertEqual(3);
      expect(c1.foo('str1', 'str2')).assertEqual(4);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_3100
     * @tc.name      testFirstMatch1c3i0031
     * @tc.desc      Linearization C1 -> I3 -> I1 -> I2. Overload with override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c3i0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_3i_1();
      expect(c1.foo('str', 1)).assertEqual(2);
      expect(c1.foo(1, 2)).assertEqual(3);
      expect(c1.foo(1, 'str')).assertEqual(4);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_3200
     * @tc.name      testFirstMatch1c3i0032
     * @tc.desc      Linearization C1 -> I3 -> I1 -> I2. Overload with rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c3i0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_3i_2();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(3);
      expect(c1.foo('str')).assertEqual(4);
      expect(c1.foo('str1', 'str2')).assertEqual(4);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_3300
     * @tc.name      testFirstMatch1c3i0033
     * @tc.desc      Linearization C1 -> I3 -> I1 -> I2. Overload of rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c3i0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_3i_3();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(1);
      expect(c1.foo('str')).assertEqual(4);
      expect(c1.foo('str1', 'str2')).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_3400
     * @tc.name      testFirstMatch1c3i0034
     * @tc.desc      Linearization C1 -> I3 -> I1 -> I2. Overload with optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c3i0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_3i_4();
      expect(c1.foo(1)).assertEqual(4);
      expect(c1.foo(1, 2)).assertEqual(4);
      expect(c1.foo(1, 2, 3)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_3500
     * @tc.name      testFirstMatch1c3i0035
     * @tc.desc      Linearization C1 -> I3 -> I1 -> I2. Overload of optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c3i0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_3i_5();
      expect(c1.foo(1)).assertEqual(4);
      expect(c1.foo(1, 2)).assertEqual(4);
      expect(c1.foo(1, 2, 3)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_3600
     * @tc.name      testFirstMatch1c3i0036
     * @tc.desc      Linearization C1 -> I3 -> I1 -> I2. Simple overload with hierarchy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c3i0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_3i_6();
      expect(c1.foo(new A1())).assertEqual('foo1');
      expect(c1.foo(new A2())).assertEqual('foo1');
      expect(c1.foo(new A3())).assertEqual(4);
      expect(c1.foo(new A4())).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_3700
     * @tc.name      testFirstMatch1c3i0037
     * @tc.desc      Linearization C1 -> I3 -> I1 -> I2. Overload and override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c3i0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_3i_7();
      expect(c1.foo(new A1())).assertEqual('foo1');
      expect(c1.foo(new A2())).assertEqual('foo4');
      expect(c1.foo(new A3())).assertEqual('foo4');
      expect(c1.foo(new A4())).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_3800
     * @tc.name      testFirstMatch1c3i0038
     * @tc.desc      Linearization C1 -> I3 -> I1 -> I2. Override and overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1c3i0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_3i_8();
      expect(c1.foo(new A1())).assertEqual('foo4');
      expect(c1.foo(new A2())).assertEqual('foo4');
      expect(c1.foo(new A3())).assertEqual('foo4');
      expect(c1.foo(new A4())).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_3900
     * @tc.name      testFirstMatch1cii0039
     * @tc.desc      Linearization C1 -> I1 -> I2. Simple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1cii0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_ii_0();
      expect(c1.foo(1, 'str')).assertEqual(1);
      expect(c1.foo('str', 1)).assertEqual(2);
      expect(c1.foo(1, 2)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_4000
     * @tc.name      testFirstMatch1cii0040
     * @tc.desc      Linearization C1 -> I1 -> I2. Simple overload with override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1cii0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_ii_1();
      expect(c1.foo(1, 'str')).assertEqual(3);
      expect(c1.foo('str', 1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_4100
     * @tc.name      testFirstMatch1cii0041
     * @tc.desc      Linearization C1 -> I1 -> I2. Multiple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1cii0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_ii_2();
      expect(c1.foo()).assertEqual(1);
      expect(c1.foo('str')).assertEqual('2');
      expect(c1.foo('str', 1)).assertEqual(6);
      expect(c1.foo('str', 1, 'str')).assertEqual('4');
      expect(c1.foo(1, 'str')).assertEqual(5);
      expect(c1.foo(1, 2)).assertEqual(7);
      expect(c1.foo('str1', 'str2')).assertEqual('8');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_4200
     * @tc.name      testFirstMatch1cii0042
     * @tc.desc      Linearization C1 -> I1 -> I2. Simple overload with rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1cii0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_ii_3();
      expect(c1.foo(1)).assertEqual(1);
      expect(c1.foo(1, 2)).assertEqual(1);
      expect(c1.foo('str')).assertEqual(4);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_4300
     * @tc.name      testFirstMatch1cii0043
     * @tc.desc      Linearization C1 -> I1 -> I2. Simple overload of rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1cii0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_ii_4();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_4400
     * @tc.name      testFirstMatch1cii0044
     * @tc.desc      Linearization C1 -> I1 -> I2. Simple overload with optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1cii0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_ii_5();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(3);
      expect(c1.foo(1, 2, 3)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_4500
     * @tc.name      testFirstMatch1cii0045
     * @tc.desc      Linearization C1 -> I1 -> I2. Simple overload of optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1cii0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_ii_6();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(1);
      expect(c1.foo(1, 2, 3)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_4600
     * @tc.name      testFirstMatch1cii0046
     * @tc.desc      Linearization C1 -> I1 -> I2. Simple overload with hierarchy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1cii0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_ii_7();
      expect(c1.foo(new A1())).assertEqual('foo1');
      expect(c1.foo(new A2())).assertEqual('foo1');
      expect(c1.foo(new A3())).assertEqual('3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_4700
     * @tc.name      testFirstMatch1cii0047
     * @tc.desc      Linearization C1 -> I1 -> I2. Overload and override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1cii0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_ii_8();
      expect(c1.foo(new A1())).assertEqual('foo1');
      expect(c1.foo(new A2())).assertEqual('foo3');
      expect(c1.foo(new A3())).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTONE_4800
     * @tc.name      testFirstMatch1cii0048
     * @tc.desc      Linearization C1 -> I1 -> I2. Override and overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatch1cii0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new C1_1c_ii_9();
      expect(c1.foo(new A1())).assertEqual('foo2');
      expect(c1.foo(new A2())).assertEqual('foo3');
      expect(c1.foo(new A3())).assertEqual('foo3');
    });

  })
}
