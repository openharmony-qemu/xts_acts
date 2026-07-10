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
  from '@ohos/hypium-binary/src/main/indexStatic';

namespace testNS1 {
  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = a;
    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    // 补充类型检查
    expect(b[0] instanceof Object || b[0] === undefined).assertTrue();
    expect(b[0] === undefined || b[0] instanceof Object).assertTrue();
    expect(b[0]).assertEqual(5n);
    expect(b[1] instanceof Object || b[1] === undefined).assertTrue();
    expect(b[1] === undefined || b[1] instanceof Object).assertTrue();
    expect(b[1] === undefined).assertTrue();
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
    expect(a[1] === undefined).assertTrue();
    expect(a[2] instanceof Object || a[2] === undefined).assertTrue();
    expect(a[2] === undefined || a[2] instanceof Object).assertTrue();
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS2 {
  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = a;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    // 补充类型检查：包含 null
    expect(b[0] instanceof Object || b[0] === undefined || b[0] === null).assertTrue();
    expect(b[0] === undefined || b[0] === null || b[0] instanceof Object).assertTrue();
    expect(b[0]).assertEqual(5n);
    expect(b[1] instanceof Object || b[1] === undefined || b[1] === null).assertTrue();
    expect(b[1] === undefined || b[1] === null || b[1] instanceof Object).assertTrue();
    expect(b[1]).assertEqual(null);
    expect(b[2] instanceof Object || b[2] === undefined || b[2] === null).assertTrue();
    expect(b[2] === undefined || b[2] === null || b[2] instanceof Object).assertTrue();
    expect(b[2]).assertEqual(undefined);

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(a[0] instanceof Object || a[0] === undefined || a[0] === null).assertTrue();
    expect(a[0] === undefined || a[0] === null || a[0] instanceof Object).assertTrue();
    expect(a[0]).assertEqual(5n);
    expect(a[1] instanceof Object || a[1] === undefined || a[1] === null).assertTrue();
    expect(a[1] === undefined || a[1] === null || a[1] instanceof Object).assertTrue();
    expect(a[1]).assertEqual(null);
    expect(a[2] instanceof Object || a[2] === undefined || a[2] === null).assertTrue();
    expect(a[2] === undefined || a[2] === null || a[2] instanceof Object).assertTrue();
    expect(a[2]).assertEqual(undefined);

    return true;
  }
}

namespace testNS3 {
  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = a;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    // 补充类型检查：原始类型用 typeof
    expect(typeof b[0] === 'number' || typeof b[0] === 'boolean').assertTrue();
    expect(typeof b[0] === 'boolean' || typeof b[0] === 'number').assertTrue();
    expect(b[0]).assertEqual(true);
    expect(typeof b[1] === 'number' || typeof b[1] === 'boolean').assertTrue();
    expect(typeof b[1] === 'boolean' || typeof b[1] === 'number').assertTrue();
    expect(b[1]).assertEqual(7.9);
    expect(typeof b[2] === 'number' || typeof b[2] === 'boolean').assertTrue();
    expect(typeof b[2] === 'boolean' || typeof b[2] === 'number').assertTrue();
    expect(b[2]).assertEqual(false);

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(typeof a[0] === 'number' || typeof a[0] === 'boolean').assertTrue();
    expect(typeof a[0] === 'boolean' || typeof a[0] === 'number').assertTrue();
    expect(a[0]).assertEqual(true);
    expect(typeof a[1] === 'number' || typeof a[1] === 'boolean').assertTrue();
    expect(typeof a[1] === 'boolean' || typeof a[1] === 'number').assertTrue();
    expect(a[1]).assertEqual(7.9);
    expect(typeof a[2] === 'number' || typeof a[2] === 'boolean').assertTrue();
    expect(typeof a[2] === 'boolean' || typeof a[2] === 'number').assertTrue();
    expect(a[2]).assertEqual(false);

    return true;
  }
}

