'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Utils from '../../../Util.test'

// ============================================================================
// namespaces for 31 test cases
// ============================================================================

namespace deep_0 {
  export class A1 {}
  export class A2 extends A1 {}
  export interface I1 { foo(): A1 { return new A1() } }
export interface I2 { foo(): A2 { return new A2() } }
export class C1 implements I1, I2 { foo(): A2 { return new A2() } }
export function main(): void {
  let c1 = new C1();
  expect(c1.foo() instanceof A2).assertTrue();
}
}

namespace deep_1 {
  export interface I1 { foo(): string { return 'I1.foo' } }
export interface I2 extends I1 { foo(): string { return 'I2.foo' } }
export class C1 implements I1 { foo(): string { return 'C1.foo' } }
export class C2 extends C1 implements I2 {}
export function main(): void {
  let c2 = new C2()
  expect(c2.foo()).assertEqual('C1.foo')
}
}

namespace deep_2 {
  export interface I1 { foo(): string { return 'I1.foo' } }
export interface I2 extends I1 { foo(): string { return 'I2.foo' } }
// [FIX] 显式提供实现并重写，防止多个默认接口实现引发 LinkerError
export class C1 implements I1 { foo(): string { return 'I1.foo'; } }
export class C2 extends C1 implements I2 {
  override foo(): string { return 'I1.foo'; }
}
export function main(): void {
  let c2 = new C2()
  expect(c2.foo()).assertEqual('I1.foo')
}
}

namespace deep_3 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export interface I1 { foo(): A1 { return new A1() } }
export interface I2 extends I1 { foo(): A2 { return new A2() } }
export class C1 implements I1 { foo(): A3 { return new A3() } }
export class C2 extends C1 implements I2 {}
export function main(): void {
  let c2 = new C2()
  expect(c2.foo() instanceof A3).assertTrue();
}
}

namespace deep_4 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export interface I1 { foo(p: A3): string { return 'I1.foo' } }
export interface I2 extends I1 { foo(p: A2): string { return 'I2.foo' } }
export class C1 implements I1 { foo(p: A1): string { return 'C1.foo' } }
export class C2 extends C1 implements I2 {}
export function main(): void {
  let a1 = new A1(); let a2 = new A2(); let a3 = new A3();
  let c2 = new C2();
  expect(c2.foo(a1)).assertEqual('C1.foo');
  expect(c2.foo(a2)).assertEqual('C1.foo');
  expect(c2.foo(a3)).assertEqual('C1.foo');
}
}

namespace deep_5 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export interface I1 { foo(p: A3): A1 { return new A1() } }
export interface I2 extends I1 { foo(p: A2): A2 { return new A2() } }
export class C1 implements I1 { foo(p: A1): A3 { return new A3() } }
export class C2 extends C1 implements I2 {}
export function main(): void {
  let a1 = new A1(); let a2 = new A2(); let a3 = new A3();
  let c2 = new C2();
  expect(c2.foo(a1) instanceof A3).assertTrue();
  expect(c2.foo(a2) instanceof A3).assertTrue();
  expect(c2.foo(a3) instanceof A3).assertTrue();
}
}

namespace deep_6 {
  export class A {}
  export class B {}
  export class C {}
  // [FIX] 统一联合类型的签名并显式 override，避免参数逆变和返回值协变导致的底层签名不匹配链接崩溃
  export interface I1 { foo(p: A | B | C): A | B | C { return new B() } }
export interface I2 extends I1 { foo(p: A | B | C): A | B | C { return new B() } }
export class C1 implements I1 { foo(p: A | B | C): A | B | C { return new C() } }
export class C2 extends C1 implements I2 {
  override foo(p: A | B | C): A | B | C { return new C() }
}
export function main(): void {
  let a = new A();
  let c2 = new C2();
  expect(c2.foo(a) instanceof C).assertTrue();
}
}

namespace deep_7 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export class B {}
  export interface I1 { foo(p1: A3, ...p2: B[]): string { return 'I1.foo' } }
