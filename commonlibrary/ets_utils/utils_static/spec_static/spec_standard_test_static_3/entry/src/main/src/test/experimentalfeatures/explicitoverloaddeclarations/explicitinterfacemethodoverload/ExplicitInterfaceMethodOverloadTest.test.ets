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

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// method overloaded with multiple parameters with different types
interface J {
  m1(): int { return 0 }
m2(i: int): int { return 1 }
m3(i: int, j: int): int { return i + j }
m4(i: int, j: int, k: int): int { return 3 }
m5(i: int, j: double): double { return j + i }
m6(i: int, j: int, k: double): int { return 21 }
m7(i: double, j: double, k: int): int { return 31 }
m8(i: string, j: double): string { return i + j }
overload m { m1, m2, m3, m4, m5, m6, m7, m8}
}
class A implements J {}

// method overloaded with optional parameters
interface J1 {
  m1(a: Object): int { return 1 }
m2(p: int, a: Object): int { return 2 }
m3(p: int, a: Object, b?: Object): int { return 3 }
m4(p: int, a?: Object, b?: Object, c: Object = new Error()): int { return 4 }
overload m { m2, m3, m4, m1 }
}
class A1 implements J1 {}

// method overloaded with boxing/unboxing parameters
interface J2 {
  m1(a: boolean): number { return 1.0 }
m2(a: boolean, b: number): number { return 3.0 }
overload m { m1, m2 }
}
class A2 implements J2 {}

// method overloaded with type variables
class X {}
class Y {}
interface J4<T, U> {
  m1(a: T): int { return 1 }
m2(a: T, b: U): int { return 2 }
m3(a: U, b: T, c: U): int { return 3 }
overload m { m1, m2, m3 }
}
class A4<T, U> implements J4<T, U> {}

// method overloaded with multiple parameters with dependent types
class X1 {}
class Y1 extends X1 {}
class Z extends Y1 {}
interface J5 {
  m1(a: X1, b: Y1, c: Z): int { return 1 }
m2(a: X1, b: Y1): int { return 2 }
m3(a: X1): int { return 3 }
overload m { m1, m2, m3 }
}
class A5 implements J5 {}

class C1 {}
class C2 extends C1 {}
class C3 extends C2 {}

interface J6 {
  foo1(p: C1): string;
  foo2(p: C2): string;
  foo3(p: C3): string;
  overload foo { foo3, foo1, foo2 } // foo3(C3), foo1(C1), foo2(C2)
}

interface K extends J6 {
  foo3(p: C3): string;
  // inherited overload foo { foo3, foo1, foo2 } // foo3(C3), foo1(C1), foo2(C2)
}
class A6 implements K {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo1, foo2 } // foo3(C3), foo1(C1), foo2(C2)
}

interface J71 {
  foo1(p: C1): string;
  foo2(p: C2): string;
  foo3(p: C3): string;
  overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}

interface K1 {}
interface M extends J71, K1 {
  foo1(p: C2): string;
  foo2(p: C3): string;
  // inherited overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}
class A7 implements M {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}



interface K2 extends J71 {
  // inherited overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}
interface M1 extends J71 {
  // inherited overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}
interface L extends K2, M1 {
  // inherited overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}
class A8 implements L {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}

interface J7 {
  foo1(p: C1) { return 'J.1' }
foo2(p: C2) { return 'J.2' }
foo3(p: C3) { return 'J.3' }
overload foo { foo3, foo1, foo2 } // foo3(C3), foo1(C1), foo2(C2)
}
interface K3 extends J7 {
  foo3(p: C3) { return 'K.3' }
// inherited overload foo { foo3, foo1, foo2 } // foo3(C3), foo1(C1), foo2(C2)
}
class A9 implements K3 {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo1, foo2 } // foo3(C3), foo1(C1), foo2(C2)
}

interface J12 {
  foo1(p: C1): string;
  foo2(p: C2): string;
  foo(p: C3): string;
  overload foo { foo, foo2, foo1 } // foo(C3), foo2(C2), foo1(C1)
}
interface K9 {}
interface M4 extends J12, K9 {
  // inherited overload foo { foo, foo2, foo1 } // foo(C3), foo2(C2), foo1(C1)
}
class A15 implements M4 {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C2) { return 'A.2' }
  foo(p: C3) { return 'A.3' }
  // inherited overload foo { foo, foo2, foo1 } // foo(C3), foo2(C2), foo1(C1)
}

interface J13 {
  foo1(p: C1): string;
  foo(p: C2): string;
  foo3(p: C3): string;
  overload foo { foo3, foo, foo1 } // foo3(C3), foo(C2), foo1(C1)
}
interface K10 extends J13 {
  // inherited overload foo { foo3, foo, foo1 } // foo3(C3), foo(C2), foo1(C1)
}
interface M5 extends J13 {
  // inherited overload foo { foo3, foo, foo1 } // foo3(C3), foo(C2), foo1(C1)
}
interface L2 extends K10, M5 {
  // inherited overload foo { foo3, foo, foo1 } // foo3(C3), foo(C2), foo1(C1)
}
class A16 implements L2 {
  foo1(p: C1) { return 'A.1' }
  foo(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo, foo1 } // foo3(C3), foo(C2), foo1(C1)
}

interface J14 {
  foo1(p: C1) { return 'J.1' }
foo(p: C2) { return 'J.2' }
foo3(p: C3) { return 'J.3' }
overload foo { foo3, foo1, foo } // foo3(C3), foo1(C1), foo(C2)
}

interface K11 extends J14 {
  // inherited overload foo { foo3, foo1, foo } // foo3(C3), foo1(C1), foo(C2)
}
class A17 implements K11 {
  foo1(p: C1) { return 'A.1' }
  foo(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo1, foo } // foo3(C3), foo1(C1), foo(C2)
}

interface J30 {
  foo1(p: C1) { return 'J.1' }
foo(p: C2) { return 'J.2' }
foo3(p: C3) { return 'J.3' }
overload foo { foo3, foo1, foo } // foo3(C3), foo1(C1), foo(C2)
}
interface K27 extends J30 {
  foo3(p: C2) { return 'K.2' }
// inherited overload foo { foo3, foo1, foo } // foo3(C2), foo1(C1), foo(C2)
}
class A33 implements K27 {
  foo1(p: C1) { return 'A.1' }
  foo(p: C1) { return 'A.2' }
  foo3(p: C1) { return 'A.3' }
  // inherited overload foo { foo3, foo1, foo } // foo3(C1), foo1(C1), foo(C1)
}

interface I4 {
  m1(p: short): string;
  m2(p: int): string;
  m3(p: byte): string;
  // overloads defined in interface only
  overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m3, m2, m1 }
}

class A42 implements I4 {
  // overloaded methods implemented in class
  m1(p: short) { return 'short' }
  m2(p: int) { return 'int' }
  m3(p: byte) { return 'byte' }
}

interface I5 {
  m1(p: float): string;
  m2(p: number): string;
  m3(p: long): string;
  // overloads defined in interface only
  overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m3, m2, m1 }
}

class A43 implements I5 {
  // overloaded methods implemented in class
  m1(p: float) { return 'float' }
  m2(p: number) { return 'number' }
  m3(p: long) { return 'long' }
}

interface I6 {
  m1(p: short): string;
  m2(p: int): string;
  m3(p: byte): string;
  overload foo1 { m1, m2, m3 }
overload foo2 { m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m3, m1, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m1, m3 }
}

class A44 implements I6 {
  // overloaded methods implemented in class
  m1(p: short) { return 'short' }
  m2(p: int) { return 'int' }
  m3(p: byte) { return 'byte' }
  // overloads defined in interface and overridden in class
  overload foo2 { m2, m3, m1 }
overload foo4 { m1, m3, m2 }
overload foo6 { m3, m2, m1 }
}

interface I7 {
  m1(p: float): string;
  m2(p: number): string;
  m3(p: long): string;
  overload foo1 { m2, m3, m1 }
overload foo2 { m2, m3, m1 }
overload foo3 { m1, m3, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m3, m2, m1 }
overload foo6 { m3, m2, m1 }
}

class A45 implements I7 {
  // overloads defined in interface and overridden in class
  overload foo1 { m1, m2, m3 }
overload foo3 { m3, m1, m2 }
overload foo5 { m2, m1, m3 }
// overloaded methods implemented in class
m1(p: float) { return 'float' }
m2(p: number) { return 'number' }
m3(p: long) { return 'long' }
}

interface I9 {
  m1(p: float): string;
  m2(p: number): string;
  m3(p: long): string;
  // overloads defined under method names
  overload m1 { m1, m3, m2 }
overload m2 { m1, m3, m2 }
overload m3 { m3, m1 }
}

class A47 implements I9 {
  // overloads defined in interface and overridden in class
  overload m1 { m1, m2, m3 }
overload m2 { m1, m3, m2 }
overload m3 { m3, m2, m1 }
// overloaded methods implemented in class
m1(p: float) { return 'float' }
m2(p: number) { return 'number' }
m3(p: long) { return 'long' }
}

interface I14 {
  m1(p: short) { return 'x' }
m2(p: int) { return 'x' }
m3(p: byte) { return 'byte' }
// overloads defined in interface only
overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m3, m2, m1 }
}

class A52 implements I14 {
  // overloaded default interface methods implemented in class
  m1(p: short) { return 'short' }
  m2(p: int) { return 'int' }
}

interface I15 {
  m1(p: float) { return 'x' }
m2(p: number) { return 'x' }
m3(p: long) { return 'long' }
// overloads defined in interface only
overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m3, m2, m1 }
}

class A53 implements I15 {
  // overloaded default interface methods implemented in class
  m1(p: float) { return 'float' }
  m2(p: number) { return 'number' }
}

interface I16 {
  m1(p: short) { return 'short' }
m2(p: int) { return 'x' }
m3(p: byte) { return 'x' }
// overloads defined in interface under new names
overload foo1 { m2, m3, m1 }
overload foo2 { m2, m3, m1 }
overload foo3 { m1, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m3, m2, m1 }
overload foo6 { m3, m2, m1 }
}

class A54 implements I16 {
  // overloaded default interface methods implemented in class
  m2(p: int) { return 'int' }
  m3(p: byte) { return 'byte' }
  // overloads defined in interface and overridden in class
  overload foo1 { m1, m2, m3 }
overload foo3 { m3, m1, m2 }
overload foo5 { m2, m1, m3 }
}

interface I17 {
  m1(p: float) { return 'float' }
m2(p: number) { return 'x' }
m3(p: long) { return 'x' }
// overloads defined in interface under new names
overload foo1 { m1, m2, m3 }
overload foo2 { m1, m2, m3 }
overload foo3 { m3, m1, m2 }
overload foo4 { m3, m1, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m1, m3 }
}

class A55 implements I17 {
  // overloads defined in interface and overridden in class
  overload foo2 { m2, m3, m1 }
overload foo4 { m1, m3, m2 }
overload foo6 { m3, m2, m1 }
// overloaded default interface methods implemented in class
m2(p: number) { return 'number' }
m3(p: long) { return 'long' }
}

interface I19 {
  m1(p: float) { return 'float' }
m2(p: number) { return 'x' }
m3(p: long) { return 'x' }
// overloads defined in interface under method names
overload m1 { m1, m2, m3 }
overload m2 { m1, m2 }
overload m3 { m2, m1, m3 }
}

class A57 implements I19 {
  // overloads defined in interface and overridden in class
  overload m1 { m2, m3, m1 }
overload m2 { m1, m3, m2 }
overload m3 { m3, m2, m1 }
// overloaded default interface methods implemented in class
m2(p: number) { return 'number' }
m3(p: long) { return 'long' }
}

