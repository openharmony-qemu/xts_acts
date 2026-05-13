import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace testNS121 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS122 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS123 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS124 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS125 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS126 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS127 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS128 {
  function foo(p: bigint[][]): bigint[][] {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[][] = [[1n, 3n], [5n, 7n]]
    let b: bigint[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'bigint').assertEqual(true)
    expect(b[0][0]).assertEqual(1n)
    expect(typeof b[0][1] === 'bigint').assertEqual(true)
    expect(b[0][1]).assertEqual(3n)
    expect(typeof b[1][0] === 'bigint').assertEqual(true)
    expect(b[1][0]).assertEqual(5n)
    expect(typeof b[1][1] === 'bigint').assertEqual(true)
    expect(b[1][1]).assertEqual(7n)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'bigint').assertEqual(true)
    expect(a[0][0]).assertEqual(1n)
    expect(typeof a[0][1] === 'bigint').assertEqual(true)
    expect(a[0][1]).assertEqual(3n)
    expect(typeof a[1][0] === 'bigint').assertEqual(true)
    expect(a[1][0]).assertEqual(5n)
    expect(typeof a[1][1] === 'bigint').assertEqual(true)
    expect(a[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS129 {
  function foo(p: string[][]): string[][] {
    return p
  }

  export function runTest(): boolean {
    let a: string[][] = [["ab", "c"], ["de", "f"]]
    let b: string[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'string').assertEqual(true)
    expect(b[0][0]).assertEqual("ab")
    expect(typeof b[0][1] === 'string').assertEqual(true)
    expect(b[0][1]).assertEqual("c")
    expect(typeof b[1][0] === 'string').assertEqual(true)
    expect(b[1][0]).assertEqual("de")
    expect(typeof b[1][1] === 'string').assertEqual(true)
    expect(b[1][1]).assertEqual("f")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'string').assertEqual(true)
    expect(a[0][0]).assertEqual("ab")
    expect(typeof a[0][1] === 'string').assertEqual(true)
    expect(a[0][1]).assertEqual("c")
    expect(typeof a[1][0] === 'string').assertEqual(true)
    expect(a[1][0]).assertEqual("de")
    expect(typeof a[1][1] === 'string').assertEqual(true)
    expect(a[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS130 {
  function foo(p: string[][]): string[][] {
    return p
  }

  export function runTest(): boolean {
    let a: string[][] = [["a", "b"], ["c", "d"]]
    let b: string[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'string').assertEqual(true)
    expect(b[0][0]).assertEqual("a")
    expect(typeof b[0][1] === 'string').assertEqual(true)
    expect(b[0][1]).assertEqual("b")
    expect(typeof b[1][0] === 'string').assertEqual(true)
    expect(b[1][0]).assertEqual("c")
    expect(typeof b[1][1] === 'string').assertEqual(true)
    expect(b[1][1]).assertEqual("d")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'string').assertEqual(true)
    expect(a[0][0]).assertEqual("a")
    expect(typeof a[0][1] === 'string').assertEqual(true)
    expect(a[0][1]).assertEqual("b")
    expect(typeof a[1][0] === 'string').assertEqual(true)
    expect(a[1][0]).assertEqual("c")
    expect(typeof a[1][1] === 'string').assertEqual(true)
    expect(a[1][1]).assertEqual("d")
    return true
  }
}

namespace testNS131 {
  function foo(p: boolean[][]): boolean[][] {
    return p
  }

  export function runTest(): boolean {
    let a: boolean[][] = [[false, true], [true, false]]
    let b: boolean[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'boolean').assertEqual(true)
    expect(b[0][0]).assertEqual(false)
    expect(typeof b[0][1] === 'boolean').assertEqual(true)
    expect(b[0][1]).assertEqual(true)
    expect(typeof b[1][0] === 'boolean').assertEqual(true)
    expect(b[1][0]).assertEqual(true)
    expect(typeof b[1][1] === 'boolean').assertEqual(true)
    expect(b[1][1]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'boolean').assertEqual(true)
    expect(a[0][0]).assertEqual(false)
    expect(typeof a[0][1] === 'boolean').assertEqual(true)
    expect(a[0][1]).assertEqual(true)
    expect(typeof a[1][0] === 'boolean').assertEqual(true)
    expect(a[1][0]).assertEqual(true)
    expect(typeof a[1][1] === 'boolean').assertEqual(true)
    expect(a[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS132 {
  function foo(p: Object[][]): Object[][] {
    return p
  }

  export function runTest(): boolean {
    let a: Object[][] = [[1, 5n], ["abc", 17.6]]
    let b: Object[][] = foo(a)
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

namespace testNS133 {
  function foo(p: (Object | undefined)[][]): (Object | undefined)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[][] = [[undefined, 5n], ["abc", 17.6]]
    let b: (Object | undefined)[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined || b[0][0] instanceof Object).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] === undefined || b[0][1] instanceof Object).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] === undefined || b[1][0] instanceof Object).assertEqual(true)
    expect(b[1][0]).assertEqual("abc")
    expect(b[1][1] === undefined || b[1][1] instanceof Object).assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined || a[0][0] instanceof Object).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] === undefined || a[0][1] instanceof Object).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] === undefined || a[1][0] instanceof Object).assertEqual(true)
    expect(a[1][0]).assertEqual("abc")
    expect(a[1][1] === undefined || a[1][1] instanceof Object).assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS134 {
  function foo(p: (Object | undefined | null)[][]): (Object | undefined | null)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[][] = [[undefined, 5n], [null, 17.6]]
    let b: (Object | undefined | null)[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined || b[0][0] === null || b[0][0] instanceof Object).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] === undefined || b[0][1] === null || b[0][1] instanceof Object).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] === undefined || b[1][0] === null || b[1][0] instanceof Object).assertEqual(true)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1] === undefined || b[1][1] === null || b[1][1] instanceof Object).assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined || a[0][0] === null || a[0][0] instanceof Object).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] === undefined || a[0][1] === null || a[0][1] instanceof Object).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] === undefined || a[1][0] === null || a[1][0] instanceof Object).assertEqual(true)
    expect(a[1][0]).assertEqual(null)
    expect(a[1][1] === undefined || a[1][1] === null || a[1][1] instanceof Object).assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS135 {
  function foo(p: (bigint | number | undefined | null | string | boolean)[][]): (bigint | number | undefined | null | string | boolean)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (bigint | number | undefined | null | string | boolean)[][] = [[undefined, 5n], [null, 17.6]]
    let b: (bigint | number | undefined | null | string | boolean)[][] = foo(a)
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

namespace testNS136 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS137 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS138 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS139 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS140 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS141 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS142 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[1][0] === 'number').assertEqual(true)
    expect(b[1][0]).assertEqual(5.4)
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[1][0] === 'number').assertEqual(true)
    expect(a[1][0]).assertEqual(5.4)
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS143 {
  function foo(p: bigint[][]): bigint[][] {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[][] = [[1n, 3n], [5n, 7n]]
    let b: bigint[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'bigint').assertEqual(true)
    expect(b[0][0]).assertEqual(1n)
    expect(typeof b[0][1] === 'bigint').assertEqual(true)
    expect(b[0][1]).assertEqual(3n)
    expect(typeof b[1][0] === 'bigint').assertEqual(true)
    expect(b[1][0]).assertEqual(5n)
    expect(typeof b[1][1] === 'bigint').assertEqual(true)
    expect(b[1][1]).assertEqual(7n)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'bigint').assertEqual(true)
    expect(a[0][0]).assertEqual(1n)
    expect(typeof a[0][1] === 'bigint').assertEqual(true)
    expect(a[0][1]).assertEqual(3n)
    expect(typeof a[1][0] === 'bigint').assertEqual(true)
    expect(a[1][0]).assertEqual(5n)
    expect(typeof a[1][1] === 'bigint').assertEqual(true)
    expect(a[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS144 {
  function foo(p: string[][]): string[][] {
    return p
  }

  export function runTest(): boolean {
    let a: string[][] = [["ab", "c"], ["de", "f"]]
    let b: string[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'string').assertEqual(true)
    expect(b[0][0]).assertEqual("ab")
    expect(typeof b[0][1] === 'string').assertEqual(true)
    expect(b[0][1]).assertEqual("c")
    expect(typeof b[1][0] === 'string').assertEqual(true)
    expect(b[1][0]).assertEqual("de")
    expect(typeof b[1][1] === 'string').assertEqual(true)
    expect(b[1][1]).assertEqual("f")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'string').assertEqual(true)
    expect(a[0][0]).assertEqual("ab")
    expect(typeof a[0][1] === 'string').assertEqual(true)
    expect(a[0][1]).assertEqual("c")
    expect(typeof a[1][0] === 'string').assertEqual(true)
    expect(a[1][0]).assertEqual("de")
    expect(typeof a[1][1] === 'string').assertEqual(true)
    expect(a[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS145 {
  function foo(p: string[][]): string[][] {
    return p
  }

  export function runTest(): boolean {
    let a: string[][] = [["a", "b"], ["c", "d"]]
    let b: string[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'string').assertEqual(true)
    expect(b[0][0]).assertEqual("a")
    expect(typeof b[0][1] === 'string').assertEqual(true)
    expect(b[0][1]).assertEqual("b")
    expect(typeof b[1][0] === 'string').assertEqual(true)
    expect(b[1][0]).assertEqual("c")
    expect(typeof b[1][1] === 'string').assertEqual(true)
    expect(b[1][1]).assertEqual("d")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'string').assertEqual(true)
    expect(a[0][0]).assertEqual("a")
    expect(typeof a[0][1] === 'string').assertEqual(true)
    expect(a[0][1]).assertEqual("b")
    expect(typeof a[1][0] === 'string').assertEqual(true)
    expect(a[1][0]).assertEqual("c")
    expect(typeof a[1][1] === 'string').assertEqual(true)
    expect(a[1][1]).assertEqual("d")
    return true
  }
}

namespace testNS146 {
  function foo(p: boolean[][]): boolean[][] {
    return p
  }

  export function runTest(): boolean {
    let a: boolean[][] = [[false, true], [true, false]]
    let b: boolean[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'boolean').assertEqual(true)
    expect(b[0][0]).assertEqual(false)
    expect(typeof b[0][1] === 'boolean').assertEqual(true)
    expect(b[0][1]).assertEqual(true)
    expect(typeof b[1][0] === 'boolean').assertEqual(true)
    expect(b[1][0]).assertEqual(true)
    expect(typeof b[1][1] === 'boolean').assertEqual(true)
    expect(b[1][1]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'boolean').assertEqual(true)
    expect(a[0][0]).assertEqual(false)
    expect(typeof a[0][1] === 'boolean').assertEqual(true)
    expect(a[0][1]).assertEqual(true)
    expect(typeof a[1][0] === 'boolean').assertEqual(true)
    expect(a[1][0]).assertEqual(true)
    expect(typeof a[1][1] === 'boolean').assertEqual(true)
    expect(a[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS147 {
  function foo(p: Object[][]): Object[][] {
    return p
  }

  export function runTest(): boolean {
    let a: Object[][] = [[1, 5n], ["abc", 17.6]]
    let b: Object[][] = foo(a)
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

namespace testNS148 {
  function foo(p: (Object | undefined)[][]): (Object | undefined)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[][] = [[undefined, 5n], ["abc", 17.6]]
    let b: (Object | undefined)[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined || b[0][0] instanceof Object).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] === undefined || b[0][1] instanceof Object).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] === undefined || b[1][0] instanceof Object).assertEqual(true)
    expect(b[1][0]).assertEqual("abc")
    expect(b[1][1] === undefined || b[1][1] instanceof Object).assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined || a[0][0] instanceof Object).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] === undefined || a[0][1] instanceof Object).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] === undefined || a[1][0] instanceof Object).assertEqual(true)
    expect(a[1][0]).assertEqual("abc")
    expect(a[1][1] === undefined || a[1][1] instanceof Object).assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS149 {
  function foo(p: (Object | undefined | null)[][]): (Object | undefined | null)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[][] = [[undefined, 5n], [null, 17.6]]
    let b: (Object | undefined | null)[][] = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined || b[0][0] === null || b[0][0] instanceof Object).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] === undefined || b[0][1] === null || b[0][1] instanceof Object).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] === undefined || b[1][0] === null || b[1][0] instanceof Object).assertEqual(true)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1] === undefined || b[1][1] === null || b[1][1] instanceof Object).assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined || a[0][0] === null || a[0][0] instanceof Object).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] === undefined || a[0][1] === null || a[0][1] instanceof Object).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] === undefined || a[1][0] === null || a[1][0] instanceof Object).assertEqual(true)
    expect(a[1][0]).assertEqual(null)
    expect(a[1][1] === undefined || a[1][1] === null || a[1][1] instanceof Object).assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS150 {
  function foo(p: (bigint | number | undefined | null | string | boolean)[][]): (bigint | number | undefined | null | string | boolean)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (bigint | number | undefined | null | string | boolean)[][] = [[undefined, 5n], [null, 17.6]]
    let b: (bigint | number | undefined | null | string | boolean)[][] = foo(a)
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

function foo(p: number[][]): number[][] {
  return p
}

export default function ArrayOfArraysTypesIdentityTest22(): void {
  describe('ArrayOfArraysTypesIdentityTest22', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_6200
     * @tc.name      testArrayOfArraysTypesIdentity0062
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0062';
      let a: number[][] = [[1, 3], [5, 7]]
      let b: number[][] = foo(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(typeof b[0][0] === 'number').assertEqual(true)
      expect(b[0][0]).assertEqual(1)
      expect(typeof b[0][1] === 'number').assertEqual(true)
      expect(b[0][1]).assertEqual(3)
      expect(typeof b[1][0] === 'number').assertEqual(true)
      expect(b[1][0]).assertEqual(5)
      expect(typeof b[1][1] === 'number').assertEqual(true)
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(typeof a[0][0] === 'number').assertEqual(true)
      expect(a[0][0]).assertEqual(1)
      expect(typeof a[0][1] === 'number').assertEqual(true)
      expect(a[0][1]).assertEqual(3)
      expect(typeof a[1][0] === 'number').assertEqual(true)
      expect(a[1][0]).assertEqual(5)
      expect(typeof a[1][1] === 'number').assertEqual(true)
      expect(a[1][1]).assertEqual(7)

      expect(testNS121.runTest()).assertEqual(true)
      expect(testNS122.runTest()).assertEqual(true)
      expect(testNS123.runTest()).assertEqual(true)
      expect(testNS124.runTest()).assertEqual(true)
      expect(testNS125.runTest()).assertEqual(true)
      expect(testNS126.runTest()).assertEqual(true)
      expect(testNS127.runTest()).assertEqual(true)
      expect(testNS128.runTest()).assertEqual(true)
      expect(testNS129.runTest()).assertEqual(true)
      expect(testNS130.runTest()).assertEqual(true)
      expect(testNS131.runTest()).assertEqual(true)
      expect(testNS132.runTest()).assertEqual(true)
      expect(testNS133.runTest()).assertEqual(true)
      expect(testNS134.runTest()).assertEqual(true)
      expect(testNS135.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_6300
     * @tc.name      testArrayOfArraysTypesIdentity0063
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0063';
      let a: number[][] = [[1, 3], [5, 7]]
      let b: number[][] = foo(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(typeof b[0][0] === 'number').assertEqual(true)
      expect(b[0][0]).assertEqual(1)
      expect(typeof b[0][1] === 'number').assertEqual(true)
      expect(b[0][1]).assertEqual(3)
      expect(typeof b[1][0] === 'number').assertEqual(true)
      expect(b[1][0]).assertEqual(5)
      expect(typeof b[1][1] === 'number').assertEqual(true)
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(typeof a[0][0] === 'number').assertEqual(true)
      expect(a[0][0]).assertEqual(1)
      expect(typeof a[0][1] === 'number').assertEqual(true)
      expect(a[0][1]).assertEqual(3)
      expect(typeof a[1][0] === 'number').assertEqual(true)
      expect(a[1][0]).assertEqual(5)
      expect(typeof a[1][1] === 'number').assertEqual(true)
      expect(a[1][1]).assertEqual(7)

      expect(testNS136.runTest()).assertEqual(true)
      expect(testNS137.runTest()).assertEqual(true)
      expect(testNS138.runTest()).assertEqual(true)
      expect(testNS139.runTest()).assertEqual(true)
      expect(testNS140.runTest()).assertEqual(true)
      expect(testNS141.runTest()).assertEqual(true)
      expect(testNS142.runTest()).assertEqual(true)
      expect(testNS143.runTest()).assertEqual(true)
      expect(testNS144.runTest()).assertEqual(true)
      expect(testNS145.runTest()).assertEqual(true)
      expect(testNS146.runTest()).assertEqual(true)
      expect(testNS147.runTest()).assertEqual(true)
      expect(testNS148.runTest()).assertEqual(true)
      expect(testNS149.runTest()).assertEqual(true)
      expect(testNS150.runTest()).assertEqual(true)
    });
  })
}