import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

namespace testNS1_8 {
  function cast(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'number').assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(typeof b[1] === 'number').assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(typeof b[2] === 'number').assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'number').assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(typeof a[1] === 'number').assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(typeof a[2] === 'number').assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS2_8 {
  function cast(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'number').assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(typeof b[1] === 'number').assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(typeof b[2] === 'number').assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'number').assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(typeof a[1] === 'number').assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(typeof a[2] === 'number').assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS3_8 {
  function cast(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'number').assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(typeof b[1] === 'number').assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(typeof b[2] === 'number').assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'number').assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(typeof a[1] === 'number').assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(typeof a[2] === 'number').assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS4_8 {
  function cast(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5]
    let b: Array<number> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'number').assertEqual(true)
    expect(b[0]).assertEqual(1)
    expect(typeof b[1] === 'number').assertEqual(true)
    expect(b[1]).assertEqual(3)
    expect(typeof b[2] === 'number').assertEqual(true)
    expect(b[2]).assertEqual(5)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'number').assertEqual(true)
    expect(a[0]).assertEqual(1)
    expect(typeof a[1] === 'number').assertEqual(true)
    expect(a[1]).assertEqual(3)
    expect(typeof a[2] === 'number').assertEqual(true)
    expect(a[2]).assertEqual(5)
    return true
  }
}

namespace testNS5_8 {
  function cast(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'number').assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(typeof b[1] === 'number').assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(typeof b[2] === 'number').assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'number').assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(typeof a[1] === 'number').assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(typeof a[2] === 'number').assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS6_8 {
  function cast(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'number').assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(typeof b[1] === 'number').assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(typeof b[2] === 'number').assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'number').assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(typeof a[1] === 'number').assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(typeof a[2] === 'number').assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS7_8 {
  function cast(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4]
    let b: Array<number> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'number').assertEqual(true)
    expect(b[0]).assertEqual(1.5)
    expect(typeof b[1] === 'number').assertEqual(true)
    expect(b[1]).assertEqual(3.7)
    expect(typeof b[2] === 'number').assertEqual(true)
    expect(b[2]).assertEqual(5.4)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'number').assertEqual(true)
    expect(a[0]).assertEqual(1.5)
    expect(typeof a[1] === 'number').assertEqual(true)
    expect(a[1]).assertEqual(3.7)
    expect(typeof a[2] === 'number').assertEqual(true)
    expect(a[2]).assertEqual(5.4)
    return true
  }
}

namespace testNS8_8 {
  function cast(p: Object): bigint[] {
    return p as bigint[]
  }

  export function runTest(): boolean {
    let a: bigint[] = [1n, 3n, 5n]
    let b: Array<bigint> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof BigInt).assertEqual(true)
    expect(b[0]).assertEqual(1n)
    expect(b[1] instanceof BigInt).assertEqual(true)
    expect(b[1]).assertEqual(3n)
    expect(b[2] instanceof BigInt).assertEqual(true)
    expect(b[2]).assertEqual(5n)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof BigInt).assertEqual(true)
    expect(a[0]).assertEqual(1n)
    expect(a[1] instanceof BigInt).assertEqual(true)
    expect(a[1]).assertEqual(3n)
    expect(a[2] instanceof BigInt).assertEqual(true)
    expect(a[2]).assertEqual(5n)
    return true
  }
}

namespace testNS9_8 {
  function cast(p: Object): string[] {
    return p as string[]
  }

  export function runTest(): boolean {
    let a: string[] = ["ab", "c", "def"]
    let b: Array<string> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'string').assertEqual(true)
    expect(b[0]).assertEqual("ab")
    expect(typeof b[1] === 'string').assertEqual(true)
    expect(b[1]).assertEqual("c")
    expect(typeof b[2] === 'string').assertEqual(true)
    expect(b[2]).assertEqual("def")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'string').assertEqual(true)
    expect(a[0]).assertEqual("ab")
    expect(typeof a[1] === 'string').assertEqual(true)
    expect(a[1]).assertEqual("c")
    expect(typeof a[2] === 'string').assertEqual(true)
    expect(a[2]).assertEqual("def")
    return true
  }
}

