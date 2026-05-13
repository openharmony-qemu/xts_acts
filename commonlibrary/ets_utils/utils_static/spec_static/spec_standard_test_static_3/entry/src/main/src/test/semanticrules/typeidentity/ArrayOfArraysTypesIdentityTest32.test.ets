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
  class C {data: int = 0}
  function foo(p: C[][]): Array<Array<C>> {
    return p
  }

  export function runTest(): boolean {
    let a: C[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<Array<C>> = foo(a)
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
function foo(p: C[][]): Array<Array<C>> {
  return p
}

namespace testNS2 {
  class C1 {data: int = 0}
  function foo1(p: Array<C1>[]): Array<C1[]> {
    return p
  }

  export function runTest(): boolean {
    let a: C1[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<Array<C1>> = foo1(a)
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
function foo1(p: Array<C1>[]): Array<C1[]> {
  return p
}

namespace testNS3 {
  class C2 {data: int = 0}
  function foo2(p: Array<C2[]>): Array<C2>[] {
    return p
  }

  export function runTest(): boolean {
    let a: C2[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<Array<C2>> = foo2(a)
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
function foo2(p: Array<C2[]>): Array<C2>[] {
  return p
}

namespace testNS4 {
  class C3 {data: int = 0}
  function foo3(p: Array<Array<C3>>): Array<Array<C3>> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Array<C3>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: C3[][] = foo3(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C3).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C3).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C3).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C3).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C3).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C3).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C3).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C3).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C3 {data: int = 0}
function foo3(p: Array<Array<C3>>): Array<Array<C3>> {
  return p
}

namespace testNS5 {
  class C4 {data: int = 0}
  function foo4(p: Array<Array<C4>>): C4[][] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Array<C4>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: C4[][] = foo4(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C4).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C4).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C4).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C4).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C4).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C4).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C4).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C4).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C4 {data: int = 0}
function foo4(p: Array<Array<C4>>): C4[][] {
  return p
}

namespace testNS6 {
  class C5 {data: int = 0}
  function foo5(p: C5[][]): C5[][] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Array<C5>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: C5[][] = foo5(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C5).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C5).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C5).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C5).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C5).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C5).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C5).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C5).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C5 {data: int = 0}
function foo5(p: C5[][]): C5[][] {
  return p
}

namespace testNS7 {
  class C6 {data: int = 0}
  function foo6(p: C6[][]): Array<Array<C6>> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Array<C6>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: C6[][] = foo6(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C6).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C6).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C6).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C6).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C6).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C6).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C6).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C6).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C6 {data: int = 0}
function foo6(p: C6[][]): Array<Array<C6>> {
  return p
}

namespace testNS8 {
  class C7 {data: int = 0}
  function foo7(p: Array<C7>[]): Array<C7[]> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Array<C7>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: C7[][] = foo7(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C7).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C7).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C7).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C7).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C7).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C7).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C7).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C7).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C7 {data: int = 0}
function foo7(p: Array<C7>[]): Array<C7[]> {
  return p
}

namespace testNS9 {
  class C8 {data: int = 0}
  function foo8(p: Array<C8[]>): Array<C8>[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Array<C8>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: C8[][] = foo8(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C8).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C8).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C8).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C8).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C8).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C8).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C8).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C8).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C8 {data: int = 0}
function foo8(p: Array<C8[]>): Array<C8>[] {
  return p
}

namespace testNS10 {
  class C9 {data: int = 0}
  function foo9(p: Array<Array<C9>>): Array<Array<C9>> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<C9[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C9>[] = foo9(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C9).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C9).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C9).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C9).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C9).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C9).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C9).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C9).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}
class C9 {data: int = 0}
function foo9(p: Array<Array<C9>>): Array<Array<C9>> {
  return p
}

export default function ArrayOfArraysTypesIdentityTest02():void {
  describe('ArrayOfArraysTypesIdentityTest02', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_8400
     * @tc.name      testArrayOfArraysTypesIdentity0084
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0084';

      let a: C[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<Array<C>> = foo(a)
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

      expect(testNS1.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_8500
     * @tc.name      testArrayOfArraysTypesIdentity0085
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0085';

      let a: C1[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<Array<C1>> = foo1(a)
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

      expect(testNS2.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_8600
     * @tc.name      testArrayOfArraysTypesIdentity0086
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0086';

      let a: C2[][] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<Array<C2>> = foo2(a)
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

      expect(testNS3.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_8700
     * @tc.name      testArrayOfArraysTypesIdentity0087
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0087';

      let a: Array<Array<C3>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: C3[][] = foo3(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C3).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C3).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C3).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C3).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C3).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C3).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C3).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C3).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS4.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_8800
     * @tc.name      testArrayOfArraysTypesIdentity0088
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0088';

      let a: Array<Array<C4>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: C4[][] = foo4(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C4).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C4).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C4).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C4).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C4).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C4).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C4).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C4).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS5.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_8900
     * @tc.name      testArrayOfArraysTypesIdentity0089
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0089';

      let a: Array<Array<C5>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: C5[][] = foo5(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C5).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C5).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C5).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C5).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C5).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C5).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C5).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C5).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS6.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_9000
     * @tc.name      testArrayOfArraysTypesIdentity0090
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0090';

      let a: Array<Array<C6>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: C6[][] = foo6(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C6).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C6).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C6).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C6).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C6).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C6).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C6).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C6).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS7.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_9100
     * @tc.name      testArrayOfArraysTypesIdentity0091
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0091';

      let a: Array<Array<C7>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: C7[][] = foo7(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C7).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C7).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C7).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C7).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C7).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C7).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C7).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C7).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS8.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_9200
     * @tc.name      testArrayOfArraysTypesIdentity0092
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0092';

      let a: Array<Array<C8>> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: C8[][] = foo8(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C8).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C8).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C8).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C8).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C8).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C8).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C8).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C8).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS9.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_9300
     * @tc.name      testArrayOfArraysTypesIdentity0093
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0093';

      let a: Array<C9[]> = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C9>[] = foo9(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C9).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C9).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C9).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C9).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C9).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C9).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C9).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C9).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS10.runTest()).assertEqual(true)

    });
  })
}