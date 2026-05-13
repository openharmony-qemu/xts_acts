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

class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

namespace testNS1_35 {
  function foo_35(p: int[]): Array<int> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<int> = [1, 3, 5]
    let b: int[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof int).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof int).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof int).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof int).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof int).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof int).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS2_35 {
  function foo_35(p: long[]): Array<long> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<long> = [1, 3, 5]
    let b: long[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof long).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof long).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof long).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof long).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof long).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof long).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS3_35 {
  function foo_35(p: byte[]): Array<byte> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<byte> = [1, 3, 5]
    let b: byte[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof byte).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof byte).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof byte).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof byte).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof byte).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof byte).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS4_35 {
  function foo_35(p: short[]): Array<short> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<short> = [1, 3, 5]
    let b: short[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof short).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof short).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof short).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof short).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof short).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof short).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS5_35 {
  function foo_35(p: double[]): Array<double> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<double> = [1.5, 3.7, 5.4]
    let b: double[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof double).assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof double).assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof double).assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof double).assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof double).assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof double).assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS6_35 {
  function foo_35(p: number[]): Array<number> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS7_35 {
  function foo_35(p: number[]): Array<number> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS8_35 {
  function foo_35(p: bigint[]): Array<bigint> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<bigint> = [1n, 3n, 5n]
    let b: bigint[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof bigint).assertEqual(true)
    expect(b[0]).assertEqual(1n)
    expect(b[1] instanceof bigint).assertEqual(true)
    expect(b[1]).assertEqual(3n)
    expect(b[2] instanceof bigint).assertEqual(true)
    expect(b[2]).assertEqual(5n)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof bigint).assertEqual(true)
    expect(a[0]).assertEqual(1n)
    expect(a[1] instanceof bigint).assertEqual(true)
    expect(a[1]).assertEqual(3n)
    expect(a[2] instanceof bigint).assertEqual(true)
    expect(a[2]).assertEqual(5n)
    return true
  }
}

namespace testNS9_35 {
  function foo_35(p: string[]): Array<string> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<string> = ["ab", "c", "def"]
    let b: string[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof string).assertEqual(true)
    expect(b[0]).assertEqual("ab")
    expect(b[1] instanceof string).assertEqual(true)
    expect(b[1]).assertEqual("c")
    expect(b[2] instanceof string).assertEqual(true)
    expect(b[2]).assertEqual("def")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof string).assertEqual(true)
    expect(a[0]).assertEqual("ab")
    expect(a[1] instanceof string).assertEqual(true)
    expect(a[1]).assertEqual("c")
    expect(a[2] instanceof string).assertEqual(true)
    expect(a[2]).assertEqual("def")
    return true
  }
}

namespace testNS10_35 {
  function foo_35(p: string[]): Array<string> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<string> = ['a', 'b', 'c']
    let b: string[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof string).assertEqual(true)
    expect(b[0]).assertEqual('a')
    expect(b[1] instanceof string).assertEqual(true)
    expect(b[1]).assertEqual('b')
    expect(b[2] instanceof string).assertEqual(true)
    expect(b[2]).assertEqual('c')
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof string).assertEqual(true)
    expect(a[0]).assertEqual('a')
    expect(a[1] instanceof string).assertEqual(true)
    expect(a[1]).assertEqual('b')
    expect(a[2] instanceof string).assertEqual(true)
    expect(a[2]).assertEqual('c')
    return true
  }
}

namespace testNS11_35 {
  function foo_35(p: boolean[]): Array<boolean> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<boolean> = [false, true, false]
    let b: boolean[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof boolean).assertEqual(true)
    expect(b[0]).assertEqual(false)
    expect(b[1] instanceof boolean).assertEqual(true)
    expect(b[1]).assertEqual(true)
    expect(b[2] instanceof boolean).assertEqual(true)
    expect(b[2]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof boolean).assertEqual(true)
    expect(a[0]).assertEqual(false)
    expect(a[1] instanceof boolean).assertEqual(true)
    expect(a[1]).assertEqual(true)
    expect(a[2] instanceof boolean).assertEqual(true)
    expect(a[2]).assertEqual(false)
    return true
  }
}

namespace testNS12_35 {
  function foo_35(p: Object[]): Array<Object> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<Object> = [1, 5n, "abc"]
    let b: Object[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof Object).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof Object).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS13_35 {
  function foo_35(p: (Object | undefined)[]): Array<(Object | undefined)> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<(Object | undefined)> = [undefined, 5n, "abc"]
    let b: (Object | undefined)[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object | undefined)).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object | undefined)).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object | undefined)).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object | undefined)).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object | undefined)).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object | undefined)).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS14_35 {
  function foo_35(p: (Object | undefined | null)[]): Array<(Object | undefined | null)> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<(Object | undefined | null)> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

namespace testNS15_35 {
  function foo_35(p: (undefined | bigint | null)[]): Array<undefined | bigint | null> {
    return p
  }

  export function runTest_35(): boolean {
    let a: Array<undefined | bigint | null> = [undefined, 5n, null]
    let b: (undefined | bigint | null)[] = foo_35(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (undefined | bigint | null)).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (undefined | bigint | null)).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (undefined | bigint | null)).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (undefined | bigint | null)).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (undefined | bigint | null)).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (undefined | bigint | null)).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

