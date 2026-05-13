import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace testNS11 {
  class C10 {data: int = 0}
  function foo10(p: Array<Array<C10>>): C10[][] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C10[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C10>[] = foo10(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C10).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C10).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C10).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C10).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C10).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C10).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C10).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C10).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C10 {data: int = 0}
function foo10(p: Array<Array<C10>>): C10[][] {
  return p
}

namespace testNS12 {
  class C11 {data: int = 0}
  function foo11(p: C11[][]): C11[][] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C11[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C11>[] = foo11(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C11).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C11).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C11).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C11).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C11).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C11).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C11).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C11).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C11 {data: int = 0}
function foo11(p: C11[][]): C11[][] {
  return p
}

namespace testNS13 {
  class C12 {data: int = 0}
  function foo12(p: C12[][]): Array<Array<C12>> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C12[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C12>[] = foo12(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C12).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C12).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C12).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C12).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C12).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C12).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C12).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C12).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C12 {data: int = 0}
function foo12(p: C12[][]): Array<Array<C12>> {
  return p
}

namespace testNS14 {
  class C13 {data: int = 0}
  function foo13(p: Array<C13>[]): Array<C13[]> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C13[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C13>[] = foo13(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C13).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C13).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C13).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C13).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C13).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C13).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C13).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C13).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C13 {data: int = 0}
function foo13(p: Array<C13>[]): Array<C13[]> {
  return p
}

namespace testNS15 {
  class C14 {data: int = 0}
  function foo14(p: Array<C14[]>): Array<C14>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C14[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C14>[] = foo14(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C14).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C14).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C14).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C14).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C14).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C14).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C14).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C14).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C14 {data: int = 0}
function foo14(p: Array<C14[]>): Array<C14>[] {
  return p
}

namespace testNS16 {
  class C15 {data: int = 0}
  function foo15(p: Array<Array<C15>>): Array<Array<C15>> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C15>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C15[]> = foo15(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C15).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C15).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C15).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C15).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C15).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C15).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C15).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C15).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C15 {data: int = 0}
function foo15(p: Array<Array<C15>>): Array<Array<C15>> {
  return p
}

namespace testNS17 {
  class C16 {data: int = 0}
  function foo16(p: Array<Array<C16>>): C16[][] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C16>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C16[]> = foo16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C16).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C16).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C16).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C16).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C16).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C16).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C16).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C16).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C16 {data: int = 0}
function foo16(p: Array<Array<C16>>): C16[][] {
  return p
}

namespace testNS18 {
  class C17 {data: int = 0}
  function foo17(p: C17[][]): C17[][] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C17>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C17[]> = foo17(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C17).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C17).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C17).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C17).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C17).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C17).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C17).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C17).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C17 {data: int = 0}
function foo17(p: C17[][]): C17[][] {
  return p
}

namespace testNS19 {
  class C18 {data: int = 0}
  function foo18(p: C18[][]): Array<Array<C18>> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C18>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C18[]> = foo18(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C18).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C18).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C18).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C18).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C18).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C18).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C18).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C18).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C18 {data: int = 0}
function foo18(p: C18[][]): Array<Array<C18>> {
  return p
}

namespace testNS20 {
  class C19 {data: int = 0}
  function foo19(p: Array<C19>[]): Array<C19[]> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C19>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C19[]> = foo19(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C19).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C19).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C19).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C19).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C19).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C19).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C19).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C19).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C19 {data: int = 0}
function foo19(p: Array<C19>[]): Array<C19[]> {
  return p
}

namespace testNS21 {
  class C20 {data: int = 0}
  function foo20(p: Array<C20[]>): Array<C20>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C20>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C20[]> = foo20(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C20).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C20).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C20).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C20).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C20).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C20).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C20).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C20).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C20 {data: int = 0}
function foo20(p: Array<C20[]>): Array<C20>[] {
  return p
}


export default function ArrayOfArraysTypesIdentityTest03(): void {
  describe('ArrayOfArraysTypesIdentityTest03', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_9400
     * @tc.name      testArrayOfArraysTypesIdentity0094
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0094';

      let a: Array<C10[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C10>[] = foo10(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C10).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C10).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C10).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C10).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C10).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C10).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C10).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C10).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS11.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_9500
     * @tc.name      testArrayOfArraysTypesIdentity0095
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0095';

      let a: Array<C11[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C11>[] = foo11(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C11).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C11).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C11).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C11).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C11).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C11).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C11).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C11).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS12.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_9600
     * @tc.name      testArrayOfArraysTypesIdentity0096
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0096';

      let a: Array<C12[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C12>[] = foo12(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C12).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C12).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C12).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C12).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C12).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C12).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C12).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C12).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS13.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_9700
     * @tc.name      testArrayOfArraysTypesIdentity0097
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0097';

      let a: Array<C13[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C13>[] = foo13(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C13).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C13).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C13).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C13).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C13).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C13).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C13).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C13).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS14.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_9800
     * @tc.name      testArrayOfArraysTypesIdentity0098
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0098';

      let a: Array<C14[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C14>[] = foo14(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C14).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C14).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C14).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C14).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C14).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C14).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C14).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C14).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS15.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_9900
     * @tc.name      testArrayOfArraysTypesIdentity0099
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0099';

      let a: Array<C15>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C15[]> = foo15(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C15).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C15).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C15).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C15).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C15).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C15).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C15).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C15).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS16.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_1000
     * @tc.name      testArrayOfArraysTypesIdentity0100
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0100';

      let a: Array<C16>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C16[]> = foo16(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C16).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C16).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C16).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C16).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C16).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C16).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C16).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C16).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS17.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_1010
     * @tc.name      testArrayOfArraysTypesIdentity0101
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0101';

      let a: Array<C17>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C17[]> = foo17(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C17).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C17).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C17).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C17).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C17).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C17).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C17).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C17).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS18.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_1020
     * @tc.name      testArrayOfArraysTypesIdentity0102
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0102';

      let a: Array<C18>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C18[]> = foo18(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C18).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C18).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C18).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C18).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C18).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C18).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C18).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C18).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS19.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_1030
     * @tc.name      testArrayOfArraysTypesIdentity0103
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0103';

      let a: Array<C19>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C19[]> = foo19(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C19).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C19).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C19).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C19).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C19).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C19).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C19).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C19).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS20.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_1040
     * @tc.name      testArrayOfArraysTypesIdentity0104
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0104';

      let a: Array<C20>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C20[]> = foo20(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C20).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C20).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C20).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C20).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C20).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C20).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C20).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C20).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS21.runTest()).assertEqual(true)

    });
  })
}