namespace testNS10_8 {
  function cast(p: Object): string[] {
    return p as string[]
  }

  export function runTest(): boolean {
    let a: string[] = ['a', 'b', 'c']
    let b: Array<string> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'string').assertEqual(true)
    expect(b[0]).assertEqual('a')
    expect(typeof b[1] === 'string').assertEqual(true)
    expect(b[1]).assertEqual('b')
    expect(typeof b[2] === 'string').assertEqual(true)
    expect(b[2]).assertEqual('c')
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'string').assertEqual(true)
    expect(a[0]).assertEqual('a')
    expect(typeof a[1] === 'string').assertEqual(true)
    expect(a[1]).assertEqual('b')
    expect(typeof a[2] === 'string').assertEqual(true)
    expect(a[2]).assertEqual('c')
    return true
  }
}

namespace testNS11_8 {
  function cast(p: Object): boolean[] {
    return p as boolean[]
  }

  export function runTest(): boolean {
    let a: boolean[] = [false, true, false]
    let b: Array<boolean> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(typeof b[0] === 'boolean').assertEqual(true)
    expect(b[0]).assertEqual(false)
    expect(typeof b[1] === 'boolean').assertEqual(true)
    expect(b[1]).assertEqual(true)
    expect(typeof b[2] === 'boolean').assertEqual(true)
    expect(b[2]).assertEqual(false)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(typeof a[0] === 'boolean').assertEqual(true)
    expect(a[0]).assertEqual(false)
    expect(typeof a[1] === 'boolean').assertEqual(true)
    expect(a[1]).assertEqual(true)
    expect(typeof a[2] === 'boolean').assertEqual(true)
    expect(a[2]).assertEqual(false)
    return true
  }
}

namespace testNS12_8 {
  function cast(p: Object): Object[] {
    return p as Object[]
  }

  export function runTest(): boolean {
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

namespace testNS13_8 {
  function cast(p: Object): (Object | undefined)[] {
    return p as (Object | undefined)[]
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[] = [undefined, 5n, "abc"]
    let b: Array<(Object | undefined)> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object || b[0] === undefined).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof Object).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object).assertEqual(true)
    expect(b[2]).assertEqual("abc")
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object || a[0] === undefined).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof Object).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object).assertEqual(true)
    expect(a[2]).assertEqual("abc")
    return true
  }
}

namespace testNS14_8 {
  function cast(p: Object): (Object | undefined | null)[] {
    return p as (Object | undefined | null)[]
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [undefined, 5n, null]
    let b: Array<(Object | undefined | null)> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(3)
    expect(b[0] instanceof Object || b[0] === undefined || b[0] === null).assertEqual(true)
    expect(b[0]).assertEqual(undefined)
    expect(b[1] instanceof Object).assertEqual(true)
    expect(b[1]).assertEqual(5n)
    expect(b[2] instanceof Object || b[2] === null).assertEqual(true)
    expect(b[2]).assertEqual(null)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(3)
    expect(a[0] instanceof Object || a[0] === undefined || a[0] === null).assertEqual(true)
    expect(a[0]).assertEqual(undefined)
    expect(a[1] instanceof Object).assertEqual(true)
    expect(a[1]).assertEqual(5n)
    expect(a[2] instanceof Object || a[2] === null).assertEqual(true)
    expect(a[2]).assertEqual(null)
    return true
  }
}

