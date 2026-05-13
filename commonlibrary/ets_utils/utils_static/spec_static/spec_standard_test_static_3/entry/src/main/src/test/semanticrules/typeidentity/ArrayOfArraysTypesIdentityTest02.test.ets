import { afterAll, afterEach, beforeAll, beforeEach, describe, it, Level, Size, TestType, expect }
  from '../../../../../hypium/index';

class C_3 {
  data: number = 0
}

function cast_3(p: Object): Array<Array<number>> {
  return p as Array<Array<number>>
}

namespace testNS1_3 {
  class C_3 {
    data: number = 0
  }

  export function runTest(): boolean {
    let a: C_3[][] = [[{data: 1} as C_3, {data: 3} as C_3], [{data: 5} as C_3, {data: 7} as C_3]]
    let b: Array<Array<C_3>> = a
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C_3).assertTrue()
    expect(typeof b[0][0].data === 'number').assertTrue()
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C_3).assertTrue()
    expect(typeof b[0][1].data === 'number').assertTrue()
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C_3).assertTrue()
    expect(typeof b[1][0].data === 'number').assertTrue()
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C_3).assertTrue()
    expect(typeof b[1][1].data === 'number').assertTrue()
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C_3).assertTrue()
    expect(typeof a[0][0].data === 'number').assertTrue()
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C_3).assertTrue()
    expect(typeof a[0][1].data === 'number').assertTrue()
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C_3).assertTrue()
    expect(typeof a[1][0].data === 'number').assertTrue()
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C_3).assertTrue()
    expect(typeof a[1][1].data === 'number').assertTrue()
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}

namespace testNS2_3 {
  class C_3 {
    data: number = 0
  }

  export function runTest(): boolean {
    let a: Array<Array<C_3>> = [[{data: 1} as C_3, {data: 3} as C_3], [{data: 5} as C_3, {data: 7} as C_3]]
    let b: C_3[][] = a
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C_3).assertTrue()
    expect(typeof b[0][0].data === 'number').assertTrue()
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C_3).assertTrue()
    expect(typeof b[0][1].data === 'number').assertTrue()
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C_3).assertTrue()
    expect(typeof b[1][0].data === 'number').assertTrue()
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C_3).assertTrue()
    expect(typeof b[1][1].data === 'number').assertTrue()
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C_3).assertTrue()
    expect(typeof a[0][0].data === 'number').assertTrue()
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C_3).assertTrue()
    expect(typeof a[0][1].data === 'number').assertTrue()
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C_3).assertTrue()
    expect(typeof a[1][0].data === 'number').assertTrue()
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C_3).assertTrue()
    expect(typeof a[1][1].data === 'number').assertTrue()
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}

namespace testNS3_3 {
  class C_3 {
    data: number = 0
  }

  export function runTest(): boolean {
    let a: Array<C_3[]> = [[{data: 1} as C_3, {data: 3} as C_3], [{data: 5} as C_3, {data: 7} as C_3]]
    let b: Array<C_3>[] = a
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C_3).assertTrue()
    expect(typeof b[0][0].data === 'number').assertTrue()
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C_3).assertTrue()
    expect(typeof b[0][1].data === 'number').assertTrue()
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C_3).assertTrue()
    expect(typeof b[1][0].data === 'number').assertTrue()
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C_3).assertTrue()
    expect(typeof b[1][1].data === 'number').assertTrue()
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C_3).assertTrue()
    expect(typeof a[0][0].data === 'number').assertTrue()
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C_3).assertTrue()
    expect(typeof a[0][1].data === 'number').assertTrue()
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C_3).assertTrue()
    expect(typeof a[1][0].data === 'number').assertTrue()
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C_3).assertTrue()
    expect(typeof a[1][1].data === 'number').assertTrue()
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}

namespace testNS4_3 {
  class C_3 {
    data: number = 0
  }

  export function runTest(): boolean {
    let a: Array<C_3>[] = [[{data: 1} as C_3, {data: 3} as C_3], [{data: 5} as C_3, {data: 7} as C_3]]
    let b: Array<C_3[]> = a
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C_3).assertTrue()
    expect(typeof b[0][0].data === 'number').assertTrue()
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C_3).assertTrue()
    expect(typeof b[0][1].data === 'number').assertTrue()
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C_3).assertTrue()
    expect(typeof b[1][0].data === 'number').assertTrue()
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C_3).assertTrue()
    expect(typeof b[1][1].data === 'number').assertTrue()
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C_3).assertTrue()
    expect(typeof a[0][0].data === 'number').assertTrue()
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C_3).assertTrue()
    expect(typeof a[0][1].data === 'number').assertTrue()
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C_3).assertTrue()
    expect(typeof a[1][0].data === 'number').assertTrue()
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C_3).assertTrue()
    expect(typeof a[1][1].data === 'number').assertTrue()
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}

