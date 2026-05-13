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

namespace testNS91 {
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

namespace testNS92 {
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

namespace testNS93 {
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

namespace testNS94 {
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

namespace testNS95 {
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

namespace testNS96 {
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

namespace testNS97 {
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

namespace testNS98 {
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

namespace testNS99 {
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

namespace testNS100 {
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

namespace testNS101 {
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

namespace testNS102 {
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

namespace testNS103 {
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

namespace testNS104 {
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

namespace testNS105 {
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

namespace testNS106 {
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

namespace testNS107 {
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

namespace testNS108 {
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

namespace testNS109 {
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

namespace testNS110 {
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

namespace testNS111 {
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

namespace testNS112 {
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

namespace testNS113 {
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

namespace testNS114 {
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

namespace testNS115 {
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

namespace testNS116 {
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

namespace testNS117 {
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

namespace testNS118 {
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

namespace testNS119 {
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

namespace testNS120 {
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

export default function ArrayOfArraysTypesIdentityTest21(): void {
  describe('ArrayOfArraysTypesIdentityTest21', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_6000
     * @tc.name      testArrayOfArraysTypesIdentity0060
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0060';
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

      expect(testNS91.runTest()).assertEqual(true)
      expect(testNS92.runTest()).assertEqual(true)
      expect(testNS93.runTest()).assertEqual(true)
      expect(testNS94.runTest()).assertEqual(true)
      expect(testNS95.runTest()).assertEqual(true)
      expect(testNS96.runTest()).assertEqual(true)
      expect(testNS97.runTest()).assertEqual(true)
      expect(testNS98.runTest()).assertEqual(true)
      expect(testNS99.runTest()).assertEqual(true)
      expect(testNS100.runTest()).assertEqual(true)
      expect(testNS101.runTest()).assertEqual(true)
      expect(testNS102.runTest()).assertEqual(true)
      expect(testNS103.runTest()).assertEqual(true)
      expect(testNS104.runTest()).assertEqual(true)
      expect(testNS105.runTest()).assertEqual(true)
    });
    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_6100
     * @tc.name      testArrayOfArraysTypesIdentity0061
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0061';
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

      expect(testNS106.runTest()).assertEqual(true)
      expect(testNS107.runTest()).assertEqual(true)
      expect(testNS108.runTest()).assertEqual(true)
      expect(testNS109.runTest()).assertEqual(true)
      expect(testNS110.runTest()).assertEqual(true)
      expect(testNS111.runTest()).assertEqual(true)
      expect(testNS112.runTest()).assertEqual(true)
      expect(testNS113.runTest()).assertEqual(true)
      expect(testNS114.runTest()).assertEqual(true)
      expect(testNS115.runTest()).assertEqual(true)
      expect(testNS116.runTest()).assertEqual(true)
      expect(testNS117.runTest()).assertEqual(true)
      expect(testNS118.runTest()).assertEqual(true)
      expect(testNS119.runTest()).assertEqual(true)
      expect(testNS120.runTest()).assertEqual(true)
    });
  })
}