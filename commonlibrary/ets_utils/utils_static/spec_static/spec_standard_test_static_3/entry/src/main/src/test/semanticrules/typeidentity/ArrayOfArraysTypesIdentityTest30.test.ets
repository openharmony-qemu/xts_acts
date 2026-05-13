/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace testNS1 {
  function foo(p: int[][]): Array<Array<int>> {
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

namespace testNS2 {
  function foo(p: long[][]): Array<Array<long>> {
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

namespace testNS3 {
  function foo(p: byte[][]): Array<Array<byte>> {
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

namespace testNS4 {
  function foo(p: short[][]): Array<Array<short>> {
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

namespace testNS5 {
  function foo(p: double[][]): Array<Array<double>> {
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

namespace testNS6 {
  function foo(p: number[][]): Array<Array<number>> {
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

namespace testNS7 {
  function foo(p: float[][]): Array<Array<float>> {
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

namespace testNS8 {
  function foo(p: bigint[][]): Array<Array<bigint>> {
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

namespace testNS9 {
  function foo(p: string[][]): Array<Array<string>> {
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

namespace testNS10 {
  function foo(p: char[][]): Array<Array<char>> {
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

namespace testNS11 {
  function foo(p: boolean[][]): Array<Array<boolean>> {
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

namespace testNS12 {
  function foo(p: Object[][]): Array<Array<Object>> {
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

namespace testNS13 {
  function foo(p: (Object | undefined)[][]): Array<Array<(Object | undefined)>> {
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

namespace testNS14 {
  function foo(p: (undefined | number| bigint | null)[][]): Array<Array<(undefined | number| bigint | null)>> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<(undefined | number| bigint | null)>[] = [[undefined, 5n], [null, 17.6]]
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
    expect(b[0][0] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(a[1][0]).assertEqual(null)
    expect(a[1][1] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS15 {
  function foo(p: (undefined | number| bigint | null)[][]): Array<Array<undefined | number| bigint | null>> {
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

function foo(p: int[][]): Array<Array<int>> {
  return p
}

namespace testNS16 {
  function foo(p: Array<int>[]): Array<int[]> {
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

namespace testNS17 {
  function foo(p: Array<long>[]): Array<long[]> {
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

namespace testNS18 {
  function foo(p: Array<byte>[]): Array<byte[]> {
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

namespace testNS19 {
  function foo(p: Array<short>[]): Array<short[]> {
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

namespace testNS20 {
  function foo(p: Array<double>[]): Array<double[]> {
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

namespace testNS21 {
  function foo(p: Array<number>[]): Array<number[]> {
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

namespace testNS22 {
  function foo(p: Array<float>[]): Array<float[]> {
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

namespace testNS23 {
  function foo(p: Array<bigint>[]): Array<bigint[]> {
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

namespace testNS24 {
  function foo(p: Array<string>[]): Array<string[]> {
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

namespace testNS25 {
  function foo(p: Array<char>[]): Array<char[]> {
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

namespace testNS26 {
  function foo(p: Array<boolean>[]): Array<boolean[]> {
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

namespace testNS27 {
  function foo(p: Array<Object>[]): Array<Object[]> {
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

namespace testNS28 {
  function foo(p: Array<(Object | undefined)>[]): Array<(Object | undefined)[]> {
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

namespace testNS29 {
  function foo(p: Array<(undefined | number| bigint | null)>[]): Array<(undefined | number| bigint | null)[]> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<(undefined | number| bigint | null)>[] = [[undefined, 5n], [null, 17.6]]
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
    expect(b[0][0] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(a[1][0]).assertEqual(null)
    expect(a[1][1] instanceof (undefined | number| bigint | null)).assertEqual(true)
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS30 {
  function foo(p: Array<undefined | number| bigint | null>[]): Array<(undefined | number| bigint | null)[]> {
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

function foo1(p: Array<int>[]): Array<int[]> {
  return p
}
export default function ArrayOfArraysTypesIdentityTest(): void {
  describe('ArrayOfArraysTypesIdentityTest', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_7800
     * @tc.name      testArrayOfArraysTypesIdentity0078
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0078';

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

      expect(testNS1.runTest()).assertEqual(true)
      expect(testNS2.runTest()).assertEqual(true)
      expect(testNS3.runTest()).assertEqual(true)
      expect(testNS4.runTest()).assertEqual(true)
      expect(testNS5.runTest()).assertEqual(true)
      expect(testNS6.runTest()).assertEqual(true)
      expect(testNS7.runTest()).assertEqual(true)
      expect(testNS8.runTest()).assertEqual(true)
      expect(testNS9.runTest()).assertEqual(true)
      expect(testNS10.runTest()).assertEqual(true)
      expect(testNS11.runTest()).assertEqual(true)
      expect(testNS12.runTest()).assertEqual(true)
      expect(testNS13.runTest()).assertEqual(true)
      expect(testNS14.runTest()).assertEqual(true)
      expect(testNS15.runTest()).assertEqual(true)

    });
    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_7900
     * @tc.name      testArrayOfArraysTypesIdentity0079
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0079';

      let a: Array<int>[] = [[1, 3], [5, 7]]
      let b: Array<int[]> = foo1(a)
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

      expect(testNS16.runTest()).assertEqual(true)
      expect(testNS17.runTest()).assertEqual(true)
      expect(testNS18.runTest()).assertEqual(true)
      expect(testNS19.runTest()).assertEqual(true)
      expect(testNS20.runTest()).assertEqual(true)
      expect(testNS21.runTest()).assertEqual(true)
      expect(testNS22.runTest()).assertEqual(true)
      expect(testNS23.runTest()).assertEqual(true)
      expect(testNS24.runTest()).assertEqual(true)
      expect(testNS25.runTest()).assertEqual(true)
      expect(testNS26.runTest()).assertEqual(true)
      expect(testNS27.runTest()).assertEqual(true)
      expect(testNS28.runTest()).assertEqual(true)
      expect(testNS29.runTest()).assertEqual(true)
      expect(testNS30.runTest()).assertEqual(true)

    });
  })
}