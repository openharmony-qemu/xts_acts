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

namespace testNS1_16 {
  function cast_16(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS2_16 {
  function cast_16(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS3_16 {
  function cast_16(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS4_16 {
  function cast_16(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS5_16 {
  function cast_16(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS6_16 {
  function cast_16(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS7_16 {
  function cast_16(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS8_16 {
  function cast_16(p: Object): Array<bigint> {
    return p as bigint[]
  }

  export function runTest(): boolean {
    let a: Array<bigint> = [1n, 3n, 5n]
    let b: bigint[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof bigint).assertEqual(true)
    expect(b[0]).assertEqual(1n)
    expect(b[1] instanceof bigint).assertEqual(true)
    expect(b[1]).assertEqual(3n)
    expect(b[2] instanceof bigint).assertEqual(true)
    expect(b[2]).assertEqual(5n)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof bigint).assertEqual(true)
    expect(a[0]).assertEqual(1n)
    expect(a[1] instanceof bigint).assertEqual(true)
    expect(a[1]).assertEqual(3n)
    expect(a[2] instanceof bigint).assertEqual(true)
    expect(a[2]).assertEqual(5n)
    return true
  }
}

namespace testNS9_16 {
  function cast_16(p: Object): Array<string> {
    return p as string[]
  }

  export function runTest(): boolean {
    let a: Array<string> = ["ab", "c", "def"]
    let b: string[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof string).assertEqual(true)
    expect(b[0]).assertEqual("ab")
    expect(b[1] instanceof string).assertEqual(true)
    expect(b[1]).assertEqual("c")
    expect(b[2] instanceof string).assertEqual(true)
    expect(b[2]).assertEqual("def")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof string).assertEqual(true)
    expect(a[0]).assertEqual("ab")
    expect(a[1] instanceof string).assertEqual(true)
    expect(a[1]).assertEqual("c")
    expect(a[2] instanceof string).assertEqual(true)
    expect(a[2]).assertEqual("def")
    return true
  }
}

namespace testNS10_16 {
  function cast_16(p: Object): Array<string> {
    return p as string[]
  }

  export function runTest(): boolean {
    let a: Array<string> = ['a', 'b', 'c']
    let b: string[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof string).assertEqual(true)
    expect(b[0]).assertEqual('a')
    expect(b[1] instanceof string).assertEqual(true)
    expect(b[1]).assertEqual('b')
    expect(b[2] instanceof string).assertEqual(true)
    expect(b[2]).assertEqual('c')
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof string).assertEqual(true)
    expect(a[0]).assertEqual('a')
    expect(a[1] instanceof string).assertEqual(true)
    expect(a[1]).assertEqual('b')
    expect(a[2] instanceof string).assertEqual(true)
    expect(a[2]).assertEqual('c')
    return true
  }
}

namespace testNS11_16 {
  function cast_16(p: Object): Array<boolean> {
    return p as boolean[]
  }

  export function runTest(): boolean {
    let a: Array<boolean> = [false, true, false]
    let b: boolean[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof boolean).assertEqual(true)
    expect(b[0]).assertEqual(false)
    expect(b[1] instanceof boolean).assertEqual(true)
    expect(b[1]).assertEqual(true)
    expect(b[2] instanceof boolean).assertEqual(true)
    expect(b[2]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof boolean).assertEqual(true)
    expect(a[0]).assertEqual(false)
    expect(a[1] instanceof boolean).assertEqual(true)
    expect(a[1]).assertEqual(true)
    expect(a[2] instanceof boolean).assertEqual(true)
    expect(a[2]).assertEqual(false)
    return true
  }
}

namespace testNS12_16 {
  function cast_16(p: Object): Array<Object> {
    return p as Object[]
  }

  export function runTest(): boolean {
    let a: Array<Object> = [1, 5n, "abc"]
    let b: Object[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof Object).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof Object).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS13_16 {
  function cast_16(p: Object): Array<(Object | undefined)> {
    return p as (Object | undefined)[]
  }

  export function runTest(): boolean {
    let a: Array<(Object | undefined)> = [undefined, 5n, "abc"]
    let b: (Object | undefined)[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object | undefined)).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object | undefined)).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object | undefined)).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object | undefined)).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object | undefined)).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object | undefined)).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS14_16 {
  function cast_16(p: Object): Array<(Object | undefined | null)> {
    return p as (Object | undefined | null)[]
  }

  export function runTest(): boolean {
    let a: Array<(Object | undefined | null)> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

namespace testNS15_16 {
  function cast_16(p: Object): Array<Object | undefined | null> {
    return p as (Object | undefined | null)[]
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_16(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

function cast_16(p: Object): Array<number> {
  return p as number[]
}

namespace testNS1_17 {
  class C_17 {data: number = 0}
  function cast_17(p: Object) {
    return p as Array<C_17>
  }

  export function runTest(): boolean {
    let a: C_17[] = [{data: 1}, {data: 3}, {data: 5}]
    let b: Array<C_17> = cast_17(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_17).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_17).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_17).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_17).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_17).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_17).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_17 {data: number = 0}
function cast_17(p: Object) {
  return p as Array<C_17>
}

namespace testNS1_18 {
  class C_18 {data: number = 0}
  function cast_18(p: Object) {
    return p as C_18[]
  }

  export function runTest(): boolean {
    let a: C_18[] = [{data: 1}, {data: 3}, {data: 5}]
    let b: Array<C_18> = cast_18(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_18).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_18).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_18).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_18).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_18).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_18).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_18 {data: number = 0}
function cast_18(p: Object) {
  return p as C_18[]
}

namespace testNS1_19 {
  class C_19 {data: number = 0}
  function cast_19(p: Object): Array<C_19> {
    return p as Array<C_19>
  }

  export function runTest(): boolean {
    let a: C_19[] = [{data: 1}, {data: 3}, {data: 5}]
    let b: Array<C_19> = cast_19(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_19).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_19).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_19).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_19).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_19).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_19).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_19 {data: number = 0}
