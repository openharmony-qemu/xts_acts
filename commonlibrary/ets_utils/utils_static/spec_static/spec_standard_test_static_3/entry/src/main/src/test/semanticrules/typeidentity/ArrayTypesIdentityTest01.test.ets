import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}
function cast(p: Object) {
  return p as Array<number>
}

namespace testNS1_6 {
  function cast(p: Object) {
    return p as number[]
  }

  export function runTest_6(): boolean {
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

namespace testNS2_6 {
  function cast(p: Object) {
    return p as number[]
  }

  export function runTest_6(): boolean {
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

namespace testNS3_6 {
  function cast(p: Object) {
    return p as number[]
  }

  export function runTest_6(): boolean {
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

namespace testNS4_6 {
  function cast(p: Object) {
    return p as number[]
  }

  export function runTest_6(): boolean {
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

namespace testNS5_6 {
  function cast(p: Object) {
    return p as number[]
  }

  export function runTest_6(): boolean {
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

namespace testNS6_6 {
  function cast(p: Object) {
    return p as number[]
  }

  export function runTest_6(): boolean {
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

namespace testNS7_6 {
  function cast(p: Object) {
    return p as number[]
  }

  export function runTest_6(): boolean {
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

namespace testNS8_6 {
  function cast(p: Object) {
    return p as bigint[]
  }

  export function runTest_6(): boolean {
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

namespace testNS9_6 {
  function cast(p: Object) {
    return p as string[]
  }

  export function runTest_6(): boolean {
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

namespace testNS10_6 {
  function cast(p: Object) {
    return p as string[]
  }

  export function runTest_6(): boolean {
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

namespace testNS11_6 {
  function cast(p: Object) {
    return p as boolean[]
  }

  export function runTest_6(): boolean {
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

namespace testNS12_6 {
  function cast(p: Object) {
    return p as Object[]
  }

  export function runTest_6(): boolean {
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

namespace testNS13_6 {
  function cast(p: Object) {
    return p as (Object | undefined)[]
  }

  export function runTest_6(): boolean {
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

namespace testNS14_6 {
  function cast(p: Object) {
    return p as (Object | undefined | null)[]
  }

  export function runTest_6(): boolean {
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

namespace testNS15_6 {
  function cast(p: Object): (Object | undefined | null)[]{
    return p as (Object | undefined | null)[]
  }

  export function runTest_6(): boolean {
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

function cast_6(p: Object) {
  return p as number[]
}

namespace testNS1_7 {
  function cast_7(p: Object): Array<number> {
    return p as Array<number>;
  }

  export function runTest_7(): boolean {
    let a: number[] = [1, 3, 5];
    let b: Array<number> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof number).assertEqual(true);
    expect(b[0]).assertEqual(1);
    expect(b[1] instanceof number).assertEqual(true);
    expect(b[1]).assertEqual(3);
    expect(b[2] instanceof number).assertEqual(true);
    expect(b[2]).assertEqual(5);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof number).assertEqual(true);
    expect(a[0]).assertEqual(1);
    expect(a[1] instanceof number).assertEqual(true);
    expect(a[1]).assertEqual(3);
    expect(a[2] instanceof number).assertEqual(true);
    expect(a[2]).assertEqual(5);
    return true;
  }
}

namespace testNS2_7 {
  function cast_7(p: Object): Array<number> {
    return p as Array<number>;
  }

  export function runTest_7(): boolean {
    let a: number[] = [1, 3, 5];
    let b: Array<number> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof number).assertEqual(true);
    expect(b[0]).assertEqual(1);
    expect(b[1] instanceof number).assertEqual(true);
    expect(b[1]).assertEqual(3);
    expect(b[2] instanceof number).assertEqual(true);
    expect(b[2]).assertEqual(5);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof number).assertEqual(true);
    expect(a[0]).assertEqual(1);
    expect(a[1] instanceof number).assertEqual(true);
    expect(a[1]).assertEqual(3);
    expect(a[2] instanceof number).assertEqual(true);
    expect(a[2]).assertEqual(5);
    return true;
  }
}

namespace testNS3_7 {
  function cast_7(p: Object): Array<number> {
    return p as Array<number>;
  }

  export function runTest_7(): boolean {
    let a: number[] = [1, 3, 5];
    let b: Array<number> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof number).assertEqual(true);
    expect(b[0]).assertEqual(1);
    expect(b[1] instanceof number).assertEqual(true);
    expect(b[1]).assertEqual(3);
    expect(b[2] instanceof number).assertEqual(true);
    expect(b[2]).assertEqual(5);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof number).assertEqual(true);
    expect(a[0]).assertEqual(1);
    expect(a[1] instanceof number).assertEqual(true);
    expect(a[1]).assertEqual(3);
    expect(a[2] instanceof number).assertEqual(true);
    expect(a[2]).assertEqual(5);
    return true;
  }
}

namespace testNS4_7 {
  function cast_7(p: Object): Array<number> {
    return p as Array<number>;
  }

  export function runTest_7(): boolean {
    let a: number[] = [1, 3, 5];
    let b: Array<number> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof number).assertEqual(true);
    expect(b[0]).assertEqual(1);
    expect(b[1] instanceof number).assertEqual(true);
    expect(b[1]).assertEqual(3);
    expect(b[2] instanceof number).assertEqual(true);
    expect(b[2]).assertEqual(5);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof number).assertEqual(true);
    expect(a[0]).assertEqual(1);
    expect(a[1] instanceof number).assertEqual(true);
    expect(a[1]).assertEqual(3);
    expect(a[2] instanceof number).assertEqual(true);
    expect(a[2]).assertEqual(5);
    return true;
  }
}

namespace testNS5_7 {
  function cast_7(p: Object): Array<number> {
    return p as Array<number>;
  }

  export function runTest_7(): boolean {
    let a: number[] = [1.5, 3.7, 5.4];
    let b: Array<number> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof number).assertEqual(true);
    expect(b[0]).assertEqual(1.5);
    expect(b[1] instanceof number).assertEqual(true);
    expect(b[1]).assertEqual(3.7);
    expect(b[2] instanceof number).assertEqual(true);
    expect(b[2]).assertEqual(5.4);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof number).assertEqual(true);
    expect(a[0]).assertEqual(1.5);
    expect(a[1] instanceof number).assertEqual(true);
    expect(a[1]).assertEqual(3.7);
    expect(a[2] instanceof number).assertEqual(true);
    expect(a[2]).assertEqual(5.4);
    return true;
  }
}

namespace testNS6_7 {
  function cast_7(p: Object): Array<number> {
    return p as Array<number>;
  }

  export function runTest_7(): boolean {
    let a: number[] = [1.5, 3.7, 5.4];
    let b: Array<number> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof number).assertEqual(true);
    expect(b[0]).assertEqual(1.5);
    expect(b[1] instanceof number).assertEqual(true);
    expect(b[1]).assertEqual(3.7);
    expect(b[2] instanceof number).assertEqual(true);
    expect(b[2]).assertEqual(5.4);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof number).assertEqual(true);
    expect(a[0]).assertEqual(1.5);
    expect(a[1] instanceof number).assertEqual(true);
    expect(a[1]).assertEqual(3.7);
    expect(a[2] instanceof number).assertEqual(true);
    expect(a[2]).assertEqual(5.4);
    return true;
  }
}

namespace testNS7_7 {
  function cast_7(p: Object): Array<number> {
    return p as Array<number>;
  }

  export function runTest_7(): boolean {
    let a: number[] = [1.5, 3.7, 5.4];
    let b: Array<number> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof number).assertEqual(true);
    expect(b[0]).assertEqual(1.5);
    expect(b[1] instanceof number).assertEqual(true);
    expect(b[1]).assertEqual(3.7);
    expect(b[2] instanceof number).assertEqual(true);
    expect(b[2]).assertEqual(5.4);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof number).assertEqual(true);
    expect(a[0]).assertEqual(1.5);
    expect(a[1] instanceof number).assertEqual(true);
    expect(a[1]).assertEqual(3.7);
    expect(a[2] instanceof number).assertEqual(true);
    expect(a[2]).assertEqual(5.4);
    return true;
  }
}

namespace testNS8_7 {
  function cast_7(p: Object): Array<bigint> {
    return p as Array<bigint>;
  }

  export function runTest_7(): boolean {
    let a: bigint[] = [1n, 3n, 5n];
    let b: Array<bigint> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof bigint).assertEqual(true);
    expect(b[0]).assertEqual(1n);
    expect(b[1] instanceof bigint).assertEqual(true);
    expect(b[1]).assertEqual(3n);
    expect(b[2] instanceof bigint).assertEqual(true);
    expect(b[2]).assertEqual(5n);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof bigint).assertEqual(true);
    expect(a[0]).assertEqual(1n);
    expect(a[1] instanceof bigint).assertEqual(true);
    expect(a[1]).assertEqual(3n);
    expect(a[2] instanceof bigint).assertEqual(true);
    expect(a[2]).assertEqual(5n);
    return true;
  }
}

namespace testNS9_7 {
  function cast_7(p: Object): Array<string> {
    return p as Array<string>;
  }

  export function runTest_7(): boolean {
    let a: string[] = ["ab", "c", "def"];
    let b: Array<string> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof string).assertEqual(true);
    expect(b[0]).assertEqual("ab");
    expect(b[1] instanceof string).assertEqual(true);
    expect(b[1]).assertEqual("c");
    expect(b[2] instanceof string).assertEqual(true);
    expect(b[2]).assertEqual("def");
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof string).assertEqual(true);
    expect(a[0]).assertEqual("ab");
    expect(a[1] instanceof string).assertEqual(true);
    expect(a[1]).assertEqual("c");
    expect(a[2] instanceof string).assertEqual(true);
    expect(a[2]).assertEqual("def");
    return true;
  }
}

namespace testNS10_7 {
  function cast_7(p: Object): Array<string> {
    return p as Array<string>;
  }

  export function runTest_7(): boolean {
    let a: string[] = ['a', 'b', 'c'];
    let b: Array<string> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof string).assertEqual(true);
    expect(b[0]).assertEqual('a');
    expect(b[1] instanceof string).assertEqual(true);
    expect(b[1]).assertEqual('b');
    expect(b[2] instanceof string).assertEqual(true);
    expect(b[2]).assertEqual('c');
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof string).assertEqual(true);
    expect(a[0]).assertEqual('a');
    expect(a[1] instanceof string).assertEqual(true);
    expect(a[1]).assertEqual('b');
    expect(a[2] instanceof string).assertEqual(true);
    expect(a[2]).assertEqual('c');
    return true;
  }
}

namespace testNS11_7 {
  function cast_7(p: Object): Array<boolean> {
    return p as Array<boolean>;
  }

  export function runTest_7(): boolean {
    let a: boolean[] = [false, true, false];
    let b: Array<boolean> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof boolean).assertEqual(true);
    expect(b[0]).assertEqual(false);
    expect(b[1] instanceof boolean).assertEqual(true);
    expect(b[1]).assertEqual(true);
    expect(b[2] instanceof boolean).assertEqual(true);
    expect(b[2]).assertEqual(false);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof boolean).assertEqual(true);
    expect(a[0]).assertEqual(false);
    expect(a[1] instanceof boolean).assertEqual(true);
    expect(a[1]).assertEqual(true);
    expect(a[2] instanceof boolean).assertEqual(true);
    expect(a[2]).assertEqual(false);
    return true;
  }
}

namespace testNS12_7 {
  function cast_7(p: Object): Array<Object> {
    return p as Array<Object>;
  }

  export function runTest_7(): boolean {
    let a: Object[] = [1, 5n, "abc"];
    let b: Array<Object> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof Object).assertEqual(true);
    expect(b[0]).assertEqual(1);
    expect(b[1] instanceof Object).assertEqual(true);
    expect(b[1]).assertEqual(5n);
    expect(b[2] instanceof Object).assertEqual(true);
    expect(b[2]).assertEqual("abc");
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof Object).assertEqual(true);
    expect(a[0]).assertEqual(1);
    expect(a[1] instanceof Object).assertEqual(true);
    expect(a[1]).assertEqual(5n);
    expect(a[2] instanceof Object).assertEqual(true);
    expect(a[2]).assertEqual("abc");
    return true;
  }
}

namespace testNS13_7 {
  function cast_7(p: Object): Array<(Object | undefined)> {
    return p as Array<(Object | undefined)>;
  }

  export function runTest_7(): boolean {
    let a: (Object | undefined)[] = [undefined, 5n, "abc"];
    let b: Array<(Object | undefined)> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof (Object | undefined)).assertEqual(true);
    expect(b[0]).assertEqual(undefined);
    expect(b[1] instanceof (Object | undefined)).assertEqual(true);
    expect(b[1]).assertEqual(5n);
    expect(b[2] instanceof (Object | undefined)).assertEqual(true);
    expect(b[2]).assertEqual("abc");
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof (Object | undefined)).assertEqual(true);
    expect(a[0]).assertEqual(undefined);
    expect(a[1] instanceof (Object | undefined)).assertEqual(true);
    expect(a[1]).assertEqual(5n);
    expect(a[2] instanceof (Object | undefined)).assertEqual(true);
    expect(a[2]).assertEqual("abc");
    return true;
  }
}

namespace testNS14_7 {
  function cast_7(p: Object): Array<(Object | undefined | null)> {
    return p as Array<(Object | undefined | null)>;
  }

  export function runTest_7(): boolean {
    let a: (Object | undefined | null)[] = [undefined, 5n, null];
    let b: Array<(Object | undefined | null)> = cast_7(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0] instanceof (Object | undefined | null)).assertEqual(true);
    expect(b[0]).assertEqual(undefined);
    expect(b[1] instanceof (Object | undefined | null)).assertEqual(true);
    expect(b[1]).assertEqual(5n);
    expect(b[2] instanceof (Object | undefined | null)).assertEqual(true);
    expect(b[2]).assertEqual(null);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof (Object | undefined | null)).assertEqual(true);
    expect(a[0]).assertEqual(undefined);
    expect(a[1] instanceof (Object | undefined | null)).assertEqual(true);
    expect(a[1]).assertEqual(5n);
    expect(a[2] instanceof (Object | undefined | null)).assertEqual(true);
    expect(a[2]).assertEqual(null);
    return true;
  }
}

namespace testNS15_7 {
  function cast_7(p: Object): Array<number> {
    return p as Array<number>;
  }

  export function runTest_7(): boolean {
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

function cast_7(p: Object): Array<number> {
  return p as Array<number>;
}


export default function ArrayTypesIdentityTest01(): void {
  describe('ArrayTypesIdentityTest01', () => {
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
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_0600
     * @tc.name      testArrayTypesIdentity0006
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0006';

      let a: number[] = [1, 3, 5]
      let b: Array<number> = cast_6(a)
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

      expect(testNS1_6.runTest_6()).assertEqual(true)
      expect(testNS2_6.runTest_6()).assertEqual(true)
      expect(testNS3_6.runTest_6()).assertEqual(true)
      expect(testNS4_6.runTest_6()).assertEqual(true)
      expect(testNS5_6.runTest_6()).assertEqual(true)
      expect(testNS6_6.runTest_6()).assertEqual(true)
      expect(testNS7_6.runTest_6()).assertEqual(true)
      expect(testNS8_6.runTest_6()).assertEqual(true)
      expect(testNS9_6.runTest_6()).assertEqual(true)
      expect(testNS10_6.runTest_6()).assertEqual(true)
      expect(testNS11_6.runTest_6()).assertEqual(true)
      expect(testNS12_6.runTest_6()).assertEqual(true)
      expect(testNS13_6.runTest_6()).assertEqual(true)
      expect(testNS14_6.runTest_6()).assertEqual(true)
      expect(testNS15_6.runTest_6()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_0700
     * @tc.name      testArrayTypesIdentity0007
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0007';

      let a: number[] = [1, 3, 5]
      let b: Array<number> = cast_7(a)
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

      expect(testNS1_7.runTest_7()).assertEqual(true)
      expect(testNS2_7.runTest_7()).assertEqual(true)
      expect(testNS3_7.runTest_7()).assertEqual(true)
      expect(testNS4_7.runTest_7()).assertEqual(true)
      expect(testNS5_7.runTest_7()).assertEqual(true)
      expect(testNS6_7.runTest_7()).assertEqual(true)
      expect(testNS7_7.runTest_7()).assertEqual(true)
      expect(testNS8_7.runTest_7()).assertEqual(true)
      expect(testNS9_7.runTest_7()).assertEqual(true)
      expect(testNS10_7.runTest_7()).assertEqual(true)
      expect(testNS11_7.runTest_7()).assertEqual(true)
      expect(testNS12_7.runTest_7()).assertEqual(true)
      expect(testNS13_7.runTest_7()).assertEqual(true)
      expect(testNS14_7.runTest_7()).assertEqual(true)
      expect(testNS15_7.runTest_7()).assertEqual(true)
    });

  })
}