namespace testNS15_8 {
  function cast(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
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

function cast_8(p: Object): number[] {
  return p as number[]
}

namespace testNS1_9 {
  function cast(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5];
    let b: Array<number> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(1);
    expect(b[0]).assertEqual(1);
    expect(b[1]).assertEqual(3);
    expect(b[1]).assertEqual(3);
    expect(b[2]).assertEqual(5);
    expect(b[2]).assertEqual(5);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(1);
    expect(a[0]).assertEqual(1);
    expect(a[1]).assertEqual(3);
    expect(a[1]).assertEqual(3);
    expect(a[2]).assertEqual(5);
    expect(a[2]).assertEqual(5);
    return true;
  }
}

namespace testNS2_9 {
  function cast(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5];
    let b: Array<number> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(1);
    expect(b[0]).assertEqual(1);
    expect(b[1]).assertEqual(3);
    expect(b[1]).assertEqual(3);
    expect(b[2]).assertEqual(5);
    expect(b[2]).assertEqual(5);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(1);
    expect(a[0]).assertEqual(1);
    expect(a[1]).assertEqual(3);
    expect(a[1]).assertEqual(3);
    expect(a[2]).assertEqual(5);
    expect(a[2]).assertEqual(5);
    return true;
  }
}

namespace testNS3_9 {
  function cast(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5];
    let b: Array<number> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(1);
    expect(b[0]).assertEqual(1);
    expect(b[1]).assertEqual(3);
    expect(b[1]).assertEqual(3);
    expect(b[2]).assertEqual(5);
    expect(b[2]).assertEqual(5);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(1);
    expect(a[0]).assertEqual(1);
    expect(a[1]).assertEqual(3);
    expect(a[1]).assertEqual(3);
    expect(a[2]).assertEqual(5);
    expect(a[2]).assertEqual(5);
    return true;
  }
}

namespace testNS4_9 {
  function cast(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: number[] = [1, 3, 5];
    let b: Array<number> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(1);
    expect(b[0]).assertEqual(1);
    expect(b[1]).assertEqual(3);
    expect(b[1]).assertEqual(3);
    expect(b[2]).assertEqual(5);
    expect(b[2]).assertEqual(5);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(1);
    expect(a[0]).assertEqual(1);
    expect(a[1]).assertEqual(3);
    expect(a[1]).assertEqual(3);
    expect(a[2]).assertEqual(5);
    expect(a[2]).assertEqual(5);
    return true;
  }
}

namespace testNS5_9 {
  function cast(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4];
    let b: Array<number> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(1.5);
    expect(b[0]).assertEqual(1.5);
    expect(b[1]).assertEqual(3.7);
    expect(b[1]).assertEqual(3.7);
    expect(b[2]).assertEqual(5.4);
    expect(b[2]).assertEqual(5.4);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(1.5);
    expect(a[0]).assertEqual(1.5);
    expect(a[1]).assertEqual(3.7);
    expect(a[1]).assertEqual(3.7);
    expect(a[2]).assertEqual(5.4);
    expect(a[2]).assertEqual(5.4);
    return true;
  }
}

namespace testNS6_9 {
  function cast(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4];
    let b: Array<number> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(1.5);
    expect(b[0]).assertEqual(1.5);
    expect(b[1]).assertEqual(3.7);
    expect(b[1]).assertEqual(3.7);
    expect(b[2]).assertEqual(5.4);
    expect(b[2]).assertEqual(5.4);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(1.5);
    expect(a[0]).assertEqual(1.5);
    expect(a[1]).assertEqual(3.7);
    expect(a[1]).assertEqual(3.7);
    expect(a[2]).assertEqual(5.4);
    expect(a[2]).assertEqual(5.4);
    return true;
  }
}

namespace testNS7_9 {
  function cast(p: Object): number[] {
    return p as Array<number>
  }

  export function runTest(): boolean {
    let a: number[] = [1.5, 3.7, 5.4];
    let b: Array<number> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(1.5);
    expect(b[0]).assertEqual(1.5);
    expect(b[1]).assertEqual(3.7);
    expect(b[1]).assertEqual(3.7);
    expect(b[2]).assertEqual(5.4);
    expect(b[2]).assertEqual(5.4);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(1.5);
    expect(a[0]).assertEqual(1.5);
    expect(a[1]).assertEqual(3.7);
    expect(a[1]).assertEqual(3.7);
    expect(a[2]).assertEqual(5.4);
    expect(a[2]).assertEqual(5.4);
    return true;
  }
}

namespace testNS8_9 {
  function cast(p: Object): bigint[] {
    return p as Array<bigint>
  }

