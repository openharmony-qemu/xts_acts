'use static';
/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

let res = 0

function foo() {
  return ++res
}

class A {
  fld: int = foo()

  constructor(a: boolean) {} // primary

  constructor() {  // secondary
    this(true)
  }

  constructor(a: number) { // secondary
    this()
  }
}

let res1 = 0

function foo1() {
  return ++res1
}

class A1 {
  fld: int = foo1()
}

class B extends A1 {
  constructor(a: boolean) { // primary
    super()
  }

  constructor() {  // secondary
    this(true)
  }

  constructor(a: number) { // secondary
    this()
  }
}

let res2 = 0

function foo2() {
  return ++res2
}

class A2 {
  fld: int = foo2()
}

class B1 extends A2 {
  fld: int = foo2()  // re-defined field

  constructor(a: boolean) { // primary
    super()
  }

  constructor() {  // secondary
    this(true)
  }

  constructor(a: number) { // secondary
    this()
  }
}

let res3 = 0

function foo3() {
  return ++res3
}

class A3 {
  fld: int = foo3()

  constructor(a: boolean) {} // primary

  constructor() {  // secondary
    this(true)
  }

  constructor(a: number) { // secondary
    this()
  }
}

class B2 extends A3 {
  constructor(a: boolean) { // primary to primary
    super(a)
  }

  constructor() {  // primary to secondary
    super()
  }

  constructor(a: number) { // primary to secondary
    super(a)
  }
}

let res4 = 0

function foo4() {
  return ++res4
}

class A4 {
  fld: int = foo4()

  constructor(a: boolean) {} // primary

  constructor() {  // secondary
    this(true)
  }

  constructor(a: number) { // secondary
    this()
  }
}

class B3 extends A4 {
  fld: int = foo4()  // re-defined field

  constructor(a: boolean) { // primary to primary
    super(a)
  }

  constructor() {  // primary to secondary
    super()
  }

  constructor(a: number) { // primary to secondary
    super(a)
  }
}

let cnt = 0

function foo5(): int {
  return cnt++
}

class A5 {
  f00 = foo5()
  f01 = foo5()
  f02 = foo5()
  f03 = foo5()
  f04 = foo5()

  constructor(a: string) {} // primary

  constructor() {  // secondary
    this('')
  }
}

let cnt1 = 0

function foo6(): int {
  return cnt1++
}

class A6 {
  f00 = foo6()
  f01 = foo6()
  f02 = foo6()
  f03 = foo6()
  f04 = foo6()

  constructor(a: string) {} // primary

  constructor() {  // secondary
    this('')
  }
}

let cnt2 = 0

function foo7(): int {
  return cnt2++
}
class A7 {
  f00 = foo7()
  f01 = foo7()
  f02 = foo7()
  f03 = foo7()
  f04 = foo7()
}

class B4 extends A7 {
  constructor(a: string) { // primary
    super()
  }

  constructor() {  // secondary
    this('')
  }
}

let cnt3 = 0

function foo8(): int {
  return cnt3++
}
class A8 {
  f00 = foo8()
  f01 = foo8()
  f02 = foo8()
  f03 = foo8()
  f04 = foo8()
}

class B5 extends A8 {
  f00 = foo8()  // re-defined fields
  f01 = foo8()
  f02 = foo8()
  f03 = foo8()
  f04 = foo8()

  constructor(a: string) { // primary
    super()
  }

  constructor() {  // secondary
    this('')
  }
}

let cnt4 = 0

function foo9(): int {
  return cnt4++
}
class A9 {
}

class B6 extends A9 {
  f00 = foo9()
  f01 = foo9()
  f02 = foo9()
  f03 = foo9()
  f04 = foo9()

  constructor(a: string) { // primary
    super()
  }

  constructor() {  // secondary
    this('')
  }
}

let cnt5 = 0

function foo10(): int {
  return cnt5++
}

class A10 {
  f00 = foo10()
  f01 = foo10()
  f02 = foo10()
  f03 = foo10()
  f04 = foo10()
}

class B7 extends A10 {
  constructor(a: string) { // primary
    super()
  }

  constructor() {  // secondary
    this('')
  }
}

let cnt6 = 0

function foo11(): int {
  return cnt6++
}

class A11 {
  f00 = foo11()
  f01 = foo11()
  f02 = foo11()
  f03 = foo11()
  f04 = foo11()
}

class B8 extends A11 {
  f00 = foo11() // re-defined fields
  f01 = foo11()
  f02 = foo11()
  f03 = foo11()
  f04 = foo11()

  constructor(a: string) { // primary
    super()
  }

  constructor() {  // secondary
    this('')
  }
}

let cnt7 = 0

function foo12(): int {
  return cnt7++
}

class A12 {
}

class B9 extends A12 {
  f00 = foo12()
  f01 = foo12()
  f02 = foo12()
  f03 = foo12()
  f04 = foo12()

  constructor(a: string) { // primary
    super()
  }

  constructor() {  // secondary
    this('')
  }
}

let cnt8 = 0

function foo13(): int {
  return cnt8++
}
class A13 {
  f00 = foo13()
  f01 = foo13()
  f02 = foo13()
  f03 = foo13()
  f04 = foo13()

  constructor(a: string) {} // primary

  constructor() {  // secondary
    this('')
  }
}

class B10 extends A13 {
  constructor(a: string) { // primary to primary
    super('')
  }

  constructor() {  // primary to secondary
    super()
  }
}

let cnt9 = 0

function foo14(): int {
  return cnt9++
}
class A14 {
  f00 = foo14()
  f01 = foo14()
  f02 = foo14()
  f03 = foo14()
  f04 = foo14()

  constructor(a: string) {} // primary

  constructor() {  // secondary
    this('')
  }
}

class B11 extends A14 {
  f00 = foo14()  // re-defined fields
  f01 = foo14()
  f02 = foo14()
  f03 = foo14()
  f04 = foo14()

  constructor(a: string) { // primary to primary
    super('')
  }

  constructor() {  // primary to secondary
    super()
  }
}

let cnt10 = 0

function foo15(): int {
  return cnt10++
}
class A15 {
  constructor(a: string) {} // primary

  constructor() {  // secondary
    this('')
  }
}

class B12 extends A15 {
  f00 = foo15()
  f01 = foo15()
  f02 = foo15()
  f03 = foo15()
  f04 = foo15()

  constructor(a: string) { // primary to primary
    super('')
  }

  constructor() {  // primary to secondary
    super()
  }
}

let cnt11 = 0

function foo16(): int {
  return cnt11++
}
class A16 {
  f00 = foo16()
  f01 = foo16()
  f02 = foo16()
  f03 = foo16()
  f04 = foo16()

  constructor(a: string) {} // primary

  constructor() {  // secondary
    this('')
  }
}

class B13 extends A16 {
  constructor(a: string) { // primary to primary
    super('')
  }

  constructor() {  // primary to secondary
    super()
  }
}

let cnt12 = 0

function foo17(): int {
  return cnt12++
}
class A17 {
  f00 = foo17()
  f01 = foo17()
  f02 = foo17()
  f03 = foo17()
  f04 = foo17()

  constructor(a: string) {} // primary

  constructor() {  // secondary
    this('')
  }
}

class B14 extends A17 {
  f00 = foo17()  // re-defined fields
  f01 = foo17()
  f02 = foo17()
  f03 = foo17()
  f04 = foo17()

  constructor(a: string) { // primary to primary
    super('')
  }

  constructor() {  // primary to secondary
    super()
  }
}

let cnt13 = 0

function foo18(): int {
  return cnt13++
}
class A18 {
  constructor(a: string) {} // primary

  constructor() {  // secondary
    this('')
  }
}

