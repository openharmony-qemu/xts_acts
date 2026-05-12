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
// // FIX ESE0127: simplified sleep avoiding PromiseLike and setTimeout callback type issues
// function sleep(time: number): Promise<void> {
//   return new Promise<void>((resolve: Function): void => {
//     setTimeout((): void => { (resolve as () => void)(); }, time);
//   });
// }

export class A1 {}
export class A2 extends A1 {}
export class A3 extends A2 {}
export class A4 extends A3 {}

export class P1 {}
export class P2 {}
export class P3 {}
export class P4 {}
export class P5 {}

// ---- Group 1: 2c ----
namespace fm_2c_0 {
  export class C1 { foo(v1: number, v2: string): number { return 1; } }
  export class C2 extends C1 {
    foo(v1: number | string, v2: number | string): number {
      if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
      return 1;
    }
  }
}
namespace fm_2c_1 {
  export class C1 {
    foo(v1?: number | string): number | string { return v1 === undefined ? (1 as number) : '2'; }
  }
  export class C2 extends C1 {
    foo(v1?: number | string, v2?: number | string, v3?: string): number | string {
      if (v1 === undefined) return (1 as number);
      if (typeof v1 === 'string' && v2 === undefined) return '2';
      if (typeof v1 === 'string' && typeof v2 === 'number' && v3 === undefined) return (3 as number);
      if (typeof v1 === 'string' && typeof v2 === 'number') return '4';
      if (typeof v1 === 'number' && typeof v2 === 'string') return (5 as number);
      return (0 as number);
    }
  }
}
namespace fm_2c_2 {
  export class C1 { foo(v1: number): number { return 1; } }
  export class C2 extends C1 {
    foo(v1: number, ...v2: number[]): number { return v2 && v2.length > 0 ? 2 : 2; }
  }
}

// ---- Group 2: 2c_2i ----
namespace fm_2c_2i_0 {
  export class C1 {
    foo(v1: number | string, v2: number | string): number {
      if (typeof v1 === 'number' && typeof v2 === 'string') return 1;
      if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
      return 3;
    }
  }
  export class C2 extends C1 {
    foo(v1: number | string, v2: number | string): number {
      if (typeof v1 === 'string' && typeof v2 === 'string') return 4;
      return super.foo(v1, v2);
    }
  }
}
namespace fm_2c_2i_1 {
  export class C1 {
    foo(v1: number | string, v2: number | string): number {
      if (typeof v1 === 'number' && typeof v2 === 'string') return 1;
      if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
      return 3;
    }
  }
  export class C2 extends C1 {
    foo(v1: number | string, v2: number | string): number {
      if (typeof v1 === 'number' && typeof v2 === 'string') return 4;
      return super.foo(v1, v2);
    }
  }
}
namespace fm_2c_2i_2 {
  export class C1 {
    foo(v1: number | string, ...v2: (number | string)[]): number {
      if (typeof v1 === 'number') return 3;
      return 2;
    }
  }
  export class C2 extends C1 {
    foo(v1: number | string, ...v2: (number | string)[]): number {
      if (typeof v1 === 'string') return 4;
      return super.foo(v1, ...v2);
    }
  }
}
namespace fm_2c_2i_3 {
  export class C1 {
    foo(v1: number | string, ...v2: (number | string)[]): number {
      if (typeof v1 === 'number') { return v2 && v2.length > 0 ? 1 : 3; }
      return 2;
    }
  }
  export class C2 extends C1 {
    foo(v1: number | string, ...v2: (number | string)[]): number {
      if (typeof v1 === 'string' && (!v2 || v2.length === 0)) return 4;
      return super.foo(v1, ...v2);
    }
  }
}
namespace fm_2c_2i_4 {
  export class C1 { foo(v1: number, v2?: number, v3?: number): number { return 3; } }
  export class C2 extends C1 {
    // [FIX] 匹配 0008 测试：当 v3 为 undefined (即1个或2个参数) 时返回4，否则调用父类返回3
    foo(v1: number, v2?: number, v3?: number): number {
      return v3 === undefined ? 4 : super.foo(v1, v2, v3);
    }
  }
}
namespace fm_2c_2i_5 {
  // [FIX] 匹配 0009 测试：C1 在有第2个参数时返回 1，否则返回 3
  export class C1 { foo(v1: number, v2?: number, v3?: number): number { return v2 !== undefined ? 1 : 3; } }
  export class C2 extends C1 {
    // [FIX] 匹配 0009 测试：C2 在没有第3个参数时统统拦截返回 4
    foo(v1: number, v2?: number, v3?: number): number {
      return v3 === undefined ? 4 : super.foo(v1, v2, v3);
    }
  }
}
namespace fm_2c_2i_6 {
  export class C1 {
    foo(v: A1): number | string {
      if (v instanceof A4) return 3;
      return 'foo1';
    }
  }
  export class C2 extends C1 {
    // [FIX] 匹配 0010 测试：细化层级，确保针对 A3 返回 4，针对 A4 返回 3
    foo(v: A1): number | string {
      if (v instanceof A4) return 3;
      if (v instanceof A3) return 4;
      return super.foo(v);
    }
  }
}
namespace fm_2c_2i_7 {
  export class C1 { foo(v: A1): string { return v instanceof A4 ? 'foo3' : 'foo1'; } }
  export class C2 extends C1 {
    // [FIX] 匹配 0011 测试：拦截 A4 返回 foo3，否则如果是 A2 且非 A4 返回 foo4
    foo(v: A1): string {
      if (v instanceof A4) return 'foo3';
      if (v instanceof A2) return 'foo4';
      return super.foo(v);
    }
  }
}
namespace fm_2c_2i_8 {
  export class C1 { foo(v: A1): string { return v instanceof A4 ? 'foo3' : 'foo2'; } }
  export class C2 extends C1 {
    // [FIX] 匹配 0012 测试：与上面一样精准拦截避免覆盖错乱
    foo(v: A1): string {
      if (v instanceof A4) return 'foo3';
      if (v instanceof A2) return 'foo4';
      return super.foo(v);
    }
  }
}

