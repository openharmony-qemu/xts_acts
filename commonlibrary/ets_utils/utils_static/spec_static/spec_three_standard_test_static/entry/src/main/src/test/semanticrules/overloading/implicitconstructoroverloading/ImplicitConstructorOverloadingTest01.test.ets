'use static';
/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';

// ============================================================================
// Data Setup for co1_over_0 and co1_over_1
// ============================================================================
namespace co1_over_0 {
  export class A {
    t: string = "";
    constructor(p: boolean) { this.t = "boolean" }
    constructor(p: number) { this.t = "number" }
    constructor(p: string) { this.t = "string" }
  }

  export function main(): void {
    expect(new A(false).t).assertEqual("boolean");
    expect(new A(3.14).t).assertEqual("number");
    expect(new A(-1).t).assertEqual("number");
    expect(new A("char").t).assertEqual("string");
  }
}

namespace co1_over_1 {
  export class B {
    t: string = "";
    constructor(p: boolean) { this.t = "boolean" }
    constructor(p: number) { this.t = "number" }
    constructor(p: Object) { this.t = "Object" }
  }
  export class A extends B {
    constructor(p: boolean) { super(p) }
    constructor(p: number) { super(p) }
    constructor(p: Object) { super(p) }
  }

  export function main(): void {
    expect(new A(-1).t).assertEqual("number");
    expect(new A(3.14).t).assertEqual("number");
    expect(new A(false).t).assertEqual("boolean");
    expect(new A(new Object()).t).assertEqual("Object");
  }
}

// ============================================================================
// Data Setup for co1_over_2
// ============================================================================
namespace co1_over_2 {
  export enum Color { Red, Green = 82, Blue }
  export enum Size { S = "small", M = "medium", L = "large" }

  export class A {
    t: string = "";
    constructor(p: Color) { this.t = "Color" }
    constructor(p: number) { this.t = "number" }
    constructor(p: Size) { this.t = "Size" }
    constructor(p: string) { this.t = "string" }
    constructor(p: Object) { this.t = "Object" }
  }

  export function main(): void {
    expect(new A(-1).t).assertEqual("number");
    expect(new A(Color.Red).t).assertEqual("Color");
    expect(new A("small").t).assertEqual("string");
    expect(new A(Size.S).t).assertEqual("Size");
    expect(new A(new Object()).t).assertEqual("Object");
  }
}

// ============================================================================
// Data Setup for co1_over_3 (Arrays)
// ============================================================================
namespace co1_over_3 {
  export enum Color { Red, Green = 82, Blue }
  export enum Size { S="small", M="medium", L="large" }

  export class A {
    t: string = "";
    constructor() {}
    constructor(p: Array<number>) { this.t = "number_array" }
    constructor(p: Color) { this.t = "Color" }
    constructor(p: Size) { this.t = "Size" }
  }

  export function main(): void {
    expect(new A([3.14]).t).assertEqual("number_array");
    expect(new A(Color.Red).t).assertEqual("Color");
    expect(new A(Size.M).t).assertEqual("Size");
  }
}

// ============================================================================
// Data Setup for co1_over_4 (Tuples vs Arrays)
// ============================================================================
namespace co1_over_4 {
  export type T = [number, number]
  export type R = number[]

  export class B {
    t: string = "";
    constructor() {}
    protected constructor(p: R) { this.t = "R" }
  }
  export class A extends B {
    constructor() { super() }
    constructor(p: R) { super(p) }
  }
  export let t: T = [0.0, 0.0]
  export let r: R = [0.0, 0.0]

  export function main(): void {
    expect(new A().t).assertEqual("");

    expect(new A(r).t).assertEqual("R");

    expect(new A([t[0], t[1]]).t).assertEqual("R");

    let v: R = [0.0];
    expect(new A(v).t).assertEqual("R");

    v = [0.0, 0.0, 0.0];
    expect(new A(v).t).assertEqual("R");
  }
}

// ============================================================================
// Data Setup for co1_over_5 (Unions)
// ============================================================================
namespace co1_over_5 {
  export class A {
    t: string = "";
    getType(): string { return this.t; }
    constructor() {}
    constructor(p: string) { this.t = "string" }
    constructor(p: number) { this.t = "number" }
    constructor(p: boolean) { this.t = "boolean" }
  }

  export let usn: string | number = "abc"
  export let usb: string | boolean = true