interface I20 {
  m1(p: short): string { return 'short' }
m2<T>(p: T): string { return 'GEN' }
m3(p: byte): string { return 'byte' }
// overloads defined in interface under new names
overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
}

interface I21 {
  m1(p: float): string { return 'float' }
m2<T>(p: T): string { return 'GEN' }
m3(p: long): string { return 'long' }
// overloads defined in interface under new names
overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
}

interface I22 {
  m1(p: short): string { return 'short' }
m2(p: int): string { return 'int' }
m3<T>(p: T): string { return 'GEN' }
// overloads defined in interface under method names
overload m1 { m1, m2, m3 }
overload m2 { m3, m2, m1 }
overload m3 { m2, m1, m3 }
}

interface I23 {
  m1<T>(p: T): string { return 'GEN1' }
m2<T>(p: T): string { return 'GEN2' }
m3(p: long): string { return 'long' }
// overloads defined in interface under method names
overload m1 { m3, m2, m1 }
overload m2 { m2, m3, m1 }
overload m3 { m1, m3, m2 }
}

interface I24 {
  m1(p: short) { return 'short' }
m2(p: int) { return 'int' }
m3(p: byte) { return 'byte' }
// overloads defined in interface under new names
overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m3, m2, m1 }
}

interface I25 {
  m1(p: float) { return 'float' }
m2(p: number) { return 'number' }
m3(p: long) { return 'long' }
// overloads defined in interface under new names
overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m3, m2, m1 }
}

interface I26 {
  m1(p: short) { return 'short' }
m2(p: int) { return 'int' }
m3(p: byte) { return 'byte' }
// overloads defined in interface under method names
overload m1 { m1, m2, m3 }
overload m2 { m3, m2, m1 }
overload m3 { m2, m1, m3 }
}

interface I27 {
  m1(p: float) { return 'float' }
m2(p: number) { return 'number' }
m3(p: long) { return 'long' }
// overloads defined in interface under method names
overload m1 { m3, m2, m1 }
overload m2 { m2, m3, m1 }
overload m3 { m1, m3, m2 }
}

interface I28 {
  m1(p: short): string { return 'short' }
m2<T>(p: T): string { return 'GEN' }
m3(p: byte): string { return 'byte' }
// overloads defined in interface I1
overload foo1 { m2, m1 }
overload foo2 { m1, m3, m2 }
overload foo3 { m3, m2 }
overload foo4 { m2, m3, m1 }
}
interface I29 extends I28 {
  // overloads from I1 overridden in I2
  overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
}

interface I30 {
  m1(p: float): string { return 'float' }
m2(p: number): string { return 'number' }
m3<T>(p: T): string { return 'GEN' }
// overloads defined in interface I1
overload foo1 { m2, m1, m3 }
overload foo2 { m1, m3, m2 }
overload foo3 { m3, m2, m1 }
overload foo4 { m2, m3 }
}
interface I31 extends I30 {
  // overloads overridden in I2
  overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
}

interface I36 {
  m1(p: float): string { return 'float' }
m2(p: number): string;
m3<T>(p: T): string { return 'x' }
// overloads defined in interface I1 under method names
overload m1 { m1, m2, m3 }
overload m2 { m1, m2 }
overload m3 { m2, m1, m3 }
}
interface I37 extends I36 {
  // overloads defined in interface I1 and overridden in I2
  overload m1 { m2, m3, m1 }
overload m2 { m1, m3, m2 }
overload m3 { m3, m2, m1 }
// overloaded default interface methods implemented in I2
m2(p: number): string { return 'number' }
m3<T>(p: T): string { return 'GEN' }
}

interface I46 {
  m1(p: short) { return 'short' }
m2(p: int) { return 'int' }
m3(p: byte) { return 'byte' }
// overloads defined in interface I1
overload foo1 { m2, m1 }
overload foo2 { m1, m3, m2 }
overload foo3 { m3, m2 }
overload foo4 { m2, m3, m1 }
overload foo5 { m1 }
overload foo6 { m3, m1, m2 }
}
interface I47 extends I46 {
  // overloads from I1 overridden in I2
  overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m3, m2, m1 }
}


interface I48 {
  m1(p: float) { return 'float' }
m2(p: number) { return 'number' }
m3(p: long) { return 'long' }
// overloads defined in interface I1
overload foo1 { m2, m1, m3 }
overload foo2 { m1, m3, m2 }
overload foo3 { m3, m2, m1 }
overload foo4 { m2, m3 }
overload foo5 { m1, m2, m3 }
overload foo6 { m3, m1, m2 }
}

interface I49 extends I48 {
  // overloads overridden in I2
  overload foo1 { m1, m2, m3 }
overload foo2 { m2, m3, m1 }
overload foo3 { m3, m1, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m3, m2, m1 }
}

interface I50 {
  m1(p: short): string;
  m2(p: int): string;
  m3(p: byte) { return 'byte' }
// overloads defined in interface I1
overload foo1 { m2, m3, m1 }
overload foo2 { m2, m3, m1 }
overload foo3 { m1, m3, m2 }
overload foo4 { m1, m3, m2 }
overload foo5 { m3, m2, m1 }
overload foo6 { m3, m2, m1 }
}
interface I51 extends I50 {
  // overridden methods
  m1(p: short) { return 'short' }
m2(p: int) { return 'int' }
// overloads overridden in I2
overload foo1 { m1, m2, m3 }
overload foo3 { m3, m1, m2 }
overload foo5 { m2, m1, m3 }
}

interface I52 {
  m1(p: float) { return 'float' }
m2(p: number) { return 'number' }
m3(p: long) { return 'x' }
// overloads defined in interface I1
overload foo1 { m1, m2, m3 }
overload foo2 { m1, m3 }
overload foo3 { m3, m1, m2 }
overload foo4 { m3, m1, m2 }
overload foo5 { m2, m1, m3 }
overload foo6 { m2, m1, m3 }
}
interface I53 extends I52 {
  // overloads overridden in I2
  overload foo2 { m2, m3, m1 }
overload foo4 { m1, m3, m2 }
overload foo6 { m3, m2, m1 }
// overridden method
m3(p: long) { return 'long' }
}

interface I56 {
  m1(p: float) { return 'float' }
m2(p: number): string;
m3(p: long) { return 'x' }
// overloads defined in interface I1 under method names
overload m1 { m1, m2, m3 }
overload m2 { m1, m2 }
overload m3 { m2, m1, m3 }
}
interface I57 extends I56 {
  // overloads defined in interface I1 and overridden in I2
  overload m1 { m2, m3, m1 }
overload m2 { m1, m3, m2 }
overload m3 { m3, m2, m1 }
// overloaded default interface methods implemented in I2
m2(p: number) { return 'number' }
m3(p: long) { return 'long' }
}


let res1: number = 0;

interface I58 {
  foo1(i: byte): string {
  res1 = 1;
  return "str";
}
}

interface J35 extends I58 {
  foo2(j: int): number {
  res1 = 2;
  return 2.1;
}
}

class A58 implements J35 {
  overload foo { foo1, foo2 }
}

let res3: number = 0;

interface I60 {
  foo1(i: number) {
  return 1;
}
}
interface J37 extends I60 {
  foo2(j: string) {
  return 2;
}
}
class A60 implements I60, J37 {
  overload foo { foo1, foo2 }
}

let res4: number = 0;

interface I61 {
  foo1(i: number) {
  return 1;
}
}
interface J38 {
  foo2(j: string) {
  return 2;
}
}
class A61 implements I61, J38 {
  overload foo { foo1, foo2 }
}

interface J39 {
  foo1(p: C1): string;
  foo2(p: C2): string;
  overload foo { foo1, foo2 } // foo1(C1), foo2(C2)
}
interface K32 extends J39 {
  foo3(p: C3): string;
  overload foo { foo3, foo1, foo2 } // foo3(C3), foo1(C1), foo2(C2)
}
class A62 implements K32 {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo1, foo2 } // foo3(C3), foo1(C1), foo2(C2)
}

interface J40 {
  foo1(p: C1): string;
  foo3(p: C3): string;
  overload foo { foo3, foo1 } // foo3(C3), foo1(C1)
}
interface K33 {}
interface M16 extends J40, K33 {
  foo1(p: C1): string;
  foo2(p: C2): string;
  overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}
class A63 implements M16 {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}

interface J41 {
  foo2(p: C2): string;
  foo3(p: C3): string;
  overload foo { foo3, foo2 } // foo3(C3), foo2(C2)
}
interface K34 extends J41 {}
interface M17 extends J41 {}
interface L8 extends K34, M17 {
  foo1(p: C1): string;
  overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}
class A64 implements L8 {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo2, foo1 } // foo3(C3), foo2(C2), foo1(C1)
}

interface J42 {
  foo1(p: C1) { return 'J.1' }
foo2(p: C2) { return 'J.2' }
overload foo { foo1, foo2 } // foo1(C1), foo2(C2)
}
interface K35 extends J42 {
  foo3(p: C3) { return 'K.3' }
overload foo { foo3, foo1, foo2 } // foo3(C3), foo1(C1), foo2(C2)
}
class A65 implements K35 {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo1, foo2 } // foo3(C3), foo1(C1), foo2(C2)
}

interface J48 {
  foo1(p: C1): string;
  foo2(p: C2): string;
  foo(p: C3): string;
  overload foo { foo2, foo, foo1 } // foo2(C2), foo(C3), foo1(C1)
}
interface K41 {}
interface M20 extends J48, K41 {
  overload foo { foo, foo2, foo1 } // foo(C3), foo2(C2), foo1(C1)
}
class A71 implements M20 {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C2) { return 'A.2' }
  foo(p: C3) { return 'A.3' }
  // inherited overload foo { foo, foo2, foo1 } // foo(C3), foo2(C2), foo1(C1)
}

interface J49 {
  foo(p: C2): string;
  foo3(p: C3): string;
  overload foo { foo3, foo } // foo3(C3), foo(C2)
}
interface K42 extends J49 {
  foo1(p: C1): string;
  // inherited overload foo { foo3, foo } // foo3(C3), foo(C2)
}
interface M21 extends J49 {
  foo1(p: C1): string;
  overload foo { foo3, foo, foo1 } // foo3(C3), foo(C2), foo1(C1)
}
interface L10 extends K42, M21 {
  overload foo { foo3, foo, foo1 } // foo3(C3), foo(C2), foo1(C1)
}
class A72 implements L10 {
  foo1(p: C1) { return 'A.1' }
  foo(p: C2) { return 'A.2' }
  foo3(p: C3) { return 'A.3' }
  // inherited overload foo { foo3, foo, foo1 } // foo3(C3), foo(C2), foo1(C1)
}

interface J63 {
  foo1(p: C1): string;
  foo(p: C2): string;
  foo3(p: C3): string;
  overload foo { foo1, foo } // foo1(C1), foo(C2)
}
interface K56 extends J63 {
  foo3(p: C2): string;
  overload foo { foo3, foo1, foo } // foo3(C2), foo1(C1), foo(C2)
}
class A86 implements K56 {
  foo1(p: C1) { return 'A.1' }
  foo(p: C1) { return 'A.2' }
  foo3(p: C1) { return 'A.3' }
  overload foo { foo3, foo1, foo } // foo3(C1), foo1(C1), foo(C1)
}

