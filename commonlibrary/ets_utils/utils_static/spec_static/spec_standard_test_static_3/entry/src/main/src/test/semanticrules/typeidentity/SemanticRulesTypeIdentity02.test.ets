import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

class Cat6 { v: string = "cat" }
class Dog6 { v: bigint = 123n }
class Frog6 { v: number = 5 }

function check_cat6(value: Cat6 | number | Dog6 | Frog6): void {
  expect(value instanceof Cat6).assertTrue();
  expect((value as Cat6).v).assertEqual("cat");
}

function check_number6(value: Cat6 | number | Dog6 | Frog6): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog6(value: Cat6 | number | Dog6 | Frog6): void {
  expect(value instanceof Dog6).assertTrue();
  expect((value as Dog6).v).assertEqual(123n);
}

function check_frog6(value: Cat6 | number | Dog6 | Frog6): void {
  expect(value instanceof Frog6).assertTrue();
  expect((value as Frog6).v).assertEqual(5);
}

class Cat7 { v: string = "cat" }
class Dog7 { v: bigint = 123n }
class Frog7 { v: number = 5 }

function check_cat7(value: Cat7 | number | Dog7 | Frog7): void {
  expect(value instanceof Cat7).assertTrue();
  expect((value as Cat7).v).assertEqual("cat");
}

function check_number7(value: Cat7 | number | Dog7 | Frog7): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog7(value: Cat7 | number | Dog7 | Frog7): void {
  expect(value instanceof Dog7).assertTrue();
  expect((value as Dog7).v).assertEqual(123n);
}

function check_frog7(value: Cat7 | number | Dog7 | Frog7): void {
  expect(value instanceof Frog7).assertTrue();
  expect((value as Frog7).v).assertEqual(5);
}

class Cat8 { v: string = "cat" }
class Dog8 { v: bigint = 123n }
class Frog8 { v: number = 5 }

function check_cat8(value: Cat8 | number | Dog8 | Frog8): void {
  expect(value instanceof Cat8).assertTrue();
  expect((value as Cat8).v).assertEqual("cat");
}

function check_number8(value: Cat8 | number | Dog8 | Frog8): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog8(value: Cat8 | number | Dog8 | Frog8): void {
  expect(value instanceof Dog8).assertTrue();
  expect((value as Dog8).v).assertEqual(123n);
}

function check_frog8(value: Cat8 | number | Dog8 | Frog8): void {
  expect(value instanceof Frog8).assertTrue();
  expect((value as Frog8).v).assertEqual(5);
}

class Cat9 { v: string = "cat" }
class Dog9 { v: bigint = 123n }
class Frog9 { v: number = 5 }

function check_cat9(value: Cat9 | number | Dog9 | Frog9): void {
  expect(value instanceof Cat9).assertTrue();
  expect((value as Cat9).v).assertEqual("cat");
}

function check_number9(value: Cat9 | number | Dog9 | Frog9): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog9(value: Cat9 | number | Dog9 | Frog9): void {
  expect(value instanceof Dog9).assertTrue();
  expect((value as Dog9).v).assertEqual(123n);
}

function check_frog9(value: Cat9 | number | Dog9 | Frog9): void {
  expect(value instanceof Frog9).assertTrue();
  expect((value as Frog9).v).assertEqual(5);
}

namespace testNS97 {
  export function runTest(): boolean {
    let a: (Cat6 | Dog6 | Frog6 | number)[] = [new Cat6(), 7.8, new Dog6(), new Frog6()];
    let b: Array<number | Dog6 | Cat6 | Frog6> = a as Array<number | Dog6 | Cat6 | Frog6>;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat6).assertTrue();
    expect((b[0] as Cat6).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog6).assertTrue();
    expect((b[2] as Dog6).v).assertEqual(123n);
    expect(b[3] instanceof Frog6).assertTrue();
    expect((b[3] as Frog6).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat6).assertTrue();
    expect((a[0] as Cat6).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog6).assertTrue();
    expect((a[2] as Dog6).v).assertEqual(123n);
    expect(a[3] instanceof Frog6).assertTrue();
    expect((a[3] as Frog6).v).assertEqual(5);

    return true;
  }
}