namespace testNS4 {
  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = a;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(typeof b[0] === 'number' || typeof b[0] === 'string' || typeof b[0] === 'boolean').assertTrue();
    expect(typeof b[0] === 'string' || typeof b[0] === 'boolean' || typeof b[0] === 'number').assertTrue();
    expect(b[0]).assertEqual(true);
    expect(typeof b[1] === 'number' || typeof b[1] === 'string' || typeof b[1] === 'boolean').assertTrue();
    expect(typeof b[1] === 'string' || typeof b[1] === 'boolean' || typeof b[1] === 'number').assertTrue();
    expect(b[1]).assertEqual(5);
    expect(typeof b[2] === 'number' || typeof b[2] === 'string' || typeof b[2] === 'boolean').assertTrue();
    expect(typeof b[2] === 'string' || typeof b[2] === 'boolean' || typeof b[2] === 'number').assertTrue();
    expect(b[2]).assertEqual("abc");

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(typeof a[0] === 'number' || typeof a[0] === 'string' || typeof a[0] === 'boolean').assertTrue();
    expect(typeof a[0] === 'string' || typeof a[0] === 'boolean' || typeof a[0] === 'number').assertTrue();
    expect(a[0]).assertEqual(true);
    expect(typeof a[1] === 'number' || typeof a[1] === 'string' || typeof a[1] === 'boolean').assertTrue();
    expect(typeof a[1] === 'string' || typeof a[1] === 'boolean' || typeof a[1] === 'number').assertTrue();
    expect(a[1]).assertEqual(5);
    expect(typeof a[2] === 'number' || typeof a[2] === 'string' || typeof a[2] === 'boolean').assertTrue();
    expect(typeof a[2] === 'string' || typeof a[2] === 'boolean' || typeof a[2] === 'number').assertTrue();
    expect(a[2]).assertEqual("abc");

    return true;
  }
}

namespace testNS5 {
  export function runTest(): boolean {
    let a: string[] = ["On Review", "In Progress", "Done"];
    let b: Array<string> = a;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(3);
    expect(typeof b[0] === 'string').assertTrue();
    expect(typeof b[0] === 'string').assertTrue();
    expect(b[0]).assertEqual("On Review");
    expect(typeof b[1] === 'string').assertTrue();
    expect(typeof b[1] === 'string').assertTrue();
    expect(b[1]).assertEqual("In Progress");
    expect(typeof b[2] === 'string').assertTrue();
    expect(typeof b[2] === 'string').assertTrue();
    expect(b[2]).assertEqual("Done");

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(3);
    expect(typeof a[0] === 'string').assertTrue();
    expect(typeof a[0] === 'string').assertTrue();
    expect(a[0]).assertEqual("On Review");
    expect(typeof a[1] === 'string').assertTrue();
    expect(typeof a[1] === 'string').assertTrue();
    expect(a[1]).assertEqual("In Progress");
    expect(typeof a[2] === 'string').assertTrue();
    expect(typeof a[2] === 'string').assertTrue();
    expect(a[2]).assertEqual("Done");

    return true;
  }
}