function foo_35(p: int[]): Array<int> {
  return p
}

namespace testNS1_36 {
  function foo_36(p: int[]): int[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<int> = [1, 3, 5]
    let b: int[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof int).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof int).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof int).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof int).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof int).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof int).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS2_36 {
  function foo_36(p: long[]): long[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<long> = [1, 3, 5]
    let b: long[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof long).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof long).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof long).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof long).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof long).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof long).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS3_36 {
  function foo_36(p: byte[]): byte[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<byte> = [1, 3, 5]
    let b: byte[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof byte).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof byte).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof byte).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof byte).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof byte).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof byte).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS4_36 {
  function foo_36(p: short[]): short[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<short> = [1, 3, 5]
    let b: short[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof short).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof short).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof short).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof short).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof short).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof short).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS5_36 {
  function foo_36(p: double[]): double[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<double> = [1.5, 3.7, 5.4]
    let b: double[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof double).assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof double).assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof double).assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof double).assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof double).assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof double).assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS6_36 {
  function foo_36(p: number[]): number[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS7_36 {
  function foo_36(p: number[]): number[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS8_36 {
  function foo_36(p: bigint[]): bigint[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<bigint> = [1n, 3n, 5n]
    let b: bigint[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof bigint).assertEqual(true)
    expect(b[0]).assertEqual(1n)
    expect(b[1] instanceof bigint).assertEqual(true)
    expect(b[1]).assertEqual(3n)
    expect(b[2] instanceof bigint).assertEqual(true)
    expect(b[2]).assertEqual(5n)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof bigint).assertEqual(true)
    expect(a[0]).assertEqual(1n)
    expect(a[1] instanceof bigint).assertEqual(true)
    expect(a[1]).assertEqual(3n)
    expect(a[2] instanceof bigint).assertEqual(true)
    expect(a[2]).assertEqual(5n)
    return true
  }
}

namespace testNS9_36 {
  function foo_36(p: string[]): string[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<string> = ["ab", "c", "def"]
    let b: string[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof string).assertEqual(true)
    expect(b[0]).assertEqual("ab")
    expect(b[1] instanceof string).assertEqual(true)
    expect(b[1]).assertEqual("c")
    expect(b[2] instanceof string).assertEqual(true)
    expect(b[2]).assertEqual("def")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof string).assertEqual(true)
    expect(a[0]).assertEqual("ab")
    expect(a[1] instanceof string).assertEqual(true)
    expect(a[1]).assertEqual("c")
    expect(a[2] instanceof string).assertEqual(true)
    expect(a[2]).assertEqual("def")
    return true
  }
}

namespace testNS10_36 {
  function foo_36(p: string[]): string[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<string> = ['a', 'b', 'c']
    let b: string[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'string').assertEqual(true)
    expect(b[0]).assertEqual('a')
    expect(typeof b[1] === 'string').assertEqual(true)
    expect(b[1]).assertEqual('b')
    expect(typeof b[2] === 'string').assertEqual(true)
    expect(b[2]).assertEqual('c')
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'string').assertEqual(true)
    expect(a[0]).assertEqual('a')
    expect(typeof a[1] === 'string').assertEqual(true)
    expect(a[1]).assertEqual('b')
    expect(typeof a[2] === 'string').assertEqual(true)
    expect(a[2]).assertEqual('c')
    return true
  }
}

namespace testNS11_36 {
  function foo_36(p: boolean[]): boolean[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<boolean> = [false, true, false]
    let b: boolean[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof boolean).assertEqual(true)
    expect(b[0]).assertEqual(false)
    expect(b[1] instanceof boolean).assertEqual(true)
    expect(b[1]).assertEqual(true)
    expect(b[2] instanceof boolean).assertEqual(true)
    expect(b[2]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof boolean).assertEqual(true)
    expect(a[0]).assertEqual(false)
    expect(a[1] instanceof boolean).assertEqual(true)
    expect(a[1]).assertEqual(true)
    expect(a[2] instanceof boolean).assertEqual(true)
    expect(a[2]).assertEqual(false)
    return true
  }
}

namespace testNS12_36 {
  function foo_36(p: Object[]): Object[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<Object> = [1, 5n, "abc"]
    let b: Object[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof Object).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof Object).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS13_36 {
  function foo_36(p: (Object | undefined)[]): (Object | undefined)[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<(Object | undefined)> = [undefined, 5n, "abc"]
    let b: (Object | undefined)[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object | undefined)).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object | undefined)).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object | undefined)).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object | undefined)).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object | undefined)).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object | undefined)).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS14_36 {
  function foo_36(p: (Object | undefined | null)[]): (Object | undefined | null)[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<(Object | undefined | null)> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

namespace testNS15_36 {
  function foo_36(p: (Object|undefined|null)[]): (Object|undefined|null)[] {
    return p
  }

  export function runTest_36(): boolean {
    let a: Array<Object|undefined|null> = [undefined, 5n, null]
    let b: (Object|undefined|null)[] = foo_36(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof (Object|undefined|null)).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof (Object|undefined|null)).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof (Object|undefined|null)).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof (Object|undefined|null)).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof (Object|undefined|null)).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof (Object|undefined|null)).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