class B15 extends A18 {
  f00 = foo18()
  f01 = foo18()
  f02 = foo18()
  f03 = foo18()
  f04 = foo18()

  constructor(a: string) { // primary to primary
    super('')
  }

  constructor() {  // primary to secondary
    super()
  }
}

function foo19(p: number): string {
  return '' + p
}

class A19 {
  f00: null = null
  f01: byte = 1
  f02: short = 2
  f03: int = 3
  f04: long = 4
  f05: float = 1.5f
  f06: double = 2.5
  f07: boolean = true
  f08: string = foo19(3.14)
  f09: bigint = 111111111111111111111111n
  f10: Array<Object> = [new Object, 'b', 333n]
  f11: FixedArray<int> = [42, 43, 44]
  f12: [string, boolean|int] = ['12', 12]
  f13: Record<int, string> = { 1: '1', 2: '2' }
  f14: (p: number) => string = foo19

  constructor(a: string) { // primary
    // 1. Optional arbitrary code that uses neither this nor super.
    if (a == '1') {
      throw new Error('1')
    }
    // 2. Mandatory call to a super constructor (N/A19, no superclass)
    // 3. Mandatory execution of field initializers (if any) in the order they appear in
    // a class body implicitly added by the compiler.
    // 4. Optional arbitrary code that avoids usage of non-initialized fields.
    if (a == '2') {
      throw new Error('2')
    }
    // 5. Optional code that ensures all object fields to be initialized.
    expect(this.f00).assertEqual(null)
    expect(this.f01).assertEqual(1)
    expect(this.f02).assertEqual(2)
    expect(this.f03).assertEqual(3)
    expect(this.f04).assertEqual(4)
    expect(this.f05).assertEqual(1.5f)
    expect(this.f06).assertEqual(2.5)
    expect(this.f07).assertEqual(true)
    expect(this.f08).assertEqual('3.14')
    expect(this.f09).assertEqual(111111111111111111111111n)
    expect(this.f10.length).assertEqual(3)
    expect(this.f10[0] instanceof Object).assertTrue()
    expect(this.f10[1]).assertEqual('b')
    expect(this.f10[2]).assertEqual(333n)
    expect(this.f11.length).assertEqual(3)
    expect(this.f11[0]).assertEqual(42)
    expect(this.f11[1]).assertEqual(43)
    expect(this.f11[2]).assertEqual(44)
    expect(this.f12[0]).assertEqual('12')
    expect(this.f12[1]).assertEqual(12)
    expect(this.f13[1]).assertEqual('1')
    expect(this.f13[2]).assertEqual('2')
    expect(this.f14(2.0)).assertEqual('2')
    // 6. Optional arbitrary code.
    if (a == '3') {
      throw new Error('3')
    }
  }

  constructor(a: string, b: int) { // secondary
    // 1. Optional arbitrary code that uses neither this nor super.
    if (a == '4') {
      throw new Error('4')
    }
    // 2. Call to another same-class constructor that uses the keyword this
    this(a)
    // 3. Optional arbitrary code.
    if (a == '5') {
      throw new Error('5')
    }
  }
}

function foo20(p: number): string {
  return '' + p
}

class A20 {
  f00: null = null
  f01: byte = 1
  f02: short = 2
  f03: int = 3
  f04: long = 4
  f05: float = 1.5f
  f06: double = 2.5
  f07: boolean = true
  f08: string = foo20(3.14)
  f09: bigint = 111111111111111111111111n
  f10: Array<Object> = [new Object, 'b', 333n]
  f11: FixedArray<int> = [42, 43, 44]
  f12: [string, boolean|int] = ['12', 12]
  f13: Record<int, string> = { 1: '1', 2: '2' }
  f14: (p: number) => string = foo20
}

class B16 extends A20 {
  constructor(a: string) { // primary
    // 1. Optional arbitrary code that uses neither this nor super.
    if (a == '1') {
      throw new Error('1')
    }
    // 2. Mandatory call to a super constructor
    // calling default implicit super constructor
    // 3. Mandatory execution of field initializers (if any) in the order they appear in
    // a class body implicitly added by the compiler.
    // 4. Optional arbitrary code that avoids usage of non-initialized fields.
    if (a == '2') {
      throw new Error('2')
    }
    // 5. Optional code that ensures all object fields to be initialized.
    expect(this.f00).assertEqual(null)
    expect(this.f01).assertEqual(1)
    expect(this.f02).assertEqual(2)
    expect(this.f03).assertEqual(3)
    expect(this.f04).assertEqual(4)
    expect(this.f05).assertEqual(1.5f)
    expect(this.f06).assertEqual(2.5)
    expect(this.f07).assertEqual(true)
    expect(this.f08).assertEqual('3.14')
    expect(this.f09).assertEqual(111111111111111111111111n)
    expect(this.f10.length).assertEqual(3)
    expect(this.f10[0] instanceof Object).assertTrue()
    expect(this.f10[1]).assertEqual('b')
    expect(this.f10[2]).assertEqual(333n)
    expect(this.f11.length).assertEqual(3)
    expect(this.f11[0]).assertEqual(42)
    expect(this.f11[1]).assertEqual(43)
    expect(this.f11[2]).assertEqual(44)
    expect(this.f12[0]).assertEqual('12')
    expect(this.f12[1]).assertEqual(12)
    expect(this.f13[1]).assertEqual('1')
    expect(this.f13[2]).assertEqual('2')
    expect(this.f14(2.0)).assertEqual('2')
    // 6. Optional arbitrary code.
    if (a == '3') {
      throw new Error('3')
    }
  }

  constructor(a: string, b: int) { // secondary
    // 1. Optional arbitrary code that uses neither this nor super.
    if (a == '4') {
      throw new Error('4')
    }
    // 2. Call to another same-class constructor that uses the keyword this
    this(a)
    // 3. Optional arbitrary code.
    if (a == '5') {
      throw new Error('5')
    }
  }
}

function foo21(p: number): string {
  return '' + p
}

class A21 {
  f00: null = null
  f01: byte = 1
  f02: short = 2
  f03: int = 3
  f04: long = 4
  f05: float = 1.5f
  f06: double = 2.5
  f07: boolean = true
  f08: string = foo21(3.14)
  f09: bigint = 111111111111111111111111n
  f10: Array<Object> = [new Object, 'b', 333n]
  f11: FixedArray<int> = [42, 43, 44]
  f12: [string, boolean|int] = ['12', 12]
  f13: Record<int, string> = { 1: '1', 2: '2' }
  f14: (p: number) => string = foo21
}

class B17 extends A21 {
  constructor(a: string) { // primary
    // 1. Optional arbitrary code that uses neither this nor super.
    if (a == '1') {
      throw new Error('1')
    }
    // 2. Mandatory call to a super constructor
    super()
    // 3. Mandatory execution of field initializers (if any) in the order they appear in
    // a class body implicitly added by the compiler.
    // 4. Optional arbitrary code that avoids usage of non-initialized fields.
    if (a == '2') {
      throw new Error('2')
    }
    // 5. Optional code that ensures all object fields to be initialized.
    expect(this.f00).assertEqual(null)
    expect(this.f01).assertEqual(1)
    expect(this.f02).assertEqual(2)
    expect(this.f03).assertEqual(3)
    expect(this.f04).assertEqual(4)
    expect(this.f05).assertEqual(1.5f)
    expect(this.f06).assertEqual(2.5)
    expect(this.f07).assertEqual(true)
    expect(this.f08).assertEqual('3.14')
    expect(this.f09).assertEqual(111111111111111111111111n)
    expect(this.f10.length).assertEqual(3)
    expect(this.f10[0] instanceof Object).assertTrue()
    expect(this.f10[1]).assertEqual('b')
    expect(this.f10[2]).assertEqual(333n)
    expect(this.f11.length).assertEqual(3)
    expect(this.f11[0]).assertEqual(42)
    expect(this.f11[1]).assertEqual(43)
    expect(this.f11[2]).assertEqual(44)
    expect(this.f12[0]).assertEqual('12')
    expect(this.f12[1]).assertEqual(12)
    expect(this.f13[1]).assertEqual('1')
    expect(this.f13[2]).assertEqual('2')
    expect(this.f14(2.0)).assertEqual('2')
    // 6. Optional arbitrary code.
    if (a == '3') {
      throw new Error('3')
    }
  }

