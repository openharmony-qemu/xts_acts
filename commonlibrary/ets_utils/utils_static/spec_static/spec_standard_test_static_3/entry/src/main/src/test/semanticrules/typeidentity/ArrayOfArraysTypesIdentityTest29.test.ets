import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace testNS303 {
  class C {data: int = 0}
  function cast(p: Object): Array<C>[] {
    return p as Array<C[]>
  }

  export function runTest(): boolean {
    let a: Array<C>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C[]> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}

class C {data: int = 0}
function cast(p: Object): Array<C>[] {
  return p as Array<C[]>
}

namespace testNS304 {
  function foo(p: Array<Array<int>>): Array<Array<int>> {
    return p
  }

  export function runTest(): boolean {
    let a: int[][] = [[1, 3], [5, 7]]
    let b: Array<Array<int>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof int).assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1] instanceof int).assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0] instanceof int).assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1] instanceof int).assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof int).assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1] instanceof int).assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0] instanceof int).assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1] instanceof int).assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS305 {
  function foo(p: Array<Array<long>>): Array<Array<long>> {
    return p
  }

  export function runTest(): boolean {
    let a: long[][] = [[1, 3], [5, 7]]
    let b: Array<Array<long>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof long).assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1] instanceof long).assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0] instanceof long).assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1] instanceof long).assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof long).assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1] instanceof long).assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0] instanceof long).assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1] instanceof long).assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS306 {
  function foo(p: Array<Array<byte>>): Array<Array<byte>> {
    return p
  }

  export function runTest(): boolean {
    let a: byte[][] = [[1, 3], [5, 7]]
    let b: Array<Array<byte>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof byte).assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1] instanceof byte).assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0] instanceof byte).assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1] instanceof byte).assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof byte).assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1] instanceof byte).assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0] instanceof byte).assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1] instanceof byte).assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS307 {
  function foo(p: Array<Array<short>>): Array<Array<short>> {
    return p
  }

  export function runTest(): boolean {
    let a: short[][] = [[1, 3], [5, 7]]
    let b: Array<Array<short>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof short).assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1] instanceof short).assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0] instanceof short).assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1] instanceof short).assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof short).assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1] instanceof short).assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0] instanceof short).assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1] instanceof short).assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS308 {
  function foo(p: Array<Array<double>>): Array<Array<double>> {
    return p
  }

  export function runTest(): boolean {
    let a: double[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<double>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof double).assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(b[0][1] instanceof double).assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(b[1][0] instanceof double).assertEqual(true)
    expect(b[1][0]).assertEqual(5.4)
    expect(b[1][1] instanceof double).assertEqual(true)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof double).assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(a[0][1] instanceof double).assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(a[1][0] instanceof double).assertEqual(true)
    expect(a[1][0]).assertEqual(5.4)
    expect(a[1][1] instanceof double).assertEqual(true)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS309 {
  function foo(p: Array<Array<number>>): Array<Array<number>> {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof number).assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(b[0][1] instanceof number).assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(b[1][0] instanceof number).assertEqual(true)
    expect(b[1][0]).assertEqual(5.4)
    expect(b[1][1] instanceof number).assertEqual(true)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof number).assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(a[0][1] instanceof number).assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(a[1][0] instanceof number).assertEqual(true)
    expect(a[1][0]).assertEqual(5.4)
    expect(a[1][1] instanceof number).assertEqual(true)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS310 {
  function foo(p: Array<Array<float>>): Array<Array<float>> {
    return p
  }

  export function runTest(): boolean {
    let a: float[][] = [[1.5f, 3.7f], [5.4f, 7.8f]]
    let b: Array<Array<float>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof float).assertEqual(true)
    expect(b[0][0]).assertEqual(1.5f)
    expect(b[0][1] instanceof float).assertEqual(true)
    expect(b[0][1]).assertEqual(3.7f)
    expect(b[1][0] instanceof float).assertEqual(true)
    expect(b[1][0]).assertEqual(5.4f)
    expect(b[1][1] instanceof float).assertEqual(true)
    expect(b[1][1]).assertEqual(7.8f)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof float).assertEqual(true)
    expect(a[0][0]).assertEqual(1.5f)
    expect(a[0][1] instanceof float).assertEqual(true)
    expect(a[0][1]).assertEqual(3.7f)
    expect(a[1][0] instanceof float).assertEqual(true)
    expect(a[1][0]).assertEqual(5.4f)
    expect(a[1][1] instanceof float).assertEqual(true)
    expect(a[1][1]).assertEqual(7.8f)
    return true
  }
}

