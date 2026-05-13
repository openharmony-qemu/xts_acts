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

namespace testNS61 {
  function foo(p: number[][]): number[] {
    return ([] as number[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = [foo(a)] as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[0][2] === 'number').assertEqual(true)
    expect(b[0][2]).assertEqual(5)
    expect(typeof b[0][3] === 'number').assertEqual(true)
    expect(b[0][3]).assertEqual(7)
    a = b as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[0][2] === 'number').assertEqual(true)
    expect(a[0][2]).assertEqual(5)
    expect(typeof a[0][3] === 'number').assertEqual(true)
    expect(a[0][3]).assertEqual(7)
    return true
  }
}

namespace testNS62 {
  function foo(p: number[][]): number[] {
    return ([] as number[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = [foo(a)] as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[0][2] === 'number').assertEqual(true)
    expect(b[0][2]).assertEqual(5)
    expect(typeof b[0][3] === 'number').assertEqual(true)
    expect(b[0][3]).assertEqual(7)
    a = b as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[0][2] === 'number').assertEqual(true)
    expect(a[0][2]).assertEqual(5)
    expect(typeof a[0][3] === 'number').assertEqual(true)
    expect(a[0][3]).assertEqual(7)
    return true
  }
}

namespace testNS63 {
  function foo(p: number[][]): number[] {
    return ([] as number[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = [foo(a)] as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[0][2] === 'number').assertEqual(true)
    expect(b[0][2]).assertEqual(5)
    expect(typeof b[0][3] === 'number').assertEqual(true)
    expect(b[0][3]).assertEqual(7)
    a = b as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[0][2] === 'number').assertEqual(true)
    expect(a[0][2]).assertEqual(5)
    expect(typeof a[0][3] === 'number').assertEqual(true)
    expect(a[0][3]).assertEqual(7)
    return true
  }
}

namespace testNS64 {
  function foo(p: number[][]): number[] {
    return ([] as number[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: number[][] = [foo(a)] as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3)
    expect(typeof b[0][2] === 'number').assertEqual(true)
    expect(b[0][2]).assertEqual(5)
    expect(typeof b[0][3] === 'number').assertEqual(true)
    expect(b[0][3]).assertEqual(7)
    a = b as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3)
    expect(typeof a[0][2] === 'number').assertEqual(true)
    expect(a[0][2]).assertEqual(5)
    expect(typeof a[0][3] === 'number').assertEqual(true)
    expect(a[0][3]).assertEqual(7)
    return true
  }
}

namespace testNS65 {
  function foo(p: number[][]): number[] {
    return ([] as number[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = [foo(a)] as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[0][2] === 'number').assertEqual(true)
    expect(b[0][2]).assertEqual(5.4)
    expect(typeof b[0][3] === 'number').assertEqual(true)
    expect(b[0][3]).assertEqual(7.8)
    a = b as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[0][2] === 'number').assertEqual(true)
    expect(a[0][2]).assertEqual(5.4)
    expect(typeof a[0][3] === 'number').assertEqual(true)
    expect(a[0][3]).assertEqual(7.8)
    return true
  }
}

namespace testNS66 {
  function foo(p: number[][]): number[] {
      return ([] as number[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = [foo(a)] as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[0][2] === 'number').assertEqual(true)
    expect(b[0][2]).assertEqual(5.4)
    expect(typeof b[0][3] === 'number').assertEqual(true)
    expect(b[0][3]).assertEqual(7.8)
    a = b as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[0][2] === 'number').assertEqual(true)
    expect(a[0][2]).assertEqual(5.4)
    expect(typeof a[0][3] === 'number').assertEqual(true)
    expect(a[0][3]).assertEqual(7.8)
    return true
  }
}