  constructor(a: string, b: int) { // secondary
    // 1. Optional arbitrary code that uses neither this nor super.
    if (a == '4') {
      throw new Error('4')
    }
    // 2. Call to another same-class constructor that uses the keyword this
    this(a)
    // 3. Optional arbitrary code.
    if (a == '5') {
      throw new Error('5')
    }
  }
}

function foo22(p: number): string {
  return '' + p
}

class A22 {
  f00: null = null
  f01: byte = 1
  f02: short = 2
  f03: int = 3
  f04: long = 4
  f05: float = 1.5f
  f06: double = 2.5
  f07: boolean = true
  f08: string = foo22(3.14)
  f09: bigint = 111111111111111111111111n
  f10: Array<Object> = [new Object, 'b', 333n]
  f11: FixedArray<int> = [42, 43, 44]
  f12: [string, boolean|int] = ['12', 12]
  f13: Record<int, string> = { 1: '1', 2: '2' }
  f14: (p: number) => string = foo22

  constructor(a: string) {}

  constructor(a: string, b: int) {
    this(a)
  }
}
class B18 extends A22 {
  constructor(a: string) { // primary to primary
    // 1. Optional arbitrary code that uses neither this nor super.
    if (a == '1') {
      throw new Error('1')
    }
    // 2. Mandatory call to a super constructor
    super(a)
    // 3. Mandatory execution of field initializers (if any) in the order they appear in
    // a class body implicitly added by the compiler.
    // 4. Optional arbitrary code that avoids usage of non-initialized fields.
    if (a == '2') {
      throw new Error('2')
    }
    // 5. Optional code that ensures all object fields to be initialized.
    expect(this.f00).assertEqual(null)
    expect(this.f01).assertEqual(1)
    expect(this.f02).assertEqual(2)
    expect(this.f03).assertEqual(3)
    expect(this.f04).assertEqual(4)
    expect(this.f05).assertEqual(1.5f)
    expect(this.f06).assertEqual(2.5)
    expect(this.f07).assertEqual(true)
    expect(this.f08).assertEqual('3.14')
    expect(this.f09).assertEqual(111111111111111111111111n)
    expect(this.f10.length).assertEqual(3)
    expect(this.f10[0] instanceof Object).assertTrue()
    expect(this.f10[1]).assertEqual('b')
    expect(this.f10[2]).assertEqual(333n)
    expect(this.f11.length).assertEqual(3)
    expect(this.f11[0]).assertEqual(42)
    expect(this.f11[1]).assertEqual(43)
    expect(this.f11[2]).assertEqual(44)
    expect(this.f12[0]).assertEqual('12')
    expect(this.f12[1]).assertEqual(12)
    expect(this.f13[1]).assertEqual('1')
    expect(this.f13[2]).assertEqual('2')
    expect(this.f14(2.0)).assertEqual('2')
    // 6. Optional arbitrary code.
    if (a == '3') {
      throw new Error('3')
    }
  }

  constructor(a: string, b: int) { // primary to primary
    // 1. Optional arbitrary code that uses neither this nor super.
    if (a == '4') {
      throw new Error('4')
    }
    // 2. Mandatory call to a super constructor
    super(a)
    // 3. Mandatory execution of field initializers (if any) in the order they appear in
    // a class body implicitly added by the compiler.
    // 4. Optional arbitrary code that avoids usage of non-initialized fields.
    if (a == '5') {
      throw new Error('5')
    }
    // 5. Optional code that ensures all object fields to be initialized.
    expect(this.f00).assertEqual(null)
    expect(this.f01).assertEqual(1)
    expect(this.f02).assertEqual(2)
    expect(this.f03).assertEqual(3)
    expect(this.f04).assertEqual(4)
    expect(this.f05).assertEqual(1.5f)
    expect(this.f06).assertEqual(2.5)
    expect(this.f07).assertEqual(true)
    expect(this.f08).assertEqual('3.14')
    expect(this.f09).assertEqual(111111111111111111111111n)
    expect(this.f10.length).assertEqual(3)
    expect(this.f10[0] instanceof Object).assertTrue()
    expect(this.f10[1]).assertEqual('b')
    expect(this.f10[2]).assertEqual(333n)
    expect(this.f11.length).assertEqual(3)
    expect(this.f11[0]).assertEqual(42)
    expect(this.f11[1]).assertEqual(43)
    expect(this.f11[2]).assertEqual(44)
    expect(this.f12[0]).assertEqual('12')
    expect(this.f12[1]).assertEqual(12)
    expect(this.f13[1]).assertEqual('1')
    expect(this.f13[2]).assertEqual('2')
    expect(this.f14(2.0)).assertEqual('2')
    // 6. Optional arbitrary code.
    if (a == '6') {
      throw new Error('6')
    }
  }
}

function foo23(p: number): string {
  return '' + p
}

class A23 {
  f00: null = null
  f01: byte = 1
  f02: short = 2
  f03: int = 3
  f04: long = 4
  f05: float = 1.5f
  f06: double = 2.5
  f07: boolean = true
  f08: string = foo23(3.14)
  f09: bigint = 111111111111111111111111n
  f10: Array<Object> = [new Object, 'b', 333n]
  f11: FixedArray<int> = [42, 43, 44]
  f12: [string, boolean|int] = ['12', 12]
  f13: Record<int, string> = { 1: '1', 2: '2' }
  f14: (p: number) => string = foo23

  constructor(a: string) {}

  constructor(a: string, b: int) {
    this(a)
  }
}
class B19 extends A23 {
  constructor(a: string) { // primary to secondary
    // 1. Optional arbitrary code that uses neither this nor super.
    if (a == '1') {
      throw new Error('1')
    }
    // 2. Mandatory call to a super constructor
    super(a, 1)
    // 3. Mandatory execution of field initializers (if any) in the order they appear in
    // a class body implicitly added by the compiler.
    // 4. Optional arbitrary code that avoids usage of non-initialized fields.
    if (a == '2') {
      throw new Error('2')
    }
    // 5. Optional code that ensures all object fields to be initialized.
    expect(this.f00).assertEqual(null)
    expect(this.f01).assertEqual(1)
    expect(this.f02).assertEqual(2)
    expect(this.f03).assertEqual(3)
    expect(this.f04).assertEqual(4)
    expect(this.f05).assertEqual(1.5f)
    expect(this.f06).assertEqual(2.5)
    expect(this.f07).assertEqual(true)
    expect(this.f08).assertEqual('3.14')
    expect(this.f09).assertEqual(111111111111111111111111n)
    expect(this.f10.length).assertEqual(3)
    expect(this.f10[0] instanceof Object).assertTrue()
    expect(this.f10[1]).assertEqual('b')
    expect(this.f10[2]).assertEqual(333n)
    expect(this.f11.length).assertEqual(3)
    expect(this.f11[0]).assertEqual(42)
    expect(this.f11[1]).assertEqual(43)
    expect(this.f11[2]).assertEqual(44)
    expect(this.f12[0]).assertEqual('12')
    expect(this.f12[1]).assertEqual(12)
    expect(this.f13[1]).assertEqual('1')
    expect(this.f13[2]).assertEqual('2')
    expect(this.f14(2.0)).assertEqual('2')
    // 6. Optional arbitrary code.
    if (a == '3') {
      throw new Error('3')
    }
  }

