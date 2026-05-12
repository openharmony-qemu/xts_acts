import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

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
    // 2. Mandatory call to a superconstructor (N/A19, no superclass)
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
    expect(this.f10[0] instanceof Object)
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
    // 2. Mandatory call to a superconstructor
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
    expect(this.f10[0] instanceof Object)
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
    // 2. Mandatory call to a superconstructor
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
    expect(this.f10[0] instanceof Object)
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
    // 2. Mandatory call to a superconstructor
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
    expect(this.f10[0] instanceof Object)
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
    // 2. Mandatory call to a superconstructor
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
    expect(this.f10[0] instanceof Object)
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
    // 2. Mandatory call to a superconstructor
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
    expect(this.f10[0] instanceof Object)
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
    // 2. Mandatory call to a superconstructor
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
    expect(this.f10[0] instanceof Object)
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