  export function main(): void {
    expect(new A(false).t).assertEqual("boolean");
    expect(new A("").t).assertEqual("string");
    expect(new A(1.0).t).assertEqual("number");
    usn = "abc";
    expect(new A(usn).t).assertEqual("string");
    usn = 42.0;
    expect(new A(usn).t).assertEqual("number");
    usb = true;
    expect(new A(usb).t).assertEqual("boolean");
    usb = "xyz";
    expect(new A(usb).t).assertEqual("string");
  }
}

// ============================================================================
// Data Setup for co1_over_6 (Function types)
// ============================================================================
namespace co1_over_6 {
  export type F1 = (p: number) => string;
  export type F2 = (p: number, q: number) => string;

  export class A {
    t: string = "";
    constructor() {}
    constructor(p: () => void) { this.t = "void-void" }
    constructor(p: F1) { this.t = "F1" }
    constructor(p: F2) { this.t = "F2" }
  }

  export function fff2(v: number, w: number): string { return "" + v + w; }
  export function fff1(v: number): string { return "" + v; }
  export function foo(): void { expect(false).assertTrue(); }
  export let f1: F1 = fff1;

  export function main(): void {
    expect(new A(foo).t).assertEqual("void-void");
    expect(new A(fff1).t).assertEqual("F1");
    expect(new A(f1).t).assertEqual("F1");
    expect(new A(fff2).t).assertEqual("F2");
  }
}

// ============================================================================
// Data Setup for co1_over_7 (Nullish types)
// ============================================================================
namespace co1_over_7 {
  export class A {
    t: string = "";
    constructor() {}
    constructor(p: string) { this.t = "string" }
    constructor(p: Object | null | undefined) { this.t = "Object" }
  }

  export let s: string = ""
  export let sn: string | null = ""
  export let su: string | undefined = ""
  export let snu: string | null | undefined = ""

  export function main(): void {
    s = "";
    expect(new A(s).t).assertEqual("string");
    sn = "";
    expect(new A(sn).t).assertEqual("string");

    sn = null;
    expect(new A(sn).t).assertEqual("Object");

    su = "";
    expect(new A(su).t).assertEqual("string");

    su = undefined;
    expect(new A(su).t).assertEqual("Object");
  }
}

// ============================================================================
// Data Setup for co3_over_0 (Multiple parameters)
// ============================================================================
namespace co3_over_0 {
  export class A {
    i: number = 0;
    d: number = 0.0;
    s: string = "";
    constructor() {}
    constructor(i: number) { this.i = i; }
    constructor(i: number, j: number) { this.i = i + j; }
    constructor(i: number, j: number, k: number) { this.i = 3; }
    constructor(i: string, j: number) { this.s = i + j; }
  }

  export function main(): void {
    let a = new A();
    expect(a.i).assertEqual(0);
    expect(a.s).assertEqual("");

    a = new A(12345);
    expect(a.i).assertEqual(12345);

    a = new A(11, 22);
    expect(a.i).assertEqual(33);

    a = new A(1, 2, 3);
    expect(a.i).assertEqual(3);

    a = new A("", 0.00014);
    expect(a.s).assertEqual("0.00014");
  }
}

// ============================================================================
// Data Setup for co3_over_1 (Optional parameters)
// ============================================================================
namespace co3_over_1 {
  export class A {
    fld: number;
    constructor(a: Object) { this.fld = 1; }
    constructor(p: number, a: Object) { this.fld = 2; }
    constructor(p: number, a: number, b: Object) { this.fld = 3; }
    constructor(p: number, a: number, b: number, c: Object) { this.fld = 4; }
  }

  export function main(): void {
    let err = new Error();
    let a: A = new A(err);
    expect(a.fld).assertEqual(1);

    a = new A(1, a);
    expect(a.fld).assertEqual(2);

    a = new A(1, 1, a);
    expect(a.fld).assertEqual(3);

    a = new A(1, 1, 1, a);
    expect(a.fld).assertEqual(4);
  }
}

// ============================================================================
// Data Setup for co3_over_2 (Value types variations)
// ============================================================================
namespace co3_over_2 {
  export class A {
    fld: number;
    constructor(a: boolean) { this.fld = 1.0; }
    constructor(a: boolean, b: number) { this.fld = 5.0; }
  }

  export function main(): void {
    let a = new A(true);
    expect(a.fld).assertEqual(1.0);

    a = new A(true, 1.0);
    expect(a.fld).assertEqual(5.0);

    a = new A(false, 10.0);
    expect(a.fld).assertEqual(5.0);
  }
}