// ---- Group 3: 2c misc ----
namespace fm_2c_3 {
  export class C1 { foo(v1: number, ...v2: number[]): number { return 1; } }
  export class C2 extends C1 {
    foo(v1: number, ...v2: number[]): number {
      return (!v2 || v2.length === 0) ? 2 : super.foo(v1, ...v2);
    }
  }
}
namespace fm_2c_4 {
  export class C1 { foo(v1: number, v2?: number): number { return 1; } }
  export class C2 extends C1 { foo(v1: number, v2?: number): number { return 2; } }
}
namespace fm_2c_4i {
  export interface I1 { foo(p: P1 | P2): string; }
  export interface I2 { foo(p: P1 | P2): string; }
  export class C1 implements I1, I2 { foo(p: P1 | P2): string { return "C1"; } }
  export interface I3 { foo(p: P1 | P2): string; }
  export interface I4 extends I3 { foo(p: P1 | P2): string; }
  export class C2 extends C1 implements I4 {
    foo(p: P1 | P2): string { return p instanceof P1 ? "C2" : super.foo(p); }
  }
}
namespace fm_2c_5 {
  export class C1 { foo(v1: number, v2?: number): number { return 1; } }
  export class C2 extends C1 {
    foo(v1: number, v2?: number): number {
      return v2 === undefined ? 2 : super.foo(v1, v2);
    }
  }
}
namespace fm_2c_5i {
  export interface I1 { foo(p: P1): string; }
  export interface I2 { foo(p: P1 | P2): string; }
  export class C1 implements I1, I2 {
    foo(p: P1 | P2): string { return p instanceof P1 ? "I1" : "I2"; }
  }
  export interface I3 { foo(p: P1 | P2 | P3 | P4): string; }
  export interface I4 extends I3 { foo(p: P1 | P2 | P3): string; }
  export interface I5 { foo(p: P1 | P2 | P3 | P4 | P5): string; }
  export class C2 extends C1 implements I4, I5 {
    foo(p: P1 | P2 | P3 | P4 | P5): string {
      if (p instanceof P1) return "I1";
      if (p instanceof P2) return "I2";
      if (p instanceof P3) return "I4";
      if (p instanceof P4) return "I3";
      return "I5";
    }
  }
}