namespace testNS67 {
  function foo(p: number[][]): number[] {
      return ([] as number[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: number[][] = [foo(a)] as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'number').assertEqual(true)
    expect(b[0][0]).assertEqual(1.5)
    expect(typeof b[0][1] === 'number').assertEqual(true)
    expect(b[0][1]).assertEqual(3.7)
    expect(typeof b[0][2] === 'number').assertEqual(true)
    expect(b[0][2]).assertEqual(5.4)
    expect(typeof b[0][3] === 'number').assertEqual(true)
    expect(b[0][3]).assertEqual(7.8)
    a = b as number[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'number').assertEqual(true)
    expect(a[0][0]).assertEqual(1.5)
    expect(typeof a[0][1] === 'number').assertEqual(true)
    expect(a[0][1]).assertEqual(3.7)
    expect(typeof a[0][2] === 'number').assertEqual(true)
    expect(a[0][2]).assertEqual(5.4)
    expect(typeof a[0][3] === 'number').assertEqual(true)
    expect(a[0][3]).assertEqual(7.8)
    return true
  }
}

namespace testNS68 {
  function foo(p: bigint[][]): bigint[] {
    return ([] as bigint[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: bigint[][] = [[1n, 3n], [5n, 7n]]
    let b: bigint[][] = [foo(a)] as bigint[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'bigint').assertEqual(true)
    expect(b[0][0]).assertEqual(1n)
    expect(typeof b[0][1] === 'bigint').assertEqual(true)
    expect(b[0][1]).assertEqual(3n)
    expect(typeof b[0][2] === 'bigint').assertEqual(true)
    expect(b[0][2]).assertEqual(5n)
    expect(typeof b[0][3] === 'bigint').assertEqual(true)
    expect(b[0][3]).assertEqual(7n)
    a = b as bigint[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'bigint').assertEqual(true)
    expect(a[0][0]).assertEqual(1n)
    expect(typeof a[0][1] === 'bigint').assertEqual(true)
    expect(a[0][1]).assertEqual(3n)
    expect(typeof a[0][2] === 'bigint').assertEqual(true)
    expect(a[0][2]).assertEqual(5n)
    expect(typeof a[0][3] === 'bigint').assertEqual(true)
    expect(a[0][3]).assertEqual(7n)
    return true
  }
}

namespace testNS69 {
  function foo(p: string[][]): string[] {
    return ([] as string[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: string[][] = [["ab", "c"], ["de", "f"]]
    let b: string[][] = [foo(a)] as string[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'string').assertEqual(true)
    expect(b[0][0]).assertEqual("ab")
    expect(typeof b[0][1] === 'string').assertEqual(true)
    expect(b[0][1]).assertEqual("c")
    expect(typeof b[0][2] === 'string').assertEqual(true)
    expect(b[0][2]).assertEqual("de")
    expect(typeof b[0][3] === 'string').assertEqual(true)
    expect(b[0][3]).assertEqual("f")
    a = b as string[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'string').assertEqual(true)
    expect(a[0][0]).assertEqual("ab")
    expect(typeof a[0][1] === 'string').assertEqual(true)
    expect(a[0][1]).assertEqual("c")
    expect(typeof a[0][2] === 'string').assertEqual(true)
    expect(a[0][2]).assertEqual("de")
    expect(typeof a[0][3] === 'string').assertEqual(true)
    expect(a[0][3]).assertEqual("f")
    return true
  }
}

namespace testNS70 {
  function foo(p: string[][]): string[] {
    return ([] as string[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: string[][] = [["a", "b"], ["c", "d"]]
    let b: string[][] = [foo(a)] as string[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'string').assertEqual(true)
    expect(b[0][0]).assertEqual("a")
    expect(typeof b[0][1] === 'string').assertEqual(true)
    expect(b[0][1]).assertEqual("b")
    expect(typeof b[0][2] === 'string').assertEqual(true)
    expect(b[0][2]).assertEqual("c")
    expect(typeof b[0][3] === 'string').assertEqual(true)
    expect(b[0][3]).assertEqual("d")
    a = b as string[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'string').assertEqual(true)
    expect(a[0][0]).assertEqual("a")
    expect(typeof a[0][1] === 'string').assertEqual(true)
    expect(a[0][1]).assertEqual("b")
    expect(typeof a[0][2] === 'string').assertEqual(true)
    expect(a[0][2]).assertEqual("c")
    expect(typeof a[0][3] === 'string').assertEqual(true)
    expect(a[0][3]).assertEqual("d")
    return true
  }
}

namespace testNS71 {
  function foo(p: boolean[][]): boolean[] {
    return ([] as boolean[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: boolean[][] = [[false, true], [true, false]]
    let b: boolean[][] = [foo(a)] as boolean[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(typeof b[0][0] === 'boolean').assertEqual(true)
    expect(b[0][0]).assertEqual(false)
    expect(typeof b[0][1] === 'boolean').assertEqual(true)
    expect(b[0][1]).assertEqual(true)
    expect(typeof b[0][2] === 'boolean').assertEqual(true)
    expect(b[0][2]).assertEqual(true)
    expect(typeof b[0][3] === 'boolean').assertEqual(true)
    expect(b[0][3]).assertEqual(false)
    a = b as boolean[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(typeof a[0][0] === 'boolean').assertEqual(true)
    expect(a[0][0]).assertEqual(false)
    expect(typeof a[0][1] === 'boolean').assertEqual(true)
    expect(a[0][1]).assertEqual(true)
    expect(typeof a[0][2] === 'boolean').assertEqual(true)
    expect(a[0][2]).assertEqual(true)
    expect(typeof a[0][3] === 'boolean').assertEqual(true)
    expect(a[0][3]).assertEqual(false)
    return true
  }
}

namespace testNS72 {
  function foo(p: Object[][]): Object[] {
    return ([] as Object[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: Object[][] = [[1, 5n], ["abc", 17.6]]
    let b: Object[][] = [foo(a)] as Object[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(b[0][0] instanceof Object).assertEqual(true)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1] instanceof Object).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[0][2] instanceof Object).assertEqual(true)
    expect(b[0][2]).assertEqual("abc")
    expect(b[0][3] instanceof Object).assertEqual(true)
    expect(b[0][3]).assertEqual(17.6)
    a = b as Object[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(a[0][0] instanceof Object).assertEqual(true)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1] instanceof Object).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[0][2] instanceof Object).assertEqual(true)
    expect(a[0][2]).assertEqual("abc")
    expect(a[0][3] instanceof Object).assertEqual(true)
    expect(a[0][3]).assertEqual(17.6)
    return true
  }
}

namespace testNS73 {
  function foo(p: (Object | undefined)[][]): (Object | undefined)[] {
    return ([] as (Object | undefined)[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[][] = [[undefined, 5n], ["abc", 17.6]]
    let b: (Object | undefined)[][] = [foo(a)] as (Object | undefined)[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(b[0][0] === undefined || b[0][0] instanceof Object).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] === undefined || b[0][1] instanceof Object).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[0][2] === undefined || b[0][2] instanceof Object).assertEqual(true)
    expect(b[0][2]).assertEqual("abc")
    expect(b[0][3] === undefined || b[0][3] instanceof Object).assertEqual(true)
    expect(b[0][3]).assertEqual(17.6)
    a = b as (Object | undefined)[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(a[0][0] === undefined || a[0][0] instanceof Object).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] === undefined || a[0][1] instanceof Object).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[0][2] === undefined || a[0][2] instanceof Object).assertEqual(true)
    expect(a[0][2]).assertEqual("abc")
    expect(a[0][3] === undefined || a[0][3] instanceof Object).assertEqual(true)
    expect(a[0][3]).assertEqual(17.6)
    return true
  }
}

namespace testNS74 {
  function foo(p: (Object | undefined | null)[][]): (Object | undefined | null)[] {
    return ([] as (Object | undefined | null)[]).concat(...p);
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[][] = [[undefined, 5n], [null, 17.6]]
    let b: (Object | undefined | null)[][] = [foo(a)] as (Object | undefined | null)[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(b[0][0] === undefined || b[0][0] === null || b[0][0] instanceof Object).assertEqual(true)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1] === undefined || b[0][1] === null || b[0][1] instanceof Object).assertEqual(true)
    expect(b[0][1]).assertEqual(5n)
    expect(b[0][2] === undefined || b[0][2] === null || b[0][2] instanceof Object).assertEqual(true)
    expect(b[0][2]).assertEqual(null)
    expect(b[0][3] === undefined || b[0][3] === null || b[0][3] instanceof Object).assertEqual(true)
    expect(b[0][3]).assertEqual(17.6)
    a = b as (Object | undefined | null)[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(a[0][0] === undefined || a[0][0] === null || a[0][0] instanceof Object).assertEqual(true)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1] === undefined || a[0][1] === null || a[0][1] instanceof Object).assertEqual(true)
    expect(a[0][1]).assertEqual(5n)
    expect(a[0][2] === undefined || a[0][2] === null || a[0][2] instanceof Object).assertEqual(true)
    expect(a[0][2]).assertEqual(null)
    expect(a[0][3] === undefined || a[0][3] === null || a[0][3] instanceof Object).assertEqual(true)
    expect(a[0][3]).assertEqual(17.6)
    return true
  }
}

namespace testNS75 {
  function foo(p: (bigint | number | undefined | null | string | boolean)[][]):
    (bigint | number | undefined | null | string | boolean)[] {
    return ([] as (bigint | number | undefined | null | string | boolean)[]).concat(...p);

  }

  export function runTest(): boolean {
    let a: (bigint | number | undefined | null | string | boolean)[][] = [[undefined, 5n], [null, 17.6]]
    let b: (bigint | number | undefined | null | string | boolean)[][] =
      [foo(a)] as (bigint | number | undefined | null | string | boolean)[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(1)
    expect(b[0].length).assertEqual(4)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1]).assertEqual(5n)
    expect(b[0][2]).assertEqual(null)
    expect(b[0][3]).assertEqual(17.6)
    a = b as (bigint | number | undefined | null | string | boolean)[][]
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(1)
    expect(a[0].length).assertEqual(4)
    expect(a[0][0]).assertEqual(undefined)
    expect(a[0][1]).assertEqual(5n)
    expect(a[0][2]).assertEqual(null)
    expect(a[0][3]).assertEqual(17.6)
    return true
  }
}

namespace testNS76 {
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
    a = b as number[][]
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

namespace testNS77 {
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
    a = b as number[][]
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

namespace testNS78 {
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
    a = b as number[][]
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

namespace testNS79 {
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
    a = b as number[][]
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

namespace testNS80 {
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
    a = b as number[][]
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

namespace testNS81 {
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
    a = b as number[][]
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

namespace testNS82 {
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
    a = b as number[][]
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

namespace testNS83 {
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
    a = b as bigint[][]
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

namespace testNS84 {
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
    a = b as string[][]
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

namespace testNS85 {
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
    a = b as string[][]
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

namespace testNS86 {
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
    a = b as boolean[][]
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

namespace testNS87 {
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
    a = b as Object[][]
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

namespace testNS88 {
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
    a = b as (Object | undefined)[][]
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

namespace testNS89 {
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
    a = b as (Object | undefined | null)[][]
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

namespace testNS90 {
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
    a = b as (bigint | number | undefined | null | string | boolean)[][]
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

function foo_1(p: number[][]): number[] {
  return ([] as number[]).concat(...p);
}

export default function ArrayOfArraysTypesIdentityTest20(): void {
  describe('ArrayOfArraysTypesIdentityTest20', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_5800
     * @tc.name      testArrayOfArraysTypesIdentity0058
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0058';
      let a: number[][] = [[1, 3], [5, 7]]
      let b: number[][] = [foo_1(a)] as number[][]
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(1)
      expect(b[0].length).assertEqual(4)
      expect(typeof b[0][0] === 'number').assertEqual(true)
      expect(b[0][0]).assertEqual(1)
      expect(typeof b[0][1] === 'number').assertEqual(true)
      expect(b[0][1]).assertEqual(3)
      expect(typeof b[0][2] === 'number').assertEqual(true)
      expect(b[0][2]).assertEqual(5)
      expect(typeof b[0][3] === 'number').assertEqual(true)
      expect(b[0][3]).assertEqual(7)
      a = b as number[][]
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(1)
      expect(a[0].length).assertEqual(4)
      expect(typeof a[0][0] === 'number').assertEqual(true)
      expect(a[0][0]).assertEqual(1)
      expect(typeof a[0][1] === 'number').assertEqual(true)
      expect(a[0][1]).assertEqual(3)
      expect(typeof a[0][2] === 'number').assertEqual(true)
      expect(a[0][2]).assertEqual(5)
      expect(typeof a[0][3] === 'number').assertEqual(true)
      expect(a[0][3]).assertEqual(7)

      expect(testNS61.runTest()).assertEqual(true)
      expect(testNS62.runTest()).assertEqual(true)
      expect(testNS63.runTest()).assertEqual(true)
      expect(testNS64.runTest()).assertEqual(true)
      expect(testNS65.runTest()).assertEqual(true)
      expect(testNS66.runTest()).assertEqual(true)
      expect(testNS67.runTest()).assertEqual(true)
      expect(testNS68.runTest()).assertEqual(true)
      expect(testNS69.runTest()).assertEqual(true)
      expect(testNS70.runTest()).assertEqual(true)
      expect(testNS71.runTest()).assertEqual(true)
      expect(testNS72.runTest()).assertEqual(true)
      expect(testNS73.runTest()).assertEqual(true)
      expect(testNS74.runTest()).assertEqual(true)
      expect(testNS75.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_5900
     * @tc.name      testArrayOfArraysTypesIdentity0059
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0059';
      let a: number[][] = [[1, 3], [5, 7]]
      let b: number[][] = a
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
      a = b as number[][]
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

      expect(testNS76.runTest()).assertEqual(true)
      expect(testNS77.runTest()).assertEqual(true)
      expect(testNS78.runTest()).assertEqual(true)
      expect(testNS79.runTest()).assertEqual(true)
      expect(testNS80.runTest()).assertEqual(true)
      expect(testNS81.runTest()).assertEqual(true)
      expect(testNS82.runTest()).assertEqual(true)
      expect(testNS83.runTest()).assertEqual(true)
      expect(testNS84.runTest()).assertEqual(true)
      expect(testNS85.runTest()).assertEqual(true)
      expect(testNS86.runTest()).assertEqual(true)
      expect(testNS87.runTest()).assertEqual(true)
      expect(testNS88.runTest()).assertEqual(true)
      expect(testNS89.runTest()).assertEqual(true)
      expect(testNS90.runTest()).assertEqual(true)
    });
  })
}