  constructor(a: string, b: int) { // primary to secondary
    // 1. Optional arbitrary code that uses neither this nor super.
    if (a == '4') {
      throw new Error('4')
    }
    // 2. Mandatory call to a super constructor
    super(a, 1)
    // 3. Mandatory execution of field initializers (if any) in the order they appear in
    // a class body implicitly added by the compiler.
    // 4. Optional arbitrary code that avoids usage of non-initialized fields.
    if (a == '5') {
      throw new Error('5')
    }
    // 5. Optional code that ensures all object fields to be initialized.
    expect(this.f00).assertEqual(null)
    expect(this.f01).assertEqual(1)
    expect(this.f02).assertEqual(2)
    expect(this.f03).assertEqual(3)
    expect(this.f04).assertEqual(4)
    expect(this.f05).assertEqual(1.5f)
    expect(this.f06).assertEqual(2.5)
    expect(this.f07).assertEqual(true)
    expect(this.f08).assertEqual('3.14')
    expect(this.f09).assertEqual(111111111111111111111111n)
    expect(this.f10.length).assertEqual(3)
    expect(this.f10[0] instanceof Object).assertTrue()
    expect(this.f10[1]).assertEqual('b')
    expect(this.f10[2]).assertEqual(333n)
    expect(this.f11.length).assertEqual(3)
    expect(this.f11[0]).assertEqual(42)
    expect(this.f11[1]).assertEqual(43)
    expect(this.f11[2]).assertEqual(44)
    expect(this.f12[0]).assertEqual('12')
    expect(this.f12[1]).assertEqual(12)
    expect(this.f13[1]).assertEqual('1')
    expect(this.f13[2]).assertEqual('2')
    expect(this.f14(2.0)).assertEqual('2')
    // 6. Optional arbitrary code.
    if (a == '6') {
      throw new Error('6')
    }
  }
}

enum Color {
  Red,
  Green,
  Blue,
}

class A24 {
  x: int

  constructor(p: Color) {
    switch (p) {
      case Color.Red:
        this.x = 11
        return
      case Color.Green:
        this.x = 22
        return
      case Color.Blue:
        return
    }
  }
}

class A25 {
  x: int;

  constructor(p: int) {
    if (p == 0) {
      return;
    }
    this.x = p + 1;
  }
}

class A26 {}

class X {
  res: number = 5
  constructor(v?: A26) {
    if (v != undefined) {
      if (this.res > 0) {
        this.res--;
        return;
      }
      v = undefined
    }
    this.res = 0
  }
}

class A27 {
  public x: int;

  public constructor() {
    this.x = 5;
  }
}

class B20 extends A27 {
  public constructor() {

  }
}

class A28 {
  public x: int;

  public constructor() {
    this.x = 5;
  }

  public static fromInt(a: int): A28 {
    const instance = new A28();
    instance.x = a;
    return instance;
  }
}

class A29 {
  public x: int;

  public constructor() {
    this(5);
  }

  public constructor(a: int) {
    this.x = a;
  }
}

class A30 {
  public x: int

  public constructor(a: int) {
    this.x = a
  }
}

class B21 extends A30 {
  public constructor() {
    super(5)
  }
}

class A31 {
  public x: int

  constructor(a: int) {
    this.x = a
  }
}

class B22 extends A31 {
  constructor() {  // secondary
    this(5)
  }

  constructor(p: int) {  // primary
    super(p)
  }
}

abstract class A32 {
  x: int;

  protected constructor(a: int) {
    this.x = a + 1;
  }
}

class B23 extends A32 {
  constructor(a?: int) {
    const param = (a === undefined) ? 42 : a + 1;
    super(param);
  }

  static fromInt(a: int): B23 {
    return new B23(a);
  }
}

abstract class A33 {
  x: int;

  protected constructor(a: int) {
    this.x = a + 1;
  }
}

class B24 extends A33 {
  constructor() {
    super(42)
  }

  constructor(a: int) {
    super(a + 1);
  }
}

abstract class A34 {
  x: int;


  constructor(a: int) {
    this.x = a + 1;
  }
}

abstract class B25 extends A34 {
  constructor(a: int) {
    super(a);
  }
}

class C extends B25 {
  x: int = 46;

  constructor() {
    super(0);
  }

  static fromInt(a: int): C {
    const instance = new C();
    instance.x = a + 4;  // 1 + 4 = 5
    return instance;
  }
}

abstract class A35 {
  x: int;

  constructor(a: int) {
    this.x = a + 1
  }
}

abstract class B26 extends A35 {
  constructor() {  // secondary constructor
    this(12)
  }

  constructor(a: int) { // primary constructor
    super(a + 1)
  }
}

class C1 extends B26 {
  constructor() {  // secondary constructor
    this(42)
  }

  constructor(a: int) { // primary constructor
    super(a + 1)
  }
}

class A36 {
  x: int = 0;

  constructor(a: int) {
    this.x = a + 1;
  }
}

class B27 extends A36 {
  static noArgs(): B27 {
    return new B27(44);
  }

  static fromInt(a: int): B27 {
    return new B27(a + 1);
  }

  protected constructor(a: int) {
    super(a);
  }
}

class C2 extends B27 {

  static noArgs(): C2 {
    return new C2();
  }

  static fromInt(a: int): C2 {
    return new C2(a);
  }

  static withX(x: int): C2 {
    if (x === 45) {
      return new C2();
    } else {
      return new C2(x - 3);
    }
  }

  private constructor(a?: int) {
    let superParam: int;

    if (a === undefined) {
      superParam = 44;
    } else {
      superParam = a + 2;
    }

    super(superParam);
  }
}

class A37 {
  fldA: string

  constructor(a: string) {
    this.fldA = a
  }
}

class B28 extends A37 {
  constructor(a: string) {
    const superParam = B28.processParameter(a);
    super(superParam);
  }

  private static processParameter(a: string): string {
    if (a === '') {
      throw new Error('empty');
    }

    switch (a) {
      case '1':
        return a;
      case '2':
        return a + a;
      default:
        throw new Error('wrong arg = ' + a);
    }
  }
}

class A38 {
  fldA: string

  constructor(a: string) {
    this.fldA = a
  }
}

class B29 extends A38 {
  constructor(a: string) {
    let superParam: string;
    let resultValue: int = 0;

    if (a == '') {
      res5 = -1;
      throw new Error('empty');
    } else if (a == '1') {
      superParam = '1';
      resultValue = 1;
    } else {
      superParam = '2';
      resultValue = 2;
    }
    super(superParam);
    res5 = resultValue;
  }
}

let res5: int;

class A39 {
  fldA: int

  constructor(a: int) {
    this.fldA = a
  }
}

class B30 extends A39 {
  constructor(a: int) {

    let param: int;
    let result: int;

    if (a == 1) {
      param = a;        // 1
      result = 1;
    } else if (a <= 2) {  // a == 2
      param = a * 2;    // 4
      result = 2;
    } else if (a == 3) {
      param = a * 3;    // 9
      result = 3;
    } else {  // a > 3
      param = a * 4;    // a * 4
      result = 4;
    }
    super(param);
    res6 = result;
  }
}

let res6: int;

class A40 {
  fldA: int

  constructor(a: int) {
    this.fldA = a
  }
}

class B31 extends A40 {
  constructor(a: int) {
    // 先计算参数
    const param = (a === 0) ? -1 : a;

    super(param);

    if (a === 0) {
      throw new Error('Error thrown');
    }
  }
}