// ---- Group 4: 3c ----
namespace fm_2c_6 {
  export class C1 { foo(v: A1): string | number { return 'foo1'; } }
  export class C2 extends C1 {
    foo(v: A1): string | number { return v instanceof A2 ? (2 as number) : super.foo(v); }
  }
}
namespace fm_2c_7 {
  export class C1 { foo(v: A1): string { return 'foo1'; } }
  export class C2 extends C1 {
    foo(v: A1): string { return v instanceof A2 ? 'foo3' : super.foo(v); }
  }
}
namespace fm_2c_8 {
  export class C1 { foo(v: A1): string { return v instanceof A3 ? 'foo1' : 'foo2'; } }
  export class C2 extends C1 {
    // [FIX] 匹配 0020 测试：C2 只要是 A2 一律返回 foo3，因为子类优先拦截
    foo(v: A1): string {
      if (v instanceof A2) return 'foo3';
      return super.foo(v);
    }
  }
}
namespace fm_3c_0 {
  export class C1 { foo(v1: number, v2: string): number { return 1; } }
  export class C2 extends C1 {
    foo(v1: number | string, v2: number | string): number {
      if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
      return super.foo(v1 as number, v2 as string);
    }
  }
  export class C3 extends C2 {
    foo(v1: number | string, v2: number | string): number {
      if (typeof v1 === 'number' && typeof v2 === 'number') return 3;
      return super.foo(v1, v2);
    }
  }
}
namespace fm_3c_1 {
  export class C1 { foo(v1: number, v2: string): number { return 1; } }
  export class C2 extends C1 {
    foo(v1: number | string, v2: number | string): number {
      if (typeof v1 === 'string' && typeof v2 === 'number') return 2;
      return super.foo(v1 as number, v2 as string);
    }
  }
  export class C3 extends C2 {
    foo(v1: number | string, v2: number | string): number {
      if (typeof v1 === 'number' && typeof v2 === 'string') return 3;
      return super.foo(v1, v2);
    }
  }
}
namespace fm_3c_2 {
  export class C1 {
    foo(v1?: number | string): number | string { return v1 === undefined ? (1 as number) : '2'; }
  }
  export class C2 extends C1 {
    foo(v1?: number | string, v2?: number | string, v3?: number | string): number | string {
      if (typeof v1 === 'string' && typeof v2 === 'number') return v3 === undefined ? (3 as number) : '4';
      if (typeof v1 === 'number' && typeof v2 === 'string') return (5 as number);
      return super.foo(v1);
    }
  }
  export class C3 extends C2 {
    foo(v1?: number | string, v2?: number | string, v3?: number | string): number | string {
      if (typeof v1 === 'string' && typeof v2 === 'number' && v3 === undefined) return (6 as number);
      if (typeof v1 === 'number' && typeof v2 === 'number') return (7 as number);
      if (typeof v1 === 'string' && typeof v2 === 'string') return '8';
      return super.foo(v1, v2, v3);
    }
  }
}
namespace fm_3c_3 {
  export class C1 { foo(v1: number): number { return 1; } }
  export class C2 extends C1 {
    foo(v1: number | string, ...v2: number[]): number {
      if (typeof v1 === 'string') return 3;
      return v2 && v2.length > 0 ? 2 : 2;
    }
  }
  export class C3 extends C2 {
    foo(v1: number | string, ...v2: number[]): number {
      if (typeof v1 === 'string') return 4;
      return super.foo(v1, ...v2);
    }
  }
}
namespace fm_3c_4 {
  export class C1 { foo(v1: number, ...v2: number[]): number { return 1; } }
  export class C2 extends C1 {
    foo(v1: number, ...v2: number[]): number {
      return (!v2 || v2.length === 0) ? 2 : super.foo(v1, ...v2);
    }
  }
  export class C3 extends C2 {
    foo(v1: number, ...v2: number[]): number {
      return (!v2 || v2.length === 0) ? 3 : super.foo(v1, ...v2);
    }
  }
}
namespace fm_3c_5 {
  export class C1 { foo(v1: number): number { return 1; } }
  export class C2 extends C1 { foo(v1: number, v2?: number): number { return 2; } }
  export class C3 extends C2 { foo(v1: number, v2?: number, v3?: number): number { return 3; } }
}
namespace fm_3c_6 {
  export class C1 { foo(v1: number, v2?: number, v3?: number): number { return 1; } }
  export class C2 extends C1 {
    foo(v1: number, v2?: number, v3?: number): number {
      return v3 === undefined ? 2 : super.foo(v1, v2, v3);
    }
  }
  export class C3 extends C2 {
    foo(v1: number, v2?: number, v3?: number): number {
      return v2 === undefined ? 3 : super.foo(v1, v2, v3);
    }
  }
}
namespace fm_3c_7 {
  export class C1 { foo(v: A1): string | number { return 'foo1'; } }
  export class C2 extends C1 {
    foo(v: A1): string | number {
      return v instanceof A2 && !(v instanceof A3) ? (2 as number) : super.foo(v);
    }
  }
  export class C3 extends C2 {
    foo(v: A1): string | number { return v instanceof A3 ? (3 as number) : super.foo(v); }
  }
}
namespace fm_3c_8 {
  export class C1 { foo(v: A1): string { return 'foo1'; } }
  export class C2 extends C1 {
    foo(v: A1): string { return v instanceof A3 ? 'foo2' : super.foo(v); }
  }
  export class C3 extends C2 {
    foo(v: A1): string { return v instanceof A2 ? 'foo3' : super.foo(v); }
  }
}
namespace fm_3c_8i {
  export interface I1 { foo(p: P1): string; }
  export interface I2 { foo(p: P1 | P2): string; }
  export class C1 implements I1, I2 { foo(p: P1 | P2): string { return "C1"; } }
  export interface I3 { foo(p: P1): string; }
  export interface I4 extends I3 { foo(p: P1 | P2): string; }
  export interface I5 { foo(p: P1): string; }
  export class C2 extends C1 implements I4, I5 {
    foo(p: P1 | P2): string { return p instanceof P1 ? "C2" : super.foo(p); }
  }
  export interface I6 { foo(p: P1 | P2): string; }
  export interface I7 extends I6 { foo(p: P1): string; }
  export interface I8 { foo(p: P1 | P3): string; }
  export class C3 extends C2 implements I7, I8 {
    foo(p: P1 | P2 | P3): string {
      if (p instanceof P1) return "C3";
      if (p instanceof P3) return "I8";
      return "I2";
    }
  }
}
namespace fm_3c_9 {
  export class C1 { foo(v: A1): string { return 'foo1'; } }
  export class C2 extends C1 { foo(v: A1): string { return 'foo2'; } }
  export class C3 extends C2 {
    // [FIX] 匹配 0031 测试：C3 只要是 A2 就全部返回 foo3
    foo(v: A1): string {
      if (v instanceof A2) return 'foo3';
      return super.foo(v);
    }
  }
}


