import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}
namespace testNS1_13 {
  function cast_13(p: Object): Array<number> {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_13(a)
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

namespace testNS2_13 {
  function cast_13(p: Object): Array<number> {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_13(a)
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

namespace testNS3_13 {
  function cast_13(p: Object): Array<number> {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_13(a)
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

namespace testNS4_13 {
  function cast_13(p: Object): Array<number> {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_13(a)
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

namespace testNS5_13 {
  function cast_13(p: Object): Array<number> {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_13(a)
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

namespace testNS6_13 {
  function cast_13(p: Object): Array<number> {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_13(a)
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

namespace testNS7_13 {
  function cast_13(p: Object): Array<number> {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_13(a)
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

namespace testNS8_13 {
  function cast_13(p: Object): Array<bigint> {
    return p as Array<bigint>
  }

  export function runTest(): boolean {
    let a: Array<bigint> = [1n, 3n, 5n]
    let b: bigint[] = cast_13(a)
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

namespace testNS9_13 {
  function cast_13(p: Object): Array<string> {
    return p as Array<string>
  }

  export function runTest(): boolean {
    let a: Array<string> = ["ab", "c", "def"]
    let b: string[] = cast_13(a)
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

namespace testNS10_13 {
  function cast_13(p: Object): Array<string> {
    return p as Array<string>
  }

  export function runTest(): boolean {
    let a: Array<string> = ['a', 'b', 'c']
    let b: string[] = cast_13(a)
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

namespace testNS11_13 {
  function cast_13(p: Object): Array<boolean> {
    return p as Array<boolean>
  }

  export function runTest(): boolean {
    let a: Array<boolean> = [false, true, false]
    let b: boolean[] = cast_13(a)
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

namespace testNS12_13 {
  function cast_13(p: Object): Array<Object> {
    return p as Array<Object>
  }

  export function runTest(): boolean {
    let a: Array<Object> = [1, 5n, "abc"]
    let b: Object[] = cast_13(a)
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

namespace testNS13_13 {
  function cast_13(p: Object): Array<Object | undefined> {
    return p as Array<Object | undefined>
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined> = [undefined, 5n, "abc"]
    let b: (Object | undefined)[] = cast_13(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object | undefined).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof Object | undefined).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object | undefined).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object | undefined).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof Object | undefined).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object | undefined).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS14_13 {
  function cast_13(p: Object): Array<Object | undefined | null> {
    return p as Array<Object | undefined | null>
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_13(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object | undefined | null).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof Object | undefined | null).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object | undefined | null).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object | undefined | null).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof Object | undefined | null).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object | undefined | null).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

namespace testNS15_13 {
  function cast_13(p: Object): Array<Object | undefined | null> {
    return p as Array<Object | undefined | null>
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [undefined, 5n, null]
    let b: Object | undefined | null[] = cast_13(a)
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

function cast_13(p: Object): Array<number> {
  return p as Array<number>
}

namespace testNS1_14 {
  function cast_14(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_14(a)
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

namespace testNS2_14 {
  function cast_14(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_14(a)
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

namespace testNS3_14 {
  function cast_14(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_14(a)
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

namespace testNS4_14 {
  function cast_14(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_14(a)
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

namespace testNS5_14 {
  function cast_14(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_14(a)
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

namespace testNS6_14 {
  function cast_14(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_14(a)
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

namespace testNS7_14 {
  function cast_14(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_14(a)
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

namespace testNS8_14 {
  function cast_14(p: Object): bigint[] {
    return p as bigint[]
  }

  export function runTest(): boolean {
    let a: Array<bigint> = [1n, 3n, 5n]
    let b: bigint[] = cast_14(a)
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

namespace testNS9_14 {
  function cast_14(p: Object): string[] {
    return p as string[]
  }

  export function runTest(): boolean {
    let a: Array<string> = ["ab", "c", "def"]
    let b: string[] = cast_14(a)
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

namespace testNS10_14 {
  function cast_14(p: Object): string[] {
    return p as string[]
  }

  export function runTest(): boolean {
    let a: Array<string> = ['a', 'b', 'c']
    let b: string[] = cast_14(a)
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

namespace testNS11_14 {
  function cast_14(p: Object): boolean[] {
    return p as boolean[]
  }

  export function runTest(): boolean {
    let a: Array<boolean> = [false, true, false]
    let b: boolean[] = cast_14(a)
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

namespace testNS12_14 {
  function cast_14(p: Object): Object[] {
    return p as Object[]
  }

  export function runTest(): boolean {
    let a: Array<Object> = [1, 5n, "abc"]
    let b: Object[] = cast_14(a)
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

namespace testNS13_14 {
  function cast_14(p: Object): (Object | undefined)[] {
    return p as (Object | undefined)[]
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined> = [undefined, 5n, "abc"]
    let b: (Object | undefined)[] = cast_14(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object | undefined).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof Object | undefined).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object | undefined).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object | undefined).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof Object | undefined).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object | undefined).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS14_14 {
  function cast_14(p: Object): (Object | undefined | null)[] {
    return p as (Object | undefined | null)[]
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_14(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object | undefined | null).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof Object | undefined | null).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object | undefined | null).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object | undefined | null).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof Object | undefined | null).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object | undefined | null).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

namespace testNS15_14 {
  function cast_14(p: Object): (Object | undefined | null)[] {
    return p as (Object | undefined | null)[]
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_14(a)
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

function cast_14(p: Object): number[] {
  return p as number[]
}

namespace testNS1_15 {
  function cast_15(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertTrue()
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertTrue()
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertTrue()
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertTrue()
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertTrue()
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertTrue()
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS2_15 {
  function cast_15(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertTrue()
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertTrue()
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertTrue()
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertTrue()
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertTrue()
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertTrue()
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS3_15 {
  function cast_15(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertTrue()
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertTrue()
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertTrue()
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertTrue()
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertTrue()
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertTrue()
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS4_15 {
  function cast_15(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertTrue()
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertTrue()
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertTrue()
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertTrue()
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertTrue()
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertTrue()
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS5_15 {
  function cast_15(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertTrue()
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof number).assertTrue()
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof number).assertTrue()
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertTrue()
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof number).assertTrue()
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof number).assertTrue()
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS6_15 {
  function cast_15(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertTrue()
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof number).assertTrue()
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof number).assertTrue()
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertTrue()
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof number).assertTrue()
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof number).assertTrue()
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS7_15 {
  function cast_15(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertTrue()
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof number).assertTrue()
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof number).assertTrue()
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertTrue()
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof number).assertTrue()
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof number).assertTrue()
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS8_15 {
  function cast_15(p: Object): bigint[] {
    return p as Array<bigint>
  }

  export function runTest(): boolean {
    let a: Array<bigint> = [1n, 3n, 5n]
    let b: bigint[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof bigint).assertTrue()
    expect(b[0]).assertEqual(1n)
    expect(b[1] instanceof bigint).assertTrue()
    expect(b[1]).assertEqual(3n)
    expect(b[2] instanceof bigint).assertTrue()
    expect(b[2]).assertEqual(5n)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof bigint).assertTrue()
    expect(a[0]).assertEqual(1n)
    expect(a[1] instanceof bigint).assertTrue()
    expect(a[1]).assertEqual(3n)
    expect(a[2] instanceof bigint).assertTrue()
    expect(a[2]).assertEqual(5n)
    return true
  }
}

namespace testNS9_15 {
  function cast_15(p: Object): string[] {
    return p as Array<string>
  }

  export function runTest(): boolean {
    let a: Array<string> = ["ab", "c", "def"]
    let b: string[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof string).assertTrue()
    expect(b[0]).assertEqual("ab")
    expect(b[1] instanceof string).assertTrue()
    expect(b[1]).assertEqual("c")
    expect(b[2] instanceof string).assertTrue()
    expect(b[2]).assertEqual("def")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof string).assertTrue()
    expect(a[0]).assertEqual("ab")
    expect(a[1] instanceof string).assertTrue()
    expect(a[1]).assertEqual("c")
    expect(a[2] instanceof string).assertTrue()
    expect(a[2]).assertEqual("def")
    return true
  }
}

namespace testNS10_15 {
  function cast_15(p: Object): string[] {
    return p as Array<string>
  }

  export function runTest(): boolean {
    let a: Array<string> = ['a', 'b', 'c']
    let b: string[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof string).assertTrue()
    expect(b[0]).assertEqual('a')
    expect(b[1] instanceof string).assertTrue()
    expect(b[1]).assertEqual('b')
    expect(b[2] instanceof string).assertTrue()
    expect(b[2]).assertEqual('c')
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof string).assertTrue()
    expect(a[0]).assertEqual('a')
    expect(a[1] instanceof string).assertTrue()
    expect(a[1]).assertEqual('b')
    expect(a[2] instanceof string).assertTrue()
    expect(a[2]).assertEqual('c')
    return true
  }
}

namespace testNS11_15 {
  function cast_15(p: Object): boolean[] {
    return p as Array<boolean>
  }

  export function runTest(): boolean {
    let a: Array<boolean> = [false, true, false]
    let b: boolean[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof boolean).assertTrue()
    expect(b[0]).assertEqual(false)
    expect(b[1] instanceof boolean).assertTrue()
    expect(b[1]).assertEqual(true)
    expect(b[2] instanceof boolean).assertTrue()
    expect(b[2]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof boolean).assertTrue()
    expect(a[0]).assertEqual(false)
    expect(a[1] instanceof boolean).assertTrue()
    expect(a[1]).assertEqual(true)
    expect(a[2] instanceof boolean).assertTrue()
    expect(a[2]).assertEqual(false)
    return true
  }
}

namespace testNS12_15 {
  function cast_15(p: Object): Object[] {
    return p as Array<Object>
  }

  export function runTest(): boolean {
    let a: Array<Object> = [1, 5n, "abc"]
    let b: Object[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object).assertTrue()
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof Object).assertTrue()
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object).assertTrue()
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object).assertTrue()
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof Object).assertTrue()
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object).assertTrue()
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS13_15 {
  function cast_15(p: Object): (Object | undefined)[] {
    return p as Array<(Object | undefined)>
  }

  export function runTest(): boolean {
    let a: Array<(Object | undefined)> = [undefined, 5n, "abc"]
    let b: (Object | undefined)[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object | undefined)).assertTrue()
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object | undefined)).assertTrue()
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object | undefined)).assertTrue()
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object | undefined)).assertTrue()
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object | undefined)).assertTrue()
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object | undefined)).assertTrue()
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS14_15 {
  function cast_15(p: Object): (Object | undefined | null)[] {
    return p as Array<(Object | undefined | null)>
  }

  export function runTest(): boolean {
    let a: Array<(Object | undefined | null)> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object | undefined | null)).assertTrue()
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object | undefined | null)).assertTrue()
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object | undefined | null)).assertTrue()
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object | undefined | null)).assertTrue()
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object | undefined | null)).assertTrue()
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object | undefined | null)).assertTrue()
    expect(a[2]).assertEqual(null)
    return true
  }
}

namespace testNS15_15 {
  function cast_15(p: Object): (Object | undefined | null)[] {
    return p as Array<Object | undefined | null>
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_15(a)
    expect(a instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object | undefined | null)).assertTrue()
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object | undefined | null)).assertTrue()
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object | undefined | null)).assertTrue()
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object | undefined | null)).assertTrue()
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object | undefined | null)).assertTrue()
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object | undefined | null)).assertTrue()
    expect(a[2]).assertEqual(null)
    return true
  }
}

function cast_15(p: Object): number[] {
  return p as Array<number>
}

export default function ArrayTypesIdentityTest04(): void {
  describe('ArrayTypesIdentityTest04', () => {
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
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_1300
     * @tc.name      testArrayTypesIdentity0013
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0013';

      let a: Array<number> = [1, 3, 5]
      let b: number[] = cast_13(a)
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

      expect(testNS1_13.runTest()).assertEqual(true)
      expect(testNS2_13.runTest()).assertEqual(true)
      expect(testNS3_13.runTest()).assertEqual(true)
      expect(testNS4_13.runTest()).assertEqual(true)
      expect(testNS5_13.runTest()).assertEqual(true)
      expect(testNS6_13.runTest()).assertEqual(true)
      expect(testNS7_13.runTest()).assertEqual(true)
      expect(testNS8_13.runTest()).assertEqual(true)
      expect(testNS9_13.runTest()).assertEqual(true)
      expect(testNS10_13.runTest()).assertEqual(true)
      expect(testNS11_13.runTest()).assertEqual(true)
      expect(testNS12_13.runTest()).assertEqual(true)
      expect(testNS13_13.runTest()).assertEqual(true)
      expect(testNS14_13.runTest()).assertEqual(true)
      expect(testNS15_13.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_1400
     * @tc.name      testArrayTypesIdentity0014
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0014';

      let a: Array<number> = [1, 3, 5]
      let b: number[] = cast_14(a)
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

      expect(testNS1_14.runTest()).assertEqual(true)
      expect(testNS2_14.runTest()).assertEqual(true)
      expect(testNS3_14.runTest()).assertEqual(true)
      expect(testNS4_14.runTest()).assertEqual(true)
      expect(testNS5_14.runTest()).assertEqual(true)
      expect(testNS6_14.runTest()).assertEqual(true)
      expect(testNS7_14.runTest()).assertEqual(true)
      expect(testNS8_14.runTest()).assertEqual(true)
      expect(testNS9_14.runTest()).assertEqual(true)
      expect(testNS10_14.runTest()).assertEqual(true)
      expect(testNS11_14.runTest()).assertEqual(true)
      expect(testNS12_14.runTest()).assertEqual(true)
      expect(testNS13_14.runTest()).assertEqual(true)
      expect(testNS14_14.runTest()).assertEqual(true)
      expect(testNS15_14.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_1500
     * @tc.name      testArrayTypesIdentity0015
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0015';

      let a: Array<number> = [1, 3, 5]
      let b: number[] = cast_15(a)
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

      expect(testNS1_15.runTest()).assertEqual(true)
      expect(testNS2_15.runTest()).assertEqual(true)
      expect(testNS3_15.runTest()).assertEqual(true)
      expect(testNS4_15.runTest()).assertEqual(true)
      expect(testNS5_15.runTest()).assertEqual(true)
      expect(testNS6_15.runTest()).assertEqual(true)
      expect(testNS7_15.runTest()).assertEqual(true)
      expect(testNS8_15.runTest()).assertEqual(true)
      expect(testNS9_15.runTest()).assertEqual(true)
      expect(testNS10_15.runTest()).assertEqual(true)
      expect(testNS11_15.runTest()).assertEqual(true)
      expect(testNS12_15.runTest()).assertEqual(true)
      expect(testNS13_15.runTest()).assertEqual(true)
      expect(testNS14_15.runTest()).assertEqual(true)
      expect(testNS15_15.runTest()).assertEqual(true)

    });
  })
}