namespace testNS98 {
  export function runTest(): boolean {
    let a: Array<Cat7 | Dog7 | Frog7 | number> = [new Cat7(), 7.8, new Dog7(), new Frog7()];
    let b: (number | Dog7 | Cat7 | Frog7)[] = a as (number | Dog7 | Cat7 | Frog7)[];

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat7).assertTrue();
    expect((b[0] as Cat7).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog7).assertTrue();
    expect((b[2] as Dog7).v).assertEqual(123n);
    expect(b[3] instanceof Frog7).assertTrue();
    expect((b[3] as Frog7).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat7).assertTrue();
    expect((a[0] as Cat7).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog7).assertTrue();
    expect((a[2] as Dog7).v).assertEqual(123n);
    expect(a[3] instanceof Frog7).assertTrue();
    expect((a[3] as Frog7).v).assertEqual(5);

    return true;
  }
}

namespace testNS99 {
  export function runTest(): boolean {
    let a: (Cat8 | Dog8 | Frog8 | number)[] = [new Cat8(), 7.8, new Dog8(), new Frog8()];
    let b: Array<number | Dog8 | Cat8 | Frog8> = a as Array<number | Dog8 | Cat8 | Frog8>;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat8).assertTrue();
    expect((b[0] as Cat8).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog8).assertTrue();
    expect((b[2] as Dog8).v).assertEqual(123n);
    expect(b[3] instanceof Frog8).assertTrue();
    expect((b[3] as Frog8).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat8).assertTrue();
    expect((a[0] as Cat8).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog8).assertTrue();
    expect((a[2] as Dog8).v).assertEqual(123n);
    expect(a[3] instanceof Frog8).assertTrue();
    expect((a[3] as Frog8).v).assertEqual(5);

    return true;
  }
}

namespace testNS100 {
  export function runTest(): boolean {
    let a: Array<Cat9 | Dog9 | Frog9 | number> = [new Cat9(), 7.8, new Dog9(), new Frog9()];
    let b: (number | Dog9 | Cat9 | Frog9)[] = a as (number | Dog9 | Cat9 | Frog9)[];

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat9).assertTrue();
    expect((b[0] as Cat9).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog9).assertTrue();
    expect((b[2] as Dog9).v).assertEqual(123n);
    expect(b[3] instanceof Frog9).assertTrue();
    expect((b[3] as Frog9).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat9).assertTrue();
    expect((a[0] as Cat9).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog9).assertTrue();
    expect((a[2] as Dog9).v).assertEqual(123n);
    expect(a[3] instanceof Frog9).assertTrue();
    expect((a[3] as Frog9).v).assertEqual(5);

    return true;
  }
}


class Cat10 { v: string = "cat" }
class Dog10 { v: bigint = 123n }
class Frog10 { v: number = 5 }

function check_cat10(value: Cat10 | number | Dog10 | Frog10): void {
  expect(value instanceof Cat10).assertTrue();
  expect((value as Cat10).v).assertEqual("cat");
}

function check_number10(value: Cat10 | number | Dog10 | Frog10): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog10(value: Cat10 | number | Dog10 | Frog10): void {
  expect(value instanceof Dog10).assertTrue();
  expect((value as Dog10).v).assertEqual(123n);
}

function check_frog10(value: Cat10 | number | Dog10 | Frog10): void {
  expect(value instanceof Frog10).assertTrue();
  expect((value as Frog10).v).assertEqual(5);
}

class Cat11 { v: string = "cat" }
class Dog11 { v: bigint = 123n }
class Frog11 { v: number = 5 }

function check_cat11(value: Cat11 | number | Dog11 | Frog11): void {
  expect(value instanceof Cat11).assertTrue();
  expect((value as Cat11).v).assertEqual("cat");
}

function check_number11(value: Cat11 | number | Dog11 | Frog11): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog11(value: Cat11 | number | Dog11 | Frog11): void {
  expect(value instanceof Dog11).assertTrue();
  expect((value as Dog11).v).assertEqual(123n);
}

function check_frog11(value: Cat11 | number | Dog11 | Frog11): void {
  expect(value instanceof Frog11).assertTrue();
  expect((value as Frog11).v).assertEqual(5);
}

class Cat12 { v: string = "cat" }
class Dog12 { v: bigint = 123n }
class Frog12 { v: number = 5 }