// ============================================================================
// Data Setup for co3_over_3 (Rest parameters)
// ============================================================================
namespace co3_over_3 {
  export class A {
    fld: number;
    constructor(a: Error, b: Array<number>) { this.fld = 1; }
    constructor(a: Error, b: number, ...c: number[]) { this.fld = 2; }
    constructor(a: Error, b: Error, ...c: number[]) { this.fld = 3; }
    constructor(a: Error, b: Object, c: Object, d: Object) { this.fld = 4; }
  }

  export function main(): void {
    expect(new A(new Error(), [1]).fld).assertEqual(1);
    expect(new A(new Error(), 1, 2, 3, 4).fld).assertEqual(2);
    expect(new A(new Error(), new Error()).fld).assertEqual(3);
    expect(new A(new Error(), new Object(), new Object(), new Object()).fld).assertEqual(4);
  }
}

// ============================================================================
// Data Setup for co3_over_4 (Type variables)
// ============================================================================
namespace co3_over_4 {
  export class X {}
  export class Y {}
  export class A<T, U> {
    fld: number;
    constructor(a: T) { this.fld = 1; }
    constructor(a: T, b: U) { this.fld = 2; }
    constructor(a: U, b: T, c: U) { this.fld = 3; }
  }

  export function main(): void {
    let a: A<X, Y> = new A<X, Y>(new X());
    expect(a.fld).assertEqual(1);

    a = new A<X, Y>(new X(), new Y());
    expect(a.fld).assertEqual(2);

    a = new A<X, Y>(new Y(), new X(), new Y());
    expect(a.fld).assertEqual(3);
  }
}

// ============================================================================
// Data Setup for co3_over_5 (Dependent Types)
// ============================================================================
namespace co3_over_5 {
  export class X {}
  export class Y extends X {}
  export class Z extends Y {}
  export class A {
    fld: number;
    constructor(a: X, b: Y, c: Z) { this.fld = 1; }
    constructor(a: X, b: Y) { this.fld = 2; }
    constructor(a: X) { this.fld = 3; }
  }

  export function main(): void {
    let x: X = new X();
    let y: Y = new Y();
    let z: Z = new Z();

    let a = new A(x);
    expect(a.fld).assertEqual(3);

    a = new A(y);
    expect(a.fld).assertEqual(3);

    a = new A(x, y);
    expect(a.fld).assertEqual(2);

    a = new A(x, y, z);
    expect(a.fld).assertEqual(1);

    a = new A(z, z, z);
    expect(a.fld).assertEqual(1);
  }
}

export default function ImplicitConstructorOverloadingTest01():void {
  describe('ImplicitConstructorOverloadingTest01', () => {
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
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_0100
     * @tc.name      testCo1Over0001
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Primitives).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo1Over0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co1_over_0.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_0200
     * @tc.name      testCo1Over0002
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Subclass).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo1Over0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co1_over_1.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_0300
     * @tc.name      testCo1Over0003
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Enums).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo1Over0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co1_over_2.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_0400
     * @tc.name      testCo1Over0004
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Arrays).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo1Over0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co1_over_3.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_0500
     * @tc.name      testCo1Over0005
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Tuples).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo1Over0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co1_over_4.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_0600
     * @tc.name      testCo1Over0006
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Unions).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo1Over0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co1_over_5.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_0700
     * @tc.name      testCo1Over0007
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Function types).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo1Over0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co1_over_6.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_0800
     * @tc.name      testCo1Over0008
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Nullish).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo1Over0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co1_over_7.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_0900
     * @tc.name      testCo3Over0001
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Multiple params).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo3Over0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co3_over_0.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_1000
     * @tc.name      testCo3Over0002
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Optional params).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo3Over0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co3_over_1.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_1100
     * @tc.name      testCo3Over0003
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Value types).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo3Over0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co3_over_2.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_1200
     * @tc.name      testCo3Over0004
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Rest params).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo3Over0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co3_over_3.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_1300
     * @tc.name      testCo3Over0005
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Generics).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo3Over0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co3_over_4.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTONE_1400
     * @tc.name      testCo3Over0006
     * @tc.desc      Two or more unnamed constructors within a class are implicitly overloaded (Dependent types).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCo3Over0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      co3_over_5.main();
    });

  })
}