function cast_19(p: Object): Array<C_19> {
  return p as Array<C_19>
}

namespace testNS1_20 {
  class C_20 {data: number = 0}
  function cast_20(p: Object): C_20[] {
    return p as C_20[]
  }

  export function runTest(): boolean {
    let a: C_20[] = [{data: 1}, {data: 3}, {data: 5}]
    let b: Array<C_20> = cast_20(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_20).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_20).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_20).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_20).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_20).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_20).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_20 {data: number = 0}
function cast_20(p: Object): C_20[] {
  return p as C_20[]
}

namespace testNS1_21 {
  class C_21 {data: number = 0}
  function cast_21(p: Object): C_21[] {
    return p as Array<C_21>
  }

  export function runTest(): boolean {
    let a: C_21[] = [{data: 1}, {data: 3}, {data: 5}]
    let b: Array<C_21> = cast_21(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_21).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_21).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_21).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_21).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_21).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_21).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_21 {data: number = 0}
function cast_21(p: Object): C_21[] {
  return p as Array<C_21>
}

namespace testNS1_22 {
  class C_22 {data: number = 0}
  function cast_22(p: Object): Array<C_22> {
    return p as C_22[]
  }

  export function runTest(): boolean {
    let a: C_22[] = [{data: 1}, {data: 3}, {data: 5}]
    let b: Array<C_22> = cast_22(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_22).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_22).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_22).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_22).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_22).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_22).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_22 {data: number = 0}
function cast_22(p: Object): Array<C_22> {
  return p as C_22[]
}

namespace testNS1_23 {
  class C_23 {data: number = 0}
  function cast_23(p: Object) {
    return p as Array<C_23>
  }

  export function runTest(): boolean {
    let a: Array<C_23> = [{data: 1}, {data: 3}, {data: 5}]
    let b: C_23[] = cast_23(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_23).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_23).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_23).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_23).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_23).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_23).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_23 {data: number = 0}
function cast_23(p: Object) {
  return p as Array<C_23>
}

namespace testNS1_24 {
  class C_24 {data: number = 0}
  function cast_24(p: Object) {
    return p as C_24[]
  }