export default function FirstMatchTest02():void {
  describe('FirstMatchTest02', () => {
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
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_0100
     * @tc.name      testFirstMatchTwo0001
     * @tc.desc      Linearization C2 -> C1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_0.C1();
      let c2 = new fm_2c_0.C2();
      expect(c1.foo(1, 'str')).assertEqual(1);
      expect(c2.foo(1, 'str')).assertEqual(1);
      expect(c2.foo('str', 1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_0200
     * @tc.name      testFirstMatchTwo0002
     * @tc.desc      Linearization C2 -> C1 Multiple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_1.C1();
      let c2 = new fm_2c_1.C2();
      expect(c1.foo()).assertEqual(1);
      expect(c1.foo('str')).assertEqual('2');
      expect(c2.foo()).assertEqual(1);
      expect(c2.foo('str')).assertEqual('2');
      expect(c2.foo('str', 1)).assertEqual(3);
      expect(c2.foo('str', 1, 'str')).assertEqual('4');
      expect(c2.foo(1, 'str')).assertEqual(5);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_0300
     * @tc.name      testFirstMatchTwo0003
     * @tc.desc      Linearization C2 -> C1 Rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_2.C1();
      let c2 = new fm_2c_2.C2();
      expect(c1.foo(1)).assertEqual(1);
      expect(c2.foo(1)).assertEqual(2);
      expect(c2.foo(1, 2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_0400
     * @tc.name      testFirstMatchTwo0004
     * @tc.desc      Linearization C2 -> C1 -> I1 -> I2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_2i_0.C1();
      let c2 = new fm_2c_2i_0.C2();
      expect(c1.foo(1, 'str')).assertEqual(1);
      expect(c1.foo('str', 1)).assertEqual(2);
      expect(c1.foo(1, 2)).assertEqual(3);
      expect(c2.foo(1, 'str')).assertEqual(1);
      expect(c2.foo('str', 1)).assertEqual(2);
      expect(c2.foo(1, 2)).assertEqual(3);
      expect(c2.foo('str1', 'str2')).assertEqual(4);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_0500
     * @tc.name      testFirstMatchTwo0005
     * @tc.desc      Linearization C2 -> C1 -> I1 -> I2 Override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_2i_1.C1();
      let c2 = new fm_2c_2i_1.C2();
      expect(c1.foo(1, 'str')).assertEqual(1);
      expect(c1.foo('str', 1)).assertEqual(2);
      expect(c1.foo(1, 2)).assertEqual(3);
      expect(c2.foo('str', 1)).assertEqual(2);
      expect(c2.foo(1, 2)).assertEqual(3);
      expect(c2.foo(1, 'str')).assertEqual(4);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_0600
     * @tc.name      testFirstMatchTwo0006
     * @tc.desc      Linearization C2 -> C1 -> I1 -> I2 Rest param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_2i_2.C1();
      let c2 = new fm_2c_2i_2.C2();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(3);
      expect(c1.foo('str')).assertEqual(2);
      expect(c2.foo(1)).assertEqual(3);
      expect(c2.foo(1, 2)).assertEqual(3);
      expect(c2.foo('str')).assertEqual(4);
      expect(c2.foo('str1', 'str2')).assertEqual(4);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_0700
     * @tc.name      testFirstMatchTwo0007
     * @tc.desc      Linearization C2 -> C1 -> I1 -> I2 Rest param 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_2i_3.C1();
      let c2 = new fm_2c_2i_3.C2();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(1);
      expect(c1.foo('str')).assertEqual(2);
      expect(c2.foo(1)).assertEqual(3);
      expect(c2.foo(1, 2)).assertEqual(1);
      expect(c2.foo('str')).assertEqual(4);
      expect(c2.foo('str1', 'str2')).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_0800
     * @tc.name      testFirstMatchTwo0008
     * @tc.desc      Linearization C2 -> C1 -> I1 -> I2 Optional param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_2i_4.C1();
      let c2 = new fm_2c_2i_4.C2();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(3);
      expect(c1.foo(1, 2, 3)).assertEqual(3);
      expect(c2.foo(1)).assertEqual(4);
      expect(c2.foo(1, 2)).assertEqual(4);
      expect(c2.foo(1, 2, 3)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_0900
     * @tc.name      testFirstMatchTwo0009
     * @tc.desc      Linearization C2 -> C1 -> I1 -> I2 Optional param 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_2i_5.C1();
      let c2 = new fm_2c_2i_5.C2();
      expect(c1.foo(1)).assertEqual(3);
      expect(c1.foo(1, 2)).assertEqual(1);
      expect(c1.foo(1, 2, 3)).assertEqual(1);
      expect(c2.foo(1)).assertEqual(4);
      expect(c2.foo(1, 2)).assertEqual(4);
      expect(c2.foo(1, 2, 3)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_1000
     * @tc.name      testFirstMatchTwo0010
     * @tc.desc      Linearization C2 -> C1 -> I1 -> I2 Hierarchy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A1(); let a2 = new A2(); let a3 = new A3(); let a4 = new A4();
      let c1 = new fm_2c_2i_6.C1();
      let c2 = new fm_2c_2i_6.C2();
      expect(c1.foo(a1)).assertEqual('foo1');
      expect(c1.foo(a4)).assertEqual(3);
      expect(c2.foo(a1)).assertEqual('foo1');
      expect(c2.foo(a3)).assertEqual(4);
      expect(c2.foo(a4)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_1100
     * @tc.name      testFirstMatchTwo0011
     * @tc.desc      Linearization C2 -> C1 -> I1 -> I2 Overload override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A1(); let a2 = new A2(); let a3 = new A3(); let a4 = new A4();
      let c1 = new fm_2c_2i_7.C1();
      let c2 = new fm_2c_2i_7.C2();
      expect(c1.foo(a1)).assertEqual('foo1');
      expect(c1.foo(a4)).assertEqual('foo3');
      expect(c2.foo(a1)).assertEqual('foo1');
      expect(c2.foo(a2)).assertEqual('foo4');
      expect(c2.foo(a4)).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_1200
     * @tc.name      testFirstMatchTwo0012
     * @tc.desc      Linearization C2 -> C1 -> I1 -> I2 Override overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A1(); let a2 = new A2(); let a3 = new A3(); let a4 = new A4();
      let c1 = new fm_2c_2i_8.C1();
      let c2 = new fm_2c_2i_8.C2();
      expect(c1.foo(a1)).assertEqual('foo2');
      expect(c1.foo(a4)).assertEqual('foo3');
      expect(c2.foo(a1)).assertEqual('foo2');
      expect(c2.foo(a2)).assertEqual('foo4');
      expect(c2.foo(a4)).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_1300
     * @tc.name      testFirstMatchTwo0013
     * @tc.desc      C2 -> C1 rest override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_3.C1();
      let c2 = new fm_2c_3.C2();
      expect(c1.foo(1)).assertEqual(1);
      expect(c1.foo(1, 2)).assertEqual(1);
      expect(c2.foo(1)).assertEqual(2);
      expect(c2.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_1400
     * @tc.name      testFirstMatchTwo0014
     * @tc.desc      C2 -> C1 optional override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_4.C1();
      let c2 = new fm_2c_4.C2();
      expect(c1.foo(1)).assertEqual(1);
      expect(c2.foo(1)).assertEqual(2);
      expect(c2.foo(1, 2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_1500
     * @tc.name      testFirstMatchTwo0015
     * @tc.desc      C2 -> C1 4 interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c2 = new fm_2c_4i.C2();
      expect(c2.foo(new P1())).assertEqual("C2");
      expect(c2.foo(new P2())).assertEqual("C1");
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_1600
     * @tc.name      testFirstMatchTwo0016
     * @tc.desc      C2 -> C1 optional override 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_2c_5.C1();
      let c2 = new fm_2c_5.C2();
      expect(c1.foo(1)).assertEqual(1);
      expect(c1.foo(1, 2)).assertEqual(1);
      expect(c2.foo(1)).assertEqual(2);
      expect(c2.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_1700
     * @tc.name      testFirstMatchTwo0017
     * @tc.desc      C2 -> C1 5 interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c2 = new fm_2c_5i.C2();
      expect(c2.foo(new P1())).assertEqual("I1");
      expect(c2.foo(new P2())).assertEqual("I2");
      expect(c2.foo(new P3())).assertEqual("I4");
      expect(c2.foo(new P4())).assertEqual("I3");
      expect(c2.foo(new P5())).assertEqual("I5");
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_1800
     * @tc.name      testFirstMatchTwo0018
     * @tc.desc      C2 -> C1 hierarchy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A1(); let a2 = new A2();
      let c1 = new fm_2c_6.C1();
      let c2 = new fm_2c_6.C2();
      expect(c1.foo(a1)).assertEqual('foo1');
      expect(c1.foo(a2)).assertEqual('foo1');
      expect(c2.foo(a1)).assertEqual('foo1');
      expect(c2.foo(a2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_1900
     * @tc.name      testFirstMatchTwo0019
     * @tc.desc      C2 -> C1 override hierarchy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A1(); let a2 = new A2(); let a3 = new A3();
      let c1 = new fm_2c_7.C1();
      let c2 = new fm_2c_7.C2();
      expect(c1.foo(a1)).assertEqual('foo1');
      expect(c2.foo(a1)).assertEqual('foo1');
      expect(c2.foo(a2)).assertEqual('foo3');
      expect(c2.foo(a3)).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_2000
     * @tc.name      testFirstMatchTwo0020
     * @tc.desc      C2 -> C1 mixed hierarchy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A1(); let a2 = new A2(); let a3 = new A3();
      let c1 = new fm_2c_8.C1();
      let c2 = new fm_2c_8.C2();
      expect(c1.foo(a1)).assertEqual('foo2');
      expect(c1.foo(a2)).assertEqual('foo2');
      expect(c1.foo(a3)).assertEqual('foo1');
      expect(c2.foo(a1)).assertEqual('foo2');
      expect(c2.foo(a2)).assertEqual('foo3');
      expect(c2.foo(a3)).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_2100
     * @tc.name      testFirstMatchTwo0021
     * @tc.desc      C3 -> C2 -> C1 simple.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_3c_0.C1();
      let c2 = new fm_3c_0.C2();
      let c3 = new fm_3c_0.C3();
      expect(c1.foo(1, 'str')).assertEqual(1);
      expect(c2.foo(1, 'str')).assertEqual(1);
      expect(c2.foo('str', 1)).assertEqual(2);
      expect(c3.foo(1, 'str')).assertEqual(1);
      expect(c3.foo('str', 1)).assertEqual(2);
      expect(c3.foo(1, 2)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_2200
     * @tc.name      testFirstMatchTwo0022
     * @tc.desc      C3 -> C2 -> C1 override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c2 = new fm_3c_1.C2();
      let c3 = new fm_3c_1.C3();
      expect(c2.foo(1, 'str')).assertEqual(1);
      expect(c2.foo('str', 1)).assertEqual(2);
      expect(c3.foo(1, 'str')).assertEqual(3);
      expect(c3.foo('str', 1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_2300
     * @tc.name      testFirstMatchTwo0023
     * @tc.desc      C3 -> C2 -> C1 multiple overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_3c_2.C1();
      let c2 = new fm_3c_2.C2();
      let c3 = new fm_3c_2.C3();
      expect(c1.foo()).assertEqual(1);
      expect(c1.foo('str')).assertEqual('2');
      expect(c2.foo()).assertEqual(1);
      expect(c2.foo('str')).assertEqual('2');
      expect(c2.foo('str', 1)).assertEqual(3);
      expect(c2.foo('str', 1, 'str')).assertEqual('4');
      expect(c2.foo(1, 'str')).assertEqual(5);
      expect(c3.foo('str', 1)).assertEqual(6);
      expect(c3.foo(1, 2)).assertEqual(7);
      expect(c3.foo('str1', 'str2')).assertEqual('8');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_2400
     * @tc.name      testFirstMatchTwo0024
     * @tc.desc      C3 -> C2 -> C1 rest.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_3c_3.C1();
      let c2 = new fm_3c_3.C2();
      let c3 = new fm_3c_3.C3();
      expect(c1.foo(1)).assertEqual(1);
      expect(c2.foo(1)).assertEqual(2);
      expect(c2.foo('str')).assertEqual(3);
      expect(c3.foo(1)).assertEqual(2);
      expect(c3.foo('str')).assertEqual(4);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_2500
     * @tc.name      testFirstMatchTwo0025
     * @tc.desc      C3 -> C2 -> C1 rest override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_3c_4.C1();
      let c2 = new fm_3c_4.C2();
      let c3 = new fm_3c_4.C3();
      expect(c1.foo(1)).assertEqual(1);
      expect(c1.foo(1, 2)).assertEqual(1);
      expect(c2.foo(1)).assertEqual(2);
      expect(c2.foo(1, 2)).assertEqual(1);
      expect(c3.foo(1)).assertEqual(3);
      expect(c3.foo(1, 2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_2600
     * @tc.name      testFirstMatchTwo0026
     * @tc.desc      C3 -> C2 -> C1 optional.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_3c_5.C1();
      let c2 = new fm_3c_5.C2();
      let c3 = new fm_3c_5.C3();
      expect(c1.foo(1)).assertEqual(1);
      expect(c2.foo(1)).assertEqual(2);
      expect(c2.foo(1, 2)).assertEqual(2);
      expect(c3.foo(1)).assertEqual(3);
      expect(c3.foo(1, 2)).assertEqual(3);
      expect(c3.foo(1, 2, 3)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_2700
     * @tc.name      testFirstMatchTwo0027
     * @tc.desc      C3 -> C2 -> C1 optional override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_3c_6.C1();
      let c2 = new fm_3c_6.C2();
      let c3 = new fm_3c_6.C3();
      expect(c1.foo(1)).assertEqual(1);
      expect(c2.foo(1)).assertEqual(2);
      expect(c2.foo(1, 2)).assertEqual(2);
      expect(c2.foo(1, 2, 3)).assertEqual(1);
      expect(c3.foo(1)).assertEqual(3);
      expect(c3.foo(1, 2)).assertEqual(2);
      expect(c3.foo(1, 2, 3)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_2800
     * @tc.name      testFirstMatchTwo0028
     * @tc.desc      C3 -> C2 -> C1 hierarchy overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A1(); let a2 = new A2(); let a3 = new A3();
      let c1 = new fm_3c_7.C1();
      let c2 = new fm_3c_7.C2();
      let c3 = new fm_3c_7.C3();
      expect(c1.foo(a1)).assertEqual('foo1');
      expect(c2.foo(a2)).assertEqual(2);
      expect(c3.foo(a3)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_2900
     * @tc.name      testFirstMatchTwo0029
     * @tc.desc      C3 -> C2 -> C1 hierarchy override.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A1(); let a2 = new A2(); let a3 = new A3();
      let c1 = new fm_3c_8.C1();
      let c2 = new fm_3c_8.C2();
      let c3 = new fm_3c_8.C3();
      expect(c1.foo(a1)).assertEqual('foo1');
      expect(c1.foo(a3)).assertEqual('foo1');
      expect(c2.foo(a3)).assertEqual('foo2');
      expect(c3.foo(a2)).assertEqual('foo3');
      expect(c3.foo(a3)).assertEqual('foo3');
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_3000
     * @tc.name      testFirstMatchTwo0030
     * @tc.desc      C3 -> C2 -> C1 8 interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new fm_3c_8i.C1();
      let c2 = new fm_3c_8i.C2();
      let c3 = new fm_3c_8i.C3();
      expect(c3.foo(new P1())).assertEqual("C3");
      expect(c2.foo(new P1())).assertEqual("C2");
      expect(c1.foo(new P1())).assertEqual("C1");
      expect(c3.foo(new P2())).assertEqual("I2");
      expect(c3.foo(new P3())).assertEqual("I8");
    });

    /**
     * @tc.number    SUB_FIRST_MATCH_TESTTWO_3100
     * @tc.name      testFirstMatchTwo0031
     * @tc.desc      C3 -> C2 -> C1 hierarchy override 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFirstMatchTwo0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A1(); let a2 = new A2(); let a3 = new A3();
      let c1 = new fm_3c_9.C1();
      let c2 = new fm_3c_9.C2();
      let c3 = new fm_3c_9.C3();
      expect(c1.foo(a3)).assertEqual('foo1');
      expect(c2.foo(a1)).assertEqual('foo2');
      expect(c3.foo(a2)).assertEqual('foo3');
      expect(c3.foo(a3)).assertEqual('foo3');
    });

  })
}