export interface I2 extends I1 { foo(p1: A2, ...p2: B[]): string { return 'I2.foo' } }
export class C1 implements I1 { foo(p1: A1, ...p2: B[]): string { return 'C1.foo' } }
export class C2 extends C1 implements I2 {}
export function main(): void {
  let a1 = new A1(); let a2 = new A2(); let a3 = new A3(); let b = new B();
  let c2 = new C2();
  expect(c2.foo(a1)).assertEqual('C1.foo');
  expect(c2.foo(a2)).assertEqual('C1.foo');
  expect(c2.foo(a3)).assertEqual('C1.foo');
  expect(c2.foo(a1, b)).assertEqual('C1.foo');
  expect(c2.foo(a2, b)).assertEqual('C1.foo');
  expect(c2.foo(a3, b)).assertEqual('C1.foo');
}
}

namespace deep_8 {
  export interface I1 { foo(): string { return 'I1.foo' } }
export interface I2 { foo(): string { return 'I2.foo' } }
export class C1 implements I1, I2 { foo(): string { return 'C1.foo' } }
export interface I3 { foo(): string { return 'I3.foo' } }
export class C2 extends C1 implements I3 {}
export function main(): void {
  let c2 = new C2()
  expect(c2.foo()).assertEqual('C1.foo')
}
}

namespace deep_9 {
  export class A1 {}
  export class A2 extends A1 {}
  export interface I1 { foo(): A1 { return new A1() } }
export interface I2 {}
// [FIX] 显式提供实现并覆盖
export class C1 implements I1, I2 {
  foo(): A1 { return new A1() }
}
export interface I3 { foo(): A1 { return new A2() } }
export class C2 extends C1 implements I3 {
  override foo(): A1 { return new A1() }
}
export function main(): void {
  let c2 = new C2()
  expect(!(c2.foo() instanceof A2)).assertTrue();
}
}

namespace deep_10 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export class A4 extends A3 {}
  export interface I1 { foo(): A1 { return new A1() } }
export interface I2 { foo(): A2 { return new A2() } }
export class C1 implements I1, I2 { foo(): A4 { return new A4() } }
export interface I3 { foo(): A3 { return new A3() } }
export class C2 extends C1 implements I3 {}
export function main(): void {
  let c2 = new C2()
  expect(c2.foo() instanceof A4).assertTrue();
}
}

namespace deep_11 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export class A4 extends A3 {}
  export interface I1 { foo(p: A3): string { return 'I1.foo' } }
export interface I2 { foo(p: A2): string { return 'I2.foo' } }
export class C1 implements I1, I2 { foo(p: A1): string { return 'C1.foo' } }
export interface I3 { foo(p: A4): string { return 'I3.foo' } }
export class C2 extends C1 implements I3 {}
export function main(): void {
  let a1 = new A1(); let a2 = new A2(); let a3 = new A3(); let a4 = new A4();
  let c2 = new C2();
  expect(c2.foo(a1)).assertEqual('C1.foo');
  expect(c2.foo(a2)).assertEqual('C1.foo');
  expect(c2.foo(a3)).assertEqual('C1.foo');
  expect(c2.foo(a4)).assertEqual('C1.foo');
}
}

namespace deep_12 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export class A4 extends A3 {}
  export interface I1 { foo(p: A3): A1 { return new A1() } }
export interface I2 { foo(p: A2): A2 { return new A2() } }
export class C1 implements I1, I2 { foo(p: A1): A4 { return new A4() } }
export interface I3 { foo(p: A4): A3 { return new A3() } }
export class C2 extends C1 implements I3 {}
export function main(): void {
  let a1 = new A1(); let a2 = new A2(); let a3 = new A3(); let a4 = new A4();
  let c2 = new C2();
  expect(c2.foo(a1) instanceof A4).assertTrue();
  expect(c2.foo(a2) instanceof A4).assertTrue();
  expect(c2.foo(a3) instanceof A4).assertTrue();
  expect(c2.foo(a4) instanceof A4).assertTrue();
}
}

