import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace testNS68 {
  function cast(p: Any): undefined | Object {
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

namespace testNS69 {
  function cast(p: Any): undefined | null | Object {
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

namespace testNS70 {
  function cast(p: Any): boolean | number {
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

namespace testNS71 {
  function cast(p: Any): string | boolean | int {
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

namespace testNS72 {
  function cast(p: Any): String {
    return p as String
  }

  export function runTest(): boolean {
    let a: String = "On Review"
    let b: String = cast(a)
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
    b = cast(a)
    expect(b instanceof String).assertEqual(true)
    expect(b instanceof String).assertEqual(true)
    expect(b).assertEqual("In Progress")
    a = b
    expect(a instanceof String).assertEqual(true)
    expect(a instanceof String).assertEqual(true)
    expect(a).assertEqual("In Progress")
    a = "Done"
    b = cast(a)
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

function cast11(p: Any): undefined | Object {
  return p as Object | undefined
}

namespace testNS73 {
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
  function cast(p: Any) {
    return p as Cat | Dog | Frog | number
  }

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = cast(a)
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

class Cat2 {v: string = "cat"}
class Dog2 {v: bigint = 123n}
class Frog2 {v: int = 5}
function check_cat2(a: Any) {
  expect(a instanceof Cat2).assertEqual(true);
  expect((a as Cat2).v).assertEqual("cat");
}
function check_dog2(a: Any) {
  expect(a instanceof Dog2).assertEqual(true);
  expect((a as Dog2).v).assertEqual(123n);
}
function check_frog2(a: Any) {
  expect(a instanceof Frog2).assertEqual(true);
  expect((a as Frog2).v).assertEqual(5);
}
function check_number2(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function cast12(p: Any) {
  return p as Cat2 | Dog2 | Frog2 | number
}

namespace testNS74 {
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
  function cast(p: Any) {
    return p as Cat | Dog | Frog | number
  }

  export function runTest(): boolean {
    let a: number | Dog | Cat | Frog = new Cat()
    let b: Cat | Dog | Frog | number = cast(a)
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
    b = cast(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(a)
    a = new Dog()
    b = cast(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(a)
    a = new Frog()
    b = cast(a)
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
class Cat3 {v: string = "cat"}
class Dog3 {v: bigint = 123n}
class Frog3 {v: int = 5}
function check_cat3(a: Any) {
  expect(a instanceof Cat3).assertEqual(true)
  expect((a as Cat3).v).assertEqual("cat")
}
function check_dog3(a: Any) {
  expect(a instanceof Dog3).assertEqual(true)
  expect((a as Dog3).v).assertEqual(123n)
}
function check_frog3(a: Any) {
  expect(a instanceof Frog3).assertEqual(true)
  expect((a as Frog3).v).assertEqual(5)
}
function check_number3(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function cast13(p: Any) {
  return p as Cat3 | Dog3 | Frog3 | number
}

namespace testNS75 {
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
  function cast(p: Any) {
    return p as number | Dog | Cat | Frog
  }

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = cast(a)
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

class Cat4 {v: string = "cat"}
class Dog4 {v: bigint = 123n}
class Frog4 {v: int = 5}
function check_cat4(a: Any) {
  expect(a instanceof Cat4).assertEqual(true);
  expect((a as Cat4).v).assertEqual("cat");
}
function check_dog4(a: Any) {
  expect(a instanceof Dog4).assertEqual(true);
  expect((a as Dog4).v).assertEqual(123n);
}
function check_frog4(a: Any) {
  expect(a instanceof Frog4).assertEqual(true);
  expect((a as Frog4).v).assertEqual(5);
}
function check_number4(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function cast14(p: Any) {
  return p as number | Dog4 | Cat4 | Frog4
}

namespace testNS76 {
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
  function cast(p: Any) {
    return p as number | Dog | Cat | Frog
  }

  export function runTest(): boolean {
    let a: number | Dog | Cat | Frog = new Cat()
    let b: Cat | Dog | Frog | number = cast(a)
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
    b = cast(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(a)
    a = new Dog()
    b = cast(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(a)
    a = new Frog()
    b = cast(a)
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
class Cat5 {v: string = "cat"}
class Dog5 {v: bigint = 123n}
class Frog5 {v: int = 5}
function check_cat5(a: Any) {
  expect(a instanceof Cat5).assertEqual(true)
  expect((a as Cat5).v).assertEqual("cat")
}
function check_dog5(a: Any) {
  expect(a instanceof Dog5).assertEqual(true)
  expect((a as Dog5).v).assertEqual(123n)
}
function check_frog5(a: Any) {
  expect(a instanceof Frog5).assertEqual(true)
  expect((a as Frog5).v).assertEqual(5)
}
function check_number5(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function cast15(p: Any) {
  return p as number | Dog5 | Cat5 | Frog5
}

namespace testNS77 {
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
  function cast(p: Any): Cat | Dog | Frog | number {
    return p as Cat | Dog | Frog | number
  }

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = cast(a)
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

class Cat6 {v: string = "cat"}
class Dog6 {v: bigint = 123n}
class Frog6 {v: int = 5}
function check_cat6(a: Any) {
  expect(a instanceof Cat6).assertEqual(true);
  expect((a as Cat6).v).assertEqual("cat");
}
function check_dog6(a: Any) {
  expect(a instanceof Dog6).assertEqual(true);
  expect((a as Dog6).v).assertEqual(123n);
}
function check_frog6(a: Any) {
  expect(a instanceof Frog6).assertEqual(true);
  expect((a as Frog6).v).assertEqual(5);
}
function check_number6(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function cast16(p: Any): Cat6 | Dog6 | Frog6 | number {
  return p as Cat6 | Dog6 | Frog6 | number
}

namespace testNS78 {
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
  function cast(p: Any): Cat | Dog | Frog | number {
    return p as Cat | Dog | Frog | number;
  }

  export function runTest(): boolean {
    let a: number | Dog | Cat | Frog = new Cat();
    let b: Cat | Dog | Frog | number = cast(a);
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
class Cat7 {v: string = "cat"}
class Dog7 {v: bigint = 123n}
class Frog7 {v: int = 5}
function check_cat7(a: Any) {
  expect(a instanceof Cat7).assertEqual(true);
  expect((a as Cat7).v).assertEqual("cat");
}
function check_dog7(a: Any) {
  expect(a instanceof Dog7).assertEqual(true);
  expect((a as Dog7).v).assertEqual(123n);
}
function check_frog7(a: Any) {
  expect(a instanceof Frog7).assertEqual(true);
  expect((a as Frog7).v).assertEqual(5);
}
function check_number7(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function cast17(p: Any): Cat7 | Dog7 | Frog7 | number {
  return p as Cat7 | Dog7 | Frog7 | number;
}

namespace testNS79 {
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
  function cast(p: Any): Cat | Dog | Frog | number {
    return p as number | Dog | Cat | Frog
  }

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = cast(a)
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

class Cat8 {v: string = "cat"}
class Dog8 {v: bigint = 123n}
class Frog8 {v: int = 5}
function check_cat8(a: Any) {
  expect(a instanceof Cat8).assertEqual(true);
  expect((a as Cat8).v).assertEqual("cat");
}
function check_dog8(a: Any) {
  expect(a instanceof Dog8).assertEqual(true);
  expect((a as Dog8).v).assertEqual(123n);
}
function check_frog8(a: Any) {
  expect(a instanceof Frog8).assertEqual(true);
  expect((a as Frog8).v).assertEqual(5);
}
function check_number8(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function cast18(p: Any): Cat8 | Dog8 | Frog8 | number {
  return p as number | Dog8 | Cat8 | Frog8
}

namespace testNS80 {
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
  function cast(p: Any): Cat | Dog | Frog | number {
    return p as number | Dog | Cat | Frog
  }

  export function runTest(): boolean {
    let a: number | Dog | Cat | Frog = new Cat()
    let b: Cat | Dog | Frog | number = cast(a)
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
    b = cast(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(a)
    a = new Dog()
    b = cast(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(a)
    a = new Frog()
    b = cast(a)
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
class Cat9 {v: string = "cat"}
class Dog9 {v: bigint = 123n}
class Frog9 {v: int = 5}
function check_cat9(a: Any) {
  expect(a instanceof Cat9).assertEqual(true)
  expect((a as Cat9).v).assertEqual("cat")
}
function check_dog9(a: Any) {
  expect(a instanceof Dog9).assertEqual(true)
  expect((a as Dog9).v).assertEqual(123n)
}
function check_frog9(a: Any) {
  expect(a instanceof Frog9).assertEqual(true)
  expect((a as Frog9).v).assertEqual(5)
}
function check_number9(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function cast19(p: Any): Cat9 | Dog9 | Frog9 | number {
  return p as number | Dog9 | Cat9 | Frog9
}

namespace testNS81 {
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
    return p as number | Dog | Cat | Frog
  }

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = cast(a)
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

class Cat10 {v: string = "cat"}
class Dog10 {v: bigint = 123n}
class Frog10 {v: int = 5}
function check_cat10(a: Any) {
  expect(a instanceof Cat10).assertEqual(true);
  expect((a as Cat10).v).assertEqual("cat");
}
function check_dog10(a: Any) {
  expect(a instanceof Dog10).assertEqual(true);
  expect((a as Dog10).v).assertEqual(123n);
}
function check_frog10(a: Any) {
  expect(a instanceof Frog10).assertEqual(true);
  expect((a as Frog10).v).assertEqual(5);
}
function check_number10(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function cast20(p: Any): number | Dog10 | Cat10 | Frog10 {
  return p as number | Dog10 | Cat10 | Frog10
}

namespace testNS82 {
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
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = cast(a)
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

class Cat11 {v: string = "cat"}
class Dog11 {v: bigint = 123n}
class Frog11 {v: int = 5}
function check_cat11(a: Any) {
  expect(a instanceof Cat11).assertEqual(true);
  expect((a as Cat11).v).assertEqual("cat");
}
function check_dog11(a: Any) {
  expect(a instanceof Dog11).assertEqual(true);
  expect((a as Dog11).v).assertEqual(123n);
}
function check_frog11(a: Any) {
  expect(a instanceof Frog11).assertEqual(true);
  expect((a as Frog11).v).assertEqual(5);
}
function check_number11(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(7.8);
}
function cast21(p: Any): number | Dog11 | Cat11 | Frog11 {
  return p as Cat11 | Dog11 | Frog11 | number
}

namespace testNS83 {
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
  function cast(p: Any): number | Dog | Cat | Frog {
    return p as Cat | Dog | Frog | number
  }

  export function runTest(): boolean {
    let a: Cat | Dog | Frog | number = new Cat()
    let b: number | Dog | Cat | Frog = cast(a)
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
    b = cast(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_number(a)
    a = new Dog()
    b = cast(a)
    expect(b instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(b instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(b)
    a = b
    expect(a instanceof Cat | Dog | Frog | number).assertEqual(true)
    expect(a instanceof number | Dog | Cat | Frog).assertEqual(true)
    check_dog(a)
    a = new Frog()
    b = cast(a)
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
class Cat12 {v: string = "cat"}
class Dog12 {v: bigint = 123n}
class Frog12 {v: int = 5}
function check_cat12(a: Any) {
  expect(a instanceof Cat12).assertEqual(true)
  expect((a as Cat12).v).assertEqual("cat")
}
function check_dog12(a: Any) {
  expect(a instanceof Dog12).assertEqual(true)
  expect((a as Dog12).v).assertEqual(123n)
}
function check_frog12(a: Any) {
  expect(a instanceof Frog12).assertEqual(true)
  expect((a as Frog12).v).assertEqual(5)
}
function check_number12(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function cast22(p: Any): number | Dog12 | Cat12 | Frog12 {
  return p as Cat12 | Dog12 | Frog12 | number
}


export default function UnionTypesIdentityTest02(): void {
  describe('UnionTypesIdentityTest02', () => {
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
     * @tc.number    SUB_UNION_TYPES_IDENTITY_1600
     * @tc.name      testUnionTypesIdentity0016
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0016';

      let a: undefined | Object = 5n
      let b: Object | undefined = cast11(a)
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
      b = cast11(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual(undefined)
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual(undefined)
      a = "abc"
      b = cast11(a)
      expect(b instanceof Object | undefined).assertEqual(true)
      expect(b instanceof undefined | Object).assertEqual(true)
      expect(b).assertEqual("abc")
      a = b
      expect(a instanceof Object | undefined).assertEqual(true)
      expect(a instanceof undefined | Object).assertEqual(true)
      expect(a).assertEqual("abc")

      expect(testNS68.runTest()).assertEqual(true)
      expect(testNS69.runTest()).assertEqual(true)
      expect(testNS70.runTest()).assertEqual(true)
      expect(testNS71.runTest()).assertEqual(true)
      expect(testNS72.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_1700
     * @tc.name      testUnionTypesIdentity0017
     * @tc.desc       Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0017';

      let a: Cat2 | Dog2 | Frog2 | number = new Cat2()
      let b: number | Dog2 | Cat2 | Frog2 = cast12(a)
      expect(a instanceof Cat2 | Dog2 | Frog2 | number).assertEqual(true);
      expect(a instanceof number | Dog2 | Cat2 | Frog2).assertEqual(true);
      check_cat2(a);
      expect(b instanceof Cat2 | Dog2 | Frog2 | number).assertEqual(true);
      expect(b instanceof number | Dog2 | Cat2 | Frog2).assertEqual(true);
      check_cat2(b);
      a = b;
      expect(a instanceof Cat2 | Dog2 | Frog2 | number).assertEqual(true);
      expect(a instanceof number | Dog2 | Cat2 | Frog2).assertEqual(true);
      check_cat2(a);
      a = 7.8;
      b = cast12(a);
      expect(b instanceof Cat2 | Dog2 | Frog2 | number).assertEqual(true);
      expect(b instanceof number | Dog2 | Cat2 | Frog2).assertEqual(true);
      check_number2(b);
      a = b;
      expect(a instanceof Cat2 | Dog2 | Frog2 | number).assertEqual(true);
      expect(a instanceof number | Dog2 | Cat2 | Frog2).assertEqual(true);
      check_number2(a);
      a = new Dog2();
      b = cast12(a);
      expect(b instanceof Cat2 | Dog2 | Frog2 | number).assertEqual(true);
      expect(b instanceof number | Dog2 | Cat2 | Frog2).assertEqual(true);
      check_dog2(b);
      a = b;
      expect(a instanceof Cat2 | Dog2 | Frog2 | number).assertEqual(true);
      expect(a instanceof number | Dog2 | Cat2 | Frog2).assertEqual(true);
      check_dog2(a);
      a = new Frog2();
      b = cast12(a);
      expect(b instanceof Cat2 | Dog2 | Frog2 | number).assertEqual(true);
      expect(b instanceof number | Dog2 | Cat2 | Frog2).assertEqual(true);
      check_frog2(b);
      a = b;
      expect(a instanceof Cat2 | Dog2 | Frog2 | number).assertEqual(true);
      expect(a instanceof number | Dog2 | Cat2 | Frog2).assertEqual(true);
      check_frog2(a);

      expect(testNS73.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_1800
     * @tc.name      testUnionTypesIdentity0018
     * @tc.desc      Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0018';

      let a: number | Dog3 | Cat3 | Frog3 = new Cat3()
      let b: Cat3 | Dog3 | Frog3 | number = cast13(a)
      expect(a instanceof Cat3 | Dog3 | Frog3 | number).assertEqual(true)
      expect(a instanceof number | Dog3 | Cat3 | Frog3).assertEqual(true)
      check_cat3(a)
      expect(b instanceof Cat3 | Dog3 | Frog3 | number).assertEqual(true)
      expect(b instanceof number | Dog3 | Cat3 | Frog3).assertEqual(true)
      check_cat3(b)
      a = b
      expect(a instanceof Cat3 | Dog3 | Frog3 | number).assertEqual(true)
      expect(a instanceof number | Dog3 | Cat3 | Frog3).assertEqual(true)
      check_cat3(a)
      a = 7.8
      b = cast13(a)
      expect(b instanceof Cat3 | Dog3 | Frog3 | number).assertEqual(true)
      expect(b instanceof number | Dog3 | Cat3 | Frog3).assertEqual(true)
      check_number3(b)
      a = b
      expect(a instanceof Cat3 | Dog3 | Frog3 | number).assertEqual(true)
      expect(a instanceof number | Dog3 | Cat3 | Frog3).assertEqual(true)
      check_number3(a)
      a = new Dog3()
      b = cast13(a)
      expect(b instanceof Cat3 | Dog3 | Frog3 | number).assertEqual(true)
      expect(b instanceof number | Dog3 | Cat3 | Frog3).assertEqual(true)
      check_dog3(b)
      a = b
      expect(a instanceof Cat3 | Dog3 | Frog3 | number).assertEqual(true)
      expect(a instanceof number | Dog3 | Cat3 | Frog3).assertEqual(true)
      check_dog3(a)
      a = new Frog3()
      b = cast13(a)
      expect(b instanceof Cat3 | Dog3 | Frog3 | number).assertEqual(true)
      expect(b instanceof number | Dog3 | Cat3 | Frog3).assertEqual(true)
      check_frog3(b)
      a = b
      expect(a instanceof Cat3 | Dog3 | Frog3 | number).assertEqual(true)
      expect(a instanceof number | Dog3 | Cat3 | Frog3).assertEqual(true)
      check_frog3(a)

      expect(testNS74.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_1900
     * @tc.name      testUnionTypesIdentity0019
     * @tc.desc      Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0019';

      let a: Cat4 | Dog4 | Frog4 | number = new Cat4()
      let b: number | Dog4 | Cat4 | Frog4 = cast14(a)
      expect(a instanceof Cat4 | Dog4 | Frog4 | number).assertEqual(true);
      expect(a instanceof number | Dog4 | Cat4 | Frog4).assertEqual(true);
      check_cat4(a);
      expect(b instanceof Cat4 | Dog4 | Frog4 | number).assertEqual(true);
      expect(b instanceof number | Dog4 | Cat4 | Frog4).assertEqual(true);
      check_cat4(b);
      a = b;
      expect(a instanceof Cat4 | Dog4 | Frog4 | number).assertEqual(true);
      expect(a instanceof number | Dog4 | Cat4 | Frog4).assertEqual(true);
      check_cat4(a);
      a = 7.8;
      b = cast14(a);
      expect(b instanceof Cat4 | Dog4 | Frog4 | number).assertEqual(true);
      expect(b instanceof number | Dog4 | Cat4 | Frog4).assertEqual(true);
      check_number4(b);
      a = b;
      expect(a instanceof Cat4 | Dog4 | Frog4 | number).assertEqual(true);
      expect(a instanceof number | Dog4 | Cat4 | Frog4).assertEqual(true);
      check_number4(a);
      a = new Dog4();
      b = cast14(a);
      expect(b instanceof Cat4 | Dog4 | Frog4 | number).assertEqual(true);
      expect(b instanceof number | Dog4 | Cat4 | Frog4).assertEqual(true);
      check_dog4(b);
      a = b;
      expect(a instanceof Cat4 | Dog4 | Frog4 | number).assertEqual(true);
      expect(a instanceof number | Dog4 | Cat4 | Frog4).assertEqual(true);
      check_dog4(a);
      a = new Frog4();
      b = cast14(a);
      expect(b instanceof Cat4 | Dog4 | Frog4 | number).assertEqual(true);
      expect(b instanceof number | Dog4 | Cat4 | Frog4).assertEqual(true);
      check_frog4(b);
      a = b;
      expect(a instanceof Cat4 | Dog4 | Frog4 | number).assertEqual(true);
      expect(a instanceof number | Dog4 | Cat4 | Frog4).assertEqual(true);
      check_frog4(a);

      expect(testNS75.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_2000
     * @tc.name      testUnionTypesIdentity0020
     * @tc.desc      Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0020';

      let a: number | Dog5 | Cat5 | Frog5 = new Cat5()
      let b: Cat5 | Dog5 | Frog5 | number = cast15(a)
      expect(a instanceof Cat5 | Dog5 | Frog5 | number).assertEqual(true)
      expect(a instanceof number | Dog5 | Cat5 | Frog5).assertEqual(true)
      check_cat5(a)
      expect(b instanceof Cat5 | Dog5 | Frog5 | number).assertEqual(true)
      expect(b instanceof number | Dog5 | Cat5 | Frog5).assertEqual(true)
      check_cat5(b)
      a = b
      expect(a instanceof Cat5 | Dog5 | Frog5 | number).assertEqual(true)
      expect(a instanceof number | Dog5 | Cat5 | Frog5).assertEqual(true)
      check_cat5(a)
      a = 7.8
      b = cast15(a)
      expect(b instanceof Cat5 | Dog5 | Frog5 | number).assertEqual(true)
      expect(b instanceof number | Dog5 | Cat5 | Frog5).assertEqual(true)
      check_number5(b)
      a = b
      expect(a instanceof Cat5 | Dog5 | Frog5 | number).assertEqual(true)
      expect(a instanceof number | Dog5 | Cat5 | Frog5).assertEqual(true)
      check_number5(a)
      a = new Dog5()
      b = cast15(a)
      expect(b instanceof Cat5 | Dog5 | Frog5 | number).assertEqual(true)
      expect(b instanceof number | Dog5 | Cat5 | Frog5).assertEqual(true)
      check_dog5(b)
      a = b
      expect(a instanceof Cat5 | Dog5 | Frog5 | number).assertEqual(true)
      expect(a instanceof number | Dog5 | Cat5 | Frog5).assertEqual(true)
      check_dog5(a)
      a = new Frog5()
      b = cast15(a)
      expect(b instanceof Cat5 | Dog5 | Frog5 | number).assertEqual(true)
      expect(b instanceof number | Dog5 | Cat5 | Frog5).assertEqual(true)
      check_frog5(b)
      a = b
      expect(a instanceof Cat5 | Dog5 | Frog5 | number).assertEqual(true)
      expect(a instanceof number | Dog5 | Cat5 | Frog5).assertEqual(true)
      check_frog5(a)

      expect(testNS76.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_2100
     * @tc.name      testUnionTypesIdentity0021
     * @tc.desc       Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0021';

      let a: Cat6 | Dog6 | Frog6 | number = new Cat6()
      let b: number | Dog6 | Cat6 | Frog6 = cast16(a)
      expect(a instanceof Cat6 | Dog6 | Frog6 | number).assertEqual(true);
      expect(a instanceof number | Dog6 | Cat6 | Frog6).assertEqual(true);
      check_cat6(a);
      expect(b instanceof Cat6 | Dog6 | Frog6 | number).assertEqual(true);
      expect(b instanceof number | Dog6 | Cat6 | Frog6).assertEqual(true);
      check_cat6(b);
      a = b;
      expect(a instanceof Cat6 | Dog6 | Frog6 | number).assertEqual(true);
      expect(a instanceof number | Dog6 | Cat6 | Frog6).assertEqual(true);
      check_cat6(a);
      a = 7.8;
      b = cast16(a);
      expect(b instanceof Cat6 | Dog6 | Frog6 | number).assertEqual(true);
      expect(b instanceof number | Dog6 | Cat6 | Frog6).assertEqual(true);
      check_number6(b);
      a = b;
      expect(a instanceof Cat6 | Dog6 | Frog6 | number).assertEqual(true);
      expect(a instanceof number | Dog6 | Cat6 | Frog6).assertEqual(true);
      check_number6(a);
      a = new Dog6();
      b = cast16(a);
      expect(b instanceof Cat6 | Dog6 | Frog6 | number).assertEqual(true);
      expect(b instanceof number | Dog6 | Cat6 | Frog6).assertEqual(true);
      check_dog6(b);
      a = b;
      expect(a instanceof Cat6 | Dog6 | Frog6 | number).assertEqual(true);
      expect(a instanceof number | Dog6 | Cat6 | Frog6).assertEqual(true);
      check_dog6(a);
      a = new Frog6();
      b = cast16(a);
      expect(b instanceof Cat6 | Dog6 | Frog6 | number).assertEqual(true);
      expect(b instanceof number | Dog6 | Cat6 | Frog6).assertEqual(true);
      check_frog6(b);
      a = b;
      expect(a instanceof Cat6 | Dog6 | Frog6 | number).assertEqual(true);
      expect(a instanceof number | Dog6 | Cat6 | Frog6).assertEqual(true);
      check_frog6(a);

      expect(testNS77.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_2200
     * @tc.name      testUnionTypesIdentity0022
     * @tc.desc      Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0022';

      let a: number | Dog7 | Cat7 | Frog7 = new Cat7();
      let b: Cat7 | Dog7 | Frog7 | number = cast17(a);
      expect(a instanceof Cat7 | Dog7 | Frog7 | number).assertEqual(true);
      expect(a instanceof number | Dog7 | Cat7 | Frog7).assertEqual(true);
      check_cat7(a);
      expect(b instanceof Cat7 | Dog7 | Frog7 | number).assertEqual(true);
      expect(b instanceof number | Dog7 | Cat7 | Frog7).assertEqual(true);
      check_cat7(b);
      a = b;
      expect(a instanceof Cat7 | Dog7 | Frog7 | number).assertEqual(true);
      expect(a instanceof number | Dog7 | Cat7 | Frog7).assertEqual(true);
      check_cat7(a);
      a = 7.8;
      b = cast17(a);
      expect(b instanceof Cat7 | Dog7 | Frog7 | number).assertEqual(true);
      expect(b instanceof number | Dog7 | Cat7 | Frog7).assertEqual(true);
      check_number7(b);
      a = b;
      expect(a instanceof Cat7 | Dog7 | Frog7 | number).assertEqual(true);
      expect(a instanceof number | Dog7 | Cat7 | Frog7).assertEqual(true);
      check_number7(a);
      a = new Dog7();
      b = cast17(a);
      expect(b instanceof Cat7 | Dog7 | Frog7 | number).assertEqual(true);
      expect(b instanceof number | Dog7 | Cat7 | Frog7).assertEqual(true);
      check_dog7(b);
      a = b;
      expect(a instanceof Cat7 | Dog7 | Frog7 | number).assertEqual(true);
      expect(a instanceof number | Dog7 | Cat7 | Frog7).assertEqual(true);
      check_dog7(a);
      a = new Frog7();
      b = cast17(a);
      expect(b instanceof Cat7 | Dog7 | Frog7 | number).assertEqual(true);
      expect(b instanceof number | Dog7 | Cat7 | Frog7).assertEqual(true);
      check_frog7(b);
      a = b;
      expect(a instanceof Cat7 | Dog7 | Frog7 | number).assertEqual(true);
      expect(a instanceof number | Dog7 | Cat7 | Frog7).assertEqual(true);
      check_frog7(a);

      expect(testNS78.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_2300
     * @tc.name      testUnionTypesIdentity0023
     * @tc.desc      Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0023';

      let a: Cat8 | Dog8 | Frog8 | number = new Cat8()
      let b: number | Dog8 | Cat8 | Frog8 = cast18(a)
      expect(a instanceof Cat8 | Dog8 | Frog8 | number).assertEqual(true);
      expect(a instanceof number | Dog8 | Cat8 | Frog8).assertEqual(true);
      check_cat8(a);
      expect(b instanceof Cat8 | Dog8 | Frog8 | number).assertEqual(true);
      expect(b instanceof number | Dog8 | Cat8 | Frog8).assertEqual(true);
      check_cat8(b);
      a = b;
      expect(a instanceof Cat8 | Dog8 | Frog8 | number).assertEqual(true);
      expect(a instanceof number | Dog8 | Cat8 | Frog8).assertEqual(true);
      check_cat8(a);
      a = 7.8;
      b = cast18(a);
      expect(b instanceof Cat8 | Dog8 | Frog8 | number).assertEqual(true);
      expect(b instanceof number | Dog8 | Cat8 | Frog8).assertEqual(true);
      check_number8(b);
      a = b;
      expect(a instanceof Cat8 | Dog8 | Frog8 | number).assertEqual(true);
      expect(a instanceof number | Dog8 | Cat8 | Frog8).assertEqual(true);
      check_number8(a);
      a = new Dog8();
      b = cast18(a);
      expect(b instanceof Cat8 | Dog8 | Frog8 | number).assertEqual(true);
      expect(b instanceof number | Dog8 | Cat8 | Frog8).assertEqual(true);
      check_dog8(b);
      a = b;
      expect(a instanceof Cat8 | Dog8 | Frog8 | number).assertEqual(true);
      expect(a instanceof number | Dog8 | Cat8 | Frog8).assertEqual(true);
      check_dog8(a);
      a = new Frog8();
      b = cast18(a);
      expect(b instanceof Cat8 | Dog8 | Frog8 | number).assertEqual(true);
      expect(b instanceof number | Dog8 | Cat8 | Frog8).assertEqual(true);
      check_frog8(b);
      a = b;
      expect(a instanceof Cat8 | Dog8 | Frog8 | number).assertEqual(true);
      expect(a instanceof number | Dog8 | Cat8 | Frog8).assertEqual(true);
      check_frog8(a);

      expect(testNS79.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_2400
     * @tc.name      testUnionTypesIdentity0024
     * @tc.desc      Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0024';

      let a: number | Dog9 | Cat9 | Frog9 = new Cat9()
      let b: Cat9 | Dog9 | Frog9 | number = cast19(a)
      expect(a instanceof Cat9 | Dog9 | Frog9 | number).assertEqual(true)
      expect(a instanceof number | Dog9 | Cat9 | Frog9).assertEqual(true)
      check_cat9(a)
      expect(b instanceof Cat9 | Dog9 | Frog9 | number).assertEqual(true)
      expect(b instanceof number | Dog9 | Cat9 | Frog9).assertEqual(true)
      check_cat9(b)
      a = b
      expect(a instanceof Cat9 | Dog9 | Frog9 | number).assertEqual(true)
      expect(a instanceof number | Dog9 | Cat9 | Frog9).assertEqual(true)
      check_cat9(a)
      a = 7.8
      b = cast19(a)
      expect(b instanceof Cat9 | Dog9 | Frog9 | number).assertEqual(true)
      expect(b instanceof number | Dog9 | Cat9 | Frog9).assertEqual(true)
      check_number9(b)
      a = b
      expect(a instanceof Cat9 | Dog9 | Frog9 | number).assertEqual(true)
      expect(a instanceof number | Dog9 | Cat9 | Frog9).assertEqual(true)
      check_number9(a)
      a = new Dog9()
      b = cast19(a)
      expect(b instanceof Cat9 | Dog9 | Frog9 | number).assertEqual(true)
      expect(b instanceof number | Dog9 | Cat9 | Frog9).assertEqual(true)
      check_dog9(b)
      a = b
      expect(a instanceof Cat9 | Dog9 | Frog9 | number).assertEqual(true)
      expect(a instanceof number | Dog9 | Cat9 | Frog9).assertEqual(true)
      check_dog9(a)
      a = new Frog9()
      b = cast19(a)
      expect(b instanceof Cat9 | Dog9 | Frog9 | number).assertEqual(true)
      expect(b instanceof number | Dog9 | Cat9 | Frog9).assertEqual(true)
      check_frog9(b)
      a = b
      expect(a instanceof Cat9 | Dog9 | Frog9 | number).assertEqual(true)
      expect(a instanceof number | Dog9 | Cat9 | Frog9).assertEqual(true)
      check_frog9(a)

      expect(testNS80.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_2500
     * @tc.name      testUnionTypesIdentity0025
     * @tc.desc      Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0025';

      let a: Cat10 | Dog10 | Frog10 | number = new Cat10()
      let b: number | Dog10 | Cat10 | Frog10 = cast20(a)
      expect(a instanceof Cat10 | Dog10 | Frog10 | number).assertEqual(true);
      expect(a instanceof number | Dog10 | Cat10 | Frog10).assertEqual(true);
      check_cat10(a);
      expect(b instanceof Cat10 | Dog10 | Frog10 | number).assertEqual(true);
      expect(b instanceof number | Dog10 | Cat10 | Frog10).assertEqual(true);
      check_cat10(b);
      a = b;
      expect(a instanceof Cat10 | Dog10 | Frog10 | number).assertEqual(true);
      expect(a instanceof number | Dog10 | Cat10 | Frog10).assertEqual(true);
      check_cat10(a);
      a = 7.8;
      b = cast20(a);
      expect(b instanceof Cat10 | Dog10 | Frog10 | number).assertEqual(true);
      expect(b instanceof number | Dog10 | Cat10 | Frog10).assertEqual(true);
      check_number10(b);
      a = b;
      expect(a instanceof Cat10 | Dog10 | Frog10 | number).assertEqual(true);
      expect(a instanceof number | Dog10 | Cat10 | Frog10).assertEqual(true);
      check_number10(a);
      a = new Dog10();
      b = cast20(a);
      expect(b instanceof Cat10 | Dog10 | Frog10 | number).assertEqual(true);
      expect(b instanceof number | Dog10 | Cat10 | Frog10).assertEqual(true);
      check_dog10(b);
      a = b;
      expect(a instanceof Cat10 | Dog10 | Frog10 | number).assertEqual(true);
      expect(a instanceof number | Dog10 | Cat10 | Frog10).assertEqual(true);
      check_dog10(a);
      a = new Frog10();
      b = cast20(a);
      expect(b instanceof Cat10 | Dog10 | Frog10 | number).assertEqual(true);
      expect(b instanceof number | Dog10 | Cat10 | Frog10).assertEqual(true);
      check_frog10(b);
      a = b;
      expect(a instanceof Cat10 | Dog10 | Frog10 | number).assertEqual(true);
      expect(a instanceof number | Dog10 | Cat10 | Frog10).assertEqual(true);
      check_frog10(a);

      expect(testNS81.runTest()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_2600
     * @tc.name      testUnionTypesIdentity0026
     * @tc.desc      Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0026';

      let a: number | Dog11 | Cat11 | Frog11 = new Cat11()
      let b: Cat11 | Dog11 | Frog11 | number = cast21(a)
      expect(a instanceof Cat11 | Dog11 | Frog11 | number).assertEqual(true)
      expect(a instanceof number | Dog11 | Cat11 | Frog11).assertEqual(true)
      check_cat11(a)
      expect(b instanceof Cat11 | Dog11 | Frog11 | number).assertEqual(true)
      expect(b instanceof number | Dog11 | Cat11 | Frog11).assertEqual(true)
      check_cat11(b)
      a = b
      expect(a instanceof Cat11 | Dog11 | Frog11 | number).assertEqual(true)
      expect(a instanceof number | Dog11 | Cat11 | Frog11).assertEqual(true)
      check_cat11(a)
      a = 7.8
      b = cast21(a)
      expect(b instanceof Cat11 | Dog11 | Frog11 | number).assertEqual(true)
      expect(b instanceof number | Dog11 | Cat11 | Frog11).assertEqual(true)
      check_number11(b)
      a = b
      expect(a instanceof Cat11 | Dog11 | Frog11 | number).assertEqual(true)
      expect(a instanceof number | Dog11 | Cat11 | Frog11).assertEqual(true)
      check_number11(a)
      a = new Dog11()
      b = cast21(a)
      expect(b instanceof Cat11 | Dog11 | Frog11 | number).assertEqual(true)
      expect(b instanceof number | Dog11 | Cat11 | Frog11).assertEqual(true)
      check_dog11(b)
      a = b
      expect(a instanceof Cat11 | Dog11 | Frog11 | number).assertEqual(true)
      expect(a instanceof number | Dog11 | Cat11 | Frog11).assertEqual(true)
      check_dog11(a)
      a = new Frog11()
      b = cast21(a)
      expect(b instanceof Cat11 | Dog11 | Frog11 | number).assertEqual(true)
      expect(b instanceof number | Dog11 | Cat11 | Frog11).assertEqual(true)
      check_frog11(b)
      a = b
      expect(a instanceof Cat11 | Dog11 | Frog11 | number).assertEqual(true)
      expect(a instanceof number | Dog11 | Cat11 | Frog11).assertEqual(true)
      check_frog11(a)

      expect(testNS82.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_UNION_TYPES_IDENTITY_2700
     * @tc.name      testUnionTypesIdentity0027
     * @tc.desc      Checking Union types A and B are identical on custom types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0027';

      let a: Cat12 | Dog12 | Frog12 | number = new Cat12()
      let b: number | Dog12 | Cat12 | Frog12 = cast22(a)
      expect(a instanceof Cat12 | Dog12 | Frog12 | number).assertEqual(true)
      expect(a instanceof number | Dog12 | Cat12 | Frog12).assertEqual(true)
      check_cat12(a)
      expect(b instanceof Cat12 | Dog12 | Frog12 | number).assertEqual(true)
      expect(b instanceof number | Dog12 | Cat12 | Frog12).assertEqual(true)
      check_cat12(b)
      a = b
      expect(a instanceof Cat12 | Dog12 | Frog12 | number).assertEqual(true)
      expect(a instanceof number | Dog12 | Cat12 | Frog12).assertEqual(true)
      check_cat12(a)
      a = 7.8
      b = cast22(a)
      expect(b instanceof Cat12 | Dog12 | Frog12 | number).assertEqual(true)
      expect(b instanceof number | Dog12 | Cat12 | Frog12).assertEqual(true)
      check_number12(b)
      a = b
      expect(a instanceof Cat12 | Dog12 | Frog12 | number).assertEqual(true)
      expect(a instanceof number | Dog12 | Cat12 | Frog12).assertEqual(true)
      check_number12(a)
      a = new Dog12()
      b = cast22(a)
      expect(b instanceof Cat12 | Dog12 | Frog12 | number).assertEqual(true)
      expect(b instanceof number | Dog12 | Cat12 | Frog12).assertEqual(true)
      check_dog12(b)
      a = b
      expect(a instanceof Cat12 | Dog12 | Frog12 | number).assertEqual(true)
      expect(a instanceof number | Dog12 | Cat12 | Frog12).assertEqual(true)
      check_dog12(a)
      a = new Frog12()
      b = cast22(a)
      expect(b instanceof Cat12 | Dog12 | Frog12 | number).assertEqual(true)
      expect(b instanceof number | Dog12 | Cat12 | Frog12).assertEqual(true)
      check_frog12(b)
      a = b
      expect(a instanceof Cat12 | Dog12 | Frog12 | number).assertEqual(true)
      expect(a instanceof number | Dog12 | Cat12 | Frog12).assertEqual(true)
      check_frog12(a)

      expect(testNS83.runTest()).assertEqual(true)

    });
  })
}