function check_cat12(value: Cat12 | number | Dog12 | Frog12): void {
  expect(value instanceof Cat12).assertTrue();
  expect((value as Cat12).v).assertEqual("cat");
}

function check_number12(value: Cat12 | number | Dog12 | Frog12): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog12(value: Cat12 | number | Dog12 | Frog12): void {
  expect(value instanceof Dog12).assertTrue();
  expect((value as Dog12).v).assertEqual(123n);
}

function check_frog12(value: Cat12 | number | Dog12 | Frog12): void {
  expect(value instanceof Frog12).assertTrue();
  expect((value as Frog12).v).assertEqual(5);
}

class Cat13 { v: string = "cat" }
class Dog13 { v: bigint = 123n }
class Frog13 { v: number = 5 }

function check_cat13(value: Cat13 | number | Dog13 | Frog13): void {
  expect(value instanceof Cat13).assertTrue();
  expect((value as Cat13).v).assertEqual("cat");
}

function check_number13(value: Cat13 | number | Dog13 | Frog13): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog13(value: Cat13 | number | Dog13 | Frog13): void {
  expect(value instanceof Dog13).assertTrue();
  expect((value as Dog13).v).assertEqual(123n);
}

function check_frog13(value: Cat13 | number | Dog13 | Frog13): void {
  expect(value instanceof Frog13).assertTrue();
  expect((value as Frog13).v).assertEqual(5);
}

function cast(p: object): (number | Dog13 | Cat13 | Frog13)[] {
  return p as (number | Dog13 | Cat13 | Frog13)[];
}

class Cat14 { v: string = "cat" }
class Dog14 { v: bigint = 123n }
class Frog14 { v: number = 5 }

function check_cat14(value: Cat14 | number | Dog14 | Frog14): void {
  expect(value instanceof Cat14).assertTrue();
  expect((value as Cat14).v).assertEqual("cat");
}

function check_number14(value: Cat14 | number | Dog14 | Frog14): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog14(value: Cat14 | number | Dog14 | Frog14): void {
  expect(value instanceof Dog14).assertTrue();
  expect((value as Dog14).v).assertEqual(123n);
}

function check_frog14(value: Cat14 | number | Dog14 | Frog14): void {
  expect(value instanceof Frog14).assertTrue();
  expect((value as Frog14).v).assertEqual(5);
}
function cast2(p: object): Array<number | Cat14 | Dog14 | Frog14> {
  return p as Array<number | Cat14 | Dog14 | Frog14>;
}

namespace testNS101 {
  export function runTest(): boolean {
    let a: Array<Cat10 | Dog10 | Frog10 | number> = [new Cat10(), 7.8, new Dog10(), new Frog10()];
    let b: (number | Dog10 | Cat10 | Frog10)[] = a as (number | Dog10 | Cat10 | Frog10)[];

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat10).assertTrue();
    expect((b[0] as Cat10).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog10).assertTrue();
    expect((b[2] as Dog10).v).assertEqual(123n);
    expect(b[3] instanceof Frog10).assertTrue();
    expect((b[3] as Frog10).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat10).assertTrue();
    expect((a[0] as Cat10).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog10).assertTrue();
    expect((a[2] as Dog10).v).assertEqual(123n);
    expect(a[3] instanceof Frog10).assertTrue();
    expect((a[3] as Frog10).v).assertEqual(5);

    return true;
  }
}

namespace testNS102 {
  export function runTest(): boolean {
    let a: Array<Cat11 | Dog11 | Frog11 | number> = [new Cat11(), 7.8, new Dog11(), new Frog11()];
    let b: (number | Dog11 | Cat11 | Frog11)[] = a as (number | Dog11 | Cat11 | Frog11)[];

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat11).assertTrue();
    expect((b[0] as Cat11).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog11).assertTrue();
    expect((b[2] as Dog11).v).assertEqual(123n);
    expect(b[3] instanceof Frog11).assertTrue();
    expect((b[3] as Frog11).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat11).assertTrue();
    expect((a[0] as Cat11).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog11).assertTrue();
    expect((a[2] as Dog11).v).assertEqual(123n);
    expect(a[3] instanceof Frog11).assertTrue();
    expect((a[3] as Frog11).v).assertEqual(5);

    return true;
  }
}