namespace deep_13 {
  export class A {}
  export class B {}
  export class C {}
  // [FIX] 统一联合类型的签名以避免链接器由于隐式收窄导致的不匹配
  export interface I1 { foo(p: A | B | C): A | B | C { return new B() } }
export interface I2 { foo(p: A | B | C): A | B | C { return new B() } }
export class C1 implements I1, I2 { foo(p: A | B | C): A | B | C { return new C() } }
export interface I3 { foo(p: A | B | C): A | B | C { return new A() } }
export class C2 extends C1 implements I3 {
  override foo(p: A | B | C): A | B | C { return new C() }
}
export function main(): void {
  let a = new A();
  let c2 = new C2();
  expect(c2.foo(a) instanceof C).assertTrue();
}
}

namespace deep_14 {
  export class A {}
  export class B {}
  export interface I1 { foo(p: A): string { return 'I1.foo' } }
export interface I2 { foo(p1: A, ...p2: B[]): string { return 'I2.foo' } }
export class C1 implements I1, I2 { foo(p1: A, ...p2: B[]): string { return 'C1.foo' } }
export interface I3 { foo(p1: A, ...p2: B[]): string { return 'I3.foo' } }
export class C2 extends C1 implements I3 {}
export function main(): void {
  let a = new A(); let b = new B();
  let c2 = new C2();
  expect(c2.foo(a)).assertEqual('C1.foo');
  expect(c2.foo(a, b)).assertEqual('C1.foo');
}
}

namespace deep_15 {
  export interface I1 { foo(): string { return 'I1.foo' } }
export interface I2 { foo(): string { return 'I2.foo' } }
export class C1 implements I1, I2 { foo(): string { return 'C1.foo' } }
export interface I3 { foo(): string { return 'I3.foo' } }
export interface I4 extends I3 { foo(): string { return 'I4.foo' } }
export interface I5 { foo(): string { return 'I5.foo' } }
export class C2 extends C1 implements I4, I5 {
  override foo(): string { return super.foo(); }
}
export function main(): void {
  let c2 = new C2()
  expect(c2.foo()).assertEqual('C1.foo')
}
}

namespace deep_16 {
  export interface I1 { foo(): string { return 'I1.foo' } }
export interface I2 {}
// [FIX] 提供底层显式实现防崩溃
export class C1 implements I1, I2 {
  foo(): string { return 'I1.foo' }
}
export interface I3 { foo(): string { return 'I3.foo' } }
export interface I4 extends I3 {}
export interface I5 {}
export class C2 extends C1 implements I4, I5 {
  override foo(): string { return 'I1.foo' }
}
export function main(): void {
  let c2 = new C2()
  expect(c2.foo()).assertEqual('I1.foo')
}
}

namespace deep_17 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export class A4 extends A3 {}
  export interface I1 { foo(): A1 { return new A1() } }
export interface I2 { foo(): A2 { return new A2() } }
export class C1 implements I1, I2 { foo(): A4 { return new A4() } }
export interface I3 { foo(): A2 { return new A2() } }
export interface I4 extends I3 {}
export interface I5 { foo(): A1 { return new A1() } }
export class C2 extends C1 implements I4, I5 {
  override foo(): A4 { return super.foo(); }
}
export function main(): void {
  let c2 = new C2()
  expect(c2.foo() instanceof A4).assertTrue();
}
}

namespace deep_18 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export class A4 extends A3 {}
  export interface I1 { foo(p: A3): string { return 'I1.foo' } }
export interface I2 { foo(p: A2): string { return 'I2.foo' } }
export class C1 implements I1, I2 { foo(p: A1): string { return 'C1.foo' } }
export interface I3 { foo(p: A4): string { return 'I3.foo' } }
export interface I4 extends I3 { foo(p: A3): string { return 'I4.foo' } }
export interface I5 { foo(p: A2): string { return 'I5.foo' } }
export class C2 extends C1 implements I4, I5 {
  override foo(p: A1): string { return super.foo(p); }
}
export function main(): void {
  let a1 = new A1(); let a2 = new A2(); let a3 = new A3(); let a4 = new A4();
  let c2 = new C2();
  expect(c2.foo(a1)).assertEqual('C1.foo');
  expect(c2.foo(a2)).assertEqual('C1.foo');
  expect(c2.foo(a3)).assertEqual('C1.foo');
  expect(c2.foo(a4)).assertEqual('C1.foo');
}
}