  export function runTest(): boolean {
    let a: Array<C_24> = [{data: 1}, {data: 3}, {data: 5}]
    let b: C_24[] = cast_24(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_24).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_24).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_24).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_24).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_24).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_24).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_24 {data: number = 0}
function cast_24(p: Object) {
  return p as C_24[]
}

namespace testNS1_25 {
  class C_25 {data: number = 0}
  function cast_25(p: Object): Array<C_25> {
    return p as Array<C_25>
  }

  export function runTest(): boolean {
    let a: Array<C_25> = [{data: 1}, {data: 3}, {data: 5}]
    let b: C_25[] = cast_25(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_25).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_25).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_25).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_25).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_25).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_25).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_25 {data: number = 0}
function cast_25(p: Object): Array<C_25> {
  return p as Array<C_25>
}

namespace testNS1_26 {
  class C_26 {data: number = 0}
  function cast_26(p: Object): C_26[] {
    return p as C_26[]
  }

  export function runTest(): boolean {
    let a: Array<C_26> = [{data: 1}, {data: 3}, {data: 5}]
    let b: C_26[] = cast_26(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_26).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_26).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_26).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_26).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_26).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_26).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_26 {data: number = 0}
function cast_26(p: Object): C_26[] {
  return p as C_26[]
}

namespace testNS1_27 {
  class C_27 {data: number = 0}
  function cast_27(p: Object): C_27[] {
    return p as Array<C_27>
  }

  export function runTest(): boolean {
    let a: Array<C_27> = [{data: 1}, {data: 3}, {data: 5}]
    let b: C_27[] = cast_27(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_27).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_27).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_27).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_27).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_27).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_27).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_27 {data: number = 0}
function cast_27(p: Object): C_27[] {
  return p as Array<C_27>
}

namespace testNS1_28 {
  class C_28 {data: number = 0}
  function cast_28(p: Object): Array<C_28> {
    return p as C_28[]
  }

  export function runTest(): boolean {
    let a: Array<C_28> = [{data: 1}, {data: 3}, {data: 5}]
    let b: C_28[] = cast_28(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_28).assertEqual(true)
    expect(b[0].data instanceof number).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_28).assertEqual(true)
    expect(b[1].data instanceof number).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_28).assertEqual(true)
    expect(b[2].data instanceof number).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_28).assertEqual(true)
    expect(a[0].data instanceof number).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_28).assertEqual(true)
    expect(a[1].data instanceof number).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_28).assertEqual(true)
    expect(a[2].data instanceof number).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}
class C_28 {data: number = 0}
function cast_28(p: Object): Array<C_28> {
  return p as C_28[]
}

