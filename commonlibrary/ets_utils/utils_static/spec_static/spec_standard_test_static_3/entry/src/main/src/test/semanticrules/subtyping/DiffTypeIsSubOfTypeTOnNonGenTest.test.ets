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

namespace testNS1_1 {
  class Animal {}
  class Cat extends Animal {v: string = "cat"}
  class Dog extends Animal {v: bigint = 123n}
  class Frog extends Animal {v: number = 5}
  function check_cat(a: object) {
    expect(a instanceof Cat).assertTrue()
    expect((a as Cat).v).assertEqual("cat")
  }
  function check_dog(a: object) {
    expect(a instanceof Dog).assertTrue()
    expect((a as Dog).v).assertEqual(123n)
  }
  function check_frog(a: object) {
    expect(a instanceof Frog).assertTrue()
    expect((a as Frog).v).assertEqual(5)
  }
  function check_number(a: object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(7.8)
  }
  function foo(v: Frog | number | Cat | Dog | number): void {
    expect(v instanceof Cat || v instanceof Dog ||
      v instanceof Frog || typeof v === 'number').assertTrue()
  }
  function f1(v: Cat | Dog | Frog | number): number {
    expect(v instanceof Frog || typeof v === 'number' ||
      v instanceof Cat || v instanceof Dog || typeof v === 'number').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Cat | Dog | Frog | number): number {
    if (typeof v === 'number' || v instanceof Dog) {
      check_dog(v)
      return 1
    }
    else {
      expect(v instanceof Cat || v instanceof Dog || v instanceof Frog || typeof v === 'number').assertTrue()
      expect(v instanceof Frog || typeof v === 'number' ||
        v instanceof Cat || v instanceof Dog || typeof v === 'number').assertTrue()
      foo(v)
      check_cat(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new Dog())
    expect(res).assertEqual(1)
    res = f1(new Cat())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_1 {
  class Animal {}
  class Cat extends Animal {v: string = "cat"}
  class Dog extends Animal {v: bigint = 123n}
  class Frog extends Animal {v: number = 5}
  function check_cat(a: object) {
    expect(a instanceof Cat).assertTrue()
    expect((a as Cat).v).assertEqual("cat")
  }
  function check_dog(a: object) {
    expect(a instanceof Dog).assertTrue()
    expect((a as Dog).v).assertEqual(123n)
  }
  function check_frog(a: object) {
    expect(a instanceof Frog).assertTrue()
    expect((a as Frog).v).assertEqual(5)
  }
  function check_number(a: object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(7.8)
  }
  function foo(v: Animal | number): void {
    expect(v instanceof Cat || v instanceof Dog || v instanceof Frog || typeof v === 'number').assertTrue()
  }
  function f1(v: Cat | Dog | Frog | number): number {
    expect(v instanceof Animal || typeof v === 'number').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Cat | Dog | Frog | number): number {
    if (typeof v === 'number' || v instanceof Dog) {
      check_number(v)
      return 1
    }
    else {
      expect(v instanceof Cat || v instanceof Dog || v instanceof Frog || typeof v === 'number').assertTrue()
      expect(v instanceof Animal || typeof v === 'number').assertTrue()
      foo(v)
      check_frog(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(7.8)
    res = f1(new Frog())
    expect(res).assertEqual(2)
    return true
  }
}

class Animal_1 {}
class Cat_1 extends Animal_1 {v: string = "cat"}
class Dog_1 extends Animal_1 {v: bigint = 123n}
class Frog_1 extends Animal_1 {v: number = 5}
function check_cat_1(a: object) {
  expect(a instanceof Cat_1).assertTrue()
  expect((a as Cat_1).v).assertEqual("cat")
}
function check_dog_1(a: object) {
  expect(a instanceof Dog_1).assertTrue()
  expect((a as Dog_1).v).assertEqual(123n)
}
function check_frog_1(a: object) {
  expect(a instanceof Frog_1).assertTrue()
  expect((a as Frog_1).v).assertEqual(5)
}
function check_number_1(a: object) {
  expect(typeof a === 'number').assertTrue()
  expect(a as number).assertEqual(7.8)
}
function foo_1(v: Frog_1 | number | Cat_1 | Dog_1 | number): void {
  expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || typeof v === 'number').assertTrue()
}
function f1_1(v: Cat_1 | Dog_1 | Frog_1 | number): number {
  expect(v instanceof Frog_1 || typeof v === 'number' ||
    v instanceof Cat_1 || v instanceof Dog_1 || typeof v === 'number').assertTrue()
  foo_1(v)
  return f2_1(v)
}
function f2_1(v: Cat_1 | Dog_1 | Frog_1 | number): number {
  if (typeof v === 'number' || v instanceof Dog_1) {
    check_dog_1(v)
    return 1
  }
  else {
    expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || typeof v === 'number').assertTrue()
    expect(v instanceof Frog_1 || typeof v === 'number' ||
      v instanceof Cat_1 || v instanceof Dog_1 || typeof v === 'number').assertTrue()
    foo_1(v)
    check_cat_1(v)
    return 2
  }
}

namespace testNS1_2 {
  class Animal {}
  class Cat extends Animal {v: string = "cat"}
  class Dog extends Animal {v: bigint = 123n}
  class Frog extends Animal {v: number = 5}
  function check_cat(a: object) {
    expect(a instanceof Cat).assertTrue()
    expect((a as Cat).v).assertEqual("cat")
  }
  function check_dog(a: object) {
    expect(a instanceof Dog).assertTrue()
    expect((a as Dog).v).assertEqual(123n)
  }
  function check_frog(a: object) {
    expect(a instanceof Frog).assertTrue()
    expect((a as Frog).v).assertEqual(5)
  }
  function check_number(a: object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(7.8)
  }
  function foo(v: Frog | number | Cat | Dog | number): void {
    expect(v instanceof Cat || v instanceof Dog || v instanceof Frog || typeof v === 'number').assertTrue()
  }
  function f1(v: Cat | Dog | Frog | number): number {
    if (v instanceof Frog || typeof v === 'number' || v instanceof Cat || v instanceof Dog || typeof v === 'number') {
      foo(v)
      return f2(v)
    }
    else {
      return 0
    }
  }
  function f2(v: Cat | Dog | Frog | number): number {
    if (typeof v === 'number' || v instanceof Dog) {
      check_dog(v)
      return 1
    }
    else {
      expect(v instanceof Cat || v instanceof Dog || v instanceof Frog || typeof v === 'number').assertTrue()
      expect(v instanceof Frog || typeof v === 'number' ||
        v instanceof Cat || v instanceof Dog || typeof v === 'number').assertTrue()
      foo(v)
      check_cat(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new Dog())
    expect(res).assertEqual(1)
    res = f1(new Cat())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_2 {
  class Animal {}
  class Cat extends Animal {v: string = "cat"}
  class Dog extends Animal {v: bigint = 123n}
  class Frog extends Animal {v: number = 5}
  function check_cat(a: object) {
    expect(a instanceof Cat).assertTrue()
    expect((a as Cat).v).assertEqual("cat")
  }
  function check_dog(a: object) {
    expect(a instanceof Dog).assertTrue()
    expect((a as Dog).v).assertEqual(123n)
  }
  function check_frog(a: object) {
    expect(a instanceof Frog).assertTrue()
    expect((a as Frog).v).assertEqual(5)
  }
  function check_number(a: object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(7.8)
  }
  function foo(v: Animal | number): void {
    expect(v instanceof Cat || v instanceof Dog || v instanceof Frog || typeof v === 'number').assertTrue()
  }
  function f1(v: Cat | Dog | Frog | number): number {
    if (v instanceof Animal || typeof v === 'number') {
      foo(v)
      return f2(v)
    }
    else {
      return 0
    }
  }
  function f2(v: Cat | Dog | Frog | number): number {
    if (typeof v === 'number' || v instanceof Dog) {
      check_number(v)
      return 1
    }
    else {
      expect(v instanceof Cat || v instanceof Dog || v instanceof Frog || typeof v === 'number').assertTrue()
      expect(v instanceof Animal || typeof v === 'number').assertTrue()
      foo(v)
      check_frog(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(7.8)
    expect(res).assertEqual(1)
    res = f1(new Frog())
    expect(res).assertEqual(2)
    return true
  }
}

class Animal_2 {}
class Cat_2 extends Animal_2 {v: string = "cat"}
class Dog_2 extends Animal_2 {v: bigint = 123n}
class Frog_2 extends Animal_2 {v: number = 5}
function check_cat_2(a: object) {
  expect(a instanceof Cat_2).assertTrue()
  expect((a as Cat_2).v).assertEqual("cat")
}
function check_dog_2(a: object) {
  expect(a instanceof Dog_2).assertTrue()
  expect((a as Dog_2).v).assertEqual(123n)
}
function check_frog_2(a: object) {
  expect(a instanceof Frog_2).assertTrue()
  expect((a as Frog_2).v).assertEqual(5)
}
function check_number_2(a: object) {
  expect(typeof a === 'number').assertTrue()
  expect(a as number).assertEqual(7.8)
}
function foo_2(v: Frog_2 | number | Cat_2 | Dog_2 | number): void {
  expect(v instanceof Cat_2 || v instanceof Dog_2 || v instanceof Frog_2 || typeof v === 'number').assertTrue()
}
function f1_2(v: Cat_2 | Dog_2 | Frog_2 | number): number {
  if (v instanceof Frog_2 || typeof v === 'number' ||
    v instanceof Cat_2 || v instanceof Dog_2 || typeof v === 'number') {
    foo_2(v)
    return f2_2(v)
  }
  else {
    return 0
  }
}
function f2_2(v: Cat_2 | Dog_2 | Frog_2 | number): number {
  if (typeof v === 'number' || v instanceof Dog_2) {
    check_dog_2(v)
    return 1
  }
  else {
    expect(v instanceof Cat_2 || v instanceof Dog_2 || v instanceof Frog_2 || typeof v === 'number').assertTrue()
    expect(v instanceof Frog_2 || typeof v === 'number' ||
      v instanceof Cat_2 || v instanceof Dog_2 || typeof v === 'number').assertTrue()
    foo_2(v)
    check_cat_2(v)
    return 2
  }
}

namespace testNS1_3 {
  abstract class A {}
  abstract class B1 extends A {}
  class B2 extends A {v: bigint = 123n}
  class C1 extends B1 {v: number = 321}
  class C2 extends B1 {v: number = 6.7}
  class Other {v: string = "other"}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(321)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(6.7)
  }
  function check_B2(a: object) {
    expect(a instanceof B2).assertTrue()
    expect((a as B2).v).assertEqual(123n)
  }
  function check_Other(a: object) {
    expect(a instanceof Other).assertTrue()
    expect((a as Other).v).assertEqual("other")
  }
  function foo(v: B2 | Other | C1 | C2 | number): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue()
  }
  function f1(v: C1 | C2 | B2 | Other): number {
    expect(v instanceof B2 || v instanceof Other || v instanceof C1 ||
      v instanceof C2 || typeof v === 'number').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: C1 | C2 | B2 | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C1(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue()
      expect(v instanceof B2 || v instanceof Other || v instanceof C1 ||
        v instanceof C2 || typeof v === 'number').assertTrue()
      foo(v)
      check_B2(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C1())
    expect(res).assertEqual(1)
    res = f1(new B2())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_3 {
  abstract class A {}
  abstract class B1 extends A {}
  class B2 extends A {v: bigint = 123n}
  class C1 extends B1 {v: number = 321}
  class C2 extends B1 {v: number = 6.7}
  class Other {v: string = "other"}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(321)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(6.7)
  }
  function check_B2(a: object) {
    expect(a instanceof B2).assertTrue()
    expect((a as B2).v).assertEqual(123n)
  }
  function check_Other(a: object) {
    expect(a instanceof Other).assertTrue()
    expect((a as Other).v).assertEqual("other")
  }
  function foo(v: B1 | B2 | Other): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue()
  }
  function f1(v: C1 | C2 | B2 | Other): number {
    expect(v instanceof B1 || v instanceof B2 || v instanceof Other).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: C1 | C2 | B2 | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C2(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue()
      expect(v instanceof B1 || v instanceof B2 || v instanceof Other).assertTrue()
      foo(v)
      check_B2(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C2())
    expect(res).assertEqual(1)
    res = f1(new B2())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS3_3 {
  abstract class A {}
  abstract class B1 extends A {}
  class B2 extends A {v: bigint = 123n}
  class C1 extends B1 {v: number = 321}
  class C2 extends B1 {v: number = 6.7}
  class Other {v: string = "other"}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(321)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(6.7)
  }
  function check_B2(a: object) {
    expect(a instanceof B2).assertTrue()
    expect((a as B2).v).assertEqual(123n)
  }
  function check_Other(a: object) {
    expect(a instanceof Other).assertTrue()
    expect((a as Other).v).assertEqual("other")
  }
  function foo(v: A | Other): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue()
  }
  function f1(v: C1 | C2 | B2 | Other): number {
    expect(v instanceof A || v instanceof Other).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: C1 | C2 | B2 | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_Other(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue()
      expect(v instanceof A || v instanceof Other).assertTrue()
      foo(v)
      check_B2(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new Other())
    expect(res).assertEqual(1)
    res = f1(new B2())
    expect(res).assertEqual(2)
    return true
  }
}

abstract class A_3 {}
abstract class B1_3 extends A_3 {}
class B2_3 extends A_3 {v: bigint = 123n}
class C1_3 extends B1_3 {v: number = 321}
class C2_3 extends B1_3 {v: number = 6.7}
class Other_3 {v: string = "other"}
function check_C1_3(a: object) {
  expect(a instanceof C1_3).assertTrue()
  expect((a as C1_3).v).assertEqual(321)
}
function check_C2_3(a: object) {
  expect(a instanceof C2_3).assertTrue()
  expect((a as C2_3).v).assertEqual(6.7)
}
function check_B2_3(a: object) {
  expect(a instanceof B2_3).assertTrue()
  expect((a as B2_3).v).assertEqual(123n)
}
function check_Other_3(a: object) {
  expect(a instanceof Other_3).assertTrue()
  expect((a as Other_3).v).assertEqual("other")
}
function foo_3(v: B2_3 | Other_3 | C1_3 | C2_3 | number): void {
  expect(v instanceof C1_3 || v instanceof C2_3 || v instanceof B2_3 || v instanceof Other_3).assertTrue()
}
function f1_3(v: C1_3 | C2_3 | B2_3 | Other_3): number {
  expect(v instanceof B2_3 || v instanceof Other_3 || v instanceof C1_3 ||
    v instanceof C2_3 || typeof v === 'number').assertTrue()
  foo_3(v)
  return f2_3(v)
}
function f2_3(v: C1_3 | C2_3 | B2_3 | Other_3): number {
  if (v instanceof B1_3 || v instanceof Other_3) {
    check_C1_3(v)
    return 1
  }
  else {
    expect(v instanceof C1_3 || v instanceof C2_3 || v instanceof B2_3 || v instanceof Other_3).assertTrue()
    expect(v instanceof B2_3 || v instanceof Other_3 || v instanceof C1_3 ||
      v instanceof C2_3 || typeof v === 'number').assertTrue()
    foo_3(v)
    check_B2_3(v)
    return 2
  }
}

namespace testNS1_4 {
  abstract class A {}
  abstract class B1 extends A {}
  class B2 extends A {v: bigint = 123n}
  class C1 extends B1 {v: number = 321}
  class C2 extends B1 {v: number = 6.7}
  class Other {v: string = "other"}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(321)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(6.7)
  }
  function check_B2(a: object) {
    expect(a instanceof B2).assertTrue()
    expect((a as B2).v).assertEqual(123n)
  }
  function check_Other(a: object) {
    expect(a instanceof Other).assertTrue()
    expect((a as Other).v).assertEqual("other")
  }
  function foo(v: B2 | Other | C1 | C2 | number): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue()
  }
  function f1(v: C1 | C2 | B2 | Other): number {
    if (v instanceof B2 || v instanceof Other || v instanceof C1 || v instanceof C2 || typeof v === 'number') {
      foo(v)
      return f2(v)
    }
    else {
      return 0
    }
  }
  function f2(v: C1 | C2 | B2 | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C1(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue()
      expect(v instanceof B2 || v instanceof Other || v instanceof C1 ||
        v instanceof C2 || typeof v === 'number').assertTrue()
      foo(v)
      check_B2(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C1())
    expect(res).assertEqual(1)
    res = f1(new B2())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_4 {
  abstract class A {}
  abstract class B1 extends A {}
  class B2 extends A {v: bigint = 123n}
  class C1 extends B1 {v: number = 321}
  class C2 extends B1 {v: number = 6.7}
  class Other {v: string = "other"}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(321)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(6.7)
  }
  function check_B2(a: object) {
    expect(a instanceof B2).assertTrue()
    expect((a as B2).v).assertEqual(123n)
  }
  function check_Other(a: object) {
    expect(a instanceof Other).assertTrue()
    expect((a as Other).v).assertEqual("other")
  }
  function foo(v: B1 | B2 | Other): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue()
  }
  function f1(v: C1 | C2 | B2 | Other): number {
    if (v instanceof B1 || v instanceof B2 || v instanceof Other) {
      foo(v)
      return f2(v)
    }
    else {
      return 0
    }
  }

  function f2(v: B1 | B2 | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C2(v)
      return 1
    }
    else {
      expect(v instanceof B2).assertTrue()
      expect(v instanceof B1 || v instanceof B2 || v instanceof Other).assertTrue()
      foo(v)
      check_B2(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C2())
    expect(res).assertEqual(1)
    res = f1(new B2())
    expect(res).assertEqual(2)
    return true
  }
}

abstract class A_4 {}
abstract class B1_4 extends A_4 {}
class B2_4 extends A_4 {v: bigint = 123n}
class C1_4 extends B1_4 {v: number = 321}
class C2_4 extends B1_4 {v: number = 6.7}
class Other_4 {v: string = "other"}
function check_C1_4(a: object) {
  expect(a instanceof C1_4).assertTrue()
  expect((a as C1_4).v).assertEqual(321)
}
function check_C2_4(a: object) {
  expect(a instanceof C2_4).assertTrue()
  expect((a as C2_4).v).assertEqual(6.7)
}
function check_B2_4(a: object) {
  expect(a instanceof B2_4).assertTrue()
  expect((a as B2_4).v).assertEqual(123n)
}
function check_Other_4(a: object) {
  expect(a instanceof Other_4).assertTrue()
  expect((a as Other_4).v).assertEqual("other")
}
function foo_4(v: B1_4 | B2_4 | Other_4 | number): void {
  expect(v instanceof C1_4 || v instanceof C2_4 || v instanceof B2_4 || v instanceof Other_4).assertTrue()
}
function f1_4(v: C1_4 | C2_4 | B2_4 | Other_4): number {
  if (v instanceof B2_4 || v instanceof Other_4 || v instanceof C1_4 || v instanceof C2_4 || typeof v === 'number') {
    foo_4(v)
    return f2_4(v)
  }
  else {
    return 0
  }
}
function f2_4(v: B1_4 | B2_4 | Other_4): number {
  if (v instanceof B1_4 || v instanceof Other_4) {
    check_C1_4(v)
    return 1
  }
  else {
    expect(v instanceof B2_4).assertTrue()
    expect(v instanceof B2_4 || v instanceof Other_4 || v instanceof C1_4 ||
      v instanceof C2_4 || typeof v === 'number').assertTrue()
    foo_4(v)
    check_B2_4(v)
    return 2
  }
}
namespace testNS3_4 {
  abstract class A {}
  abstract class B1 extends A {}
  class B2 extends A {v: bigint = 123n}
  class C1 extends B1 {v: number = 321}
  class C2 extends B1 {v: number = 6.7}
  class Other {v: string = "other"}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(321)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(6.7)
  }
  function check_B2(a: object) {
    expect(a instanceof B2).assertTrue()
    expect((a as B2).v).assertEqual(123n)
  }
  function check_Other(a: object) {
    expect(a instanceof Other).assertTrue()
    expect((a as Other).v).assertEqual("other")
  }
  function foo(v: A | Other): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue()
  }
  function f1(v: C1 | C2 | B2 | Other): number {
    if (v instanceof A || v instanceof Other) {
      foo(v)
      return f2(v)
    }
    else {
      return 0
    }
  }
  // ========= 修改点：f2 的参数类型从 C1|C2|B2|Other 改为 A|Other =========
  function f2(v: A | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_Other(v)
      return 1
    }
    else {
      // 此时 v 只能是 B2
      expect(v instanceof B2).assertTrue()
      expect(v instanceof A || v instanceof Other).assertTrue()
      foo(v)
      check_B2(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new Other())
    expect(res).assertEqual(1)
    res = f1(new B2())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS1_5 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(123n)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(321)
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue()
    expect((a as C3).v).assertEqual(7.8)
  }
  function foo(v: III1 | II2 | III2 | number): void {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue()
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2 || typeof v === 'number').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1 implemented by C1 and C2
      check_C1(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue()
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2 || typeof v === 'number').assertTrue()
      foo(v)
      check_C3(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C1())
    expect(res).assertEqual(1)
    res = f1(new C3())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_5 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(123n)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(321)
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue()
    expect((a as C3).v).assertEqual(7.8)
  }
  function foo(v: II1 | II2): void {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue()
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1
      check_C2(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue()
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue()
      foo(v)
      check_C3(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C2())
    expect(res).assertEqual(1)
    res = f1(new C3())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS3_5 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(123n)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(321)
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue()
    expect((a as C3).v).assertEqual(7.8)
  }
  function foo(v: I1 | I2): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1
      check_C1(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
      foo(v)
      check_C3(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C1())
    expect(res).assertEqual(1)
    res = f1(new C3())
    expect(res).assertEqual(2)
    return true
  }
}

interface I1_5 {}
interface I2_5 {}
interface II1_5 extends I1_5, I2_5 {}
interface II2_5 extends I1_5, I2_5 {}
interface III1_5 extends II1_5 {}
interface III2_5 extends II1_5 {}
class C1_5 implements III1_5 {v: bigint = 123n}
class C2_5 implements III2_5 {v: number = 321}
class C3_5 implements II2_5 {v: number = 7.8}
function check_C1_5(a: object) {
  expect(a instanceof C1_5).assertTrue()
  expect((a as C1_5).v).assertEqual(123n)
}
function check_C2_5(a: object) {
  expect(a instanceof C2_5).assertTrue()
  expect((a as C2_5).v).assertEqual(321)
}
function check_C3_5(a: object) {
  expect(a instanceof C3_5).assertTrue()
  expect((a as C3_5).v).assertEqual(7.8)
}
function foo_5(v: III1_5 | II2_5 | III2_5 | number): void {
  expect(v instanceof C1_5 || v instanceof C2_5 || v instanceof C3_5).assertTrue()
}
function f1_5(v: III1_5 | III2_5 | II2_5): number {
  expect(v instanceof C1_5 || v instanceof C3_5 || v instanceof C2_5 || typeof v === 'number').assertTrue()
  foo_5(v)
  return f2_5(v)
}
function f2_5(v: III1_5 | III2_5 | II2_5): number {
  if (v instanceof C1_5 || v instanceof C2_5) { // II1_5
    check_C1_5(v)
    return 1
  }
  else {
    expect(v instanceof C1_5 || v instanceof C2_5 || v instanceof C3_5).assertTrue()
    expect(v instanceof C1_5 || v instanceof C3_5 || v instanceof C2_5 || typeof v === 'number').assertTrue()
    foo_5(v)
    check_C3_5(v)
    return 2
  }
}

namespace testNS1_6 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(123n)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(321)
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue()
    expect((a as C3).v).assertEqual(7.8)
  }
  function foo(v: III1 | II2 | III2 | number): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C3 || v instanceof C2) {
      foo(v)
      return f2(v)
    }
    else {
      return 0
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1
      check_C1(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2 || typeof v === 'number').assertTrue()
      foo(v)
      check_C3(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C1())
    expect(res).assertEqual(1)
    res = f1(new C3())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_6 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(123n)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(321)
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue()
    expect((a as C3).v).assertEqual(7.8)
  }
  function foo(v: II1 | II2): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C3 || v instanceof C2) {
      foo(v)
      return f2(v)
    }
    else {
      return 0
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1
      check_C2(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue()
      foo(v)
      check_C3(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C2())
    expect(res).assertEqual(1)
    res = f1(new C3())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS3_6 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(123n)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(321)
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue()
    expect((a as C3).v).assertEqual(7.8)
  }
  function foo(v: I1 | I2): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v)
      return f2(v)
    }
    else {
      return 0
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1
      check_C1(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
      foo(v)
      check_C3(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C1())
    expect(res).assertEqual(1)
    res = f1(new C3())
    expect(res).assertEqual(2)
    return true
  }
}

interface I1_6 {}
interface I2_6 {}
interface II1_6 extends I1_6, I2_6 {}
interface II2_6 extends I1_6, I2_6 {}
interface III1_6 extends II1_6 {}
interface III2_6 extends II1_6 {}
class C1_6 implements III1_6 {v: bigint = 123n}
class C2_6 implements III2_6 {v: number = 321}
class C3_6 implements II2_6 {v: number = 7.8}
function check_C1_6(a: object) {
  expect(a instanceof C1_6).assertTrue()
  expect((a as C1_6).v).assertEqual(123n)
}
function check_C2_6(a: object) {
  expect(a instanceof C2_6).assertTrue()
  expect((a as C2_6).v).assertEqual(321)
}
function check_C3_6(a: object) {
  expect(a instanceof C3_6).assertTrue()
  expect((a as C3_6).v).assertEqual(7.8)
}
function foo_6(v: III1_6 | II2_6 | III2_6 | number): void {
  expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof C3_6).assertTrue()
}
function f1_6(v: III1_6 | III2_6 | II2_6): number {
  if (v instanceof C1_6 || v instanceof C3_6 || v instanceof C2_6) {
    foo_6(v)
    return f2_6(v)
  }
  else {
    return 0
  }
}
function f2_6(v: III1_6 | III2_6 | II2_6): number {
  if (v instanceof C1_6 || v instanceof C2_6) { // II1_6
    check_C1_6(v)
    return 1
  }
  else {
    expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof C3_6).assertTrue()
    expect(v instanceof C1_6 || v instanceof C3_6 || v instanceof C2_6 || typeof v === 'number').assertTrue()
    foo_6(v)
    check_C3_6(v)
    return 2
  }
}

