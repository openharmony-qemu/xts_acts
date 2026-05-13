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

namespace testNS1_10 {
  function cast_10(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast_10(a)
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

namespace testNS2_10 {
  function cast_10(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast_10(a)
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

namespace testNS3_10 {
  function cast_10(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast_10(a)
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

namespace testNS4_10 {
  function cast_10(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast_10(a)
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

namespace testNS5_10 {
  function cast_10(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = cast_10(a)
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

namespace testNS6_10 {
  function cast_10(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = cast_10(a)
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

namespace testNS7_10 {
  function cast_10(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = cast_10(a)
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

namespace testNS8_10 {
  function cast_10(p: Object): Array<bigint> {
    return p as bigint[]
  }

  export function runTest(): boolean {
    let a: bigint[] = [1n, 3n, 5n]
    let b: Array<bigint> = cast_10(a)
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

namespace testNS9_10 {
  function cast_10(p: Object): Array<string> {
    return p as string[]
  }

  export function runTest(): boolean {
    let a: string[] = ["ab", "c", "def"]
    let b: Array<string> = cast_10(a)
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

namespace testNS10_10 {
  function cast_10(p: Object): Array<string> {
    return p as string[]
  }

  export function runTest(): boolean {
    let a: string[] = ['a', 'b', 'c']
    let b: Array<string> = cast_10(a)
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

namespace testNS11_10 {
  function cast_10(p: Object): Array<boolean> {
    return p as boolean[]
  }

  export function runTest(): boolean {
    let a: boolean[] = [false, true, false]
    let b: Array<boolean> = cast_10(a)
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

namespace testNS12_10 {
  function cast_10(p: Object): Array<Object> {
    return p as Object[]
  }

  export function runTest(): boolean {
    let a: Object[] = [1, 5n, "abc"]
    let b: Array<Object> = cast_10(a)
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

namespace testNS13_10 {
  function cast_10(p: Object): Array<(Object | undefined)> {
    return p as (Object | undefined)[]
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[] = [undefined, 5n, "abc"]
    let b: Array<(Object | undefined)> = cast_10(a)
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

namespace testNS14_10 {
  function cast_10(p: Object): Array<(Object | undefined | null)> {
    return p as (Object | undefined | null)[]
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [undefined, 5n, null]
    let b: Array<(Object | undefined | null)> = cast_10(a)
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

namespace testNS15_10 {
  function cast_10(p: Object): Array<number> {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: (bigint | undefined | null)[] = [undefined, 5n, null];
    let b: (bigint | undefined | null)[] = a;

    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] === undefined).assertEqual(true);
    expect(b[0]).assertEqual(undefined);

    expect(typeof b[1] === 'bigint').assertEqual(true);
    expect(b[1]).assertEqual(5n);

    expect(b[2] === null).assertEqual(true);
    expect(b[2]).assertEqual(null);

    a = b;

    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);

    expect(a[0] === undefined).assertEqual(true);
    expect(a[0]).assertEqual(undefined);

    expect(typeof a[1] === 'bigint').assertEqual(true);
    expect(a[1]).assertEqual(5n);

    expect(a[2] === null).assertEqual(true);
    expect(a[2]).assertEqual(null);

    return true;
  }
}

function cast_10(p: Object): Array<number> {
  return p as number[]
}

namespace testNS1_11 {
  function cast_11(p: Object) {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_11(a)
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

namespace testNS2_11 {
  function cast_11(p: Object) {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_11(a)
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

namespace testNS3_11 {
  function cast_11(p: Object) {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_11(a)
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

namespace testNS4_11 {
  function cast_11(p: Object) {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_11(a)
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

namespace testNS5_11 {
  function cast_11(p: Object) {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_11(a)
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

namespace testNS6_11 {
  function cast_11(p: Object) {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_11(a)
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

namespace testNS7_11 {
  function cast_11(p: Object) {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_11(a)
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

namespace testNS8_11 {
  function cast_11(p: Object) {
    return p as Array<bigint>
  }

  export function runTest(): boolean {
    let a: Array<bigint> = [1n, 3n, 5n]
    let b: bigint[] = cast_11(a)
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

namespace testNS9_11 {
  function cast_11(p: Object) {
    return p as Array<string>
  }

  export function runTest(): boolean {
    let a: Array<string> = ["ab", "c", "def"]
    let b: string[] = cast_11(a)
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

namespace testNS10_11 {
  function cast_11(p: Object) {
    return p as Array<string>
  }

  export function runTest(): boolean {
    let a: Array<string> = ['a', 'b', 'c']
    let b: string[] = cast_11(a)
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

namespace testNS11_11 {
  function cast_11(p: Object) {
    return p as Array<boolean>
  }

  export function runTest(): boolean {
    let a: Array<boolean> = [false, true, false]
    let b: boolean[] = cast_11(a)
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

namespace testNS12_11 {
  function cast_11(p: Object) {
    return p as Array<Object>
  }

  export function runTest(): boolean {
    let a: Array<Object> = [1, 5n, "abc"]
    let b: Object[] = cast_11(a)
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

namespace testNS13_11 {
  function cast_11(p: Object) {
    return p as Array<(Object | undefined)>
  }

  export function runTest(): boolean {
    let a: Array<(Object | undefined)> = [undefined, 5n, "abc"]
    let b: (Object | undefined)[] = cast_11(a)
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

namespace testNS14_11 {
  function cast_11(p: Object) {
    return p as Array<(Object | undefined | null)>
  }

  export function runTest(): boolean {
    let a: Array<(Object | undefined | null)> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_11(a)
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

namespace testNS15_11 {
  function cast_11(p: Object) {
    return p as Array<Object | undefined | null>
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_11(a)
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

function cast_11(p: Object) {
  return p as Array<number>
}

namespace testNS1_12 {
  function cast_12(p: Object) {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_12(a)
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

namespace testNS2_12 {
  function cast_12(p: Object) {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_12(a)
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

namespace testNS3_12 {
  function cast_12(p: Object) {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_12(a)
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

namespace testNS4_12 {
  function cast_12(p: Object) {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1, 3, 5]
    let b: number[] = cast_12(a)
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

namespace testNS5_12 {
  function cast_12(p: Object) {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_12(a)
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

namespace testNS6_12 {
  function cast_12(p: Object) {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_12(a)
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

namespace testNS7_12 {
  function cast_12(p: Object) {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = cast_12(a)
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

namespace testNS8_12 {
  function cast_12(p: Object) {
    return p as bigint[]
  }

  export function runTest(): boolean {
    let a: Array<bigint> = [1n, 3n, 5n]
    let b: bigint[] = cast_12(a)
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

namespace testNS9_12 {
  function cast_12(p: Object) {
    return p as string[]
  }

  export function runTest(): boolean {
    let a: Array<string> = ["ab", "c", "def"]
    let b: string[] = cast_12(a)
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

namespace testNS10_12 {
  function cast_12(p: Object) {
    return p as string[]
  }

  export function runTest(): boolean {
    let a: Array<string> = ['a', 'b', 'c']
    let b: string[] = cast_12(a)
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

namespace testNS11_12 {
  function cast_12(p: Object) {
    return p as boolean[]
  }

  export function runTest(): boolean {
    let a: Array<boolean> = [false, true, false]
    let b: boolean[] = cast_12(a)
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

namespace testNS12_12 {
  function cast_12(p: Object) {
    return p as Object[]
  }

  export function runTest(): boolean {
    let a: Array<Object> = [1, 5n, "abc"]
    let b: Object[] = cast_12(a)
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

namespace testNS13_12 {
  function cast_12(p: Object) {
    return p as (Object | undefined)[]
  }

  export function runTest(): boolean {
    let a: Array<(Object | undefined)> = [undefined, 5n, "abc"]
    let b: (Object | undefined)[] = cast_12(a)
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

namespace testNS14_12 {
  function cast_12(p: Object) {
    return p as (Object | undefined | null)[]
  }

  export function runTest(): boolean {
    let a: Array<(Object | undefined | null)> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_12(a)
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

namespace testNS15_12 {
  function cast_12(p: Object):(Object | undefined | null)[] {
    return p as (Object | undefined | null)[]
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = cast_12(a)
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

function cast_12(p: Object) {
  return p as number[]
}

export default function ArrayTypesIdentityTest03(): void {
  describe('ArrayTypesIdentityTest03', () => {
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
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_1000
     * @tc.name      testArrayTypesIdentity0010
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0010';

      let a: number[] = [1, 3, 5]
      let b: Array<number> = cast_10(a)
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

      expect(testNS1_10.runTest()).assertEqual(true)
      expect(testNS2_10.runTest()).assertEqual(true)
      expect(testNS3_10.runTest()).assertEqual(true)
      expect(testNS4_10.runTest()).assertEqual(true)
      expect(testNS5_10.runTest()).assertEqual(true)
      expect(testNS6_10.runTest()).assertEqual(true)
      expect(testNS7_10.runTest()).assertEqual(true)
      expect(testNS8_10.runTest()).assertEqual(true)
      expect(testNS9_10.runTest()).assertEqual(true)
      expect(testNS10_10.runTest()).assertEqual(true)
      expect(testNS11_10.runTest()).assertEqual(true)
      expect(testNS12_10.runTest()).assertEqual(true)
      expect(testNS13_10.runTest()).assertEqual(true)
      expect(testNS14_10.runTest()).assertEqual(true)
      expect(testNS15_10.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_1100
     * @tc.name      testArrayTypesIdentity0011
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0011';

      let a: Array<number> = [1, 3, 5]
      let b: number[] = cast_11(a)
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

      expect(testNS1_11.runTest()).assertEqual(true)
      expect(testNS2_11.runTest()).assertEqual(true)
      expect(testNS3_11.runTest()).assertEqual(true)
      expect(testNS4_11.runTest()).assertEqual(true)
      expect(testNS5_11.runTest()).assertEqual(true)
      expect(testNS6_11.runTest()).assertEqual(true)
      expect(testNS7_11.runTest()).assertEqual(true)
      expect(testNS8_11.runTest()).assertEqual(true)
      expect(testNS9_11.runTest()).assertEqual(true)
      expect(testNS10_11.runTest()).assertEqual(true)
      expect(testNS11_11.runTest()).assertEqual(true)
      expect(testNS12_11.runTest()).assertEqual(true)
      expect(testNS13_11.runTest()).assertEqual(true)
      expect(testNS14_11.runTest()).assertEqual(true)
      expect(testNS15_11.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_1200
     * @tc.name      testArrayTypesIdentity0012
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0012';

      let a: Array<number> = [1, 3, 5]
      let b: number[] = cast_12(a)
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

      expect(testNS1_12.runTest()).assertEqual(true)
      expect(testNS2_12.runTest()).assertEqual(true)
      expect(testNS3_12.runTest()).assertEqual(true)
      expect(testNS4_12.runTest()).assertEqual(true)
      expect(testNS5_12.runTest()).assertEqual(true)
      expect(testNS6_12.runTest()).assertEqual(true)
      expect(testNS7_12.runTest()).assertEqual(true)
      expect(testNS8_12.runTest()).assertEqual(true)
      expect(testNS9_12.runTest()).assertEqual(true)
      expect(testNS10_12.runTest()).assertEqual(true)
      expect(testNS11_12.runTest()).assertEqual(true)
      expect(testNS12_12.runTest()).assertEqual(true)
      expect(testNS13_12.runTest()).assertEqual(true)
      expect(testNS14_12.runTest()).assertEqual(true)
      expect(testNS15_12.runTest()).assertEqual(true)

    });
  })
}