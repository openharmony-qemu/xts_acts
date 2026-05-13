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

namespace testNS_1 {
  function cast(p: Object): Array<Array<int>> {
    return p as Array<Array<int>>
  }

  export function runTest(): boolean {
    let a: Array<Array<int>> = [[1, 3], [5, 7]]
    let b: Array<Array<int>> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number' || typeof b[0][0] === 'int').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number' || typeof b[0][1] === 'int').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number' || typeof b[1][0] === 'int').assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number' || typeof b[1][1] === 'int').assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number' || typeof a[0][0] === 'int').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number' || typeof a[0][1] === 'int').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number' || typeof a[1][0] === 'int').assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number' || typeof a[1][1] === 'int').assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_2 {
  function cast(p: Object): Array<Array<int>> {
    return p as Array<Array<int>>
  }

  export function runTest(): boolean {
    let a: Array<Array<int>> = [[1, 3], [5, 7]]
    let b: Array<Array<int>> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number' || typeof b[0][0] === 'int').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number' || typeof b[0][1] === 'int').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[1][0] === 'number' || typeof b[1][0] === 'int').assertEqual(true)
    expect(b[1][0]).assertEqual(5)
    expect(typeof b[1][1] === 'number' || typeof b[1][1] === 'int').assertEqual(true)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof a[0][0] === 'number' || typeof a[0][0] === 'int').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number' || typeof a[0][1] === 'int').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[1][0] === 'number' || typeof a[1][0] === 'int').assertEqual(true)
    expect(a[1][0]).assertEqual(5)
    expect(typeof a[1][1] === 'number' || typeof a[1][1] === 'int').assertEqual(true)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_3 {
  function cast(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: Array<Array<number>> = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = cast(a)
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

namespace testNS_4 {
  function cast(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: Array<Array<number>> = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = cast(a)
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

namespace testNS_5 {
  function cast(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: Array<Array<number>> = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = cast(a)
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

namespace testNS_6 {
  function cast(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: Array<Array<number>> = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = cast(a)
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

namespace testNS_7 {
  function cast(p: Object): Array<Array<number>> {
    return p as Array<Array<number>>
  }

  export function runTest(): boolean {
    let a: Array<Array<number>> = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = cast(a)
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

namespace testNS_8 {
  function cast(p: Object): Array<Array<bigint>> {
    return p as Array<Array<bigint>>
  }

  export function runTest(): boolean {
    let a: Array<Array<bigint>> = [[1n, 3n], [5n, 7n]]
    let b: Array<Array<bigint>> = cast(a)
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

namespace testNS_9 {
  function cast(p: Object): Array<Array<string>> {
    return p as Array<Array<string>>
  }

  export function runTest(): boolean {
    let a: Array<Array<string>> = [["ab", "c"], ["de", "f"]]
    let b: Array<Array<string>> = cast(a)
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

namespace testNS_10 {
  function cast(p: Object): Array<Array<string>> {
    return p as Array<Array<string>>
  }

  export function runTest(): boolean {
    let a: Array<Array<string>> = [["a", "b"], ["c", "d"]]
    let b: Array<Array<string>> = cast(a)
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

namespace testNS_11 {
  function cast(p: Object): Array<Array<boolean>> {
    return p as Array<Array<boolean>>
  }

  export function runTest(): boolean {
    let a: Array<Array<boolean>> = [[false, true], [true, false]]
    let b: Array<Array<boolean>> = cast(a)
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

namespace testNS_12 {
  function cast(p: Object): Array<Array<Object>> {
    return p as Array<Array<Object>>
  }

  export function runTest(): boolean {
    let a: Array<Array<Object>> = [[1, 5n], ["abc", 17.6]]
    let b: Array<Array<Object>> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number' || typeof b[0][0] === 'int').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'bigint').assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(typeof b[1][0] === 'string').assertEqual(true)
    expect(b[1][0]).assertEqual("abc")
    expect(typeof b[1][1] === 'number').assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(typeof b[0][0] === 'number' || typeof b[0][0] === 'int').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'bigint').assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(typeof a[1][0] === 'string').assertEqual(true)
    expect(a[1][0]).assertEqual("abc")
    expect(typeof a[1][1] === 'number').assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_13 {
  function cast(p: Object): Array<Array<Object | undefined>> {
    return p as Array<Array<Object | undefined>>
  }

  export function runTest(): boolean {
    let a: Array<Array<Object | undefined>> = [[undefined, 5n], ["abc", 17.6]]
    let b: Array<Array<Object | undefined>> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(typeof b[0][1] !== 'undefined').assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(typeof b[1][0] !== 'undefined').assertEqual(true)
    expect(b[1][0]).assertEqual("abc")
    expect(typeof b[1][1] !== 'undefined').assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(typeof a[0][1] !== 'undefined').assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(typeof a[1][0] !== 'undefined').assertEqual(true)
    expect(a[1][0]).assertEqual("abc")
    expect(typeof a[1][1] !== 'undefined').assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_14 {
  function cast(p: Object): Array<Array<Object | undefined | null>> {
    return p as Array<Array<Object | undefined | null>>
  }

  export function runTest(): boolean {
    let a: Array<Array<Object | undefined | null>> = [[undefined, 5n], [null, 17.6]]
    let b: Array<Array<Object | undefined | null>> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(typeof b[0][1] !== 'undefined').assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] === null).assertEqual(true)
    expect(b[1][0]).assertEqual(null)
    expect(typeof b[1][1] !== 'undefined').assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(typeof a[0][1] !== 'undefined').assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] === null).assertEqual(true)
    expect(a[1][0]).assertEqual(null)
    expect(typeof a[1][1] !== 'undefined').assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_15 {
  function cast(p: Object): Array<Array<Object | undefined | null>> {
    return p as Array<Array<Object | undefined | null>>
  }

  export function runTest(): boolean {
    let a: Array<Array<Object | undefined | null>> = [[undefined, 5n], [null, 17.6]]
    let b: Array<Array<Object | undefined | null>> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] === undefined).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(typeof b[0][1] !== 'undefined').assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] === null).assertEqual(true)
    expect(b[1][0]).assertEqual(null)
    expect(typeof b[1][1] !== 'undefined').assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] === undefined).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(typeof a[0][1] !== 'undefined').assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] === null).assertEqual(true)
    expect(a[1][0]).assertEqual(null)
    expect(typeof a[1][1] !== 'undefined').assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}
function cast1(p: Object) {
  return p as Array<Array<int>>
}

namespace testNS_16 {
  function cast(p: Object) {
    return p as int[][]
  }

  export function runTest_16(): boolean {
    let a_16: Array<int>[] = [[1, 3], [5, 7]]
    let b_16: Array<int[]> = cast2(a_16)
    expect(a_16 instanceof Array).assertEqual(true)
    expect(a_16[0] instanceof Array).assertEqual(true)
    expect(a_16[1] instanceof Array).assertEqual(true)
    expect(b_16 instanceof Array).assertEqual(true)
    expect(b_16[0] instanceof Array).assertEqual(true)
    expect(b_16[1] instanceof Array).assertEqual(true)
    expect(b_16.length).assertEqual(2)
    expect(b_16[0].length).assertEqual(2)
    expect(b_16[1].length).assertEqual(2)
    expect(b_16[0][0] instanceof int).assertEqual(true)
    expect(b_16[0][0]).assertEqual(1)
    expect(b_16[0][1] instanceof int).assertEqual(true)
    expect(b_16[0][1]).assertEqual(3)
    expect(b_16[1][0] instanceof int).assertEqual(true)
    expect(b_16[1][0]).assertEqual(5)
    expect(b_16[1][1] instanceof int).assertEqual(true)
    expect(b_16[1][1]).assertEqual(7)
    a_16 = b_16
    expect(a_16 instanceof Array).assertEqual(true)
    expect(a_16[0] instanceof Array).assertEqual(true)
    expect(a_16[1] instanceof Array).assertEqual(true)
    expect(a_16.length).assertEqual(2)
    expect(a_16[0].length).assertEqual(2)
    expect(a_16[1].length).assertEqual(2)
    expect(a_16[0][0] instanceof int).assertEqual(true)
    expect(a_16[0][0]).assertEqual(1)
    expect(a_16[0][1] instanceof int).assertEqual(true)
    expect(a_16[0][1]).assertEqual(3)
    expect(a_16[1][0] instanceof int).assertEqual(true)
    expect(a_16[1][0]).assertEqual(5)
    expect(a_16[1][1] instanceof int).assertEqual(true)
    expect(a_16[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_17 {
  function cast_17(p: Object) {
    return p as long[][]
  }

  export function runTest_17(): boolean {
    let a_17: Array<long>[] = [[1, 3], [5, 7]]
    let b_17: Array<long[]> = cast_17(a_17)
    expect(a_17 instanceof Array).assertEqual(true)
    expect(a_17[0] instanceof Array).assertEqual(true)
    expect(a_17[1] instanceof Array).assertEqual(true)
    expect(b_17 instanceof Array).assertEqual(true)
    expect(b_17[0] instanceof Array).assertEqual(true)
    expect(b_17[1] instanceof Array).assertEqual(true)
    expect(b_17.length).assertEqual(2)
    expect(b_17[0].length).assertEqual(2)
    expect(b_17[1].length).assertEqual(2)
    expect(b_17[0][0] instanceof long).assertEqual(true)
    expect(b_17[0][0]).assertEqual(1)
    expect(b_17[0][1] instanceof long).assertEqual(true)
    expect(b_17[0][1]).assertEqual(3)
    expect(b_17[1][0] instanceof long).assertEqual(true)
    expect(b_17[1][0]).assertEqual(5)
    expect(b_17[1][1] instanceof long).assertEqual(true)
    expect(b_17[1][1]).assertEqual(7)
    a_17 = b_17
    expect(a_17 instanceof Array).assertEqual(true)
    expect(a_17[0] instanceof Array).assertEqual(true)
    expect(a_17[1] instanceof Array).assertEqual(true)
    expect(a_17.length).assertEqual(2)
    expect(a_17[0].length).assertEqual(2)
    expect(a_17[1].length).assertEqual(2)
    expect(a_17[0][0] instanceof long).assertEqual(true)
    expect(a_17[0][0]).assertEqual(1)
    expect(a_17[0][1] instanceof long).assertEqual(true)
    expect(a_17[0][1]).assertEqual(3)
    expect(a_17[1][0] instanceof long).assertEqual(true)
    expect(a_17[1][0]).assertEqual(5)
    expect(a_17[1][1] instanceof long).assertEqual(true)
    expect(a_17[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_18 {
  function cast_18(p: Object) {
    return p as byte[][]
  }

  export function runTest_18(): boolean {
    let a_18: Array<byte>[] = [[1, 3], [5, 7]]
    let b_18: Array<byte[]> = cast_18(a_18)
    expect(a_18 instanceof Array).assertEqual(true)
    expect(a_18[0] instanceof Array).assertEqual(true)
    expect(a_18[1] instanceof Array).assertEqual(true)
    expect(b_18 instanceof Array).assertEqual(true)
    expect(b_18[0] instanceof Array).assertEqual(true)
    expect(b_18[1] instanceof Array).assertEqual(true)
    expect(b_18.length).assertEqual(2)
    expect(b_18[0].length).assertEqual(2)
    expect(b_18[1].length).assertEqual(2)
    expect(b_18[0][0] instanceof byte).assertEqual(true)
    expect(b_18[0][0]).assertEqual(1)
    expect(b_18[0][1] instanceof byte).assertEqual(true)
    expect(b_18[0][1]).assertEqual(3)
    expect(b_18[1][0] instanceof byte).assertEqual(true)
    expect(b_18[1][0]).assertEqual(5)
    expect(b_18[1][1] instanceof byte).assertEqual(true)
    expect(b_18[1][1]).assertEqual(7)
    a_18 = b_18
    expect(a_18 instanceof Array).assertEqual(true)
    expect(a_18[0] instanceof Array).assertEqual(true)
    expect(a_18[1] instanceof Array).assertEqual(true)
    expect(a_18.length).assertEqual(2)
    expect(a_18[0].length).assertEqual(2)
    expect(a_18[1].length).assertEqual(2)
    expect(a_18[0][0] instanceof byte).assertEqual(true)
    expect(a_18[0][0]).assertEqual(1)
    expect(a_18[0][1] instanceof byte).assertEqual(true)
    expect(a_18[0][1]).assertEqual(3)
    expect(a_18[1][0] instanceof byte).assertEqual(true)
    expect(a_18[1][0]).assertEqual(5)
    expect(a_18[1][1] instanceof byte).assertEqual(true)
    expect(a_18[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_19 {
  function cast_19(p: Object) {
    return p as short[][]
  }

  export function runTest_19(): boolean {
    let a_19: Array<short>[] = [[1, 3], [5, 7]]
    let b_19: Array<short[]> = cast_19(a_19)
    expect(a_19 instanceof Array).assertEqual(true)
    expect(a_19[0] instanceof Array).assertEqual(true)
    expect(a_19[1] instanceof Array).assertEqual(true)
    expect(b_19 instanceof Array).assertEqual(true)
    expect(b_19[0] instanceof Array).assertEqual(true)
    expect(b_19[1] instanceof Array).assertEqual(true)
    expect(b_19.length).assertEqual(2)
    expect(b_19[0].length).assertEqual(2)
    expect(b_19[1].length).assertEqual(2)
    expect(b_19[0][0] instanceof short).assertEqual(true)
    expect(b_19[0][0]).assertEqual(1)
    expect(b_19[0][1] instanceof short).assertEqual(true)
    expect(b_19[0][1]).assertEqual(3)
    expect(b_19[1][0] instanceof short).assertEqual(true)
    expect(b_19[1][0]).assertEqual(5)
    expect(b_19[1][1] instanceof short).assertEqual(true)
    expect(b_19[1][1]).assertEqual(7)
    a_19 = b_19
    expect(a_19 instanceof Array).assertEqual(true)
    expect(a_19[0] instanceof Array).assertEqual(true)
    expect(a_19[1] instanceof Array).assertEqual(true)
    expect(a_19.length).assertEqual(2)
    expect(a_19[0].length).assertEqual(2)
    expect(a_19[1].length).assertEqual(2)
    expect(a_19[0][0] instanceof short).assertEqual(true)
    expect(a_19[0][0]).assertEqual(1)
    expect(a_19[0][1] instanceof short).assertEqual(true)
    expect(a_19[0][1]).assertEqual(3)
    expect(a_19[1][0] instanceof short).assertEqual(true)
    expect(a_19[1][0]).assertEqual(5)
    expect(a_19[1][1] instanceof short).assertEqual(true)
    expect(a_19[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_20 {
  function cast_20(p: Object) {
    return p as double[][]
  }

  export function runTest_20(): boolean {
    let a_20: Array<double>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_20: Array<double[]> = cast_20(a_20)
    expect(a_20 instanceof Array).assertEqual(true)
    expect(a_20[0] instanceof Array).assertEqual(true)
    expect(a_20[1] instanceof Array).assertEqual(true)
    expect(b_20 instanceof Array).assertEqual(true)
    expect(b_20[0] instanceof Array).assertEqual(true)
    expect(b_20[1] instanceof Array).assertEqual(true)
    expect(b_20.length).assertEqual(2)
    expect(b_20[0].length).assertEqual(2)
    expect(b_20[1].length).assertEqual(2)
    expect(b_20[0][0] instanceof double).assertEqual(true)
    expect(b_20[0][0]).assertEqual(1.5)
    expect(b_20[0][1] instanceof double).assertEqual(true)
    expect(b_20[0][1]).assertEqual(3.7)
    expect(b_20[1][0] instanceof double).assertEqual(true)
    expect(b_20[1][0]).assertEqual(5.4)
    expect(b_20[1][1] instanceof double).assertEqual(true)
    expect(b_20[1][1]).assertEqual(7.8)
    a_20 = b_20
    expect(a_20 instanceof Array).assertEqual(true)
    expect(a_20[0] instanceof Array).assertEqual(true)
    expect(a_20[1] instanceof Array).assertEqual(true)
    expect(a_20.length).assertEqual(2)
    expect(a_20[0].length).assertEqual(2)
    expect(a_20[1].length).assertEqual(2)
    expect(a_20[0][0] instanceof double).assertEqual(true)
    expect(a_20[0][0]).assertEqual(1.5)
    expect(a_20[0][1] instanceof double).assertEqual(true)
    expect(a_20[0][1]).assertEqual(3.7)
    expect(a_20[1][0] instanceof double).assertEqual(true)
    expect(a_20[1][0]).assertEqual(5.4)
    expect(a_20[1][1] instanceof double).assertEqual(true)
    expect(a_20[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_21 {
  function cast_21(p: Object) {
    return p as number[][]
  }

  export function runTest_21(): boolean {
    let a_21: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_21: Array<number[]> = cast_21(a_21)
    expect(a_21 instanceof Array).assertEqual(true)
    expect(a_21[0] instanceof Array).assertEqual(true)
    expect(a_21[1] instanceof Array).assertEqual(true)
    expect(b_21 instanceof Array).assertEqual(true)
    expect(b_21[0] instanceof Array).assertEqual(true)
    expect(b_21[1] instanceof Array).assertEqual(true)
    expect(b_21.length).assertEqual(2)
    expect(b_21[0].length).assertEqual(2)
    expect(b_21[1].length).assertEqual(2)
    expect(b_21[0][0] instanceof number).assertEqual(true)
    expect(b_21[0][0]).assertEqual(1.5)
    expect(b_21[0][1] instanceof number).assertEqual(true)
    expect(b_21[0][1]).assertEqual(3.7)
    expect(b_21[1][0] instanceof number).assertEqual(true)
    expect(b_21[1][0]).assertEqual(5.4)
    expect(b_21[1][1] instanceof number).assertEqual(true)
    expect(b_21[1][1]).assertEqual(7.8)
    a_21 = b_21
    expect(a_21 instanceof Array).assertEqual(true)
    expect(a_21[0] instanceof Array).assertEqual(true)
    expect(a_21[1] instanceof Array).assertEqual(true)
    expect(a_21.length).assertEqual(2)
    expect(a_21[0].length).assertEqual(2)
    expect(a_21[1].length).assertEqual(2)
    expect(a_21[0][0] instanceof number).assertEqual(true)
    expect(a_21[0][0]).assertEqual(1.5)
    expect(a_21[0][1] instanceof number).assertEqual(true)
    expect(a_21[0][1]).assertEqual(3.7)
    expect(a_21[1][0] instanceof number).assertEqual(true)
    expect(a_21[1][0]).assertEqual(5.4)
    expect(a_21[1][1] instanceof number).assertEqual(true)
    expect(a_21[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_22 {
  function cast_22(p: Object) {
    return p as number[][]
  }

  export function runTest_22(): boolean {
    let a_22: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_22: Array<number[]> = cast_22(a_22)
    expect(a_22 instanceof Array).assertEqual(true)
    expect(a_22[0] instanceof Array).assertEqual(true)
    expect(a_22[1] instanceof Array).assertEqual(true)
    expect(b_22 instanceof Array).assertEqual(true)
    expect(b_22[0] instanceof Array).assertEqual(true)
    expect(b_22[1] instanceof Array).assertEqual(true)
    expect(b_22.length).assertEqual(2)
    expect(b_22[0].length).assertEqual(2)
    expect(b_22[1].length).assertEqual(2)
    expect(b_22[0][0] instanceof number).assertEqual(true)
    expect(b_22[0][0]).assertEqual(1.5)
    expect(b_22[0][1] instanceof number).assertEqual(true)
    expect(b_22[0][1]).assertEqual(3.7)
    expect(b_22[1][0] instanceof number).assertEqual(true)
    expect(b_22[1][0]).assertEqual(5.4)
    expect(b_22[1][1] instanceof number).assertEqual(true)
    expect(b_22[1][1]).assertEqual(7.8)
    a_22 = b_22
    expect(a_22 instanceof Array).assertEqual(true)
    expect(a_22[0] instanceof Array).assertEqual(true)
    expect(a_22[1] instanceof Array).assertEqual(true)
    expect(a_22.length).assertEqual(2)
    expect(a_22[0].length).assertEqual(2)
    expect(a_22[1].length).assertEqual(2)
    expect(a_22[0][0] instanceof number).assertEqual(true)
    expect(a_22[0][0]).assertEqual(1.5)
    expect(a_22[0][1] instanceof number).assertEqual(true)
    expect(a_22[0][1]).assertEqual(3.7)
    expect(a_22[1][0] instanceof number).assertEqual(true)
    expect(a_22[1][0]).assertEqual(5.4)
    expect(a_22[1][1] instanceof number).assertEqual(true)
    expect(a_22[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_23 {
  function cast_23(p: Object) {
    return p as bigint[][]
  }

  export function runTest_23(): boolean {
    let a_23: Array<bigint>[] = [[1n, 3n], [5n, 7n]]
    let b_23: Array<bigint[]> = cast_23(a_23)
    expect(a_23 instanceof Array).assertEqual(true)
    expect(a_23[0] instanceof Array).assertEqual(true)
    expect(a_23[1] instanceof Array).assertEqual(true)
    expect(b_23 instanceof Array).assertEqual(true)
    expect(b_23[0] instanceof Array).assertEqual(true)
    expect(b_23[1] instanceof Array).assertEqual(true)
    expect(b_23.length).assertEqual(2)
    expect(b_23[0].length).assertEqual(2)
    expect(b_23[1].length).assertEqual(2)
    expect(b_23[0][0] instanceof bigint).assertEqual(true)
    expect(b_23[0][0]).assertEqual(1n)
    expect(b_23[0][1] instanceof bigint).assertEqual(true)
    expect(b_23[0][1]).assertEqual(3n)
    expect(b_23[1][0] instanceof bigint).assertEqual(true)
    expect(b_23[1][0]).assertEqual(5n)
    expect(b_23[1][1] instanceof bigint).assertEqual(true)
    expect(b_23[1][1]).assertEqual(7n)
    a_23 = b_23
    expect(a_23 instanceof Array).assertEqual(true)
    expect(a_23[0] instanceof Array).assertEqual(true)
    expect(a_23[1] instanceof Array).assertEqual(true)
    expect(a_23.length).assertEqual(2)
    expect(a_23[0].length).assertEqual(2)
    expect(a_23[1].length).assertEqual(2)
    expect(a_23[0][0] instanceof bigint).assertEqual(true)
    expect(a_23[0][0]).assertEqual(1n)
    expect(a_23[0][1] instanceof bigint).assertEqual(true)
    expect(a_23[0][1]).assertEqual(3n)
    expect(a_23[1][0] instanceof bigint).assertEqual(true)
    expect(a_23[1][0]).assertEqual(5n)
    expect(a_23[1][1] instanceof bigint).assertEqual(true)
    expect(a_23[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS_24 {
  function cast_24(p: Object) {
    return p as string[][]
  }

  export function runTest_24(): boolean {
    let a_24: Array<string>[] = [["ab", "c"], ["de", "f"]]
    let b_24: Array<string[]> = cast_24(a_24)
    expect(a_24 instanceof Array).assertEqual(true)
    expect(a_24[0] instanceof Array).assertEqual(true)
    expect(a_24[1] instanceof Array).assertEqual(true)
    expect(b_24 instanceof Array).assertEqual(true)
    expect(b_24[0] instanceof Array).assertEqual(true)
    expect(b_24[1] instanceof Array).assertEqual(true)
    expect(b_24.length).assertEqual(2)
    expect(b_24[0].length).assertEqual(2)
    expect(b_24[1].length).assertEqual(2)
    expect(b_24[0][0] instanceof string).assertEqual(true)
    expect(b_24[0][0]).assertEqual("ab")
    expect(b_24[0][1] instanceof string).assertEqual(true)
    expect(b_24[0][1]).assertEqual("c")
    expect(b_24[1][0] instanceof string).assertEqual(true)
    expect(b_24[1][0]).assertEqual("de")
    expect(b_24[1][1] instanceof string).assertEqual(true)
    expect(b_24[1][1]).assertEqual("f")
    a_24 = b_24
    expect(a_24 instanceof Array).assertEqual(true)
    expect(a_24[0] instanceof Array).assertEqual(true)
    expect(a_24[1] instanceof Array).assertEqual(true)
    expect(a_24.length).assertEqual(2)
    expect(a_24[0].length).assertEqual(2)
    expect(a_24[1].length).assertEqual(2)
    expect(a_24[0][0] instanceof string).assertEqual(true)
    expect(a_24[0][0]).assertEqual("ab")
    expect(a_24[0][1] instanceof string).assertEqual(true)
    expect(a_24[0][1]).assertEqual("c")
    expect(a_24[1][0] instanceof string).assertEqual(true)
    expect(a_24[1][0]).assertEqual("de")
    expect(a_24[1][1] instanceof string).assertEqual(true)
    expect(a_24[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS_25 {
  function cast_25(p: Object) {
    return p as char[][]
  }

  export function runTest_25(): boolean {
    let a_25: Array<char>[] = [[c'a', c'b'], [c'c', c'd']]
    let b_25: Array<char[]> = cast_25(a_25)
    expect(a_25 instanceof Array).assertEqual(true)
    expect(a_25[0] instanceof Array).assertEqual(true)
    expect(a_25[1] instanceof Array).assertEqual(true)
    expect(b_25 instanceof Array).assertEqual(true)
    expect(b_25[0] instanceof Array).assertEqual(true)
    expect(b_25[1] instanceof Array).assertEqual(true)
    expect(b_25.length).assertEqual(2)
    expect(b_25[0].length).assertEqual(2)
    expect(b_25[1].length).assertEqual(2)
    expect(b_25[0][0] instanceof char).assertEqual(true)
    expect(b_25[0][0]).assertEqual(c'a')
    expect(b_25[0][1] instanceof char).assertEqual(true)
    expect(b_25[0][1]).assertEqual(c'b')
    expect(b_25[1][0] instanceof char).assertEqual(true)
    expect(b_25[1][0]).assertEqual(c'c')
    expect(b_25[1][1] instanceof char).assertEqual(true)
    expect(b_25[1][1]).assertEqual(c'd')
    a_25 = b_25
    expect(a_25 instanceof Array).assertEqual(true)
    expect(a_25[0] instanceof Array).assertEqual(true)
    expect(a_25[1] instanceof Array).assertEqual(true)
    expect(a_25.length).assertEqual(2)
    expect(a_25[0].length).assertEqual(2)
    expect(a_25[1].length).assertEqual(2)
    expect(a_25[0][0] instanceof char).assertEqual(true)
    expect(a_25[0][0]).assertEqual(c'a')
    expect(a_25[0][1] instanceof char).assertEqual(true)
    expect(a_25[0][1]).assertEqual(c'b')
    expect(a_25[1][0] instanceof char).assertEqual(true)
    expect(a_25[1][0]).assertEqual(c'c')
    expect(a_25[1][1] instanceof char).assertEqual(true)
    expect(a_25[1][1]).assertEqual(c'd')
    return true
  }
}

namespace testNS_26 {
  function cast_26(p: Object) {
    return p as boolean[][]
  }

  export function runTest_26(): boolean {
    let a_26: Array<boolean>[] = [[false, true], [true, false]]
    let b_26: Array<boolean[]> = cast_26(a_26)
    expect(a_26 instanceof Array).assertEqual(true)
    expect(a_26[0] instanceof Array).assertEqual(true)
    expect(a_26[1] instanceof Array).assertEqual(true)
    expect(b_26 instanceof Array).assertEqual(true)
    expect(b_26[0] instanceof Array).assertEqual(true)
    expect(b_26[1] instanceof Array).assertEqual(true)
    expect(b_26.length).assertEqual(2)
    expect(b_26[0].length).assertEqual(2)
    expect(b_26[1].length).assertEqual(2)
    expect(b_26[0][0] instanceof boolean).assertEqual(true)
    expect(b_26[0][0]).assertEqual(false)
    expect(b_26[0][1] instanceof boolean).assertEqual(true)
    expect(b_26[0][1]).assertEqual(true)
    expect(b_26[1][0] instanceof boolean).assertEqual(true)
    expect(b_26[1][0]).assertEqual(true)
    expect(b_26[1][1] instanceof boolean).assertEqual(true)
    expect(b_26[1][1]).assertEqual(false)
    a_26 = b_26
    expect(a_26 instanceof Array).assertEqual(true)
    expect(a_26[0] instanceof Array).assertEqual(true)
    expect(a_26[1] instanceof Array).assertEqual(true)
    expect(a_26.length).assertEqual(2)
    expect(a_26[0].length).assertEqual(2)
    expect(a_26[1].length).assertEqual(2)
    expect(a_26[0][0] instanceof boolean).assertEqual(true)
    expect(a_26[0][0]).assertEqual(false)
    expect(a_26[0][1] instanceof boolean).assertEqual(true)
    expect(a_26[0][1]).assertEqual(true)
    expect(a_26[1][0] instanceof boolean).assertEqual(true)
    expect(a_26[1][0]).assertEqual(true)
    expect(a_26[1][1] instanceof boolean).assertEqual(true)
    expect(a_26[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS_27 {
  function cast_27(p: Object) {
    return p as Object[][]
  }

  export function runTest_27(): boolean {
    let a_27: Array<Object>[] = [[1, 5n], ["abc", 17.6]]
    let b_27: Array<Object[]> = cast_27(a_27)
    expect(a_27 instanceof Array).assertEqual(true)
    expect(a_27[0] instanceof Array).assertEqual(true)
    expect(a_27[1] instanceof Array).assertEqual(true)
    expect(b_27 instanceof Array).assertEqual(true)
    expect(b_27[0] instanceof Array).assertEqual(true)
    expect(b_27[1] instanceof Array).assertEqual(true)
    expect(b_27.length).assertEqual(2)
    expect(b_27[0].length).assertEqual(2)
    expect(b_27[1].length).assertEqual(2)
    expect(typeof b_27[0][0] === 'number' || typeof b_27[0][0] === 'int').assertEqual(true)
    expect(b_27[0][0]).assertEqual(1)
    expect(typeof b_27[0][1] === 'bigint').assertEqual(true)
    expect(b_27[0][1]).assertEqual(5n)
    expect(typeof b_27[1][0] === 'string').assertEqual(true)
    expect(b_27[1][0]).assertEqual("abc")
    expect(typeof b_27[1][1] === 'number').assertEqual(true)
    expect(b_27[1][1]).assertEqual(17.6)
    a_27 = b_27
    expect(a_27 instanceof Array).assertEqual(true)
    expect(a_27[0] instanceof Array).assertEqual(true)
    expect(a_27[1] instanceof Array).assertEqual(true)
    expect(a_27.length).assertEqual(2)
    expect(a_27[0].length).assertEqual(2)
    expect(a_27[1].length).assertEqual(2)
    expect(typeof a_27[0][0] === 'number' || typeof b_27[0][0] === 'int').assertEqual(true)
    expect(a_27[0][0]).assertEqual(1)
    expect(typeof a_27[0][1] === 'bigint').assertEqual(true)
    expect(a_27[0][1]).assertEqual(5n)
    expect(typeof a_27[1][0] === 'string').assertEqual(true)
    expect(a_27[1][0]).assertEqual("abc")
    expect(typeof a_27[1][1] === 'number').assertEqual(true)
    expect(a_27[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_28 {
  function cast_28(p: Object) {
    return p as (Object | undefined)[][]
  }

  export function runTest_28(): boolean {
    let a_28: Array<(Object | undefined)>[] = [[undefined, 5n], ["abc", 17.6]]
    let b_28: Array<(Object | undefined)[]> = cast_28(a_28)
    expect(a_28 instanceof Array).assertEqual(true)
    expect(a_28[0] instanceof Array).assertEqual(true)
    expect(a_28[1] instanceof Array).assertEqual(true)
    expect(b_28 instanceof Array).assertEqual(true)
    expect(b_28[0] instanceof Array).assertEqual(true)
    expect(b_28[1] instanceof Array).assertEqual(true)
    expect(b_28.length).assertEqual(2)
    expect(b_28[0].length).assertEqual(2)
    expect(b_28[1].length).assertEqual(2)
    expect(b_28[0][0] instanceof (Object | undefined)).assertEqual(true)
    expect(b_28[0][0]).assertEqual(undefined)
    expect(b_28[0][1] instanceof (Object | undefined)).assertEqual(true)
    expect(b_28[0][1]).assertEqual(5n)
    expect(b_28[1][0] instanceof (Object | undefined)).assertEqual(true)
    expect(b_28[1][0]).assertEqual("abc")
    expect(b_28[1][1] instanceof (Object | undefined)).assertEqual(true)
    expect(b_28[1][1]).assertEqual(17.6)
    a_28 = b_28
    expect(a_28 instanceof Array).assertEqual(true)
    expect(a_28[0] instanceof Array).assertEqual(true)
    expect(a_28[1] instanceof Array).assertEqual(true)
    expect(a_28.length).assertEqual(2)
    expect(a_28[0].length).assertEqual(2)
    expect(a_28[1].length).assertEqual(2)
    expect(a_28[0][0] instanceof (Object | undefined)).assertEqual(true)
    expect(a_28[0][0]).assertEqual(undefined)
    expect(a_28[0][1] instanceof (Object | undefined)).assertEqual(true)
    expect(a_28[0][1]).assertEqual(5n)
    expect(a_28[1][0] instanceof (Object | undefined)).assertEqual(true)
    expect(a_28[1][0]).assertEqual("abc")
    expect(a_28[1][1] instanceof (Object | undefined)).assertEqual(true)
    expect(a_28[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_29 {
  function cast_29(p: Object) {
    return p as (Object | undefined | null)[][]
  }

  export function runTest_29(): boolean {
    let a_29: Array<(Object | undefined | null)>[] = [[undefined, 5n], [null, 17.6]]
    let b_29: Array<(Object | undefined | null)[]> = cast_29(a_29)
    expect(a_29 instanceof Array).assertEqual(true)
    expect(a_29[0] instanceof Array).assertEqual(true)
    expect(a_29[1] instanceof Array).assertEqual(true)
    expect(b_29 instanceof Array).assertEqual(true)
    expect(b_29[0] instanceof Array).assertEqual(true)
    expect(b_29[1] instanceof Array).assertEqual(true)
    expect(b_29.length).assertEqual(2)
    expect(b_29[0].length).assertEqual(2)
    expect(b_29[1].length).assertEqual(2)
    expect(b_29[0][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_29[0][0]).assertEqual(undefined)
    expect(b_29[0][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_29[0][1]).assertEqual(5n)
    expect(b_29[1][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_29[1][0]).assertEqual(null)
    expect(b_29[1][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_29[1][1]).assertEqual(17.6)
    a_29 = b_29
    expect(a_29 instanceof Array).assertEqual(true)
    expect(a_29[0] instanceof Array).assertEqual(true)
    expect(a_29[1] instanceof Array).assertEqual(true)
    expect(a_29.length).assertEqual(2)
    expect(a_29[0].length).assertEqual(2)
    expect(a_29[1].length).assertEqual(2)
    expect(a_29[0][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_29[0][0]).assertEqual(undefined)
    expect(a_29[0][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_29[0][1]).assertEqual(5n)
    expect(a_29[1][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_29[1][0]).assertEqual(null)
    expect(a_29[1][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_29[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_30 {
  function cast_30(p: Object) {
    return p as Array<Array<Object | null | undefined>>
  }

  export function runTest_30(): boolean {
    let a_30: Array<Object | null | undefined>[] = [[undefined, 5n], [null, 17.6]]
    let b_30: Array<Object | null | undefined>[] = cast_30(a_30)
    expect(a_30 instanceof Array).assertEqual(true)
    expect(a_30[0] instanceof Array).assertEqual(true)
    expect(a_30[1] instanceof Array).assertEqual(true)
    expect(b_30 instanceof Array).assertEqual(true)
    expect(b_30[0] instanceof Array).assertEqual(true)
    expect(b_30[1] instanceof Array).assertEqual(true)
    expect(b_30.length).assertEqual(2)
    expect(b_30[0].length).assertEqual(2)
    expect(b_30[1].length).assertEqual(2)
    expect(b_30[0][0] === undefined || b_30[0][0] === null || b_30[0][0] instanceof Object).assertEqual(true)
    expect(b_30[0][0]).assertEqual(undefined)
    expect(b_30[0][1] === undefined || b_30[0][1] === null || b_30[0][1] instanceof Object).assertEqual(true)
    expect(b_30[0][1]).assertEqual(5n)
    expect(b_30[1][0] === undefined || b_30[1][0] === null || b_30[1][0] instanceof Object).assertEqual(true)
    expect(b_30[1][0]).assertEqual(null)
    expect(b_30[1][1] === undefined || b_30[1][1] === null || b_30[1][1] instanceof Object).assertEqual(true)
    expect(b_30[1][1]).assertEqual(17.6)
    a_30 = b_30
    expect(a_30 instanceof Array).assertEqual(true)
    expect(a_30[0] instanceof Array).assertEqual(true)
    expect(a_30[1] instanceof Array).assertEqual(true)
    expect(a_30.length).assertEqual(2)
    expect(a_30[0].length).assertEqual(2)
    expect(a_30[1].length).assertEqual(2)
    expect(a_30[0][0] === undefined || a_30[0][0] === null || a_30[0][0] instanceof Object).assertEqual(true)
    expect(a_30[0][0]).assertEqual(undefined)
    expect(a_30[0][1] === undefined || a_30[0][1] === null || a_30[0][1] instanceof Object).assertEqual(true)
    expect(a_30[0][1]).assertEqual(5n)
    expect(a_30[1][0] === undefined || a_30[1][0] === null || a_30[1][0] instanceof Object).assertEqual(true)
    expect(a_30[1][0]).assertEqual(null)
    expect(a_30[1][1] === undefined || a_30[1][1] === null || a_30[1][1] instanceof Object).assertEqual(true)
    expect(a_30[1][1]).assertEqual(17.6)
    return true
  }
}

function cast2(p: Object) {
  return p as int[][]
}

export default function ArrayOfArraysTypesIdentityTest11(): void {
  describe('ArrayOfArraysTypesIdentityTest11', () => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_OF_ARRAYS_TYPES_IDENTITY_2700
     * @tc.name      testArrayOfArraysTypesIdentity0027
     * @tc.desc      Verify binary overflow logic with T_type_2 check and 3 test namespace validations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0027';
      let a: Array<int>[] = [[1, 3], [5, 7]]
      let b: Array<int[]> = cast1(a)
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

      expect(testNS_1.runTest()).assertEqual(true)
      expect(testNS_2.runTest()).assertEqual(true)
      expect(testNS_3.runTest()).assertEqual(true)
      expect(testNS_4.runTest()).assertEqual(true)
      expect(testNS_5.runTest()).assertEqual(true)
      expect(testNS_6.runTest()).assertEqual(true)
      expect(testNS_7.runTest()).assertEqual(true)
      expect(testNS_8.runTest()).assertEqual(true)
      expect(testNS_9.runTest()).assertEqual(true)
      expect(testNS_10.runTest()).assertEqual(true)
      expect(testNS_11.runTest()).assertEqual(true)
      expect(testNS_12.runTest()).assertEqual(true)
      expect(testNS_13.runTest()).assertEqual(true)
      expect(testNS_14.runTest()).assertEqual(true)
      expect(testNS_15.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_ARRAYS_TYPES_IDENTITY_2800
     * @tc.name      testArrayOfArraysTypesIdentity0028
     * @tc.desc      Verify binary overflow logic with T_type_2 check and 3 test namespace validations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0028';
      let a: Array<int>[] = [[1, 3], [5, 7]]
      let b: Array<int[]> = cast2(a)
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

      expect(testNS_16.runTest_16()).assertEqual(true)
      expect(testNS_17.runTest_17()).assertEqual(true)
      expect(testNS_18.runTest_18()).assertEqual(true)
      expect(testNS_19.runTest_19()).assertEqual(true)
      expect(testNS_20.runTest_20()).assertEqual(true)
      expect(testNS_21.runTest_21()).assertEqual(true)
      expect(testNS_22.runTest_22()).assertEqual(true)
      expect(testNS_23.runTest_23()).assertEqual(true)
      expect(testNS_24.runTest_24()).assertEqual(true)
      expect(testNS_25.runTest_25()).assertEqual(true)
      expect(testNS_26.runTest_26()).assertEqual(true)
      expect(testNS_27.runTest_27()).assertEqual(true)
      expect(testNS_28.runTest_28()).assertEqual(true)
      expect(testNS_29.runTest_29()).assertEqual(true)
      expect(testNS_30.runTest_30()).assertEqual(true)
    });
  });
}