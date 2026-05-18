/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// ============================================================================
// comb_01a
// ============================================================================
class A_01a {}
let a_01a: A_01a | undefined = new A_01a()

let num_01a: Number = 0;
let str_01a: string = "";
let err_01a: Error = new Error();
let bool_01a: Boolean = false;

let not_undef_01a: number | string | Error | boolean = false;
let not_num_01a: string | Error | boolean = false;
let not_err_01a: string | boolean = false;

function foo_01a(p: number | string | undefined | Error | boolean): number {
  if (p === undefined) {
    a_01a = p
    return 1
  } else {
    not_undef_01a = p // narrowing union conversion
    if (p instanceof Number) {
      num_01a = p * 2 // numeric operation without cast
      return 2
    } else {
      not_num_01a = p // narrowing union conversion
      if (p instanceof Error) {
        err_01a = p
        str_01a = p.message // field access without cast
        return 3
      } else {
        not_err_01a = p // narrowing union conversion
        if (p instanceof string) {
          str_01a = p.substr(0, 1) // string method without cast
          return 4
        } else {
          bool_01a = !p // boolean operator without cast
          return 5
        }
      }
    }
  }
}


// ============================================================================
// comb_01b
// ============================================================================
class A_01b {}
let a_01b: A_01b | undefined = new A_01b()

let num_01b: Number = 0;
let str_01b: string = "";
let err_01b: Error = new Error();
let bool_01b: Boolean = false;

function foo_01b(p: number | string | undefined | Error | boolean): number {
  if (p === undefined) {
    a_01b = p
    return 1
  } else {
    let not_undef: number | string | Error | boolean = p // narrowing union conversion
    if (not_undef instanceof Number) {
      num_01b = not_undef * 2 // numeric operation without cast
      return 2
    } else {
      let not_num: string | Error | boolean = not_undef // narrowing union conversion
      if (not_num instanceof Error) {
        err_01b = not_num
        str_01b = not_num.message // field access without cast
        return 3
      } else {
        let not_err: string | boolean = not_num // narrowing union conversion
        if (not_err instanceof string) {
          str_01b = not_err.substr(0, 1) // string method without cast
          return 4
        } else {
          bool_01b = !not_err // boolean operator without cast
          return 5
        }
      }
    }
  }
}


// ============================================================================
// comb_01c
// ============================================================================
class A_01c {}
let a_01c: A_01c | undefined = new A_01c()

let num_01c: Number = 0;
let str_01c: string = "";
let err_01c: Error = new Error();
let bool_01c: Boolean = false;

function foo_01c(p: Object | undefined): number {
  if (p === undefined) {
    a_01c = p
    return 1
  } else {
    if (p instanceof Number) {
      num_01c = p * 2 // numeric operation without cast
      return 2
    } else {
      if (p instanceof Error) {
        err_01c = p
        str_01c = p.message // field access without cast
        return 3
      } else {
        if (p instanceof string) {
          str_01c = p.substr(0, 1) // string method without cast
          return 4
        } else {
          bool_01c = !p // boolean operator without cast
          return 5
        }
      }
    }
  }
}


// ============================================================================
// comb_01d
// ============================================================================
class A_01d {}
let a_01d: A_01d | undefined | null = new A_01d()

let num_01d: Number = 0;
let str_01d: string = "";
let err_01d: Error = new Error();
let bool_01d: Boolean = false;

function foo_01d(p: Object | undefined | null): number {
  if (p == undefined) {
    a_01d = p
    return 1
  } else {
    let obj: Object = p // narrowing conversion
    if (obj instanceof Number) {
      num_01d = obj * 2 // numeric operation without cast
      return 2
    } else {
      if (obj instanceof Error) {
        err_01d = obj
        str_01d = obj.message // field access without cast
        return 3
      } else {
        if (obj instanceof string) {
          str_01d = obj.substr(0, 1) // string method without cast
          return 4
        } else {
          bool_01d = !obj // boolean operator without cast
          return 5
        }
      }
    }
  }
}


// ============================================================================
// comb_10a
// ============================================================================
class A_10a {}
let a_10a: A_10a | undefined = new A_10a()

let num_10a: Number = 0;
let str_10a: string = "";
let err_10a: Error = new Error();
let bool_10a: Boolean = false;

function foo_10a(p: number | string | undefined | Error | boolean): number {
  return p === undefined ? ((): number => { a_10a = p; return 1 })() // assigned without cast
    : p instanceof Number ? ((): number => { num_10a = p * 2; return 2 })() // numeric operation without cast
      : p instanceof Error ? ((): number => { err_10a = p; str_10a = p.message; return 3 })()
        // ^^^ field access without cast
        : p instanceof String ? ((): number => { str_10a = p.substr(0, 1); return 4 })()
          // ^^^ string method called without cast
          : ((): number => { bool_10a = !p; return 5 })() // boolean operation without cast
}


// ============================================================================
// comb_11a
// ============================================================================
let str_11a: string = "";
function foo_11a(p: null | string): number {
  if (p instanceof string) {
    str_11a = p.substr(0, 1) // calling string method without cast
  } else {
    return 2
  }
  return 1
}