function foo_36(p: number[]): number[] {
  return p
}

namespace testNS1_37 {
  class C_37 {data_37: int = 0}
  function foo_37(p: Array<C_37>): Array<C_37> {
    return p
  }

  export function runTest_37(): boolean {
    let a: C_37[] = [{data_37: 1}, {data_37: 3}, {data_37: 5}]
    let b: Array<C_37> = foo_37(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_37).assertEqual(true)
    expect(b[0].data_37 instanceof int).assertEqual(true)
    expect(b[0].data_37).assertEqual(1)
    expect(b[1] instanceof C_37).assertEqual(true)
    expect(b[1].data_37 instanceof int).assertEqual(true)
    expect(b[1].data_37).assertEqual(3)
    expect(b[2] instanceof C_37).assertEqual(true)
    expect(b[2].data_37 instanceof int).assertEqual(true)
    expect(b[2].data_37).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_37).assertEqual(true)
    expect(a[0].data_37 instanceof int).assertEqual(true)
    expect(a[0].data_37).assertEqual(1)
    expect(a[1] instanceof C_37).assertEqual(true)
    expect(a[1].data_37 instanceof int).assertEqual(true)
    expect(a[1].data_37).assertEqual(3)
    expect(a[2] instanceof C_37).assertEqual(true)
    expect(a[2].data_37 instanceof int).assertEqual(true)
    expect(a[2].data_37).assertEqual(5)
    return true
  }
}
class C_37 {data_37: int = 0}
function foo_37(p: Array<C_37>): Array<C_37> {
  return p
}

namespace testNS1_38 {
  class C_38 {data_38: int = 0}
  function foo_38(p: Array<C_38>): C_38[] {
    return p
  }

  export function runTest_38(): boolean {
    let a: C_38[] = [{data_38: 1}, {data_38: 3}, {data_38: 5}]
    let b: Array<C_38> = foo_38(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_38).assertEqual(true)
    expect(b[0].data_38 instanceof int).assertEqual(true)
    expect(b[0].data_38).assertEqual(1)
    expect(b[1] instanceof C_38).assertEqual(true)
    expect(b[1].data_38 instanceof int).assertEqual(true)
    expect(b[1].data_38).assertEqual(3)
    expect(b[2] instanceof C_38).assertEqual(true)
    expect(b[2].data_38 instanceof int).assertEqual(true)
    expect(b[2].data_38).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_38).assertEqual(true)
    expect(a[0].data_38 instanceof int).assertEqual(true)
    expect(a[0].data_38).assertEqual(1)
    expect(a[1] instanceof C_38).assertEqual(true)
    expect(a[1].data_38 instanceof int).assertEqual(true)
    expect(a[1].data_38).assertEqual(3)
    expect(a[2] instanceof C_38).assertEqual(true)
    expect(a[2].data_38 instanceof int).assertEqual(true)
    expect(a[2].data_38).assertEqual(5)
    return true
  }
}
class C_38 {data_38: int = 0}
function foo_38(p: Array<C_38>): C_38[] {
  return p
}

namespace testNS1_39 {
  class C_39 {data_39: int = 0}
  function foo_39(p: C_39[]): Array<C_39> {
    return p
  }

  export function runTest_39(): boolean {
    let a: C_39[] = [{data_39: 1}, {data_39: 3}, {data_39: 5}]
    let b: Array<C_39> = foo_39(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_39).assertEqual(true)
    expect(b[0].data_39 instanceof int).assertEqual(true)
    expect(b[0].data_39).assertEqual(1)
    expect(b[1] instanceof C_39).assertEqual(true)
    expect(b[1].data_39 instanceof int).assertEqual(true)
    expect(b[1].data_39).assertEqual(3)
    expect(b[2] instanceof C_39).assertEqual(true)
    expect(b[2].data_39 instanceof int).assertEqual(true)
    expect(b[2].data_39).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_39).assertEqual(true)
    expect(a[0].data_39 instanceof int).assertEqual(true)
    expect(a[0].data_39).assertEqual(1)
    expect(a[1] instanceof C_39).assertEqual(true)
    expect(a[1].data_39 instanceof int).assertEqual(true)
    expect(a[1].data_39).assertEqual(3)
    expect(a[2] instanceof C_39).assertEqual(true)
    expect(a[2].data_39 instanceof int).assertEqual(true)
    expect(a[2].data_39).assertEqual(5)
    return true
  }
}
class C_39 {data_39: int = 0}
function foo_39(p: C_39[]): Array<C_39> {
  return p
}

namespace testNS1_40 {
  class C_40 {data_40: int = 0}
  function foo_40(p: C_40[]): C_40[] {
    return p
  }