namespace testNS311 {
  function foo(p: Array<Array<bigint>>): Array<Array<bigint>> {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[][] = [[1n, 3n], [5n, 7n]]
    let b: Array<Array<bigint>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof bigint).assertEqual(true)
    expect(b[0][0]).assertEqual(1n)
    expect(b[0][1] instanceof bigint).assertEqual(true)
    expect(b[0][1]).assertEqual(3n)
    expect(b[1][0] instanceof bigint).assertEqual(true)
    expect(b[1][0]).assertEqual(5n)
    expect(b[1][1] instanceof bigint).assertEqual(true)
    expect(b[1][1]).assertEqual(7n)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof bigint).assertEqual(true)
    expect(a[0][0]).assertEqual(1n)
    expect(a[0][1] instanceof bigint).assertEqual(true)
    expect(a[0][1]).assertEqual(3n)
    expect(a[1][0] instanceof bigint).assertEqual(true)
    expect(a[1][0]).assertEqual(5n)
    expect(a[1][1] instanceof bigint).assertEqual(true)
    expect(a[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS312 {
  function foo(p: Array<Array<string>>): Array<Array<string>> {
    return p
  }

  export function runTest(): boolean {
    let a: string[][] = [["ab", "c"], ["de", "f"]]
    let b: Array<Array<string>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof string).assertEqual(true)
    expect(b[0][0]).assertEqual("ab")
    expect(b[0][1] instanceof string).assertEqual(true)
    expect(b[0][1]).assertEqual("c")
    expect(b[1][0] instanceof string).assertEqual(true)
    expect(b[1][0]).assertEqual("de")
    expect(b[1][1] instanceof string).assertEqual(true)
    expect(b[1][1]).assertEqual("f")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof string).assertEqual(true)
    expect(a[0][0]).assertEqual("ab")
    expect(a[0][1] instanceof string).assertEqual(true)
    expect(a[0][1]).assertEqual("c")
    expect(a[1][0] instanceof string).assertEqual(true)
    expect(a[1][0]).assertEqual("de")
    expect(a[1][1] instanceof string).assertEqual(true)
    expect(a[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS313 {
  function foo(p: Array<Array<char>>): Array<Array<char>> {
    return p
  }

  export function runTest(): boolean {
    let a: char[][] = [[c'a', c'b'], [c'c', c'd']]
    let b: Array<Array<char>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof char).assertEqual(true)
    expect(b[0][0]).assertEqual(c'a')
    expect(b[0][1] instanceof char).assertEqual(true)
    expect(b[0][1]).assertEqual(c'b')
    expect(b[1][0] instanceof char).assertEqual(true)
    expect(b[1][0]).assertEqual(c'c')
    expect(b[1][1] instanceof char).assertEqual(true)
    expect(b[1][1]).assertEqual(c'd')
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof char).assertEqual(true)
    expect(a[0][0]).assertEqual(c'a')
    expect(a[0][1] instanceof char).assertEqual(true)
    expect(a[0][1]).assertEqual(c'b')
    expect(a[1][0] instanceof char).assertEqual(true)
    expect(a[1][0]).assertEqual(c'c')
    expect(a[1][1] instanceof char).assertEqual(true)
    expect(a[1][1]).assertEqual(c'd')
    return true
  }
}

namespace testNS314 {
  function foo(p: Array<Array<boolean>>): Array<Array<boolean>> {
    return p
  }

  export function runTest(): boolean {
    let a: boolean[][] = [[false, true], [true, false]]
    let b: Array<Array<boolean>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof boolean).assertEqual(true)
    expect(b[0][0]).assertEqual(false)
    expect(b[0][1] instanceof boolean).assertEqual(true)
    expect(b[0][1]).assertEqual(true)
    expect(b[1][0] instanceof boolean).assertEqual(true)
    expect(b[1][0]).assertEqual(true)
    expect(b[1][1] instanceof boolean).assertEqual(true)
    expect(b[1][1]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof boolean).assertEqual(true)
    expect(a[0][0]).assertEqual(false)
    expect(a[0][1] instanceof boolean).assertEqual(true)
    expect(a[0][1]).assertEqual(true)
    expect(a[1][0] instanceof boolean).assertEqual(true)
    expect(a[1][0]).assertEqual(true)
    expect(a[1][1] instanceof boolean).assertEqual(true)
    expect(a[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS315 {
  function foo(p: Array<Array<Object>>): Array<Array<Object>> {
    return p
  }

  export function runTest(): boolean {
    let a: Object[][] = [[1, 5n], ["abc", 17.6]]
    let b: Array<Array<Object>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof Object).assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1] instanceof Object).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] instanceof Object).assertEqual(true)
    expect(b[1][0]).assertEqual("abc")
    expect(b[1][1] instanceof Object).assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof Object).assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1] instanceof Object).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] instanceof Object).assertEqual(true)
    expect(a[1][0]).assertEqual("abc")
    expect(a[1][1] instanceof Object).assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS316 {
  function foo(p: Array<Array<(Object | undefined)>>): Array<Array<(Object | undefined)>> {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[][] = [[undefined, 5n], ["abc", 17.6]]
    let b: Array<Array<(Object | undefined)>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0]).assertEqual("abc")
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0]).assertEqual("abc")
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS317 {
  function foo(p: Array<Array<(Object | undefined | null)>>): Array<Array<(Object | undefined | null)>> {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[][] = [[undefined, 5n], [null, 17.6]]
    let b: Array<Array<(Object | undefined | null)>> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0]).assertEqual(null)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}