interface J64 {
  foo1(p: C1): string;
  foo2(p: C2): string;
  foo(p: C3): string;
  overload foo { foo, foo2 } // foo(C3), foo2(C2)
}
interface K57 {}
interface M28 extends J64, K57 {
  foo1(p: C1): string;
  foo2(p: C1): string;
  foo(p: C2): string;
  overload foo { foo, foo2, foo1 } // foo(C2), foo2(C1), foo1(C1)
}
class A87 implements M28 {
  foo1(p: C1) { return 'A.1' }
  foo2(p: C1) { return 'A.2' }
  foo(p: C2) { return 'A.3' }
  overload foo { foo, foo2, foo1 } // foo(C2), foo2(C1), foo1(C1)
}

interface J66 {
  foo1(p: C1) { return 'J.1' }
foo(p: C2) { return 'J.2' }
foo3(p: C3) { return 'J.3' }
overload foo { foo1, foo } // foo1(C1), foo(C2)
}
interface K59 extends J66 {
  foo3(p: C2) { return 'K.2' }
overload foo { foo3, foo1, foo } // foo3(C2), foo1(C1), foo(C2)
}
class A89 implements K59 {
  foo1(p: C1) { return 'A.1' }
  foo(p: C1) { return 'A.2' }
  foo3(p: C1) { return 'A.3' }
  overload foo { foo3, foo1, foo } // foo3(C1), foo1(C1), foo(C1)
}

interface I62 {
  m1(p: int) { return 1 }
m2(p: long) { return 2 }
foo(p: string) { return 3 }
}
interface I63 extends I62 {
  overload foo { m1, m2 }
}
class A94 implements I63 {}

interface I64 {
  m1(p: int) { return 1 }
m2(p: long) { return 2 }
overload foo { m1, m2 }
}
interface I65 extends I64 {
  foo(p: string) { return 3 }
foo(p: int) { return 4 }
}
class A95 implements I65 {}


interface I66<F, G> {
  foo1(i: F) {}
foo2(j: G) {}
overload foo { foo1, foo2 }
}
class A96<F,G> implements I66<F,G> {}

interface I67<F> {
  foo1(i: F) {}
foo2(j: Number) {}
overload foo { foo1, foo2 }
}
class A97<F> implements I67<F> {}

class G<T> {}
interface I68<T> {
  foo1(i: G<T>) {}
foo2(j: G<Number>) {}
overload foo { foo1, foo2 }
}
class A98<T> implements I68<T> {}

interface I69 {
  foo1(j: String) {}
foo2(i: string) {}
overload foo { foo1, foo2 }
}
class A99 implements I69 {}

interface I70 {
  foo1(j: number) {}
foo2(i: double) {}
overload foo { foo1, foo2 }
}
class A100 implements I70 {}


interface I71 {
  foo1(j: Number) {}
foo2(i: Double) {}
overload foo { foo1, foo2 }
}
class A101 implements I71 {}


let res: number = 0;

type TPL = [boolean, float];
type FUN = () => boolean;

class Gen<T> {
  foo(i: Gen<T>) {};
}

class Gen2<T,S> {
  foo(i: T) {};
}

interface IBase<T,S> {
  foo1() { res = 100 + 1; }
foo2(i: byte) { res = 100 + 15; }
foo3(i: short) { res = 100 + 2; }
foo4(i: char) { res = 100 + 12; }
foo5(i: int) { res = 100 + 4; }
foo6(i: long) { res = 100 + 6; }
foo7(i: float) { res = 100 + 8; }
foo8(i: double) { res = 100 + 10; }
foo9(i: string) { res = 100 + 14; }
foo10(i: boolean) { res = 100 + 17; }
foo11(i: int, j: int) { res = 100 + 19; }
foo12(i: Gen<T>) { res = 100 + 20; }
foo13(i: Gen2<T, S>) { res = 100 + 21; }
foo14(i: Number|undefined|null) { res = 100 + 22; }
foo15(i: number, j: Number) { res = 100 + 23; }
foo16(i: FUN) { res = 100 + 24; }
foo17(i: TPL) { res = 100 + 25; }
foo18(i: char[]) { res = 100 + 26; }
overload foo { foo1, foo2, foo3, foo4, foo5, foo6, foo7, foo8, foo9, foo10, foo11, foo12, foo13, foo14, foo15, foo16, foo17, foo18 }
}

interface IDerived<T,S> extends IBase<T,S> {
  foo() {
  res = 200 + 1;
}
}

class Base<T,S> implements IBase<T,S> {}
class Derived<T,S> implements IDerived<T,S> {}

interface IDerived1<T,S> extends IBase<T,S> {
  foo(i: byte) {
  res = 200 + 15;
}
}

class Derived1<T,S> implements IDerived1<T,S> {}

interface IDerived2<T,S> extends IBase<T,S> {
  foo(i: short) {
  res = 200 + 2;
}
}

class Derived2<T,S> implements IDerived2<T,S> {}

interface IDerived3<T,S> extends IBase<T,S> {
  foo(i: char) {
  res = 200 + 12;
}
}

class Derived3<T,S> implements IDerived3<T,S> {}

interface IDerived4<T,S> extends IBase<T,S> {
  foo(i: int) {
  res = 200 + 4;
}
}

class Derived4<T,S> implements IDerived4<T,S> {}

interface IDerived5<T,S> extends IBase<T,S> {
  foo(i: long) {
  res = 200 + 6;
}
}

class Derived5<T,S> implements IDerived5<T,S> {}

interface IDerived6<T,S> extends IBase<T,S> {
  foo(i: float) {
  res = 200 + 8;
}
}

class Derived6<T,S> implements IDerived6<T,S> {}


interface IDerived7<T,S> extends IBase<T,S> {
  foo(i: double) {
  res = 200 + 10;
}
}

class Derived7<T,S> implements IDerived7<T,S> {}

interface IDerived8<T,S> extends IBase<T,S> {
  foo(i: string) {
  res = 200 + 14;
}
}

class Derived8<T,S> implements IDerived8<T,S> {}

interface IDerived9<T,S> extends IBase<T,S> {
  foo(i: boolean) {
  res = 200 + 17;
}
}
class Derived9<T,S> implements IDerived9<T,S> {}

interface IDerived10<T,S> extends IBase<T,S> {
  foo(i: int, j: int) {
  res = 200 + 19;
}
}

class Derived10<T,S> implements IDerived10<T,S> {}

interface IDerived11<T,S> extends IBase<T,S> {
  foo(i: Gen<T>) {
  res = 200 + 20;
}
}

class Derived11<T,S> implements IDerived11<T,S> {}
interface IDerived12<T,S> extends IBase<T,S> {
  foo(i: Gen2<T, S>) {
  res = 200 + 21;
}
}

class Derived12<T,S> implements IDerived12<T,S> {}
interface IDerived13<T,S> extends IBase<T,S> {
  foo(i: Number|undefined|null) {
  res = 200 + 22;
}
}

class Derived13<T,S> implements IDerived13<T,S> {}

interface IDerived14<T,S> extends IBase<T,S> {
  foo(i: number, j: Number) {
  res = 200 + 23;
}
}
class Derived14<T,S> implements IDerived14<T,S> {}

interface IDerived15<T,S> extends IBase<T,S> {
  foo(i: FUN) {
  res = 200 + 24;
}
}

class Derived15<T,S> implements IDerived15<T,S> {}


interface IDerived16<T,S> extends IBase<T,S> {
  foo(i: TPL) {
  res = 200 + 25;
}
}

class Derived16<T,S> implements IDerived16<T,S> {}

interface IDerived17<T,S> extends IBase<T,S> {
  foo(i: char[]) {
  res = 200 + 26;
}
}

class Derived17<T,S> implements IDerived17<T,S> {}