let res7 = ''

class A41 {
  x: Object
  constructor() {
    this.x = 'a'
    this.assert()
  }

  assert() {
    expect(false).assertTrue();
  }
}

class B32 extends A41 {
  y: Object
  constructor() {
    super()
    this.y = 'b'
  }

  assert() {
    arktest.expectError(() => {
      res7 = this.y.toString()
    });
  }
}

let res8 = ''

class A42 {
  x: Object
  constructor() {
    this.x = 'a'
    this.assert()
  }

  assert() {
    expect(false).assertTrue();
  }
}

class B33 extends A42 {
  y: Object
  constructor() {
    super()
    this.y = 'xyz'
  }

  assert() {
    arktest.expectError(() => {res8 = this.y.toString()});
  }
}

let res9 = ''

class A43 {
  x: Object
  constructor() {
    this.x = new Object
    this.assert()
  }

  assert() {
    expect(false).assertTrue();
  }
}

class B34 extends A43 {
  y: Object
  constructor() {
    super()
    this.y = new Object
  }

  assert() {
    res9 = this.y.toString()
  }
}

let res10 = ''

class A44 {
  x: Object
  constructor() {
    this.x = 'a'
    assert(this)
  }
}

class B35 extends A44 {
  y: Object
  constructor() {
    super()
    this.y = 'b'
  }
}

function assert(p: A44) {
  arktest.expectError(() => {
    if (p instanceof B35) res10 = p.y.toString()
  });
}

let res11 = ''

class A45 {
  x: Object
  constructor() {
    this.x = 'a'
    assert1(this)
  }
}

class B36 extends A45 {
  y: Object
  constructor() {
    super()
    this.y = 'xyz'
  }
}

function assert1(p: A45) {
  arktest.expectError(() => {
    if (p instanceof B36) res11 = p.y.toString()
  });
}

let res12 = ''

class A46 {
  x: Object
  constructor() {
    this.x = new Object
    assert2(this)
  }
}

class B37 extends A46 {
  y: Object
  constructor() {
    super()
    this.y = new Object
  }
}

function assert2(p: A46) {
  if (p instanceof B37) {
    res12 = p.y.toString()
  }
}

abstract class A47 {
  fldA: string

  constructor(a: string) {
    this.fldA = a
  }
}

final class B38 extends A47 {
  constructor(a: string | number) {
    const result = B38.calculateValue(a);
    super(result);
  }

  private static calculateValue(a: string | number): string {
    if (typeof a === 'string') {
      return a.toString();
    } else {
      if (a === 0) {
        throw new Error('zero');
      }

      switch (a) {
        case 1:
          return '' + a;  // "1"
        case 2:
          return '' + a + a;  // "22"
        default:
          throw new Error('wrong arg = ' + a);
      }
    }
  }
}

abstract class A48 {
  fldA: string

  constructor(a: string) {
    this.fldA = a
  }
}

final class B39 extends A48 {
  constructor(a: string) {  // primary
    super(a)
  }

  static fromInt(a: number): B39 {
    if (a === 0) {
      throw new Error('zero')
    }

    switch (a) {
      case 1:
        return new B39('' + a)
      case 2:
        return new B39('' + a + a)
      default:
        throw new Error('wrong arg = ' + a)
    }
  }
}

abstract class A49 {
  fldA: string

  constructor(a: string) {
    this.fldA = a
  }
}

final class B40 extends A49 {
  constructor(a: string | number) {
    const result = B40.calculateValue(a);
    super(result);
  }

  private static calculateValue(a: string | number): string {
    if (typeof a === 'string') {
      return a as string;
    } else {
      if (a === 0) {
        throw new Error('zero');
      } else if (a === 1) {
        return '1' as string;
      } else if (a === 2) {
        return '2' as string;
      } else {
        return '3' as string;
      }
    }
  }
}

abstract class A50 {
  fldA: string

  constructor(a: string) {
    this.fldA = a
  }
}

final class B41 extends A50 {
  constructor(a: string) {  // primary
    super(a)
  }

  static fromInt(a: number): B41 {
    if (a === 0) {
      throw new Error('zero')
    } else {
      if (a === 1) {
        return new B41('1')
      } else {
        if (a === 2) {
          return new B41('2')
        }
        return new B41('3')
      }
    }
  }
}

abstract class A51 {
  fldA: string

  constructor(a: string) {
    this.fldA = a
  }
}

final class B42 extends A51 {
  private constructor(a: string) {
    super(a)
  }

  static fromString(a: string): B42 {
    return new B42(a)
  }

  static fromInt(a: number): B42 {
    try {
      if (a <= 3) {
        throw new Error('error ' + a)
      }
      return new B42('ok')
    } catch (e) {
      const error = e as Error

      if (error.message === 'error 1') {
        return new B42('e1')
      } else if (error.message === 'error 2') {
        return new B42('e2')
      } else {
        return new B42('e3')
      }
    }
  }
}

abstract class A52 {
  fldA: string

  constructor(a: string) {
    this.fldA = a
  }
}

final class B43 extends A52 {
  constructor(a: string) {  // primary
    super(a)
  }

  static fromInt(a: number): B43 {
    try {
      if (a <= 3) {
        throw new Error('error ' + a)
      }
      return new B43('ok')
    } catch (e) {
      if (e.message == 'error 1') {
        return new B43('e1')
      } else {
        if (e.message == 'error 2') {
          return new B43('e2')
        }
        return new B43('e3')
      }
    }
  }
}

abstract class A53 {
  fldA: string

  constructor(a: string) {
    this.fldA = a
  }
}

final class B44 extends A53 {
  constructor(a: string) {
    super(a)
  }

  static fromEnum(a: Color): B44 {
    if (a === Color.Red) return new B44('valid color = Red');
    if (a === Color.Green) return new B44('valid color = Green');
    if (a === Color.Blue) return new B44('valid color = Blue');
    return new B44('unknown color');
  }

  static fromInt(a: number): B44 {
    if (a === 0) return new B44('valid color = Red');
    if (a === 1) return new B44('valid color = Green');
    if (a === 2) return new B44('valid color = Blue');
    return new B44('invalid color');
  }
}

abstract class A54 {
  fldA: string

  constructor(a: string) {
    this.fldA = a
  }
}

final class B45 extends A54 {
  constructor(a: string) { // primary
    super(a)
  }

  static fromEnum(a: Color): B45 {
    // 使用 if 语句替代 Color[a]
    if (a === Color.Red) return new B45('valid color = Red');
    if (a === Color.Green) return new B45('valid color = Green');
    if (a === Color.Blue) return new B45('valid color = Blue');
    return new B45('unknown color');
  }

  static fromInt(a: number): B45 {
    if (a === 0) return new B45('valid color = Red');
    if (a === 1) return new B45('valid color = Green');
    if (a === 2) return new B45('valid color = Blue');
    return new B45('invalid color');
  }
}