namespace testNS318 {
  type AnyValue = undefined | bigint | null | number;

  function foo(p: Array<Array<AnyValue>>): Array<Array<AnyValue>> {
    return p;
  }

  export function runTest(): boolean {
    let a: AnyValue[][] = [[undefined, 5n], [null, 17.6]];
    let b: Array<Array<AnyValue>> = foo(a);

    expect(a instanceof Array).assertEqual(true);
    expect(a[0] instanceof Array).assertEqual(true);
    expect(a[1] instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b[0] instanceof Array).assertEqual(true);
    expect(b[1] instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(2);
    expect(b[0].length).assertEqual(2);
    expect(b[1].length).assertEqual(2);
    expect(b[0][0]).assertEqual(undefined);
    expect(b[0][1]).assertEqual(5n);
    expect(b[1][0]).assertEqual(null);
    expect(b[1][1]).assertEqual(17.6);

    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a[0] instanceof Array).assertEqual(true);
    expect(a[1] instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(2);
    expect(a[0].length).assertEqual(2);
    expect(a[1].length).assertEqual(2);
    expect(a[0][0]).assertEqual(undefined);
    expect(a[0][1]).assertEqual(5n);
    expect(a[1][0]).assertEqual(null);
    expect(a[1][1]).assertEqual(17.6);

    return true;
  }
}

function foo(p: Array<Array<int>>): Array<Array<int>> {
  return p
}

export default function ArrayOfArraysTypesIdentityTest29(): void {
  describe('ArrayOfArraysTypesIdentityTest29', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_7600
     * @tc.name      testArrayOfArraysTypesIdentity0076
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0076';
      let a: Array<C>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C[]> = cast(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS303.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_7700
     * @tc.name      testArrayOfArraysTypesIdentity0077
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0077';
      let a: int[][] = [[1, 3], [5, 7]]
      let b: Array<Array<int>> = foo(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof int).assertEqual(true)
      expect(b[0][0]).assertEqual(1)
      expect(b[0][1] instanceof int).assertEqual(true)
      expect(b[0][1]).assertEqual(3)
      expect(b[1][0] instanceof int).assertEqual(true)
      expect(b[1][0]).assertEqual(5)
      expect(b[1][1] instanceof int).assertEqual(true)
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof int).assertEqual(true)
      expect(a[0][0]).assertEqual(1)
      expect(a[0][1] instanceof int).assertEqual(true)
      expect(a[0][1]).assertEqual(3)
      expect(a[1][0] instanceof int).assertEqual(true)
      expect(a[1][0]).assertEqual(5)
      expect(a[1][1] instanceof int).assertEqual(true)
      expect(a[1][1]).assertEqual(7)

      expect(testNS304.runTest()).assertEqual(true)
      expect(testNS305.runTest()).assertEqual(true)
      expect(testNS306.runTest()).assertEqual(true)
      expect(testNS307.runTest()).assertEqual(true)
      expect(testNS308.runTest()).assertEqual(true)
      expect(testNS309.runTest()).assertEqual(true)
      expect(testNS310.runTest()).assertEqual(true)
      expect(testNS311.runTest()).assertEqual(true)
      expect(testNS312.runTest()).assertEqual(true)
      expect(testNS313.runTest()).assertEqual(true)
      expect(testNS314.runTest()).assertEqual(true)
      expect(testNS315.runTest()).assertEqual(true)
      expect(testNS316.runTest()).assertEqual(true)
      expect(testNS317.runTest()).assertEqual(true)
      expect(testNS318.runTest()).assertEqual(true)
    });
  })
}