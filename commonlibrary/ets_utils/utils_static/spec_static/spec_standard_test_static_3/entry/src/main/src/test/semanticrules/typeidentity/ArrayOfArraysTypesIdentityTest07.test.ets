
import { afterAll, afterEach, beforeAll, beforeEach, describe, it, Level, Size, TestType, expect }
  from '../../../../../hypium/index';

function cast_9(p: Object): Array<number[]> {
  return p as Array<number>[]
}

function cast2_9(p: Object): Array<number>[] {
  return p as Array<number[]>
}

namespace testNS1_9 {
  function cast_9(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1, 3], [5, 7]]
    let b: number[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS2_9 {
  function cast_9(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1, 3], [5, 7]]
    let b: number[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS3_9 {
  function cast_9(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1, 3], [5, 7]]
    let b: number[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS4_9 {
  function cast_9(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1, 3], [5, 7]]
    let b: number[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS5_9 {
  function cast_9(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS6_9 {
  function cast_9(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS7_9 {
  function cast_9(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS8_9 {
  function cast_9(p: Object): Array<bigint[]> {
    return p as Array<bigint>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<bigint>> = [[1n, 3n], [5n, 7n]]
    let b: bigint[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'bigint').assertTrue()
    expect(b[0][0]).assertEqual(1n)
    expect(typeof b[0][1] === 'bigint').assertTrue()
    expect(b[0][1]).assertEqual(3n)
    expect(typeof b[1][0] === 'bigint').assertTrue()
    expect(b[1][0]).assertEqual(5n)
    expect(typeof b[1][1] === 'bigint').assertTrue()
    expect(b[1][1]).assertEqual(7n)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'bigint').assertTrue()
    expect(a[0][0]).assertEqual(1n)
    expect(typeof a[0][1] === 'bigint').assertTrue()
    expect(a[0][1]).assertEqual(3n)
    expect(typeof a[1][0] === 'bigint').assertTrue()
    expect(a[1][0]).assertEqual(5n)
    expect(typeof a[1][1] === 'bigint').assertTrue()
    expect(a[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS9_9 {
  function cast_9(p: Object): Array<string[]> {
    return p as Array<string>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<string>> = [["ab", "c"], ["de", "f"]]
    let b: string[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'string').assertTrue()
    expect(b[0][0]).assertEqual("ab")
    expect(typeof b[0][1] === 'string').assertTrue()
    expect(b[0][1]).assertEqual("c")
    expect(typeof b[1][0] === 'string').assertTrue()
    expect(b[1][0]).assertEqual("de")
    expect(typeof b[1][1] === 'string').assertTrue()
    expect(b[1][1]).assertEqual("f")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'string').assertTrue()
    expect(a[0][0]).assertEqual("ab")
    expect(typeof a[0][1] === 'string').assertTrue()
    expect(a[0][1]).assertEqual("c")
    expect(typeof a[1][0] === 'string').assertTrue()
    expect(a[1][0]).assertEqual("de")
    expect(typeof a[1][1] === 'string').assertTrue()
    expect(a[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS10_9 {
  function cast_9(p: Object): Array<string[]> {
    return p as Array<string>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<string>> = [["a", "b"], ["c", "d"]]
    let b: string[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'string').assertTrue()
    expect(b[0][0]).assertEqual("a")
    expect(typeof b[0][1] === 'string').assertTrue()
    expect(b[0][1]).assertEqual("b")
    expect(typeof b[1][0] === 'string').assertTrue()
    expect(b[1][0]).assertEqual("c")
    expect(typeof b[1][1] === 'string').assertTrue()
    expect(b[1][1]).assertEqual("d")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'string').assertTrue()
    expect(a[0][0]).assertEqual("a")
    expect(typeof a[0][1] === 'string').assertTrue()
    expect(a[0][1]).assertEqual("b")
    expect(typeof a[1][0] === 'string').assertTrue()
    expect(a[1][0]).assertEqual("c")
    expect(typeof a[1][1] === 'string').assertTrue()
    expect(a[1][1]).assertEqual("d")
    return true
  }
}

namespace testNS11_9 {
  function cast_9(p: Object): Array<boolean[]> {
    return p as Array<boolean>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<boolean>> = [[false, true], [true, false]]
    let b: boolean[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'boolean').assertTrue()
    expect(b[0][0]).assertEqual(false)
    expect(typeof b[0][1] === 'boolean').assertTrue()
    expect(b[0][1]).assertEqual(true)
    expect(typeof b[1][0] === 'boolean').assertTrue()
    expect(b[1][0]).assertEqual(true)
    expect(typeof b[1][1] === 'boolean').assertTrue()
    expect(b[1][1]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'boolean').assertTrue()
    expect(a[0][0]).assertEqual(false)
    expect(typeof a[0][1] === 'boolean').assertTrue()
    expect(a[0][1]).assertEqual(true)
    expect(typeof a[1][0] === 'boolean').assertTrue()
    expect(a[1][0]).assertEqual(true)
    expect(typeof a[1][1] === 'boolean').assertTrue()
    expect(a[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS12_9 {
  function cast_9(p: Object): Array<Object[]> {
    return p as Array<Object>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<Object>> = [[1, 5n], ["abc", 17.6]]
    let b: Object[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number' || b[0][0] instanceof Object).assertTrue()
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'bigint' || b[0][1] instanceof Object).assertTrue()
    expect(b[0][1]).assertEqual(5n)
    expect(typeof b[1][0] === 'string' || b[1][0] instanceof Object).assertTrue()
    expect(b[1][0]).assertEqual("abc")
    expect(typeof b[1][1] === 'number' || b[1][1] instanceof Object).assertTrue()
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number' || a[0][0] instanceof Object).assertTrue()
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'bigint' || a[0][1] instanceof Object).assertTrue()
    expect(a[0][1]).assertEqual(5n)
    expect(typeof a[1][0] === 'string' || a[1][0] instanceof Object).assertTrue()
    expect(a[1][0]).assertEqual("abc")
    expect(typeof a[1][1] === 'number' || a[1][1] instanceof Object).assertTrue()
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS13_9 {
  function cast_9(p: Object): Array<(Object | undefined)[]> {
    return p as Array<(Object | undefined)>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<(Object | undefined)>> = [[undefined, 5n], ["abc", 17.6]]
    let b: (Object | undefined)[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined).assertTrue()
    expect(b[0][0]).assertEqual(undefined)
    expect(typeof b[0][1] !== 'undefined').assertTrue()
    expect(b[0][1]).assertEqual(5n)
    expect(typeof b[1][0] !== 'undefined').assertTrue()
    expect(b[1][0]).assertEqual("abc")
    expect(typeof b[1][1] !== 'undefined').assertTrue()
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined).assertTrue()
    expect(a[0][0]).assertEqual(undefined)
    expect(typeof a[0][1] !== 'undefined').assertTrue()
    expect(a[0][1]).assertEqual(5n)
    expect(typeof a[1][0] !== 'undefined').assertTrue()
    expect(a[1][0]).assertEqual("abc")
    expect(typeof a[1][1] !== 'undefined').assertTrue()
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS14_9 {
  function cast_9(p: Object): Array<(Object | undefined | null)[]> {
    return p as Array<(Object | undefined | null)>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<(Object | undefined | null)>> = [[undefined, 5n], [null, 17.6]]
    let b: (Object | undefined | null)[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined).assertTrue()
    expect(b[0][0]).assertEqual(undefined)
    expect(typeof b[0][1] !== 'undefined').assertTrue()
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] === null).assertTrue()
    expect(b[1][0]).assertEqual(null)
    expect(typeof b[1][1] !== 'undefined').assertTrue()
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined).assertTrue()
    expect(a[0][0]).assertEqual(undefined)
    expect(typeof a[0][1] !== 'undefined').assertTrue()
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] === null).assertTrue()
    expect(a[1][0]).assertEqual(null)
    expect(typeof a[1][1] !== 'undefined').assertTrue()
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS15_9 {
  function cast_9(p: Object | undefined | null): Array<(Object | undefined | null)[]> {
    return p as Array<Object | undefined | null>[]
  }

  export function runTest_9(): boolean {
    let a: Array<Array<Object | undefined | null>> = [[undefined, 5n], [null, 17.6]]
    let b: (Object | undefined | null)[][] = cast_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined).assertTrue()
    expect(b[0][0]).assertEqual(undefined)
    expect(typeof b[0][1] === 'bigint').assertTrue()
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] === null).assertTrue()
    expect(b[1][0]).assertEqual(null)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined).assertTrue()
    expect(a[0][0]).assertEqual(undefined)
    expect(typeof a[0][1] === 'bigint').assertTrue()
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] === null).assertTrue()
    expect(a[1][0]).assertEqual(null)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS16_9 {
  function cast2_9(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1, 3], [5, 7]]
    let b: number[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS17_9 {
  function cast2_9(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1, 3], [5, 7]]
    let b: number[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS18_9 {
  function cast2_9(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1, 3], [5, 7]]
    let b: number[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS19_9 {
  function cast2_9(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1, 3], [5, 7]]
    let b: number[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS20_9 {
  function cast2_9(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS21_9 {
  function cast2_9(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS22_9 {
  function cast2_9(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<number>> = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertTrue()
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertTrue()
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertTrue()
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertTrue()
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertTrue()
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertTrue()
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS23_9 {
  function cast2_9(p: Object): Array<bigint>[] {
    return p as Array<bigint[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<bigint>> = [[1n, 3n], [5n, 7n]]
    let b: bigint[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'bigint').assertTrue()
    expect(b[0][0]).assertEqual(1n)
    expect(typeof b[0][1] === 'bigint').assertTrue()
    expect(b[0][1]).assertEqual(3n)
    expect(typeof b[1][0] === 'bigint').assertTrue()
    expect(b[1][0]).assertEqual(5n)
    expect(typeof b[1][1] === 'bigint').assertTrue()
    expect(b[1][1]).assertEqual(7n)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'bigint').assertTrue()
    expect(a[0][0]).assertEqual(1n)
    expect(typeof a[0][1] === 'bigint').assertTrue()
    expect(a[0][1]).assertEqual(3n)
    expect(typeof a[1][0] === 'bigint').assertTrue()
    expect(a[1][0]).assertEqual(5n)
    expect(typeof a[1][1] === 'bigint').assertTrue()
    expect(a[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS24_9 {
  function cast2_9(p: Object): Array<string>[] {
    return p as Array<string[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<string>> = [["ab", "c"], ["de", "f"]]
    let b: string[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'string').assertTrue()
    expect(b[0][0]).assertEqual("ab")
    expect(typeof b[0][1] === 'string').assertTrue()
    expect(b[0][1]).assertEqual("c")
    expect(typeof b[1][0] === 'string').assertTrue()
    expect(b[1][0]).assertEqual("de")
    expect(typeof b[1][1] === 'string').assertTrue()
    expect(b[1][1]).assertEqual("f")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'string').assertTrue()
    expect(a[0][0]).assertEqual("ab")
    expect(typeof a[0][1] === 'string').assertTrue()
    expect(a[0][1]).assertEqual("c")
    expect(typeof a[1][0] === 'string').assertTrue()
    expect(a[1][0]).assertEqual("de")
    expect(typeof a[1][1] === 'string').assertTrue()
    expect(a[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS25_9 {
  function cast2_9(p: Object): Array<string>[] {
    return p as Array<string[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<string>> = [["a", "b"], ["c", "d"]]
    let b: string[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'string').assertTrue()
    expect(b[0][0]).assertEqual("a")
    expect(typeof b[0][1] === 'string').assertTrue()
    expect(b[0][1]).assertEqual("b")
    expect(typeof b[1][0] === 'string').assertTrue()
    expect(b[1][0]).assertEqual("c")
    expect(typeof b[1][1] === 'string').assertTrue()
    expect(b[1][1]).assertEqual("d")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'string').assertTrue()
    expect(a[0][0]).assertEqual("a")
    expect(typeof a[0][1] === 'string').assertTrue()
    expect(a[0][1]).assertEqual("b")
    expect(typeof a[1][0] === 'string').assertTrue()
    expect(a[1][0]).assertEqual("c")
    expect(typeof a[1][1] === 'string').assertTrue()
    expect(a[1][1]).assertEqual("d")
    return true
  }
}

namespace testNS26_9 {
  function cast2_9(p: Object): Array<boolean>[] {
    return p as Array<boolean[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<boolean>> = [[false, true], [true, false]]
    let b: boolean[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'boolean').assertTrue()
    expect(b[0][0]).assertEqual(false)
    expect(typeof b[0][1] === 'boolean').assertTrue()
    expect(b[0][1]).assertEqual(true)
    expect(typeof b[1][0] === 'boolean').assertTrue()
    expect(b[1][0]).assertEqual(true)
    expect(typeof b[1][1] === 'boolean').assertTrue()
    expect(b[1][1]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'boolean').assertTrue()
    expect(a[0][0]).assertEqual(false)
    expect(typeof a[0][1] === 'boolean').assertTrue()
    expect(a[0][1]).assertEqual(true)
    expect(typeof a[1][0] === 'boolean').assertTrue()
    expect(a[1][0]).assertEqual(true)
    expect(typeof a[1][1] === 'boolean').assertTrue()
    expect(a[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS27_9 {
  function cast2_9(p: Object): Array<Object>[] {
    return p as Array<Object[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<Object>> = [[1, 5n], ["abc", 17.6]]
    let b: Object[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number' || b[0][0] instanceof Object).assertTrue()
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'bigint' || b[0][1] instanceof Object).assertTrue()
    expect(b[0][1]).assertEqual(5n)
    expect(typeof b[1][0] === 'string' || b[1][0] instanceof Object).assertTrue()
    expect(b[1][0]).assertEqual("abc")
    expect(typeof b[1][1] === 'number' || b[1][1] instanceof Object).assertTrue()
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number' || a[0][0] instanceof Object).assertTrue()
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'bigint' || a[0][1] instanceof Object).assertTrue()
    expect(a[0][1]).assertEqual(5n)
    expect(typeof a[1][0] === 'string' || a[1][0] instanceof Object).assertTrue()
    expect(a[1][0]).assertEqual("abc")
    expect(typeof a[1][1] === 'number' || a[1][1] instanceof Object).assertTrue()
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS28_9 {
  function cast2_9(p: Object): Array<(Object | undefined)>[] {
    return p as Array<(Object | undefined)[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<(Object | undefined)>> = [[undefined, 5n], ["abc", 17.6]]
    let b: (Object | undefined)[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined).assertTrue()
    expect(b[0][0]).assertEqual(undefined)
    expect(typeof b[0][1] !== 'undefined').assertTrue()
    expect(b[0][1]).assertEqual(5n)
    expect(typeof b[1][0] !== 'undefined').assertTrue()
    expect(b[1][0]).assertEqual("abc")
    expect(typeof b[1][1] !== 'undefined').assertTrue()
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined).assertTrue()
    expect(a[0][0]).assertEqual(undefined)
    expect(typeof a[0][1] !== 'undefined').assertTrue()
    expect(a[0][1]).assertEqual(5n)
    expect(typeof a[1][0] !== 'undefined').assertTrue()
    expect(a[1][0]).assertEqual("abc")
    expect(typeof a[1][1] !== 'undefined').assertTrue()
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS29_9 {
  function cast2_9(p: Object): Array<(Object | undefined | null)>[] {
    return p as Array<(Object | undefined | null)[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<(Object | undefined | null)>> = [[undefined, 5n], [null, 17.6]]
    let b: (Object | undefined | null)[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined).assertTrue()
    expect(b[0][0]).assertEqual(undefined)
    expect(typeof b[0][1] !== 'undefined').assertTrue()
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] === null).assertTrue()
    expect(b[1][0]).assertEqual(null)
    expect(typeof b[1][1] !== 'undefined').assertTrue()
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined).assertTrue()
    expect(a[0][0]).assertEqual(undefined)
    expect(typeof a[0][1] !== 'undefined').assertTrue()
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] === null).assertTrue()
    expect(a[1][0]).assertEqual(null)
    expect(typeof a[1][1] !== 'undefined').assertTrue()
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS30_9 {
  function cast2_9(p: Object | undefined | null): Array<Object | undefined | null>[] {
    return p as Array<(Object | undefined | null)[]>
  }

  export function runTest_9(): boolean {
    let a: Array<Array<Object | undefined | null>> = [[undefined, 5n], [null, 17.6]]
    let b: (Object | undefined | null)[][] = cast2_9(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined).assertTrue()
    expect(b[0][0]).assertEqual(undefined)
    expect(typeof b[0][1] === 'bigint').assertTrue()
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] === null).assertTrue()
    expect(b[1][0]).assertEqual(null)
    expect(typeof b[1][1] === 'number').assertTrue()
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined).assertTrue()
    expect(a[0][0]).assertEqual(undefined)
    expect(typeof a[0][1] === 'bigint').assertTrue()
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] === null).assertTrue()
    expect(a[1][0]).assertEqual(null)
    expect(typeof a[1][1] === 'number').assertTrue()
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

export default function ArrayOfArraysTypesIdentityTest07(): void{
  describe('ArrayOfArraysTypesIdentityTest07', () => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_OF_ARRAYS_TYPES_IDENTITY_1900
     * @tc.name      testArrayOfArraysTypesIdentity0019
     * @tc.desc      Verify binary overflow logic with T_type_2 check and 3 test namespace validations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testArrayOfArraysTypesIdentity0019"
      let a: Array<Array<number>> = [[1, 3], [5, 7]]
      let b: number[][] = cast_9(a)
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(b instanceof Array).assertTrue()
      expect(b[0] instanceof Array).assertTrue()
      expect(b[1] instanceof Array).assertTrue()
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(typeof b[0][0] === 'number').assertTrue()
      expect(b[0][0]).assertEqual(1)
      expect(typeof b[0][1] === 'number').assertTrue()
      expect(b[0][1]).assertEqual(3)
      expect(typeof b[1][0] === 'number').assertTrue()
      expect(b[1][0]).assertEqual(5)
      expect(typeof b[1][1] === 'number').assertTrue()
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(typeof a[0][0] === 'number').assertTrue()
      expect(a[0][0]).assertEqual(1)
      expect(typeof a[0][1] === 'number').assertTrue()
      expect(a[0][1]).assertEqual(3)
      expect(typeof a[1][0] === 'number').assertTrue()
      expect(a[1][0]).assertEqual(5)
      expect(typeof a[1][1] === 'number').assertTrue()
      expect(a[1][1]).assertEqual(7)

      expect(testNS1_9.runTest_9()).assertTrue()
      expect(testNS2_9.runTest_9()).assertTrue()
      expect(testNS3_9.runTest_9()).assertTrue()
      expect(testNS4_9.runTest_9()).assertTrue()
      expect(testNS5_9.runTest_9()).assertTrue()
      expect(testNS6_9.runTest_9()).assertTrue()
      expect(testNS7_9.runTest_9()).assertTrue()
      expect(testNS8_9.runTest_9()).assertTrue()
      expect(testNS9_9.runTest_9()).assertTrue()
      expect(testNS10_9.runTest_9()).assertTrue()
      expect(testNS11_9.runTest_9()).assertTrue()
      expect(testNS12_9.runTest_9()).assertTrue()
      expect(testNS13_9.runTest_9()).assertTrue()
      expect(testNS14_9.runTest_9()).assertTrue()
      expect(testNS15_9.runTest_9()).assertTrue()
    });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_ARRAYS_TYPES_IDENTITY_2000
     * @tc.name      testArrayOfArraysTypesIdentity0020
     * @tc.desc      Verify binary overflow logic with T_type_2 check and 3 test namespace validations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testArrayOfArraysTypesIdentity0020"
      let a: Array<Array<number>> = [[1, 3], [5, 7]]
      let b: number[][] = cast2_9(a)
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(b instanceof Array).assertTrue()
      expect(b[0] instanceof Array).assertTrue()
      expect(b[1] instanceof Array).assertTrue()
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(typeof b[0][0] === 'number').assertTrue()
      expect(b[0][0]).assertEqual(1)
      expect(typeof b[0][1] === 'number').assertTrue()
      expect(b[0][1]).assertEqual(3)
      expect(typeof b[1][0] === 'number').assertTrue()
      expect(b[1][0]).assertEqual(5)
      expect(typeof b[1][1] === 'number').assertTrue()
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(typeof a[0][0] === 'number').assertTrue()
      expect(a[0][0]).assertEqual(1)
      expect(typeof a[0][1] === 'number').assertTrue()
      expect(a[0][1]).assertEqual(3)
      expect(typeof a[1][0] === 'number').assertTrue()
      expect(a[1][0]).assertEqual(5)
      expect(typeof a[1][1] === 'number').assertTrue()
      expect(a[1][1]).assertEqual(7)

      expect(testNS16_9.runTest_9()).assertTrue()
      expect(testNS17_9.runTest_9()).assertTrue()
      expect(testNS18_9.runTest_9()).assertTrue()
      expect(testNS19_9.runTest_9()).assertTrue()
      expect(testNS20_9.runTest_9()).assertTrue()
      expect(testNS21_9.runTest_9()).assertTrue()
      expect(testNS22_9.runTest_9()).assertTrue()
      expect(testNS23_9.runTest_9()).assertTrue()
      expect(testNS24_9.runTest_9()).assertTrue()
      expect(testNS25_9.runTest_9()).assertTrue()
      expect(testNS26_9.runTest_9()).assertTrue()
      expect(testNS27_9.runTest_9()).assertTrue()
      expect(testNS28_9.runTest_9()).assertTrue()
      expect(testNS29_9.runTest_9()).assertTrue()
      expect(testNS30_9.runTest_9()).assertTrue()
    });
  });
}