class Point {
  x: number;
  y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

class ColoredPoint extends Point {
  static readonly WHITE = 0;
  static readonly BLACK = 1;
  color: number;
  constructor(x: number, y: number, color: number) {
    super(x, y);
    this.color = color
  }
}

class BWPoint extends ColoredPoint {
  constructor(x: number, y: number, black: boolean) {
    super(x, y, black ? ColoredPoint.BLACK : ColoredPoint.WHITE);
  }
}

class Point1 {
  x: number = -1.0;
  y: number = -1.0;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

class ColoredPoint1 extends Point1 {
  static readonly WHITE = 0;
  static readonly BLACK = 1;
  color: number;
  // primary constructor:
  constructor(x: number, y: number, color: number) {
    super(x, y); // calls base class constructor as class has 'extends'
    this.color = color;
  }
  // secondary constructor:
  static zero(color: number): ColoredPoint1 {
    return new ColoredPoint1(0, 0, color);
  }
}

class Base {
  x: Object
  constructor() {
    this.x = new Object() // Base object is fully initialized
    crash_this(this)
  }
}

class Derived extends Base {
  y: Object
  constructor() {
    super() // mandatory call to base class constructor
    this.y = new Object()
  }
}

function crash_this(b: Base) {
  if (b instanceof Derived) {
    arktest.assertTrue((b as Derived).y.toString() instanceof string)
  }
}

class A55 {
  public n: number
  public s: string

  foo(a: A55) {
    return a.s.length
  }

  public constructor() {
    this.s = 'abcd'
    this.n = this.foo(this)
  }
}

class A56 {
  public n: number
  public s: string = 'abcdef'

  foo(a: A56) {
    return a.s.length
  }