namespace testNS5_3 {
  function cast_3(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = cast_3(a)
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

namespace testNS6_3 {
  function cast_3(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = cast_3(a)
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

namespace testNS7_3 {
  function cast_3(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = cast_3(a)
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

namespace testNS8_3 {
  function cast_3(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = cast_3(a)
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

namespace testNS9_3 {
  function cast_3(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = cast_3(a)
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

namespace testNS10_3 {
  function cast_3(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = cast_3(a)
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

namespace testNS11_3 {
  function cast_3(p: Object): Array<Array<bigint>> {
    return p as Array<Array<bigint>>
  }

  export function runTest(): boolean {
    let a: bigint[][] = [[1n, 3n], [5n, 7n]]
    let b: Array<Array<bigint>> = cast_3(a)
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

namespace testNS12_3 {
  function cast_3(p: Object): Array<Array<string>> {
    return p as Array<Array<string>>
  }

  export function runTest(): boolean {
    let a: string[][] = [["ab", "c"], ["de", "f"]]
    let b: Array<Array<string>> = cast_3(a)
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

namespace testNS13_3 {
  function cast_3(p: Object): Array<Array<string>> {
    return p as Array<Array<string>>
  }

  export function runTest(): boolean {
    let a: string[][] = [["a", "b"], ["c", "d"]]
    let b: Array<Array<string>> = cast_3(a)
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

namespace testNS14_3 {
  function cast_3(p: Object): Array<Array<boolean>> {
    return p as Array<Array<boolean>>
  }

  export function runTest(): boolean {
    let a: boolean[][] = [[false, true], [true, false]]
    let b: Array<Array<boolean>> = cast_3(a)
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

namespace testNS15_3 {
  function cast_3(p: Object): Array<Array<Object>> {
    return p as Array<Array<Object>>
  }

  export function runTest(): boolean {
    let a: Object[][] = [[1, 5n], ["abc", 17.6]]
    let b: Array<Array<Object>> = cast_3(a)
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

namespace testNS16_3 {
  function cast_3(p: Object): Array<Array<(Object | undefined)>> {
    return p as Array<Array<(Object | undefined)>>
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[][] = [[undefined, 5n], ["abc", 17.6]]
    let b: Array<Array<(Object | undefined)>> = cast_3(a)
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

namespace testNS17_3 {
  function cast_3(p: Object): Array<Array<(Object | undefined | null)>> {
    return p as Array<Array<(Object | undefined | null)>>
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[][] = [[undefined, 5n], [null, 17.6]]
    let b: Array<Array<(Object | undefined | null)>> = cast_3(a)
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

namespace testNS18_3 {
  function cast_3(p: (Object | undefined | null)): Array<Array<Object | undefined | null>> {
    return p as Array<Array<Object | undefined | null>>
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[][] = [[undefined, 5n], [null, 17.6]]
    let b: Array<Array<Object | undefined | null>> = cast_3(a)
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

export default function ArrayOfArraysTypesIdentityTest02(): void{
  describe('ArrayOfArraysTypesIdentityTest02', () => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_OF_ARRAYS_TYPES_IDENTITY_0500
     * @tc.name      testArrayOfArraysTypesIdentity0005
     * @tc.desc      Verify binary overflow logic with T_type_2 check and 3 test namespace validations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testArrayOfArraysTypesIdentity0005"
      expect(testNS1_3.runTest()).assertTrue()
      expect(testNS2_3.runTest()).assertTrue()
      expect(testNS3_3.runTest()).assertTrue()
      expect(testNS4_3.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_ARRAYS_TYPES_IDENTITY_0600
     * @tc.name      testArrayOfArraysTypesIdentity0006
     * @tc.desc      Verify binary overflow logic with T_type_2 check and 3 test namespace validations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testArrayOfArraysTypesIdentity0006"
      let a: C_3[][] = [[{data: 1} as C_3, {data: 3} as C_3], [{data: 5} as C_3, {data: 7} as C_3]]
      let b: Array<Array<C_3>> = a
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(b instanceof Array).assertTrue()
      expect(b[0] instanceof Array).assertTrue()
      expect(b[1] instanceof Array).assertTrue()
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C_3).assertTrue()
      expect(typeof b[0][0].data === 'number').assertTrue()
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C_3).assertTrue()
      expect(typeof b[0][1].data === 'number').assertTrue()
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C_3).assertTrue()
      expect(typeof b[1][0].data === 'number').assertTrue()
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C_3).assertTrue()
      expect(typeof b[1][1].data === 'number').assertTrue()
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C_3).assertTrue()
      expect(typeof a[0][0].data === 'number').assertTrue()
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C_3).assertTrue()
      expect(typeof a[0][1].data === 'number').assertTrue()
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C_3).assertTrue()
      expect(typeof a[1][0].data === 'number').assertTrue()
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C_3).assertTrue()
      expect(typeof a[1][1].data === 'number').assertTrue()
      expect(a[1][1].data).assertEqual(7)
    });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_ARRAYS_TYPES_IDENTITY_0700
     * @tc.name      testArrayOfArraysTypesIdentity0007
     * @tc.desc      Verify binary overflow logic with T_type_2 check and 3 test namespace validations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testArrayOfArraysTypesIdentity0007"
      let a: Array<Array<C_3>> = [[{data: 1} as C_3, {data: 3} as C_3], [{data: 5} as C_3, {data: 7} as C_3]]
      let b: C_3[][] = a
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(b instanceof Array).assertTrue()
      expect(b[0] instanceof Array).assertTrue()
      expect(b[1] instanceof Array).assertTrue()
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C_3).assertTrue()
      expect(typeof b[0][0].data === 'number').assertTrue()
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C_3).assertTrue()
      expect(typeof b[0][1].data === 'number').assertTrue()
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C_3).assertTrue()
      expect(typeof b[1][0].data === 'number').assertTrue()
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C_3).assertTrue()
      expect(typeof b[1][1].data === 'number').assertTrue()
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C_3).assertTrue()
      expect(typeof a[0][0].data === 'number').assertTrue()
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C_3).assertTrue()
      expect(typeof a[0][1].data === 'number').assertTrue()
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C_3).assertTrue()
      expect(typeof a[1][0].data === 'number').assertTrue()
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C_3).assertTrue()
      expect(typeof a[1][1].data === 'number').assertTrue()
      expect(a[1][1].data).assertEqual(7)
    });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_ARRAYS_TYPES_IDENTITY_0800
     * @tc.name      testArrayOfArraysTypesIdentity0008
     * @tc.desc      Verify binary overflow logic with T_type_2 check and 3 test namespace validations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testArrayOfArraysTypesIdentity0008"
      let a: Array<C_3[]> = [[{data: 1} as C_3, {data: 3} as C_3], [{data: 5} as C_3, {data: 7} as C_3]]
      let b: Array<C_3>[] = a
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(b instanceof Array).assertTrue()
      expect(b[0] instanceof Array).assertTrue()
      expect(b[1] instanceof Array).assertTrue()
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C_3).assertTrue()
      expect(typeof b[0][0].data === 'number').assertTrue()
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C_3).assertTrue()
      expect(typeof b[0][1].data === 'number').assertTrue()
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C_3).assertTrue()
      expect(typeof b[1][0].data === 'number').assertTrue()
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C_3).assertTrue()
      expect(typeof b[1][1].data === 'number').assertTrue()
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C_3).assertTrue()
      expect(typeof a[0][0].data === 'number').assertTrue()
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C_3).assertTrue()
      expect(typeof a[0][1].data === 'number').assertTrue()
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C_3).assertTrue()
      expect(typeof a[1][0].data === 'number').assertTrue()
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C_3).assertTrue()
      expect(typeof a[1][1].data === 'number').assertTrue()
      expect(a[1][1].data).assertEqual(7)
    });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_ARRAYS_TYPES_IDENTITY_0900
     * @tc.name      testArrayOfArraysTypesIdentity0009
     * @tc.desc      Verify binary overflow logic with T_type_2 check and 3 test namespace validations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testArrayOfArraysTypesIdentity0009"
      let a: Array<C_3>[] = [[{data: 1} as C_3, {data: 3} as C_3], [{data: 5} as C_3, {data: 7} as C_3]]
      let b: Array<C_3[]> = a
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(b instanceof Array).assertTrue()
      expect(b[0] instanceof Array).assertTrue()
      expect(b[1] instanceof Array).assertTrue()
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C_3).assertTrue()
      expect(typeof b[0][0].data === 'number').assertTrue()
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C_3).assertTrue()
      expect(typeof b[0][1].data === 'number').assertTrue()
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C_3).assertTrue()
      expect(typeof b[1][0].data === 'number').assertTrue()
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C_3).assertTrue()
      expect(typeof b[1][1].data === 'number').assertTrue()
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C_3).assertTrue()
      expect(typeof a[0][0].data === 'number').assertTrue()
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C_3).assertTrue()
      expect(typeof a[0][1].data === 'number').assertTrue()
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C_3).assertTrue()
      expect(typeof a[1][0].data === 'number').assertTrue()
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C_3).assertTrue()
      expect(typeof a[1][1].data === 'number').assertTrue()
      expect(a[1][1].data).assertEqual(7)
    });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_ARRAYS_TYPES_IDENTITY_1000
     * @tc.name      testArrayOfArraysTypesIdentity0010
     * @tc.desc      Verify binary overflow logic with T_type_2 check and 3 test namespace validations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testArrayOfArraysTypesIdentity0010"
      let a: number[][] = [[1, 3], [5, 7]]
      let b: Array<Array<number>> = cast_3(a)
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

      expect(testNS5_3.runTest()).assertTrue()
      expect(testNS6_3.runTest()).assertTrue()
      expect(testNS7_3.runTest()).assertTrue()
      expect(testNS8_3.runTest()).assertTrue()
      expect(testNS9_3.runTest()).assertTrue()
      expect(testNS10_3.runTest()).assertTrue()
      expect(testNS11_3.runTest()).assertTrue()
      expect(testNS12_3.runTest()).assertTrue()
      expect(testNS13_3.runTest()).assertTrue()
      expect(testNS14_3.runTest()).assertTrue()
      expect(testNS15_3.runTest()).assertTrue()
      expect(testNS16_3.runTest()).assertTrue()
      expect(testNS17_3.runTest()).assertTrue()
      expect(testNS18_3.runTest()).assertTrue()
    });
  });
}