namespace testNS1_7 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(123n)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(321)
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue()
    expect((a as C3).v).assertEqual(7.8)
  }
  function foo(v: I1): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1 check
      check_C2(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
      foo(v)
      check_C3(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C2())
    expect(res).assertEqual(1)
    res = f1(new C3())
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_7 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue()
    expect((a as C1).v).assertEqual(123n)
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue()
    expect((a as C2).v).assertEqual(321)
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue()
    expect((a as C3).v).assertEqual(7.8)
  }
  function foo(v: I2): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1 check
      check_C1(v)
      return 1
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue()
      foo(v)
      check_C3(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(new C1())
    expect(res).assertEqual(1)
    res = f1(new C3())
    expect(res).assertEqual(2)
    return true
  }
}

interface I1_7 {}
interface I2_7 {}
interface II1_7 extends I1_7, I2_7 {}
interface II2_7 extends I1_7, I2_7 {}
interface III1_7 extends II1_7 {}
interface III2_7 extends II1_7 {}
class C1_7 implements III1_7 {v: bigint = 123n}
class C2_7 implements III2_7 {v: number = 321}
class C3_7 implements II2_7 {v: number = 7.8}
function check_C1_7(a: object) {
  expect(a instanceof C1_7).assertTrue()
  expect((a as C1_7).v).assertEqual(123n)
}
function check_C2_7(a: object) {
  expect(a instanceof C2_7).assertTrue()
  expect((a as C2_7).v).assertEqual(321)
}
function check_C3_7(a: object) {
  expect(a instanceof C3_7).assertTrue()
  expect((a as C3_7).v).assertEqual(7.8)
}
function foo_7(v: I1_7): void {
  expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof C3_7).assertTrue()
}
function f1_7(v: III1_7 | III2_7 | II2_7): number {
  expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof C3_7).assertTrue()
  foo_7(v)
  return f2_7(v)
}
function f2_7(v: III1_7 | III2_7 | II2_7): number {
  if (v instanceof C1_7 || v instanceof C2_7) { // II1_7 check
    check_C2_7(v)
    return 1
  }
  else {
    expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof C3_7).assertTrue()
    expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof C3_7).assertTrue()
    foo_7(v)
    check_C3_7(v)
    return 2
  }
}
export default function DiffTypeIsSubOfTypeTOnNonGenTest(): void {
  describe('DiffTypeIsSubOfTypeTOnNonGenTest', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0100
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0001
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0001';
      let res: number = f1_1(new Dog_1())
      expect(res).assertEqual(1)
      res = f1_1(new Cat_1())
      expect(res).assertEqual(2)
      expect(testNS1_1.runTest()).assertTrue()
      expect(testNS2_1.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0200
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0002
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0002';
      let res: number = f1_2(new Dog_2())
      expect(res).assertEqual(1)
      res = f1_2(new Cat_2())
      expect(res).assertEqual(2)
      expect(testNS1_2.runTest()).assertTrue()
      expect(testNS2_2.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0300
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0003
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0003';
      let res: number = f1_3(new C1_3())
      expect(res).assertEqual(1)
      res = f1_3(new B2_3())
      expect(res).assertEqual(2)
      expect(testNS1_3.runTest()).assertTrue()
      expect(testNS2_3.runTest()).assertTrue()
      expect(testNS3_3.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0400
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0004
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0004';
      let res: number = f1_4(new C1_4())
      expect(res).assertEqual(1)
      res = f1_4(new B2_4())
      expect(res).assertEqual(2)
      expect(testNS1_4.runTest()).assertTrue()
      expect(testNS2_4.runTest()).assertTrue()
      expect(testNS3_4.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0500
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0005
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0005';
      let res: number = f1_5(new C1_5())
      expect(res).assertEqual(1)
      res = f1_5(new C3_5())
      expect(res).assertEqual(2)
      expect(testNS1_5.runTest()).assertTrue()
      expect(testNS2_5.runTest()).assertTrue()
      expect(testNS3_5.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0600
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0006
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0006';
      let res: number = f1_6(new C1_6())
      expect(res).assertEqual(1)
      res = f1_6(new C3_6())
      expect(res).assertEqual(2)
      expect(testNS1_6.runTest()).assertTrue()
      expect(testNS2_6.runTest()).assertTrue()
      expect(testNS3_6.runTest()).assertTrue()
    });


    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0700
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0007
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0007';
      let res: number = f1_7(new C2_7())
      expect(res).assertEqual(1)
      res = f1_7(new C3_7())
      expect(res).assertEqual(2)
      expect(testNS1_7.runTest()).assertTrue()
      expect(testNS2_7.runTest()).assertTrue()
    });
  })
}