  export function runTest(): boolean {
    let a: bigint[] = [1n, 3n, 5n];
    let b: Array<bigint> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(1n);
    expect(b[0]).assertEqual(1n);
    expect(b[1]).assertEqual(3n);
    expect(b[1]).assertEqual(3n);
    expect(b[2]).assertEqual(5n);
    expect(b[2]).assertEqual(5n);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(1n);
    expect(a[0]).assertEqual(1n);
    expect(a[1]).assertEqual(3n);
    expect(a[1]).assertEqual(3n);
    expect(a[2]).assertEqual(5n);
    expect(a[2]).assertEqual(5n);
    return true;
  }
}

namespace testNS9_9 {
  function cast(p: Object): string[] {
    return p as Array<string>
  }

  export function runTest(): boolean {
    let a: string[] = ["ab", "c", "def"];
    let b: Array<string> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual("ab");
    expect(b[0]).assertEqual("ab");
    expect(b[1]).assertEqual("c");
    expect(b[1]).assertEqual("c");
    expect(b[2]).assertEqual("def");
    expect(b[2]).assertEqual("def");
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual("ab");
    expect(a[0]).assertEqual("ab");
    expect(a[1]).assertEqual("c");
    expect(a[1]).assertEqual("c");
    expect(a[2]).assertEqual("def");
    expect(a[2]).assertEqual("def");
    return true;
  }
}

namespace testNS10_9 {
  function cast(p: Object): string[] {
    return p as Array<string>
  }

  export function runTest(): boolean {
    let a: string[] = ['a', 'b', 'c'];
    let b: Array<string> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual('a');
    expect(b[0]).assertEqual('a');
    expect(b[1]).assertEqual('b');
    expect(b[1]).assertEqual('b');
    expect(b[2]).assertEqual('c');
    expect(b[2]).assertEqual('c');
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual('a');
    expect(a[0]).assertEqual('a');
    expect(a[1]).assertEqual('b');
    expect(a[1]).assertEqual('b');
    expect(a[2]).assertEqual('c');
    expect(a[2]).assertEqual('c');
    return true;
  }
}

namespace testNS11_9 {
  function cast(p: Object): boolean[] {
    return p as Array<boolean>
  }

  export function runTest(): boolean {
    let a: boolean[] = [false, true, false];
    let b: Array<boolean> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(false);
    expect(b[0]).assertEqual(false);
    expect(b[1]).assertEqual(true);
    expect(b[1]).assertEqual(true);
    expect(b[2]).assertEqual(false);
    expect(b[2]).assertEqual(false);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(false);
    expect(a[0]).assertEqual(false);
    expect(a[1]).assertEqual(true);
    expect(a[1]).assertEqual(true);
    expect(a[2]).assertEqual(false);
    expect(a[2]).assertEqual(false);
    return true;
  }
}

namespace testNS12_9 {
  function cast(p: Object): Object[] {
    return p as Array<Object>
  }

  export function runTest(): boolean {
    let a: Object[] = [1, 5n, "abc"];
    let b: Array<Object> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(1);
    expect(b[0]).assertEqual(1);
    expect(b[1]).assertEqual(5n);
    expect(b[1]).assertEqual(5n);
    expect(b[2]).assertEqual("abc");
    expect(b[2]).assertEqual("abc");
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(1);
    expect(a[0]).assertEqual(1);
    expect(a[1]).assertEqual(5n);
    expect(a[1]).assertEqual(5n);
    expect(a[2]).assertEqual("abc");
    expect(a[2]).assertEqual("abc");
    return true;
  }
}

namespace testNS13_9 {
  function cast(p: Object): (Object | undefined)[] {
    return p as Array<(Object | undefined)>
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[] = [undefined, 5n, "abc"];
    let b: Array<(Object | undefined)> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(undefined);
    expect(b[0]).assertEqual(undefined);
    expect(b[1]).assertEqual(5n);
    expect(b[1]).assertEqual(5n);
    expect(b[2]).assertEqual("abc");
    expect(b[2]).assertEqual("abc");
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(undefined);
    expect(a[0]).assertEqual(undefined);
    expect(a[1]).assertEqual(5n);
    expect(a[1]).assertEqual(5n);
    expect(a[2]).assertEqual("abc");
    expect(a[2]).assertEqual("abc");
    return true;
  }
}