  export function runTest_40(): boolean {
    let a: C_40[] = [{data_40: 1}, {data_40: 3}, {data_40: 5}]
    let b: Array<C_40> = foo_40(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_40).assertEqual(true)
    expect(b[0].data_40 instanceof int).assertEqual(true)
    expect(b[0].data_40).assertEqual(1)
    expect(b[1] instanceof C_40).assertEqual(true)
    expect(b[1].data_40 instanceof int).assertEqual(true)
    expect(b[1].data_40).assertEqual(3)
    expect(b[2] instanceof C_40).assertEqual(true)
    expect(b[2].data_40 instanceof int).assertEqual(true)
    expect(b[2].data_40).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_40).assertEqual(true)
    expect(a[0].data_40 instanceof int).assertEqual(true)
    expect(a[0].data_40).assertEqual(1)
    expect(a[1] instanceof C_40).assertEqual(true)
    expect(a[1].data_40 instanceof int).assertEqual(true)
    expect(a[1].data_40).assertEqual(3)
    expect(a[2] instanceof C_40).assertEqual(true)
    expect(a[2].data_40 instanceof int).assertEqual(true)
    expect(a[2].data_40).assertEqual(5)
    return true
  }
}
class C_40 {data_40: int = 0}
function foo_40(p: C_40[]): C_40[] {
  return p
}

namespace testNS1_41 {
  class C_41 {data_41: int = 0}
  function foo_41(p: Array<C_41>): Array<C_41> {
    return p
  }

  export function runTest_41(): boolean {
    let a: Array<C_41> = [{data_41: 1}, {data_41: 3}, {data_41: 5}]
    let b: C_41[] = foo_41(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_41).assertEqual(true)
    expect(b[0].data_41 instanceof int).assertEqual(true)
    expect(b[0].data_41).assertEqual(1)
    expect(b[1] instanceof C_41).assertEqual(true)
    expect(b[1].data_41 instanceof int).assertEqual(true)
    expect(b[1].data_41).assertEqual(3)
    expect(b[2] instanceof C_41).assertEqual(true)
    expect(b[2].data_41 instanceof int).assertEqual(true)
    expect(b[2].data_41).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_41).assertEqual(true)
    expect(a[0].data_41 instanceof int).assertEqual(true)
    expect(a[0].data_41).assertEqual(1)
    expect(a[1] instanceof C_41).assertEqual(true)
    expect(a[1].data_41 instanceof int).assertEqual(true)
    expect(a[1].data_41).assertEqual(3)
    expect(a[2] instanceof C_41).assertEqual(true)
    expect(a[2].data_41 instanceof int).assertEqual(true)
    expect(a[2].data_41).assertEqual(5)
    return true
  }
}
class C_41 {data_41: int = 0}
function foo_41(p: Array<C_41>): Array<C_41> {
  return p
}

namespace testNS1_42 {
  class C_42 {data_42: int = 0}
  function foo_42(p: Array<C_42>): C_42[] {
    return p
  }

  export function runTest_42(): boolean {
    let a: Array<C_42> = [{data_42: 1}, {data_42: 3}, {data_42: 5}]
    let b: C_42[] = foo_42(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_42).assertEqual(true)
    expect(b[0].data_42 instanceof int).assertEqual(true)
    expect(b[0].data_42).assertEqual(1)
    expect(b[1] instanceof C_42).assertEqual(true)
    expect(b[1].data_42 instanceof int).assertEqual(true)
    expect(b[1].data_42).assertEqual(3)
    expect(b[2] instanceof C_42).assertEqual(true)
    expect(b[2].data_42 instanceof int).assertEqual(true)
    expect(b[2].data_42).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_42).assertEqual(true)
    expect(a[0].data_42 instanceof int).assertEqual(true)
    expect(a[0].data_42).assertEqual(1)
    expect(a[1] instanceof C_42).assertEqual(true)
    expect(a[1].data_42 instanceof int).assertEqual(true)
    expect(a[1].data_42).assertEqual(3)
    expect(a[2] instanceof C_42).assertEqual(true)
    expect(a[2].data_42 instanceof int).assertEqual(true)
    expect(a[2].data_42).assertEqual(5)
    return true
  }
}
class C_42 {data_42: int = 0}
function foo_42(p: Array<C_42>): C_42[] {
  return p
}

namespace testNS1_43 {
  class C_43 {data_43: int = 0}
  function foo_43(p: C_43[]): Array<C_43> {
    return p
  }

  export function runTest_43(): boolean {
    let a: Array<C_43> = [{data_43: 1}, {data_43: 3}, {data_43: 5}]
    let b: C_43[] = foo_43(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_43).assertEqual(true)
    expect(b[0].data_43 instanceof int).assertEqual(true)
    expect(b[0].data_43).assertEqual(1)
    expect(b[1] instanceof C_43).assertEqual(true)
    expect(b[1].data_43 instanceof int).assertEqual(true)
    expect(b[1].data_43).assertEqual(3)
    expect(b[2] instanceof C_43).assertEqual(true)
    expect(b[2].data_43 instanceof int).assertEqual(true)
    expect(b[2].data_43).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_43).assertEqual(true)
    expect(a[0].data_43 instanceof int).assertEqual(true)
    expect(a[0].data_43).assertEqual(1)
    expect(a[1] instanceof C_43).assertEqual(true)
    expect(a[1].data_43 instanceof int).assertEqual(true)
    expect(a[1].data_43).assertEqual(3)
    expect(a[2] instanceof C_43).assertEqual(true)
    expect(a[2].data_43 instanceof int).assertEqual(true)
    expect(a[2].data_43).assertEqual(5)
    return true
  }
}
class C_43 {data_43: int = 0}
function foo_43(p: C_43[]): Array<C_43> {
  return p
}

