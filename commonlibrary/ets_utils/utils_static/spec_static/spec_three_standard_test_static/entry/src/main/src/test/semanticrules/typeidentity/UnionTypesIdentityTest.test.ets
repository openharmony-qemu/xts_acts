'use static'
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
  export function runTest(): boolean {
    let a: Object | undefined = 5n
    let b: undefined | Object = a
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
    b = undefined
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual(undefined)
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(undefined)
    b = "abc"
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
namespace testNS2 {
  export function runTest(): boolean {
    let a: Object | undefined | null = 5n
    let b: undefined | null | Object = a
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
    b = null
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(null)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(null)
    b = undefined
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
namespace testNS3 {
  export function runTest(): boolean {
    let a: number | boolean = true
    let b: boolean | number = a
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
    b = 7.9
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(7.9)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(7.9)
    b = false
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
namespace testNS4 {
  export function runTest(): boolean {
    let a: int | string | boolean = true
    let b: string | boolean | int = a
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
    b = 5
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual(5)
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(5)
    b = "abc"
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
namespace testNS5 {
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = a
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
    b = "In Progress"
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("In Progress")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("In Progress")
    b = "Done"
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
namespace testNS6 {
  export function runTest(): boolean {
    let a: undefined | Object = 5n
    let b: Object | undefined = a
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
    b = undefined;
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    b = "abc";
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
namespace testNS7 {
  export function runTest(): boolean {
    let a: undefined | null | Object = 5n
    let b: Object | undefined | null = a
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
    b = null;
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    b = undefined;
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
namespace testNS8 {
  export function runTest(): boolean {
    let a: boolean | number = true
    let b: number | boolean = a
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
    b = 7.9;
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    b = false;
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
namespace testNS9 {
  export function runTest(): boolean {
    let a: string | boolean | int = true
    let b: int | string | boolean = a
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
    b = 5;
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    b = "abc";
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
namespace testNS10 {
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = a
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
    b = "In Progress";
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    b = "Done";
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
namespace testNS11 {
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

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = a
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_cat(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_cat(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_cat(a)
    b = 7.8
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(a)
    b = new Dog()
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(a)
    b = new Frog()
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_frog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_frog(a)
    return true
  }
}
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
namespace testNS12 {
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

  export function runTest(): boolean {
    let a: number | Dog | Cat | Frog = new Cat()
    let b: Cat | Dog | Frog | number = a
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_cat(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_cat(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_cat(a)
    b = 7.8
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_number(a)
    b = new Dog()
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_dog(a)
    b = new Frog()
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_frog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
    check_frog(a)
    return true
  }
}
class Cat1 {v: string = "cat"}
class Dog1 {v: bigint = 123n}
class Frog1 {v: int = 5}
function check_cat1(a: Any) {
  expect(a instanceof Cat1).assertEqual(true);
  expect((a as Cat1).v).assertEqual("cat");
}
function check_dog1(a: Any) {
  expect(a instanceof Dog1).assertEqual(true);
  expect((a as Dog1).v).assertEqual(123n);
}
function check_frog1(a: Any) {
  expect(a instanceof Frog1).assertEqual(true);
  expect((a as Frog1).v).assertEqual(5);
}
function check_number1(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
namespace testNS13 {
  function cast(p: Any) {
    return p as Object | undefined
  }
  export function runTest(): boolean {
    let a: Object | undefined = 5n
    let b: undefined | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = cast(a);
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
namespace testNS14 {
  function cast(p: Any) {
    return p as Object | undefined | null
  }
  export function runTest(): boolean {
    let a: Object | undefined | null = 5n
    let b: undefined | null | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = cast(a);
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
namespace testNS15 {
  function cast(p: Any) {
    return p as number | boolean
  }
  export function runTest(): boolean {
    let a: number | boolean = true
    let b: boolean | number = cast(a)
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
    b = cast(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = cast(a);
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
namespace testNS16 {
  function cast(p: Any) {
    return p as int | string | boolean
  }
  export function runTest(): boolean {
    let a: int | string | boolean = true
    let b: string | boolean | int = cast(a)
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
    b = cast(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = cast(a);
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
namespace testNS17 {
  function cast(p: Any) {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
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
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = cast(a);
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
function cast(p: Any) {
  return p as Object | undefined
}
namespace testNS18 {
  function cast(p: Any) {
    return p as Object | undefined
  }
  export function runTest(): boolean {
    let a: undefined | Object = 5n
    let b: Object | undefined = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = cast(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual("abc");
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual("abc");
    return true
  }
}
namespace testNS19 {
  function cast(p: Any) {
    return p as Object | undefined | null
  }
  export function runTest(): boolean {
    let a: undefined | null | Object = 5n
    let b: Object | undefined | null = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = cast(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    return true
  }
}
namespace testNS20 {
  function cast(p: Any) {
    return p as number | boolean
  }
  export function runTest(): boolean {
    let a: boolean | number = true
    let b: number | boolean = cast(a)
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
    b = cast(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = cast(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(false);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(false);
    return true
  }
}
namespace testNS21 {
  function cast(p: Any) {
    return p as int | string | boolean
  }
  export function runTest(): boolean {
    let a: string | boolean | int = true
    let b: int | string | boolean = cast(a)
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
    b = cast(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = cast(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual("abc");
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual("abc");
    return true
  }
}
namespace testNS22 {
  function cast(p: Any) {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
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
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("Done");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("Done");
    return true
  }
}
function cast1(p: Any) {
  return p as Object | undefined
}
namespace testNS23 {
  function cast(p: Any) {
    return p as undefined | Object
  }
  export function runTest(): boolean {
    let a: Object | undefined = 5n
    let b: undefined | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = cast(a);
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
namespace testNS24 {
  function cast(p: Any) {
    return p as undefined | null | Object
  }
  export function runTest(): boolean {
    let a: Object | undefined | null = 5n
    let b: undefined | null | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = cast(a);
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
namespace testNS25 {
  function cast(p: Any) {
    return p as boolean | number
  }
  export function runTest(): boolean {
    let a: number | boolean = true
    let b: boolean | number = cast(a)
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
    b = cast(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = cast(a);
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
namespace testNS26 {
  function cast(p: Any) {
    return p as string | boolean | int
  }
  export function runTest(): boolean {
    let a: int | string | boolean = true
    let b: string | boolean | int = cast(a)
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
    b = cast(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = cast(a);
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
namespace testNS27 {
  function cast(p: Any) {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
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
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = cast(a);
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
function cast2(p: Any) {
  return p as undefined | Object
}
namespace testNS28 {
  function cast(p: Any) {
    return p as undefined | Object
  }
  export function runTest(): boolean {
    let a: undefined | Object = 5n
    let b: Object | undefined = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = cast(a);
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
namespace testNS29 {
  function cast(p: Any) {
    return p as undefined | null | Object
  }
  export function runTest(): boolean {
    let a: undefined | null | Object = 5n
    let b: Object | undefined | null = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = cast(a);
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
namespace testNS30 {
  function cast(p: Any) {
    return p as boolean | number
  }
  export function runTest(): boolean {
    let a: boolean | number = true
    let b: number | boolean = cast(a)
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
    b = cast(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = cast(a);
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
namespace testNS31 {
  function cast(p: Any) {
    return p as string | boolean | int
  }
  export function runTest(): boolean {
    let a: string | boolean | int = true
    let b: int | string | boolean = cast(a)
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
    b = cast(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = cast(a);
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
namespace testNS32 {
  function cast(p: Any) {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
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
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = cast(a);
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
function cast3(p: Any) {
  return p as undefined | Object
}

namespace testNS33 {
  function cast(p: Any): Object | undefined {
    return p as Object | undefined
  }
  export function runTest(): boolean {
    let a: Object | undefined = 5n
    let b: undefined | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = cast(a);
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

namespace testNS34 {
  function cast(p: Any): Object | undefined | null {
    return p as Object | undefined | null
  }
  export function runTest(): boolean {
    let a: Object | undefined | null = 5n
    let b: undefined | null | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = cast(a);
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

namespace testNS35 {
  function cast(p: Any): number | boolean {
    return p as number | boolean
  }
  export function runTest(): boolean {
    let a: number | boolean = true
    let b: boolean | number = cast(a)
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
    b = cast(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = cast(a);
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

namespace testNS36 {
  function cast(p: Any): int | string | boolean {
    return p as int | string | boolean
  }
  export function runTest(): boolean {
    let a: int | string | boolean = true
    let b: string | boolean | int = cast(a)
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
    b = cast(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = cast(a);
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

namespace testNS37 {
  function cast(p: Any): String {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("On Review");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    a = "In Progress";
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("Done");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("Done");
    return true;
  }
}

function cast4(p: Any): Object | undefined {
  return p as Object | undefined
}

namespace testNS38 {
  function cast(p: Any): Object | undefined {
    return p as Object | undefined
  }
  export function runTest(): boolean {
    let a: undefined | Object = 5n
    let b: Object | undefined = cast(a)
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
    b = cast(a)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual(undefined)
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(undefined)
    a = "abc"
    b = cast(a)
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

namespace testNS39 {
  function cast(p: Any): Object | undefined | null {
    return p as Object | undefined | null
  }
  export function runTest(): boolean {
    let a: undefined | null | Object = 5n
    let b: Object | undefined | null = cast(a)
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
    b = cast(a)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(null)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(null)
    a = undefined
    b = cast(a)
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

namespace testNS40 {
  function cast(p: Any): number | boolean {
    return p as number | boolean
  }
  export function runTest(): boolean {
    let a: boolean | number = true
    let b: number | boolean = cast(a)
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
    b = cast(a)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(7.9)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(7.9)
    a = false
    b = cast(a)
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

namespace testNS41 {
  function cast(p: Any): int | string | boolean {
    return p as int | string | boolean
  }
  export function runTest(): boolean {
    let a: string | boolean | int = true
    let b: int | string | boolean = cast(a)
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
    b = cast(a)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual(5)
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(5)
    a = "abc"
    b = cast(a)
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

namespace testNS42 {
  function cast(p: Any): String {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("On Review")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    a = "In Progress"
    b = cast(a)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("In Progress")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("In Progress")
    a = "Done"
    b = cast(a)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("Done")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("Done")
    return true
  }
}

function cast5(p: Any): Object | undefined {
  return p as Object | undefined
}

namespace testNS43 {
  function cast(p: Any): Object | undefined {
    return p as undefined | Object
  }
  export function runTest(): boolean {
    let a: Object | undefined = 5n
    let b: undefined | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = cast(a);
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

namespace testNS44 {
  function cast(p: Any): Object | undefined | null {
    return p as undefined | null | Object
  }
  export function runTest(): boolean {
    let a: Object | undefined | null = 5n
    let b: undefined | null | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = cast(a);
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

namespace testNS45 {
  function cast(p: Any): number | boolean {
    return p as boolean | number
  }
  export function runTest(): boolean {
    let a: number | boolean = true
    let b: boolean | number = cast(a)
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
    b = cast(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = cast(a);
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

namespace testNS46 {
  function cast(p: Any): int | string | boolean {
    return p as string | boolean | int
  }
  export function runTest(): boolean {
    let a: int | string | boolean = true
    let b: string | boolean | int = cast(a)
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
    b = cast(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = cast(a);
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

namespace testNS47 {
  function cast(p: Any): String {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("On Review");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    a = "In Progress";
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("Done");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("Done");
    return true;
  }
}

function cast6(p: Any): Object | undefined {
  return p as undefined | Object
}

namespace testNS48 {
  function cast(p: Any): Object | undefined {
    return p as undefined | Object
  }
  export function runTest(): boolean {
    let a: undefined | Object = 5n
    let b: Object | undefined = cast(a)
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
    b = cast(a)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual(undefined)
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(undefined)
    a = "abc"
    b = cast(a)
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

namespace testNS49 {
  function cast(p: Any): Object | undefined | null {
    return p as undefined | null | Object
  }
  export function runTest(): boolean {
    let a: undefined | null | Object = 5n
    let b: Object | undefined | null = cast(a)
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
    b = cast(a)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(null)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(null)
    a = undefined
    b = cast(a)
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

namespace testNS50 {
  function cast(p: Any): number | boolean {
    return p as boolean | number
  }
  export function runTest(): boolean {
    let a: boolean | number = true
    let b: number | boolean = cast(a)
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
    b = cast(a)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(7.9)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(7.9)
    a = false
    b = cast(a)
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

namespace testNS51 {
  function cast(p: Any): int | string | boolean {
    return p as string | boolean | int
  }
  export function runTest(): boolean {
    let a: string | boolean | int = true
    let b: int | string | boolean = cast(a)
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
    b = cast(a)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual(5)
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(5)
    a = "abc"
    b = cast(a)
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

namespace testNS52 {
  function cast(p: Any): String {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("On Review")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    a = "In Progress"
    b = cast(a)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("In Progress")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("In Progress")
    a = "Done"
    b = cast(a)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("Done")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("Done")
    return true
  }
}

function cast7(p: Any): Object | undefined {
  return p as undefined | Object
}

namespace testNS53 {
  function cast(p: Any): undefined | Object {
    return p as undefined | Object
  }
  export function runTest(): boolean {
    let a: Object | undefined = 5n
    let b: undefined | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = cast(a);
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

namespace testNS54 {
  function cast(p: Any): undefined | null | Object {
    return p as undefined | null | Object
  }
  export function runTest(): boolean {
    let a: Object | undefined | null = 5n
    let b: undefined | null | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = cast(a);
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

namespace testNS55 {
  function cast(p: Any): boolean | number {
    return p as boolean | number
  }
  export function runTest(): boolean {
    let a: number | boolean = true
    let b: boolean | number = cast(a)
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
    b = cast(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = cast(a);
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

namespace testNS56 {
  function cast(p: Any): string | boolean | int {
    return p as string | boolean | int
  }
  export function runTest(): boolean {
    let a: int | string | boolean = true
    let b: string | boolean | int = cast(a)
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
    b = cast(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = cast(a);
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

namespace testNS57 {
  function cast(p: Any): String {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("On Review");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    a = "In Progress";
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("Done");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("Done");
    return true;
  }
}

function cast8(p: Any): undefined | Object {
  return p as undefined | Object
}

namespace testNS58 {
  function cast(p: Any): undefined | Object {
    return p as undefined | Object
  }
  export function runTest(): boolean {
    let a: undefined | Object = 5n
    let b: Object | undefined = cast(a)
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
    b = cast(a)
    expect(b instanceof Object | undefined).assertEqual(true)
    expect(b instanceof undefined | Object).assertEqual(true)
    expect(b).assertEqual(undefined)
    a = b
    expect(a instanceof Object | undefined).assertEqual(true)
    expect(a instanceof undefined | Object).assertEqual(true)
    expect(a).assertEqual(undefined)
    a = "abc"
    b = cast(a)
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

namespace testNS59 {
  function cast(p: Any): undefined | null | Object {
    return p as undefined | null | Object
  }
  export function runTest(): boolean {
    let a: undefined | null | Object = 5n
    let b: Object | undefined | null = cast(a)
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
    b = cast(a)
    expect(b instanceof Object | undefined | null).assertEqual(true)
    expect(b instanceof undefined | null | Object).assertEqual(true)
    expect(b).assertEqual(null)
    a = b
    expect(a instanceof Object | undefined | null).assertEqual(true)
    expect(a instanceof undefined | null | Object).assertEqual(true)
    expect(a).assertEqual(null)
    a = undefined
    b = cast(a)
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

namespace testNS60 {
  function cast(p: Any): boolean | number {
    return p as boolean | number
  }
  export function runTest(): boolean {
    let a: boolean | number = true
    let b: number | boolean = cast(a)
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
    b = cast(a)
    expect(b instanceof number | boolean).assertEqual(true)
    expect(b instanceof boolean | number).assertEqual(true)
    expect(b).assertEqual(7.9)
    a = b
    expect(a instanceof number | boolean).assertEqual(true)
    expect(a instanceof boolean | number).assertEqual(true)
    expect(a).assertEqual(7.9)
    a = false
    b = cast(a)
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

namespace testNS61 {
  function cast(p: Any): string | boolean | int {
    return p as string | boolean | int
  }
  export function runTest(): boolean {
    let a: string | boolean | int = true
    let b: int | string | boolean = cast(a)
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
    b = cast(a)
    expect(b instanceof int | string | boolean).assertEqual(true)
    expect(b instanceof string | boolean | int).assertEqual(true)
    expect(b).assertEqual(5)
    a = b
    expect(a instanceof int | string | boolean).assertEqual(true)
    expect(a instanceof string | boolean | int).assertEqual(true)
    expect(a).assertEqual(5)
    a = "abc"
    b = cast(a)
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

namespace testNS62 {
  function cast(p: Any): String {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("On Review")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("On Review")
    a = "In Progress"
    b = cast(a)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("In Progress")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("In Progress")
    a = "Done"
    b = cast(a)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("Done")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("Done")
    return true
  }
}

function cast9(p: Any): undefined | Object {
  return p as undefined | Object
}

namespace testNS63 {
  function cast(p: Any): undefined | Object {
    return p as Object | undefined
  }
  export function runTest(): boolean {
    let a: Object | undefined = 5n
    let b: undefined | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined).assertEqual(true);
    expect(b instanceof undefined | Object).assertEqual(true);
    expect(b).assertEqual(undefined);
    a = b;
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a).assertEqual(undefined);
    a = "abc";
    b = cast(a);
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

namespace testNS64 {
  function cast(p: Any): undefined | null | Object {
    return p as Object | undefined | null
  }
  export function runTest(): boolean {
    let a: Object | undefined | null = 5n
    let b: undefined | null | Object = cast(a)
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
    b = cast(a);
    expect(b instanceof Object | undefined | null).assertEqual(true);
    expect(b instanceof undefined | null | Object).assertEqual(true);
    expect(b).assertEqual(null);
    a = b;
    expect(a instanceof Object | undefined | null).assertEqual(true);
    expect(a instanceof undefined | null | Object).assertEqual(true);
    expect(a).assertEqual(null);
    a = undefined;
    b = cast(a);
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

namespace testNS65 {
  function cast(p: Any): boolean | number {
    return p as number | boolean
  }
  export function runTest(): boolean {
    let a: number | boolean = true
    let b: boolean | number = cast(a)
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
    b = cast(a);
    expect(b instanceof number | boolean).assertEqual(true);
    expect(b instanceof boolean | number).assertEqual(true);
    expect(b).assertEqual(7.9);
    a = b;
    expect(a instanceof number | boolean).assertEqual(true);
    expect(a instanceof boolean | number).assertEqual(true);
    expect(a).assertEqual(7.9);
    a = false;
    b = cast(a);
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

namespace testNS66 {
  function cast(p: Any): string | boolean | int {
    return p as int | string | boolean
  }
  export function runTest(): boolean {
    let a: int | string | boolean = true
    let b: string | boolean | int = cast(a)
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
    b = cast(a);
    expect(b instanceof int | string | boolean).assertEqual(true);
    expect(b instanceof string | boolean | int).assertEqual(true);
    expect(b).assertEqual(5);
    a = b;
    expect(a instanceof int | string | boolean).assertEqual(true);
    expect(a instanceof string | boolean | int).assertEqual(true);
    expect(a).assertEqual(5);
    a = "abc";
    b = cast(a);
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

namespace testNS67 {
  function cast(p: Any): String {
    return p as String
  }
  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("On Review");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("On Review");
    a = "In Progress";
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("In Progress");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("In Progress");
    a = "Done";
    b = cast(a);
    expect(b instanceof String).assertEqual(true);
    expect(b).assertEqual("Done");
    a = b;
    expect(a instanceof String).assertEqual(true);
    expect(a).assertEqual("Done");
    return true;
  }
}

function cast10(p: Any): undefined | Object {
  return p as Object | undefined
}

export default function UnionTypesIdentityTest(): void {
  describe('UnionTypesIdentityTest', () => {
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
     * @tc.number    SUB_UNION_TYPES_IDENTITY_0100
     * @tc.name      testUnionTypesIdentity0001
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: Object | undefined = 5n
      let b: undefined | Object = a
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
      b = undefined
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(undefined)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(undefined)
      b = "abc"
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual("abc")
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual("abc")
      expect(testNS1.runTest()).assertEqual(true)
      expect(testNS2.runTest()).assertEqual(true)
      expect(testNS3.runTest()).assertEqual(true)
      expect(testNS4.runTest()).assertEqual(true)
      expect(testNS5.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_0200
     * @tc.name      testUnionTypesIdentity0002
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: undefined | Object = 5n
      let b: Object | undefined = a
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
      b = undefined;
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      b = "abc";
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");
      expect(testNS6.runTest()).assertEqual(true);
      expect(testNS7.runTest()).assertEqual(true);
      expect(testNS8.runTest()).assertEqual(true);
      expect(testNS9.runTest()).assertEqual(true);
      expect(testNS10.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_0300
     * @tc.name      testUnionTypesIdentity0003
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: Cat | Dog | Frog | number = new Cat()
      let b: number | Dog | Cat | Frog = a
      expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
      expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
      check_cat(a)
      expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
      expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
      check_cat(b)
      a = b
      expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
      expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
      check_cat(a)
      b = 7.8
      expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
      expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
      check_number(b)
      a = b
      expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
      expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
      check_number(a)
      b = new Dog()
      expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
      expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
      check_dog(b)
      a = b
      expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
      expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
      check_dog(a)
      b = new Frog()
      expect(b instanceof Cat | Dog | Frog | number).assertEqual(true);
      expect(b instanceof number | Dog | Cat | Frog).assertEqual(true);
      check_frog(b)
      a = b
      expect(a instanceof Cat | Dog | Frog | number).assertEqual(true);
      expect(a instanceof number | Dog | Cat | Frog).assertEqual(true);
      check_frog(a)

      expect(testNS11.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_0400
     * @tc.name      testUnionTypesIdentity0004
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: number | Dog1 | Cat1 | Frog1 = new Cat1()
      let b: Cat1 | Dog1 | Frog1 | number = a
      expect(a instanceof Cat1 | Dog1 | Frog1 | number).assertEqual(true);
      expect(a instanceof number | Dog1 | Cat1 | Frog1).assertEqual(true);
      check_cat1(a)
      expect(b instanceof Cat1 | Dog1 | Frog1 | number).assertEqual(true);
      expect(b instanceof number | Dog1 | Cat1 | Frog1).assertEqual(true);
      check_cat1(b)
      a = b
      expect(a instanceof Cat1 | Dog1 | Frog1 | number).assertEqual(true);
      expect(a instanceof number | Dog1 | Cat1 | Frog1).assertEqual(true);
      check_cat1(a)
      b = 7.8
      expect(b instanceof Cat1 | Dog1 | Frog1 | number).assertEqual(true);
      expect(b instanceof number | Dog1 | Cat1 | Frog1).assertEqual(true);
      check_number1(b)
      a = b
      expect(a instanceof Cat1 | Dog1 | Frog1 | number).assertEqual(true);
      expect(a instanceof number | Dog1 | Cat1 | Frog1).assertEqual(true);
      check_number1(a)
      b = new Dog1()
      expect(b instanceof Cat1 | Dog1 | Frog1 | number).assertEqual(true);
      expect(b instanceof number | Dog1 | Cat1 | Frog1).assertEqual(true);
      check_dog1(b)
      a = b
      expect(a instanceof Cat1 | Dog1 | Frog1 | number).assertEqual(true);
      expect(a instanceof number | Dog1 | Cat1 | Frog1).assertEqual(true);
      check_dog1(a)
      b = new Frog1()
      expect(b instanceof Cat1 | Dog1 | Frog1 | number).assertEqual(true);
      expect(b instanceof number | Dog1 | Cat1 | Frog1).assertEqual(true);
      check_frog1(b)
      a = b
      expect(a instanceof Cat1 | Dog1 | Frog1 | number).assertEqual(true);
      expect(a instanceof number | Dog1 | Cat1 | Frog1).assertEqual(true);
      check_frog1(a)

      expect(testNS12.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_0500
     * @tc.name      testUnionTypesIdentity0005
     * @tc.desc      Checking Union types A and B are identical on predefined types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: Object | undefined = 5n
      let b: undefined | Object = cast(a)
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
      b = cast(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = cast(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");
      expect(testNS13.runTest()).assertEqual(true);
      expect(testNS14.runTest()).assertEqual(true);
      expect(testNS15.runTest()).assertEqual(true);
      expect(testNS16.runTest()).assertEqual(true);
      expect(testNS17.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_0600
     * @tc.name      testUnionTypesIdentity0006
     * @tc.desc      Checking Union types A and B are identical on predefined types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: undefined | Object = 5n
      let b: Object | undefined = cast1(a)
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
      b = cast1(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = cast1(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");
      expect(testNS18.runTest()).assertEqual(true);
      expect(testNS19.runTest()).assertEqual(true);
      expect(testNS20.runTest()).assertEqual(true);
      expect(testNS21.runTest()).assertEqual(true);
      expect(testNS22.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_0700
     * @tc.name      testUnionTypesIdentity0007
     * @tc.desc      Checking Union types A and B are identical on predefined types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: Object | undefined = 5n
      let b: undefined | Object = cast2(a)
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
      b = cast2(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = cast2(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");
      expect(testNS23.runTest()).assertEqual(true);
      expect(testNS24.runTest()).assertEqual(true);
      expect(testNS25.runTest()).assertEqual(true);
      expect(testNS26.runTest()).assertEqual(true);
      expect(testNS27.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_0800
     * @tc.name      testUnionTypesIdentity0008
     * @tc.desc      Checking Union types A and B are identical on predefined types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: undefined | Object = 5n
      let b: Object | undefined = cast3(a)
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
      b = cast3(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = cast3(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");
      expect(testNS28.runTest()).assertEqual(true);
      expect(testNS29.runTest()).assertEqual(true);
      expect(testNS30.runTest()).assertEqual(true);
      expect(testNS31.runTest()).assertEqual(true);
      expect(testNS32.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_0900
     * @tc.name      testUnionTypesIdentity0009
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object | undefined = 5n
      let b: undefined | Object = cast4(a)
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
      b = cast4(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = cast4(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");
      expect(testNS33.runTest()).assertEqual(true);
      expect(testNS34.runTest()).assertEqual(true);
      expect(testNS35.runTest()).assertEqual(true);
      expect(testNS36.runTest()).assertEqual(true);
      expect(testNS37.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_1000
     * @tc.name      testUnionTypesIdentity0010
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: undefined | Object = 5n
      let b: Object | undefined = cast5(a)
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
      b = cast5(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(undefined)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(undefined)
      a = "abc"
      b = cast5(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual("abc")
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual("abc")
      expect(testNS38.runTest()).assertEqual(true)
      expect(testNS39.runTest()).assertEqual(true)
      expect(testNS40.runTest()).assertEqual(true)
      expect(testNS41.runTest()).assertEqual(true)
      expect(testNS42.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_1100
     * @tc.name      testUnionTypesIdentity0011
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object | undefined = 5n
      let b: undefined | Object = cast6(a)
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
      b = cast6(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = cast6(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");
      expect(testNS43.runTest()).assertEqual(true);
      expect(testNS44.runTest()).assertEqual(true);
      expect(testNS45.runTest()).assertEqual(true);
      expect(testNS46.runTest()).assertEqual(true);
      expect(testNS47.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_1200
     * @tc.name      testUnionTypesIdentity0012
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: undefined | Object = 5n
      let b: Object | undefined = cast7(a)
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
      b = cast7(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(undefined)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(undefined)
      a = "abc"
      b = cast7(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual("abc")
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual("abc")
      expect(testNS48.runTest()).assertEqual(true)
      expect(testNS49.runTest()).assertEqual(true)
      expect(testNS50.runTest()).assertEqual(true)
      expect(testNS51.runTest()).assertEqual(true)
      expect(testNS52.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_1300
     * @tc.name      testUnionTypesIdentity0013
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object | undefined = 5n
      let b: undefined | Object = cast8(a)
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
      b = cast8(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = cast8(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");
      expect(testNS53.runTest()).assertEqual(true);
      expect(testNS54.runTest()).assertEqual(true);
      expect(testNS55.runTest()).assertEqual(true);
      expect(testNS56.runTest()).assertEqual(true);
      expect(testNS57.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_1400
     * @tc.name      testUnionTypesIdentity0014
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: undefined | Object = 5n
      let b: Object | undefined = cast9(a)
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
      b = cast9(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(undefined)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(undefined)
      a = "abc"
      b = cast9(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual("abc")
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual("abc")
      expect(testNS58.runTest()).assertEqual(true)
      expect(testNS59.runTest()).assertEqual(true)
      expect(testNS60.runTest()).assertEqual(true)
      expect(testNS61.runTest()).assertEqual(true)
      expect(testNS62.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_1500
     * @tc.name      testUnionTypesIdentity0015
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object | undefined = 5n
      let b: undefined | Object = cast10(a)
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
      b = cast10(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual(undefined);
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual(undefined);
      a = "abc";
      b = cast10(a);
      expect(b instanceof Object | undefined).assertEqual(true);
      expect(b instanceof undefined | Object).assertEqual(true);
      expect(b).assertEqual("abc");
      a = b;
      expect(a instanceof Object | undefined).assertEqual(true);
      expect(a instanceof undefined | Object).assertEqual(true);
      expect(a).assertEqual("abc");
      expect(testNS63.runTest()).assertEqual(true);
      expect(testNS64.runTest()).assertEqual(true);
      expect(testNS65.runTest()).assertEqual(true);
      expect(testNS66.runTest()).assertEqual(true);
      expect(testNS67.runTest()).assertEqual(true);
    });
  })
}