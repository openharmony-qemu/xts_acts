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


namespace testNS1_1 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual(7n); // fixed
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(5n); // fixed
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(null);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual(undefined);
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(7.9);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual(true);
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(5);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual("abc");
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("In Progress");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_cat(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ 7n,
      [5n, null, undefined],
      7.9,
      [true, 5, "abc"],
      "In Progress",
      new Cat() ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

namespace testNS1_2 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual(undefined);
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(null);
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(undefined);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual("bcd");
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(true);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual("abc");
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(false);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual(321);
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("Done");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_dog(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ undefined,
      [null, undefined, "bcd"],
      true,
      ["abc", false, 321],
      "Done",
      new Dog() ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

namespace testNS1_3 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual("new");
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(null);
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(undefined);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual("cde");
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(true);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual("abc");
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(false);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual(123);
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("On Review");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_frog(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ "new",
      [null, undefined, "cde"],
      true,
      ["abc", false, 123],
      "On Review",
      new Frog() ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

namespace testNS1_4 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual(10);
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(null);
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(undefined);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual("def");
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(true);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual("abc");
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(false);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual(213);
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("Done");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_Number(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ 10,
      [null, undefined, "def"],
      true,
      ["abc", false, 213],
      "Done",
      5.7 ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

// 全局类声明（仅一次，后续 namespace 内部仍保留独立定义以保持作用域独立）
class Cat {v: string = "cat"}
class Dog {v: bigint = 123n}
class Frog {v: number = 5}

namespace testNS1_5 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual(7n); // fixed
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(5n); // fixed
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(null);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual(undefined);
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(7.9);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual(true);
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(5);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual("abc");
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("In Progress");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_cat(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ 7n,
      [5n, null, undefined],
      7.9,
      [true, 5, "abc"],
      "In Progress",
      new Cat() ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

namespace testNS1_6 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual(undefined);
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(null);
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(undefined);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual("bcd");
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(true);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual("abc");
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(false);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual(321);
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("Done");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_dog(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ undefined,
      [null, undefined, "bcd"],
      true,
      ["abc", false, 321],
      "Done",
      new Dog() ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

namespace testNS1_7 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual("new");
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(null);
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(undefined);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual("cde");
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(true);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual("abc");
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(false);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual(123);
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("On Review");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_frog(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ "new",
      [null, undefined, "cde"],
      true,
      ["abc", false, 123],
      "On Review",
      new Frog() ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

namespace testNS1_8 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual(10);
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(null);
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(undefined);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual("def");
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(true);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual("abc");
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(false);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual(213);
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("Done");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_Number(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ 10,
      [null, undefined, "def"],
      true,
      ["abc", false, 213],
      "Done",
      5.7 ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

namespace testNS1_9 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual(7n); // fixed
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(5n); // fixed
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(null);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual(undefined);
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(7.9);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual(true);
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(5);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual("abc");
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("In Progress");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_cat(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ 7n,
      [5n, null, undefined],
      7.9,
      [true, 5, "abc"],
      "In Progress",
      new Cat() ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

namespace testNS1_10 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual(undefined);
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(null);
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(undefined);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual("bcd");
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(true);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual("abc");
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(false);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual(321);
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("Done");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_dog(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ undefined,
      [null, undefined, "bcd"],
      true,
      ["abc", false, 321],
      "Done",
      new Dog() ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

namespace testNS1_11 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual("new");
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(null);
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(undefined);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual("cde");
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(true);
  }
  function check_func_3(a: Array<string | boolean | number>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual("abc");
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(false);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual(123);
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("On Review");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_frog(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ "new",
      [null, undefined, "cde"],
      true,
      ["abc", false, 123],
      "On Review",
      new Frog() ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

namespace testNS1_12 {
  class Cat {v: string = "cat"}
  class Dog {v: bigint = 123n}
  class Frog {v: number = 5}
  function check_cat(a: Object | null | undefined) {
    expect(a instanceof Cat).assertEqual(true);
    expect((a as Cat).v).assertEqual("cat");
  }
  function check_dog(a: Object | null | undefined) {
    expect(a instanceof Dog).assertEqual(true);
    expect((a as Dog).v).assertEqual(123n);
  }
  function check_frog(a: Object | null | undefined) {
    expect(a instanceof Frog).assertEqual(true);
    expect((a as Frog).v).assertEqual(5);
  }
  function check_Number(a: Object | null | undefined) {
    expect(a instanceof Number).assertEqual(true);
    expect(a as Number).assertEqual(5.7);
  }
  function check_func_0(a: Object | null | undefined) {
    expect(a instanceof Object | undefined).assertEqual(true);
    expect(a instanceof undefined | Object).assertEqual(true);
    expect(a as Object | undefined).assertEqual(10);
  }
  function check_func_1(a: Array<Object | null | undefined>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof Object | undefined | null).assertEqual(true);
      expect(a[0] instanceof undefined | null | Object).assertEqual(true);
      expect(a[0]).assertEqual(null);
      expect(a[1] instanceof Object | undefined | null).assertEqual(true);
      expect(a[1] instanceof undefined | null | Object).assertEqual(true);
      expect(a[1]).assertEqual(undefined);
      expect(a[2] instanceof Object | undefined | null).assertEqual(true);
      expect(a[2] instanceof undefined | null | Object).assertEqual(true);
      expect(a[2]).assertEqual("def");
    }
  }
  function check_func_2(a: Object | null | undefined) {
    expect(a instanceof Number | boolean).assertEqual(true);
    expect(a instanceof boolean | Number).assertEqual(true);
    expect(a as Number | boolean).assertEqual(true);
  }
  function check_func_3(a: Array<number | string | boolean>) {
    expect(a instanceof Array).assertEqual(true);
    if (a instanceof Array) {
      expect(a.length).assertEqual(3);
      expect(a[0] instanceof number | string | boolean).assertEqual(true);
      expect(a[0] instanceof string | boolean | number).assertEqual(true);
      expect(a[0]).assertEqual("abc");
      expect(a[1] instanceof number | string | boolean).assertEqual(true);
      expect(a[1] instanceof string | boolean | number).assertEqual(true);
      expect(a[1]).assertEqual(false);
      expect(a[2] instanceof number | string | boolean).assertEqual(true);
      expect(a[2] instanceof string | boolean | number).assertEqual(true);
      expect(a[2]).assertEqual(213);
    }
  }
  function check_func_4(a: Object | null | undefined) {
    expect(a as "Done" | "In Progress" | "On Review").assertEqual("Done");
  }
  function check_func_5(a: Object | null | undefined) {
    expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
    expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
    check_Number(a);
  }
  function cast(p: Object): [ Object | undefined,
    Array<Object | undefined | null>,
    Number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | Number ] {
    return p as [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ]
  }

  export function runTest(): boolean {
    let a: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = [ 10,
      [null, undefined, "def"],
      true,
      ["abc", false, 213],
      "Done",
      5.7 ]
    let b: [ Object | undefined,
      Array<Object | undefined | null>,
      Number | boolean,
      (number | string | boolean)[],
      "Done" | "In Progress" | "On Review",
      Cat | Dog | Frog | Number ] = cast(a)
    check_func_0(b[0]);
    check_func_1(b[1]);
    check_func_2(b[2]);
    check_func_3(b[3]);
    check_func_4(b[4]);
    check_func_5(b[5]);
    a = b;
    check_func_0(a[0]);
    check_func_1(a[1]);
    check_func_2(a[2]);
    check_func_3(a[3]);
    check_func_4(a[4]);
    check_func_5(a[5]);
    return true;
  }
}

// 全局函数
function check_cat(a: Object | null | undefined) {
  expect(a instanceof Cat).assertEqual(true);
  expect((a as Cat).v).assertEqual("cat");
}
function check_dog(a: Object | null | undefined) {
  expect(a instanceof Dog).assertEqual(true);
  expect((a as Dog).v).assertEqual(123n);
}
function check_frog(a: Object | null | undefined) {
  expect(a instanceof Frog).assertEqual(true);
  expect((a as Frog).v).assertEqual(5);
}
function check_Number(a: Object | null | undefined) {
  expect(a instanceof Number).assertEqual(true);
  expect(a as Number).assertEqual(5.7);
}
function check_func_0(a: Object | null | undefined) {
  expect(a instanceof Object | undefined).assertEqual(true);
  expect(a instanceof undefined | Object).assertEqual(true);
  expect(a as Object | undefined).assertEqual(7n); // fixed
}
function check_func_1(a: Array<Object | null | undefined>) {
  expect(a instanceof Array).assertEqual(true);
  if (a instanceof Array) {
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof Object | undefined | null).assertEqual(true);
    expect(a[0] instanceof undefined | null | Object).assertEqual(true);
    expect(a[0]).assertEqual(5n); // fixed
    expect(a[1] instanceof Object | undefined | null).assertEqual(true);
    expect(a[1] instanceof undefined | null | Object).assertEqual(true);
    expect(a[1]).assertEqual(null);
    expect(a[2] instanceof Object | undefined | null).assertEqual(true);
    expect(a[2] instanceof undefined | null | Object).assertEqual(true);
    expect(a[2]).assertEqual(undefined);
  }
}
function check_func_2(a: Object | null | undefined) {
  expect(a instanceof Number | boolean).assertEqual(true);
  expect(a instanceof boolean | Number).assertEqual(true);
  expect(a as Number | boolean).assertEqual(7.9);
}
function check_func_3(a: Array<string | boolean | number>) {
  expect(a instanceof Array).assertEqual(true);
  if (a instanceof Array) {
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof number | string | boolean).assertEqual(true);
    expect(a[0] instanceof string | boolean | number).assertEqual(true);
    expect(a[0]).assertEqual(true);
    expect(a[1] instanceof number | string | boolean).assertEqual(true);
    expect(a[1] instanceof string | boolean | number).assertEqual(true);
    expect(a[1]).assertEqual(5);
    expect(a[2] instanceof number | string | boolean).assertEqual(true);
    expect(a[2] instanceof string | boolean | number).assertEqual(true);
    expect(a[2]).assertEqual("abc");
  }
}
function check_func_4(a: Object | null | undefined) {
  expect(a as "Done" | "In Progress" | "On Review").assertEqual("In Progress");
}
function check_func_5(a: Object | null | undefined) {
  expect(a instanceof Cat | Dog | Frog | Number).assertEqual(true);
  expect(a instanceof Number | Dog | Cat | Frog).assertEqual(true);
  check_cat(a);
}
function cast(p: Object) {
  return p as [ Object | undefined,
    Array<Object | undefined | null>,
    number | boolean,
    (number | string | boolean)[],
    "Done" | "In Progress" | "On Review",
    Cat | Dog | Frog | number ]
}


export default function TupleTypesIdentityTest(): void {
  describe('TupleTypesIdentityTest', () => {
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
     * @tc.number    SUB_TUPLE_TYPES_IDENTITY_0100
     * @tc.name      testTupleTypesIdentity0001
     * @tc.desc      Checking for tuple types A and B are identical on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTupleTypesIdentity0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTupleTypesIdentity0001';

      let a: [ Object | undefined,
        Array<Object | undefined | null>,
        number | boolean,
        (number | string | boolean)[],
        "Done" | "In Progress" | "On Review",
        Cat | Dog | Frog | number ] = [ 7n,
        [5n, null, undefined],
        7.9,
        [true, 5, "abc"],
        "In Progress",
        new Cat() ]
      let b: [ undefined | Object,
        (undefined | null | Object)[],
        boolean | number,
        Array<string | boolean | number>,
        "In Progress" | "On Review" | "Done",
        number | Dog | Cat | Frog ] = a
      expect(a instanceof Tuple).assertEqual(true);
      expect(b instanceof Tuple).assertEqual(true);
      check_func_0(b[0]);
      check_func_1(b[1]);
      check_func_2(b[2]);
      check_func_3(b[3]);
      check_func_4(b[4]);
      check_func_5(b[5]);
      a = b;
      expect(a instanceof Tuple).assertEqual(true);
      check_func_0(a[0]);
      check_func_1(a[1]);
      check_func_2(a[2]);
      check_func_3(a[3]);
      check_func_4(a[4]);
      check_func_5(a[5]);

      expect(testNS1_1.runTest()).assertEqual(true);
      expect(testNS1_2.runTest()).assertEqual(true);
      expect(testNS1_3.runTest()).assertEqual(true);
      expect(testNS1_4.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_TUPLE_TYPES_IDENTITY_0200
     * @tc.name      testTupleTypesIdentity0002
     * @tc.desc      Checking for tuple types A and B are identical on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTupleTypesIdentity0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTupleTypesIdentity0002';

      let a: [ undefined | Object,
        (undefined | null | Object)[],
        boolean | number,
        Array<string | boolean | number>,
        "In Progress" | "On Review" | "Done",
        number | Dog | Cat | Frog ] = [ 7n,
        [5n, null, undefined],
        7.9,
        [true, 5, "abc"],
        "In Progress",
        new Cat() ]
      let b: [ Object | undefined,
        Array<Object | undefined | null>,
        number | boolean,
        (number | string | boolean)[],
        "Done" | "In Progress" | "On Review",
        Cat | Dog | Frog | number ] = a
      expect(a instanceof Tuple).assertEqual(true);
      expect(b instanceof Tuple).assertEqual(true);
      check_func_0(b[0]);
      check_func_1(b[1]);
      check_func_2(b[2]);
      check_func_3(b[3]);
      check_func_4(b[4]);
      check_func_5(b[5]);
      a = b;
      expect(a instanceof Tuple).assertEqual(true);
      check_func_0(a[0]);
      check_func_1(a[1]);
      check_func_2(a[2]);
      check_func_3(a[3]);
      check_func_4(a[4]);
      check_func_5(a[5]);

      expect(testNS1_5.runTest()).assertEqual(true);
      expect(testNS1_6.runTest()).assertEqual(true);
      expect(testNS1_7.runTest()).assertEqual(true);
      expect(testNS1_8.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_TUPLE_TYPES_IDENTITY_0300
     * @tc.name      testTupleTypesIdentity0003
     * @tc.desc      Checking for tuple types A and B are identical on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTupleTypesIdentity0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTupleTypesIdentity0003';

      let a: [ Object | undefined,
        Array<Object | undefined | null>,
        number | boolean,
        (number | string | boolean)[],
        "Done" | "In Progress" | "On Review",
        Cat | Dog | Frog | number ] = [ 7n,
        [5n, null, undefined],
        7.9,
        [true, 5, "abc"],
        "In Progress",
        new Cat() ]
      let b: [ undefined | Object,
        (undefined | null | Object)[],
        boolean | number,
        Array<string | boolean | number>,
        "In Progress" | "On Review" | "Done",
        number | Dog | Cat | Frog ] = cast(a)
      expect(a instanceof Tuple).assertEqual(true);
      expect(b instanceof Tuple).assertEqual(true);
      check_func_0(b[0]);
      check_func_1(b[1]);
      check_func_2(b[2]);
      check_func_3(b[3]);
      check_func_4(b[4]);
      check_func_5(b[5]);
      a = b;
      expect(a instanceof Tuple).assertEqual(true);
      check_func_0(a[0]);
      check_func_1(a[1]);
      check_func_2(a[2]);
      check_func_3(a[3]);
      check_func_4(a[4]);
      check_func_5(a[5]);

      expect(testNS1_9.runTest()).assertEqual(true);
      expect(testNS1_10.runTest()).assertEqual(true);
      expect(testNS1_11.runTest()).assertEqual(true);
      expect(testNS1_12.runTest()).assertEqual(true);

    });
  })
}