namespace testNS1_44 {
  class C_44 {data_44: int = 0}
  function foo_44(p: C_44[]): C_44[] {
    return p
  }

  export function runTest_44(): boolean {
    let a: Array<C_44> = [{data_44: 1}, {data_44: 3}, {data_44: 5}]
    let b: C_44[] = foo_44(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_44).assertEqual(true)
    expect(b[0].data_44 instanceof int).assertEqual(true)
    expect(b[0].data_44).assertEqual(1)
    expect(b[1] instanceof C_44).assertEqual(true)
    expect(b[1].data_44 instanceof int).assertEqual(true)
    expect(b[1].data_44).assertEqual(3)
    expect(b[2] instanceof C_44).assertEqual(true)
    expect(b[2].data_44 instanceof int).assertEqual(true)
    expect(b[2].data_44).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_44).assertEqual(true)
    expect(a[0].data_44 instanceof int).assertEqual(true)
    expect(a[0].data_44).assertEqual(1)
    expect(a[1] instanceof C_44).assertEqual(true)
    expect(a[1].data_44 instanceof int).assertEqual(true)
    expect(a[1].data_44).assertEqual(3)
    expect(a[2] instanceof C_44).assertEqual(true)
    expect(a[2].data_44 instanceof int).assertEqual(true)
    expect(a[2].data_44).assertEqual(5)
    return true
  }
}
class C_44 {data_44: int = 0}
function foo_44(p: C_44[]): C_44[] {
  return p
}

