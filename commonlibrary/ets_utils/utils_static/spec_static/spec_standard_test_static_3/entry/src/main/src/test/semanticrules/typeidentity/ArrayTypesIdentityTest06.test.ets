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

namespace testNS1_29 {
  function foo_29(p: Array<number>): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(1)
    expect(b[1]).assertEqual(3)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(1)
    expect(a[1]).assertEqual(3)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS2_29 {
  function foo_29(p: Array<bigint>): Array<bigint> {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[] = [1n, 3n, 5n]
    let b: Array<bigint> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(1n)
    expect(b[1]).assertEqual(3n)
    expect(b[2]).assertEqual(5n)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(1n)
    expect(a[1]).assertEqual(3n)
    expect(a[2]).assertEqual(5n)
    return true
  }
}

namespace testNS3_29 {
  function foo_29(p: Array<number>): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(1)
    expect(b[1]).assertEqual(3)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(1)
    expect(a[1]).assertEqual(3)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS4_29 {
  function foo_29(p: Array<number>): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(1)
    expect(b[1]).assertEqual(3)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(1)
    expect(a[1]).assertEqual(3)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS5_29 {
  function foo_29(p: Array<number>): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(1.5)
    expect(b[1]).assertEqual(3.7)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(1.5)
    expect(a[1]).assertEqual(3.7)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS6_29 {
  function foo_29(p: Array<number>): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(1.5)
    expect(b[1]).assertEqual(3.7)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(1.5)
    expect(a[1]).assertEqual(3.7)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS7_29 {
  function foo_29(p: Array<number>): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(1.5)
    expect(b[1]).assertEqual(3.7)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(1.5)
    expect(a[1]).assertEqual(3.7)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS8_29 {
  function foo_29(p: Array<bigint>): Array<bigint> {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[] = [1n, 3n, 5n]
    let b: Array<bigint> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(1n)
    expect(b[1]).assertEqual(3n)
    expect(b[2]).assertEqual(5n)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(1n)
    expect(a[1]).assertEqual(3n)
    expect(a[2]).assertEqual(5n)
    return true
  }
}

namespace testNS9_29 {
  function foo_29(p: Array<string>): Array<string> {
    return p
  }

  export function runTest(): boolean {
    let a: string[] = ["ab", "c", "def"]
    let b: Array<string> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual("ab")
    expect(b[1]).assertEqual("c")
    expect(b[2]).assertEqual("def")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual("ab")
    expect(a[1]).assertEqual("c")
    expect(a[2]).assertEqual("def")
    return true
  }
}

namespace testNS10_29 {
  function foo_29(p: Array<string>): Array<string> {
    return p
  }

  export function runTest(): boolean {
    let a: string[] = ['a', 'b', 'c']
    let b: Array<string> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual('a')
    expect(b[1]).assertEqual('b')
    expect(b[2]).assertEqual('c')
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual('a')
    expect(a[1]).assertEqual('b')
    expect(a[2]).assertEqual('c')
    return true
  }
}

namespace testNS11_29 {
  function foo_29(p: Array<boolean>): Array<boolean> {
    return p
  }

  export function runTest(): boolean {
    let a: boolean[] = [false, true, false]
    let b: Array<boolean> = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(false)
    expect(b[1]).assertEqual(true)
    expect(b[2]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(false)
    expect(a[1]).assertEqual(true)
    expect(a[2]).assertEqual(false)
    return true
  }
}

namespace testNS12_29 {
  function foo_29(p: Array<number | bigint | string>): Array<number | bigint | string> {
    return p
  }

  export function runTest(): boolean {
    let a: (number | bigint | string)[] = [1, 5n, "abc"]
    let b: (number | bigint | string)[] = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(1)
    expect(b[1]).assertEqual(5n)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(1)
    expect(a[1]).assertEqual(5n)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS13_29 {
  function foo_29(p: Array<undefined | bigint | string>): Array<undefined | bigint | string> {
    return p
  }

  export function runTest(): boolean {
    let a: (undefined | bigint | string)[] = [undefined, 5n, "abc"]
    let b: (undefined | bigint | string)[] = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(undefined)
    expect(b[1]).assertEqual(5n)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(undefined)
    expect(a[1]).assertEqual(5n)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS14_29 {
  function foo_29(p: Array<undefined | null | bigint>): Array<undefined | null | bigint> {
    return p
  }

  export function runTest(): boolean {
    let a: (undefined | null | bigint)[] = [undefined, 5n, null]
    let b: (undefined | null | bigint)[] = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(undefined)
    expect(b[1]).assertEqual(5n)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(undefined)
    expect(a[1]).assertEqual(5n)
    expect(a[2]).assertEqual(null)
    return true
  }
}

namespace testNS15_29 {
  function foo_29(p: Array<undefined | null | bigint>): Array<undefined | null | bigint> {
    return p
  }

  export function runTest(): boolean {
    let a: (undefined | null | bigint)[] = [undefined, 5n, null]
    let b: (undefined | null | bigint)[] = foo_29(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0]).assertEqual(undefined)
    expect(b[1]).assertEqual(5n)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0]).assertEqual(undefined)
    expect(a[1]).assertEqual(5n)
    expect(a[2]).assertEqual(null)
    return true
  }
}

function foo_29(p: Array<number>): Array<number> {
  return p
}

namespace testNS1_30 {
  function foo_30(p: Array<number>): number[] {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = foo_30(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS2_30 {
  function foo_30(p: Array<bigint>): bigint[] {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[] = [1n, 3n, 5n]
    let b: Array<bigint> = foo_30(a)
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

namespace testNS3_30 {
  function foo_30(p: Array<number>): number[] {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = foo_30(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS4_30 {
  function foo_30(p: Array<number>): number[] {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = foo_30(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS5_30 {
  function foo_30(p: Array<number>): number[] {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = foo_30(a)
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

namespace testNS6_30 {
  function foo_30(p: Array<number>): number[] {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = foo_30(a)
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

namespace testNS7_30 {
  function foo_30(p: Array<number>): number[] {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = foo_30(a)
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

namespace testNS8_30 {
  function foo_30(p: Array<bigint>): bigint[] {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[] = [1n, 3n, 5n]
    let b: Array<bigint> = foo_30(a)
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

namespace testNS9_30 {
  function foo_30(p: Array<string>): string[] {
    return p
  }

  export function runTest(): boolean {
    let a: string[] = ["ab", "c", "def"]
    let b: Array<string> = foo_30(a)
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

namespace testNS10_30 {
  function foo_30(p: Array<string>): string[] {
    return p
  }

  export function runTest(): boolean {
    let a: string[] = ['a', 'b', 'c']
    let b: Array<string> = foo_30(a)
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

namespace testNS11_30 {
  function foo_30(p: Array<boolean>): boolean[] {
    return p
  }

  export function runTest(): boolean {
    let a: boolean[] = [false, true, false]
    let b: Array<boolean> = foo_30(a)
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

namespace testNS12_30 {
  function foo_30(p: Array<Object>): Object[] {
    return p
  }

  export function runTest(): boolean {
    let a: Object[] = [1, 5n, "abc"]
    let b: Array<Object> = foo_30(a)
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

namespace testNS13_30 {
  function foo_30(p: Array<Object|undefined>): (Object|undefined)[] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object|undefined)[] = [undefined, 5n, "abc"]
    let b: Array<Object|undefined> = foo_30(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object|undefined).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof Object|undefined).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object|undefined).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object|undefined).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof Object|undefined).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object|undefined).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS14_30 {
  function foo_30(p: Array<Object|undefined|null>): (Object|undefined|null)[] {
    return p
  }

  export function runTest(): boolean {
    let a: (Object|undefined|null)[] = [undefined, 5n, null]
    let b: Array<Object|undefined|null> = foo_30(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object|undefined|null).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof Object|undefined|null).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object|undefined|null).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object|undefined|null).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof Object|undefined|null).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object|undefined|null).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

namespace testNS15_30 {
  function foo_30(p: Array<undefined | bigint | null>): (undefined | bigint | null)[] {
    return p
  }

  export function runTest(): boolean {
    let a: (undefined | bigint | null)[] = [undefined, 5n, null]
    let b: Array<undefined | bigint | null> = foo_30(a)
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

function foo_30(p: Array<number>): number[] {
  return p
}

namespace testNS1_31 {
  function foo_31(p: number[]): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = foo_31(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS2_31 {
  function foo_31(p: bigint[]): Array<bigint> {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[] = [1n, 3n, 5n]
    let b: Array<bigint> = foo_31(a)
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

namespace testNS3_31 {
  function foo_31(p: number[]): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = foo_31(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS4_31 {
  function foo_31(p: number[]): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = foo_31(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof number).assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(b[1] instanceof number).assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(b[2] instanceof number).assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof number).assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(a[1] instanceof number).assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(a[2] instanceof number).assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS5_31 {
  function foo_31(p: number[]): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = foo_31(a)
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

namespace testNS6_31 {
  function foo_31(p: number[]): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = foo_31(a)
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

namespace testNS7_31 {
  function foo_31(p: number[]): Array<number> {
    return p
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = foo_31(a)
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

namespace testNS8_31 {
  function foo_31(p: bigint[]): Array<bigint> {
    return p
  }

  export function runTest(): boolean {
    let a: bigint[] = [1n, 3n, 5n]
    let b: Array<bigint> = foo_31(a)
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

namespace testNS9_31 {
  function foo_31(p: string[]): Array<string> {
    return p
  }

  export function runTest(): boolean {
    let a: string[] = ["ab", "c", "def"]
    let b: Array<string> = foo_31(a)
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

namespace testNS10_31 {
  function foo_31(p: string[]): Array<string> {
    return p
  }

  export function runTest(): boolean {
    let a: string[] = ['a', 'b', 'c']
    let b: Array<string> = foo_31(a)
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

namespace testNS11_31 {
  function foo_31(p: boolean[]): Array<boolean> {
    return p
  }

  export function runTest(): boolean {
    let a: boolean[] = [false, true, false]
    let b: Array<boolean> = foo_31(a)
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

namespace testNS12_31 {
  function foo_31(p: Object[]): Array<Object> {
    return p
  }

  export function runTest(): boolean {
    let a: Object[] = [1, 5n, "abc"]
    let b: Array<Object> = foo_31(a)
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

namespace testNS13_31 {
  function foo_31(p: (Object|undefined)[]): Array<Object|undefined> {
    return p
  }

  export function runTest(): boolean {
    let a: (Object|undefined)[] = [undefined, 5n, "abc"]
    let b: Array<Object|undefined> = foo_31(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object|undefined).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof Object|undefined).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object|undefined).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object|undefined).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof Object|undefined).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object|undefined).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS14_31 {
  function foo_31(p: (Object|undefined|null)[]): Array<Object|undefined|null> {
    return p
  }

  export function runTest(): boolean {
    let a: (Object|undefined|null)[] = [undefined, 5n, null]
    let b: Array<Object|undefined|null> = foo_31(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object|undefined|null).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof Object|undefined|null).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object|undefined|null).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object|undefined|null).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof Object|undefined|null).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object|undefined|null).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

namespace testNS15_31 {
  function foo_31(p: (undefined | bigint | null)[]): Array<undefined | bigint | null> {
    return p
  }

  export function runTest(): boolean {
    let a: (undefined | bigint | null)[] = [undefined, 5n, null]
    let b: Array<undefined | bigint | null> = foo_31(a)
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

function foo_31(p: number[]): Array<number> {
  return p
}

export default function ArrayTypesIdentityTest06(): void {
  describe('ArrayTypesIdentityTest06', () => {
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
     * @tc.number    SUB_ ARRAY_TYPES_IDENTITY_TEST_2900
     * @tc.name      testArrayTypesIdentity0029
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0029';

      let a: number[] = [1, 3, 5];
      let b: Array<number> = foo_29(a);
      expect(a instanceof Array).assertEqual(true);
      expect(b instanceof Array).assertEqual(true);
      expect(b.length).assertEqual(3);
      expect(b[0]).assertEqual(1);
      expect(b[1]).assertEqual(3);
      expect(b[2]).assertEqual(5);
      a = b;
      expect(a instanceof Array).assertEqual(true);
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(3);
      expect(a[2]).assertEqual(5);

      expect(testNS1_29.runTest()).assertEqual(true);
      expect(testNS2_29.runTest()).assertEqual(true);
      expect(testNS3_29.runTest()).assertEqual(true);
      expect(testNS4_29.runTest()).assertEqual(true);
      expect(testNS5_29.runTest()).assertEqual(true);
      expect(testNS6_29.runTest()).assertEqual(true);
      expect(testNS7_29.runTest()).assertEqual(true);
      expect(testNS8_29.runTest()).assertEqual(true);
      expect(testNS9_29.runTest()).assertEqual(true);
      expect(testNS10_29.runTest()).assertEqual(true);
      expect(testNS11_29.runTest()).assertEqual(true);
      expect(testNS12_29.runTest()).assertEqual(true);
      expect(testNS13_29.runTest()).assertEqual(true);
      expect(testNS14_29.runTest()).assertEqual(true);
      expect(testNS15_29.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ ARRAY_TYPES_IDENTITY_TEST_3000
     * @tc.name      testArrayTypesIdentity0030
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0030';

      let a: number[] = [1, 3, 5]
      let b: Array<number> = foo_30(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof number).assertEqual(true)
      expect(b[0]).assertEqual(1)
      expect(b[1] instanceof number).assertEqual(true)
      expect(b[1]).assertEqual(3)
      expect(b[2] instanceof number).assertEqual(true)
      expect(b[2]).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof number).assertEqual(true)
      expect(a[0]).assertEqual(1)
      expect(a[1] instanceof number).assertEqual(true)
      expect(a[1]).assertEqual(3)
      expect(a[2] instanceof number).assertEqual(true)
      expect(a[2]).assertEqual(5)

      expect(testNS1_30.runTest()).assertEqual(true)
      expect(testNS2_30.runTest()).assertEqual(true)
      expect(testNS3_30.runTest()).assertEqual(true)
      expect(testNS4_30.runTest()).assertEqual(true)
      expect(testNS5_30.runTest()).assertEqual(true)
      expect(testNS6_30.runTest()).assertEqual(true)
      expect(testNS7_30.runTest()).assertEqual(true)
      expect(testNS8_30.runTest()).assertEqual(true)
      expect(testNS9_30.runTest()).assertEqual(true)
      expect(testNS10_30.runTest()).assertEqual(true)
      expect(testNS11_30.runTest()).assertEqual(true)
      expect(testNS12_30.runTest()).assertEqual(true)
      expect(testNS13_30.runTest()).assertEqual(true)
      expect(testNS14_30.runTest()).assertEqual(true)
      expect(testNS15_30.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ ARRAY_TYPES_IDENTITY_TEST_3100
     * @tc.name      testArrayTypesIdentity0031
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0031';
      console.log(TAG + ' start');

      let a: number[] = [1, 3, 5]
      let b: Array<number> = foo_31(a)
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof number).assertEqual(true)
      expect(b[0]).assertEqual(1)
      expect(b[1] instanceof number).assertEqual(true)
      expect(b[1]).assertEqual(3)
      expect(b[2] instanceof number).assertEqual(true)
      expect(b[2]).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof number).assertEqual(true)
      expect(a[0]).assertEqual(1)
      expect(a[1] instanceof number).assertEqual(true)
      expect(a[1]).assertEqual(3)
      expect(a[2] instanceof number).assertEqual(true)
      expect(a[2]).assertEqual(5)

      expect(testNS1_31.runTest()).assertEqual(true)
      expect(testNS2_31.runTest()).assertEqual(true)
      expect(testNS3_31.runTest()).assertEqual(true)
      expect(testNS4_31.runTest()).assertEqual(true)
      expect(testNS5_31.runTest()).assertEqual(true)
      expect(testNS6_31.runTest()).assertEqual(true)
      expect(testNS7_31.runTest()).assertEqual(true)
      expect(testNS8_31.runTest()).assertEqual(true)
      expect(testNS9_31.runTest()).assertEqual(true)
      expect(testNS10_31.runTest()).assertEqual(true)
      expect(testNS11_31.runTest()).assertEqual(true)
      expect(testNS12_31.runTest()).assertEqual(true)
      expect(testNS13_31.runTest()).assertEqual(true)
      expect(testNS14_31.runTest()).assertEqual(true)
      expect(testNS15_31.runTest()).assertEqual(true)

    });
  })
}