// ============================================================================
// comb_11b
// ============================================================================
let str_11b: string = "";
function foo_11b(p: null | string): number {
  if (p != null) {
    str_11b = p.substr(0, 1) // calling string method without cast
  } else {
    return 2
  }
  return 1
}


// ============================================================================
// comb_11c
// ============================================================================
let str_11c: string = "";
function foo_11c(p: null | string): number {
  if (!(p instanceof string)) {
    return 2
  } else {
    str_11c = p.substr(0, 1) // calling string method without cast
  }
  return 1
}


// ============================================================================
// comb_11d
// ============================================================================
let str_11d: string = "";
function foo_11d(p: null | string): number {
  if (p == null) {
    return 2
  } else {
    str_11d = p.substr(0, 1) // calling string method without cast
  }
  return 1
}


// ============================================================================
// comb_12a
// ============================================================================
let str_12a: string = "";
function foo_12a(p: null | string): number {
  return p instanceof string ?
    ((): number => { str_12a = p.substr(0, 1); return 1 })() // calling string method without cast
    : 2
}


// ============================================================================
// comb_12b
// ============================================================================
let str_12b: string = "";
function foo_12b(p: null | string): number {
  return p != null ?
    ((): number => { str_12b = p.substr(0, 1); return 1 })() // calling string method without cast
    : 2
}


// ============================================================================
// comb_13
// ============================================================================
class A_13 {}
let a_13: A_13 | undefined = new A_13()

let num_13: Number = 0;
let str_13: string = "";
let err_13: Error = new Error();
let bool_13: Boolean = false;

function foo_13(p: number | string | undefined | Error | boolean): number {
  if (p != undefined && !(p instanceof Number) && !(p instanceof Error) && !(p instanceof Boolean)) {
    str_13 = p.substr(0, 1) // string method without cast
    return 1
  } else if (p != undefined && !(p instanceof Number) && !(p instanceof Error)) {
    bool_13 = !p // boolean operator without cast
    return 2
  } else if (p != undefined && !(p instanceof Number)) {
    err_13 = p
    str_13 = p.message // field access without cast
    return 3
  } else if (p != undefined) {
    num_13 = p * 2 // numeric operation without cast
    return 4
  }
  a_13 = p
  return 5
}


// ============================================================================
// comb_13a
// ============================================================================
let str_13a: string = "";
function foo_13a(p: null | number | string): number {
  if (p != null && !(p instanceof Number)) {
    str_13a = p.substr(0, 1) // string method without cast
    return 1
  }
  return 2
}


// ============================================================================
// comb_13b
// ============================================================================
let num_13b: number

function foo_13b(p: null | number | string): number {
  if (p != null && !(p instanceof String)) {
    num_13b = p * 2 // numeric operation without cast
    return 1
  }
  return 2
}


// ============================================================================
// comb_13c
// ============================================================================
let num_13c: number

function foo_13c(p: number | number[] | undefined): number {
  if (p instanceof Number) {
    num_13c = p * 2 // numeric operation without cast
    return 1
  } else if (p instanceof Array) {
    num_13c = p.length // field access without cast
    return 2
  }
  return 3
}


// ============================================================================
// comb_13d
// ============================================================================
let num_13d: number

function foo_13d(p: number | number[] | undefined): number {
  if (!(p instanceof Number) && p != undefined) {
    num_13d = p.length // field access without cast
    return 2
  }
  num_13d = p == undefined ? 3.0 : p * 2 // numeric operation without cast
  return 1
}