  public constructor() {
    this.n = this.foo(this)
    this.s = 'a'
  }
}

export default function ConstructorBodyTest():void {
  describe('ConstructorBodyTest', () => {
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
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_0100
     * @tc.name      testConstructorBody0001
     * @tc.desc      Ensure that a field is initialized once
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res = 0
      let a = new A(true)
      expect(a.fld).assertEqual(1)
      res = 0
      a = new A()
      expect(a.fld).assertEqual(1)
      res = 0
      a = new A(1.0)
      expect(a.fld).assertEqual(1)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_0200
     * @tc.name      testConstructorBody0002
     * @tc.desc      Ensure that a field is initialized once
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res1 = 0
      let b = new B(true)
      expect(b.fld).assertEqual(1)
      res1 = 0
      b = new B()
      expect(b.fld).assertEqual(1)
      res1 = 0
      b = new B(1.0)
      expect(b.fld).assertEqual(1)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_0300
     * @tc.name      testConstructorBody0003
     * @tc.desc      Ensure that a field is initialized once
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      res2 = 0
      let b = new B1(true)
      expect(b.fld).assertEqual(2)
      res2 = 0
      b = new B1()
      expect(b.fld).assertEqual(2)
      res2 = 0
      b = new B1(1.0)
      expect(b.fld).assertEqual(2)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_0400
     * @tc.name      testConstructorBody0004
     * @tc.desc      Ensure that a field is initialized once
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      res3 = 0
      let b = new B2(true)
      expect(b.fld).assertEqual(1)
      res3 = 0
      b = new B2()
      expect(b.fld).assertEqual(1)
      res3 = 0
      b = new B2(1.0)
      expect(b.fld).assertEqual(1)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_0500
     * @tc.name      testConstructorBody0005
     * @tc.desc      Ensure that a field is initialized once
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      res4 = 0
      let b = new B3(true)
      expect(b.fld).assertEqual(2)
      res4 = 0
      b = new B3()
      expect(b.fld).assertEqual(2)
      res4 = 0
      b = new B3(1.0)
      expect(b.fld).assertEqual(2)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_0600
     * @tc.name      testConstructorBody0006
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt = 0
      let a = new A5('x')
      expect(a.f00).assertEqual(0)
      expect(a.f01).assertEqual(1)
      expect(a.f02).assertEqual(2)
      expect(a.f03).assertEqual(3)
      expect(a.f04).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_0700
     * @tc.name      testConstructorBody0007
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt1 = 0
      let a = new A6()
      expect(a.f00).assertEqual(0)
      expect(a.f01).assertEqual(1)
      expect(a.f02).assertEqual(2)
      expect(a.f03).assertEqual(3)
      expect(a.f04).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_0800
     * @tc.name      testConstructorBody0008
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt2 = 0
      let b = new B4('x')
      expect(b.f00).assertEqual(0)
      expect(b.f01).assertEqual(1)
      expect(b.f02).assertEqual(2)
      expect(b.f03).assertEqual(3)
      expect(b.f04).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_0900
     * @tc.name      testConstructorBody0009
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt3 = 0
      let b = new B5('x')
      expect(b.f00).assertEqual(5)
      expect(b.f01).assertEqual(6)
      expect(b.f02).assertEqual(7)
      expect(b.f03).assertEqual(8)
      expect(b.f04).assertEqual(9)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_1000
     * @tc.name      testConstructorBody0010
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt4 = 0
      let b = new B6('x')
      expect(b.f00).assertEqual(0)
      expect(b.f01).assertEqual(1)
      expect(b.f02).assertEqual(2)
      expect(b.f03).assertEqual(3)
      expect(b.f04).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_1100
     * @tc.name      testConstructorBody0011
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt5 = 0
      let b = new B7()
      expect(b.f00).assertEqual(0)
      expect(b.f01).assertEqual(1)
      expect(b.f02).assertEqual(2)
      expect(b.f03).assertEqual(3)
      expect(b.f04).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_1200
     * @tc.name      testConstructorBody0012
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt6 = 0
      let b = new B8()
      expect(b.f00).assertEqual(5)
      expect(b.f01).assertEqual(6)
      expect(b.f02).assertEqual(7)
      expect(b.f03).assertEqual(8)
      expect(b.f04).assertEqual(9)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_1300
     * @tc.name      testConstructorBody0013
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt7 = 0
      let b = new B9()
      expect(b.f00).assertEqual(0)
      expect(b.f01).assertEqual(1)
      expect(b.f02).assertEqual(2)
      expect(b.f03).assertEqual(3)
      expect(b.f04).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_1400
     * @tc.name      testConstructorBody0014
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt8 = 0
      let b = new B10('x')
      expect(b.f00).assertEqual(0)
      expect(b.f01).assertEqual(1)
      expect(b.f02).assertEqual(2)
      expect(b.f03).assertEqual(3)
      expect(b.f04).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_1500
     * @tc.name      testConstructorBody0015
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt9 = 0
      let b = new B11('x')
      expect(b.f00).assertEqual(5)
      expect(b.f01).assertEqual(6)
      expect(b.f02).assertEqual(7)
      expect(b.f03).assertEqual(8)
      expect(b.f04).assertEqual(9)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_1600
     * @tc.name      testConstructorBody0016
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt10 = 0
      let b = new B12('x')
      expect(b.f00).assertEqual(0)
      expect(b.f01).assertEqual(1)
      expect(b.f02).assertEqual(2)
      expect(b.f03).assertEqual(3)
      expect(b.f04).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_1700
     * @tc.name      testConstructorBody0017
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt11 = 0
      let b = new B13()
      expect(b.f00).assertEqual(0)
      expect(b.f01).assertEqual(1)
      expect(b.f02).assertEqual(2)
      expect(b.f03).assertEqual(3)
      expect(b.f04).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_1800
     * @tc.name      testConstructorBody0018
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt12 = 0
      let b = new B14()
      expect(b.f00).assertEqual(5)
      expect(b.f01).assertEqual(6)
      expect(b.f02).assertEqual(7)
      expect(b.f03).assertEqual(8)
      expect(b.f04).assertEqual(9)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_1900
     * @tc.name      testConstructorBody0019
     * @tc.desc      Ensure that all fields are initialized in order they appear in a class body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      cnt13 = 0
      let b = new B15()
      expect(b.f00).assertEqual(0)
      expect(b.f01).assertEqual(1)
      expect(b.f02).assertEqual(2)
      expect(b.f03).assertEqual(3)
      expect(b.f04).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_2000
     * @tc.name      testConstructorBody0020
     * @tc.desc      Ensure that all fields are initialized in the specified scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A19 = new A19('x')
      expect(a.f00).assertEqual(null)
      expect(a.f03).assertEqual(3)
      arktest.expectError(() => { a = new A19('1') }, '1')
      arktest.expectError(() => { a = new A19('2') }, '2')
      arktest.expectError(() => { a = new A19('3') }, '3')
      a = new A19('x', 1)
      expect(a.f08).assertEqual('3.14')
      arktest.expectError(() => { a = new A19('1', 1) }, '1')
      arktest.expectError(() => { a = new A19('2', 1) }, '2')
      arktest.expectError(() => { a = new A19('3', 1) }, '3')
      arktest.expectError(() => { a = new A19('4', 1) }, '4')
      arktest.expectError(() => { a = new A19('5', 1) }, '5')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_2100
     * @tc.name      testConstructorBody0021
     * @tc.desc      Ensure that all fields are initialized in the specified scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B16 = new B16('x')
      expect(b.f00).assertEqual(null)
      expect(b.f03).assertEqual(3)
      arktest.expectError(() => { b = new B16('1') }, '1')
      arktest.expectError(() => { b = new B16('2') }, '2')
      arktest.expectError(() => { b = new B16('3') }, '3')
      b = new B16('x', 1)
      expect(b.f08).assertEqual('3.14')
      arktest.expectError(() => { b = new B16('1', 1) }, '1')
      arktest.expectError(() => { b = new B16('2', 1) }, '2')
      arktest.expectError(() => { b = new B16('3', 1) }, '3')
      arktest.expectError(() => { b = new B16('4', 1) }, '4')
      arktest.expectError(() => { b = new B16('5', 1) }, '5')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_2200
     * @tc.name      testConstructorBody0022
     * @tc.desc      Ensure that all fields are initialized in the specified scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B17 = new B17('x')
      expect(b.f00).assertEqual(null)
      expect(b.f03).assertEqual(3)
      arktest.expectError(() => { b = new B17('1') }, '1')
      arktest.expectError(() => { b = new B17('2') }, '2')
      arktest.expectError(() => { b = new B17('3') }, '3')
      b = new B17('x', 1)
      expect(b.f08).assertEqual('3.14')
      arktest.expectError(() => { b = new B17('1', 1) }, '1')
      arktest.expectError(() => { b = new B17('2', 1) }, '2')
      arktest.expectError(() => { b = new B17('3', 1) }, '3')
      arktest.expectError(() => { b = new B17('4', 1) }, '4')
      arktest.expectError(() => { b = new B17('5', 1) }, '5')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_2300
     * @tc.name      testConstructorBody0023
     * @tc.desc      Ensure that all fields are initialized in the specified scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B18 = new B18('x')
      expect(b.f00).assertEqual(null)
      expect(b.f03).assertEqual(3)
      arktest.expectError(() => { b = new B18('1') }, '1')
      arktest.expectError(() => { b = new B18('2') }, '2')
      arktest.expectError(() => { b = new B18('3') }, '3')
      b = new B18('1', 1)
      expect(b.f08).assertEqual('3.14')
      arktest.expectError(() => { b = new B18('4', 1) }, '4')
      arktest.expectError(() => { b = new B18('5', 1) }, '5')
      arktest.expectError(() => { b = new B18('6', 1) }, '6')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_2400
     * @tc.name      testConstructorBody0024
     * @tc.desc      Ensure that all fields are initialized in the specified scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B19 = new B19('x')
      expect(b.f00).assertEqual(null)
      expect(b.f03).assertEqual(3)
      arktest.expectError(() => { b = new B19('1') }, '1')
      arktest.expectError(() => { b = new B19('2') }, '2')
      arktest.expectError(() => { b = new B19('3') }, '3')
      b = new B19('x', 1)
      expect(b.f08).assertEqual('3.14')
      arktest.expectError(() => { b = new B19('4', 1) }, '4')
      arktest.expectError(() => { b = new B19('5', 1) }, '5')
      arktest.expectError(() => { b = new B19('6', 1) }, '6')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_2500
     * @tc.name      testConstructorBody0025
     * @tc.desc      A return statement may be used in the body of a constructor if it does not
     *               include an expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A24(Color.Red).x).assertEqual(11)
      expect(new A24(Color.Green).x).assertEqual(22)
      expect(new A24(Color.Blue).x).assertEqual(0)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_2600
     * @tc.name      testConstructorBody0026
     * @tc.desc      A return statement may be used in the body of a constructor if it does not
     *               include an expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A25(42).x).assertEqual(43)
      expect(new A25(0).x).assertEqual(0)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_2700
     * @tc.name      testConstructorBody0027
     * @tc.desc      A return statement may be used in the body of a constructor if it does not
     *               include an expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new X().res).assertEqual(0)
      expect(new X(new A26()).res).assertEqual(4)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_2800
     * @tc.name      testConstructorBody0028
     * @tc.desc      Check that superclass construct implicitly invoked.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B20 = new B20();
      expect(instance.x).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_2900
     * @tc.name      testConstructorBody0029
     * @tc.desc      Invocation constructor of same class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A28().x).assertEqual(5);
      expect(A28.fromInt(1).x).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_3000
     * @tc.name      testConstructorBody0030
     * @tc.desc      Invocation constructor of same class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A29().x).assertEqual(5)
      expect(new A29(1).x).assertEqual(1)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_3100
     * @tc.name      testConstructorBody0031
     * @tc.desc      Invocation constructor of superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A30(42).x).assertEqual(42)
      expect(new B21().x).assertEqual(5)
      let b: B21 = {}
      expect(b.x).assertEqual(5)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_3200
     * @tc.name      testConstructorBody0032
     * @tc.desc      Invocation constructor of superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A31(42).x).assertEqual(42)
      expect(new B22(33).x).assertEqual(33)
      expect(new B22().x).assertEqual(5)
      let b: B22 = {}
      expect(b.x).assertEqual(5)
      b = { x: -1 }
      expect(b.x).assertEqual(-1)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_3300
     * @tc.name      testConstructorBody0033
     * @tc.desc      Invocation constructor of abstract superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new B23().x).assertEqual(43);
      expect(new B23(5).x).assertEqual(7);
      expect(B23.fromInt(5).x).assertEqual(7);
      let b: B23 = new B23();
      expect(b.x).assertEqual(43);
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_3400
     * @tc.name      testConstructorBody0034
     * @tc.desc      Invocation constructor of abstract superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new B24().x).assertEqual(43)
      expect(new B24(5).x).assertEqual(7)
      let b: B24 = {}
      expect(b.x).assertEqual(43)
      b = { x: -1 }
      expect(b.x).assertEqual(-1)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_3500
     * @tc.name      testConstructorBody0035
     * @tc.desc      Invocation constructor of abstract superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C = {}
      c = new C();
      expect(c.x).assertEqual(46)
      c = C.fromInt(1)
      expect(c.x).assertEqual(5)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_3600
     * @tc.name      testConstructorBody0036
     * @tc.desc      Invocation constructor of abstract superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C1 = {}
      expect(c.x).assertEqual(45)
      c = new C1(1)
      expect(c.x).assertEqual(4)
      c = { x: -1 }
      expect(c.x).assertEqual(-1)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_3700
     * @tc.name      testConstructorBody0037
     * @tc.desc      Invocation constructor of abstract superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C2;
      c = C2.fromInt(1);
      expect(c.x).assertEqual(4);
      c = C2.noArgs();
      expect(c.x).assertEqual(45);
      c = C2.withX(-1);
      expect(c.x).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_3800
     * @tc.name      testConstructorBody0038
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B28
      expect(() => { b = new B28('') }).assertThrow('empty');
      b = new B28('1')
      expect(b.fldA).assertEqual('1')
      b = new B28('2')
      expect(b.fldA).assertEqual('22')
      expect(() => { b = new B28('3') }).assertThrow('wrong arg = 3');
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_3900
     * @tc.name      testConstructorBody0039
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res5 = 0
      let b: B29
      expect(() => { b = new B29('') }).assertThrow('empty');
      expect(res5).assertEqual(-1)
      b = new B29('1')
      expect(res5).assertEqual(1)
      expect(b.fldA).assertEqual('1')
      b = new B29('2')
      expect(res5).assertEqual(2)
      expect(b.fldA).assertEqual('2')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_4000
     * @tc.name      testConstructorBody0040
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res6 = 0
      let b = new B30(1)
      expect(res6).assertEqual(1)
      expect(b.fldA).assertEqual(1)
      b = new B30(2)
      expect(res6).assertEqual(2)
      expect(b.fldA).assertEqual(4)
      b = new B30(3)
      expect(res6).assertEqual(3)
      expect(b.fldA).assertEqual(9)
      b = new B30(4)
      expect(res6).assertEqual(4)
      expect(b.fldA).assertEqual(16)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_4100
     * @tc.name      testConstructorBody0041
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B31;
      expect(() => {
        new B31(0);
      }).assertThrow('Error thrown');

      b = new B31(-1);
      expect(b.fldA).assertEqual(-1);

      b = new B31(1);
      expect(b.fldA).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_4200
     * @tc.name      testConstructorBody0042
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new B32()
      expect(b.x).assertEqual('a')
      expect(b.y).assertEqual('b')
      expect(res7).assertEqual('')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_4300
     * @tc.name      testConstructorBody0043
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B33 = { y: 'b' }
      expect(b.x).assertEqual('a')
      expect(b.y).assertEqual('b')
      expect(res8).assertEqual('')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_4400
     * @tc.name      testConstructorBody0044
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A43 | undefined
      arktest.expectThrow(() => { b = new B34 })
      arktest.expectThrow(() => { res9 = b!.toString() })
      expect(res9).assertEqual('')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_4500
     * @tc.name      testConstructorBody0045
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new B35()
      expect(b.x).assertEqual('a')
      expect(b.y).assertEqual('b')
      expect(res10).assertEqual('')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_4600
     * @tc.name      testConstructorBody0046
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B36 = { y: 'b' }
      expect(b.x).assertEqual('a')
      expect(b.y).assertEqual('b')
      expect(res11).assertEqual('')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_4700
     * @tc.name      testConstructorBody0047
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A46 | undefined
      arktest.expectThrow(() => { b = new B37() })
      arktest.expectThrow(() => { res12 = b!.toString() })
      expect(res12).assertEqual('')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_4800
     * @tc.name      testConstructorBody0048
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B38
      arktest.expectError(() => { b = new B38(0) }, 'zero')
      b = new B38(1)
      expect(b.fldA).assertEqual('1')
      b = new B38(2)
      expect(b.fldA).assertEqual('22')
      arktest.expectError(() => { b = new B38(3) }, 'wrong arg = 3')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_4900
     * @tc.name      testConstructorBody0049
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B39
      expect(() => { b = B39.fromInt(0) }).assertThrow('zero');
      b = B39.fromInt(1)
      expect(b.fldA).assertEqual('1')
      b = B39.fromInt(2)
      expect(b.fldA).assertEqual('22')
      expect(() => { b = B39.fromInt(3) }).assertThrow('wrong arg = 3');
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_5000
     * @tc.name      testConstructorBody0050
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B40
      expect(() => { b = new B40(0) }).assertThrow('zero');
      b = new B40(1)
      expect(b.fldA).assertEqual('1')
      b = new B40(2)
      expect(b.fldA).assertEqual('2')
      b = new B40(-1)
      expect(b.fldA).assertEqual('3')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_5100
     * @tc.name      testConstructorBody0051
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B41
      expect(() => { b = B41.fromInt(0) }).assertThrow('zero');
      b =  B41.fromInt(1)
      expect(b.fldA).assertEqual('1')
      b =  B41.fromInt(2)
      expect(b.fldA).assertEqual('2')
      b =  B41.fromInt(-1)
      expect(b.fldA).assertEqual('3')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_5200
     * @tc.name      testConstructorBody0052
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = B42.fromInt(1)
      expect(b.fldA).assertEqual('e1')
      b = B42.fromInt(2)
      expect(b.fldA).assertEqual('e2')
      b = B42.fromInt(3)
      expect(b.fldA).assertEqual('e3')
      b = B42.fromInt(4)
      expect(b.fldA).assertEqual('ok')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_5300
     * @tc.name      testConstructorBody0053
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = B43.fromInt(1)
      expect(b.fldA).assertEqual('e1')
      b = B43.fromInt(2)
      expect(b.fldA).assertEqual('e2')
      b = B43.fromInt(3)
      expect(b.fldA).assertEqual('e3')
      b = B43.fromInt(4)
      expect(b.fldA).assertEqual('ok')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_5400
     * @tc.name      testConstructorBody0054
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = B44.fromInt(0)
      expect(b.fldA).assertEqual('valid color = Red')
      b = B44.fromInt(1)
      expect(b.fldA).assertEqual('valid color = Green')
      b = B44.fromInt(2)
      expect(b.fldA).assertEqual('valid color = Blue')
      b = B44.fromInt(3)
      expect(b.fldA).assertEqual('invalid color')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_5500
     * @tc.name      testConstructorBody0055
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b =  B45.fromInt(0)
      expect(b.fldA).assertEqual('valid color = Red')
      b =  B45.fromInt(1)
      expect(b.fldA).assertEqual('valid color = Green')
      b =  B45.fromInt(2)
      expect(b.fldA).assertEqual('valid color = Blue')
      b =  B45.fromInt(3)
      expect(b.fldA).assertEqual('invalid color')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_5600
     * @tc.name      testConstructorBody0056
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let black = new BWPoint(1.0, 11.0, true)
      expect(black instanceof BWPoint).assertTrue()
      expect(black.color).assertEqual(1)
      expect(black.x).assertEqual(1.0)
      expect(black.y).assertEqual(11.0)
      let white = new BWPoint(2.0, 22.0, false)
      expect(white instanceof BWPoint).assertTrue()
      expect(white.color).assertEqual(0)
      expect(white.x).assertEqual(2.0)
      expect(white.y).assertEqual(22.0)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_5700
     * @tc.name      testConstructorBody0057
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let black = ColoredPoint1.zero(ColoredPoint1.BLACK);
      expect(black instanceof ColoredPoint1).assertTrue();
      expect(black.color).assertEqual(1);
      expect(black.x).assertEqual(0.0);
      expect(black.y).assertEqual(0.0);
      let white = ColoredPoint1.zero(ColoredPoint1.WHITE);
      expect(white instanceof ColoredPoint1).assertTrue();
      expect(white.color).assertEqual(0);
      expect(white.x).assertEqual(0.0);
      expect(white.y).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_5800
     * @tc.name      testConstructorBody0058
     * @tc.desc      Mandatory call to a super constructor if a class has an extension clause on all
     *               execution paths of the constructor body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Base = new Base()
      expect(b.x.toString() instanceof string).assertTrue();
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_5900
     * @tc.name      testConstructorBody0059
     * @tc.desc      this can be passed as an argument only after each object field receives an
     *               initial value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A55().n).assertEqual(4)
      expect(new A55().s).assertEqual('abcd')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_BODY_TEST_6000
     * @tc.name      testConstructorBody0060
     * @tc.desc      this can be passed as an argument only after each object field receives an
     *               initial value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorBody0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A56().n).assertEqual(6)
      expect(new A56().s).assertEqual('a')
    });
  })
}