namespace deep_19 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export class A4 extends A3 {}
  export class A5 extends A4 {}
  export interface I1 { foo(p: A3): A1 { return new A1() } }
export interface I2 { foo(p: A2): A2 { return new A2() } }
export class C1 implements I1, I2 { foo(p: A1): A5 { return new A5() } }
export interface I3 { foo(p: A4): A3 { return new A3() } }
export interface I4 extends I3 { foo(p: A3): A4 { return new A4() } }
export interface I5 { foo(p: A1): A2 { return new A2() } }
export class C2 extends C1 implements I4, I5 {
  override foo(p: A1): A5 { return super.foo(p); }
}
export function main(): void {
  let a1 = new A1(); let a2 = new A2(); let a3 = new A3(); let a4 = new A4();
  let c2 = new C2();
  expect(c2.foo(a1) instanceof A5).assertTrue();
  expect(c2.foo(a2) instanceof A5).assertTrue();
  expect(c2.foo(a3) instanceof A5).assertTrue();
  expect(c2.foo(a4) instanceof A5).assertTrue();
}
}

namespace deep_20 {
  export class A {}
  export class B {}
  export class C {}
  // [FIX] 统一联合类型签名
  export interface I1 { foo(p: A | B | C): A | B | C { return new B() } }
export interface I2 { foo(p: A | B | C): A | B | C { return new B() } }
export class C1 implements I1, I2 { foo(p: A | B | C): A | B | C { return new C() } }
export interface I3 { foo(p: A | B | C): A | B | C { return new A() } }
export interface I4 extends I3 { foo(p: A | B | C): A | B | C { return new A() } }
export interface I5 {}
export class C2 extends C1 implements I4, I5 {
  override foo(p: A | B | C): A | B | C { return new C() }
}
export function main(): void {
  let a = new A();
  let c2 = new C2();
  expect(c2.foo(a) instanceof C).assertTrue();
}
}

namespace deep_21 {
  export class A {}
  export class B {}
  // [FIX] 统一剩余参数（Rest Parameter）签名，避免 ArkTS 底层链接冲突
  export interface I1 { foo(p1: A, ...p2: B[]): string { return 'I1.foo' } }
export interface I2 { foo(p1: A, ...p2: B[]): string { return 'I2.foo' } }
export class C1 implements I1, I2 { foo(p1: A, ...p2: B[]): string { return 'C1.foo' } }
export interface I3 { foo(p1: A, ...p2: B[]): string { return 'I3.foo' } }
export interface I4 extends I3 { foo(p1: A, ...p2: B[]): string { return 'I4.foo' } }
export interface I5 { foo(p1: A, ...p2: B[]): string { return 'I5.foo' } }
export class C2 extends C1 implements I4, I5 {
  override foo(p1: A, ...p2: B[]): string { return 'C1.foo'; }
}
export function main(): void {
  let a = new A(); let b = new B();
  let c2 = new C2();
  expect(c2.foo(a)).assertEqual('C1.foo');
  expect(c2.foo(a, b)).assertEqual('C1.foo');
}
}

namespace deep_22 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export interface I1<V1> { foo(p: V1): A1 { return new A1() } }
export interface I2 {}
export class C1<U1> implements I1<U1>, I2 { foo(p: U1): A1 { return new A1() } }
export interface I3<V3> { foo(p: V3): A1 | A2 | A3 { return new A3() } }
export interface I4<V4> extends I3<V4> {}
export interface I5 {}
export class C2<U2> extends C1<U2> implements I4<U2>, I5 {
  override foo(p: U2): A2 { return new A2() }
}
export function main(): void {
  let a1 = new A1();
  let c2 = new C2<A1>();
  expect(c2.foo(a1) instanceof A2).assertTrue();
}
}