export default function ComputingSmartTypesTest20():void {
  describe('ComputingSmartTypesTest20', () => {
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
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_0100
     * @tc.name      testcomb0001
     * @tc.desc      Checking combinations of types in if/else branching (comb_01a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_01a(undefined) == 1 && a_01a === undefined).assertTrue()
      expect(foo_01a(42.0) == 2 && num_01a == 84 && not_undef_01a as Number == 42.0).assertTrue()
      let e: Error = new Error("xyz")
      expect(foo_01a(e) == 3 && err_01a == e && not_undef_01a as Error == e && str_01a == "xyz").assertTrue()
      expect(foo_01a("abc") == 4 && str_01a == "a" && not_undef_01a as string == "abc").assertTrue()
      expect(foo_01a(true) == 5 && !bool_01a && not_undef_01a as boolean == true).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_0200
     * @tc.name      testcomb0002
     * @tc.desc      Checking combinations of types in if/else branching with intermediate let assignments (comb_01b)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_01b(undefined) == 1 && a_01b === undefined).assertTrue()
      expect(foo_01b(42.0) == 2 && num_01b == 84).assertTrue()
      let e: Error = new Error("xyz")
      expect(foo_01b(e) == 3 && err_01b == e && str_01b == "xyz").assertTrue()
      expect(foo_01b("abc") == 4 && str_01b == "a").assertTrue()
      expect(foo_01b(true) == 5 && !bool_01b).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_0300
     * @tc.name      testcomb0003
     * @tc.desc      Checking narrowing conversions on broader types (comb_01c)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_01c(undefined) == 1 && a_01c === undefined).assertTrue()
      expect(foo_01c(42.0) == 2 && num_01c == 84).assertTrue()
      let e: Error = new Error("xyz")
      expect(foo_01c(e) == 3 && err_01c == e && str_01c == "xyz").assertTrue()
      expect(foo_01c("abc") == 4 && str_01c == "a").assertTrue()
      expect(foo_01c(true) == 5 && !bool_01c).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_0400
     * @tc.name      testcomb0004
     * @tc.desc      Checking conversions on null/undefined and intermediate casting (comb_01d)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_01d(undefined) == 1 && a_01d === undefined).assertTrue()
      expect(foo_01d(42.0) == 2 && num_01d == 84).assertTrue()
      let e: Error = new Error("xyz")
      expect(foo_01d(e) == 3 && err_01d == e && str_01d == "xyz").assertTrue()
      expect(foo_01d("abc") == 4 && str_01d == "a").assertTrue()
      expect(foo_01d(true) == 5 && !bool_01d).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_0500
     * @tc.name      testcomb0005
     * @tc.desc      Checking combinations of types in ternary branching (comb_10a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_10a(undefined) == 1 && a_10a === undefined).assertTrue()
      expect(foo_10a(42.0) == 2 && num_10a == 84).assertTrue()
      let e: Error = new Error("xyz")
      expect(foo_10a(e) == 3 && err_10a == e && str_10a == "xyz").assertTrue()
      expect(foo_10a("abc") == 4 && str_10a == "a").assertTrue()
      expect(foo_10a(true) == 5 && !bool_10a).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_0600
     * @tc.name      testcomb0006
     * @tc.desc      Checking string narrowing (comb_11a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_11a("abc") == 1 && str_11a == "a").assertTrue()
      expect(foo_11a(null) == 2).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_0700
     * @tc.name      testcomb0007
     * @tc.desc      Checking string narrowing (comb_11b)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_11b("abc") == 1 && str_11b == "a").assertTrue()
      expect(foo_11b(null) == 2).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_0800
     * @tc.name      testcomb0008
     * @tc.desc      Checking string narrowing (comb_11c)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_11c("abc") == 1 && str_11c == "a").assertTrue()
      expect(foo_11c(null) == 2).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_0900
     * @tc.name      testcomb0009
     * @tc.desc      Checking string narrowing (comb_11d)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_11d("abc") == 1 && str_11d == "a").assertTrue()
      expect(foo_11d(null) == 2).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_1000
     * @tc.name      testcomb0010
     * @tc.desc      Checking string narrowing in ternary checks (comb_12a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_12a("abc") == 1 && str_12a == "a").assertTrue()
      expect(foo_12a(null) == 2).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_1100
     * @tc.name      testcomb0011
     * @tc.desc      Checking string narrowing in ternary checks (comb_12b)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_12b("abc") == 1 && str_12b == "a").assertTrue()
      expect(foo_12b(null) == 2).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_1200
     * @tc.name      testcomb0012
     * @tc.desc      Checking combinations of logic operators && and ! (comb_13)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_13("abc") == 1 && str_13 == "a").assertTrue()
      expect(foo_13(true) == 2 && !bool_13).assertTrue()
      let e: Error = new Error("xyz")
      expect(foo_13(e) == 3 && err_13 == e && str_13 == "xyz").assertTrue()
      expect(foo_13(42.0) == 4 && num_13 == 84).assertTrue()
      expect(foo_13(undefined) == 5 && a_13 === undefined).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_1300
     * @tc.name      testcomb0013
     * @tc.desc      Checking logic operators narrowing string (comb_13a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_13a(null) == 2).assertTrue()
      expect(foo_13a(42) == 2).assertTrue()
      expect(foo_13a("abc") == 1 && str_13a == "a").assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_1400
     * @tc.name      testcomb0014
     * @tc.desc      Checking logic operators narrowing number (comb_13b)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_13b(null) == 2).assertTrue()
      expect(foo_13b(42) == 1 && num_13b == 84).assertTrue()
      expect(foo_13b("abc") == 2).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_1500
     * @tc.name      testcomb0015
     * @tc.desc      Checking narrowing with arrays and primitives (comb_13c)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_13c(42) == 1 && num_13c == 84).assertTrue()
      expect(foo_13c([1.0, 2.0, 3.0, 4.0, 5.0]) == 2 && num_13c == 5).assertTrue()
      expect(foo_13c(undefined) == 3).assertTrue()
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTWENTY_1600
     * @tc.name      testcomb0016
     * @tc.desc      Checking narrowing with arrays and primitives inverted (comb_13d)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testcomb0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_13d([1.0, 2.0, 3.0, 4.0, 5.0]) == 2 && num_13d == 5).assertTrue()
      expect(foo_13d(42) == 1 && num_13d == 84).assertTrue()
      expect(foo_13d(undefined) == 1 && num_13d == 3).assertTrue()
    });

  })
}