namespace testNS103 {
  export function runTest(): boolean {
    let a: (Cat12 | Dog12 | Frog12 | number)[] = [new Cat12(), 7.8, new Dog12(), new Frog12()];
    let b: Array<number | Dog12 | Cat12 | Frog12> = a as Array<number | Dog12 | Cat12 | Frog12>;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat12).assertTrue();
    expect((b[0] as Cat12).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog12).assertTrue();
    expect((b[2] as Dog12).v).assertEqual(123n);
    expect(b[3] instanceof Frog12).assertTrue();
    expect((b[3] as Frog12).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat12).assertTrue();
    expect((a[0] as Cat12).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog12).assertTrue();
    expect((a[2] as Dog12).v).assertEqual(123n);
    expect(a[3] instanceof Frog12).assertTrue();
    expect((a[3] as Frog12).v).assertEqual(5);

    return true;
  }
}

namespace testNS104 {
  export function runTest(): boolean {
    let a: Array<Cat13 | Dog13 | Frog13 | number> = [new Cat13(), 7.8, new Dog13(), new Frog13()];
    let b: (number | Dog13 | Cat13 | Frog13)[] = cast(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat13).assertTrue();
    expect((b[0] as Cat13).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog13).assertTrue();
    expect((b[2] as Dog13).v).assertEqual(123n);
    expect(b[3] instanceof Frog13).assertTrue();
    expect((b[3] as Frog13).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat13).assertTrue();
    expect((a[0] as Cat13).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog13).assertTrue();
    expect((a[2] as Dog13).v).assertEqual(123n);
    expect(a[3] instanceof Frog13).assertTrue();
    expect((a[3] as Frog13).v).assertEqual(5);

    return true;
  }
}

namespace testNS105 {
  export function runTest(): boolean {
    let a: (Cat14 | Dog14 | Frog14 | number)[] = [new Cat14(), 7.8, new Dog14(), new Frog14()];
    let b: Array<number | Dog14 | Cat14 | Frog14> = a as Array<number | Dog14 | Cat14 | Frog14>;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat14).assertTrue();
    expect((b[0] as Cat14).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog14).assertTrue();
    expect((b[2] as Dog14).v).assertEqual(123n);
    expect(b[3] instanceof Frog14).assertTrue();
    expect((b[3] as Frog14).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat14).assertTrue();
    expect((a[0] as Cat14).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog14).assertTrue();
    expect((a[2] as Dog14).v).assertEqual(123n);
    expect(a[3] instanceof Frog14).assertTrue();
    expect((a[3] as Frog14).v).assertEqual(5);

    return true;
  }
}


class Cat15 { v: string = "cat" }
class Dog15 { v: bigint = 123n }
class Frog15 { v: number = 5 }

function check_cat15(value: Cat15 | number | Dog15 | Frog15): void {
  expect(value instanceof Cat15).assertTrue();
  expect((value as Cat15).v).assertEqual("cat");
}

function check_number15(value: Cat15 | number | Dog15 | Frog15): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog15(value: Cat15 | number | Dog15 | Frog15): void {
  expect(value instanceof Dog15).assertTrue();
  expect((value as Dog15).v).assertEqual(123n);
}

function check_frog15(value: Cat15 | number | Dog15 | Frog15): void {
  expect(value instanceof Frog15).assertTrue();
  expect((value as Frog15).v).assertEqual(5);
}

namespace testNS106 {
  export function runTest(): boolean {
    let a: Array<Cat15 | Dog15 | Frog15 | number> = [new Cat15(), 7.8, new Dog15(), new Frog15()];
    let b: (number | Dog15 | Cat15 | Frog15)[] = a as (number | Dog15 | Cat15 | Frog15)[];

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat15).assertTrue();
    expect((b[0] as Cat15).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog15).assertTrue();
    expect((b[2] as Dog15).v).assertEqual(123n);
    expect(b[3] instanceof Frog15).assertTrue();
    expect((b[3] as Frog15).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat15).assertTrue();
    expect((a[0] as Cat15).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog15).assertTrue();
    expect((a[2] as Dog15).v).assertEqual(123n);
    expect(a[3] instanceof Frog15).assertTrue();
    expect((a[3] as Frog15).v).assertEqual(5);

    return true;
  }
}


class Cat17 { v: string = "cat" }
class Dog17 { v: bigint = 123n }
class Frog17 { v: number = 5 }