export default function ArrayTypesIdentityTest05(): void {
  describe('ArrayTypesIdentityTest05', () => {
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
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_1600
     * @tc.name      testArrayTypesIdentity0016
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0016';

      let a: Array<number> = [1, 3, 5]
      let b: number[] = cast_16(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof number).assertEqual(true)
      expect(b[0]).assertEqual(1)
      expect(b[1] instanceof number).assertEqual(true)
      expect(b[1]).assertEqual(3)
      expect(b[2] instanceof number).assertEqual(true)
      expect(b[2]).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof number).assertEqual(true)
      expect(a[0]).assertEqual(1)
      expect(a[1] instanceof number).assertEqual(true)
      expect(a[1]).assertEqual(3)
      expect(a[2] instanceof number).assertEqual(true)
      expect(a[2]).assertEqual(5)

      expect(testNS1_16.runTest()).assertEqual(true)
      expect(testNS2_16.runTest()).assertEqual(true)
      expect(testNS3_16.runTest()).assertEqual(true)
      expect(testNS4_16.runTest()).assertEqual(true)
      expect(testNS5_16.runTest()).assertEqual(true)
      expect(testNS6_16.runTest()).assertEqual(true)
      expect(testNS7_16.runTest()).assertEqual(true)
      expect(testNS8_16.runTest()).assertEqual(true)
      expect(testNS9_16.runTest()).assertEqual(true)
      expect(testNS10_16.runTest()).assertEqual(true)
      expect(testNS11_16.runTest()).assertEqual(true)
      expect(testNS12_16.runTest()).assertEqual(true)
      expect(testNS13_16.runTest()).assertEqual(true)
      expect(testNS14_16.runTest()).assertEqual(true)
      expect(testNS15_16.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_1700
     * @tc.name      testArrayTypesIdentity0017
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0017';

      let a: C_17[] = [{data: 1}, {data: 3}, {data: 5}]
      let b: Array<C_17> = cast_17(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_17).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_17).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_17).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_17).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_17).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_17).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_17.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_1800
     * @tc.name      testArrayTypesIdentity0018
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0018';
       

      let a: C_18[] = [{data: 1}, {data: 3}, {data: 5}]
      let b: Array<C_18> = cast_18(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_18).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_18).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_18).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_18).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_18).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_18).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_18.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_1900
     * @tc.name      testArrayTypesIdentity0019
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0019';

      let a: C_19[] = [{data: 1}, {data: 3}, {data: 5}]
      let b: Array<C_19> = cast_19(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_19).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_19).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_19).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_19).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_19).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_19).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_19.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_2000
     * @tc.name      testArrayTypesIdentity0020
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0020';

      let a: C_20[] = [{data: 1}, {data: 3}, {data: 5}]
      let b: Array<C_20> = cast_20(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_20).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_20).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_20).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_20).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_20).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_20).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_20.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_2100
     * @tc.name      testArrayTypesIdentity0021
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0021';

      let a: C_21[] = [{data: 1}, {data: 3}, {data: 5}]
      let b: Array<C_21> = cast_21(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_21).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_21).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_21).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_21).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_21).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_21).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_21.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_2200
     * @tc.name      testArrayTypesIdentity0022
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0022';
       

      let a: C_22[] = [{data: 1}, {data: 3}, {data: 5}]
      let b: Array<C_22> = cast_22(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_22).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_22).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_22).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_22).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_22).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_22).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_22.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_2300
     * @tc.name      testArrayTypesIdentity0023
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0023';

      let a: Array<C_23> = [{data: 1}, {data: 3}, {data: 5}]
      let b: C_23[] = cast_23(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_23).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_23).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_23).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_23).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_23).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_23).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_23.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_2400
     * @tc.name      testArrayTypesIdentity0024
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0024';

      let a: Array<C_24> = [{data: 1}, {data: 3}, {data: 5}]
      let b: C_24[] = cast_24(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_24).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_24).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_24).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_24).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_24).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_24).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_24.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_2500
     * @tc.name      testArrayTypesIdentity0025
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0025';

      let a: Array<C_25> = [{data: 1}, {data: 3}, {data: 5}]
      let b: C_25[] = cast_25(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_25).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_25).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_25).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_25).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_25).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_25).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_25.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_2600
     * @tc.name      testArrayTypesIdentity0026
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0026';

      let a: Array<C_26> = [{data: 1}, {data: 3}, {data: 5}]
      let b: C_26[] = cast_26(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_26).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_26).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_26).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_26).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_26).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_26).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_26.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_2700
     * @tc.name      testArrayTypesIdentity0027
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0027';

      let a: Array<C_27> = [{data: 1}, {data: 3}, {data: 5}]
      let b: C_27[] = cast_27(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_27).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_27).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_27).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_27).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_27).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_27).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_27.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_2800
     * @tc.name      testArrayTypesIdentity0028
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0028';

      let a: Array<C_28> = [{data: 1}, {data: 3}, {data: 5}]
      let b: C_28[] = cast_28(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_28).assertEqual(true)
      expect(b[0].data instanceof number).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_28).assertEqual(true)
      expect(b[1].data instanceof number).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_28).assertEqual(true)
      expect(b[2].data instanceof number).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_28).assertEqual(true)
      expect(a[0].data instanceof number).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_28).assertEqual(true)
      expect(a[1].data instanceof number).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_28).assertEqual(true)
      expect(a[2].data instanceof number).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_28.runTest()).assertEqual(true)

    });
  })
}