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
  function foo(p: Array<Array<number>>): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS2 {
  function foo(p: Array<Array<number>>): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS3 {
  function foo(p: Array<Array<number>>): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS4 {
  function foo(p: Array<Array<number>>): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS5 {
  function foo(p: Array<Array<number>>): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1.5)
    expect(b[0][1]).assertEqual(3.7)
    expect(b[1][0]).assertEqual(5.4)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1.5)
    expect(a[0][1]).assertEqual(3.7)
    expect(a[1][0]).assertEqual(5.4)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS6 {
  function foo(p: Array<Array<number>>): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1.5)
    expect(b[0][1]).assertEqual(3.7)
    expect(b[1][0]).assertEqual(5.4)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1.5)
    expect(a[0][1]).assertEqual(3.7)
    expect(a[1][0]).assertEqual(5.4)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS7 {
  function foo(p: Array<Array<number>>): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1.5)
    expect(b[0][1]).assertEqual(3.7)
    expect(b[1][0]).assertEqual(5.4)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1.5)
    expect(a[0][1]).assertEqual(3.7)
    expect(a[1][0]).assertEqual(5.4)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS8 {
  function foo(p: Array<Array<bigint>>): bigint[][] {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[][] = [[1n, 3n], [5n, 7n]]
    let b: Array<Array<bigint>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1n)
    expect(b[0][1]).assertEqual(3n)
    expect(b[1][0]).assertEqual(5n)
    expect(b[1][1]).assertEqual(7n)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1n)
    expect(a[0][1]).assertEqual(3n)
    expect(a[1][0]).assertEqual(5n)
    expect(a[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS9 {
  function foo(p: Array<Array<string>>): string[][] {
    return p
  }

  export function runTest(): boolean {
    let a: string[][] = [["ab", "c"], ["de", "f"]]
    let b: Array<Array<string>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual("ab")
    expect(b[0][1]).assertEqual("c")
    expect(b[1][0]).assertEqual("de")
    expect(b[1][1]).assertEqual("f")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual("ab")
    expect(a[0][1]).assertEqual("c")
    expect(a[1][0]).assertEqual("de")
    expect(a[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS10 {
  function foo(p: Array<Array<string>>): string[][] {
    return p
  }

  export function runTest(): boolean {
    let a: string[][] = [["a", "b"], ["c", "d"]]
    let b: Array<Array<string>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual("a")
    expect(b[0][1]).assertEqual("b")
    expect(b[1][0]).assertEqual("c")
    expect(b[1][1]).assertEqual("d")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual("a")
    expect(a[0][1]).assertEqual("b")
    expect(a[1][0]).assertEqual("c")
    expect(a[1][1]).assertEqual("d")
    return true
  }
}

namespace testNS11 {
  function foo(p: Array<Array<boolean>>): boolean[][] {
    return p
  }

  export function runTest(): boolean {
    let a: boolean[][] = [[false, true], [true, false]]
    let b: Array<Array<boolean>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(false)
    expect(b[0][1]).assertEqual(true)
    expect(b[1][0]).assertEqual(true)
    expect(b[1][1]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(false)
    expect(a[0][1]).assertEqual(true)
    expect(a[1][0]).assertEqual(true)
    expect(a[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS12 {
  function foo(p: Array<Array<Object>>): Object[][] {
    return p
  }

  export function runTest(): boolean {
    let a: Object[][] = [[1, 5n], ["abc", 17.6]]
    let b: Array<Array<Object>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0]).assertEqual("abc")
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0]).assertEqual("abc")
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS13 {
  function foo(p: Array<Array<Object | undefined>>): (Object | undefined)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[][] = [[undefined, 5n], ["abc", 17.6]]
    let b: Array<Array<Object | undefined>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0]).assertEqual("abc")
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
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

namespace testNS14 {
  function foo(p: Array<Array<Object | undefined | null>>): (Object | undefined | null)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[][] = [[undefined, 5n], [null, 17.6]]
    let b: Array<Array<Object | undefined | null>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
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

namespace testNS15 {
  function foo(p: Array<Array<Object | undefined | null>>): (Object | undefined | null)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[][] = [[undefined, 5n], [null, 17.6]]
    let b: Array<Array<Object | undefined | null>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
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

namespace testNS16 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS17 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS18 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS19 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1, 3], [5, 7]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1]).assertEqual(3)
    expect(b[1][0]).assertEqual(5)
    expect(b[1][1]).assertEqual(7)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1]).assertEqual(3)
    expect(a[1][0]).assertEqual(5)
    expect(a[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS20 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1.5)
    expect(b[0][1]).assertEqual(3.7)
    expect(b[1][0]).assertEqual(5.4)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1.5)
    expect(a[0][1]).assertEqual(3.7)
    expect(a[1][0]).assertEqual(5.4)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS21 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1.5)
    expect(b[0][1]).assertEqual(3.7)
    expect(b[1][0]).assertEqual(5.4)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1.5)
    expect(a[0][1]).assertEqual(3.7)
    expect(a[1][0]).assertEqual(5.4)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS22 {
  function foo(p: number[][]): number[][] {
    return p
  }

  export function runTest(): boolean {
    let a: number[][] = [[1.5, 3.7], [5.4, 7.8]]
    let b: Array<Array<number>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1.5)
    expect(b[0][1]).assertEqual(3.7)
    expect(b[1][0]).assertEqual(5.4)
    expect(b[1][1]).assertEqual(7.8)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1.5)
    expect(a[0][1]).assertEqual(3.7)
    expect(a[1][0]).assertEqual(5.4)
    expect(a[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS23 {
  function foo(p: bigint[][]): bigint[][] {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[][] = [[1n, 3n], [5n, 7n]]
    let b: Array<Array<bigint>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1n)
    expect(b[0][1]).assertEqual(3n)
    expect(b[1][0]).assertEqual(5n)
    expect(b[1][1]).assertEqual(7n)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1n)
    expect(a[0][1]).assertEqual(3n)
    expect(a[1][0]).assertEqual(5n)
    expect(a[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS24 {
  function foo(p: string[][]): string[][] {
    return p
  }

  export function runTest(): boolean {
    let a: string[][] = [["ab", "c"], ["de", "f"]]
    let b: Array<Array<string>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual("ab")
    expect(b[0][1]).assertEqual("c")
    expect(b[1][0]).assertEqual("de")
    expect(b[1][1]).assertEqual("f")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual("ab")
    expect(a[0][1]).assertEqual("c")
    expect(a[1][0]).assertEqual("de")
    expect(a[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS25 {
  function foo(p: string[][]): string[][] {
    return p
  }

  export function runTest(): boolean {
    let a: string[][] = [["a", "b"], ["c", "d"]]
    let b: Array<Array<string>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual("a")
    expect(b[0][1]).assertEqual("b")
    expect(b[1][0]).assertEqual("c")
    expect(b[1][1]).assertEqual("d")
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual("a")
    expect(a[0][1]).assertEqual("b")
    expect(a[1][0]).assertEqual("c")
    expect(a[1][1]).assertEqual("d")
    return true
  }
}

namespace testNS26 {
  function foo(p: boolean[][]): boolean[][] {
    return p
  }

  export function runTest(): boolean {
    let a: boolean[][] = [[false, true], [true, false]]
    let b: Array<Array<boolean>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(false)
    expect(b[0][1]).assertEqual(true)
    expect(b[1][0]).assertEqual(true)
    expect(b[1][1]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(false)
    expect(a[0][1]).assertEqual(true)
    expect(a[1][0]).assertEqual(true)
    expect(a[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS27 {
  function foo(p: Object[][]): Object[][] {
    return p
  }

  export function runTest(): boolean {
    let a: Object[][] = [[1, 5n], ["abc", 17.6]]
    let b: Array<Array<Object>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(1)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0]).assertEqual("abc")
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0]).assertEqual(1)
    expect(a[0][1]).assertEqual(5n)
    expect(a[1][0]).assertEqual("abc")
    expect(a[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS28 {
  function foo(p: (Object | undefined)[][]): (Object | undefined)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[][] = [[undefined, 5n], ["abc", 17.6]]
    let b: Array<Array<(Object | undefined)>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0]).assertEqual("abc")
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
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

namespace testNS29 {
  function foo(p: (Object | undefined | null)[][]): (Object | undefined | null)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[][] = [[undefined, 5n], [null, 17.6]]
    let b: Array<Array<(Object | undefined | null)>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
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

namespace testNS30 {
  function foo(p: (Object | undefined | null)[][]): (Object | undefined | null)[][] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[][] = [[undefined, 5n], [null, 17.6]]
    let b: Array<Array<Object | undefined | null>> = foo(a)
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
    expect(b instanceof Array).assertTrue()
    expect(b[0] instanceof Array).assertTrue()
    expect(b[1] instanceof Array).assertTrue()
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0]).assertEqual(undefined)
    expect(b[0][1]).assertEqual(5n)
    expect(b[1][0]).assertEqual(null)
    expect(b[1][1]).assertEqual(17.6)
    a = b
    expect(a instanceof Array).assertTrue()
    expect(a[0] instanceof Array).assertTrue()
    expect(a[1] instanceof Array).assertTrue()
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

export default function ArrayOfArraysTypesIdentityTest18(): void {
  describe('ArrayOfArraysTypesIdentityTest18', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_5400
     * @tc.name      testArrayOfArraysTypesIdentity0054
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0054';
      let a: number[][] = [[1, 3], [5, 7]]
      let b: Array<Array<number>> = foo(a)
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(b instanceof Array).assertTrue()
      expect(b[0] instanceof Array).assertTrue()
      expect(b[1] instanceof Array).assertTrue()
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0]).assertEqual(1)
      expect(b[0][1]).assertEqual(3)
      expect(b[1][0]).assertEqual(5)
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0]).assertEqual(1)
      expect(a[0][1]).assertEqual(3)
      expect(a[1][0]).assertEqual(5)
      expect(a[1][1]).assertEqual(7)

      expect(testNS1.runTest()).assertTrue()
      expect(testNS2.runTest()).assertTrue()
      expect(testNS3.runTest()).assertTrue()
      expect(testNS4.runTest()).assertTrue()
      expect(testNS5.runTest()).assertTrue()
      expect(testNS6.runTest()).assertTrue()
      expect(testNS7.runTest()).assertTrue()
      expect(testNS8.runTest()).assertTrue()
      expect(testNS9.runTest()).assertTrue()
      expect(testNS10.runTest()).assertTrue()
      expect(testNS11.runTest()).assertTrue()
      expect(testNS12.runTest()).assertTrue()
      expect(testNS13.runTest()).assertTrue()
      expect(testNS14.runTest()).assertTrue()
      expect(testNS15.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_5500
     * @tc.name      testArrayOfArraysTypesIdentity0055
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0055';

      let a: number[][] = [[1, 3], [5, 7]]
      let b: Array<Array<number>> = foo(a)
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(b instanceof Array).assertTrue()
      expect(b[0] instanceof Array).assertTrue()
      expect(b[1] instanceof Array).assertTrue()
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0]).assertEqual(1)
      expect(b[0][1]).assertEqual(3)
      expect(b[1][0]).assertEqual(5)
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Array).assertTrue()
      expect(a[1] instanceof Array).assertTrue()
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0]).assertEqual(1)
      expect(a[0][1]).assertEqual(3)
      expect(a[1][0]).assertEqual(5)
      expect(a[1][1]).assertEqual(7)

      expect(testNS16.runTest()).assertTrue()
      expect(testNS17.runTest()).assertTrue()
      expect(testNS18.runTest()).assertTrue()
      expect(testNS19.runTest()).assertTrue()
      expect(testNS20.runTest()).assertTrue()
      expect(testNS21.runTest()).assertTrue()
      expect(testNS22.runTest()).assertTrue()
      expect(testNS23.runTest()).assertTrue()
      expect(testNS24.runTest()).assertTrue()
      expect(testNS25.runTest()).assertTrue()
      expect(testNS26.runTest()).assertTrue()
      expect(testNS27.runTest()).assertTrue()
      expect(testNS28.runTest()).assertTrue()
      expect(testNS29.runTest()).assertTrue()
      expect(testNS30.runTest()).assertTrue()
    });
  })
}