function check_cat17(value: Cat17 | number | Dog17 | Frog17): void {
  expect(value instanceof Cat17).assertTrue();
  expect((value as Cat17).v).assertEqual("cat");
}

function check_number17(value: Cat17 | number | Dog17 | Frog17): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog17(value: Cat17 | number | Dog17 | Frog17): void {
  expect(value instanceof Dog17).assertTrue();
  expect((value as Dog17).v).assertEqual(123n);
}

function check_frog17(value: Cat17 | number | Dog17 | Frog17): void {
  expect(value instanceof Frog17).assertTrue();
  expect((value as Frog17).v).assertEqual(5);
}

namespace testNS108 {
  export function runTest(): boolean {
    let a: Array<Cat17 | Dog17 | Frog17 | number> = [new Cat17(), 7.8, new Dog17(), new Frog17()];
    let b: (number | Dog17 | Cat17 | Frog17)[] = a as (number | Dog17 | Cat17 | Frog17)[];

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat17).assertTrue();
    expect((b[0] as Cat17).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog17).assertTrue();
    expect((b[2] as Dog17).v).assertEqual(123n);
    expect(b[3] instanceof Frog17).assertTrue();
    expect((b[3] as Frog17).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat17).assertTrue();
    expect((a[0] as Cat17).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog17).assertTrue();
    expect((a[2] as Dog17).v).assertEqual(123n);
    expect(a[3] instanceof Frog17).assertTrue();
    expect((a[3] as Frog17).v).assertEqual(5);

    return true;
  }
}