export default function ArrayTypesIdentityTest08(): void {
  describe('ArrayTypesIdentityTest08', () => {
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
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_3500
     * @tc.name      testArrayTypesIdentity0035
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0035';
      

      let a_35: Array<int> = [1, 3, 5]
      let b_35: int[] = foo_35(a_35)
      expect(a_35 instanceof Array).assertEqual(true)
      expect(b_35 instanceof Array).assertEqual(true)
      expect(b_35.length).assertEqual(3)
      expect(b_35[0] instanceof int).assertEqual(true)
      expect(b_35[0]).assertEqual(1)
      expect(b_35[1] instanceof int).assertEqual(true)
      expect(b_35[1]).assertEqual(3)
      expect(b_35[2] instanceof int).assertEqual(true)
      expect(b_35[2]).assertEqual(5)
      a_35 = b_35
      expect(a_35 instanceof Array).assertEqual(true)
      expect(a_35.length).assertEqual(3)
      expect(a_35[0] instanceof int).assertEqual(true)
      expect(a_35[0]).assertEqual(1)
      expect(a_35[1] instanceof int).assertEqual(true)
      expect(a_35[1]).assertEqual(3)
      expect(a_35[2] instanceof int).assertEqual(true)
      expect(a_35[2]).assertEqual(5)
      expect(testNS1_35.runTest_35()).assertEqual(true)
      expect(testNS2_35.runTest_35()).assertEqual(true)
      expect(testNS3_35.runTest_35()).assertEqual(true)
      expect(testNS4_35.runTest_35()).assertEqual(true)
      expect(testNS5_35.runTest_35()).assertEqual(true)
      expect(testNS6_35.runTest_35()).assertEqual(true)
      expect(testNS7_35.runTest_35()).assertEqual(true)
      expect(testNS8_35.runTest_35()).assertEqual(true)
      expect(testNS9_35.runTest_35()).assertEqual(true)
      expect(testNS10_35.runTest_35()).assertEqual(true)
      expect(testNS11_35.runTest_35()).assertEqual(true)
      expect(testNS12_35.runTest_35()).assertEqual(true)
      expect(testNS13_35.runTest_35()).assertEqual(true)
      expect(testNS14_35.runTest_35()).assertEqual(true)
      expect(testNS15_35.runTest_35()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_3600
     * @tc.name      testArrayTypesIdentity0036
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0036';

      let a_36: Array<number> = [1, 3, 5]
      let b_36: number[] = foo_36(a_36)
      expect(a_36 instanceof Array).assertEqual(true)
      expect(b_36 instanceof Array).assertEqual(true)
      expect(b_36.length).assertEqual(3)
      expect(b_36[0] instanceof number).assertEqual(true)
      expect(b_36[0]).assertEqual(1)
      expect(b_36[1] instanceof number).assertEqual(true)
      expect(b_36[1]).assertEqual(3)
      expect(b_36[2] instanceof number).assertEqual(true)
      expect(b_36[2]).assertEqual(5)
      a_36 = b_36
      expect(a_36 instanceof Array).assertEqual(true)
      expect(a_36.length).assertEqual(3)
      expect(a_36[0] instanceof number).assertEqual(true)
      expect(a_36[0]).assertEqual(1)
      expect(a_36[1] instanceof number).assertEqual(true)
      expect(a_36[1]).assertEqual(3)
      expect(a_36[2] instanceof number).assertEqual(true)
      expect(a_36[2]).assertEqual(5)
      expect(testNS1_36.runTest_36()).assertEqual(true)
      expect(testNS2_36.runTest_36()).assertEqual(true)
      expect(testNS3_36.runTest_36()).assertEqual(true)
      expect(testNS4_36.runTest_36()).assertEqual(true)
      expect(testNS5_36.runTest_36()).assertEqual(true)
      expect(testNS6_36.runTest_36()).assertEqual(true)
      expect(testNS7_36.runTest_36()).assertEqual(true)
      expect(testNS8_36.runTest_36()).assertEqual(true)
      expect(testNS9_36.runTest_36()).assertEqual(true)
      expect(testNS10_36.runTest_36()).assertEqual(true)
      expect(testNS11_36.runTest_36()).assertEqual(true)
      expect(testNS12_36.runTest_36()).assertEqual(true)
      expect(testNS13_36.runTest_36()).assertEqual(true)
      expect(testNS14_36.runTest_36()).assertEqual(true)
      expect(testNS15_36.runTest_36()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_3700
     * @tc.name      testArrayTypesIdentity0037
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0037';
      

      let a_37: C_37[] = [{data_37: 1}, {data_37: 3}, {data_37: 5}]
      let b_37: Array<C_37> = foo_37(a_37)
      expect(a_37 instanceof Array).assertEqual(true)
      expect(b_37 instanceof Array).assertEqual(true)
      expect(b_37.length).assertEqual(3)
      expect(b_37[0] instanceof C_37).assertEqual(true)
      expect(b_37[0].data_37 instanceof int).assertEqual(true)
      expect(b_37[0].data_37).assertEqual(1)
      expect(b_37[1] instanceof C_37).assertEqual(true)
      expect(b_37[1].data_37 instanceof int).assertEqual(true)
      expect(b_37[1].data_37).assertEqual(3)
      expect(b_37[2] instanceof C_37).assertEqual(true)
      expect(b_37[2].data_37 instanceof int).assertEqual(true)
      expect(b_37[2].data_37).assertEqual(5)
      a_37 = b_37
      expect(a_37 instanceof Array).assertEqual(true)
      expect(a_37.length).assertEqual(3)
      expect(a_37[0] instanceof C_37).assertEqual(true)
      expect(a_37[0].data_37 instanceof int).assertEqual(true)
      expect(a_37[0].data_37).assertEqual(1)
      expect(a_37[1] instanceof C_37).assertEqual(true)
      expect(a_37[1].data_37 instanceof int).assertEqual(true)
      expect(a_37[1].data_37).assertEqual(3)
      expect(a_37[2] instanceof C_37).assertEqual(true)
      expect(a_37[2].data_37 instanceof int).assertEqual(true)
      expect(a_37[2].data_37).assertEqual(5)
      expect(testNS1_37.runTest_37()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_3800
     * @tc.name      testArrayTypesIdentity0038
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0038';
      

      let a_38: C_38[] = [{data_38: 1}, {data_38: 3}, {data_38: 5}]
      let b_38: Array<C_38> = foo_38(a_38)
      expect(a_38 instanceof Array).assertEqual(true)
      expect(b_38 instanceof Array).assertEqual(true)
      expect(b_38.length).assertEqual(3)
      expect(b_38[0] instanceof C_38).assertEqual(true)
      expect(b_38[0].data_38 instanceof int).assertEqual(true)
      expect(b_38[0].data_38).assertEqual(1)
      expect(b_38[1] instanceof C_38).assertEqual(true)
      expect(b_38[1].data_38 instanceof int).assertEqual(true)
      expect(b_38[1].data_38).assertEqual(3)
      expect(b_38[2] instanceof C_38).assertEqual(true)
      expect(b_38[2].data_38 instanceof int).assertEqual(true)
      expect(b_38[2].data_38).assertEqual(5)
      a_38 = b_38
      expect(a_38 instanceof Array).assertEqual(true)
      expect(a_38.length).assertEqual(3)
      expect(a_38[0] instanceof C_38).assertEqual(true)
      expect(a_38[0].data_38 instanceof int).assertEqual(true)
      expect(a_38[0].data_38).assertEqual(1)
      expect(a_38[1] instanceof C_38).assertEqual(true)
      expect(a_38[1].data_38 instanceof int).assertEqual(true)
      expect(a_38[1].data_38).assertEqual(3)
      expect(a_38[2] instanceof C_38).assertEqual(true)
      expect(a_38[2].data_38 instanceof int).assertEqual(true)
      expect(a_38[2].data_38).assertEqual(5)
      expect(testNS1_38.runTest_38()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_3900
     * @tc.name      testArrayTypesIdentity0039
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0039';
      

      let a_39: C_39[] = [{data_39: 1}, {data_39: 3}, {data_39: 5}]
      let b_39: Array<C_39> = foo_39(a_39)
      expect(a_39 instanceof Array).assertEqual(true)
      expect(b_39 instanceof Array).assertEqual(true)
      expect(b_39.length).assertEqual(3)
      expect(b_39[0] instanceof C_39).assertEqual(true)
      expect(b_39[0].data_39 instanceof int).assertEqual(true)
      expect(b_39[0].data_39).assertEqual(1)
      expect(b_39[1] instanceof C_39).assertEqual(true)
      expect(b_39[1].data_39 instanceof int).assertEqual(true)
      expect(b_39[1].data_39).assertEqual(3)
      expect(b_39[2] instanceof C_39).assertEqual(true)
      expect(b_39[2].data_39 instanceof int).assertEqual(true)
      expect(b_39[2].data_39).assertEqual(5)
      a_39 = b_39
      expect(a_39 instanceof Array).assertEqual(true)
      expect(a_39.length).assertEqual(3)
      expect(a_39[0] instanceof C_39).assertEqual(true)
      expect(a_39[0].data_39 instanceof int).assertEqual(true)
      expect(a_39[0].data_39).assertEqual(1)
      expect(a_39[1] instanceof C_39).assertEqual(true)
      expect(a_39[1].data_39 instanceof int).assertEqual(true)
      expect(a_39[1].data_39).assertEqual(3)
      expect(a_39[2] instanceof C_39).assertEqual(true)
      expect(a_39[2].data_39 instanceof int).assertEqual(true)
      expect(a_39[2].data_39).assertEqual(5)
      expect(testNS1_39.runTest_39()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_4000
     * @tc.name      testArrayTypesIdentity0040
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0040';
      

      let a_40: C_40[] = [{data_40: 1}, {data_40: 3}, {data_40: 5}]
      let b_40: Array<C_40> = foo_40(a_40)
      expect(a_40 instanceof Array).assertEqual(true)
      expect(b_40 instanceof Array).assertEqual(true)
      expect(b_40.length).assertEqual(3)
      expect(b_40[0] instanceof C_40).assertEqual(true)
      expect(b_40[0].data_40 instanceof int).assertEqual(true)
      expect(b_40[0].data_40).assertEqual(1)
      expect(b_40[1] instanceof C_40).assertEqual(true)
      expect(b_40[1].data_40 instanceof int).assertEqual(true)
      expect(b_40[1].data_40).assertEqual(3)
      expect(b_40[2] instanceof C_40).assertEqual(true)
      expect(b_40[2].data_40 instanceof int).assertEqual(true)
      expect(b_40[2].data_40).assertEqual(5)
      a_40 = b_40
      expect(a_40 instanceof Array).assertEqual(true)
      expect(a_40.length).assertEqual(3)
      expect(a_40[0] instanceof C_40).assertEqual(true)
      expect(a_40[0].data_40 instanceof int).assertEqual(true)
      expect(a_40[0].data_40).assertEqual(1)
      expect(a_40[1] instanceof C_40).assertEqual(true)
      expect(a_40[1].data_40 instanceof int).assertEqual(true)
      expect(a_40[1].data_40).assertEqual(3)
      expect(a_40[2] instanceof C_40).assertEqual(true)
      expect(a_40[2].data_40 instanceof int).assertEqual(true)
      expect(a_40[2].data_40).assertEqual(5)
      expect(testNS1_40.runTest_40()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_4100
     * @tc.name      testArrayTypesIdentity0041
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0041';
      

      let a_41: Array<C_41> = [{data_41: 1}, {data_41: 3}, {data_41: 5}]
      let b_41: C_41[] = foo_41(a_41)
      expect(a_41 instanceof Array).assertEqual(true)
      expect(b_41 instanceof Array).assertEqual(true)
      expect(b_41.length).assertEqual(3)
      expect(b_41[0] instanceof C_41).assertEqual(true)
      expect(b_41[0].data_41 instanceof int).assertEqual(true)
      expect(b_41[0].data_41).assertEqual(1)
      expect(b_41[1] instanceof C_41).assertEqual(true)
      expect(b_41[1].data_41 instanceof int).assertEqual(true)
      expect(b_41[1].data_41).assertEqual(3)
      expect(b_41[2] instanceof C_41).assertEqual(true)
      expect(b_41[2].data_41 instanceof int).assertEqual(true)
      expect(b_41[2].data_41).assertEqual(5)
      a_41 = b_41
      expect(a_41 instanceof Array).assertEqual(true)
      expect(a_41.length).assertEqual(3)
      expect(a_41[0] instanceof C_41).assertEqual(true)
      expect(a_41[0].data_41 instanceof int).assertEqual(true)
      expect(a_41[0].data_41).assertEqual(1)
      expect(a_41[1] instanceof C_41).assertEqual(true)
      expect(a_41[1].data_41 instanceof int).assertEqual(true)
      expect(a_41[1].data_41).assertEqual(3)
      expect(a_41[2] instanceof C_41).assertEqual(true)
      expect(a_41[2].data_41 instanceof int).assertEqual(true)
      expect(a_41[2].data_41).assertEqual(5)
      expect(testNS1_41.runTest_41()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_4200
     * @tc.name      testArrayTypesIdentity0042
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0042';
      

      let a_42: Array<C_42> = [{data_42: 1}, {data_42: 3}, {data_42: 5}]
      let b_42: C_42[] = foo_42(a_42)
      expect(a_42 instanceof Array).assertEqual(true)
      expect(b_42 instanceof Array).assertEqual(true)
      expect(b_42.length).assertEqual(3)
      expect(b_42[0] instanceof C_42).assertEqual(true)
      expect(b_42[0].data_42 instanceof int).assertEqual(true)
      expect(b_42[0].data_42).assertEqual(1)
      expect(b_42[1] instanceof C_42).assertEqual(true)
      expect(b_42[1].data_42 instanceof int).assertEqual(true)
      expect(b_42[1].data_42).assertEqual(3)
      expect(b_42[2] instanceof C_42).assertEqual(true)
      expect(b_42[2].data_42 instanceof int).assertEqual(true)
      expect(b_42[2].data_42).assertEqual(5)
      a_42 = b_42
      expect(a_42 instanceof Array).assertEqual(true)
      expect(a_42.length).assertEqual(3)
      expect(a_42[0] instanceof C_42).assertEqual(true)
      expect(a_42[0].data_42 instanceof int).assertEqual(true)
      expect(a_42[0].data_42).assertEqual(1)
      expect(a_42[1] instanceof C_42).assertEqual(true)
      expect(a_42[1].data_42 instanceof int).assertEqual(true)
      expect(a_42[1].data_42).assertEqual(3)
      expect(a_42[2] instanceof C_42).assertEqual(true)
      expect(a_42[2].data_42 instanceof int).assertEqual(true)
      expect(a_42[2].data_42).assertEqual(5)
      expect(testNS1_42.runTest_42()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_4300
     * @tc.name      testArrayTypesIdentity0043
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0043';
      

      let a_43: Array<C_43> = [{data_43: 1}, {data_43: 3}, {data_43: 5}]
      let b_43: C_43[] = foo_43(a_43)
      expect(a_43 instanceof Array).assertEqual(true)
      expect(b_43 instanceof Array).assertEqual(true)
      expect(b_43.length).assertEqual(3)
      expect(b_43[0] instanceof C_43).assertEqual(true)
      expect(b_43[0].data_43 instanceof int).assertEqual(true)
      expect(b_43[0].data_43).assertEqual(1)
      expect(b_43[1] instanceof C_43).assertEqual(true)
      expect(b_43[1].data_43 instanceof int).assertEqual(true)
      expect(b_43[1].data_43).assertEqual(3)
      expect(b_43[2] instanceof C_43).assertEqual(true)
      expect(b_43[2].data_43 instanceof int).assertEqual(true)
      expect(b_43[2].data_43).assertEqual(5)
      a_43 = b_43
      expect(a_43 instanceof Array).assertEqual(true)
      expect(a_43.length).assertEqual(3)
      expect(a_43[0] instanceof C_43).assertEqual(true)
      expect(a_43[0].data_43 instanceof int).assertEqual(true)
      expect(a_43[0].data_43).assertEqual(1)
      expect(a_43[1] instanceof C_43).assertEqual(true)
      expect(a_43[1].data_43 instanceof int).assertEqual(true)
      expect(a_43[1].data_43).assertEqual(3)
      expect(a_43[2] instanceof C_43).assertEqual(true)
      expect(a_43[2].data_43 instanceof int).assertEqual(true)
      expect(a_43[2].data_43).assertEqual(5)
      expect(testNS1_43.runTest_43()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_4400
     * @tc.name      testArrayTypesIdentity0044
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0044';
      

      let a_44: Array<C_44> = [{data_44: 1}, {data_44: 3}, {data_44: 5}]
      let b_44: C_44[] = foo_44(a_44)
      expect(a_44 instanceof Array).assertEqual(true)
      expect(b_44 instanceof Array).assertEqual(true)
      expect(b_44.length).assertEqual(3)
      expect(b_44[0] instanceof C_44).assertEqual(true)
      expect(b_44[0].data_44 instanceof int).assertEqual(true)
      expect(b_44[0].data_44).assertEqual(1)
      expect(b_44[1] instanceof C_44).assertEqual(true)
      expect(b_44[1].data_44 instanceof int).assertEqual(true)
      expect(b_44[1].data_44).assertEqual(3)
      expect(b_44[2] instanceof C_44).assertEqual(true)
      expect(b_44[2].data_44 instanceof int).assertEqual(true)
      expect(b_44[2].data_44).assertEqual(5)
      a_44 = b_44
      expect(a_44 instanceof Array).assertEqual(true)
      expect(a_44.length).assertEqual(3)
      expect(a_44[0] instanceof C_44).assertEqual(true)
      expect(a_44[0].data_44 instanceof int).assertEqual(true)
      expect(a_44[0].data_44).assertEqual(1)
      expect(a_44[1] instanceof C_44).assertEqual(true)
      expect(a_44[1].data_44 instanceof int).assertEqual(true)
      expect(a_44[1].data_44).assertEqual(3)
      expect(a_44[2] instanceof C_44).assertEqual(true)
      expect(a_44[2].data_44 instanceof int).assertEqual(true)
      expect(a_44[2].data_44).assertEqual(5)
      expect(testNS1_44.runTest_44()).assertEqual(true)

    });
  })
}