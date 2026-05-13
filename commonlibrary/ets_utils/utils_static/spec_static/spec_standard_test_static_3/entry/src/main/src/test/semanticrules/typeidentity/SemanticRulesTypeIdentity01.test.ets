import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

namespace testNS43 {
  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = a as Object as Array<undefined | Object>;

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

namespace testNS44 {
  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = a as Object as Array<undefined | null | Object>;
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

namespace testNS45 {
  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = a as Object as Array<boolean | number>;
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

namespace testNS46 {
  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = a as Object as Array<string | boolean | number>;

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

namespace testNS47 {
  export function runTest(): boolean {
    let a: string[] = ["On Review", "In Progress", "Done"];
    let b: Array<string> = a as Object as Array<string>;

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

namespace testNS48 {
  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = a as Object as (undefined | Object)[];

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

namespace testNS49 {
  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = a as Object as (undefined | null | Object)[];

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

namespace testNS50 {
  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = a as Object as (boolean | number)[];

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

namespace testNS51 {
  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = a as Object as (string | boolean | number)[];

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

namespace testNS52 {
  export function runTest(): boolean {
    let a: Array<string> = ["On Review", "In Progress", "Done"];
    let b: string[] = a as Object as string[];

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

namespace testNS53 {
  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = a as Object as Array<undefined | Object>;

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

namespace testNS54 {
  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = a as Object as Array<undefined | null | Object>;

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

namespace testNS55 {
  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = a as Object as Array<boolean | number>;

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

namespace testNS56 {
  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = a as Object as Array<string | boolean | number>;

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

namespace testNS57 {
  export function runTest(): boolean {
    let a: string[] = ["On Review", "In Progress", "Done"];
    let b: Array<string> = a as Object as Array<string>;

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

namespace testNS58 {
  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = a as Object as (undefined | Object)[];

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

namespace testNS59 {
  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = a as Object as (undefined | null | Object)[];

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

namespace testNS60 {
  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = a as Object as (boolean | number)[];

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

namespace testNS61 {
  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = a as Object as (string | boolean | number)[];

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

namespace testNS62 {
  export function runTest(): boolean {
    let a: Array<string> = ["On Review", "In Progress", "Done"];
    let b: string[] = a as Object as string[];

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

namespace testNS63 {
  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = a as Object as Array<undefined | Object>;

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

namespace testNS64 {
  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = a as Object as Array<undefined | null | Object>;

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

namespace testNS65 {
  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = a as Object as Array<boolean | number>;

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

namespace testNS66 {
  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = a as Object as Array<string | boolean | number>;

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

namespace testNS67 {
  export function runTest(): boolean {
    let a: string[] = ["On Review", "In Progress", "Done"];
    let b: Array<string> = a as Object as Array<string>;

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

namespace testNS68 {
  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = a as Object as (undefined | Object)[];

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

namespace testNS69 {
  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = a as Object as (undefined | null | Object)[];

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

namespace testNS70 {
  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = a as Object as (boolean | number)[];

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

namespace testNS71 {
  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = a as Object as (string | boolean | number)[];

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

namespace testNS72 {
  export function runTest(): boolean {
    let a: Array<string> = ["On Review", "In Progress", "Done"];
    let b: string[] = a as Object as string[];

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

namespace testNS73 {
  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = a as Object as Array<undefined | Object>;

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

namespace testNS74 {
  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = a as Object as Array<undefined | null | Object>;

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

namespace testNS75 {
  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = a as Object as Array<boolean | number>;

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

namespace testNS76 {
  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = a as Object as Array<string | boolean | number>;

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

namespace testNS77 {
  export function runTest(): boolean {
    let a: string[] = ["On Review", "In Progress", "Done"];
    let b: Array<string> = a as Object as Array<string>;

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

namespace testNS78 {
  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = a as Object as (undefined | Object)[];

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

namespace testNS79 {
  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = a as Object as (undefined | null | Object)[];

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

namespace testNS80 {
  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = a as Object as (boolean | number)[];

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

namespace testNS81 {
  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = a as Object as (string | boolean | number)[];

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

namespace testNS82 {
  export function runTest(): boolean {
    let a: Array<string> = ["On Review", "In Progress", "Done"];
    let b: string[] = a as Object as string[];

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

namespace testNS83 {
  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = a as Object as Array<undefined | Object>;

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

namespace testNS84 {
  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = a as Object as Array<undefined | null | Object>;

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

namespace testNS85 {
  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = a as Object as Array<boolean | number>;

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

namespace testNS86 {
  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = a as Object as Array<string | boolean | number>;

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

namespace testNS87 {
  export function runTest(): boolean {
    let a: string[] = ["On Review", "In Progress", "Done"];
    let b: Array<string> = a as Object as Array<string>;

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

namespace testNS88 {
  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = a as Object as (undefined | Object)[];

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

namespace testNS89 {
  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = a as Object as (undefined | null | Object)[];

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

namespace testNS90 {
  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = a as Object as (boolean | number)[];

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

namespace testNS91 {
  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = a as Object as (string | boolean | number)[];

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

namespace testNS92 {
  export function runTest(): boolean {
    let a: Array<string> = ["On Review", "In Progress", "Done"];
    let b: string[] = a as Object as string[];

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

class Cat1 { v: string = "cat" }
class Dog1 { v: bigint = 123n }
class Frog1 { v: number = 5 }

class Cat2 { v: string = "cat" }
class Dog2 { v: bigint = 123n }
class Frog2 { v: number = 5 }

class Cat3 { v: string = "cat" }
class Dog3 { v: bigint = 123n }
class Frog3 { v: number = 5 }

function check_cat1(value: Cat1 | number | Dog1 | Frog1): void {
  expect(value instanceof Cat1).assertTrue();
  expect((value as Cat1).v).assertEqual("cat");
}

function check_number1(value: Cat1 | number | Dog1 | Frog1): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog1(value: Cat1 | number | Dog1 | Frog1): void {
  expect(value instanceof Dog1).assertTrue();
  expect((value as Dog1).v).assertEqual(123n);
}

function check_frog1(value: Cat1 | number | Dog1 | Frog1): void {
  expect(value instanceof Frog1).assertTrue();
  expect((value as Frog1).v).assertEqual(5);
}
function check_cat3(value: Cat3 | number | Dog3 | Frog3): void {
  expect(value instanceof Cat3).assertTrue();
  expect((value as Cat3).v).assertEqual("cat");
}

function check_number3(value: Cat3 | number | Dog3 | Frog3): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog3(value: Cat3 | number | Dog3 | Frog3): void {
  expect(value instanceof Dog3).assertTrue();
  expect((value as Dog3).v).assertEqual(123n);
}

function check_frog3(value: Cat3 | number | Dog3 | Frog3): void {
  expect(value instanceof Frog3).assertTrue();
  expect((value as Frog3).v).assertEqual(5);
}

class Cat4 { v: string = "cat" }
class Dog4 { v: bigint = 123n }
class Frog4 { v: number = 5 }

function check_cat4(value: Cat4 | number | Dog4 | Frog4): void {
  expect(value instanceof Cat4).assertTrue();
  expect((value as Cat4).v).assertEqual("cat");
}

function check_number4(value: Cat4 | number | Dog4 | Frog4): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog4(value: Cat4 | number | Dog4 | Frog4): void {
  expect(value instanceof Dog4).assertTrue();
  expect((value as Dog4).v).assertEqual(123n);
}

function check_frog4(value: Cat4 | number | Dog4 | Frog4): void {
  expect(value instanceof Frog4).assertTrue();
  expect((value as Frog4).v).assertEqual(5);
}

class Cat5 { v: string = "cat" }
class Dog5 { v: bigint = 123n }
class Frog5 { v: number = 5 }

function check_cat5(value: Cat5 | number | Dog5 | Frog5): void {
  expect(value instanceof Cat5).assertTrue();
  expect((value as Cat5).v).assertEqual("cat");
}

function check_number5(value: Cat5 | number | Dog5 | Frog5): void {
  expect(typeof value).assertEqual("number");
  expect(value as number).assertEqual(7.8);
}

function check_dog5(value: Cat5 | number | Dog5 | Frog5): void {
  expect(value instanceof Dog5).assertTrue();
  expect((value as Dog5).v).assertEqual(123n);
}

function check_frog5(value: Cat5 | number | Dog5 | Frog5): void {
  expect(value instanceof Frog5).assertTrue();
  expect((value as Frog5).v).assertEqual(5);
}

namespace testNS93 {
  export function runTest(): boolean {
    let a: (Cat1 | Dog1 | Frog1 | number)[] = [new Cat1(), 7.8, new Dog1(), new Frog1()];
    let b: Array<number | Dog1 | Cat1 | Frog1> = a as Array<number | Dog1 | Cat1 | Frog1>;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat1).assertTrue();
    expect((b[0] as Cat1).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog1).assertTrue();
    expect((b[2] as Dog1).v).assertEqual(123n);
    expect(b[3] instanceof Frog1).assertTrue();
    expect((b[3] as Frog1).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat1).assertTrue();
    expect((a[0] as Cat1).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog1).assertTrue();
    expect((a[2] as Dog1).v).assertEqual(123n);
    expect(a[3] instanceof Frog1).assertTrue();
    expect((a[3] as Frog1).v).assertEqual(5);

    return true;
  }
}

namespace testNS94 {
  export function runTest(): boolean {
    let a: Array<Cat3 | Dog3 | Frog3 | number> = [new Cat3(), 7.8, new Dog3(), new Frog3()];
    let b: (number | Dog3 | Cat3 | Frog3)[] = a as (number | Dog3 | Cat3 | Frog3)[];

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat3).assertTrue();
    expect((b[0] as Cat3).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog3).assertTrue();
    expect((b[2] as Dog3).v).assertEqual(123n);
    expect(b[3] instanceof Frog3).assertTrue();
    expect((b[3] as Frog3).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat3).assertTrue();
    expect((a[0] as Cat3).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog3).assertTrue();
    expect((a[2] as Dog3).v).assertEqual(123n);
    expect(a[3] instanceof Frog3).assertTrue();
    expect((a[3] as Frog3).v).assertEqual(5);

    return true;
  }
}

namespace testNS95 {
  export function runTest(): boolean {
    let a: (Cat4 | Dog4 | Frog4 | number)[] = [new Cat4(), 7.8, new Dog4(), new Frog4()];
    let b: Array<number | Dog4 | Cat4 | Frog4> = a as Array<number | Dog4 | Cat4 | Frog4>;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat4).assertTrue();
    expect((b[0] as Cat4).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog4).assertTrue();
    expect((b[2] as Dog4).v).assertEqual(123n);
    expect(b[3] instanceof Frog4).assertTrue();
    expect((b[3] as Frog4).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat4).assertTrue();
    expect((a[0] as Cat4).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog4).assertTrue();
    expect((a[2] as Dog4).v).assertEqual(123n);
    expect(a[3] instanceof Frog4).assertTrue();
    expect((a[3] as Frog4).v).assertEqual(5);

    return true;
  }
}
namespace testNS96 {
  export function runTest(): boolean {
    let a: (Cat5 | Dog5 | Frog5 | number)[] = [new Cat5(), 7.8, new Dog5(), new Frog5()];
    let b: Array<number | Dog5 | Cat5 | Frog5> = a as Array<number | Dog5 | Cat5 | Frog5>;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat5).assertTrue();
    expect((b[0] as Cat5).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog5).assertTrue();
    expect((b[2] as Dog5).v).assertEqual(123n);
    expect(b[3] instanceof Frog5).assertTrue();
    expect((b[3] as Frog5).v).assertEqual(5);

    a = b;
    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat5).assertTrue();
    expect((a[0] as Cat5).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog5).assertTrue();
    expect((a[2] as Dog5).v).assertEqual(123n);
    expect(a[3] instanceof Frog5).assertTrue();
    expect((a[3] as Frog5).v).assertEqual(5);

    return true;
  }
}

export default function SemanticRulesTypeIdentity01(): void {
  describe('SemanticRulesTypeIdentity01', () => {
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
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_1100
     * @tc.name      testSemanticRulesTypeIdentity0011
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0011';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = a as Object as Array<undefined | Object>;
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

        expect(testNS43.runTest()).assertTrue();
        expect(testNS44.runTest()).assertTrue();
        expect(testNS45.runTest()).assertTrue();
        expect(testNS46.runTest()).assertTrue();
        expect(testNS47.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_1200
     * @tc.name      testSemanticRulesTypeIdentity0012
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0012';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = a as Object as (undefined | Object)[];
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

        expect(testNS48.runTest()).assertTrue();
        expect(testNS49.runTest()).assertTrue();
        expect(testNS50.runTest()).assertTrue();
        expect(testNS51.runTest()).assertTrue();
        expect(testNS52.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_1300
     * @tc.name      testSemanticRulesTypeIdentity0013
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0013';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = a as Object as Array<undefined | Object>;
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

        expect(testNS53.runTest()).assertTrue();
        expect(testNS54.runTest()).assertTrue();
        expect(testNS55.runTest()).assertTrue();
        expect(testNS56.runTest()).assertTrue();
        expect(testNS57.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_1400
     * @tc.name      testSemanticRulesTypeIdentity0014
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0014';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = a as Object as (undefined | Object)[];
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

        expect(testNS58.runTest()).assertTrue();
        expect(testNS59.runTest()).assertTrue();
        expect(testNS60.runTest()).assertTrue();
        expect(testNS61.runTest()).assertTrue();
        expect(testNS62.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_1500
     * @tc.name      testSemanticRulesTypeIdentity0015
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0015';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = a as Object as Array<undefined | Object>;
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

        expect(testNS63.runTest()).assertTrue();
        expect(testNS64.runTest()).assertTrue();
        expect(testNS65.runTest()).assertTrue();
        expect(testNS66.runTest()).assertTrue();
        expect(testNS67.runTest()).assertTrue();
      });
    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_1600
     * @tc.name      testSemanticRulesTypeIdentity0016
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0016';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = a as Object as (undefined | Object)[];
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

        expect(testNS68.runTest()).assertTrue();
        expect(testNS69.runTest()).assertTrue();
        expect(testNS70.runTest()).assertTrue();
        expect(testNS71.runTest()).assertTrue();
        expect(testNS72.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_1700
     * @tc.name      testSemanticRulesTypeIdentity0017
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0017';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = a as Object as Array<undefined | Object>;
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

        expect(testNS73.runTest()).assertTrue();
        expect(testNS74.runTest()).assertTrue();
        expect(testNS75.runTest()).assertTrue();
        expect(testNS76.runTest()).assertTrue();
        expect(testNS77.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_1800
     * @tc.name      testSemanticRulesTypeIdentity0018
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0018';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = a as Object as (undefined | Object)[];
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

        expect(testNS78.runTest()).assertTrue();
        expect(testNS79.runTest()).assertTrue();
        expect(testNS80.runTest()).assertTrue();
        expect(testNS81.runTest()).assertTrue();
        expect(testNS82.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_1900
     * @tc.name      testSemanticRulesTypeIdentity0019
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0019';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = a as Object as Array<undefined | Object>;
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

        expect(testNS83.runTest()).assertTrue();
        expect(testNS84.runTest()).assertTrue();
        expect(testNS85.runTest()).assertTrue();
        expect(testNS86.runTest()).assertTrue();
        expect(testNS87.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_2000
     * @tc.name      testSemanticRulesTypeIdentity0020
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0020';
        let a: Array<Object | undefined> = [5n, undefined, "abc"]
        let b: (undefined | Object)[] = a
        expect(a instanceof Array).assertTrue()
        expect(b instanceof Array).assertTrue()
        expect(b.length).assertEqual(3)
        expect(b[0] instanceof Object || b[0] === undefined).assertTrue()
        expect(b[0] === undefined || b[0] instanceof Object).assertTrue()
        expect(b[0]).assertEqual(5n)
        expect(b[1] instanceof Object || b[1] === undefined).assertTrue()
        expect(b[1] === undefined || b[1] instanceof Object).assertTrue()
        expect(b[1]).assertEqual(undefined)
        expect(b[2] instanceof Object || b[2] === undefined).assertTrue()
        expect(b[2] === undefined || b[2] instanceof Object).assertTrue()
        expect(b[2]).assertEqual("abc")
        a = b
        expect(a instanceof Array).assertTrue()
        expect(a.length).assertEqual(3)
        expect(a[0] instanceof Object || a[0] === undefined).assertTrue()
        expect(a[0] === undefined || a[0] instanceof Object).assertTrue()
        expect(a[0]).assertEqual(5n)
        expect(a[1] instanceof Object || a[1] === undefined).assertTrue()
        expect(a[1] === undefined || a[1] instanceof Object).assertTrue()
        expect(a[1]).assertEqual(undefined)
        expect(a[2] instanceof Object || a[2] === undefined).assertTrue()
        expect(a[2] === undefined || a[2] instanceof Object).assertTrue()
        expect(a[2]).assertEqual("abc")
        expect(testNS88.runTest()).assertTrue()
        expect(testNS89.runTest()).assertTrue()
        expect(testNS90.runTest()).assertTrue()
        expect(testNS91.runTest()).assertTrue()
        expect(testNS92.runTest()).assertTrue()
      });
    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_2100
     * @tc.name      testSemanticRulesTypeIdentity0021
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0021';
        let a: (Cat1 | Dog1 | Frog1 | number)[] = [new Cat1(), 7.8, new Dog1(), new Frog1()];
        let b: Array<number | Dog1 | Cat1 | Frog1> = a as Object as Array<number | Dog1 | Cat1 | Frog1>;
        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);
        check_cat1(b[0]);
        check_number1(b[1]);
        check_dog1(b[2]);
        check_frog1(b[3]);
        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);
        check_cat1(a[0]);
        check_number1(a[1]);
        check_dog1(a[2]);
        check_frog1(a[3]);
        expect(testNS93.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_2200
     * @tc.name      testSemanticRulesTypeIdentity0022
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0022';

        let a: Array<Cat3 | Dog3 | Frog3 | number> = [new Cat3(), 7.8, new Dog3(), new Frog3()];
        let b: (number | Dog3 | Cat3 | Frog3)[] = a as (number | Dog3 | Cat3 | Frog3)[];
        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);
        check_cat3(b[0]);
        check_number3(b[1]);
        check_dog3(b[2]);
        check_frog3(b[3]);
        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);
        check_cat3(a[0]);
        check_number3(a[1]);
        check_dog3(a[2]);
        check_frog3(a[3]);
        expect(testNS94.runTest()).assertTrue();
      });
    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_2300
     * @tc.name      testSemanticRulesTypeIdentity0023
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0023';
        let a: (Cat4 | Dog4 | Frog4 | number)[] = [new Cat4(), 7.8, new Dog4(), new Frog4()];
        let b: Array<number | Dog4 | Cat4 | Frog4> = a as Array<number | Dog4 | Cat4 | Frog4>;
        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);
        check_cat4(b[0]);
        check_number4(b[1]);
        check_dog4(b[2]);
        check_frog4(b[3]);
        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);
        check_cat4(a[0]);
        check_number4(a[1]);
        check_dog4(a[2]);
        check_frog4(a[3]);
        expect(testNS95.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_2400
     * @tc.name      testSemanticRulesTypeIdentity0024
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0024';
        let a: Array<Cat5 | Dog5 | Frog5 | number> = [new Cat5(), 7.8, new Dog5(), new Frog5()];
        let b: (number | Dog5 | Cat5 | Frog5)[] = a as (number | Dog5 | Cat5 | Frog5)[];
        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);
        check_cat5(b[0]);
        check_number5(b[1]);
        check_dog5(b[2]);
        check_frog5(b[3]);
        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);
        check_cat5(a[0]);
        check_number5(a[1]);
        check_dog5(a[2]);
        check_frog5(a[3]);
        expect(testNS96.runTest()).assertTrue();
      });
  });
}