namespace testNS109 {
  function foo50(p: Array<Object | undefined>): Array<undefined | Object> {
    return p;
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = foo50(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertUndefined();
    expect(b[2]).assertEqual("abc");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertUndefined();
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS110 {
  function foo50(p: Array<Object | undefined | null>): Array<undefined | null | Object> {
    return p;
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = foo50(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertNull();
    expect(b[2]).assertUndefined();

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertNull();
    expect(a[2]).assertUndefined();

    return true;
  }
}

namespace testNS111 {
  function foo50(p: Array<number | boolean>): Array<boolean | number> {
    return p;
  }

  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = foo50(a);

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

namespace testNS112 {
  function foo50(p: Array<number | string | boolean>): Array<string | boolean | number> {
    return p;
  }

  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = foo50(a);

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

namespace testNS113 {
  function foo50(p: Array<String>): Array<String> {
    return p;
  }

  export function runTest(): boolean {
    let a: String[] = ["On Review", "In Progress", "Done"];
    let b: Array<String> = foo50(a);

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

function foo1(p: Array<Object | undefined>): (undefined | Object)[] {
  return p;
}
namespace testNS114 {
  function foo(p: Array<Object | undefined>): Array<undefined | Object> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = foo(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertUndefined();
    expect(b[2]).assertEqual("abc");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertUndefined();
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS115 {
  function foo(p: Array<Object | undefined | null>): Array<undefined | null | Object> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = foo(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertNull();
    expect(b[2]).assertUndefined();

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertNull();
    expect(a[2]).assertUndefined();

    return true;
  }
}

namespace testNS116 {
  function foo(p: Array<number | boolean>): Array<boolean | number> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = foo(a);

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

namespace testNS117 {
  function foo(p: Array<number | string | boolean>): Array<string | boolean | number> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = foo(a);

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


namespace testNS118 {
  function foo1(p: Array<String>): Array<String> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<String> = ["On Review", "In Progress", "Done"];
    let b: String[] = foo1(a);

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

function foo29(p: Array<Object | undefined>): (undefined | Object)[] {
  return p;
}
namespace testNS119 {
  function foo24(p: Array<Object | undefined>): Array<undefined | Object> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = foo24(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertUndefined();
    expect(b[2]).assertEqual("abc");

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertUndefined();
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS120 {
  function foo25(p: Array<Object | undefined | null>): Array<undefined | null | Object> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = foo25(a);

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(5n);
    expect(b[1]).assertNull();
    expect(b[2]).assertUndefined();

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(5n);
    expect(a[1]).assertNull();
    expect(a[2]).assertUndefined();

    return true;
  }
}

namespace testNS121 {
  function foo26(p: Array<number | boolean>): Array<boolean | number> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = foo26(a);

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

// ====================== testNS122 ======================
namespace testNS122 {
  function foo27(p: Array<number | string | boolean>): Array<string | boolean | number> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = foo27(a);

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

namespace testNS123 {
  function foo28(p: Array<String>): Array<String> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<String> = ["On Review", "In Progress", "Done"];
    let b: String[] = foo28(a);

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

function foo35(p: Array<Object | undefined>): (undefined | Object)[] {
  return p;
}
export default function SemanticRulesTypeIdentity02(): void {
  describe('SemanticRulesTypeIdentity02', () => {
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
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_2500
     * @tc.name      testSemanticRulesTypeIdentity0025
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0025';

        let a: (Cat6 | Dog6 | Frog6 | number)[] = [new Cat6(), 7.8, new Dog6(), new Frog6()];
        let b: Array<number | Dog6 | Cat6 | Frog6> = a as Array<number | Dog6 | Cat6 | Frog6>;

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat6(b[0]);
        check_number6(b[1]);
        check_dog6(b[2]);
        check_frog6(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat6(a[0]);
        check_number6(a[1]);
        check_dog6(a[2]);
        check_frog6(a[3]);

        expect(testNS97.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_2600
     * @tc.name      testSemanticRulesTypeIdentity0026
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0026';

        let a: Array<Cat7 | Dog7 | Frog7 | number> = [new Cat7(), 7.8, new Dog7(), new Frog7()];
        let b: (number | Dog7 | Cat7 | Frog7)[] = a as (number | Dog7 | Cat7 | Frog7)[];

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat7(b[0]);
        check_number7(b[1]);
        check_dog7(b[2]);
        check_frog7(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat7(a[0]);
        check_number7(a[1]);
        check_dog7(a[2]);
        check_frog7(a[3]);

        expect(testNS98.runTest()).assertTrue();
      });


    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_2700
     * @tc.name      testSemanticRulesTypeIdentity0027
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0027';

        let a: (Cat8 | Dog8 | Frog8 | number)[] = [new Cat8(), 7.8, new Dog8(), new Frog8()];
        let b: Array<number | Dog8 | Cat8 | Frog8> = a as Array<number | Dog8 | Cat8 | Frog8>;

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat8(b[0]);
        check_number8(b[1]);
        check_dog8(b[2]);
        check_frog8(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat8(a[0]);
        check_number8(a[1]);
        check_dog8(a[2]);
        check_frog8(a[3]);

        expect(testNS99.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_2800
     * @tc.name      testSemanticRulesTypeIdentity0028
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0028';

        let a: Array<Cat9 | Dog9 | Frog9 | number> = [new Cat9(), 7.8, new Dog9(), new Frog9()];
        let b: (number | Dog9 | Cat9 | Frog9)[] = a as (number | Dog9 | Cat9 | Frog9)[];

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat9(b[0]);
        check_number9(b[1]);
        check_dog9(b[2]);
        check_frog9(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat9(a[0]);
        check_number9(a[1]);
        check_dog9(a[2]);
        check_frog9(a[3]);

        expect(testNS100.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_2900
     * @tc.name      testSemanticRulesTypeIdentity0029
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0029';

        let a: (Cat10 | Dog10 | Frog10 | number)[] = [new Cat10(), 7.8, new Dog10(), new Frog10()];
        let b: Array<number | Dog10 | Cat10 | Frog10> = a as Array<number | Dog10 | Cat10 | Frog10>;

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat10(b[0]);
        check_number10(b[1]);
        check_dog10(b[2]);
        check_frog10(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat10(a[0]);
        check_number10(a[1]);
        check_dog10(a[2]);
        check_frog10(a[3]);

        expect(testNS101.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_3000
     * @tc.name      testSemanticRulesTypeIdentity0030
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0030';

        let a: Array<Cat11 | Dog11 | Frog11 | number> = [new Cat11(), 7.8, new Dog11(), new Frog11()];
        let b: (number | Dog11 | Cat11 | Frog11)[] = a as (number | Dog11 | Cat11 | Frog11)[];

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat11(b[0]);
        check_number11(b[1]);
        check_dog11(b[2]);
        check_frog11(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat11(a[0]);
        check_number11(a[1]);
        check_dog11(a[2]);
        check_frog11(a[3]);

        expect(testNS102.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_3100
     * @tc.name      testSemanticRulesTypeIdentity0031
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0031';

        let a: (Cat12 | Dog12 | Frog12 | number)[] = [new Cat12(), 7.8, new Dog12(), new Frog12()];
        let b: Array<number | Dog12 | Cat12 | Frog12> = a as Array<number | Dog12 | Cat12 | Frog12>;

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat12(b[0]);
        check_number12(b[1]);
        check_dog12(b[2]);
        check_frog12(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat12(a[0]);
        check_number12(a[1]);
        check_dog12(a[2]);
        check_frog12(a[3]);

        expect(testNS103.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_3200
     * @tc.name      testSemanticRulesTypeIdentity0032
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0032';

        let a: Array<Cat13 | Dog13 | Frog13 | number> = [new Cat13(), 7.8, new Dog13(), new Frog13()];
        let b: (number | Dog13 | Cat13 | Frog13)[] = cast(a);

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat13(b[0]);
        check_number13(b[1]);
        check_dog13(b[2]);
        check_frog13(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat13(a[0]);
        check_number13(a[1]);
        check_dog13(a[2]);
        check_frog13(a[3]);

        expect(testNS104.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_3300
     * @tc.name      testSemanticRulesTypeIdentity0033
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0033';

        let a: (Cat14 | Dog14 | Frog14 | number)[] = [new Cat14(), 7.8, new Dog14(), new Frog14()];
        let b: Array<number | Dog14 | Cat14 | Frog14> = cast2(a);

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat14(b[0]);
        check_number14(b[1]);
        check_dog14(b[2]);
        check_frog14(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat14(a[0]);
        check_number14(a[1]);
        check_dog14(a[2]);
        check_frog14(a[3]);

        expect(testNS105.runTest()).assertTrue();
      });
    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_3400
     * @tc.name      testSemanticRulesTypeIdentity0034
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0034';

        let a: Array<Cat15 | Dog15 | Frog15 | number> = [new Cat15(), 7.8, new Dog15(), new Frog15()];
        let b: (number | Dog15 | Cat15 | Frog15)[] = a as (number | Dog15 | Cat15 | Frog15)[];
        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat15(b[0]);
        check_number15(b[1]);
        check_dog15(b[2]);
        check_frog15(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat15(a[0]);
        check_number15(a[1]);
        check_dog15(a[2]);
        check_frog15(a[3]);

        expect(testNS106.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_3500
     * @tc.name      testSemanticRulesTypeIdentity0035
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0035';

        let a: Array<Cat17 | Dog17 | Frog17 | number> = [new Cat17(), 7.8, new Dog17(), new Frog17()];
        let b: (number | Dog17 | Cat17 | Frog17)[] = a as (number | Dog17 | Cat17 | Frog17)[];

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        check_cat17(b[0]);
        check_number17(b[1]);
        check_dog17(b[2]);
        check_frog17(b[3]);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        check_cat17(a[0]);
        check_number17(a[1]);
        check_dog17(a[2]);
        check_frog17(a[3]);

        expect(testNS108.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_3600
     * @tc.name      testSemanticRulesTypeIdentity0036
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0036';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = foo35(a);

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

        expect(testNS109.runTest()).assertTrue();
        expect(testNS110.runTest()).assertTrue();
        expect(testNS111.runTest()).assertTrue();
        expect(testNS112.runTest()).assertTrue();
        expect(testNS113.runTest()).assertTrue();
      });


    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_3700
     * @tc.name      testSemanticRulesTypeIdentity0037
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0037';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = foo1(a);

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

        expect(testNS114.runTest()).assertTrue();
        expect(testNS115.runTest()).assertTrue();
        expect(testNS116.runTest()).assertTrue();
        expect(testNS117.runTest()).assertTrue();
        expect(testNS118.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_3800
     * @tc.name      testSemanticRulesTypeIdentity0038
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0038';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = foo29(a);

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

        expect(testNS119.runTest()).assertTrue();
        expect(testNS120.runTest()).assertTrue();
        expect(testNS121.runTest()).assertTrue();
        expect(testNS122.runTest()).assertTrue();
        expect(testNS123.runTest()).assertTrue();
      });
  });
}
