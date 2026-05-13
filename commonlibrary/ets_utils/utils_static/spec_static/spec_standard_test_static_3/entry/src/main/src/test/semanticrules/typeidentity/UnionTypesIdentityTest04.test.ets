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

namespace testNS115 {
  function foo(p: undefined | Object): undefined | Object {
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

namespace testNS116 {
  function foo(p: undefined | null | Object): undefined | null | Object {
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

namespace testNS117 {
  function foo(p: boolean | number): boolean | number {
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

namespace testNS118 {
  function foo(p: string | boolean | int): string | boolean | int {
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

namespace testNS119 {
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
function foo6(p: undefined | Object): undefined | Object {
  return p
}

namespace testNS120 {
  function foo(p: undefined | Object): undefined | Object {
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

namespace testNS121 {
  function foo(p: undefined | null | Object): undefined | null | Object {
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

namespace testNS122 {
  function foo(p: boolean | number): boolean | number {
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

namespace testNS123 {
  function foo(p: string | boolean | int): string | boolean | int {
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

namespace testNS124 {
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

function foo7(p: undefined | Object): undefined | Object {
  return p
}

namespace testNS125 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: int = 5}
  function check_cat(a: Any) {
    expect(a instanceof Cat).assertEqual(true)
    expect((a as Cat).v).assertEqual("cat")
  }
  function check_dog(a: Any) {
    expect(a instanceof Dog).assertEqual(true)
    expect((a as Dog).v).assertEqual(123n)
  }
  function check_frog(a: Any) {
    expect(a instanceof Frog).assertEqual(true)
    expect((a as Frog).v).assertEqual(5)
  }
  function check_number(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function foo(p: Cat | Dog | Frog | number): Cat | Dog | Frog | number {
    return p
  }

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = foo(a)
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(a)
    a = 7.8
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(a)
    a = new Dog()
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(a)
    a = new Frog()
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_frog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_frog(a)
    return true
  }
}
class Cat14 {v: string = "cat"}
class Dog14 {v: bigint = 123n}
class Frog14 {v: int = 5}
function check_cat14(a: Any) {
  expect(a instanceof Cat14).assertEqual(true)
  expect((a as Cat14).v).assertEqual("cat")
}
function check_dog14(a: Any) {
  expect(a instanceof Dog14).assertEqual(true)
  expect((a as Dog14).v).assertEqual(123n)
}
function check_frog14(a: Any) {
  expect(a instanceof Frog14).assertEqual(true)
  expect((a as Frog14).v).assertEqual(5)
}
function check_number14(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function foo8(p: Cat14 | Dog14 | Frog14 | number): Cat14 | Dog14 | Frog14 | number {
  return p
}

namespace testNS126 {
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
  function foo(p: Cat | Dog | Frog | number): Cat | Dog | Frog | number {
    return p
  }

  export function runTest(): boolean {
    let a: number | Dog | Cat | Frog = new Cat()
    let b: Cat | Dog | Frog | number = foo(a)
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
    b = foo(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(a);
    a = new Dog();
    b = foo(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(a);
    a = new Frog();
    b = foo(a);
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

class Cat15 {v: string = "cat"}
class Dog15 {v: bigint = 123n}
class Frog15 {v: int = 5}
function check_cat15(a: Any) {
  expect(a instanceof Cat15).assertEqual(true);
  expect((a as Cat15).v).assertEqual("cat");
}
function check_dog15(a: Any) {
  expect(a instanceof Dog15).assertEqual(true);
  expect((a as Dog15).v).assertEqual(123n);
}
function check_frog15(a: Any) {
  expect(a instanceof Frog15).assertEqual(true);
  expect((a as Frog15).v).assertEqual(5);
}
function check_number15(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function foo9(p: Cat15 | Dog15 | Frog15 | number): Cat15 | Dog15 | Frog15 | number {
  return p
}

namespace testNS127 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: int = 5}
  function check_cat(a: Any) {
    expect(a instanceof Cat).assertEqual(true)
    expect((a as Cat).v).assertEqual("cat")
  }
  function check_dog(a: Any) {
    expect(a instanceof Dog).assertEqual(true)
    expect((a as Dog).v).assertEqual(123n)
  }
  function check_frog(a: Any) {
    expect(a instanceof Frog).assertEqual(true)
    expect((a as Frog).v).assertEqual(5)
  }
  function check_number(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function foo(p: Cat | Dog | Frog | number): number | Dog | Cat | Frog {
    return p
  }

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = foo(a)
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(a)
    a = 7.8
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(a)
    a = new Dog()
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(a)
    a = new Frog()
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_frog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_frog(a)
    return true
  }
}
class Cat16 {v: string = "cat"}
class Dog16 {v: bigint = 123n}
class Frog16 {v: int = 5}
function check_cat16(a: Any) {
  expect(a instanceof Cat16).assertEqual(true)
  expect((a as Cat16).v).assertEqual("cat")
}
function check_dog16(a: Any) {
  expect(a instanceof Dog16).assertEqual(true)
  expect((a as Dog16).v).assertEqual(123n)
}
function check_frog16(a: Any) {
  expect(a instanceof Frog16).assertEqual(true)
  expect((a as Frog16).v).assertEqual(5)
}
function check_number16(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function foo10(p: Cat16 | Dog16 | Frog16 | number): number | Dog16 | Cat16 | Frog16 {
  return p
}

namespace testNS128 {
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
  function foo(p: Cat | Dog | Frog | number): number | Dog | Cat | Frog {
    return p
  }

  export function runTest(): boolean {
    let a: number | Dog | Cat | Frog = new Cat()
    let b: Cat | Dog | Frog | number = foo(a)
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
    b = foo(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(a);
    a = new Dog();
    b = foo(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(a);
    a = new Frog();
    b = foo(a);
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

class Cat17 {v: string = "cat"}
class Dog17 {v: bigint = 123n}
class Frog17 {v: int = 5}
function check_cat17(a: Any) {
  expect(a instanceof Cat17).assertEqual(true);
  expect((a as Cat17).v).assertEqual("cat");
}
function check_dog17(a: Any) {
  expect(a instanceof Dog17).assertEqual(true);
  expect((a as Dog17).v).assertEqual(123n);
}
function check_frog17(a: Any) {
  expect(a instanceof Frog17).assertEqual(true);
  expect((a as Frog17).v).assertEqual(5);
}
function check_number17(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function foo11(p: Cat17 | Dog17 | Frog17 | number): number | Dog17 | Cat17 | Frog17 {
  return p
}

namespace testNS129 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: int = 5}
  function check_cat(a: Any) {
    expect(a instanceof Cat).assertEqual(true)
    expect((a as Cat).v).assertEqual("cat")
  }
  function check_dog(a: Any) {
    expect(a instanceof Dog).assertEqual(true)
    expect((a as Dog).v).assertEqual(123n)
  }
  function check_frog(a: Any) {
    expect(a instanceof Frog).assertEqual(true)
    expect((a as Frog).v).assertEqual(5)
  }
  function check_number(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function foo(p: number | Dog | Cat | Frog): Cat | Dog | Frog | number {
    return p
  }

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = foo(a)
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(a)
    a = 7.8
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(a)
    a = new Dog()
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(a)
    a = new Frog()
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_frog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_frog(a)
    return true
  }
}
class Cat18 {v: string = "cat"}
class Dog18 {v: bigint = 123n}
class Frog18 {v: int = 5}
function check_cat18(a: Any) {
  expect(a instanceof Cat18).assertEqual(true)
  expect((a as Cat18).v).assertEqual("cat")
}
function check_dog18(a: Any) {
  expect(a instanceof Dog18).assertEqual(true)
  expect((a as Dog18).v).assertEqual(123n)
}
function check_frog18(a: Any) {
  expect(a instanceof Frog18).assertEqual(true)
  expect((a as Frog18).v).assertEqual(5)
}
function check_number18(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function foo12(p: number | Dog18 | Cat18 | Frog18): Cat18 | Dog18 | Frog18 | number {
  return p
}

namespace testNS130 {
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
  function foo(p: number | Dog | Cat | Frog): Cat | Dog | Frog | number {
    return p
  }

  export function runTest(): boolean {
    let a: number | Dog | Cat | Frog = new Cat()
    let b: Cat | Dog | Frog | number = foo(a)
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
    b = foo(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(a);
    a = new Dog();
    b = foo(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(a);
    a = new Frog();
    b = foo(a);
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

class Cat19 {v: string = "cat"}
class Dog19 {v: bigint = 123n}
class Frog19 {v: int = 5}
function check_cat19(a: Any) {
  expect(a instanceof Cat19).assertEqual(true);
  expect((a as Cat19).v).assertEqual("cat");
}
function check_dog19(a: Any) {
  expect(a instanceof Dog19).assertEqual(true);
  expect((a as Dog19).v).assertEqual(123n);
}
function check_frog19(a: Any) {
  expect(a instanceof Frog19).assertEqual(true);
  expect((a as Frog19).v).assertEqual(5);
}
function check_number19(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function foo13(p: number | Dog19 | Cat19 | Frog19): Cat19 | Dog19 | Frog19 | number {
  return p
}

namespace testNS131 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: int = 5}
  function check_cat(a: Any) {
    expect(a instanceof Cat).assertEqual(true)
    expect((a as Cat).v).assertEqual("cat")
  }
  function check_dog(a: Any) {
    expect(a instanceof Dog).assertEqual(true)
    expect((a as Dog).v).assertEqual(123n)
  }
  function check_frog(a: Any) {
    expect(a instanceof Frog).assertEqual(true)
    expect((a as Frog).v).assertEqual(5)
  }
  function check_number(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function foo(p: number | Dog | Cat | Frog): number | Dog | Cat | Frog {
    return p
  }

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = foo(a)
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_cat(a)
    a = 7.8
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(a)
    a = new Dog()
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(a)
    a = new Frog()
    b = foo(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_frog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_frog(a)
    return true
  }
}
class Cat20 {v: string = "cat"}
class Dog20 {v: bigint = 123n}
class Frog20 {v: int = 5}
function check_cat20(a: Any) {
  expect(a instanceof Cat20).assertEqual(true)
  expect((a as Cat20).v).assertEqual("cat")
}
function check_dog20(a: Any) {
  expect(a instanceof Dog20).assertEqual(true)
  expect((a as Dog20).v).assertEqual(123n)
}
function check_frog20(a: Any) {
  expect(a instanceof Frog20).assertEqual(true)
  expect((a as Frog20).v).assertEqual(5)
}
function check_number20(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function foo14(p: number | Dog20 | Cat20 | Frog20): number | Dog20 | Cat20 | Frog20 {
  return p
}

namespace testNS132 {
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
  function foo(p: number | Dog | Cat | Frog): number | Dog | Cat | Frog {
    return p
  }

  export function runTest(): boolean {
    let a: number | Dog | Cat | Frog = new Cat()
    let b: Cat | Dog | Frog | number = foo(a)
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
    b = foo(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(a);
    a = new Dog();
    b = foo(a);
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(b);
    a = b;
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(a);
    a = new Frog();
    b = foo(a);
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

class Cat21 {v: string = "cat"}
class Dog21 {v: bigint = 123n}
class Frog21 {v: int = 5}
function check_cat21(a: Any) {
  expect(a instanceof Cat21).assertEqual(true);
  expect((a as Cat21).v).assertEqual("cat");
}
function check_dog21(a: Any) {
  expect(a instanceof Dog21).assertEqual(true);
  expect((a as Dog21).v).assertEqual(123n);
}
function check_frog21(a: Any) {
  expect(a instanceof Frog21).assertEqual(true);
  expect((a as Frog21).v).assertEqual(5);
}
function check_number21(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function foo15(p: number | Dog21 | Cat21 | Frog21): number | Dog21 | Cat21 | Frog21 {
  return p
}

export default function UnionTypesIdentityTest04(): void {
  describe('UnionTypesIdentityTest04', () => {
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
     * @tc.number    SUB_UNION_TYPES_IDENTITY_3500
     * @tc.name      testUnionTypesIdentity0035
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0035';

      let a: Object | undefined = 5n
      let b: undefined | Object = foo6(a)
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
      b = foo6(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(undefined)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(undefined)
      a = "abc"
      b = foo6(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual("abc")
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual("abc")

      expect(testNS115.runTest()).assertEqual(true)
      expect(testNS116.runTest()).assertEqual(true)
      expect(testNS117.runTest()).assertEqual(true)
      expect(testNS118.runTest()).assertEqual(true)
      expect(testNS119.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_3600
     * @tc.name      testUnionTypesIdentity0036
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0036';

      let a: undefined | Object = 5n
      let b: Object | undefined = foo7(a)
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
      b = foo7(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = foo7(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");

      expect(testNS120.runTest()).assertEqual(true);
      expect(testNS121.runTest()).assertEqual(true);
      expect(testNS122.runTest()).assertEqual(true);
      expect(testNS123.runTest()).assertEqual(true);
      expect(testNS124.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_3700
     * @tc.name      testUnionTypesIdentity0037
     * @tc.desc      Checking Union types A and B are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0037';

      let a: Cat14 | Dog14 | Frog14 | number = new Cat14()
      let b: number | Dog14 | Cat14 | Frog14 = foo8(a)
      expect(a instanceof Cat14 | Dog14 | Frog14 | number).assertEqual(true)
      expect(a instanceof number | Dog14 | Cat14 | Frog14).assertEqual(true)
      check_cat14(a)
      expect(b instanceof Cat14 | Dog14 | Frog14 | number).assertEqual(true)
      expect(b instanceof number | Dog14 | Cat14 | Frog14).assertEqual(true)
      check_cat14(b)
      a = b
      expect(a instanceof Cat14 | Dog14 | Frog14 | number).assertEqual(true)
      expect(a instanceof number | Dog14 | Cat14 | Frog14).assertEqual(true)
      check_cat14(a)
      a = 7.8
      b = foo8(a)
      expect(b instanceof Cat14 | Dog14 | Frog14 | number).assertEqual(true)
      expect(b instanceof number | Dog14 | Cat14 | Frog14).assertEqual(true)
      check_number14(b)
      a = b
      expect(a instanceof Cat14 | Dog14 | Frog14 | number).assertEqual(true)
      expect(a instanceof number | Dog14 | Cat14 | Frog14).assertEqual(true)
      check_number14(a)
      a = new Dog14()
      b = foo8(a)
      expect(b instanceof Cat14 | Dog14 | Frog14 | number).assertEqual(true)
      expect(b instanceof number | Dog14 | Cat14 | Frog14).assertEqual(true)
      check_dog14(b)
      a = b
      expect(a instanceof Cat14 | Dog14 | Frog14 | number).assertEqual(true)
      expect(a instanceof number | Dog14 | Cat14 | Frog14).assertEqual(true)
      check_dog14(a)
      a = new Frog14()
      b = foo8(a)
      expect(b instanceof Cat14 | Dog14 | Frog14 | number).assertEqual(true)
      expect(b instanceof number | Dog14 | Cat14 | Frog14).assertEqual(true)
      check_frog14(b)
      a = b
      expect(a instanceof Cat14 | Dog14 | Frog14 | number).assertEqual(true)
      expect(a instanceof number | Dog14 | Cat14 | Frog14).assertEqual(true)
      check_frog14(a)

      expect(testNS125.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_3800
     * @tc.name      testUnionTypesIdentity0038
     * @tc.desc      Checking Union types A and B are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0038';

      let a: number | Dog15 | Cat15 | Frog15 = new Cat15()
      let b: Cat15 | Dog15 | Frog15 | number = foo9(a)
      expect(a instanceof Cat15 | Dog15 | Frog15 | number).assertEqual(true);
      expect(a instanceof number | Dog15 | Cat15 | Frog15).assertEqual(true);
      check_cat15(a);
      expect(b instanceof Cat15 | Dog15 | Frog15 | number).assertEqual(true);
      expect(b instanceof number | Dog15 | Cat15 | Frog15).assertEqual(true);
      check_cat15(b);
      a = b;
      expect(a instanceof Cat15 | Dog15 | Frog15 | number).assertEqual(true);
      expect(a instanceof number | Dog15 | Cat15 | Frog15).assertEqual(true);
      check_cat15(a);
      a = 7.8;
      b = foo9(a);
      expect(b instanceof Cat15 | Dog15 | Frog15 | number).assertEqual(true);
      expect(b instanceof number | Dog15 | Cat15 | Frog15).assertEqual(true);
      check_number15(b);
      a = b;
      expect(a instanceof Cat15 | Dog15 | Frog15 | number).assertEqual(true);
      expect(a instanceof number | Dog15 | Cat15 | Frog15).assertEqual(true);
      check_number15(a);
      a = new Dog15();
      b = foo9(a);
      expect(b instanceof Cat15 | Dog15 | Frog15 | number).assertEqual(true);
      expect(b instanceof number | Dog15 | Cat15 | Frog15).assertEqual(true);
      check_dog15(b);
      a = b;
      expect(a instanceof Cat15 | Dog15 | Frog15 | number).assertEqual(true);
      expect(a instanceof number | Dog15 | Cat15 | Frog15).assertEqual(true);
      check_dog15(a);
      a = new Frog15();
      b = foo9(a);
      expect(b instanceof Cat15 | Dog15 | Frog15 | number).assertEqual(true);
      expect(b instanceof number | Dog15 | Cat15 | Frog15).assertEqual(true);
      check_frog15(b);
      a = b;
      expect(a instanceof Cat15 | Dog15 | Frog15 | number).assertEqual(true);
      expect(a instanceof number | Dog15 | Cat15 | Frog15).assertEqual(true);
      check_frog15(a);

      expect(testNS126.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_3900
     * @tc.name      testUnionTypesIdentity0039
     * @tc.desc      Checking Union types A and B are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0039';

      let a: Cat16 | Dog16 | Frog16 | number = new Cat16()
      let b: number | Dog16 | Cat16 | Frog16 = foo10(a)
      expect(a instanceof Cat16 | Dog16 | Frog16 | number).assertEqual(true)
      expect(a instanceof number | Dog16 | Cat16 | Frog16).assertEqual(true)
      check_cat16(a)
      expect(b instanceof Cat16 | Dog16 | Frog16 | number).assertEqual(true)
      expect(b instanceof number | Dog16 | Cat16 | Frog16).assertEqual(true)
      check_cat16(b)
      a = b
      expect(a instanceof Cat16 | Dog16 | Frog16 | number).assertEqual(true)
      expect(a instanceof number | Dog16 | Cat16 | Frog16).assertEqual(true)
      check_cat16(a)
      a = 7.8
      b = foo10(a)
      expect(b instanceof Cat16 | Dog16 | Frog16 | number).assertEqual(true)
      expect(b instanceof number | Dog16 | Cat16 | Frog16).assertEqual(true)
      check_number16(b)
      a = b
      expect(a instanceof Cat16 | Dog16 | Frog16 | number).assertEqual(true)
      expect(a instanceof number | Dog16 | Cat16 | Frog16).assertEqual(true)
      check_number16(a)
      a = new Dog16()
      b = foo10(a)
      expect(b instanceof Cat16 | Dog16 | Frog16 | number).assertEqual(true)
      expect(b instanceof number | Dog16 | Cat16 | Frog16).assertEqual(true)
      check_dog16(b)
      a = b
      expect(a instanceof Cat16 | Dog16 | Frog16 | number).assertEqual(true)
      expect(a instanceof number | Dog16 | Cat16 | Frog16).assertEqual(true)
      check_dog16(a)
      a = new Frog16()
      b = foo10(a)
      expect(b instanceof Cat16 | Dog16 | Frog16 | number).assertEqual(true)
      expect(b instanceof number | Dog16 | Cat16 | Frog16).assertEqual(true)
      check_frog16(b)
      a = b
      expect(a instanceof Cat16 | Dog16 | Frog16 | number).assertEqual(true)
      expect(a instanceof number | Dog16 | Cat16 | Frog16).assertEqual(true)
      check_frog16(a)

      expect(testNS127.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_4000
     * @tc.name      testUnionTypesIdentity0040
     * @tc.desc      Checking Union types A and B are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0040';

      let a: number | Dog17 | Cat17 | Frog17 = new Cat17()
      let b: Cat17 | Dog17 | Frog17 | number = foo11(a)
      expect(a instanceof Cat17 | Dog17 | Frog17 | number).assertEqual(true);
      expect(a instanceof number | Dog17 | Cat17 | Frog17).assertEqual(true);
      check_cat17(a);
      expect(b instanceof Cat17 | Dog17 | Frog17 | number).assertEqual(true);
      expect(b instanceof number | Dog17 | Cat17 | Frog17).assertEqual(true);
      check_cat17(b);
      a = b;
      expect(a instanceof Cat17 | Dog17 | Frog17 | number).assertEqual(true);
      expect(a instanceof number | Dog17 | Cat17 | Frog17).assertEqual(true);
      check_cat17(a);
      a = 7.8;
      b = foo11(a);
      expect(b instanceof Cat17 | Dog17 | Frog17 | number).assertEqual(true);
      expect(b instanceof number | Dog17 | Cat17 | Frog17).assertEqual(true);
      check_number17(b);
      a = b;
      expect(a instanceof Cat17 | Dog17 | Frog17 | number).assertEqual(true);
      expect(a instanceof number | Dog17 | Cat17 | Frog17).assertEqual(true);
      check_number17(a);
      a = new Dog17();
      b = foo11(a);
      expect(b instanceof Cat17 | Dog17 | Frog17 | number).assertEqual(true);
      expect(b instanceof number | Dog17 | Cat17 | Frog17).assertEqual(true);
      check_dog17(b);
      a = b;
      expect(a instanceof Cat17 | Dog17 | Frog17 | number).assertEqual(true);
      expect(a instanceof number | Dog17 | Cat17 | Frog17).assertEqual(true);
      check_dog17(a);
      a = new Frog17();
      b = foo11(a);
      expect(b instanceof Cat17 | Dog17 | Frog17 | number).assertEqual(true);
      expect(b instanceof number | Dog17 | Cat17 | Frog17).assertEqual(true);
      check_frog17(b);
      a = b;
      expect(a instanceof Cat17 | Dog17 | Frog17 | number).assertEqual(true);
      expect(a instanceof number | Dog17 | Cat17 | Frog17).assertEqual(true);
      check_frog17(a);

      expect(testNS128.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_4100
     * @tc.name      testUnionTypesIdentity0041
     * @tc.desc      Checking Union types A and B are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0041';

      let a: Cat18 | Dog18 | Frog18 | number = new Cat18()
      let b: number | Dog18 | Cat18 | Frog18 = foo12(a)
      expect(a instanceof Cat18 | Dog18 | Frog18 | number).assertEqual(true)
      expect(a instanceof number | Dog18 | Cat18 | Frog18).assertEqual(true)
      check_cat18(a)
      expect(b instanceof Cat18 | Dog18 | Frog18 | number).assertEqual(true)
      expect(b instanceof number | Dog18 | Cat18 | Frog18).assertEqual(true)
      check_cat18(b)
      a = b
      expect(a instanceof Cat18 | Dog18 | Frog18 | number).assertEqual(true)
      expect(a instanceof number | Dog18 | Cat18 | Frog18).assertEqual(true)
      check_cat18(a)
      a = 7.8
      b = foo12(a)
      expect(b instanceof Cat18 | Dog18 | Frog18 | number).assertEqual(true)
      expect(b instanceof number | Dog18 | Cat18 | Frog18).assertEqual(true)
      check_number18(b)
      a = b
      expect(a instanceof Cat18 | Dog18 | Frog18 | number).assertEqual(true)
      expect(a instanceof number | Dog18 | Cat18 | Frog18).assertEqual(true)
      check_number18(a)
      a = new Dog18()
      b = foo12(a)
      expect(b instanceof Cat18 | Dog18 | Frog18 | number).assertEqual(true)
      expect(b instanceof number | Dog18 | Cat18 | Frog18).assertEqual(true)
      check_dog18(b)
      a = b
      expect(a instanceof Cat18 | Dog18 | Frog18 | number).assertEqual(true)
      expect(a instanceof number | Dog18 | Cat18 | Frog18).assertEqual(true)
      check_dog18(a)
      a = new Frog18()
      b = foo12(a)
      expect(b instanceof Cat18 | Dog18 | Frog18 | number).assertEqual(true)
      expect(b instanceof number | Dog18 | Cat18 | Frog18).assertEqual(true)
      check_frog18(b)
      a = b
      expect(a instanceof Cat18 | Dog18 | Frog18 | number).assertEqual(true)
      expect(a instanceof number | Dog18 | Cat18 | Frog18).assertEqual(true)
      check_frog18(a)

      expect(testNS129.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_4200
     * @tc.name      testUnionTypesIdentity0042
     * @tc.desc      Checking Union types A and B are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0042';

      let a: number | Dog19 | Cat19 | Frog19 = new Cat19()
      let b: Cat19 | Dog19 | Frog19 | number = foo13(a)
      expect(a instanceof Cat19 | Dog19 | Frog19 | number).assertEqual(true);
      expect(a instanceof number | Dog19 | Cat19 | Frog19).assertEqual(true);
      check_cat19(a);
      expect(b instanceof Cat19 | Dog19 | Frog19 | number).assertEqual(true);
      expect(b instanceof number | Dog19 | Cat19 | Frog19).assertEqual(true);
      check_cat19(b);
      a = b;
      expect(a instanceof Cat19 | Dog19 | Frog19 | number).assertEqual(true);
      expect(a instanceof number | Dog19 | Cat19 | Frog19).assertEqual(true);
      check_cat19(a);
      a = 7.8;
      b = foo13(a);
      expect(b instanceof Cat19 | Dog19 | Frog19 | number).assertEqual(true);
      expect(b instanceof number | Dog19 | Cat19 | Frog19).assertEqual(true);
      check_number19(b);
      a = b;
      expect(a instanceof Cat19 | Dog19 | Frog19 | number).assertEqual(true);
      expect(a instanceof number | Dog19 | Cat19 | Frog19).assertEqual(true);
      check_number19(a);
      a = new Dog19();
      b = foo13(a);
      expect(b instanceof Cat19 | Dog19 | Frog19 | number).assertEqual(true);
      expect(b instanceof number | Dog19 | Cat19 | Frog19).assertEqual(true);
      check_dog19(b);
      a = b;
      expect(a instanceof Cat19 | Dog19 | Frog19 | number).assertEqual(true);
      expect(a instanceof number | Dog19 | Cat19 | Frog19).assertEqual(true);
      check_dog19(a);
      a = new Frog19();
      b = foo13(a);
      expect(b instanceof Cat19 | Dog19 | Frog19 | number).assertEqual(true);
      expect(b instanceof number | Dog19 | Cat19 | Frog19).assertEqual(true);
      check_frog19(b);
      a = b;
      expect(a instanceof Cat19 | Dog19 | Frog19 | number).assertEqual(true);
      expect(a instanceof number | Dog19 | Cat19 | Frog19).assertEqual(true);
      check_frog19(a);

      expect(testNS130.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_4300
     * @tc.name      testUnionTypesIdentity0043
     * @tc.desc      Checking Union types A and B are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0043';

      let a: Cat20 | Dog20 | Frog20 | number = new Cat20()
      let b: number | Dog20 | Cat20 | Frog20 = foo14(a)
      expect(a instanceof Cat20 | Dog20 | Frog20 | number).assertEqual(true)
      expect(a instanceof number | Dog20 | Cat20 | Frog20).assertEqual(true)
      check_cat20(a)
      expect(b instanceof Cat20 | Dog20 | Frog20 | number).assertEqual(true)
      expect(b instanceof number | Dog20 | Cat20 | Frog20).assertEqual(true)
      check_cat20(b)
      a = b
      expect(a instanceof Cat20 | Dog20 | Frog20 | number).assertEqual(true)
      expect(a instanceof number | Dog20 | Cat20 | Frog20).assertEqual(true)
      check_cat20(a)
      a = 7.8
      b = foo14(a)
      expect(b instanceof Cat20 | Dog20 | Frog20 | number).assertEqual(true)
      expect(b instanceof number | Dog20 | Cat20 | Frog20).assertEqual(true)
      check_number20(b)
      a = b
      expect(a instanceof Cat20 | Dog20 | Frog20 | number).assertEqual(true)
      expect(a instanceof number | Dog20 | Cat20 | Frog20).assertEqual(true)
      check_number20(a)
      a = new Dog20()
      b = foo14(a)
      expect(b instanceof Cat20 | Dog20 | Frog20 | number).assertEqual(true)
      expect(b instanceof number | Dog20 | Cat20 | Frog20).assertEqual(true)
      check_dog20(b)
      a = b
      expect(a instanceof Cat20 | Dog20 | Frog20 | number).assertEqual(true)
      expect(a instanceof number | Dog20 | Cat20 | Frog20).assertEqual(true)
      check_dog20(a)
      a = new Frog20()
      b = foo14(a)
      expect(b instanceof Cat20 | Dog20 | Frog20 | number).assertEqual(true)
      expect(b instanceof number | Dog20 | Cat20 | Frog20).assertEqual(true)
      check_frog20(b)
      a = b
      expect(a instanceof Cat20 | Dog20 | Frog20 | number).assertEqual(true)
      expect(a instanceof number | Dog20 | Cat20 | Frog20).assertEqual(true)
      check_frog20(a)

      expect(testNS131.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_4400
     * @tc.name      testUnionTypesIdentity0044
     * @tc.desc      Checking Union types A and B are identical on custom types on function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0044';

      let a: number | Dog21 | Cat21 | Frog21 = new Cat21()
      let b: Cat21 | Dog21 | Frog21 | number = foo15(a)
      expect(a instanceof Cat21 | Dog21 | Frog21 | number).assertEqual(true);
      expect(a instanceof number | Dog21 | Cat21 | Frog21).assertEqual(true);
      check_cat21(a);
      expect(b instanceof Cat21 | Dog21 | Frog21 | number).assertEqual(true);
      expect(b instanceof number | Dog21 | Cat21 | Frog21).assertEqual(true);
      check_cat21(b);
      a = b;
      expect(a instanceof Cat21 | Dog21 | Frog21 | number).assertEqual(true);
      expect(a instanceof number | Dog21 | Cat21 | Frog21).assertEqual(true);
      check_cat21(a);
      a = 7.8;
      b = foo15(a);
      expect(b instanceof Cat21 | Dog21 | Frog21 | number).assertEqual(true);
      expect(b instanceof number | Dog21 | Cat21 | Frog21).assertEqual(true);
      check_number21(b);
      a = b;
      expect(a instanceof Cat21 | Dog21 | Frog21 | number).assertEqual(true);
      expect(a instanceof number | Dog21 | Cat21 | Frog21).assertEqual(true);
      check_number21(a);
      a = new Dog21();
      b = foo15(a);
      expect(b instanceof Cat21 | Dog21 | Frog21 | number).assertEqual(true);
      expect(b instanceof number | Dog21 | Cat21 | Frog21).assertEqual(true);
      check_dog21(b);
      a = b;
      expect(a instanceof Cat21 | Dog21 | Frog21 | number).assertEqual(true);
      expect(a instanceof number | Dog21 | Cat21 | Frog21).assertEqual(true);
      check_dog21(a);
      a = new Frog21();
      b = foo15(a);
      expect(b instanceof Cat21 | Dog21 | Frog21 | number).assertEqual(true);
      expect(b instanceof number | Dog21 | Cat21 | Frog21).assertEqual(true);
      check_frog21(b);
      a = b;
      expect(a instanceof Cat21 | Dog21 | Frog21 | number).assertEqual(true);
      expect(a instanceof number | Dog21 | Cat21 | Frog21).assertEqual(true);
      check_frog21(a);

      expect(testNS132.runTest()).assertEqual(true);

    });
  })
}