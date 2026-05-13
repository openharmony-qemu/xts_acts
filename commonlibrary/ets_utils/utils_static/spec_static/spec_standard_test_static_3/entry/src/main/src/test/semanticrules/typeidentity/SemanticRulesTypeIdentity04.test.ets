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

namespace testNS184 {
  function foo102(p: (Object | undefined)[]): (undefined | Object)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = foo102(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertEqual(undefined);
    expect(b[2]).assertEqual("abc");

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertEqual(undefined);
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS185 {
  function foo103(p: (Object | undefined | null)[]): (undefined | null | Object)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = foo103(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertEqual(null);
    expect(b[2]).assertEqual(undefined);

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertEqual(null);
    expect(a[2]).assertEqual(undefined);

    return true;
  }
}

namespace testNS186 {
  function foo104(p: (number | boolean)[]): (boolean | number)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = foo104(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(true);
    expect(b[1]).assertEqual(7.9);
    expect(b[2]).assertEqual(false);

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(true);
    expect(a[1]).assertEqual(7.9);
    expect(a[2]).assertEqual(false);

    return true;
  }
}

namespace testNS187 {
  function foo105(p: (number | string | boolean)[]): (string | boolean | number)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = foo105(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(true);
    expect(b[1]).assertEqual(5);
    expect(b[2]).assertEqual("abc");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(true);
    expect(a[1]).assertEqual(5);
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS188 {
  function foo106(p: (String)[]): (String)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (String)[] = ["On Review", "In Progress", "Done"];
    let b: Array<String> = foo106(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual("On Review");
    expect(b[1]).assertEqual("In Progress");
    expect(b[2]).assertEqual("Done");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual("On Review");
    expect(a[1]).assertEqual("In Progress");
    expect(a[2]).assertEqual("Done");

    return true;
  }
}

function foo107(p: (Object | undefined)[]): (undefined | Object)[] {
  return p;
}

namespace testNS189 {
  function foo(p: (undefined | Object)[]): (Object | undefined)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = foo(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);

    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertEqual(undefined);
    expect(b[2]).assertEqual("abc");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);

    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertEqual(undefined);
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS190 {
  function foo(p: (undefined | null | Object)[]): (Object | undefined | null)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = foo(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);

    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertEqual(null);
    expect(b[2]).assertEqual(undefined);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);

    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertEqual(null);
    expect(a[2]).assertEqual(undefined);

    return true;
  }
}

namespace testNS191 {
  function foo(p: (boolean | number)[]): (number | boolean)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = foo(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);

    expect(b[0]).assertEqual(true);
    expect(b[1]).assertEqual(7.9);
    expect(b[2]).assertEqual(false);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);

    expect(a[0]).assertEqual(true);
    expect(a[1]).assertEqual(7.9);
    expect(a[2]).assertEqual(false);

    return true;
  }
}

namespace testNS192 {
  function foo(p: (string | boolean | number)[]): (number | string | boolean)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = foo(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);

    expect(b[0]).assertEqual(true);
    expect(b[1]).assertEqual(5);
    expect(b[2]).assertEqual("abc");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);

    expect(a[0]).assertEqual(true);
    expect(a[1]).assertEqual(5);
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS193 {
  function foo(p: (String)[]): (String)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (String)[] = ["On Review", "In Progress", "Done"];
    let b: Array<String> = foo(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);

    expect(b[0]).assertEqual("On Review");
    expect(b[1]).assertEqual("In Progress");
    expect(b[2]).assertEqual("Done");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);

    expect(a[0]).assertEqual("On Review");
    expect(a[1]).assertEqual("In Progress");
    expect(a[2]).assertEqual("Done");

    return true;
  }
}

function foo(p: (undefined | Object)[]): (Object | undefined)[] {
  return p;
}