export default function ExplicitInterfaceMethodOverloadTest():void {
  describe('ExplicitInterfaceMethodOverloadTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })


    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_0100
     * @tc.name      testExplicitInterfaceMethodOverload0001
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A = new A()
      expect(a.m()).assertEqual(0);
      expect(a.m(42)).assertEqual(1);
      expect(a.m(12, 55)).assertEqual(67);
      expect(a.m(12, 55, 42)).assertEqual(3);
      expect(a.m(61, 2.0)).assertEqual(63.0);
      expect(a.m(11, 12, 15e23)).assertEqual(21);
      expect(a.m(2.011e12, 1.98, 88)).assertEqual(31);
      expect(a.m("abc", 18.0)).assertEqual("abc18");
    });


    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_0200
     * @tc.name      testExplicitInterfaceMethodOverload0002
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A1 = new A1()
      expect(a.m(a)).assertEqual(1);
      expect(a.m(1)).assertEqual(4);
      expect(a.m(1, a)).assertEqual(2);
      expect(a.m(1, a, a)).assertEqual(3);
      expect(a.m(1, a, a, a)).assertEqual(4);
    });


    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_0300
     * @tc.name      testExplicitInterfaceMethodOverload0003
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A2()
      expect(a.m(true)).assertEqual(1.0);
      expect(a.m(new Boolean())).assertEqual(1.0);
      expect(a.m(true, 1.0)).assertEqual(3.0);
      expect(a.m(false, new Double())).assertEqual(3.0);
      expect(a.m(new Boolean(), new Double())).assertEqual(3.0);
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_0500
     * @tc.name      testExplicitInterfaceMethodOverload0005
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A4<X, Y> = new A4<X, Y>()

      expect(a.m(new X())).assertEqual(1);
      expect(a.m(new X(), new Y())).assertEqual(2);
      expect(a.m(new Y(), new X(), new Y())).assertEqual(3);
    });


    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_0600
     * @tc.name      testExplicitInterfaceMethodOverload0006
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A5 = new A5()
      let x: X1 = new X1()
      let y: Y1 = new Y1()
      let z: Z = new Z()

      expect(a.m(x)).assertEqual(3);
      expect(a.m(y)).assertEqual(3);
      expect(a.m(z)).assertEqual(3);
      expect(a.m(x, y)).assertEqual(2);
      expect(a.m(z, z)).assertEqual(2);
      expect(a.m(x, y, z)).assertEqual(1);
      expect(a.m(z, z, z)).assertEqual(1);
    });


    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_0700
     * @tc.name      testExplicitInterfaceMethodOverload0007
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be inherited from a superinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J6 = ((): J6 => new A6)()
      expect(j.foo(new C3)).assertEqual('A.3');
      expect(j.foo(new C2)).assertEqual('A.1');
      expect(j.foo(new C1)).assertEqual('A.1');

      let k: K = ((): K => new A6)()
      expect(k.foo(new C3)).assertEqual('A.3');
      expect(k.foo(new C2)).assertEqual('A.1');
      expect(k.foo(new C1)).assertEqual('A.1');


      let a: A6 = ((): A6 => new A6)()
      expect(a.foo(new C3)).assertEqual('A.3');
      expect(a.foo(new C2)).assertEqual('A.1');
      expect(a.foo(new C1)).assertEqual('A.1');

    });


    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_0800
     * @tc.name      testExplicitInterfaceMethodOverload0008
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be inherited from a superinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J71 = ((): J71 => new A7)()
      expect(j.foo(new C3)).assertEqual('A.3');
      expect(j.foo(new C2)).assertEqual('A.2');
      expect(j.foo(new C1)).assertEqual('A.1');


      let m: M = ((): M => new A7)()
      expect(m.foo(new C3)).assertEqual('A.3');
      expect(m.foo(new C2)).assertEqual('A.2');
      expect(m.foo(new C1)).assertEqual('A.1');

      let a: A7 = ((): A7 => new A7)()
      expect(a.foo(new C3)).assertEqual('A.3');
      expect(a.foo(new C2)).assertEqual('A.2');
      expect(a.foo(new C1)).assertEqual('A.1');

    });


    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_0900
     * @tc.name      testExplicitInterfaceMethodOverload0009
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be inherited from a superinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J71 = ((): J71 => new A8)()
      expect(j.foo(new C3)).assertEqual('A.3');
      expect(j.foo(new C2)).assertEqual('A.2');
      expect(j.foo(new C1)).assertEqual('A.1');


      let k: K2 = ((): K2 => new A8)()
      expect(k.foo(new C3)).assertEqual('A.3');
      expect(k.foo(new C2)).assertEqual('A.2');
      expect(k.foo(new C1)).assertEqual('A.1');


      let m: M1 = ((): M1 => new A8)()
      expect(m.foo(new C3)).assertEqual('A.3');
      expect(m.foo(new C2)).assertEqual('A.2');
      expect(m.foo(new C1)).assertEqual('A.1');


      let l: L = ((): L => new A8)()
      expect(l.foo(new C3)).assertEqual('A.3');
      expect(l.foo(new C2)).assertEqual('A.2');
      expect(l.foo(new C1)).assertEqual('A.1');

      let a: A8 = ((): A8 => new A8)()
      expect(a.foo(new C3)).assertEqual('A.3');
      expect(a.foo(new C2)).assertEqual('A.2');
      expect(a.foo(new C1)).assertEqual('A.1');


    });


    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_1000
     * @tc.name      testExplicitInterfaceMethodOverload0010
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be inherited from a superinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J7 = {}
      expect(j.foo(new C3)).assertEqual('J.3');
      expect(j.foo(new C2)).assertEqual('J.1');
      expect(j.foo(new C1)).assertEqual('J.1');


      let k: K3 = {}
      expect(k.foo(new C3)).assertEqual('K.3');
      expect(k.foo(new C2)).assertEqual('J.1');
      expect(k.foo(new C1)).assertEqual('J.1');

      let a: A9 = {}
      expect(a.foo(new C3)).assertEqual('A.3');
      expect(a.foo(new C2)).assertEqual('A.1');
      expect(a.foo(new C1)).assertEqual('A.1');

    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_1600
     * @tc.name      testExplicitInterfaceMethodOverload0016
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be inherited from a superinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J12 = ((): J12 => new A15)()
      expect(j.foo(new C3)).assertEqual('A.3');
      expect(j.foo(new C2)).assertEqual('A.2');
      expect(j.foo(new C1)).assertEqual('A.1');


      let m: M4 = ((): M4 => new A15)()
      expect(m.foo(new C3)).assertEqual('A.3');
      expect(m.foo(new C2)).assertEqual('A.2');
      expect(m.foo(new C1)).assertEqual('A.1');


      let a: A15 = ((): A15 => new A15)()
      expect(a.foo(new C3)).assertEqual('A.3');
      expect(a.foo(new C2)).assertEqual('A.2');
      expect(a.foo(new C1)).assertEqual('A.1');


    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_4300
     * @tc.name      testExplicitInterfaceMethodOverload0043
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    Overloaded default interface methods implemented in class, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A42();
      expect(a.foo1(1 as byte)).assertEqual('short');
      expect(a.foo1(1 as short)).assertEqual('short');
      expect(a.foo1(1 as int)).assertEqual('int');
      expect(a.foo1(1)).assertEqual('short');

      expect(a.foo2(1 as byte)).assertEqual('int');
      expect(a.foo2(1 as short)).assertEqual('int');
      expect(a.foo2(1 as int)).assertEqual('int');
      expect(a.foo2(1)).assertEqual('int');

      expect(a.foo3(1 as byte)).assertEqual('byte');
      expect(a.foo3(1 as short)).assertEqual('short');
      expect(a.foo3(1 as int)).assertEqual('int');
      expect(a.foo3(1)).assertEqual('byte');

      expect(a.foo4(1 as byte)).assertEqual('short');
      expect(a.foo4(1 as short)).assertEqual('short');
      expect(a.foo4(1 as int)).assertEqual('int');
      expect(a.foo4(1)).assertEqual('short');

      expect(a.foo5(1 as byte)).assertEqual('int');
      expect(a.foo5(1 as short)).assertEqual('int');
      expect(a.foo5(1 as int)).assertEqual('int');
      expect(a.foo5(1)).assertEqual('int');

      expect(a.foo6(1 as byte)).assertEqual('byte');
      expect(a.foo6(1 as short)).assertEqual('int');
      expect(a.foo6(1 as int)).assertEqual('int');
      expect(a.foo6(1)).assertEqual('byte');
    });


    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_4400
     * @tc.name      testExplicitInterfaceMethodOverload0044
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    Overloaded default interface methods implemented in class, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A43();

      expect(a.foo1(1f)).assertEqual('float');
      expect(a.foo1(1 as number)).assertEqual('number');
      expect(a.foo1(1 as long)).assertEqual('float');
      expect(a.foo1(1)).assertEqual('float');
      expect(a.foo1(1.0)).assertEqual('float');

      expect(a.foo2(1f)).assertEqual('number');
      expect(a.foo2(1 as number)).assertEqual('number');
      expect(a.foo2(1 as long)).assertEqual('number');
      expect(a.foo2(1)).assertEqual('number');
      expect(a.foo2(1.0)).assertEqual('number');

      expect(a.foo3(1f)).assertEqual('float');
      expect(a.foo3(1 as number)).assertEqual('number');
      expect(a.foo3(1 as long)).assertEqual('long');
      expect(a.foo3(1)).assertEqual('long');
      expect(a.foo3(1.0)).assertEqual('float');

      expect(a.foo4(1f)).assertEqual('float');
      expect(a.foo4(1 as number)).assertEqual('number');
      expect(a.foo4(1 as long)).assertEqual('float');
      expect(a.foo4(1)).assertEqual('float');
      expect(a.foo4(1.0)).assertEqual('float');

      expect(a.foo5(1f)).assertEqual('number');
      expect(a.foo5(1 as number)).assertEqual('number');
      expect(a.foo5(1 as long)).assertEqual('number');
      expect(a.foo5(1)).assertEqual('number');
      expect(a.foo5(1.0)).assertEqual('number');

      expect(a.foo6(1f)).assertEqual('number');
      expect(a.foo6(1 as number)).assertEqual('number');
      expect(a.foo6(1 as long)).assertEqual('long');
      expect(a.foo6(1)).assertEqual('long');
      expect(a.foo6(1.0)).assertEqual('number');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_4500
     * @tc.name      testExplicitInterfaceMethodOverload0045
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    Overloaded default interface methods implemented in class, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A44();
      expect(a.foo1(1 as byte)).assertEqual('short');
      expect(a.foo1(1 as short)).assertEqual('short');
      expect(a.foo1(1 as int)).assertEqual('int');
      expect(a.foo1(1)).assertEqual('short');

      expect(a.foo2(1 as byte)).assertEqual('int');
      expect(a.foo2(1 as short)).assertEqual('int');
      expect(a.foo2(1 as int)).assertEqual('int');
      expect(a.foo2(1)).assertEqual('int');

      expect(a.foo3(1 as byte)).assertEqual('byte');
      expect(a.foo3(1 as short)).assertEqual('short');
      expect(a.foo3(1 as int)).assertEqual('int');
      expect(a.foo3(1)).assertEqual('byte');

      expect(a.foo4(1 as byte)).assertEqual('short');
      expect(a.foo4(1 as short)).assertEqual('short');
      expect(a.foo4(1 as int)).assertEqual('int');
      expect(a.foo4(1)).assertEqual('short');

      expect(a.foo5(1 as byte)).assertEqual('int');
      expect(a.foo5(1 as short)).assertEqual('int');
      expect(a.foo5(1 as int)).assertEqual('int');
      expect(a.foo5(1)).assertEqual('int');

      expect(a.foo6(1 as byte)).assertEqual('byte');
      expect(a.foo6(1 as short)).assertEqual('int');
      expect(a.foo6(1 as int)).assertEqual('int');
      expect(a.foo6(1)).assertEqual('byte');


    });


    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_4600
     * @tc.name      testExplicitInterfaceMethodOverload0046
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    Overloaded default interface methods implemented in class, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A45();
      expect(a.foo1(1f)).assertEqual('float');
      expect(a.foo1(1 as number)).assertEqual('number');
      expect(a.foo1(1 as long)).assertEqual('float');
      expect(a.foo1(1)).assertEqual('float');
      expect(a.foo1(1.0)).assertEqual('float');

      expect(a.foo2(1f)).assertEqual('number');
      expect(a.foo2(1 as number)).assertEqual('number');
      expect(a.foo2(1 as long)).assertEqual('number');
      expect(a.foo2(1)).assertEqual('number');
      expect(a.foo2(1.0)).assertEqual('number');

      expect(a.foo3(1f)).assertEqual('float');
      expect(a.foo3(1 as number)).assertEqual('number');
      expect(a.foo3(1 as long)).assertEqual('long');
      expect(a.foo3(1)).assertEqual('long');
      expect(a.foo3(1.0)).assertEqual('float');

      expect(a.foo4(1f)).assertEqual('float');
      expect(a.foo4(1 as number)).assertEqual('number');
      expect(a.foo4(1 as long)).assertEqual('float');
      expect(a.foo4(1)).assertEqual('float');
      expect(a.foo4(1.0)).assertEqual('float');

      expect(a.foo5(1f)).assertEqual('number');
      expect(a.foo5(1 as number)).assertEqual('number');
      expect(a.foo5(1 as long)).assertEqual('number');
      expect(a.foo5(1)).assertEqual('number');
      expect(a.foo5(1.0)).assertEqual('number');

      expect(a.foo6(1f)).assertEqual('number');
      expect(a.foo6(1 as number)).assertEqual('number');
      expect(a.foo6(1 as long)).assertEqual('long');
      expect(a.foo6(1)).assertEqual('long');
      expect(a.foo6(1.0)).assertEqual('number');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_4800
     * @tc.name      testExplicitInterfaceMethodOverload0048
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    Overloaded default interface methods implemented in class, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A47();
      expect(a.m1(1f)).assertEqual('float');
      expect(a.m1(1 as number)).assertEqual('number');
      expect(a.m1(1 as long)).assertEqual('float');
      expect(a.m1(1)).assertEqual('float');
      expect(a.m1(1.0)).assertEqual('float');

      expect(a.m2(1f)).assertEqual('float');
      expect(a.m2(1 as number)).assertEqual('number');
      expect(a.m2(1 as long)).assertEqual('float');
      expect(a.m2(1)).assertEqual('float');
      expect(a.m2(1.0)).assertEqual('float');

      expect(a.m3(1f)).assertEqual('number');
      expect(a.m3(1 as number)).assertEqual('number');
      expect(a.m3(1 as long)).assertEqual('long');
      expect(a.m3(1)).assertEqual('long');
      expect(a.m3(1.0)).assertEqual('number');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_5300
     * @tc.name      testExplicitInterfaceMethodOverload0053
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    Overloaded default interface methods implemented in class, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A52();
      expect(a.foo1(1 as byte)).assertEqual('short');
      expect(a.foo1(1 as short)).assertEqual('short');
      expect(a.foo1(1 as int)).assertEqual('int');
      expect(a.foo1(1)).assertEqual('short');

      expect(a.foo2(1 as byte)).assertEqual('int');
      expect(a.foo2(1 as short)).assertEqual('int');
      expect(a.foo2(1 as int)).assertEqual('int');
      expect(a.foo2(1)).assertEqual('int');

      expect(a.foo3(1 as byte)).assertEqual('byte');
      expect(a.foo3(1 as short)).assertEqual('short');
      expect(a.foo3(1 as int)).assertEqual('int');
      expect(a.foo3(1)).assertEqual('byte');

      expect(a.foo4(1 as byte)).assertEqual('short');
      expect(a.foo4(1 as short)).assertEqual('short');
      expect(a.foo4(1 as int)).assertEqual('int');
      expect(a.foo4(1)).assertEqual('short');

      expect(a.foo5(1 as byte)).assertEqual('int');
      expect(a.foo5(1 as short)).assertEqual('int');
      expect(a.foo5(1 as int)).assertEqual('int');
      expect(a.foo5(1)).assertEqual('int');

      expect(a.foo6(1 as byte)).assertEqual('byte');
      expect(a.foo6(1 as short)).assertEqual('int');
      expect(a.foo6(1 as int)).assertEqual('int');
      expect(a.foo6(1)).assertEqual('byte');
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_5400
     * @tc.name      testExplicitInterfaceMethodOverload0054
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    Overloaded default interface methods implemented in class, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A53();
      expect(a.foo1(1f)).assertEqual('float');
      expect(a.foo1(1 as number)).assertEqual('number');
      expect(a.foo1(1 as long)).assertEqual('float');
      expect(a.foo1(1)).assertEqual('float');
      expect(a.foo1(1.0)).assertEqual('float');

      expect(a.foo2(1f)).assertEqual('number');
      expect(a.foo2(1 as number)).assertEqual('number');
      expect(a.foo2(1 as long)).assertEqual('number');
      expect(a.foo2(1)).assertEqual('number');
      expect(a.foo2(1.0)).assertEqual('number');

      expect(a.foo3(1f)).assertEqual('float');
      expect(a.foo3(1 as number)).assertEqual('number');
      expect(a.foo3(1 as long)).assertEqual('long');
      expect(a.foo3(1)).assertEqual('long');
      expect(a.foo3(1.0)).assertEqual('float');

      expect(a.foo4(1f)).assertEqual('float');
      expect(a.foo4(1 as number)).assertEqual('number');
      expect(a.foo4(1 as long)).assertEqual('float');
      expect(a.foo4(1)).assertEqual('float');
      expect(a.foo4(1.0)).assertEqual('float');

      expect(a.foo5(1f)).assertEqual('number');
      expect(a.foo5(1 as number)).assertEqual('number');
      expect(a.foo5(1 as long)).assertEqual('number');
      expect(a.foo5(1)).assertEqual('number');
      expect(a.foo5(1.0)).assertEqual('number');

      expect(a.foo6(1f)).assertEqual('number');
      expect(a.foo6(1 as number)).assertEqual('number');
      expect(a.foo6(1 as long)).assertEqual('long');
      expect(a.foo6(1)).assertEqual('long');
      expect(a.foo6(1.0)).assertEqual('number');
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_5500
     * @tc.name      testExplicitInterfaceMethodOverload0055
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    Overloaded default interface methods implemented in class, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A54();
      expect(a.foo1(1 as byte)).assertEqual('short');
      expect(a.foo1(1 as short)).assertEqual('short');
      expect(a.foo1(1 as int)).assertEqual('int');
      expect(a.foo1(1)).assertEqual('short');

      expect(a.foo2(1 as byte)).assertEqual('int');
      expect(a.foo2(1 as short)).assertEqual('int');
      expect(a.foo2(1 as int)).assertEqual('int');
      expect(a.foo2(1)).assertEqual('int');

      expect(a.foo3(1 as byte)).assertEqual('byte');
      expect(a.foo3(1 as short)).assertEqual('short');
      expect(a.foo3(1 as int)).assertEqual('int');
      expect(a.foo3(1)).assertEqual('byte');

      expect(a.foo4(1 as byte)).assertEqual('short');
      expect(a.foo4(1 as short)).assertEqual('short');
      expect(a.foo4(1 as int)).assertEqual('int');
      expect(a.foo4(1)).assertEqual('short');

      expect(a.foo5(1 as byte)).assertEqual('int');
      expect(a.foo5(1 as short)).assertEqual('int');
      expect(a.foo5(1 as int)).assertEqual('int');
      expect(a.foo5(1)).assertEqual('int');

      expect(a.foo6(1 as byte)).assertEqual('byte');
      expect(a.foo6(1 as short)).assertEqual('int');
      expect(a.foo6(1 as int)).assertEqual('int');
      expect(a.foo6(1)).assertEqual('byte');
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_5600
     * @tc.name      testExplicitInterfaceMethodOverload0056
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    Overloaded default interface methods implemented in class, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A55();
      expect(a.foo1(1f)).assertEqual('float');
      expect(a.foo1(1 as number)).assertEqual('number');
      expect(a.foo1(1 as long)).assertEqual('float');
      expect(a.foo1(1)).assertEqual('float');
      expect(a.foo1(1.0)).assertEqual('float');

      expect(a.foo2(1f)).assertEqual('number');
      expect(a.foo2(1 as number)).assertEqual('number');
      expect(a.foo2(1 as long)).assertEqual('number');
      expect(a.foo2(1)).assertEqual('number');
      expect(a.foo2(1.0)).assertEqual('number');

      expect(a.foo3(1f)).assertEqual('float');
      expect(a.foo3(1 as number)).assertEqual('number');
      expect(a.foo3(1 as long)).assertEqual('long');
      expect(a.foo3(1)).assertEqual('long');
      expect(a.foo3(1.0)).assertEqual('float');

      expect(a.foo4(1f)).assertEqual('float');
      expect(a.foo4(1 as number)).assertEqual('number');
      expect(a.foo4(1 as long)).assertEqual('float');
      expect(a.foo4(1)).assertEqual('float');
      expect(a.foo4(1.0)).assertEqual('float');

      expect(a.foo5(1f)).assertEqual('number');
      expect(a.foo5(1 as number)).assertEqual('number');
      expect(a.foo5(1 as long)).assertEqual('number');
      expect(a.foo5(1)).assertEqual('number');
      expect(a.foo5(1.0)).assertEqual('number');

      expect(a.foo6(1f)).assertEqual('number');
      expect(a.foo6(1 as number)).assertEqual('number');
      expect(a.foo6(1 as long)).assertEqual('long');
      expect(a.foo6(1)).assertEqual('long');
      expect(a.foo6(1.0)).assertEqual('number');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_5800
     * @tc.name      testExplicitInterfaceMethodOverload0058
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    Overloaded default interface methods implemented in class, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A57();
      expect(a.m1(1f)).assertEqual('number');
      expect(a.m1(1 as number)).assertEqual('number');
      expect(a.m1(1 as long)).assertEqual('number');
      expect(a.m1(1)).assertEqual('number');
      expect(a.m1(1.0)).assertEqual('number');

      expect(a.m2(1f)).assertEqual('float');
      expect(a.m2(1 as number)).assertEqual('number');
      expect(a.m2(1 as long)).assertEqual('float');
      expect(a.m2(1)).assertEqual('float');
      expect(a.m2(1.0)).assertEqual('float');

      expect(a.m3(1f)).assertEqual('number');
      expect(a.m3(1 as number)).assertEqual('number');
      expect(a.m3(1 as long)).assertEqual('long');
      expect(a.m3(1)).assertEqual('long');
      expect(a.m3(1.0)).assertEqual('number');
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_5900
     * @tc.name      testExplicitInterfaceMethodOverload0059
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    An overloaded entity in an explicit overload declaration can be generic.
    If type arguments are provided explicitly in a call of an overloaded entity,
    then only entities with an equal number of type parameters and type arguments
    are considered during Overload Resolution.
    If type arguments are not provided explicitly, then consideration is given to all
    entities.
    Overloaded default interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I20 = {};
      expect(a.foo1(1 as byte)).assertEqual('short');
      expect(a.foo1(1 as short)).assertEqual('short');
      expect(a.foo1(1 as int)).assertEqual('GEN');
      expect(a.foo1(1)).assertEqual('short');
      expect(a.foo1<short>(1 as short)).assertEqual('GEN');

      expect(a.foo2(1 as byte)).assertEqual('GEN');
      expect(a.foo2(1 as short)).assertEqual('GEN');
      expect(a.foo2(1 as int)).assertEqual('GEN');
      expect(a.foo2(1)).assertEqual('GEN');
      expect(a.foo2<string>('1')).assertEqual('GEN');

      expect(a.foo3(1 as byte)).assertEqual('byte');
      expect(a.foo3(1 as short)).assertEqual('short');
      expect(a.foo3(1 as int)).assertEqual('GEN');
      expect(a.foo3(1)).assertEqual('byte');
      expect(a.foo3<short>(1 as short)).assertEqual('GEN');

      expect(a.foo4(1 as byte)).assertEqual('short');
      expect(a.foo4(1 as short)).assertEqual('short');
      expect(a.foo4(1 as int)).assertEqual('GEN');
      expect(a.foo4(1)).assertEqual('short');
      expect(a.foo4<byte>(1 as byte)).assertEqual('GEN');
    });
    
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_6000
     * @tc.name      testExplicitInterfaceMethodOverload0060
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    An overloaded entity in an explicit overload declaration can be generic.
    If type arguments are provided explicitly in a call of an overloaded entity,
    then only entities with an equal number of type parameters and type arguments
    are considered during Overload Resolution.
    If type arguments are not provided explicitly, then consideration is given to all
    entities.
    Overloaded default interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I21 = {};
      expect(a.foo1(1f)).assertEqual('float');
      expect(a.foo1(1 as number)).assertEqual('GEN');
      expect(a.foo1(1 as long)).assertEqual('float');
      expect(a.foo1(1)).assertEqual('float');
      expect(a.foo1(1.0)).assertEqual('float');
      expect(a.foo1<float>(1f)).assertEqual('GEN');

      expect(a.foo2(1f)).assertEqual('GEN');
      expect(a.foo2(1 as number)).assertEqual('GEN');
      expect(a.foo2(1 as long)).assertEqual('GEN');
      expect(a.foo2(1)).assertEqual('GEN');
      expect(a.foo2(1.0)).assertEqual('GEN');
      expect(a.foo2<long>(1 as long)).assertEqual('GEN');

      expect(a.foo3(1f)).assertEqual('float');
      expect(a.foo3(1 as number)).assertEqual('GEN');
      expect(a.foo3(1 as long)).assertEqual('long');
      expect(a.foo3(1)).assertEqual('long');
      expect(a.foo3(1.0)).assertEqual('float');
      expect(a.foo3<long>(1 as long)).assertEqual('GEN');

      expect(a.foo4(1f)).assertEqual('float');
      expect(a.foo4(1 as number)).assertEqual('GEN');
      expect(a.foo4(1 as long)).assertEqual('float');
      expect(a.foo4(1)).assertEqual('float');
      expect(a.foo4(1.0)).assertEqual('float');
      expect(a.foo4<float>(1f)).assertEqual('GEN');
    });
    
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_6100
     * @tc.name      testExplicitInterfaceMethodOverload0061
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    An overloaded entity in an explicit overload declaration can be generic.
    If type arguments are provided explicitly in a call of an overloaded entity,
    then only entities with an equal number of type parameters and type arguments
    are considered during Overload Resolution.
    If type arguments are not provided explicitly, then consideration is given to all
    entities.
    Overloaded default interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I22 = {};
      expect(a.m1(1 as byte)).assertEqual('short');
      expect(a.m1(1 as short)).assertEqual('short');
      expect(a.m1(1 as int)).assertEqual('int');
      expect(a.m1(1)).assertEqual('short');
      expect(a.m1<int>(1 as int)).assertEqual('GEN');

      expect(a.m3(1 as byte)).assertEqual('int');
      expect(a.m3(1 as short)).assertEqual('int');
      expect(a.m3(1 as int)).assertEqual('int');
      expect(a.m3(1)).assertEqual('int');
      expect(a.m3<int>(1 as int)).assertEqual('GEN');

      expect(a.m2(1 as byte)).assertEqual('GEN');
      expect(a.m2(1 as short)).assertEqual('GEN');
      expect(a.m2(1 as int)).assertEqual('GEN');
      expect(a.m2(1)).assertEqual('GEN');
      expect(a.m2<byte>(1 as byte)).assertEqual('GEN');
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_6200
     * @tc.name      testExplicitInterfaceMethodOverload0062
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    An overloaded entity in an explicit overload declaration can be generic.
    If type arguments are provided explicitly in a call of an overloaded entity,
    then only entities with an equal number of type parameters and type arguments
    are considered during Overload Resolution.
    If type arguments are not provided explicitly, then consideration is given to all
    entities.
    Overloaded default interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I23 = {};
      expect(a.m2(1f)).assertEqual('GEN2');
      expect(a.m2(1 as number)).assertEqual('GEN2');
      expect(a.m2(1 as long)).assertEqual('GEN2');
      expect(a.m2(1)).assertEqual('GEN2');
      expect(a.m2(1.0)).assertEqual('GEN2');
      expect(a.m2<long>(1 as long)).assertEqual('GEN2');

      expect(a.m3(1f)).assertEqual('GEN1');
      expect(a.m3(1 as number)).assertEqual('GEN1');
      expect(a.m3(1 as long)).assertEqual('GEN1');
      expect(a.m3(1)).assertEqual('GEN1');
      expect(a.m3(1.0)).assertEqual('GEN1');
      expect(a.m3<long>(1 as long)).assertEqual('GEN1');

      expect(a.m1(1f)).assertEqual('GEN2');
      expect(a.m1(1 as number)).assertEqual('GEN2');
      expect(a.m1(1 as long)).assertEqual('long');
      expect(a.m1(1)).assertEqual('long');
      expect(a.m1(1.0)).assertEqual('GEN2');
      expect(a.m1<float>(1f)).assertEqual('GEN2');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_6300
     * @tc.name      testExplicitInterfaceMethodOverload0063
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    Overloaded default interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I24 = {};
      expect(a.foo1(1 as byte)).assertEqual('short');
      expect(a.foo1(1 as short)).assertEqual('short');
      expect(a.foo1(1 as int)).assertEqual('int');
      expect(a.foo1(1)).assertEqual('short');

      expect(a.foo2(1 as byte)).assertEqual('int');
      expect(a.foo2(1 as short)).assertEqual('int');
      expect(a.foo2(1 as int)).assertEqual('int');
      expect(a.foo2(1)).assertEqual('int');

      expect(a.foo3(1 as byte)).assertEqual('byte');
      expect(a.foo3(1 as short)).assertEqual('short');
      expect(a.foo3(1 as int)).assertEqual('int');
      expect(a.foo3(1)).assertEqual('byte');

      expect(a.foo4(1 as byte)).assertEqual('short');
      expect(a.foo4(1 as short)).assertEqual('short');
      expect(a.foo4(1 as int)).assertEqual('int');
      expect(a.foo4(1)).assertEqual('short');

      expect(a.foo5(1 as byte)).assertEqual('int');
      expect(a.foo5(1 as short)).assertEqual('int');
      expect(a.foo5(1 as int)).assertEqual('int');
      expect(a.foo5(1)).assertEqual('int');

      expect(a.foo6(1 as byte)).assertEqual('byte');
      expect(a.foo6(1 as short)).assertEqual('int');
      expect(a.foo6(1 as int)).assertEqual('int');
      expect(a.foo6(1)).assertEqual('byte');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_6400
     * @tc.name      testExplicitInterfaceMethodOverload0064
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    Overloaded default interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I25 = {};
      expect(a.foo1(1f)).assertEqual('float');
      expect(a.foo1(1 as number)).assertEqual('number');
      expect(a.foo1(1 as long)).assertEqual('float');
      expect(a.foo1(1)).assertEqual('float');
      expect(a.foo1(1.0)).assertEqual('float');

      expect(a.foo2(1f)).assertEqual('number');
      expect(a.foo2(1 as number)).assertEqual('number');
      expect(a.foo2(1 as long)).assertEqual('number');
      expect(a.foo2(1)).assertEqual('number');
      expect(a.foo2(1.0)).assertEqual('number');

      expect(a.foo3(1f)).assertEqual('float');
      expect(a.foo3(1 as number)).assertEqual('number');
      expect(a.foo3(1 as long)).assertEqual('long');
      expect(a.foo3(1)).assertEqual('long');
      expect(a.foo3(1.0)).assertEqual('float');

      expect(a.foo4(1f)).assertEqual('float');
      expect(a.foo4(1 as number)).assertEqual('number');
      expect(a.foo4(1 as long)).assertEqual('float');
      expect(a.foo4(1)).assertEqual('float');
      expect(a.foo4(1.0)).assertEqual('float');

      expect(a.foo5(1f)).assertEqual('number');
      expect(a.foo5(1 as number)).assertEqual('number');
      expect(a.foo5(1 as long)).assertEqual('number');
      expect(a.foo5(1)).assertEqual('number');
      expect(a.foo5(1.0)).assertEqual('number');

      expect(a.foo6(1f)).assertEqual('number');
      expect(a.foo6(1 as number)).assertEqual('number');
      expect(a.foo6(1 as long)).assertEqual('long');
      expect(a.foo6(1)).assertEqual('long');
      expect(a.foo6(1.0)).assertEqual('number');
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_6500
     * @tc.name      testExplicitInterfaceMethodOverload0065
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    Overloaded default interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I26 = {};
      expect(a.m1(1 as byte)).assertEqual('short');
      expect(a.m1(1 as short)).assertEqual('short');
      expect(a.m1(1 as int)).assertEqual('int');
      expect(a.m1(1)).assertEqual('short');

      expect(a.m3(1 as byte)).assertEqual('int');
      expect(a.m3(1 as short)).assertEqual('int');
      expect(a.m3(1 as int)).assertEqual('int');
      expect(a.m3(1)).assertEqual('int');

      expect(a.m2(1 as byte)).assertEqual('byte');
      expect(a.m2(1 as short)).assertEqual('int');
      expect(a.m2(1 as int)).assertEqual('int');
      expect(a.m2(1)).assertEqual('byte');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_6600
     * @tc.name      testExplicitInterfaceMethodOverload0066
     * @tc.desc      'Explicit interface method overload allows declaring a name for a set of interface
    methods.
    Overloaded default interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I27 = {};
      expect(a.m2(1f)).assertEqual('number');
      expect(a.m2(1 as number)).assertEqual('number');
      expect(a.m2(1 as long)).assertEqual('number');
      expect(a.m2(1)).assertEqual('number');
      expect(a.m2(1.0)).assertEqual('number');

      expect(a.m3(1f)).assertEqual('float');
      expect(a.m3(1 as number)).assertEqual('number');
      expect(a.m3(1 as long)).assertEqual('float');
      expect(a.m3(1)).assertEqual('float');
      expect(a.m3(1.0)).assertEqual('float');

      expect(a.m1(1f)).assertEqual('number');
      expect(a.m1(1 as number)).assertEqual('number');
      expect(a.m1(1 as long)).assertEqual('long');
      expect(a.m1(1)).assertEqual('long');
      expect(a.m1(1.0)).assertEqual('number');
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_6700
     * @tc.name      testExplicitInterfaceMethodOverload0067
     * @tc.desc      'An explicit overload defined in a superinterface can be overridden
    in a subinterface. In this case, the overload declaration of the
    subinterface must contain all methods overloaded in superinterface.
    An overloaded entity in an explicit overload declaration can be generic.
    If type arguments are provided explicitly in a call of an overloaded entity,
    then only entities with an equal number of type parameters and type arguments
    are considered during Overload Resolution.
    If type arguments are not provided explicitly, then consideration is given to all
    entities.
    Overloaded interface methods, numeric parameters.'

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I29 = {};
      expect(a.foo1(1 as byte)).assertEqual('short');
      expect(a.foo1(1 as short)).assertEqual('short');
      expect(a.foo1(1 as int)).assertEqual('GEN');
      expect(a.foo1(1)).assertEqual('short');
      expect(a.foo1<short>(1 as short)).assertEqual('GEN');

      expect(a.foo2(1 as byte)).assertEqual('GEN');
      expect(a.foo2(1 as short)).assertEqual('GEN');
      expect(a.foo2(1 as int)).assertEqual('GEN');
      expect(a.foo2(1)).assertEqual('GEN');
      expect(a.foo2<byte>(1 as byte)).assertEqual('GEN');

      expect(a.foo3(1 as byte)).assertEqual('byte');
      expect(a.foo3(1 as short)).assertEqual('short');
      expect(a.foo3(1 as int)).assertEqual('GEN');
      expect(a.foo3(1)).assertEqual('byte');
      expect(a.foo3<byte>(1 as byte)).assertEqual('GEN');

      expect(a.foo4(1 as byte)).assertEqual('short');
      expect(a.foo4(1 as short)).assertEqual('short');
      expect(a.foo4(1 as int)).assertEqual('GEN');
      expect(a.foo4(1)).assertEqual('short');
      expect(a.foo4<short>(1 as short)).assertEqual('GEN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_6800
     * @tc.name      testExplicitInterfaceMethodOverload0068
     * @tc.desc      'An explicit overload defined in a superinterface can be overridden
    in a subinterface. In this case, the overload declaration of the
    subinterface must contain all methods overloaded in superinterface.
    An overloaded entity in an explicit overload declaration can be generic.
    If type arguments are provided explicitly in a call of an overloaded entity,
    then only entities with an equal number of type parameters and type arguments
    are considered during Overload Resolution.
    If type arguments are not provided explicitly, then consideration is given to all
    entities.
    Overloaded interface methods, numeric parameters.'

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I31 = {};
      expect(a.foo1(1f)).assertEqual('float');
      expect(a.foo1(1 as number)).assertEqual('number');
      expect(a.foo1(1 as long)).assertEqual('float');
      expect(a.foo1(1)).assertEqual('float');
      expect(a.foo1(1.0)).assertEqual('float');
      expect(a.foo1<long>(1 as long)).assertEqual('GEN');

      expect(a.foo2(1f)).assertEqual('number');
      expect(a.foo2(1 as number)).assertEqual('number');
      expect(a.foo2(1 as long)).assertEqual('number');
      expect(a.foo2(1)).assertEqual('number');
      expect(a.foo2(1.0)).assertEqual('number');
      expect(a.foo2<float>(1f)).assertEqual('GEN');

      expect(a.foo3(1f)).assertEqual('GEN');
      expect(a.foo3(1 as number)).assertEqual('GEN');
      expect(a.foo3(1 as long)).assertEqual('GEN');
      expect(a.foo3(1)).assertEqual('GEN');
      expect(a.foo3(1.0)).assertEqual('GEN');
      expect(a.foo3<float>(1f)).assertEqual('GEN');

      expect(a.foo4(1f)).assertEqual('float');
      expect(a.foo4(1 as number)).assertEqual('GEN');
      expect(a.foo4(1 as long)).assertEqual('float');
      expect(a.foo4(1)).assertEqual('float');
      expect(a.foo4(1.0)).assertEqual('float');
      expect(a.foo4<number>(1.0)).assertEqual('GEN');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_7600
     * @tc.name      testExplicitInterfaceMethodOverload0076
     * @tc.desc      'An explicit overload defined in a superinterface can be overridden
    in a subinterface. In this case, the overload declaration of the
    subinterface must contain all methods overloaded in superinterface.
    Overloaded interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I47 = {};
      expect(a.foo1(1 as byte)).assertEqual('short');
      expect(a.foo1(1 as short)).assertEqual('short');
      expect(a.foo1(1 as int)).assertEqual('int');
      expect(a.foo1(1)).assertEqual('short');

      expect(a.foo2(1 as byte)).assertEqual('int');
      expect(a.foo2(1 as short)).assertEqual('int');
      expect(a.foo2(1 as int)).assertEqual('int');
      expect(a.foo2(1)).assertEqual('int');

      expect(a.foo3(1 as byte)).assertEqual('byte');
      expect(a.foo3(1 as short)).assertEqual('short');
      expect(a.foo3(1 as int)).assertEqual('int');
      expect(a.foo3(1)).assertEqual('byte');

      expect(a.foo4(1 as byte)).assertEqual('short');
      expect(a.foo4(1 as short)).assertEqual('short');
      expect(a.foo4(1 as int)).assertEqual('int');
      expect(a.foo4(1)).assertEqual('short');

      expect(a.foo5(1 as byte)).assertEqual('int');
      expect(a.foo5(1 as short)).assertEqual('int');
      expect(a.foo5(1 as int)).assertEqual('int');
      expect(a.foo5(1)).assertEqual('int');

      expect(a.foo6(1 as byte)).assertEqual('byte');
      expect(a.foo6(1 as short)).assertEqual('int');
      expect(a.foo6(1 as int)).assertEqual('int');
      expect(a.foo6(1)).assertEqual('byte');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_7700
     * @tc.name      testExplicitInterfaceMethodOverload0077
     * @tc.desc      'An explicit overload defined in a superinterface can be overridden
    in a subinterface. In this case, the overload declaration of the
    subinterface must contain all methods overloaded in superinterface.
    Overloaded interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I49 = {};
      expect(a.foo1(1f)).assertEqual('float');
      expect(a.foo1(1 as number)).assertEqual('number');
      expect(a.foo1(1 as long)).assertEqual('float');
      expect(a.foo1(1)).assertEqual('float');
      expect(a.foo1(1.0)).assertEqual('float');

      expect(a.foo2(1f)).assertEqual('number');
      expect(a.foo2(1 as number)).assertEqual('number');
      expect(a.foo2(1 as long)).assertEqual('number');
      expect(a.foo2(1)).assertEqual('number');
      expect(a.foo2(1.0)).assertEqual('number');

      expect(a.foo3(1f)).assertEqual('float');
      expect(a.foo3(1 as number)).assertEqual('number');
      expect(a.foo3(1 as long)).assertEqual('long');
      expect(a.foo3(1)).assertEqual('long');
      expect(a.foo3(1.0)).assertEqual('float');

      expect(a.foo4(1f)).assertEqual('float');
      expect(a.foo4(1 as number)).assertEqual('number');
      expect(a.foo4(1 as long)).assertEqual('float');
      expect(a.foo4(1)).assertEqual('float');
      expect(a.foo4(1.0)).assertEqual('float');

      expect(a.foo5(1f)).assertEqual('number');
      expect(a.foo5(1 as number)).assertEqual('number');
      expect(a.foo5(1 as long)).assertEqual('number');
      expect(a.foo5(1)).assertEqual('number');
      expect(a.foo5(1.0)).assertEqual('number');

      expect(a.foo6(1f)).assertEqual('number');
      expect(a.foo6(1 as number)).assertEqual('number');
      expect(a.foo6(1 as long)).assertEqual('long');
      expect(a.foo6(1)).assertEqual('long');
      expect(a.foo6(1.0)).assertEqual('number');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_7800
     * @tc.name      testExplicitInterfaceMethodOverload0078
     * @tc.desc      'An explicit overload defined in a superinterface can be overridden
    in a subinterface. In this case, the overload declaration of the
    subinterface must contain all methods overloaded in superinterface.
    Overloaded interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I51 = {};
      expect(a.foo1(1 as byte)).assertEqual('short');
      expect(a.foo1(1 as short)).assertEqual('short');
      expect(a.foo1(1 as int)).assertEqual('int');
      expect(a.foo1(1)).assertEqual('short');

      expect(a.foo2(1 as byte)).assertEqual('int');
      expect(a.foo2(1 as short)).assertEqual('int');
      expect(a.foo2(1 as int)).assertEqual('int');
      expect(a.foo2(1)).assertEqual('int');

      expect(a.foo3(1 as byte)).assertEqual('byte');
      expect(a.foo3(1 as short)).assertEqual('short');
      expect(a.foo3(1 as int)).assertEqual('int');
      expect(a.foo3(1)).assertEqual('byte');

      expect(a.foo4(1 as byte)).assertEqual('short');
      expect(a.foo4(1 as short)).assertEqual('short');
      expect(a.foo4(1 as int)).assertEqual('int');
      expect(a.foo4(1)).assertEqual('short');

      expect(a.foo5(1 as byte)).assertEqual('int');
      expect(a.foo5(1 as short)).assertEqual('int');
      expect(a.foo5(1 as int)).assertEqual('int');
      expect(a.foo5(1)).assertEqual('int');

      expect(a.foo6(1 as byte)).assertEqual('byte');
      expect(a.foo6(1 as short)).assertEqual('int');
      expect(a.foo6(1 as int)).assertEqual('int');
      expect(a.foo6(1)).assertEqual('byte');
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_7900
     * @tc.name      testExplicitInterfaceMethodOverload0079
     * @tc.desc      'An explicit overload defined in a superinterface can be overridden
    in a subinterface. In this case, the overload declaration of the
    subinterface must contain all methods overloaded in superinterface.
    Overloaded interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I53 = {};
      expect(a.foo1(1f)).assertEqual('float');
      expect(a.foo1(1 as number)).assertEqual('number');
      expect(a.foo1(1 as long)).assertEqual('float');
      expect(a.foo1(1)).assertEqual('float');
      expect(a.foo1(1.0)).assertEqual('float');

      expect(a.foo2(1f)).assertEqual('number');
      expect(a.foo2(1 as number)).assertEqual('number');
      expect(a.foo2(1 as long)).assertEqual('number');
      expect(a.foo2(1)).assertEqual('number');
      expect(a.foo2(1.0)).assertEqual('number');

      expect(a.foo3(1f)).assertEqual('float');
      expect(a.foo3(1 as number)).assertEqual('number');
      expect(a.foo3(1 as long)).assertEqual('long');
      expect(a.foo3(1)).assertEqual('long');
      expect(a.foo3(1.0)).assertEqual('float');

      expect(a.foo4(1f)).assertEqual('float');
      expect(a.foo4(1 as number)).assertEqual('number');
      expect(a.foo4(1 as long)).assertEqual('float');
      expect(a.foo4(1)).assertEqual('float');
      expect(a.foo4(1.0)).assertEqual('float');

      expect(a.foo5(1f)).assertEqual('number');
      expect(a.foo5(1 as number)).assertEqual('number');
      expect(a.foo5(1 as long)).assertEqual('number');
      expect(a.foo5(1)).assertEqual('number');
      expect(a.foo5(1.0)).assertEqual('number');

      expect(a.foo6(1f)).assertEqual('number');
      expect(a.foo6(1 as number)).assertEqual('number');
      expect(a.foo6(1 as long)).assertEqual('long');
      expect(a.foo6(1)).assertEqual('long');
      expect(a.foo6(1.0)).assertEqual('number');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_8100
     * @tc.name      testExplicitInterfaceMethodOverload0081
     * @tc.desc      'An explicit overload defined in a superinterface can be overridden
    in a subinterface. In this case, the overload declaration of the
    subinterface must contain all methods overloaded in superinterface.
    Overloaded interface methods, numeric parameters.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I57 = {};
      expect(a.m1(1f)).assertEqual('number');
      expect(a.m1(1 as number)).assertEqual('number');
      expect(a.m1(1 as long)).assertEqual('number');
      expect(a.m1(1)).assertEqual('number');
      expect(a.m1(1.0)).assertEqual('number');

      expect(a.m2(1f)).assertEqual('float');
      expect(a.m2(1 as number)).assertEqual('number');
      expect(a.m2(1 as long)).assertEqual('float');
      expect(a.m2(1)).assertEqual('float');
      expect(a.m2(1.0)).assertEqual('float');

      expect(a.m3(1f)).assertEqual('number');
      expect(a.m3(1 as number)).assertEqual('number');
      expect(a.m3(1 as long)).assertEqual('long');
      expect(a.m3(1)).assertEqual('long');
      expect(a.m3(1.0)).assertEqual('number');
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_8200
     * @tc.name      testExplicitInterfaceMethodOverload0082
     * @tc.desc      A method is defined in a subinterface with the same name as the method in the
    superinterface. If signatures are override-compatible (see Override-Compatible Signatures),
    then overriding is used. Otherwise, overloading is used.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A58 = new A58();
      expect(a.foo(1 as int)).assertEqual(2.1);
      expect(a.foo(1 as byte)).assertEqual("str");
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_8400
     * @tc.name      testExplicitInterfaceMethodOverload0084
     * @tc.desc      A method is defined in a subinterface with the same name as the method in the
    superinterface. If signatures are override-compatible (see Override-Compatible Signatures),
    then overriding is used. Otherwise, overloading is used.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A60();
      expect(a.foo(1.1 as number) == 1).assertTrue();
      expect(a.foo("some string") == 2).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_8500
     * @tc.name      testExplicitInterfaceMethodOverload0085
     * @tc.desc      A method is defined in a subinterface with the same name as the method in the
    superinterface. If signatures are override-compatible (see Override-Compatible Signatures),
    then overriding is used. Otherwise, overloading is used.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A61();
      expect(a.foo(1.1 as number) == 1).assertTrue();
      expect(a.foo("some string") == 2).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_8600
     * @tc.name      testExplicitInterfaceMethodOverload0086
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be overridden in a subinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J39 = ((): J39 => new A62)()
      expect(j.foo(new C3)).assertEqual('A.1')
      expect(j.foo(new C2)).assertEqual('A.1')
      expect(j.foo(new C1)).assertEqual('A.1')

      let k: K32 = ((): K32 => new A62)()
      expect(k.foo(new C3)).assertEqual('A.3')
      expect(k.foo(new C2)).assertEqual('A.1')
      expect(k.foo(new C1)).assertEqual('A.1')

      let a: A62 = ((): A62 => new A62)()
      expect(a.foo(new C3)).assertEqual('A.3')
      expect(a.foo(new C2)).assertEqual('A.1')
      expect(a.foo(new C1)).assertEqual('A.1')
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_8700
     * @tc.name      testExplicitInterfaceMethodOverload0087
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be overridden in a subinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J40 = ((): J40 => new A63)()
      expect(j.foo(new C3)).assertEqual('A.3')
      expect(j.foo(new C2)).assertEqual('A.1')
      expect(j.foo(new C1)).assertEqual('A.1')

      let m: M16 = ((): M16 => new A63)()
      expect(m.foo(new C3)).assertEqual('A.3')
      expect(m.foo(new C2)).assertEqual('A.2')
      expect(m.foo(new C1)).assertEqual('A.1')

      let a: A63 = ((): A63 => new A63)()
      expect(a.foo(new C3)).assertEqual('A.3')
      expect(a.foo(new C2)).assertEqual('A.2')
      expect(a.foo(new C1)).assertEqual('A.1')
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_8800
     * @tc.name      testExplicitInterfaceMethodOverload0088
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be overridden in a subinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J41 = ((): J41 => new A64)()
      expect(j.foo(new C3)).assertEqual('A.3')
      expect(j.foo(new C2)).assertEqual('A.2')

      let k: K34 = ((): K34 => new A64)()
      expect(k.foo(new C3)).assertEqual('A.3')
      expect(k.foo(new C2)).assertEqual('A.2')

      let m: M17 = ((): M17 => new A64)()
      expect(m.foo(new C3)).assertEqual('A.3')
      expect(m.foo(new C2)).assertEqual('A.2')

      let l: L8 = ((): L8 => new A64)()
      expect(l.foo(new C3)).assertEqual('A.3')
      expect(l.foo(new C2)).assertEqual('A.2')
      expect(l.foo(new C1)).assertEqual('A.1')

      let a: A64 = ((): A64 => new A64)()
      expect(a.foo(new C3)).assertEqual('A.3')
      expect(a.foo(new C2)).assertEqual('A.2')
      expect(a.foo(new C1)).assertEqual('A.1')
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_8900
     * @tc.name      testExplicitInterfaceMethodOverload0089
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be overridden in a subinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J42 = {}
      expect(j.foo(new C3)).assertEqual('J.1')
      expect(j.foo(new C2)).assertEqual('J.1')
      expect(j.foo(new C1)).assertEqual('J.1')

      let k: K35 = {}
      expect(k.foo(new C3)).assertEqual('K.3')
      expect(k.foo(new C2)).assertEqual('J.1')
      expect(k.foo(new C1)).assertEqual('J.1')

      let a: A65 = {}
      expect(a.foo(new C3)).assertEqual('A.3')
      expect(a.foo(new C2)).assertEqual('A.1')
      expect(a.foo(new C1)).assertEqual('A.1')
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_9500
     * @tc.name      testExplicitInterfaceMethodOverload0095
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be overridden in a subinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J48 = ((): J48 => new A71)()
      expect(j.foo(new C3)).assertEqual('A.2')
      expect(j.foo(new C2)).assertEqual('A.2')
      expect(j.foo(new C1)).assertEqual('A.1')

      let m: M20 = ((): M20 => new A71)()
      expect(m.foo(new C3)).assertEqual('A.3')
      expect(m.foo(new C2)).assertEqual('A.2')
      expect(m.foo(new C1)).assertEqual('A.1')

      let a: A71 = ((): A71 => new A71)()
      expect(a.foo(new C3)).assertEqual('A.3')
      expect(a.foo(new C2)).assertEqual('A.2')
      expect(a.foo(new C1)).assertEqual('A.1')
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_11000
     * @tc.name      testExplicitInterfaceMethodOverload0110
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be overridden in a subinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J63 = ((): J63 => new A86)()
      expect(j.foo(new C3)).assertEqual('A.1')
      expect(j.foo(new C2)).assertEqual('A.1')
      expect(j.foo(new C1)).assertEqual('A.1')

      let k: K56 = ((): K56 => new A86)()
      expect(k.foo(new C3)).assertEqual('A.3')
      expect(k.foo(new C2)).assertEqual('A.3')
      expect(k.foo(new C1)).assertEqual('A.1')

      let a: A86 = ((): A86 => new A86)()
      expect(a.foo(new C3)).assertEqual('A.3')
      expect(a.foo(new C2)).assertEqual('A.3')
      expect(a.foo(new C1)).assertEqual('A.3')
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_11100
     * @tc.name      testExplicitInterfaceMethodOverload0111
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be overridden in a subinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J64 = ((): J64 => new A87)()
      expect(j.foo(new C3)).assertEqual('A.3')
      expect(j.foo(new C2)).assertEqual('A.2')

      let m: M28 = ((): M28 => new A87)()
      expect(m.foo(new C3)).assertEqual('A.3')
      expect(m.foo(new C2)).assertEqual('A.3')
      expect(m.foo(new C1)).assertEqual('A.2')

      let a: A87 = ((): A87 => new A87)()
      expect(a.foo(new C3)).assertEqual('A.3')
      expect(a.foo(new C2)).assertEqual('A.3')
      expect(a.foo(new C1)).assertEqual('A.2')
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_11300
     * @tc.name      testExplicitInterfaceMethodOverload0113
     * @tc.desc      An explicit overload defined in a superinterface can be overridden in a subinterface.
    An explicit interface overload can be overridden in a class. Check that explicit
    overload can be overridden in a subinterface. No implicit overloading. Overload
    'foo' is new name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testExplicitInterfaceMethodOverload0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let j: J66 = {}
      expect(j.foo(new C3)).assertEqual('J.1')
      expect(j.foo(new C2)).assertEqual('J.1')
      expect(j.foo(new C1)).assertEqual('J.1')

      let k: K59 = {}
      expect(k.foo(new C3)).assertEqual('K.2')
      expect(k.foo(new C2)).assertEqual('K.2')
      expect(k.foo(new C1)).assertEqual('J.1')

      let a: A89 = {}
      expect(a.foo(new C3)).assertEqual('A.3')
      expect(a.foo(new C2)).assertEqual('A.3')
      expect(a.foo(new C1)).assertEqual('A.3')
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_11800
     * @tc.name      testExplicitInterfaceMethodOverload0118
     * @tc.desc      Test cases when explicit overload name is shadowed by a method name and vice
    versa.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i1: I62 = ((): I62 => new A94)()
      expect(i1.m1(1)).assertEqual(1)
      expect(i1.m2(1)).assertEqual(2)
      expect(i1.foo('abc')).assertEqual(3)

      let i2: I63 = ((): I63 => new A94)()
      expect(i2.m1(1)).assertEqual(1)
      expect(i2.m2(1)).assertEqual(2)
      expect(i2.foo(1 as int)).assertEqual(1)
      expect(i2.foo(1 as long)).assertEqual(2)
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_11900
     * @tc.name      testExplicitInterfaceMethodOverload0119
     * @tc.desc      Test cases when explicit overload name is shadowed by a method name and vice
    versa.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i1: I64 = ((): I64 => new A95)()
      expect(i1.m1(1)).assertEqual(1)
      expect(i1.m2(1)).assertEqual(2)
      expect(i1.foo(1 as int)).assertEqual(1)
      expect(i1.foo(1 as long)).assertEqual(2)

      let i2: I65 = ((): I65 => new A95)()
      expect(i2.m1(1)).assertEqual(1)
      expect(i2.m2(1)).assertEqual(2)
      expect(i2.foo('abc')).assertEqual(3)
      expect(i2.foo(1 as int)).assertEqual(4)
      expect(i2.foo(1 as long)).assertEqual(2)
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_12000
     * @tc.name      testExplicitInterfaceMethodOverload0120
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A96<String, Number>();
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_12100
     * @tc.name      testExplicitInterfaceMethodOverload0121
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A97<Byte>();
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_12200
     * @tc.name      testExplicitInterfaceMethodOverload0122
     * @tc.desc      desc: Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A98<Boolean>();
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_12300
     * @tc.name      testExplicitInterfaceMethodOverload0123
     * @tc.desc      desc: Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A99();
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_12400
     * @tc.name      testExplicitInterfaceMethodOverload0124
     * @tc.desc      desc: Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A100();
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_12500
     * @tc.name      testExplicitInterfaceMethodOverload0125
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A101();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_12600
     * @tc.name      testExplicitInterfaceMethodOverload0126
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo();
      expect(res == 100 + 1).assertTrue();

      a.foo();
      expect(res == 200 + 1).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_12700
     * @tc.name      testExplicitInterfaceMethodOverload0127
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived1<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(1 as byte);
      expect(res == 100 + 15).assertTrue();

      a.foo(1 as byte);
      expect(res == 200 + 15).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_12800
     * @tc.name      testExplicitInterfaceMethodOverload0128
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived2<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(1 as short);
      expect(res == 100 + 2).assertTrue();

      a.foo(1 as short);
      expect(res == 200 + 2).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_12900
     * @tc.name      testExplicitInterfaceMethodOverload0129
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived3<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(c'x');
      expect(res == 100 + 12).assertTrue();

      a.foo(c'x');
      expect(res == 200 + 12).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_13000
     * @tc.name      testExplicitInterfaceMethodOverload0130
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived4<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(1 as int);
      expect(res == 100 + 4).assertTrue();

      a.foo(1 as int);
      expect(res == 200 + 4).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_13100
     * @tc.name      testExplicitInterfaceMethodOverload0131
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived5<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(1 as long);
      expect(res == 100 + 6).assertTrue();

      a.foo(1 as long);
      expect(res == 200 + 6).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_13200
     * @tc.name      testExplicitInterfaceMethodOverload0132
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived6<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(1.1f);
      expect(res == 100 + 8).assertTrue();

      a.foo(1.1f);
      expect(res == 200 + 8).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_13300
     * @tc.name      testExplicitInterfaceMethodOverload0133
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived7<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(1.2);
      expect(res == 100 + 10).assertTrue();

      a.foo(1.2);
      expect(res == 200 + 10).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_13400
     * @tc.name      testExplicitInterfaceMethodOverload0134
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived8<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(new String());
      expect(res == 100 + 14).assertTrue();

      a.foo(new String());
      expect(res == 200 + 14).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_13500
     * @tc.name      testExplicitInterfaceMethodOverload0135
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived9<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(false);
      expect(res == 100 + 17).assertTrue();

      a.foo(false);
      expect(res == 200 + 17).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_13600
     * @tc.name      testExplicitInterfaceMethodOverload0136
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived10<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(1 as int, 2 as int);
      expect(res == 100 + 19).assertTrue();

      a.foo(1 as int, 2 as int);
      expect(res == 200 + 19).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_13700
     * @tc.name      testExplicitInterfaceMethodOverload0137
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived11<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(new Gen<Number>());
      expect(res == 100 + 20).assertTrue();

      a.foo(new Gen<Number>());
      expect(res == 200 + 20).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_13800
     * @tc.name      testExplicitInterfaceMethodOverload0138
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived12<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(new Gen2<Number, String>());
      expect(res == 100 + 21).assertTrue();

      a.foo(new Gen2<Number, String>());
      expect(res == 200 + 21).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_13900
     * @tc.name      testExplicitInterfaceMethodOverload0139
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived13<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(undefined);
      expect(res == 100 + 22).assertTrue();

      a.foo(undefined);
      expect(res == 200 + 22).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_14000
     * @tc.name      testExplicitInterfaceMethodOverload0140
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived14<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(1, new Number());
      expect(res == 100 + 23).assertTrue();

      a.foo(1, new Number());
      expect(res == 200 + 23).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_14100
     * @tc.name      testExplicitInterfaceMethodOverload0141
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived15<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(() => { return true; });
      expect(res == 100 + 24).assertTrue();

      a.foo(() => { return true; });
      expect(res == 200 + 24).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_14200
     * @tc.name      testExplicitInterfaceMethodOverload0142
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived16<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo(c);
      expect(res == 100 + 25).assertTrue();

      a.foo(c);
      expect(res == 200 + 25).assertTrue();
    });
    /**
     * @tc.number    SUB_EXPLICIT_INTERFACE_METHOD_OVERLOADTEST_14300
     * @tc.name      testExplicitInterfaceMethodOverload143
     * @tc.desc      Interface method overload declaration allows declaring an overload alias as
    an interface member for a set of interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExplicitInterfaceMethodOverload143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived17<Number, String>();
      let b = new Base<Number, String>();
      let c: TPL = [false, 1.2f];

      b.foo([ c'A', c'B' ]);
      expect(res == 100 + 26).assertTrue();

      a.foo([ c'A', c'B' ]);
      expect(res == 200 + 26).assertTrue();
    });
  })
}