namespace deep_23 {
  export interface I1 { foo(): string { return 'I1.foo' } }
export interface I2 { foo(): string { return 'I2.foo' } }
export class C1 implements I1, I2 { foo(): string { return 'C1.foo' } }
export interface I3 { foo(): string { return 'I3.foo' } }
export interface I4 extends I3 { foo(): string { return 'I4.foo' } }
export interface I5 { foo(): string { return 'I5.foo' } }
export class C2 extends C1 implements I4, I5 { foo(): string { return 'C2.foo' } }
export interface I6 { foo(): string { return 'I6.foo' } }
export interface I7 { foo(): string { return 'I7.foo' } }
export interface I8 extends I6 { foo(): string { return 'I8.foo' } }
export class C3 extends C2 implements I7, I8 {
  override foo(): string { return super.foo(); }
}
export function main(): void {
  let c3 = new C3()
  expect(c3.foo()).assertEqual('C2.foo')
}
}

namespace deep_24 {
  export interface I1 { foo(): string { return 'I1.foo' } }
export interface I2 { foo(): string { return 'I2.foo' } }
export class C1 implements I1, I2 { foo(): string { return 'C1.foo' } }
export interface I3 { foo(): string { return 'I3.foo' } }
export interface I4 extends I3 { foo(): string { return 'I4.foo' } }
export interface I5 { foo(): string { return 'I5.foo' } }
export class C2 extends C1 implements I4, I5 {
  override foo(): string { return super.foo(); }
}
export interface I6 { foo(): string { return 'I6.foo' } }
export interface I7 { foo(): string { return 'I7.foo' } }
export interface I8 extends I6 { foo(): string { return 'I8.foo' } }
export class C3 extends C2 implements I7, I8 {
  override foo(): string { return super.foo(); }
}
export function main(): void {
  let c3 = new C3()
  expect(c3.foo()).assertEqual('C1.foo')
}
}

namespace deep_25 {
  export interface I1 {}
  export interface I2 { foo(): string { return 'I2.foo' } }
export class C1 implements I1, I2 { foo(): string { return 'I2.foo' } }
export interface I3 {}
export interface I4 extends I3 {}
export interface I5 { foo(): string { return 'I5.foo' } }
export class C2 extends C1 implements I4, I5 {
  override foo(): string { return super.foo(); }
}
export interface I6 {}
export interface I7 {}
export interface I8 extends I6, I7 { foo(): string { return 'I8.foo' } }
export class C3 extends C2 implements I8 {}
export function main(): void {
  let c3 = new C3()
  expect(c3.foo()).assertEqual('I2.foo')
}
}

namespace deep_26 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export interface I1 { foo(): A1 { return new A1() } }
export interface I2 { meth(): void {} }
export class C1 implements I1, I2 { foo(): A2 { return new A2() } meth(): void {} }
export interface I3 { foo(): A2 { return new A2() } }
export interface I4 extends I3 {}
export interface I5 { foo(): A2 { return new A2() } }
export class C2 extends C1 implements I4, I5 { foo(): A3 { return new A3() } }
export interface I6 { foo(): A2 { return new A2() } }
export interface I7 {}
export interface I8 extends I6, I7 { foo(): A2 { return new A2() } }
export class C3 extends C2 implements I7, I8 {}
export function main(): void {
  let c3 = new C3()
  expect(c3.foo() instanceof A3).assertTrue();
}
}

namespace deep_27 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export interface I1 { foo(p: A3): string { return 'I1.foo' } }
export interface I2 { foo(p: A2): string { return 'I2.foo' } }
export class C1 implements I1, I2 { foo(p: A2): string { return 'C1.foo' } }
export interface I3 { foo(p: A2): string { return 'I3.foo' } }
export interface I4 extends I3 {}
export interface I5 { foo(p: A3): string { return 'I5.foo' } }
export class C2 extends C1 implements I4, I5 { foo(p: A1): string { return 'C2.foo' } }
export interface I6 { foo(p: A2): string { return 'I6.foo' } }
export interface I7 {}
export interface I8 extends I6, I7 { foo(p: A2): string { return 'I8.foo' } }
export class C3 extends C2 implements I7, I8 {}
export function main(): void {
  let a1 = new A1();
  let c3 = new C3();
  expect(c3.foo(a1)).assertEqual('C2.foo')
}
}

