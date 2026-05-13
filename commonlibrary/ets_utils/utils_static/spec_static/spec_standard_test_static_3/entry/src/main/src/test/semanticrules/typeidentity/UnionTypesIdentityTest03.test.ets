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

namespace testNS84 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: int = 5}
  function check_cat(a: Any) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Any) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Any) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_number(a: Any) {
    expect(a instanceof number).assertEqual(true);
    expect(a as number).assertEqual(7.8);
  }
  function cast(p: Any): number | Dog | Cat | Frog {
    return p as Cat | Dog | Frog | number
  }

  export function runTest(): boolean {
    let a: number | Dog | Cat | Frog = new Cat()
    let b: Cat | Dog | Frog | number = cast(a)
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_cat(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_cat(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_cat(a);
    a = 7.8;
    b = cast(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(a);
    a = new Dog();
    b = cast(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(a);
    a = new Frog();
    b = cast(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_frog(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_frog(a);
    return true;
  }
}

class Cat13 {v: string = "cat"}
class Dog13 {v: bigint = 123n}
class Frog13 {v: int = 5}
function check_cat13(a: Any) {
  expect(a instanceof Cat13).assertEqual(true);
  expect((a as Cat13).v).assertEqual("cat");
}
function check_dog13(a: Any) {
  expect(a instanceof Dog13).assertEqual(true);
  expect((a as Dog13).v).assertEqual(123n);
}
function check_frog13(a: Any) {
  expect(a instanceof Frog13).assertEqual(true);
  expect((a as Frog13).v).assertEqual(5);
}
function check_number13(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function cast23(p: Any): number | Dog13 | Cat13 | Frog13 {
  return p as Cat13 | Dog13 | Frog13 | number
}

namespace testNS85 {
  function foo(p: Object | undefined): Object | undefined {
    return p
  }

  export function runTest(): boolean {
    let a: Object | undefined = 5n
    let b: undefined | Object = foo(a)
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual(5n)
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    a = undefined
    b = foo(a)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual(undefined)
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(undefined)
    a = "abc"
    b = foo(a)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual("abc")
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual("abc")
    return true
  }
}

namespace testNS86 {
  function foo(p: Object | undefined | null): Object | undefined | null {
    return p
  }

  export function runTest(): boolean {
    let a: Object | undefined | null = 5n
    let b: undefined | null | Object = foo(a)
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(5n)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    a = null
    b = foo(a)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(null)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(null)
    a = undefined
    b = foo(a)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(undefined)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(undefined)
    return true
  }
}

namespace testNS87 {
  function foo(p: number | boolean): number | boolean {
    return p
  }

  export function runTest(): boolean {
    let a: number | boolean = true
    let b: boolean | number = foo(a)
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(true)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(true)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(true)
    a = 7.9
    b = foo(a)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(7.9)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(7.9)
    a = false
    b = foo(a)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(false)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(false)
    return true
  }
}

namespace testNS88 {
  function foo(p: int | string | boolean): int | string | boolean {
    return p
  }

  export function runTest(): boolean {
    let a: int | string | boolean = true
    let b: string | boolean | int = foo(a)
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(true)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual(true)
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(true)
    a = 5
    b = foo(a)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual(5)
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(5)
    a = "abc"
    b = foo(a)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual("abc")
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual("abc")
    return true
  }
}

namespace testNS89 {
  function foo(p: String): String {
    return p
  }

  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = foo(a)
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("On Review")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    a = "In Progress"
    b = foo(a)
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("In Progress")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("In Progress")
    a = "Done"
    b = foo(a)
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("Done")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("Done")
    return true
  }
}
function foo(p: Object | undefined): Object | undefined {
  return p
}

namespace testNS90 {
  function foo(p: Object | undefined): Object | undefined {
    return p
  }

  export function runTest(): boolean {
    let a: undefined | Object = 5n
    let b: Object | undefined = foo(a)
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(5n);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    a = undefined;
    b = foo(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = foo(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual("abc");
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual("abc");
    return true;
  }
}

namespace testNS91 {
  function foo(p: Object | undefined | null): Object | undefined | null {
    return p
  }

  export function runTest(): boolean {
    let a: undefined | null | Object = 5n
    let b: Object | undefined | null = foo(a)
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(5n);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    a = null;
    b = foo(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = foo(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    return true;
  }
}

namespace testNS92 {
  function foo(p: number | boolean): number | boolean {
    return p
  }

  export function runTest(): boolean {
    let a: boolean | number = true
    let b: number | boolean = foo(a)
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(true);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(true);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(true);
    a = 7.9;
    b = foo(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = foo(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(false);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(false);
    return true;
  }
}

namespace testNS93 {
  function foo(p: int | string | boolean): int | string | boolean {
    return p
  }

  export function runTest(): boolean {
    let a: string | boolean | int = true
    let b: int | string | boolean = foo(a)
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(true);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(true);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(true);
    a = 5;
    b = foo(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = foo(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual("abc");
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual("abc");
    return true;
  }
}

namespace testNS94 {
  function foo(p: String): String {
    return p
  }

  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = foo(a)
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("On Review");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    a = "In Progress";
    b = foo(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = foo(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("Done");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("Done");
    return true;
  }
}

function foo1(p: Object | undefined): Object | undefined {
  return p
}

namespace testNS95 {
  function foo(p: Object | undefined): undefined | Object {
    return p
  }

  export function runTest(): boolean {
    let a: Object | undefined = 5n
    let b: undefined | Object = foo(a)
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual(5n)
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    a = undefined
    b = foo(a)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual(undefined)
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(undefined)
    a = "abc"
    b = foo(a)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual("abc")
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual("abc")
    return true
  }
}

namespace testNS96 {
  function foo(p: Object | undefined | null): undefined | null | Object {
    return p
  }

  export function runTest(): boolean {
    let a: Object | undefined | null = 5n
    let b: undefined | null | Object = foo(a)
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(5n)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    a = null
    b = foo(a)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(null)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(null)
    a = undefined
    b = foo(a)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(undefined)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(undefined)
    return true
  }
}

namespace testNS97 {
  function foo(p: number | boolean): boolean | number {
    return p
  }

  export function runTest(): boolean {
    let a: number | boolean = true
    let b: boolean | number = foo(a)
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(true)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(true)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(true)
    a = 7.9
    b = foo(a)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(7.9)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(7.9)
    a = false
    b = foo(a)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(false)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(false)
    return true
  }
}

namespace testNS98 {
  function foo(p: int | string | boolean): string | boolean | int {
    return p
  }

  export function runTest(): boolean {
    let a: int | string | boolean = true
    let b: string | boolean | int = foo(a)
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(true)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual(true)
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(true)
    a = 5
    b = foo(a)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual(5)
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(5)
    a = "abc"
    b = foo(a)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual("abc")
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual("abc")
    return true
  }
}

namespace testNS99 {
  function foo(p: String): String {
    return p
  }

  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = foo(a)
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("On Review")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    a = "In Progress"
    b = foo(a)
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("In Progress")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("In Progress")
    a = "Done"
    b = foo(a)
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("Done")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("Done")
    return true
  }
}
function foo2(p: Object | undefined): undefined | Object {
  return p
}

namespace testNS100 {
  function foo(p: Object | undefined): undefined | Object {
    return p
  }

  export function runTest(): boolean {
    let a: undefined | Object = 5n
    let b: Object | undefined = foo(a)
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(5n);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    a = undefined;
    b = foo(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = foo(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual("abc");
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual("abc");
    return true;
  }
}

namespace testNS101 {
  function foo(p: Object | undefined | null): undefined | null | Object {
    return p
  }

  export function runTest(): boolean {
    let a: undefined | null | Object = 5n
    let b: Object | undefined | null = foo(a)
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(5n);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    a = null;
    b = foo(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = foo(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    return true;
  }
}

namespace testNS102 {
  function foo(p: number | boolean): boolean | number {
    return p
  }

  export function runTest(): boolean {
    let a: boolean | number = true
    let b: number | boolean = foo(a)
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(true);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(true);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(true);
    a = 7.9;
    b = foo(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = foo(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(false);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(false);
    return true;
  }
}

namespace testNS103 {
  function foo(p: int | string | boolean): string | boolean | int {
    return p
  }

  export function runTest(): boolean {
    let a: string | boolean | int = true
    let b: int | string | boolean = foo(a)
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(true);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(true);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(true);
    a = 5;
    b = foo(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = foo(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual("abc");
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual("abc");
    return true;
  }
}

namespace testNS104 {
  function foo(p: String): String {
    return p
  }

  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = foo(a)
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("On Review");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    a = "In Progress";
    b = foo(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = foo(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("Done");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("Done");
    return true;
  }
}

function foo3(p: Object | undefined): undefined | Object {
  return p
}

namespace testNS105 {
  function foo(p: undefined | Object): Object | undefined {
    return p
  }

  export function runTest(): boolean {
    let a: Object | undefined = 5n
    let b: undefined | Object = foo(a)
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual(5n)
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    a = undefined
    b = foo(a)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual(undefined)
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(undefined)
    a = "abc"
    b = foo(a)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual("abc")
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual("abc")
    return true
  }
}

namespace testNS106 {
  function foo(p: undefined | null | Object): Object | undefined | null {
    return p
  }

  export function runTest(): boolean {
    let a: Object | undefined | null = 5n
    let b: undefined | null | Object = foo(a)
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(5n)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(5n)
    a = null
    b = foo(a)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(null)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(null)
    a = undefined
    b = foo(a)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(undefined)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(undefined)
    return true
  }
}

namespace testNS107 {
  function foo(p: boolean | number): number | boolean {
    return p
  }

  export function runTest(): boolean {
    let a: number | boolean = true
    let b: boolean | number = foo(a)
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(true)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(true)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(true)
    a = 7.9
    b = foo(a)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(7.9)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(7.9)
    a = false
    b = foo(a)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(false)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(false)
    return true
  }
}

namespace testNS108 {
  function foo(p: string | boolean | int): int | string | boolean {
    return p
  }

  export function runTest(): boolean {
    let a: int | string | boolean = true
    let b: string | boolean | int = foo(a)
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(true)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual(true)
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(true)
    a = 5
    b = foo(a)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual(5)
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(5)
    a = "abc"
    b = foo(a)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual("abc")
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual("abc")
    return true
  }
}

namespace testNS109 {
  function foo(p: String): String {
    return p
  }

  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = foo(a)
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("On Review")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    a = "In Progress"
    b = foo(a)
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("In Progress")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("In Progress")
    a = "Done"
    b = foo(a)
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("Done")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("Done")
    return true
  }
}
function foo4(p: undefined | Object): Object | undefined {
  return p
}

namespace testNS110 {
  function foo(p: undefined | Object): Object | undefined {
    return p
  }

  export function runTest(): boolean {
    let a: undefined | Object = 5n
    let b: Object | undefined = foo(a)
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(5n);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    a = undefined;
    b = foo(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = foo(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual("abc");
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual("abc");
    return true;
  }
}

namespace testNS111 {
  function foo(p: undefined | null | Object): Object | undefined | null {
    return p
  }

  export function runTest(): boolean {
    let a: undefined | null | Object = 5n
    let b: Object | undefined | null = foo(a)
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(5n);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(5n);
    a = null;
    b = foo(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = foo(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    return true;
  }
}

namespace testNS112 {
  function foo(p: boolean | number): number | boolean {
    return p
  }

  export function runTest(): boolean {
    let a: boolean | number = true
    let b: number | boolean = foo(a)
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(true);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(true);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(true);
    a = 7.9;
    b = foo(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = foo(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(false);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(false);
    return true;
  }
}

namespace testNS113 {
  function foo(p: string | boolean | int): int | string | boolean {
    return p
  }

  export function runTest(): boolean {
    let a: string | boolean | int = true
    let b: int | string | boolean = foo(a)
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(true);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(true);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(true);
    a = 5;
    b = foo(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = foo(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual("abc");
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual("abc");
    return true;
  }
}

namespace testNS114 {
  function foo(p: String): String {
    return p
  }

  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = foo(a)
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("On Review");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    a = "In Progress";
    b = foo(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = foo(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("Done");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("Done");
    return true;
  }
}

function foo5(p: undefined | Object): Object | undefined {
  return p
}
export default function UnionTypesIdentityTest03(): void {
  describe('UnionTypesIdentityTest03', () => {
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
     * @tc.number    SUB_UNION_TYPES_IDENTITY_2800
     * @tc.name      testUnionTypesIdentity0028
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0028';

      let a: number | Dog13 | Cat13 | Frog13 = new Cat13()
      let b: Cat13 | Dog13 | Frog13 | number = cast23(a)
      expect(a instanceof Cat13 | Dog13 | Frog13 | number).assertEqual(true);
      expect(a instanceof number | Dog13 | Cat13 | Frog13).assertEqual(true);
      check_cat13(a);
      expect(b instanceof Cat13 | Dog13 | Frog13 | number).assertEqual(true);
      expect(b instanceof number | Dog13 | Cat13 | Frog13).assertEqual(true);
      check_cat13(b);
      a = b;
      expect(a instanceof Cat13 | Dog13 | Frog13 | number).assertEqual(true);
      expect(a instanceof number | Dog13 | Cat13 | Frog13).assertEqual(true);
      check_cat13(a);
      a = 7.8;
      b = cast23(a);
      expect(b instanceof Cat13 | Dog13 | Frog13 | number).assertEqual(true);
      expect(b instanceof number | Dog13 | Cat13 | Frog13).assertEqual(true);
      check_number13(b);
      a = b;
      expect(a instanceof Cat13 | Dog13 | Frog13 | number).assertEqual(true);
      expect(a instanceof number | Dog13 | Cat13 | Frog13).assertEqual(true);
      check_number13(a);
      a = new Dog13();
      b = cast23(a);
      expect(b instanceof Cat13 | Dog13 | Frog13 | number).assertEqual(true);
      expect(b instanceof number | Dog13 | Cat13 | Frog13).assertEqual(true);
      check_dog13(b);
      a = b;
      expect(a instanceof Cat13 | Dog13 | Frog13 | number).assertEqual(true);
      expect(a instanceof number | Dog13 | Cat13 | Frog13).assertEqual(true);
      check_dog13(a);
      a = new Frog13();
      b = cast23(a);
      expect(b instanceof Cat13 | Dog13 | Frog13 | number).assertEqual(true);
      expect(b instanceof number | Dog13 | Cat13 | Frog13).assertEqual(true);
      check_frog13(b);
      a = b;
      expect(a instanceof Cat13 | Dog13 | Frog13 | number).assertEqual(true);
      expect(a instanceof number | Dog13 | Cat13 | Frog13).assertEqual(true);
      check_frog13(a);

      expect(testNS84.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_2900
     * @tc.name      testUnionTypesIdentity0029
     * @tc.desc      Checking Union types A and B are identical on predefined types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0029';

      let a: Object | undefined = 5n
      let b: undefined | Object = foo(a)
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(5n)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(5n)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(5n)
      a = undefined
      b = foo(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(undefined)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(undefined)
      a = "abc"
      b = foo(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual("abc")
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual("abc")

      expect(testNS85.runTest()).assertEqual(true)
      expect(testNS86.runTest()).assertEqual(true)
      expect(testNS87.runTest()).assertEqual(true)
      expect(testNS88.runTest()).assertEqual(true)
      expect(testNS89.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_3000
     * @tc.name      testUnionTypesIdentity0030
     * @tc.desc      Checking Union types A and B are identical on predefined types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0030';

      let a: undefined | Object = 5n
      let b: Object | undefined = foo1(a)
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(5n);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(5n);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(5n);
      a = undefined;
      b = foo1(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = foo1(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");

      expect(testNS90.runTest()).assertEqual(true);
      expect(testNS91.runTest()).assertEqual(true);
      expect(testNS92.runTest()).assertEqual(true);
      expect(testNS93.runTest()).assertEqual(true);
      expect(testNS94.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_3100
     * @tc.name      testUnionTypesIdentity0031
     * @tc.desc      Checking Union types A and B are identical on predefined types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0031';

      let a: Object | undefined = 5n
      let b: undefined | Object = foo2(a)
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(5n)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(5n)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(5n)
      a = undefined
      b = foo2(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(undefined)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(undefined)
      a = "abc"
      b = foo2(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual("abc")
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual("abc")

      expect(testNS95.runTest()).assertEqual(true)
      expect(testNS96.runTest()).assertEqual(true)
      expect(testNS97.runTest()).assertEqual(true)
      expect(testNS98.runTest()).assertEqual(true)
      expect(testNS99.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_3200
     * @tc.name      testUnionTypesIdentity0032
     * @tc.desc      Checking Union types A and B are identical on predefined types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0032';

      let a: undefined | Object = 5n
      let b: Object | undefined = foo3(a)
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(5n);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(5n);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(5n);
      a = undefined;
      b = foo3(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = foo3(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");

      expect(testNS100.runTest()).assertEqual(true);
      expect(testNS101.runTest()).assertEqual(true);
      expect(testNS102.runTest()).assertEqual(true);
      expect(testNS103.runTest()).assertEqual(true);
      expect(testNS104.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_3300
     * @tc.name      testUnionTypesIdentity0033
     * @tc.desc      Checking Union types A and B are identical on predefined types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0033';

      let a: Object | undefined = 5n
      let b: undefined | Object = foo4(a)
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(5n)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(5n)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(5n)
      a = undefined
      b = foo4(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(undefined)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(undefined)
      a = "abc"
      b = foo4(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual("abc")
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual("abc")

      expect(testNS105.runTest()).assertEqual(true)
      expect(testNS106.runTest()).assertEqual(true)
      expect(testNS107.runTest()).assertEqual(true)
      expect(testNS108.runTest()).assertEqual(true)
      expect(testNS109.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_3400
     * @tc.name      testUnionTypesIdentity0034
     * @tc.desc      Checking Union types A and B are identical on predefined types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0034';

      let a: undefined | Object = 5n
      let b: Object | undefined = foo5(a)
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(5n);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(5n);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(5n);
      a = undefined;
      b = foo5(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = foo5(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");

      expect(testNS110.runTest()).assertEqual(true);
      expect(testNS111.runTest()).assertEqual(true);
      expect(testNS112.runTest()).assertEqual(true);
      expect(testNS113.runTest()).assertEqual(true);
      expect(testNS114.runTest()).assertEqual(true);

    });
  })
}