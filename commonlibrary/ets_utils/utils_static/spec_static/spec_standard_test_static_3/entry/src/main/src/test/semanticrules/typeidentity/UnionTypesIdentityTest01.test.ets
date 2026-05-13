import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
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

function cast10(p: Any): undefined | Object {
  return p as Object | undefined
}


export default function UnionTypesIdentityTest01(): void {
  describe('UnionTypesIdentityTest01', () => {
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
     * @tc.number    SUB_UNION_TYPES_IDENTITY_0900
     * @tc.name      testUnionTypesIdentity0009
     * @tc.desc      Checking Union types A and B are identical on predefined types on assign operations and instanceof.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionTypesIdentity0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testUnionTypesIdentity0009';

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
      const TAG = 'testUnionTypesIdentity0010';


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
      const TAG = 'testUnionTypesIdentity0011';

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
      const TAG = 'testUnionTypesIdentity0012';
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
      const TAG = 'testUnionTypesIdentity0013';

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
      const TAG = 'testUnionTypesIdentity0014';

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
