import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from
  '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace testNS151 {
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

namespace testNS152 {
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

namespace testNS153 {
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

namespace testNS154 {
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

namespace testNS155 {
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

namespace testNS156 {
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

namespace testNS157 {
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

namespace testNS158 {
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

namespace testNS159 {
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

namespace testNS160 {
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

namespace testNS161 {
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

namespace testNS162 {
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

namespace testNS163 {
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

namespace testNS164 {
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

namespace testNS165 {
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

namespace testNS166 {
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

namespace testNS167 {
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

namespace testNS168 {
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

namespace testNS169 {
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

namespace testNS170 {
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

namespace testNS171 {
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

namespace testNS172 {
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

namespace testNS173 {
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

namespace testNS174 {
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

namespace testNS175 {
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

namespace testNS176 {
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

namespace testNS177 {
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

namespace testNS178 {
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

namespace testNS179 {
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

namespace testNS180 {
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

export default function ArrayOfArraysTypesIdentityTest23(): void {
  describe('ArrayOfArraysTypesIdentityTest23', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_6400
     * @tc.name      testArrayOfArraysTypesIdentity0064
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0064';
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

      expect(testNS151.runTest()).assertEqual(true)
      expect(testNS152.runTest()).assertEqual(true)
      expect(testNS153.runTest()).assertEqual(true)
      expect(testNS154.runTest()).assertEqual(true)
      expect(testNS155.runTest()).assertEqual(true)
      expect(testNS156.runTest()).assertEqual(true)
      expect(testNS157.runTest()).assertEqual(true)
      expect(testNS158.runTest()).assertEqual(true)
      expect(testNS159.runTest()).assertEqual(true)
      expect(testNS160.runTest()).assertEqual(true)
      expect(testNS161.runTest()).assertEqual(true)
      expect(testNS162.runTest()).assertEqual(true)
      expect(testNS163.runTest()).assertEqual(true)
      expect(testNS164.runTest()).assertEqual(true)
      expect(testNS165.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_6500
     * @tc.name      testArrayOfArraysTypesIdentity0065
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0065';
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

      expect(testNS166.runTest()).assertEqual(true)
      expect(testNS167.runTest()).assertEqual(true)
      expect(testNS168.runTest()).assertEqual(true)
      expect(testNS169.runTest()).assertEqual(true)
      expect(testNS170.runTest()).assertEqual(true)
      expect(testNS171.runTest()).assertEqual(true)
      expect(testNS172.runTest()).assertEqual(true)
      expect(testNS173.runTest()).assertEqual(true)
      expect(testNS174.runTest()).assertEqual(true)
      expect(testNS175.runTest()).assertEqual(true)
      expect(testNS176.runTest()).assertEqual(true)
      expect(testNS177.runTest()).assertEqual(true)
      expect(testNS178.runTest()).assertEqual(true)
      expect(testNS179.runTest()).assertEqual(true)
      expect(testNS180.runTest()).assertEqual(true)
    });
  })
}