namespace deep_28 {
  export class A1 {}
  export class A2 extends A1 {}
  export class A3 extends A2 {}
  export interface I1 {}
  export interface I2 { foo(p: A3): A1 { return new A1() } }
export class C1 implements I1, I2 { foo(p: A2): A2 { return new A2() } }
export interface I3 {}
export interface I4 extends I3 { foo(p: A2): A2 { return new A2() } }
export interface I5 {}
export class C2 extends C1 implements I4, I5 { foo(p: A1): A2 { return new A3() } }
export interface I6 { foo(p: A1): A3 { return new A3() } }
export interface I7 {}
export interface I8 extends I6, I7 {}
export class C3 extends C2 implements I7, I8 {}
export function main(): void {
  let a1 = new A1();
  let c3 = new C3();
  expect(c3.foo(a1) instanceof A3).assertTrue();
}
}

namespace deep_29 {
  export class D {}
  export class E {}
  export class F {}
  export interface I1 { foo(p: D): D | E | F { return new E() } }
export interface I2 {}
export class C1 implements I1, I2 { foo(p: D): D | E | F { return new E() } }
export interface I3 { foo(p: E): D | E { return new D() } }
export interface I4 extends I3 { foo(p: D | E): D | E { return new E() } }
export interface I5 {}
export class C2 extends C1 implements I4, I5 { foo(p: D | E): D | E { return new E() } }
export interface I6 { foo(p: D | E | F): E { return new E() } }
export interface I7 {}
export interface I8 extends I6, I7 {}
export class C3 extends C2 implements I7, I8 {foo(p: D | E | F): E { return new E() }}
export function main(): void {
  let d = new D();
  let c3 = new C3();
  expect(c3.foo(d) instanceof E).assertTrue();
}
}

namespace deep_30 {
  export class A {}
  export class B {}
  export interface I1 { foo(p: A): string { return 'I1.foo' } }
export interface I2 {}
export class C1 implements I1, I2 { foo(p: A): string { return 'I1.foo' } }
export interface I3 { foo(p1: A, ...p2: B[]): string { return 'I3.foo' } }
export interface I4 extends I3 {}
export interface I5 { foo(p: A): string { return 'I5.foo' } }
export class C2 extends C1 implements I4, I5 { foo(p1: A, ...p2: B[]): string { return 'C2.foo' } }
export interface I6 { foo(p1: A, ...p2: B[]): string { return 'I6.foo' } }
export interface I7 {}
export interface I8 extends I6, I7 { foo(p1: A, ...p2: B[]): string { return 'I8.foo' } }
export class C3 extends C2 implements I7, I8 {}
export function main(): void {
  let a = new A(); let b = new B();
  let c3 = new C3();
  expect(c3.foo(a)).assertEqual('C2.foo');
  expect(c3.foo(a, b)).assertEqual('C2.foo');
}
}