namespace testNS14_9 {
  function cast(p: Object): (Object | undefined | null)[] {
    return p as Array<(Object | undefined | null)>
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [undefined, 5n, null];
    let b: Array<(Object | undefined | null)> = cast(a);
    expect(a instanceof Array).assertEqual(true);
    expect(b instanceof Array).assertEqual(true);
    expect(b.length).assertEqual(3);
    expect(b[0]).assertEqual(undefined);
    expect(b[0]).assertEqual(undefined);
    expect(b[1]).assertEqual(5n);
    expect(b[1]).assertEqual(5n);
    expect(b[2]).assertEqual(null);
    expect(b[2]).assertEqual(null);
    a = b;
    expect(a instanceof Array).assertEqual(true);
    expect(a.length).assertEqual(3);
    expect(a[0]).assertEqual(undefined);
    expect(a[0]).assertEqual(undefined);
    expect(a[1]).assertEqual(5n);
    expect(a[1]).assertEqual(5n);
    expect(a[2]).assertEqual(null);
    expect(a[2]).assertEqual(null);
    return true;
  }
}

namespace testNS15_9 {
  function cast_9(p: Object): number[] {
    return p as number[]
  }

  export function runTest(): boolean {
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

function cast(p: Object): number[] {
  return p as Array<number>;
}

export default function ArrayTypesIdentityTest02(): void {
  describe('ArrayTypesIdentityTest02', () => {
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
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_0800
     * @tc.name      testArrayTypesIdentity0008
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0008';

      let a: number[] = [1, 3, 5]
      let b: Array<number> = cast_8(a)
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

      expect(testNS1_8.runTest()).assertEqual(true)
      expect(testNS2_8.runTest()).assertEqual(true)
      expect(testNS3_8.runTest()).assertEqual(true)
      expect(testNS4_8.runTest()).assertEqual(true)
      expect(testNS5_8.runTest()).assertEqual(true)
      expect(testNS6_8.runTest()).assertEqual(true)
      expect(testNS7_8.runTest()).assertEqual(true)
      expect(testNS8_8.runTest()).assertEqual(true)
      expect(testNS9_8.runTest()).assertEqual(true)
      expect(testNS10_8.runTest()).assertEqual(true)
      expect(testNS11_8.runTest()).assertEqual(true)
      expect(testNS12_8.runTest()).assertEqual(true)
      expect(testNS13_8.runTest()).assertEqual(true)
      expect(testNS14_8.runTest()).assertEqual(true)
      expect(testNS15_8.runTest()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_TYPES_IDENTITY_TEST_0900
     * @tc.name      testArrayTypesIdentity0009
     * @tc.desc      Checking for Array types T[] and Array<T> are identical on predefined types on assign operations.
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayTypesIdentity0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayTypesIdentity0009';

      let a: number[] = [1, 3, 5]
      let b: Array<number> = cast(a)
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

      expect(testNS1_9.runTest()).assertEqual(true)
      expect(testNS2_9.runTest()).assertEqual(true)
      expect(testNS3_9.runTest()).assertEqual(true)
      expect(testNS4_9.runTest()).assertEqual(true)
      expect(testNS5_9.runTest()).assertEqual(true)
      expect(testNS6_9.runTest()).assertEqual(true)
      expect(testNS7_9.runTest()).assertEqual(true)
      expect(testNS8_9.runTest()).assertEqual(true)
      expect(testNS9_9.runTest()).assertEqual(true)
      expect(testNS10_9.runTest()).assertEqual(true)
      expect(testNS11_9.runTest()).assertEqual(true)
      expect(testNS12_9.runTest()).assertEqual(true)
      expect(testNS13_9.runTest()).assertEqual(true)
      expect(testNS14_9.runTest()).assertEqual(true)
      expect(testNS15_9.runTest()).assertEqual(true)

    });

  })
}