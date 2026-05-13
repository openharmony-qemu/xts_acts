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

function foo(a: (Object | undefined)[]): (Object | undefined)[] {
  return a;
}

namespace testNS124 {
  function foo30(p: Array<undefined | Object>): Array<Object | undefined> {
    return p;
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = foo30(a);

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


namespace testNS125 {
  function foo31(p: Array<undefined | null | Object>): Array<Object | undefined | null> {
    return p;
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = foo31(a);

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


namespace testNS126 {
  function foo32(p: Array<boolean | number>): Array<number | boolean> {
    return p;
  }

  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = foo32(a);

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

// ====================== testNS127 ======================
namespace testNS127 {
  function foo33(p: Array<string | boolean | number>): Array<number | string | boolean> {
    return p;
  }

  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = foo33(a);

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

// ====================== testNS128 ======================
namespace testNS128 {
  function foo34(p: Array<String>): Array<String> {
    return p;
  }

  export function runTest(): boolean {
    let a: String[] = ["On Review", "In Progress", "Done"];
    let b: Array<String> = foo34(a);

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

function foo41(p: Array<Object | undefined>): (undefined | Object)[] {
  return p;
}
namespace testNS129 {
  function foo36(p: Array<undefined | Object>): Array<Object | undefined> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = foo36(a);

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

// ====================== testNS130 ======================
namespace testNS130 {
  function foo37(p: Array<undefined | null | Object>): Array<Object | undefined | null> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = foo37(a);

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

// ====================== testNS131 ======================
namespace testNS131 {
  function foo38(p: Array<boolean | number>): Array<number | boolean> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = foo38(a);

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

// ====================== testNS132 ======================
namespace testNS132 {
  function foo39(p: Array<string | boolean | number>): Array<number | string | boolean> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = foo39(a);

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

// ====================== testNS133 ======================
namespace testNS133 {
  function foo40(p: Array<String>): Array<String> {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<String> = ["On Review", "In Progress", "Done"];
    let b: String[] = foo40(a);

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

function foo47(p: Array<Object | undefined>): (undefined | Object)[] {
  return p;
}
namespace testNS134 {
  function foo42(p: Array<Object | undefined>): (Object | undefined)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = foo42(a);

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

// ====================== testNS135 ======================
namespace testNS135 {
  function foo43(p: Array<Object | undefined | null>): (Object | undefined | null)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = foo43(a);

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

// ====================== testNS136 ======================
namespace testNS136 {
  function foo44(p: Array<number | boolean>): (number | boolean)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = foo44(a);

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

// ====================== testNS137 ======================
namespace testNS137 {
  function foo45(p: Array<number | string | boolean>): (number | string | boolean)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = foo45(a);

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

// ====================== testNS138 ======================
namespace testNS138 {
  function foo46(p: Array<String>): (String)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: String[] = ["On Review", "In Progress", "Done"];
    let b: Array<String> = foo46(a);

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

function foo53(p: Array<Object | undefined>): (undefined | Object)[] {
  return p;
}
namespace testNS139 {
  function foo48(p: Array<Object | undefined>): (Object | undefined)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = foo48(a);

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

// ====================== testNS140 ======================
namespace testNS140 {
  function foo49(p: Array<Object | undefined | null>): (Object | undefined | null)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = foo49(a);

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

// ====================== testNS141 ======================
namespace testNS141 {
  function foo50(p: Array<number | boolean>): (number | boolean)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = foo50(a);

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

// ====================== testNS142 ======================
namespace testNS142 {
  function foo51(p: Array<number | string | boolean>): (number | string | boolean)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = foo51(a);

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

// ====================== testNS143 ======================
namespace testNS143 {
  function foo52(p: Array<String>): (String)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<String> = ["On Review", "In Progress", "Done"];
    let b: (String)[] = foo52(a);

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

function foo59(p: Array<Object | undefined>): (undefined | Object)[] {
  return p;
}

namespace testNS144 {
  function foo54(p: Array<Object | undefined>): (undefined | Object)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = foo54(a);

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

// ====================== testNS145 ======================
namespace testNS145 {
  function foo55(p: Array<Object | undefined | null>): (undefined | null | Object)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = foo55(a);

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

// ====================== testNS146 ======================
namespace testNS146 {
  function foo56(p: Array<number | boolean>): (boolean | number)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = foo56(a);

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

// ====================== testNS147 ======================
namespace testNS147 {
  function foo57(p: Array<number | string | boolean>): (string | boolean | number)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = foo57(a);

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

// ====================== testNS148 ======================
namespace testNS148 {
  function foo58(p: Array<String>): (String)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: String[] = ["On Review", "In Progress", "Done"];
    let b: Array<String> = foo58(a);

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

function foo65(p: Array<Object | undefined>): (undefined | Object)[] {
  return p;
}

namespace testNS149 {
  function foo60(p: Array<Object | undefined>): (undefined | Object)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = foo60(a);

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

// ====================== testNS150 ======================
namespace testNS150 {
  function foo61(p: Array<Object | undefined | null>): (undefined | null | Object)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = foo61(a);

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

// ====================== testNS151 ======================
namespace testNS151 {
  function foo62(p: Array<number | boolean>): (boolean | number)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = foo62(a);

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

// ====================== testNS152 ======================
namespace testNS152 {
  function foo63(p: Array<number | string | boolean>): (string | boolean | number)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = foo63(a);

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

// ====================== testNS153 ======================
namespace testNS153 {
  function foo64(p: Array<String>): (String)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: Array<String> = ["On Review", "In Progress", "Done"];
    let b: (String)[] = foo64(a);

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

// ====================== testNS154 ======================
namespace testNS154 {
  function foo66(p: Array<undefined | Object>): (Object | undefined)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = foo66(a);

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

// ====================== testNS155 ======================
namespace testNS155 {
  function foo67(p: Array<undefined | null | Object>): (Object | undefined | null)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = foo67(a);

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

// ====================== testNS156 ======================
namespace testNS156 {
  function foo68(p: Array<boolean | number>): (number | boolean)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = foo68(a);

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

namespace testNS157 {
  function foo69(p: Array<string | boolean | number>): (number | string | boolean)[] {
    return p;
  }

  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = foo69(a);

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

namespace testNS158 {
  function foo70(p: Array<String>): (String)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: String[] = ["On Review", "In Progress", "Done"];
    let b: Array<String> = foo70(a);

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

function foo71(p: Array<undefined | Object>): (Object | undefined)[] {
  return p;
}

namespace testNS159 {
  function foo72(p: Array<undefined | Object>): (Object | undefined)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = foo72(a);

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

namespace testNS160 {
  function foo73(p: Array<undefined | null | Object>): (Object | undefined | null)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = foo73(a);

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

namespace testNS161 {
  function foo74(p: Array<boolean | number>): (number | boolean)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = foo74(a);

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

namespace testNS162 {
  function foo75(p: Array<string | boolean | number>): (number | string | boolean)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = foo75(a);

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

namespace testNS163 {
  function foo76(p: Array<String>): (String)[] {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<String> = ["On Review", "In Progress", "Done"];
    let b: (String)[] = foo76(a);

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

function foo77(p: Array<undefined | Object>): (Object | undefined)[] {
  return p;
}

namespace testNS164 {
  function foo78(p: (Object | undefined)[]): Array<undefined | Object> {
    return p;
  }

  export function runTest() :boolean{
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = foo78(a);

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

namespace testNS165 {
  function foo79(p: (Object | undefined | null)[]): Array<undefined | null | Object> {
    return p;
  }

  export function runTest() :boolean{
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = foo79(a);

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

namespace testNS166 {
  function foo80(p: (number | boolean)[]): Array<boolean | number> {
    return p;
  }

  export function runTest() :boolean{
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = foo80(a);

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

namespace testNS167 {
  function foo81(p: (number | string | boolean)[]): Array<string | boolean | number> {
    return p;
  }

  export function runTest() :boolean{
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = foo81(a);

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

namespace testNS168 {
  function foo82(p: (String)[]): Array<String> {
    return p;
  }

  export function runTest() :boolean{
    let a: (String)[] = ["On Review", "In Progress", "Done"];
    let b: Array<String> = foo82(a);

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

function foo83(p: (Object | undefined)[]): Array<undefined | Object> {
  return p;
}

namespace testNS169 {
  function foo84(p: (Object | undefined)[]): Array<undefined | Object> {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = foo84(a);

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

namespace testNS170 {
  function foo85(p: (Object | undefined | null)[]): Array<undefined | null | Object> {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = foo85(a);

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

namespace testNS171 {
  function foo86(p: (number | boolean)[]): Array<boolean | number> {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = foo86(a);

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

namespace testNS172 {
  function foo87(p: (number | string | boolean)[]): Array<string | boolean | number> {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = foo87(a);

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

namespace testNS173 {
  function foo88(p: (String)[]): Array<String> {
    return p;
  }

  export function runTest() :boolean{
    let a: Array<String> = ["On Review", "In Progress", "Done"];
    let b: (String)[] = foo88(a);

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

function foo89(p: (Object | undefined)[]): Array<undefined | Object> {
  return p;
}

namespace testNS174 {
  function foo90(p: (undefined | Object)[]): Array<Object | undefined> {
    return p;
  }

  export function runTest() :boolean{
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = foo90(a);

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

namespace testNS175 {
  function foo91(p: (undefined | null | Object)[]): Array<Object | undefined | null> {
    return p;
  }

  export function runTest() :boolean{
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = foo91(a);

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

namespace testNS176 {
  function foo92(p: (boolean | number)[]): Array<number | boolean> {
    return p;
  }

  export function runTest() :boolean{
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = foo92(a);

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

namespace testNS177 {
  function foo93(p: (string | boolean | number)[]): Array<number | string | boolean> {
    return p;
  }

  export function runTest() :boolean{
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = foo93(a);

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

namespace testNS178 {
  function foo94(p: (String)[]): Array<String> {
    return p;
  }

  export function runTest() :boolean{
    let a: (String)[] = ["On Review", "In Progress", "Done"];
    let b: Array<String> = foo94(a);

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

function foo95(p: (undefined | Object)[]): Array<Object | undefined> {
  return p;
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

  export function runTest() :boolean{
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

  export function runTest() :boolean{
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

  export function runTest() :boolean{
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

export default function SemanticRulesTypeIdentity03(): void {
  describe('SemanticRulesTypeIdentity03', () => {
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
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_3900
     * @tc.name      testSemanticRulesTypeIdentity0039
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0039';

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

        expect(testNS124.runTest()).assertTrue();
        expect(testNS125.runTest()).assertTrue();
        expect(testNS126.runTest()).assertTrue();
        expect(testNS127.runTest()).assertTrue();
        expect(testNS128.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_4000
     * @tc.name      testSemanticRulesTypeIdentity0040
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0040';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = foo41(a);

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

        expect(testNS129.runTest()).assertTrue();
        expect(testNS130.runTest()).assertTrue();
        expect(testNS131.runTest()).assertTrue();
        expect(testNS132.runTest()).assertTrue();
        expect(testNS133.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_4100
     * @tc.name      testSemanticRulesTypeIdentity0041
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0041';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = foo47(a);

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

        expect(testNS134.runTest()).assertTrue();
        expect(testNS135.runTest()).assertTrue();
        expect(testNS136.runTest()).assertTrue();
        expect(testNS137.runTest()).assertTrue();
        expect(testNS138.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_4200
     * @tc.name      testSemanticRulesTypeIdentity0042
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0042';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = foo53(a);

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

        expect(testNS139.runTest()).assertTrue();
        expect(testNS140.runTest()).assertTrue();
        expect(testNS141.runTest()).assertTrue();
        expect(testNS142.runTest()).assertTrue();
        expect(testNS143.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_4300
     * @tc.name      testSemanticRulesTypeIdentity0043
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0043';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = foo59(a);

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

        expect(testNS144.runTest()).assertTrue();
        expect(testNS145.runTest()).assertTrue();
        expect(testNS146.runTest()).assertTrue();
        expect(testNS147.runTest()).assertTrue();
        expect(testNS148.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_4400
     * @tc.name      testSemanticRulesTypeIdentity0044
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0044';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = foo65(a);

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

        expect(testNS149.runTest()).assertTrue();
        expect(testNS150.runTest()).assertTrue();
        expect(testNS151.runTest()).assertTrue();
        expect(testNS152.runTest()).assertTrue();
        expect(testNS153.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_4500
     * @tc.name      testSemanticRulesTypeIdentity0045
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0045';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = foo71(a);

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

        expect(testNS154.runTest()).assertTrue();
        expect(testNS155.runTest()).assertTrue();
        expect(testNS156.runTest()).assertTrue();
        expect(testNS157.runTest()).assertTrue();
        expect(testNS158.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_4600
     * @tc.name      testSemanticRulesTypeIdentity0046
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0046';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = foo77(a);

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

        expect(testNS159.runTest()).assertTrue();
        expect(testNS160.runTest()).assertTrue();
        expect(testNS161.runTest()).assertTrue();
        expect(testNS162.runTest()).assertTrue();
        expect(testNS163.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_4700
     * @tc.name      testSemanticRulesTypeIdentity0047
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0047';

        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = foo83(a);

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

        expect(testNS164.runTest()).assertTrue();
        expect(testNS165.runTest()).assertTrue();
        expect(testNS166.runTest()).assertTrue();
        expect(testNS167.runTest()).assertTrue();
        expect(testNS168.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_4800
     * @tc.name      testSemanticRulesTypeIdentity0048
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0048';

        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = foo89(a);

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

        expect(testNS169.runTest()).assertTrue();
        expect(testNS170.runTest()).assertTrue();
        expect(testNS171.runTest()).assertTrue();
        expect(testNS172.runTest()).assertTrue();
        expect(testNS173.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_4900
     * @tc.name      testSemanticRulesTypeIdentity0049
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0049';
        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = foo95(a);
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
        expect(testNS174.runTest()).assertTrue();
        expect(testNS175.runTest()).assertTrue();
        expect(testNS176.runTest()).assertTrue();
        expect(testNS177.runTest()).assertTrue();
        expect(testNS178.runTest()).assertTrue();
      });
  });
}