namespace testNS194 {
  function foo109(p: (undefined | Object)[]): (Object | undefined)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = foo109(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertEqual(undefined);
    expect(b[2]).assertEqual("abc");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertEqual(undefined);
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS195 {
  function foo110(p: (undefined | null | Object)[]): (Object | undefined | null)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = foo110(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertEqual(null);
    expect(b[2]).assertEqual(undefined);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertEqual(null);
    expect(a[2]).assertEqual(undefined);

    return true;
  }
}

namespace testNS196 {
  function foo111(p: (boolean | number)[]): (number | boolean)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = foo111(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(true);
    expect(b[1]).assertEqual(7.9);
    expect(b[2]).assertEqual(false);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(true);
    expect(a[1]).assertEqual(7.9);
    expect(a[2]).assertEqual(false);

    return true;
  }
}

namespace testNS197 {
  function foo112(p: (string | boolean | number)[]): (number | string | boolean)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = foo112(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(true);
    expect(b[1]).assertEqual(5);
    expect(b[2]).assertEqual("abc");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(true);
    expect(a[1]).assertEqual(5);
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS198 {
  function foo113(p: (String)[]): (String)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: (String)[] = ["On Review", "In Progress", "Done"];
    let b: Array<String> = foo113(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual("On Review");
    expect(b[1]).assertEqual("In Progress");
    expect(b[2]).assertEqual("Done");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual("On Review");
    expect(a[1]).assertEqual("In Progress");
    expect(a[2]).assertEqual("Done");

    return true;
  }
}

namespace testNS199 {
  function foo18(p: (undefined | Object)[]): (Object | undefined)[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"]
    let b: (undefined | Object)[] = foo18(a)
    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertEqual(undefined);
    expect(b[2]).assertEqual("abc");
    a = b
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertEqual(undefined);
    expect(a[2]).assertEqual("abc");
    return true
  }
}

namespace testNS200 {
  function foo18(p: (undefined | null | Object)[]): (Object | undefined | null)[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined]
    let b: (undefined | null | Object)[] = foo18(a)
    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertEqual(null);
    expect(b[2]).assertEqual(undefined);
    a = b
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertEqual(null);
    expect(a[2]).assertEqual(undefined);
    return true
  }
}

namespace testNS201 {
  function foo18(p: (boolean | number)[]): (number | boolean)[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false]
    let b: (boolean | number)[] = foo18(a)
    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(true);
    expect(b[1]).assertEqual(7.9);
    expect(b[2]).assertEqual(false);
    a = b
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(true);
    expect(a[1]).assertEqual(7.9);
    expect(a[2]).assertEqual(false);
    return true
  }
}

namespace testNS202 {
  function foo18(p: (string | boolean | number)[]): (number | string | boolean)[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"]
    let b: (string | boolean | number)[] = foo18(a)
    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(true);
    expect(b[1]).assertEqual(5);
    expect(b[2]).assertEqual("abc");
    a = b
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(true);
    expect(a[1]).assertEqual(5);
    expect(a[2]).assertEqual("abc");
    return true
  }
}

namespace testNS203 {
  function foo18(p: (String)[]): (String)[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<String> = ["On Review", "In Progress", "Done"]
    let b: (String)[] = foo18(a)
    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual("On Review");
    expect(b[1]).assertEqual("In Progress");
    expect(b[2]).assertEqual("Done");
    a = b
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual("On Review");
    expect(a[1]).assertEqual("In Progress");
    expect(a[2]).assertEqual("Done");
    return true
  }
}

function foo18(p: (undefined | Object)[]): (Object | undefined)[] {
  return p
}

namespace testNS204{
  class Cat19 {v: string = "cat"}
  class Dog19 {v: bigint = 123n}
  class Frog19 {v: number = 5}

  function check_cat19(a: Cat19 | Dog19 | Frog19 | number) {
    expect(a instanceof Cat19).assertTrue();
    expect((a as Cat19).v).assertEqual("cat");
  }

  function check_dog19(a: Cat19 | Dog19 | Frog19 | number) {
    expect(a instanceof Dog19).assertTrue();
    expect((a as Dog19).v).assertEqual(123n);
  }

  function check_frog19(a: Cat19 | Dog19 | Frog19 | number) {
    expect(a instanceof Frog19).assertTrue();
    expect((a as Frog19).v).assertEqual(5);
  }

  function check_number19(a: Cat19 | Dog19 | Frog19 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo19(p: Array<Cat19 | Dog19 | Frog19 | number>): Array<number | Dog19 | Cat19 | Frog19> {
    return p
  }

  export function runTest(): boolean {
    let a: (Cat19 | Dog19 | Frog19 | number)[] = [new Cat19(), 7.8, new Dog19(), new Frog19()]
    let b: Array<number | Dog19 | Cat19 | Frog19> = foo19(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat19).assertTrue();
    check_cat19(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog19).assertTrue();
    check_dog19(b[2])

    expect(b[3] instanceof Frog19).assertTrue();
    check_frog19(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat19).assertTrue();
    check_cat19(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog19).assertTrue();
    check_dog19(a[2])

    expect(a[3] instanceof Frog19).assertTrue();
    check_frog19(a[3])

    return true
  }
}

class Cat19 {v: string = "cat"}
class Dog19 {v: bigint = 123n}
class Frog19 {v: number = 5}

function check_cat19(a: Cat19 | Dog19 | Frog19 | number) {
  expect(a instanceof Cat19).assertTrue();
  expect((a as Cat19).v).assertEqual("cat");
}

function check_dog19(a: Cat19 | Dog19 | Frog19 | number) {
  expect(a instanceof Dog19).assertTrue();
  expect((a as Dog19).v).assertEqual(123n);
}

function check_frog19(a: Cat19 | Dog19 | Frog19 | number) {
  expect(a instanceof Frog19).assertTrue();
  expect((a as Frog19).v).assertEqual(5);
}

function check_number19(a: Cat19 | Dog19 | Frog19 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo19(p: Array<Cat19 | Dog19 | Frog19 | number>): Array<number | Dog19 | Cat19 | Frog19> {
  return p
}

namespace testNS205 {
  class Cat20 { v: string = "cat" }
  class Dog20 { v: bigint = 123n }
  class Frog20 { v: number = 5 }

  function check_cat20(a: Cat20 | Dog20 | Frog20 | number) {
    expect(a instanceof Cat20).assertTrue();
    expect((a as Cat20).v).assertEqual("cat");
  }

  function check_dog20(a: Cat20 | Dog20 | Frog20 | number) {
    expect(a instanceof Dog20).assertTrue();
    expect((a as Dog20).v).assertEqual(123n);
  }

  function check_frog20(a: Cat20 | Dog20 | Frog20 | number) {
    expect(a instanceof Frog20).assertTrue();
    expect((a as Frog20).v).assertEqual(5);
  }

  function check_number20(a: Cat20 | Dog20 | Frog20 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo20(p: Array<Cat20 | Dog20 | Frog20 | number>): Array<number | Dog20 | Cat20 | Frog20> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Cat20 | Dog20 | Frog20 | number> = [new Cat20(), 7.8, new Dog20(), new Frog20()]
    let b: (number | Dog20 | Cat20 | Frog20)[] = foo20(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat20).assertTrue();
    check_cat20(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog20).assertTrue();
    check_dog20(b[2])

    expect(b[3] instanceof Frog20).assertTrue();
    check_frog20(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat20).assertTrue();
    check_cat20(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog20).assertTrue();
    check_dog20(a[2])

    expect(a[3] instanceof Frog20).assertTrue();
    check_frog20(a[3])

    return true
  }
}

class Cat20 { v: string = "cat" }
class Dog20 { v: bigint = 123n }
class Frog20 { v: number = 5 }

function check_cat20(a: Cat20 | Dog20 | Frog20 | number) {
  expect(a instanceof Cat20).assertTrue();
  expect((a as Cat20).v).assertEqual("cat");
}

function check_dog20(a: Cat20 | Dog20 | Frog20 | number) {
  expect(a instanceof Dog20).assertTrue();
  expect((a as Dog20).v).assertEqual(123n);
}

function check_frog20(a: Cat20 | Dog20 | Frog20 | number) {
  expect(a instanceof Frog20).assertTrue();
  expect((a as Frog20).v).assertEqual(5);
}

function check_number20(a: Cat20 | Dog20 | Frog20 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo20(p: Array<Cat20 | Dog20 | Frog20 | number>): Array<number | Dog20 | Cat20 | Frog20> {
  return p
}

namespace testNS206 {
  class Cat21 { v: string = "cat" }
  class Dog21 { v: bigint = 123n }
  class Frog21 { v: number = 5 }

  function check_cat21(a: Cat21 | Dog21 | Frog21 | number) {
    expect(a instanceof Cat21).assertTrue();
    expect((a as Cat21).v).assertEqual("cat");
  }

  function check_dog21(a: Cat21 | Dog21 | Frog21 | number) {
    expect(a instanceof Dog21).assertTrue();
    expect((a as Dog21).v).assertEqual(123n);
  }

  function check_frog21(a: Cat21 | Dog21 | Frog21 | number) {
    expect(a instanceof Frog21).assertTrue();
    expect((a as Frog21).v).assertEqual(5);
  }

  function check_number21(a: Cat21 | Dog21 | Frog21 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo21(p: Array<number | Dog21 | Cat21 | Frog21>): Array<Cat21 | Dog21 | Frog21 | number> {
    return p
  }

  export function runTest(): boolean {
    let a: (Cat21 | Dog21 | Frog21 | number)[] = [new Cat21(), 7.8, new Dog21(), new Frog21()]
    let b: Array<number | Dog21 | Cat21 | Frog21> = foo21(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat21).assertTrue();
    check_cat21(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog21).assertTrue();
    check_dog21(b[2])

    expect(b[3] instanceof Frog21).assertTrue();
    check_frog21(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat21).assertTrue();
    check_cat21(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog21).assertTrue();
    check_dog21(a[2])

    expect(a[3] instanceof Frog21).assertTrue();
    check_frog21(a[3])

    return true
  }
}

class Cat21 { v: string = "cat" }
class Dog21 { v: bigint = 123n }
class Frog21 { v: number = 5 }

function check_cat21(a: Cat21 | Dog21 | Frog21 | number) {
  expect(a instanceof Cat21).assertTrue();
  expect((a as Cat21).v).assertEqual("cat");
}

function check_dog21(a: Cat21 | Dog21 | Frog21 | number) {
  expect(a instanceof Dog21).assertTrue();
  expect((a as Dog21).v).assertEqual(123n);
}

function check_frog21(a: Cat21 | Dog21 | Frog21 | number) {
  expect(a instanceof Frog21).assertTrue();
  expect((a as Frog21).v).assertEqual(5);
}

function check_number21(a: Cat21 | Dog21 | Frog21 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo21(p: Array<number | Dog21 | Cat21 | Frog21>): Array<Cat21 | Dog21 | Frog21 | number> {
  return p
}

namespace testNS207 {
  class Cat22 { v: string = "cat" }
  class Dog22 { v: bigint = 123n }
  class Frog22 { v: number = 5 }

  function check_cat22(a: Cat22 | Dog22 | Frog22 | number) {
    expect(a instanceof Cat22).assertTrue();
    expect((a as Cat22).v).assertEqual("cat");
  }

  function check_dog22(a: Cat22 | Dog22 | Frog22 | number) {
    expect(a instanceof Dog22).assertTrue();
    expect((a as Dog22).v).assertEqual(123n);
  }

  function check_frog22(a: Cat22 | Dog22 | Frog22 | number) {
    expect(a instanceof Frog22).assertTrue();
    expect((a as Frog22).v).assertEqual(5);
  }

  function check_number22(a: Cat22 | Dog22 | Frog22 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo22(p: Array<number | Dog22 | Cat22 | Frog22>): Array<Cat22 | Dog22 | Frog22 | number> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Cat22 | Dog22 | Frog22 | number> = [new Cat22(), 7.8, new Dog22(), new Frog22()]
    let b: (number | Dog22 | Cat22 | Frog22)[] = foo22(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat22).assertTrue();
    check_cat22(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog22).assertTrue();
    check_dog22(b[2])

    expect(b[3] instanceof Frog22).assertTrue();
    check_frog22(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat22).assertTrue();
    check_cat22(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog22).assertTrue();
    check_dog22(a[2])

    expect(a[3] instanceof Frog22).assertTrue();
    check_frog22(a[3])

    return true
  }
}

class Cat22 { v: string = "cat" }
class Dog22 { v: bigint = 123n }
class Frog22 { v: number = 5 }

function check_cat22(a: Cat22 | Dog22 | Frog22 | number) {
  expect(a instanceof Cat22).assertTrue();
  expect((a as Cat22).v).assertEqual("cat");
}

function check_dog22(a: Cat22 | Dog22 | Frog22 | number) {
  expect(a instanceof Dog22).assertTrue();
  expect((a as Dog22).v).assertEqual(123n);
}

function check_frog22(a: Cat22 | Dog22 | Frog22 | number) {
  expect(a instanceof Frog22).assertTrue();
  expect((a as Frog22).v).assertEqual(5);
}

function check_number22(a: Cat22 | Dog22 | Frog22 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo22(p: Array<number | Dog22 | Cat22 | Frog22>): Array<Cat22 | Dog22 | Frog22 | number> {
  return p
}

namespace testNS208 {
  class Cat23 { v: string = "cat" }
  class Dog23 { v: bigint = 123n }
  class Frog23 { v: number = 5 }

  function check_cat23(a: Cat23 | Dog23 | Frog23 | number) {
    expect(a instanceof Cat23).assertTrue();
    expect((a as Cat23).v).assertEqual("cat");
  }

  function check_dog23(a: Cat23 | Dog23 | Frog23 | number) {
    expect(a instanceof Dog23).assertTrue();
    expect((a as Dog23).v).assertEqual(123n);
  }

  function check_frog23(a: Cat23 | Dog23 | Frog23 | number) {
    expect(a instanceof Frog23).assertTrue();
    expect((a as Frog23).v).assertEqual(5);
  }

  function check_number23(a: Cat23 | Dog23 | Frog23 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo23(p: Array<Cat23 | Dog23 | Frog23 | number>): (Cat23 | Dog23 | Frog23 | number)[] {
    return p
  }

  export function runTest(): boolean {
    let a: (Cat23 | Dog23 | Frog23 | number)[] = [new Cat23(), 7.8, new Dog23(), new Frog23()]
    let b: Array<number | Dog23 | Cat23 | Frog23> = foo23(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat23).assertTrue();
    check_cat23(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog23).assertTrue();
    check_dog23(b[2])

    expect(b[3] instanceof Frog23).assertTrue();
    check_frog23(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat23).assertTrue();
    check_cat23(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog23).assertTrue();
    check_dog23(a[2])

    expect(a[3] instanceof Frog23).assertTrue();
    check_frog23(a[3])

    return true
  }
}

class Cat23 { v: string = "cat" }
class Dog23 { v: bigint = 123n }
class Frog23 { v: number = 5 }

function check_cat23(a: Cat23 | Dog23 | Frog23 | number) {
  expect(a instanceof Cat23).assertTrue();
  expect((a as Cat23).v).assertEqual("cat");
}

function check_dog23(a: Cat23 | Dog23 | Frog23 | number) {
  expect(a instanceof Dog23).assertTrue();
  expect((a as Dog23).v).assertEqual(123n);
}

function check_frog23(a: Cat23 | Dog23 | Frog23 | number) {
  expect(a instanceof Frog23).assertTrue();
  expect((a as Frog23).v).assertEqual(5);
}

function check_number23(a: Cat23 | Dog23 | Frog23 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo23(p: Array<Cat23 | Dog23 | Frog23 | number>): (Cat23 | Dog23 | Frog23 | number)[] {
  return p
}

namespace testNS209 {
  class Cat24 { v: string = "cat" }
  class Dog24 { v: bigint = 123n }
  class Frog24 { v: number = 5 }

  function check_cat24(a: Cat24 | Dog24 | Frog24 | number) {
    expect(a instanceof Cat24).assertTrue();
    expect((a as Cat24).v).assertEqual("cat");
  }

  function check_dog24(a: Cat24 | Dog24 | Frog24 | number) {
    expect(a instanceof Dog24).assertTrue();
    expect((a as Dog24).v).assertEqual(123n);
  }

  function check_frog24(a: Cat24 | Dog24 | Frog24 | number) {
    expect(a instanceof Frog24).assertTrue();
    expect((a as Frog24).v).assertEqual(5);
  }

  function check_number24(a: Cat24 | Dog24 | Frog24 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo24(p: Array<Cat24 | Dog24 | Frog24 | number>): (Cat24 | Dog24 | Frog24 | number)[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Cat24 | Dog24 | Frog24 | number> = [new Cat24(), 7.8, new Dog24(), new Frog24()]
    let b: (number | Dog24 | Cat24 | Frog24)[] = foo24(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat24).assertTrue();
    check_cat24(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog24).assertTrue();
    check_dog24(b[2])

    expect(b[3] instanceof Frog24).assertTrue();
    check_frog24(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat24).assertTrue();
    check_cat24(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog24).assertTrue();
    check_dog24(a[2])

    expect(a[3] instanceof Frog24).assertTrue();
    check_frog24(a[3])

    return true
  }
}

class Cat24 { v: string = "cat" }
class Dog24 { v: bigint = 123n }
class Frog24 { v: number = 5 }

function check_cat24(a: Cat24 | Dog24 | Frog24 | number) {
  expect(a instanceof Cat24).assertTrue();
  expect((a as Cat24).v).assertEqual("cat");
}

function check_dog24(a: Cat24 | Dog24 | Frog24 | number) {
  expect(a instanceof Dog24).assertTrue();
  expect((a as Dog24).v).assertEqual(123n);
}

function check_frog24(a: Cat24 | Dog24 | Frog24 | number) {
  expect(a instanceof Frog24).assertTrue();
  expect((a as Frog24).v).assertEqual(5);
}

function check_number24(a: Cat24 | Dog24 | Frog24 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo24(p: Array<Cat24 | Dog24 | Frog24 | number>): (Cat24 | Dog24 | Frog24 | number)[] {
  return p
}

namespace testNS210 {
  class Cat25 { v: string = "cat" }
  class Dog25 { v: bigint = 123n }
  class Frog25 { v: number = 5 }

  function check_cat25(a: Cat25 | Dog25 | Frog25 | number) {
    expect(a instanceof Cat25).assertTrue();
    expect((a as Cat25).v).assertEqual("cat");
  }

  function check_dog25(a: Cat25 | Dog25 | Frog25 | number) {
    expect(a instanceof Dog25).assertTrue();
    expect((a as Dog25).v).assertEqual(123n);
  }

  function check_frog25(a: Cat25 | Dog25 | Frog25 | number) {
    expect(a instanceof Frog25).assertTrue();
    expect((a as Frog25).v).assertEqual(5);
  }

  function check_number25(a: Cat25 | Dog25 | Frog25 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo25(p: Array<Cat25 | Dog25 | Frog25 | number>): (number | Dog25 | Cat25 | Frog25)[] {
    return p
  }

  export function runTest(): boolean {
    let a: (Cat25 | Dog25 | Frog25 | number)[] = [new Cat25(), 7.8, new Dog25(), new Frog25()]
    let b: Array<number | Dog25 | Cat25 | Frog25> = foo25(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat25).assertTrue();
    check_cat25(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog25).assertTrue();
    check_dog25(b[2])

    expect(b[3] instanceof Frog25).assertTrue();
    check_frog25(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat25).assertTrue();
    check_cat25(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog25).assertTrue();
    check_dog25(a[2])

    expect(a[3] instanceof Frog25).assertTrue();
    check_frog25(a[3])

    return true
  }
}

class Cat25 { v: string = "cat" }
class Dog25 { v: bigint = 123n }
class Frog25 { v: number = 5 }

function check_cat25(a: Cat25 | Dog25 | Frog25 | number) {
  expect(a instanceof Cat25).assertTrue();
  expect((a as Cat25).v).assertEqual("cat");
}

function check_dog25(a: Cat25 | Dog25 | Frog25 | number) {
  expect(a instanceof Dog25).assertTrue();
  expect((a as Dog25).v).assertEqual(123n);
}

function check_frog25(a: Cat25 | Dog25 | Frog25 | number) {
  expect(a instanceof Frog25).assertTrue();
  expect((a as Frog25).v).assertEqual(5);
}

function check_number25(a: Cat25 | Dog25 | Frog25 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo25(p: Array<Cat25 | Dog25 | Frog25 | number>): (number | Dog25 | Cat25 | Frog25)[] {
  return p
}

namespace testNS211 {
  class Cat26 { v: string = "cat" }
  class Dog26 { v: bigint = 123n }
  class Frog26 { v: number = 5 }

  function check_cat26(a: Cat26 | Dog26 | Frog26 | number) {
    expect(a instanceof Cat26).assertTrue();
    expect((a as Cat26).v).assertEqual("cat");
  }

  function check_dog26(a: Cat26 | Dog26 | Frog26 | number) {
    expect(a instanceof Dog26).assertTrue();
    expect((a as Dog26).v).assertEqual(123n);
  }

  function check_frog26(a: Cat26 | Dog26 | Frog26 | number) {
    expect(a instanceof Frog26).assertTrue();
    expect((a as Frog26).v).assertEqual(5);
  }

  function check_number26(a: Cat26 | Dog26 | Frog26 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo26(p: Array<Cat26 | Dog26 | Frog26 | number>): (number | Dog26 | Cat26 | Frog26)[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Cat26 | Dog26 | Frog26 | number> = [new Cat26(), 7.8, new Dog26(), new Frog26()]
    let b: (number | Dog26 | Cat26 | Frog26)[] = foo26(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat26).assertTrue();
    check_cat26(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog26).assertTrue();
    check_dog26(b[2])

    expect(b[3] instanceof Frog26).assertTrue();
    check_frog26(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat26).assertTrue();
    check_cat26(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog26).assertTrue();
    check_dog26(a[2])

    expect(a[3] instanceof Frog26).assertTrue();
    check_frog26(a[3])

    return true
  }
}

class Cat26 { v: string = "cat" }
class Dog26 { v: bigint = 123n }
class Frog26 { v: number = 5 }

function check_cat26(a: Cat26 | Dog26 | Frog26 | number) {
  expect(a instanceof Cat26).assertTrue();
  expect((a as Cat26).v).assertEqual("cat");
}

function check_dog26(a: Cat26 | Dog26 | Frog26 | number) {
  expect(a instanceof Dog26).assertTrue();
  expect((a as Dog26).v).assertEqual(123n);
}

function check_frog26(a: Cat26 | Dog26 | Frog26 | number) {
  expect(a instanceof Frog26).assertTrue();
  expect((a as Frog26).v).assertEqual(5);
}

function check_number26(a: Cat26 | Dog26 | Frog26 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo26(p: Array<Cat26 | Dog26 | Frog26 | number>): (number | Dog26 | Cat26 | Frog26)[] {
  return p
}

namespace testNS212 {
  class Cat27 { v: string = "cat" }
  class Dog27 { v: bigint = 123n }
  class Frog27 { v: number = 5 }

  function check_cat27(a: Cat27 | Dog27 | Frog27 | number) {
    expect(a instanceof Cat27).assertTrue();
    expect((a as Cat27).v).assertEqual("cat");
  }

  function check_dog27(a: Cat27 | Dog27 | Frog27 | number) {
    expect(a instanceof Dog27).assertTrue();
    expect((a as Dog27).v).assertEqual(123n);
  }

  function check_frog27(a: Cat27 | Dog27 | Frog27 | number) {
    expect(a instanceof Frog27).assertTrue();
    expect((a as Frog27).v).assertEqual(5);
  }

  function check_number27(a: Cat27 | Dog27 | Frog27 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo27(p: Array<number | Dog27 | Cat27 | Frog27>): (Cat27 | Dog27 | Frog27 | number)[] {
    return p
  }

  export function runTest(): boolean {
    let a: (Cat27 | Dog27 | Frog27 | number)[] = [new Cat27(), 7.8, new Dog27(), new Frog27()]
    let b: Array<number | Dog27 | Cat27 | Frog27> = foo27(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat27).assertTrue();
    check_cat27(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog27).assertTrue();
    check_dog27(b[2])

    expect(b[3] instanceof Frog27).assertTrue();
    check_frog27(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat27).assertTrue();
    check_cat27(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog27).assertTrue();
    check_dog27(a[2])

    expect(a[3] instanceof Frog27).assertTrue();
    check_frog27(a[3])

    return true
  }
}

class Cat27 { v: string = "cat" }
class Dog27 { v: bigint = 123n }
class Frog27 { v: number = 5 }

function check_cat27(a: Cat27 | Dog27 | Frog27 | number) {
  expect(a instanceof Cat27).assertTrue();
  expect((a as Cat27).v).assertEqual("cat");
}

function check_dog27(a: Cat27 | Dog27 | Frog27 | number) {
  expect(a instanceof Dog27).assertTrue();
  expect((a as Dog27).v).assertEqual(123n);
}

function check_frog27(a: Cat27 | Dog27 | Frog27 | number) {
  expect(a instanceof Frog27).assertTrue();
  expect((a as Frog27).v).assertEqual(5);
}

function check_number27(a: Cat27 | Dog27 | Frog27 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo27(p: Array<number | Dog27 | Cat27 | Frog27>): (Cat27 | Dog27 | Frog27 | number)[] {
  return p
}

namespace testNS213 {
  class Cat28 { v: string = "cat" }
  class Dog28 { v: bigint = 123n }
  class Frog28 { v: number = 5 }

  function check_cat28(a: Cat28 | Dog28 | Frog28 | number) {
    expect(a instanceof Cat28).assertTrue();
    expect((a as Cat28).v).assertEqual("cat");
  }

  function check_dog28(a: Cat28 | Dog28 | Frog28 | number) {
    expect(a instanceof Dog28).assertTrue();
    expect((a as Dog28).v).assertEqual(123n);
  }

  function check_frog28(a: Cat28 | Dog28 | Frog28 | number) {
    expect(a instanceof Frog28).assertTrue();
    expect((a as Frog28).v).assertEqual(5);
  }

  function check_number28(a: Cat28 | Dog28 | Frog28 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo28(p: Array<number | Dog28 | Cat28 | Frog28>): (Cat28 | Dog28 | Frog28 | number)[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Cat28 | Dog28 | Frog28 | number> = [new Cat28(), 7.8, new Dog28(), new Frog28()]
    let b: (number | Dog28 | Cat28 | Frog28)[] = foo28(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat28).assertTrue();
    check_cat28(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog28).assertTrue();
    check_dog28(b[2])

    expect(b[3] instanceof Frog28).assertTrue();
    check_frog28(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat28).assertTrue();
    check_cat28(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog28).assertTrue();
    check_dog28(a[2])

    expect(a[3] instanceof Frog28).assertTrue();
    check_frog28(a[3])

    return true
  }
}

class Cat28 { v: string = "cat" }
class Dog28 { v: bigint = 123n }
class Frog28 { v: number = 5 }

function check_cat28(a: Cat28 | Dog28 | Frog28 | number) {
  expect(a instanceof Cat28).assertTrue();
  expect((a as Cat28).v).assertEqual("cat");
}

function check_dog28(a: Cat28 | Dog28 | Frog28 | number) {
  expect(a instanceof Dog28).assertTrue();
  expect((a as Dog28).v).assertEqual(123n);
}

function check_frog28(a: Cat28 | Dog28 | Frog28 | number) {
  expect(a instanceof Frog28).assertTrue();
  expect((a as Frog28).v).assertEqual(5);
}

function check_number28(a: Cat28 | Dog28 | Frog28 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo28(p: Array<number | Dog28 | Cat28 | Frog28>): (Cat28 | Dog28 | Frog28 | number)[] {
  return p
}

namespace testNS214 {
  class Cat29 { v: string = "cat" }
  class Dog29 { v: bigint = 123n }
  class Frog29 { v: number = 5 }

  function check_cat29(a: Cat29 | Dog29 | Frog29 | number) {
    expect(a instanceof Cat29).assertTrue();
    expect((a as Cat29).v).assertEqual("cat");
  }

  function check_dog29(a: Cat29 | Dog29 | Frog29 | number) {
    expect(a instanceof Dog29).assertTrue();
    expect((a as Dog29).v).assertEqual(123n);
  }

  function check_frog29(a: Cat29 | Dog29 | Frog29 | number) {
    expect(a instanceof Frog29).assertTrue();
    expect((a as Frog29).v).assertEqual(5);
  }

  function check_number29(a: Cat29 | Dog29 | Frog29 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo40(p: (Cat29 | Dog29 | Frog29 | number)[]): Array<number | Dog29 | Cat29 | Frog29> {
    return p
  }

  export function runTest(): boolean {
    let a: (Cat29 | Dog29 | Frog29 | number)[] = [new Cat29(), 7.8, new Dog29(), new Frog29()]
    let b: Array<number | Dog29 | Cat29 | Frog29> = foo40(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat29).assertTrue();
    check_cat29(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog29).assertTrue();
    check_dog29(b[2])

    expect(b[3] instanceof Frog29).assertTrue();
    check_frog29(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat29).assertTrue();
    check_cat29(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog29).assertTrue();
    check_dog29(a[2])

    expect(a[3] instanceof Frog29).assertTrue();
    check_frog29(a[3])

    return true
  }
}

class Cat29 { v: string = "cat" }
class Dog29 { v: bigint = 123n }
class Frog29 { v: number = 5 }

function check_cat29(a: Cat29 | Dog29 | Frog29 | number) {
  expect(a instanceof Cat29).assertTrue();
  expect((a as Cat29).v).assertEqual("cat");
}

function check_dog29(a: Cat29 | Dog29 | Frog29 | number) {
  expect(a instanceof Dog29).assertTrue();
  expect((a as Dog29).v).assertEqual(123n);
}

function check_frog29(a: Cat29 | Dog29 | Frog29 | number) {
  expect(a instanceof Frog29).assertTrue();
  expect((a as Frog29).v).assertEqual(5);
}

function check_number29(a: Cat29 | Dog29 | Frog29 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo40(p: (Cat29 | Dog29 | Frog29 | number)[]): Array<number | Dog29 | Cat29 | Frog29> {
  return p
}

namespace testNS215 {
  class Cat30 { v: string = "cat" }
  class Dog30 { v: bigint = 123n }
  class Frog30 { v: number = 5 }

  function check_cat30(a: Cat30 | Dog30 | Frog30 | number) {
    expect(a instanceof Cat30).assertTrue();
    expect((a as Cat30).v).assertEqual("cat");
  }

  function check_dog30(a: Cat30 | Dog30 | Frog30 | number) {
    expect(a instanceof Dog30).assertTrue();
    expect((a as Dog30).v).assertEqual(123n);
  }

  function check_frog30(a: Cat30 | Dog30 | Frog30 | number) {
    expect(a instanceof Frog30).assertTrue();
    expect((a as Frog30).v).assertEqual(5);
  }

  function check_number30(a: Cat30 | Dog30 | Frog30 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo30(p: (Cat30 | Dog30 | Frog30 | number)[]): Array<number | Dog30 | Cat30 | Frog30> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Cat30 | Dog30 | Frog30 | number> = [new Cat30(), 7.8, new Dog30(), new Frog30()]
    let b: (number | Dog30 | Cat30 | Frog30)[] = foo30(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat30).assertTrue();
    check_cat30(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog30).assertTrue();
    check_dog30(b[2])

    expect(b[3] instanceof Frog30).assertTrue();
    check_frog30(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat30).assertTrue();
    check_cat30(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog30).assertTrue();
    check_dog30(a[2])

    expect(a[3] instanceof Frog30).assertTrue();
    check_frog30(a[3])

    return true
  }
}

class Cat30 { v: string = "cat" }
class Dog30 { v: bigint = 123n }
class Frog30 { v: number = 5 }

function check_cat30(a: Cat30 | Dog30 | Frog30 | number) {
  expect(a instanceof Cat30).assertTrue();
  expect((a as Cat30).v).assertEqual("cat");
}

function check_dog30(a: Cat30 | Dog30 | Frog30 | number) {
  expect(a instanceof Dog30).assertTrue();
  expect((a as Dog30).v).assertEqual(123n);
}

function check_frog30(a: Cat30 | Dog30 | Frog30 | number) {
  expect(a instanceof Frog30).assertTrue();
  expect((a as Frog30).v).assertEqual(5);
}

function check_number30(a: Cat30 | Dog30 | Frog30 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo30(p: (Cat30 | Dog30 | Frog30 | number)[]): Array<number | Dog30 | Cat30 | Frog30> {
  return p
}
namespace testNS179 {
  function foo96(p: (undefined | Object)[]): Array<Object | undefined> {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = foo96(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertEqual(undefined);
    expect(b[2]).assertEqual("abc");

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertEqual(undefined);
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS180 {
  function foo97(p: (undefined | null | Object)[]): Array<Object | undefined | null> {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = foo97(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertEqual(null);
    expect(b[2]).assertEqual(undefined);

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertEqual(null);
    expect(a[2]).assertEqual(undefined);

    return true;
  }
}

namespace testNS181 {
  function foo98(p: (boolean | number)[]): Array<number | boolean> {
    return p;
  }

  export function runTest():boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = foo98(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(true);
    expect(b[1]).assertEqual(7.9);
    expect(b[2]).assertEqual(false);

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(true);
    expect(a[1]).assertEqual(7.9);
    expect(a[2]).assertEqual(false);

    return true;
  }
}

namespace testNS182 {
  function foo99(p: (string | boolean | number)[]): Array<number | string | boolean> {
    return p;
  }

  export function runTest():boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = foo99(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(true);
    expect(b[1]).assertEqual(5);
    expect(b[2]).assertEqual("abc");

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(true);
    expect(a[1]).assertEqual(5);
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS183 {
  function foo100(p: (String)[]): Array<String> {
    return p;
  }

  export function runTest():boolean {
    let a: Array<String> = ["On Review", "In Progress", "Done"];
    let b: (String)[] = foo100(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual("On Review");
    expect(b[1]).assertEqual("In Progress");
    expect(b[2]).assertEqual("Done");

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual("On Review");
    expect(a[1]).assertEqual("In Progress");
    expect(a[2]).assertEqual("Done");

    return true;
  }
}

function foo101(p: (undefined | Object)[]): Array<Object | undefined> {
  return p;
}


export default function SemanticRulesTypeIdentity04(): void {
  describe('SemanticRulesTypeIdentity04', () => {
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
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_5000
     * @tc.name      testSemanticRulesTypeIdentity0050
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0050';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = foo101(a);

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(3);
        expect(b[0]).assertEqual(5n);
        expect(b[1]).assertEqual(undefined);
        expect(b[2]).assertEqual("abc");

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(3);
        expect(a[0]).assertEqual(5n);
        expect(a[1]).assertEqual(undefined);
        expect(a[2]).assertEqual("abc");

        expect(testNS179.runTest()).assertTrue();
        expect(testNS180.runTest()).assertTrue();
        expect(testNS181.runTest()).assertTrue();
        expect(testNS182.runTest()).assertTrue();
        expect(testNS183.runTest()).assertTrue();
      });
    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_5100
     * @tc.name      testSemanticRulesTypeIdentity0051
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0051';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = foo107(a);

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(3);
        expect(b[0]).assertEqual(5n);
        expect(b[1]).assertEqual(undefined);
        expect(b[2]).assertEqual("abc");

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(3);
        expect(a[0]).assertEqual(5n);
        expect(a[1]).assertEqual(undefined);
        expect(a[2]).assertEqual("abc");

        expect(testNS184.runTest()).assertTrue();
        expect(testNS185.runTest()).assertTrue();
        expect(testNS186.runTest()).assertTrue();
        expect(testNS187.runTest()).assertTrue();
        expect(testNS188.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_5200
     * @tc.name      testSemanticRulesTypeIdentity0052
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0052';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = foo(a);

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(3);

        expect(b[0] instanceof Object || b[0] === undefined).assertTrue();
        expect(b[0] === undefined || b[0] instanceof Object).assertTrue();
        expect(b[0]).assertEqual(5n);

        expect(b[1] instanceof Object || b[1] === undefined).assertTrue();
        expect(b[1] === undefined || b[1] instanceof Object).assertTrue();
        expect(b[1]).assertEqual(undefined);

        expect(b[2] instanceof Object || b[2] === undefined).assertTrue();
        expect(b[2] === undefined || b[2] instanceof Object).assertTrue();
        expect(b[2]).assertEqual("abc");

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(3);

        expect(a[0] instanceof Object || a[0] === undefined).assertTrue();
        expect(a[0] === undefined || a[0] instanceof Object).assertTrue();
        expect(a[0]).assertEqual(5n);

        expect(a[1] instanceof Object || a[1] === undefined).assertTrue();
        expect(a[1] === undefined || a[1] instanceof Object).assertTrue();
        expect(a[1]).assertEqual(undefined);

        expect(a[2] instanceof Object || a[2] === undefined).assertTrue();
        expect(a[2] === undefined || a[2] instanceof Object).assertTrue();
        expect(a[2]).assertEqual("abc");

        expect(testNS189.runTest()).assertTrue();
        expect(testNS190.runTest()).assertTrue();
        expect(testNS191.runTest()).assertTrue();
        expect(testNS192.runTest()).assertTrue();
        expect(testNS193.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_5300
     * @tc.name      testSemanticRulesTypeIdentity0053
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0053';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = foo(a);
        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(3);
        expect(b[0]).assertEqual(5n);
        expect(b[1]).assertEqual(undefined);
        expect(b[2]).assertEqual("abc");
        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(3);
        expect(a[0]).assertEqual(5n);
        expect(a[1]).assertEqual(undefined);
        expect(a[2]).assertEqual("abc");

        expect(testNS194.runTest()).assertTrue();
        expect(testNS195.runTest()).assertTrue();
        expect(testNS196.runTest()).assertTrue();
        expect(testNS197.runTest()).assertTrue();
        expect(testNS198.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_5400
     * @tc.name      testSemanticRulesTypeIdentity0054
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0054';
        let a: Array<Object | undefined> = [5n, undefined, "abc"]
        let b: (undefined | Object)[] = foo18(a)
        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(3);
        expect(b[0]).assertEqual(5n);
        expect(b[1]).assertEqual(undefined);
        expect(b[2]).assertEqual("abc");
        a = b
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(3);
        expect(a[0]).assertEqual(5n);
        expect(a[1]).assertEqual(undefined);
        expect(a[2]).assertEqual("abc");

        expect(testNS199.runTest()).assertTrue();
        expect(testNS200.runTest()).assertTrue();
        expect(testNS201.runTest()).assertTrue();
        expect(testNS202.runTest()).assertTrue();
        expect(testNS203.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_5500
     * @tc.name      testSemanticRulesTypeIdentity0055
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0055';
        let a: (Cat19 | Dog19 | Frog19 | number)[] = [new Cat19(), 7.8, new Dog19(), new Frog19()]
        let b: Array<number | Dog19 | Cat19 | Frog19> = foo19(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat19).assertTrue();
        check_cat19(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog19).assertTrue();
        check_dog19(b[2])

        expect(b[3] instanceof Frog19).assertTrue();
        check_frog19(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat19).assertTrue();
        check_cat19(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog19).assertTrue();
        check_dog19(a[2])

        expect(a[3] instanceof Frog19).assertTrue();
        check_frog19(a[3])

        expect(testNS204.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_5600
     * @tc.name      testSemanticRulesTypeIdentity0056
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0056';
        let a: Array<Cat20 | Dog20 | Frog20 | number> = [new Cat20(), 7.8, new Dog20(), new Frog20()]
        let b: (number | Dog20 | Cat20 | Frog20)[] = foo20(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat20).assertTrue();
        check_cat20(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog20).assertTrue();
        check_dog20(b[2])

        expect(b[3] instanceof Frog20).assertTrue();
        check_frog20(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat20).assertTrue();
        check_cat20(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog20).assertTrue();
        check_dog20(a[2])

        expect(a[3] instanceof Frog20).assertTrue();
        check_frog20(a[3])

        expect(testNS205.runTest()).assertTrue();
      })


    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_5700
     * @tc.name      testSemanticRulesTypeIdentity0057
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0057';
        let a: (Cat21 | Dog21 | Frog21 | number)[] = [new Cat21(), 7.8, new Dog21(), new Frog21()]
        let b: Array<number | Dog21 | Cat21 | Frog21> = foo21(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat21).assertTrue();
        check_cat21(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog21).assertTrue();
        check_dog21(b[2])

        expect(b[3] instanceof Frog21).assertTrue();
        check_frog21(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat21).assertTrue();
        check_cat21(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog21).assertTrue();
        check_dog21(a[2])

        expect(a[3] instanceof Frog21).assertTrue();
        check_frog21(a[3])

        expect(testNS206.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_5800
     * @tc.name      testSemanticRulesTypeIdentity0058
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0058';
        let a: Array<Cat22 | Dog22 | Frog22 | number> = [new Cat22(), 7.8, new Dog22(), new Frog22()]
        let b: (number | Dog22 | Cat22 | Frog22)[] = foo22(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat22).assertTrue();
        check_cat22(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog22).assertTrue();
        check_dog22(b[2])

        expect(b[3] instanceof Frog22).assertTrue();
        check_frog22(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat22).assertTrue();
        check_cat22(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog22).assertTrue();
        check_dog22(a[2])

        expect(a[3] instanceof Frog22).assertTrue();
        check_frog22(a[3])

        expect(testNS207.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_5900
     * @tc.name      testSemanticRulesTypeIdentity0059
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0059';
        let a: (Cat23 | Dog23 | Frog23 | number)[] = [new Cat23(), 7.8, new Dog23(), new Frog23()]
        let b: Array<number | Dog23 | Cat23 | Frog23> = foo23(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat23).assertTrue();
        check_cat23(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog23).assertTrue();
        check_dog23(b[2])

        expect(b[3] instanceof Frog23).assertTrue();
        check_frog23(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat23).assertTrue();
        check_cat23(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog23).assertTrue();
        check_dog23(a[2])

        expect(a[3] instanceof Frog23).assertTrue();
        check_frog23(a[3])

        expect(testNS208.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_6000
     * @tc.name      testSemanticRulesTypeIdentity0060
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0060';
        let a: Array<Cat24 | Dog24 | Frog24 | number> = [new Cat24(), 7.8, new Dog24(), new Frog24()]
        let b: (number | Dog24 | Cat24 | Frog24)[] = foo24(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat24).assertTrue();
        check_cat24(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog24).assertTrue();
        check_dog24(b[2])

        expect(b[3] instanceof Frog24).assertTrue();
        check_frog24(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat24).assertTrue();
        check_cat24(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog24).assertTrue();
        check_dog24(a[2])

        expect(a[3] instanceof Frog24).assertTrue();
        check_frog24(a[3])

        expect(testNS209.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_6100
     * @tc.name      testSemanticRulesTypeIdentity0061
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0061';
        let a: (Cat25 | Dog25 | Frog25 | number)[] = [new Cat25(), 7.8, new Dog25(), new Frog25()]
        let b: Array<number | Dog25 | Cat25 | Frog25> = foo25(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat25).assertTrue();
        check_cat25(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog25).assertTrue();
        check_dog25(b[2])

        expect(b[3] instanceof Frog25).assertTrue();
        check_frog25(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat25).assertTrue();
        check_cat25(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog25).assertTrue();
        check_dog25(a[2])

        expect(a[3] instanceof Frog25).assertTrue();
        check_frog25(a[3])

        expect(testNS210.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_6200
     * @tc.name      testSemanticRulesTypeIdentity0062
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0062';
        let a: Array<Cat26 | Dog26 | Frog26 | number> = [new Cat26(), 7.8, new Dog26(), new Frog26()]
        let b: (number | Dog26 | Cat26 | Frog26)[] = foo26(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat26).assertTrue();
        check_cat26(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog26).assertTrue();
        check_dog26(b[2])

        expect(b[3] instanceof Frog26).assertTrue();
        check_frog26(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat26).assertTrue();
        check_cat26(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog26).assertTrue();
        check_dog26(a[2])

        expect(a[3] instanceof Frog26).assertTrue();
        check_frog26(a[3])

        expect(testNS211.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_6300
     * @tc.name      testSemanticRulesTypeIdentity0063
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0063';

        let a: (Cat27 | Dog27 | Frog27 | number)[] = [new Cat27(), 7.8, new Dog27(), new Frog27()]
        let b: Array<number | Dog27 | Cat27 | Frog27> = foo27(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat27).assertTrue();
        check_cat27(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog27).assertTrue();
        check_dog27(b[2])

        expect(b[3] instanceof Frog27).assertTrue();
        check_frog27(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat27).assertTrue();
        check_cat27(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog27).assertTrue();
        check_dog27(a[2])

        expect(a[3] instanceof Frog27).assertTrue();
        check_frog27(a[3])

        expect(testNS212.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_6400
     * @tc.name      testSemanticRulesTypeIdentity0064
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0064';

        let a: Array<Cat28 | Dog28 | Frog28 | number> = [new Cat28(), 7.8, new Dog28(), new Frog28()]
        let b: (number | Dog28 | Cat28 | Frog28)[] = foo28(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat28).assertTrue();
        check_cat28(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog28).assertTrue();
        check_dog28(b[2])

        expect(b[3] instanceof Frog28).assertTrue();
        check_frog28(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat28).assertTrue();
        check_cat28(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog28).assertTrue();
        check_dog28(a[2])

        expect(a[3] instanceof Frog28).assertTrue();
        check_frog28(a[3])

        expect(testNS213.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_6500
     * @tc.name      testSemanticRulesTypeIdentity0065
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0065';
        let a: (Cat29 | Dog29 | Frog29 | number)[] = [new Cat29(), 7.8, new Dog29(), new Frog29()]
        let b: Array<number | Dog29 | Cat29 | Frog29> = foo40(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat29).assertTrue();
        check_cat29(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog29).assertTrue();
        check_dog29(b[2])

        expect(b[3] instanceof Frog29).assertTrue();
        check_frog29(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat29).assertTrue();
        check_cat29(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog29).assertTrue();
        check_dog29(a[2])

        expect(a[3] instanceof Frog29).assertTrue();
        check_frog29(a[3])

        expect(testNS214.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_6600
     * @tc.name      testSemanticRulesTypeIdentity0066
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0066';

        let a: Array<Cat30 | Dog30 | Frog30 | number> = [new Cat30(), 7.8, new Dog30(), new Frog30()]
        let b: (number | Dog30 | Cat30 | Frog30)[] = foo30(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat30).assertTrue();
        check_cat30(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog30).assertTrue();
        check_dog30(b[2])

        expect(b[3] instanceof Frog30).assertTrue();
        check_frog30(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat30).assertTrue();
        check_cat30(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog30).assertTrue();
        check_dog30(a[2])

        expect(a[3] instanceof Frog30).assertTrue();
        check_frog30(a[3])

        expect(testNS215.runTest()).assertTrue();
      })
  });
}