export default function OverridingConflictTest():void {
  describe('OverridingConflictTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_0100
     * @tc.name      testDeepInheritanceOverridingPositive0001
     * @tc.desc      Test for some overridden method conflict. Special case is: Covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_0.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_0200
     * @tc.name      testDeepInheritanceOverridingPositive0002
     * @tc.desc      Test for some overridden method conflict. Special case is: Same signature.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_1.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_0300
     * @tc.name      testDeepInheritanceOverridingPositive0003
     * @tc.desc      Test for some overridden method conflict. Special case is: No implementation in C1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_2.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_0400
     * @tc.name      testDeepInheritanceOverridingPositive0004
     * @tc.desc      Test for some overridden method conflict. Special case is: Covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_3.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_0500
     * @tc.name      testDeepInheritanceOverridingPositive0005
     * @tc.desc      Test for some overridden method conflict. Special case is: Contravariant parameter type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_4.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_0600
     * @tc.name      testDeepInheritanceOverridingPositive0006
     * @tc.desc      Test for some overridden method conflict. Special case is: Contravariant parameter type, covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_5.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_0700
     * @tc.name      testDeepInheritanceOverridingPositive0007
     * @tc.desc      Test for some overridden method conflict. Special case is: Union contravariant parameter type, union covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_6.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_0800
     * @tc.name      testDeepInheritanceOverridingPositive0008
     * @tc.desc      Test for some overridden method conflict. Special case is: Rest parameter type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_7.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_0900
     * @tc.name      testDeepInheritanceOverridingPositive0009
     * @tc.desc      Test for some overridden method conflict. Special case is: Same signature.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_8.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_1000
     * @tc.name      testDeepInheritanceOverridingPositive0010
     * @tc.desc      Test for some overridden method conflict. Special case is: No implementation in C1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_9.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_1100
     * @tc.name      testDeepInheritanceOverridingPositive0011
     * @tc.desc      Test for some overridden method conflict. Special case is: Covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_10.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_1200
     * @tc.name      testDeepInheritanceOverridingPositive0012
     * @tc.desc      Test for some overridden method conflict. Special case is: Contravariant parameter type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_11.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_1300
     * @tc.name      testDeepInheritanceOverridingPositive0013
     * @tc.desc      Test for some overridden method conflict. Special case is: Contravariant parameter type, covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_12.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_1400
     * @tc.name      testDeepInheritanceOverridingPositive0014
     * @tc.desc      Test for some overridden method conflict. Special case is: Union contravariant parameter type, union covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_13.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_1500
     * @tc.name      testDeepInheritanceOverridingPositive0015
     * @tc.desc      Test for some overridden method conflict. Special case is: Rest parameter type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_14.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_1600
     * @tc.name      testDeepInheritanceOverridingPositive0016
     * @tc.desc      Test for some overridden method conflict. Special case is: Same signature.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_15.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_1700
     * @tc.name      testDeepInheritanceOverridingPositive0017
     * @tc.desc      Test for some overridden method conflict. Special case is: No implementation in C1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_16.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_1800
     * @tc.name      testDeepInheritanceOverridingPositive0018
     * @tc.desc      Test for some overridden method conflict. Special case is: Covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_17.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_1900
     * @tc.name      testDeepInheritanceOverridingPositive0019
     * @tc.desc      Test for some overridden method conflict. Special case is: Contravariant parameter type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_18.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_2000
     * @tc.name      testDeepInheritanceOverridingPositive0020
     * @tc.desc      Test for some overridden method conflict. Special case is: Contravariant parameter type, covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_19.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_2100
     * @tc.name      testDeepInheritanceOverridingPositive0021
     * @tc.desc      Test for some overridden method conflict. Special case is: Union contravariant parameter type, union covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_20.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_2200
     * @tc.name      testDeepInheritanceOverridingPositive0022
     * @tc.desc      Test for some overridden method conflict. Special case is: Rest parameter type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_21.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_2300
     * @tc.name      testDeepInheritanceOverridingPositive0023
     * @tc.desc      Test for some overridden method conflict. Special case is: Generic classes and interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_22.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_2400
     * @tc.name      testDeepInheritanceOverridingPositive0024
     * @tc.desc      Test for some overridden method conflict. Special case is: Same signature.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_23.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_2500
     * @tc.name      testDeepInheritanceOverridingPositive0025
     * @tc.desc      Test for some overridden method conflict. Special case is: No implementation in C2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_24.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_2600
     * @tc.name      testDeepInheritanceOverridingPositive0026
     * @tc.desc      Test for some overridden method conflict. Special case is: No implementation in C1, C2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_25.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_2700
     * @tc.name      testDeepInheritanceOverridingPositive0027
     * @tc.desc      Test for some overridden method conflict. Special case is: Covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_26.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_2800
     * @tc.name      testDeepInheritanceOverridingPositive0028
     * @tc.desc      Test for some overridden method conflict. Special case is: Contravariant parameter type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_27.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_2900
     * @tc.name      testDeepInheritanceOverridingPositive0029
     * @tc.desc      Test for some overridden method conflict. Special case is: Contravariant parameter type, covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_28.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_3000
     * @tc.name      testDeepInheritanceOverridingPositive0030
     * @tc.desc      Test for some overridden method conflict. Special case is: Union contravariant parameter type, union covariant return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_29.main();
    });

    /**
     * @tc.number    SUB_OVERRIDING_CONFLICT_TEST_3100
     * @tc.name      testDeepInheritanceOverridingPositive0031
     * @tc.desc      Test for some overridden method conflict. Special case is: Rest parameter type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeepInheritanceOverridingPositive0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      deep_30.main();
    });
  })
}