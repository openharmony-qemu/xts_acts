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


namespace testNS1_1 {

  export function runTest_1(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = a
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

namespace testNS2_1 {

  export function runTest_1(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = a
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

namespace testNS3_1 {

  export function runTest_1(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = a
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

namespace testNS4_1 {

  export function runTest_1(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = a
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

namespace testNS5_1 {

  export function runTest_1(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = a
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

namespace testNS6_1 {

  export function runTest_1(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = a
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

namespace testNS7_1 {

  export function runTest_1(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = a
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

namespace testNS8_1 {

  export function runTest_1(): boolean {
    let a: bigint[] = [1n, 3n, 5n]
    let b: Array<bigint> = a
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

namespace testNS9_1 {

  export function runTest_1(): boolean {
    let a: string[] = ["ab", "c", "def"]
    let b: Array<string> = a
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

namespace testNS10_1 {

  export function runTest_1(): boolean {
    let a: string[] = ['a', 'b', 'c']
    let b: Array<string> = a
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

namespace testNS11_1 {

  export function runTest_1(): boolean {
    let a: boolean[] = [false, true, false]
    let b: Array<boolean> = a
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

namespace testNS12_1 {

  export function runTest_1(): boolean {
    let a: Object[] = [1, 5n, "abc"]
    let b: Array<Object> = a
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

namespace testNS13_1 {

  export function runTest_1(): boolean {
    let a: (Object | undefined)[] = [undefined, 5n, "abc"]
    let b: Array<(Object | undefined)> = a
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

namespace testNS14_1 {

  export function runTest_1(): boolean {
    let a: (Object | undefined | null)[] = [undefined, 5n, null]
    let b: Array<(Object | undefined | null)> = a
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

namespace testNS15_1 {

  export function runTest_1(): boolean {
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

namespace testNS1_2 {

  export function runTest_2(): boolean {
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

namespace testNS2_2 {

  export function runTest_2(): boolean {
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

namespace testNS3_2 {

  export function runTest_2(): boolean {
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

namespace testNS4_2 {

  export function runTest_2(): boolean {
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

namespace testNS5_2 {

  export function runTest_2(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = a
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

namespace testNS6_2 {

  export function runTest_2(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = a
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

namespace testNS7_2 {

  export function runTest_2(): boolean {
    let a: Array<number> = [1.5, 3.7, 5.4]
    let b: number[] = a
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

namespace testNS8_2 {

  export function runTest_2(): boolean {
    let a: Array<bigint> = [1n, 3n, 5n]
    let b: bigint[] = a
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

namespace testNS9_2 {

  export function runTest_2(): boolean {
    let a: Array<string> = ["ab", "c", "def"]
    let b: string[] = a
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

namespace testNS10_2 {

  export function runTest_2(): boolean {
    let a: Array<string> = ['a', 'b', 'c']
    let b: string[] = a
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

namespace testNS11_2 {

  export function runTest_2(): boolean {
    let a: Array<boolean> = [false, true, false]
    let b: boolean[] = a
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

namespace testNS12_2 {

  export function runTest_2(): boolean {
    let a: Array<Object> = [1, 5n, "abc"]
    let b: Object[] = a
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

namespace testNS13_2 {

  export function runTest_2(): boolean {
    let a: Array<(Object | undefined)> = [undefined, 5n, "abc"]
    let b: (Object | undefined)[] = a
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

namespace testNS14_2 {

  export function runTest_2(): boolean {
    let a: Array<(Object | undefined | null)> = [undefined, 5n, null]
    let b: (Object | undefined | null)[] = a
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

namespace testNS15_2 {

  export function runTest_2(): boolean {
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

namespace testNS1_3 {
  class C {data: number = 0}

  export function runTest_3(): boolean {
    let a: C_3[] = [{data: 1}, {data: 3}, {data: 5}]
    let b: Array<C_3> = a
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_3).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_3).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_3).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_3).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_3).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_3).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}

class C_3 {data: number = 0}

namespace testNS1_4 {
  class C {data: number = 0}

  export function runTest_4(): boolean {
    let a: Array<C_4> = [{data: 1}, {data: 3}, {data: 5}]
    let b: C_4[] = a
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof C_4).assertEqual(true)
    expect(b[0].data).assertEqual(1)
    expect(b[1] instanceof C_4).assertEqual(true)
    expect(b[1].data).assertEqual(3)
    expect(b[2] instanceof C_4).assertEqual(true)
    expect(b[2].data).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof C_4).assertEqual(true)
    expect(a[0].data).assertEqual(1)
    expect(a[1] instanceof C_4).assertEqual(true)
    expect(a[1].data).assertEqual(3)
    expect(a[2] instanceof C_4).assertEqual(true)
    expect(a[2].data).assertEqual(5)
    return true
  }
}

class C_4 {data: number = 0}

namespace testNS1_5 {
  function cast(p: Object) {
    return p as Array<number>
  }

  export function runTest_5(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast(a)
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

namespace testNS2_5 {
  function cast(p: Object) {
    return p as Array<number>
  }

  export function runTest_5(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast(a)
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

namespace testNS3_5 {
  function cast(p: Object) {
    return p as Array<number>
  }

  export function runTest_5(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast(a)
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

namespace testNS4_5 {
  function cast(p: Object) {
    return p as Array<number>
  }

  export function runTest_5(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast(a)
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

namespace testNS5_5 {
  function cast(p: Object) {
    return p as Array<number>
  }

  export function runTest_5(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = cast(a)
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

namespace testNS6_5 {
  function cast(p: Object) {
    return p as Array<number>
  }

  export function runTest_5(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = cast(a)
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

namespace testNS7_5 {
  function cast(p: Object) {
    return p as Array<number>
  }

  export function runTest_5(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = cast(a)
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

namespace testNS8_5 {
  function cast(p: Object) {
    return p as Array<bigint>
  }

  export function runTest_5(): boolean {
    let a: bigint[] = [1n, 3n, 5n]
    let b: Array<bigint> = cast(a)
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

namespace testNS9_5 {
  function cast(p: Object) {
    return p as Array<string>
  }

  export function runTest_5(): boolean {
    let a: string[] = ["ab", "c", "def"]
    let b: Array<string> = cast(a)
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

namespace testNS10_5 {
  function cast(p: Object) {
    return p as Array<string>
  }

  export function runTest_5(): boolean {
    let a: string[] = ['a', 'b', 'c']
    let b: Array<string> = cast(a)
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

namespace testNS11_5 {
  function cast(p: Object) {
    return p as Array<boolean>
  }

  export function runTest_5(): boolean {
    let a: boolean[] = [false, true, false]
    let b: Array<boolean> = cast(a)
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

namespace testNS12_5 {
  function cast(p: Object) {
    return p as Array<Object>
  }

  export function runTest_5(): boolean {
    let a: Object[] = [1, 5n, "abc"]
    let b: Array<Object> = cast(a)
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

namespace testNS13_5 {
  function cast(p: Object) {
    return p as Array<(Object | undefined)>
  }

  export function runTest_5(): boolean {
    let a: (Object | undefined)[] = [undefined, 5n, "abc"]
    let b: Array<(Object | undefined)> = cast(a)
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

namespace testNS14_5 {
  function cast(p: Object) {
    return p as Array<(Object | undefined | null)>
  }

  export function runTest_5(): boolean {
    let a: (Object | undefined | null)[] = [undefined, 5n, null]
    let b: Array<(Object | undefined | null)> = cast(a)
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

namespace testNS15_5 {
  function cast(p: Object): (undefined | bigint | null)[] {
    return p as (undefined | bigint | null)[]
  }

  export function runTest_5(): boolean {
    let a: (undefined | bigint | null)[] = [undefined, 5n, null];
    let b: (undefined | bigint | null)[] = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(undefined);
    expect(b[1]).assertEqual(5n);
    expect(b[2]).assertEqual(null);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(undefined);
    expect(a[1]).assertEqual(5n);
    expect(a[2]).assertEqual(null);
    return true;
  }
}
function cast(p: Object) {
  return p as Array<number>
}

export default function ArrayTypesIdentityTest(): void {
  describe('ArrayTypesIdentityTest', () => {
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
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_0100
     * @tc.name      testArrayTypesIdentity0001
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0001';

      let a: number[] = [1, 3, 5]
      let b: Array<number> = a
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

      expect(testNS1_1.runTest_1()).assertEqual(true)
      expect(testNS2_1.runTest_1()).assertEqual(true)
      expect(testNS3_1.runTest_1()).assertEqual(true)
      expect(testNS4_1.runTest_1()).assertEqual(true)
      expect(testNS5_1.runTest_1()).assertEqual(true)
      expect(testNS6_1.runTest_1()).assertEqual(true)
      expect(testNS7_1.runTest_1()).assertEqual(true)
      expect(testNS8_1.runTest_1()).assertEqual(true)
      expect(testNS9_1.runTest_1()).assertEqual(true)
      expect(testNS10_1.runTest_1()).assertEqual(true)
      expect(testNS11_1.runTest_1()).assertEqual(true)
      expect(testNS12_1.runTest_1()).assertEqual(true)
      expect(testNS13_1.runTest_1()).assertEqual(true)
      expect(testNS14_1.runTest_1()).assertEqual(true)
      expect(testNS15_1.runTest_1()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_0200
     * @tc.name      testArrayTypesIdentity0002
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0002';

      let a: Array<number> = [1, 3, 5]
      let b: number[] = a
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

      expect(testNS1_2.runTest_2()).assertEqual(true)
      expect(testNS2_2.runTest_2()).assertEqual(true)
      expect(testNS3_2.runTest_2()).assertEqual(true)
      expect(testNS4_2.runTest_2()).assertEqual(true)
      expect(testNS5_2.runTest_2()).assertEqual(true)
      expect(testNS6_2.runTest_2()).assertEqual(true)
      expect(testNS7_2.runTest_2()).assertEqual(true)
      expect(testNS8_2.runTest_2()).assertEqual(true)
      expect(testNS9_2.runTest_2()).assertEqual(true)
      expect(testNS10_2.runTest_2()).assertEqual(true)
      expect(testNS11_2.runTest_2()).assertEqual(true)
      expect(testNS12_2.runTest_2()).assertEqual(true)
      expect(testNS13_2.runTest_2()).assertEqual(true)
      expect(testNS14_2.runTest_2()).assertEqual(true)
      expect(testNS15_2.runTest_2()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_0300
     * @tc.name      testArrayTypesIdentity0003
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0003';

      let a: C_3[] = [{data: 1}, {data: 3}, {data: 5}]
      let b: Array<C_3> = a
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_3).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_3).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_3).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_3).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_3).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_3).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_3.runTest_3()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_0400
     * @tc.name      testArrayTypesIdentity0004
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0004';

      let a: Array<C_4> = [{data: 1}, {data: 3}, {data: 5}]
      let b: C_4[] = a
      expect(a instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof C_4).assertEqual(true)
      expect(b[0].data).assertEqual(1)
      expect(b[1] instanceof C_4).assertEqual(true)
      expect(b[1].data).assertEqual(3)
      expect(b[2] instanceof C_4).assertEqual(true)
      expect(b[2].data).assertEqual(5)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(3)
      expect(a[0] instanceof C_4).assertEqual(true)
      expect(a[0].data).assertEqual(1)
      expect(a[1] instanceof C_4).assertEqual(true)
      expect(a[1].data).assertEqual(3)
      expect(a[2] instanceof C_4).assertEqual(true)
      expect(a[2].data).assertEqual(5)

      expect(testNS1_4.runTest_4()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_0500
     * @tc.name      testArrayTypesIdentity0005
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0005';

      let a: number[] = [1, 3, 5]
      let b: Array<number> = cast(a)
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

      expect(testNS1_5.runTest_5()).assertEqual(true)
      expect(testNS2_5.runTest_5()).assertEqual(true)
      expect(testNS3_5.runTest_5()).assertEqual(true)
      expect(testNS4_5.runTest_5()).assertEqual(true)
      expect(testNS5_5.runTest_5()).assertEqual(true)
      expect(testNS6_5.runTest_5()).assertEqual(true)
      expect(testNS7_5.runTest_5()).assertEqual(true)
      expect(testNS8_5.runTest_5()).assertEqual(true)
      expect(testNS9_5.runTest_5()).assertEqual(true)
      expect(testNS10_5.runTest_5()).assertEqual(true)
      expect(testNS11_5.runTest_5()).assertEqual(true)
      expect(testNS12_5.runTest_5()).assertEqual(true)
      expect(testNS13_5.runTest_5()).assertEqual(true)
      expect(testNS14_5.runTest_5()).assertEqual(true)
      expect(testNS15_5.runTest_5()).assertEqual(true)
    });
  })
}