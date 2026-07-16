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
import Utils from '../../Util.test'

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
      await Utils.msSleep(30);
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
  })
}
