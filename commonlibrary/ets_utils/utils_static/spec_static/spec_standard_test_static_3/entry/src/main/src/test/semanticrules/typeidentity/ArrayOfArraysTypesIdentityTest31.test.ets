import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
namespace testNS31 {
  function foo(p: Array<int[]>): Array<int>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<int>[] = [[1, 3], [5, 7]]
    let b: Array<int[]> = foo(a)
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

namespace testNS32 {
  function foo(p: Array<long[]>): Array<long>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<long>[] = [[1, 3], [5, 7]]
    let b: Array<long[]> = foo(a)
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

namespace testNS33 {
  function foo(p: Array<byte[]>): Array<byte>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<byte>[] = [[1, 3], [5, 7]]
    let b: Array<byte[]> = foo(a)
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

namespace testNS34 {
  function foo(p: Array<short[]>): Array<short>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<short>[] = [[1, 3], [5, 7]]
    let b: Array<short[]> = foo(a)
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

namespace testNS35 {
  function foo(p: Array<double[]>): Array<double>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<double>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<double[]> = foo(a)
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

namespace testNS36 {
  function foo(p: Array<number[]>): Array<number>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<number[]> = foo(a)
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

namespace testNS37 {
  function foo(p: Array<float[]>): Array<float>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<float>[] = [[1.5f, 3.7f], [5.4f, 7.8f]]
    let b: Array<float[]> = foo(a)
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

namespace testNS38 {
  function foo(p: Array<bigint[]>): Array<bigint>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<bigint>[] = [[1n, 3n], [5n, 7n]]
    let b: Array<bigint[]> = foo(a)
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

namespace testNS39 {
  function foo(p: Array<string[]>): Array<string>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<string>[] = [["ab", "c"], ["de", "f"]]
    let b: Array<string[]> = foo(a)
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

namespace testNS40 {
  function foo(p: Array<char[]>): Array<char>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<char>[] = [[c'a', c'b'], [c'c', c'd']]
    let b: Array<char[]> = foo(a)
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

namespace testNS41 {
  function foo(p: Array<boolean[]>): Array<boolean>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<boolean>[] = [[false, true], [true, false]]
    let b: Array<boolean[]> = foo(a)
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

namespace testNS42 {
  function foo(p: Array<Object[]>): Array<Object>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Object>[] = [[1, 5n], ["abc", 17.6]]
    let b: Array<Object[]> = foo(a)
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

namespace testNS43 {
  function foo(p: Array<(Object | undefined)[]>): Array<(Object | undefined)>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<(Object | undefined)>[] = [[undefined, 5n], ["abc", 17.6]]
    let b: Array<(Object | undefined)[]> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof (Object | undefined)).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] instanceof (Object | undefined)).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] instanceof (Object | undefined)).assertEqual(true)
    expect(b[1][0]).assertEqual("abc")
    expect(b[1][1] instanceof (Object | undefined)).assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof (Object | undefined)).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] instanceof (Object | undefined)).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] instanceof (Object | undefined)).assertEqual(true)
    expect(a[1][0]).assertEqual("abc")
    expect(a[1][1] instanceof (Object | undefined)).assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS44 {
  function foo(p: Array<(Object | undefined | null)[]>): Array<(Object | undefined | null)>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<(Object | undefined | null)>[] = [[undefined, 5n], [null, 17.6]]
    let b: Array<(Object | undefined | null)[]> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[1][0]).assertEqual(null)
    expect(a[1][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS45 {
  function foo(p: Array<(undefined | number| bigint | null)[]>): Array<undefined | number| bigint | null>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<undefined | number| bigint | null>[] = [[undefined, 5n], [null, 17.6]]
    let b: Array<(undefined | number| bigint | null)[]> = foo(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof undefined | number| bigint | null).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] instanceof undefined | number| bigint | null).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] instanceof undefined | number| bigint | null).assertEqual(true)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1] instanceof undefined | number| bigint | null).assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof undefined | number| bigint | null).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] instanceof undefined | number| bigint | null).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] instanceof undefined | number| bigint | null).assertEqual(true)
    expect(a[1][0]).assertEqual(null)
    expect(a[1][1] instanceof undefined | number| bigint | null).assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

function foo2(p: Array<int[]>): Array<int>[] {
  return p
}

namespace testNS46 {
  class C {data: int = 0}
  function foo3(p: Array<Array<C>>): Array<Array<C>> {
    return p
  }

  export function runTest(): boolean {
    let a: C[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<Array<C>> = foo3(a)
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
function foo3(p: Array<Array<C>>): Array<Array<C>> {
  return p
}

namespace testNS47 {
  class C1 {data: int = 0}
  function foo4(p: Array<Array<C1>>): C1[][] {
    return p
  }

  export function runTest(): boolean {
    let a: C1[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<Array<C1>> = foo4(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C1).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C1).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C1).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C1).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C1).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C1).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C1).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C1).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}

class C1 {data: int = 0}
function foo4(p: Array<Array<C1>>): C1[][] {
  return p
}

namespace testNS48 {
  class C2 {data: int = 0}
  function foo5(p: C2[][]): C2[][] {
    return p
  }

  export function runTest(): boolean {
    let a: C2[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<Array<C2>> = foo5(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C2).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C2).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C2).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C2).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C2).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C2).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C2).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C2).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}

class C2 {data: int = 0}
function foo5(p: C2[][]): C2[][] {
  return p
}


export default function ArrayOfArraysTypesIdentityTest01(): void {
  describe('ArrayOfArraysTypesIdentityTest01', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_8000
     * @tc.name      testArrayOfArraysTypesIdentity0080
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0080';

      let a: Array<int>[] = [[1, 3], [5, 7]]
      let b: Array<int[]> = foo2(a)
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

      expect(testNS31.runTest()).assertEqual(true)
      expect(testNS32.runTest()).assertEqual(true)
      expect(testNS33.runTest()).assertEqual(true)
      expect(testNS34.runTest()).assertEqual(true)
      expect(testNS35.runTest()).assertEqual(true)
      expect(testNS36.runTest()).assertEqual(true)
      expect(testNS37.runTest()).assertEqual(true)
      expect(testNS38.runTest()).assertEqual(true)
      expect(testNS39.runTest()).assertEqual(true)
      expect(testNS40.runTest()).assertEqual(true)
      expect(testNS41.runTest()).assertEqual(true)
      expect(testNS42.runTest()).assertEqual(true)
      expect(testNS43.runTest()).assertEqual(true)
      expect(testNS44.runTest()).assertEqual(true)
      expect(testNS45.runTest()).assertEqual(true)

    });
    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_8100
     * @tc.name      testArrayOfArraysTypesIdentity0081
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0081';

      let a: C[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<Array<C>> = foo3(a)
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

      expect(testNS46.runTest()).assertEqual(true)

    });
    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_8200
     * @tc.name      testArrayOfArraysTypesIdentity0082
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0082';

      let a: C1[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<Array<C1>> = foo4(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C1).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C1).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C1).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C1).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C1).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C1).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C1).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C1).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)
      expect(testNS47.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_8300
     * @tc.name      testArrayOfArraysTypesIdentity0083
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0083';

      let a: C2[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<Array<C2>> = foo5(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C2).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C2).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C2).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C2).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C2).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C2).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C2).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C2).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS48.runTest()).assertEqual(true)

    });
  })
}