namespace testNS6 {
  export function runTest(): boolean {
    let a: Array<Object | undefined> = [5n, undefined, "abc"];
    let b: (undefined | Object)[] = a;

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

namespace testNS7 {
  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = a;

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

namespace testNS8 {
  export function runTest(): boolean {
    let a: Array<number | boolean> = [true, 7.9, false];
    let b: (boolean | number)[] = a;

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

namespace testNS9 {
  export function runTest(): boolean {
    let a: Array<number | string | boolean> = [true, 5, "abc"];
    let b: (string | boolean | number)[] = a;

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

namespace testNS10 {
  export function runTest(): boolean {
    let a: Array<string> = ["On Review", "In Progress", "Done"];
    let b: string[] = a;

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

namespace testNS11 {
  export class Cat11 {v: string = "cat"}
  export class Dog11 {v: bigint = 123n}
  export class Frog11 {v: number = 5}

  function check_cat(a: Object) {
    expect(a instanceof Cat11).assertTrue();
    expect((a as Cat11).v).assertEqual("cat");
  }

  function check_dog(a: Object) {
    expect(a instanceof Dog11).assertTrue();
    expect((a as Dog11).v).assertEqual(123n);
  }

  function check_frog(a: Object) {
    expect(a instanceof Frog11).assertTrue();
    expect((a as Frog11).v).assertEqual(5);
  }

  function check_number(a: Object) {
    expect(typeof a).assertEqual("number");
    expect(a).assertEqual(7.8);
  }

  export function runTest(): boolean {
    let a: (Cat11 | Dog11 | Frog11 | number)[] = [new Cat11(), 7.8, new Dog11(), new Frog11()];
    let b: Array<number | Dog11 | Cat11 | Frog11> = a;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    check_cat(b[0]);
    check_number(b[1]);
    check_dog(b[2]);
    check_frog(b[3]);

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    check_cat(a[0]);
    check_number(a[1]);
    check_dog(a[2]);
    check_frog(a[3]);

    return true;
  }
}

class Cat { v: string = "cat" }
class Dog { v: bigint = 123n }
class Frog { v: number = 5 }

namespace testNS12 {
  export function runTest(): boolean {
    let a: Array<Cat | Dog | Frog | number> = [new Cat(), 7.8, new Dog(), new Frog()];
    let b: (number | Dog | Cat | Frog)[] = a;

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat).assertTrue();
    expect((b[0] as Cat).v).assertEqual("cat");
    expect(typeof b[1]).assertEqual("number");
    expect(b[1]).assertEqual(7.8);
    expect(b[2] instanceof Dog).assertTrue();
    expect((b[2] as Dog).v).assertEqual(123n);
    expect(b[3] instanceof Frog).assertTrue();
    expect((b[3] as Frog).v).assertEqual(5);

    a = b;

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat).assertTrue();
    expect((a[0] as Cat).v).assertEqual("cat");
    expect(typeof a[1]).assertEqual("number");
    expect(a[1]).assertEqual(7.8);
    expect(a[2] instanceof Dog).assertTrue();
    expect((a[2] as Dog).v).assertEqual(123n);
    expect(a[3] instanceof Frog).assertTrue();
    expect((a[3] as Frog).v).assertEqual(5);

    return true;
  }
}

namespace testNS13 {
  export function runTest(): boolean {
    let a: (Object | undefined)[] = [5n, undefined, "abc"];
    let b: Array<undefined | Object> = a as object as Array<undefined | Object>;

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

namespace testNS14 {
  export function runTest(): boolean {
    let a: (Object | undefined | null)[] = [5n, null, undefined];
    let b: Array<undefined | null | Object> = a as object as Array<undefined | null | Object>;

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

namespace testNS15 {
  export function runTest(): boolean {
    let a: (number | boolean)[] = [true, 7.9, false];
    let b: Array<boolean | number> = a as object as Array<boolean | number>;

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

namespace testNS16 {
  export function runTest(): boolean {
    let a: (number | string | boolean)[] = [true, 5, "abc"];
    let b: Array<string | boolean | number> = a as object as Array<string | boolean | number>;

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

namespace testNS17 {
  export function runTest(): boolean {
    let a: string[] = ["On Review", "In Progress", "Done"];
    let b: Array<string> = a as object as Array<string>;

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

namespace testNS18 {
  export function runTest(): boolean {
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

    return true;
  }
}

namespace testNS19 {
  export function runTest(): boolean {
    let a: Array<Object | undefined | null> = [5n, null, undefined];
    let b: (undefined | null | Object)[] = a as Object as (undefined | null | Object)[];

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

namespace testNS20 {
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

namespace testNS21 {
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

namespace testNS22 {
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

namespace testNS23 {
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

namespace testNS24 {
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

namespace testNS25 {
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

namespace testNS26 {
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

namespace testNS27 {
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

export default function SemanticRulesTypeIdentity(): void {
  describe('SemanticRulesTypeIdentity', () => {
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
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_0100
     * @tc.name      testSemanticRulesTypeIdentity0001
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = a;
        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(3);
        expect(b[0] instanceof Object | undefined).assertTrue();
        expect(b[0] instanceof undefined | Object).assertTrue();
        expect(b[0]).assertEqual(5n);
        expect(b[1] instanceof Object | undefined).assertTrue();
        expect(b[1] instanceof undefined | Object).assertTrue();
        expect(b[1]).assertEqual(undefined);
        expect(b[2] instanceof Object | undefined).assertTrue();
        expect(b[2] instanceof undefined | Object).assertTrue();
        expect(b[2]).assertEqual("abc");
        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(3);
        expect(a[0] instanceof Object | undefined).assertTrue();
        expect(a[0] instanceof undefined | Object).assertTrue();
        expect(a[0]).assertEqual(5n);
        expect(a[1] instanceof Object | undefined).assertTrue();
        expect(a[1] instanceof undefined | Object).assertTrue();
        expect(a[1]).assertEqual(undefined);
        expect(a[2] instanceof Object | undefined).assertTrue();
        expect(a[2] instanceof undefined | Object).assertTrue();
        expect(a[2]).assertEqual("abc");

        expect(testNS1.runTest()).assertTrue();
        expect(testNS2.runTest()).assertTrue();
        expect(testNS3.runTest()).assertTrue();
        expect(testNS4.runTest()).assertTrue();
        expect(testNS5.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_0200
     * @tc.name      testSemanticRulesTypeIdentity0002
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        let a: Array<Object | undefined> = [5n, undefined, "abc"];
        let b: (undefined | Object)[] = a;
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

        expect(testNS6.runTest()).assertTrue();
        expect(testNS7.runTest()).assertTrue();
        expect(testNS8.runTest()).assertTrue();
        expect(testNS9.runTest()).assertTrue();
        expect(testNS10.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_0300
     * @tc.name      testSemanticRulesTypeIdentity0003
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        let a: (testNS11.Cat11 | testNS11.Dog11 | testNS11.Frog11 | number)[] =
          [new testNS11.Cat11(), 7.8, new testNS11.Dog11(), new testNS11.Frog11()];
        let b: Array<number | testNS11.Dog11 | testNS11.Cat11 | testNS11.Frog11> = a;
        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof testNS11.Cat11).assertTrue();
        expect((b[0] as testNS11.Cat11).v).assertEqual("cat");
        expect(typeof b[1] === "number").assertTrue();
        expect(b[1]).assertEqual(7.8);
        expect(b[2] instanceof testNS11.Dog11).assertTrue();
        expect((b[2] as testNS11.Dog11).v).assertEqual(123n);
        expect(b[3] instanceof testNS11.Frog11).assertTrue();
        expect((b[3] as testNS11.Frog11).v).assertEqual(5);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof testNS11.Cat11).assertTrue();
        expect((a[0] as testNS11.Cat11).v).assertEqual("cat");
        expect(typeof a[1] === "number").assertTrue();
        expect(a[1]).assertEqual(7.8);
        expect(a[2] instanceof testNS11.Dog11).assertTrue();
        expect((a[2] as testNS11.Dog11).v).assertEqual(123n);
        expect(a[3] instanceof testNS11.Frog11).assertTrue();
        expect((a[3] as testNS11.Frog11).v).assertEqual(5);

        expect(testNS11.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_0400
     * @tc.name      testSemanticRulesTypeIdentity0004
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        let a: Array<Cat | Dog | Frog | number> = [new Cat(), 7.8, new Dog(), new Frog()];
        let b: (number | Dog | Cat | Frog)[] = a;

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat).assertTrue();
        expect((b[0] as Cat).v).assertEqual("cat");
        expect(typeof b[1] === "number").assertTrue();
        expect(b[1]).assertEqual(7.8);
        expect(b[2] instanceof Dog).assertTrue();
        expect((b[2] as Dog).v).assertEqual(123n);
        expect(b[3] instanceof Frog).assertTrue();
        expect((b[3] as Frog).v).assertEqual(5);

        a = b;
        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat).assertTrue();
        expect((a[0] as Cat).v).assertEqual("cat");
        expect(typeof a[1] === "number").assertTrue();
        expect(a[1]).assertEqual(7.8);
        expect(a[2] instanceof Dog).assertTrue();
        expect((a[2] as Dog).v).assertEqual(123n);
        expect(a[3] instanceof Frog).assertTrue();
        expect((a[3] as Frog).v).assertEqual(5);

        expect(testNS12.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_0500
     * @tc.name      testSemanticRulesTypeIdentity0005
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        let a: (Object | undefined)[] = [5n, undefined, "abc"];
        let b: Array<undefined | Object> = a as object as Array<undefined | Object>;
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

        expect(testNS13.runTest()).assertTrue();
        expect(testNS14.runTest()).assertTrue();
        expect(testNS15.runTest()).assertTrue();
        expect(testNS16.runTest()).assertTrue();
        expect(testNS17.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_0600
     * @tc.name      testSemanticRulesTypeIdentity0006
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
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

        expect(testNS18.runTest()).assertTrue();
        expect(testNS19.runTest()).assertTrue();
        expect(testNS20.runTest()).assertTrue();
        expect(testNS21.runTest()).assertTrue();
        expect(testNS22.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_0700
     * @tc.name      testSemanticRulesTypeIdentity0007
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
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

        expect(testNS23.runTest()).assertTrue();
        expect(testNS24.runTest()).assertTrue();
        expect(testNS25.runTest()).assertTrue();
        expect(testNS26.runTest()).assertTrue();
        expect(testNS27.runTest()).assertTrue();
      });
  });
}
