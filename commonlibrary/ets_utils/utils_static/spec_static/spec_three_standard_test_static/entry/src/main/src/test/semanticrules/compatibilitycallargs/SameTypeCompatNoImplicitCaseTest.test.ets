'use static';
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
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}
function checkTypeIdentity1(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity2(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity3(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity4(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity5(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}
function checkTypeIdentity6(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}
function checkTypeIdentity7(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}
function checkTypeIdentity8(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}
function checkTypeIdentity9(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
type keyVal9 = Record<string, string>
function checkTypeIdentity10(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}
type my_lambda10 = (a: number, b: number) => number
function checkTypeIdentity11(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity12(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity13(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity14(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity15(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity16(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
type name_age17 = Record<string, number>

function checkTypeIdentity17(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity18(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity19(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity20(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}

type my_partial20 = [string | undefined, number | undefined]
type my_record21 = Record<string, number>

function checkTypeIdentity21(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity22(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}

type my_lambda22 = () => void
type my_type23 = Record<string, number>

function checkTypeIdentity23(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
type my_type24 = Record<string, number>

function checkTypeIdentity24(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
class my_type25 {
  name?: string
  age?: number
  constructor(
    name?: string,
    age?: number
  ) {
    this.name = name
    this.age = age
  }
}

function checkTypeIdentity25(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}

export default function SameTypeCompatNoImplicitCaseTest(): void {
  describe('SameTypeCompatNoImplicitCaseTest', () => {
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
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_0100
     * @tc.name      testSameTypeCompatNoImplicitCase0001
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: number = 3.14;
      const val2: number = 2.718;
      const diffTypeVal: Any = "Hello, World!";

      const result1 = checkTypeIdentity1(val1, val2);

      const result2 = checkTypeIdentity1(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_0200
     * @tc.name      testSameTypeCompatNoImplicitCase0002
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: string = "Hello";
      const val2: string = "World";
      const diffTypeVal: Any = 42;
      const result1 = checkTypeIdentity2(val1, val2);
      const result2 = checkTypeIdentity2(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_0300
     * @tc.name      testSameTypeCompatNoImplicitCase0003
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: boolean = true;
      const val2: boolean = false;
      const diffTypeVal: Any = "Hello, World!";
      const result1 = checkTypeIdentity3(val1, val2);
      const result2 = checkTypeIdentity3(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_0400
     * @tc.name      testSameTypeCompatNoImplicitCase0004
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: number[] = [1, 2, 3];
      const val2: number[] = [4, 5, 6];
      const diffTypeVal: Any = "This is a string";

      const result1 = checkTypeIdentity4(val1, val2);

      const result2 = checkTypeIdentity4(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_0500
     * @tc.name      testSameTypeCompatNoImplicitCase0005
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: undefined = undefined;
      const val2: undefined = undefined;
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity5(val1, val2);

      const result2 = checkTypeIdentity5(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_0600
     * @tc.name      testSameTypeCompatNoImplicitCase0006
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: null = null;
      const val2: null = null;
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity6(val1, val2);

      const result2 = checkTypeIdentity6(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_0700
     * @tc.name      testSameTypeCompatNoImplicitCase0007
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: string | null = "Hello";
      const val2: string | null = null;
      const diffTypeVal: Any = 42;

      const result1 = checkTypeIdentity7(val1, val2);

      const result2 = checkTypeIdentity7(val1, diffTypeVal);
      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_0800
     * @tc.name      testSameTypeCompatNoImplicitCase0008
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: string | undefined = "Hello";
      const val2: string | undefined = undefined;
      const diffTypeVal: Any = 42;

      const result1 = checkTypeIdentity8(val1, val2);

      const result2 = checkTypeIdentity8(val1, diffTypeVal);
      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_0900
     * @tc.name      testSameTypeCompatNoImplicitCase0009
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: keyVal9 = { "key": "value1" };
      const val2: keyVal9 = { "key": "value2" };
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity9(val1, val2);

      const result2 = checkTypeIdentity9(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_1000
     * @tc.name      testSameTypeCompatNoImplicitCase0010
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: my_lambda10 = (a, b) => a + b;
      const val2: my_lambda10 = (a, b) => a * b;
      const diffTypeVal: Any = "This can be any type";
      const result1 = checkTypeIdentity10(val1, val2);
      const result2 = checkTypeIdentity10(val1, diffTypeVal);
      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_1100
     * @tc.name      testSameTypeCompatNoImplicitCase0011
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: Date = new Date();
      const val2: Date = new Date();
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity11(val1, val2);
      const result2 = checkTypeIdentity11(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_1200
     * @tc.name      testSameTypeCompatNoImplicitCase0012
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1:string = 'test';
      const val2:string = 'example';
      const diffTypeVal: Any = "This can be any type";
      const result1 = checkTypeIdentity12(val1, val2);
      const result2 = checkTypeIdentity12(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_1300
     * @tc.name      testSameTypeCompatNoImplicitCase0013
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: Map<string, number> = new Map<string, number>([["a", 1]]);
      const val2: Map<string, number> = new Map<string, number>([["b", 2]]);
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity13(val1, val2);

      const result2 = checkTypeIdentity13(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_1400
     * @tc.name      testSameTypeCompatNoImplicitCase0014
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: Set<string> = new Set<string>(["a"]);
      const val2: Set<string> = new Set<string>(["b"]);
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity14(val1, val2);

      const result2 = checkTypeIdentity14(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_1500
     * @tc.name      testSameTypeCompatNoImplicitCase0015
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: Promise<string> = Promise.resolve("Hello");
      const val2: Promise<string> = Promise.resolve("World");
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity15(val1, val2);

      const result2 = checkTypeIdentity15(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_1600
     * @tc.name      testSameTypeCompatNoImplicitCase0016
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: bigint = BigInt(100);
      const val2: bigint = BigInt(200);
      const diffTypeVal: Any = "This can be any type";
      const result1 = checkTypeIdentity16(val1, val2);
      const result2 = checkTypeIdentity16(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_1700
     * @tc.name      testSameTypeCompatNoImplicitCase0017
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: name_age17 = { "Alice": 25 };
      const val2: name_age17 = { "Bob": 30 };
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity17(val1, val2);

      const result2 = checkTypeIdentity17(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_1800
     * @tc.name      testSameTypeCompatNoImplicitCase0018
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: [string, number] = ["Hello", 42];
      const val2: [string, number] = ["World", 100];
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity18(val1, val2);

      const result2 = checkTypeIdentity18(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_1900
     * @tc.name      testSameTypeCompatNoImplicitCase0019
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: ReadonlyArray<string> = ["a", "b", "c"];
      const val2: ReadonlyArray<string> = ["d", "e", "f"];
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity19(val1, val2);

      const result2 = checkTypeIdentity19(val1, diffTypeVal);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_2000
     * @tc.name      testSameTypeCompatNoImplicitCase0020
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: my_partial20 = ["Alice", undefined];
      const val2: my_partial20 = [undefined, 25];
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity20(val1, val2);

      const result2 = checkTypeIdentity20(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_2100
     * @tc.name      testSameTypeCompatNoImplicitCase0021
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: my_record21 = {"a": 1, "b": 2};
      const val2: my_record21 = {"c": 3, "d": 4};
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity21(val1, val2);

      const result2 = checkTypeIdentity21(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_2200
     * @tc.name      testSameTypeCompatNoImplicitCase0022
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: my_lambda22 = () => console.log("Hello");
      const val2: my_lambda22 = () => console.log("World");
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity22(val1, val2);

      const result2 = checkTypeIdentity22(val1, diffTypeVal);
      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_2300
     * @tc.name      testSameTypeCompatNoImplicitCase0023
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: my_type23 = { "a": 1, "b": 2 };
      const val2: my_type23 = { "c": 3, "d": 4 };
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity23(val1, val2);

      const result2 = checkTypeIdentity23(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_2400
     * @tc.name      testSameTypeCompatNoImplicitCase0024
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: Readonly<my_type24> = { "Alice": 25 };
      const val2: Readonly<my_type24> = { "Bob": 30 };
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity24(val1, val2);

      const result2 = checkTypeIdentity24(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SAME_TYPE_COMPAT_NO_IMPLICIT_CASE_2500
     * @tc.name      testSameTypeCompatNoImplicitCase0025
     * @tc.desc      T1 is compatible with T2 if implicitly convertible. Class does not implement interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeCompatNoImplicitCase0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: my_type25 = new my_type25();
      const val2: my_type25 = new my_type25("Alice");
      const val3: my_type25 = new my_type25("Alice", 25);
      const diffTypeVal: Any = "This can be any type";

      const result1 = checkTypeIdentity25(val1, val2);
      const result2 = checkTypeIdentity25(val1, val3);
      const result3 = checkTypeIdentity25(val1, diffTypeVal);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
    });
  })
}
