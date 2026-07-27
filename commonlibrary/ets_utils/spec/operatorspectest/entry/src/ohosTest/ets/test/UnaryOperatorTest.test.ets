/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ESObject KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

class MyClass021 {
}

class Animal082 {
  name: string = "Animal"
}

class Dog082 extends Animal082 {
  breed: string = "Labrador"
}

class A083 {
}

class B083 extends A083 {
}

class C083 extends B083 {
}

interface GeneratedObjectLiteralInterface_2 {
  a: number;
}

interface GeneratedObjectLiteralInterface_1 {}

interface GeneratedObjectLiteralInterface_3 {}

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function UnaryOperatorTest() {
  describe('UnaryOperatorTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await sleep(30)
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0110
     * @tc.name testUnaryOperator001
     * @tc.desc Verify typeof number returns "number"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof 42).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0120
     * @tc.name testUnaryOperator002
     * @tc.desc Verify typeof string returns "string"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof "hello").assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0130
     * @tc.name testUnaryOperator003
     * @tc.desc Verify typeof boolean returns "boolean"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof true).assertEqual("boolean")
      expect(typeof false).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0140
     * @tc.name testUnaryOperator004
     * @tc.desc Verify typeof undefined returns "undefined"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof undefined).assertEqual("undefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0160
     * @tc.name testUnaryOperator006
     * @tc.desc Verify typeof BigInt returns "bigint"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof 42n).assertEqual("bigint")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0170
     * @tc.name testUnaryOperator007
     * @tc.desc Verify typeof NaN returns "number"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof NaN).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0180
     * @tc.name testUnaryOperator008
     * @tc.desc Verify typeof Infinity returns "number"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Infinity).assertEqual("number")
      expect(typeof -Infinity).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0190
     * @tc.name testUnaryOperator009
     * @tc.desc Verify typeof Number.MAX_SAFE_INTEGER returns "number"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Number.MAX_SAFE_INTEGER).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0200
     * @tc.name testUnaryOperator010
     * @tc.desc Verify typeof zero returns "number"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof 0).assertEqual("number")
      expect(typeof -0).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0210
     * @tc.name testUnaryOperator011
     * @tc.desc Verify typeof 0n returns "bigint"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof 0n).assertEqual("bigint")
      expect(typeof -0n).assertEqual("bigint")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0220
     * @tc.name testUnaryOperator012
     * @tc.desc Verify typeof null returns "object" (legacy design)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof null).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0230
     * @tc.name testUnaryOperator013
     * @tc.desc Verify precise null check using strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: ESObject = null
      expect(val === null).assertTrue()
      expect(typeof val === "object" && val !== null).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0240
     * @tc.name testUnaryOperator014
     * @tc.desc Verify typeof plain object returns "object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof ({} as GeneratedObjectLiteralInterface_1)).assertEqual("object")
      expect(typeof ({ a: 1 } as GeneratedObjectLiteralInterface_2)).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0250
     * @tc.name testUnaryOperator015
     * @tc.desc Verify typeof array returns "object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof []).assertEqual("object")
      expect(typeof [1, 2, 3]).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0260
     * @tc.name testUnaryOperator016
     * @tc.desc Verify typeof Date instance returns "object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof new Date()).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0270
     * @tc.name testUnaryOperator017
     * @tc.desc Verify typeof RegExp returns "object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof /abc/).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0280
     * @tc.name testUnaryOperator018
     * @tc.desc Verify typeof Map/Set returns "object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof new Map<string, string>()).assertEqual("object")
      expect(typeof new Set<string>()).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0290
     * @tc.name testUnaryOperator019
     * @tc.desc Verify typeof function returns "function"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof foo).assertEqual("function")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0300
     * @tc.name testUnaryOperator020
     * @tc.desc Verify typeof arrow function returns "function"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = () => 42
      expect(typeof fn).assertEqual("function")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0310
     * @tc.name testUnaryOperator021
     * @tc.desc Verify typeof class returns "function"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof MyClass021).assertEqual("function")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0320
     * @tc.name testUnaryOperator022
     * @tc.desc Verify typeof built-in constructors return "function"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof String).assertEqual("function")
      expect(typeof Number).assertEqual("function")
      expect(typeof Boolean).assertEqual("function")
      expect(typeof Array).assertEqual("function")
      expect(typeof Object).assertEqual("function")
      expect(typeof Date).assertEqual("function")
      expect(typeof Math).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0330
     * @tc.name testUnaryOperator023
     * @tc.desc Verify typeof new String() returns "object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof new String("hello")).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0340
     * @tc.name testUnaryOperator024
     * @tc.desc Verify typeof new Number() returns "object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof new Number(42)).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0350
     * @tc.name testUnaryOperator025
     * @tc.desc Verify typeof new Boolean() returns "object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof new Boolean(true)).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0360
     * @tc.name testUnaryOperator026
     * @tc.desc Verify typeof primitive string vs String wrapper object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof "hello").assertEqual("string")
      expect(typeof new String("hello")).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0370
     * @tc.name testUnaryOperator027
     * @tc.desc Verify typeof primitive number vs Number wrapper object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof 42).assertEqual("number")
      expect(typeof new Number(42)).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0380
     * @tc.name testUnaryOperator028
     * @tc.desc Verify typeof(expr) equals typeof expr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (42)).assertEqual(typeof 42)
      expect(typeof (42)).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0390
     * @tc.name testUnaryOperator029
     * @tc.desc Verify typeof evaluates expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (1 + 2)).assertEqual("number")
      expect(typeof ("a" + "b")).assertEqual("string")
      expect(typeof (1 < 2)).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0400
     * @tc.name testUnaryOperator030
     * @tc.desc Verify typeof undeclared variable returns "undefined" without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof undefined).assertEqual("undefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0410
     * @tc.name testUnaryOperator031
     * @tc.desc Verify typeof declared but unassigned variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: ESObject
      expect(typeof x).assertEqual("undefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0420
     * @tc.name testUnaryOperator032
     * @tc.desc Verify string type guard using typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(process32("hello")).assertEqual("HELLO")
      expect(process32(42)).assertEqual("42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0430
     * @tc.name testUnaryOperator033
     * @tc.desc Verify number type guard using typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(doubleValue33(5)).assertEqual(10)
      expect(doubleValue33("5")).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0440
     * @tc.name testUnaryOperator034
     * @tc.desc Verify function type check before calling using typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(safeCall34((x: number) => x * 2, 5)).assertEqual(10)
      expect(safeCall34(null)).assertUndefined()
      expect(safeCall34("not a function")).assertUndefined()
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0460
     * @tc.name testUnaryOperator036
     * @tc.desc Verify different processing based on typeof result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(describe36("hi")).assertEqual("String: hi")
      expect(describe36(42)).assertEqual("Number: 42")
      expect(describe36(null)).assertEqual("Null")
      expect(describe36(undefined)).assertEqual("Other: undefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0470
     * @tc.name testUnaryOperator037
     * @tc.desc Verify typeof array returns "object" instead of "array"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ESObject[] = [1, 2, 3]
      expect(typeof arr).assertEqual("object")
      expect(Array.isArray(arr)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0480
     * @tc.name testUnaryOperator038
     * @tc.desc Verify typeof cannot distinguish Date/RegExp/Map objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof new Date()).assertEqual("object")
      expect(typeof /abc/).assertEqual("object")
      expect(typeof new Map()).assertEqual("object")
      expect(new Date() instanceof Date).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0660
     * @tc.name testUnaryOperator056
     * @tc.desc Verify void returns undefined for ESObject expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(void 0).assertUndefined()
      expect(void 42).assertUndefined()
      expect(void "hello").assertUndefined()
      expect(void true).assertUndefined()
      expect(void null).assertUndefined()
      expect(void undefined).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0670
     * @tc.name testUnaryOperator057
     * @tc.desc Verify void object returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(void ({} as GeneratedObjectLiteralInterface_3)).assertUndefined()
      expect(void []).assertUndefined()
      expect(void (() => 42)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0680
     * @tc.name testUnaryOperator058
     * @tc.desc Verify void(expr) equals void expr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(void (1 + 2)).assertUndefined()
      expect(void (typeof 42)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0690
     * @tc.name testUnaryOperator059
     * @tc.desc Verify expression side effects execute in void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      let result: ESObject = void (x = 42)
      expect(result).assertUndefined()
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0700
     * @tc.name testUnaryOperator060
     * @tc.desc Verify function call executes in void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: ESObject = void (() => {
        called = true
      })()
      expect(result).assertUndefined()
      expect(called).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0720
     * @tc.name testUnaryOperator062
     * @tc.desc Verify void ensures callback returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: number[] = [1, 2, 3]
      let sideEffect = 0
      nums.forEach(n => void (sideEffect += n))
      expect(sideEffect).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0730
     * @tc.name testUnaryOperator063
     * @tc.desc Verify void 0 equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(void 0 === undefined).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0740
     * @tc.name testUnaryOperator064
     * @tc.desc Verify using void 0 to check if variable is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: ESObject
      expect(x === void 0).assertTrue()
      x = 42
      expect(x === void 0).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0860
     * @tc.name testUnaryOperator076
     * @tc.desc Verify new Date() instanceof Date is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Date(2024, 0, 1)
      expect(d instanceof Date).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0870
     * @tc.name testUnaryOperator077
     * @tc.desc Verify plain object is not Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(({} as ESObject) instanceof Date).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0880
     * @tc.name testUnaryOperator078
     * @tc.desc Verify array instanceof Array is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect([1, 2, 3] instanceof Array).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0890
     * @tc.name testUnaryOperator079
     * @tc.desc Verify array literal and constructor pass instanceof Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect([1, 2] instanceof Array).assertTrue()
      expect(new Array(1, 2) instanceof Array).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0900
     * @tc.name testUnaryOperator080
     * @tc.desc Verify Error object instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new Error("test")
      expect(err instanceof Error).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0910
     * @tc.name testUnaryOperator081
     * @tc.desc Verify TypeError is subclass of Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let typeErr = new TypeError("type error")
      expect(typeErr instanceof TypeError).assertTrue()
      expect(typeErr instanceof Error).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0920
     * @tc.name testUnaryOperator082
     * @tc.desc Verify subclass instance instanceof parent class is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Dog082()
      expect(d instanceof Dog082).assertTrue()
      expect(d instanceof Animal082).assertTrue()
      expect(d instanceof Object).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0930
     * @tc.name testUnaryOperator083
     * @tc.desc Verify each level passes in multi-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new C083()
      expect(c instanceof C083).assertTrue()
      expect(c instanceof B083).assertTrue()
      expect(c instanceof A083).assertTrue()
      expect(c instanceof Object).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0940
     * @tc.name testUnaryOperator084
     * @tc.desc Verify primitive number instanceof Number is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((42 as ESObject) instanceof Number).assertFalse()
      expect(("hello" as ESObject) instanceof String).assertFalse()
      expect((true as ESObject) instanceof Boolean).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0950
     * @tc.name testUnaryOperator085
     * @tc.desc Verify new Number() instanceof Number is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Number(42) instanceof Number).assertTrue()
      expect(new String("hello") instanceof String).assertTrue()
      expect(new Boolean(true) instanceof Boolean).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0960
     * @tc.name testUnaryOperator086
     * @tc.desc Verify null instanceof ESObject type is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) instanceof Object).assertFalse()
      expect((null as ESObject) instanceof Array).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0970
     * @tc.name testUnaryOperator087
     * @tc.desc Verify undefined instanceof ESObject type is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) instanceof Object).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0980
     * @tc.name testUnaryOperator088
     * @tc.desc Verify ESObject object instanceof Object is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(({} as ESObject) instanceof Object).assertTrue()
      expect(([] as ESObject) instanceof Object).assertTrue()
      expect((/abc/ as ESObject) instanceof Object).assertTrue()
      expect((new Date() as ESObject) instanceof Object).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_0990
     * @tc.name testUnaryOperator089
     * @tc.desc Verify MDN theDay instanceof Date example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let theDay = new Date(1995, 11, 17)
      expect(theDay instanceof Date).assertTrue()
      if (theDay instanceof Date) {
        expect(theDay.getFullYear()).assertEqual(1995)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1000
     * @tc.name testUnaryOperator090
     * @tc.desc Verify typeof filters primitives and instanceof checks object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getType90(42)).assertEqual("number")
      expect(getType90("hi")).assertEqual("string")
      expect(getType90(null)).assertEqual("null")
      expect(getType90([1, 2])).assertEqual("array")
      expect(getType90(new Date())).assertEqual("date")
      expect(getType90({})).assertEqual("object")
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1020
     * @tc.name testUnaryOperator092
     * @tc.desc Verify void executes typeof without returning result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let executed: boolean = false
      let result: ESObject = void (() => {
        executed = true;
        return typeof 42
      })()
      expect(result).assertUndefined()
      expect(executed).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1030
     * @tc.name testUnaryOperator093
     * @tc.desc Verify typeof null legacy bug
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof null).assertEqual("object")
      let val: ESObject = null
      expect(val === null).assertTrue()
      expect(val === null ? "null" : typeof val).assertEqual("null")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1040
     * @tc.name testUnaryOperator094
     * @tc.desc Verify typeof cannot distinguish arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = [1, 2, 3]
      expect(typeof arr).assertEqual("object")
      expect(Array.isArray(arr)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1050
     * @tc.name testUnaryOperator095
     * @tc.desc Verify delete cannot remove declared variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1070
     * @tc.name testUnaryOperator097
     * @tc.desc Verify instanceof works in same realm
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = [1, 2, 3]
      expect(arr instanceof Array).assertTrue()
      expect(Array.isArray(arr)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1080
     * @tc.name testUnaryOperator098
     * @tc.desc Verify primitive string instanceof String is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitive: ESObject = "hello"
      let wrapped: ESObject = new String("hello")
      expect(primitive instanceof String).assertFalse()
      expect(wrapped instanceof String).assertTrue()
      expect(typeof primitive).assertEqual("string")
      expect(typeof wrapped).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1090
     * @tc.name testUnaryOperator099
     * @tc.desc Verify void has high operator precedence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(void 0 === undefined).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1100
     * @tc.name testUnaryOperator100
     * @tc.desc Verify void does not change expression side effects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      void (x = 10)
      expect(x).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1150
     * @tc.name testUnaryOperator105
     * @tc.desc Verify MDN typeof return value table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof "round").assertEqual("string")
      expect(typeof 1).assertEqual("number")
      expect(typeof true).assertEqual("boolean")
      expect(typeof null).assertEqual("object")
      expect(typeof new Date()).assertEqual("object")
      expect(typeof Date).assertEqual("function")
      expect(typeof Math).assertEqual("object")
      expect(typeof String).assertEqual("function")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1160
     * @tc.name testUnaryOperator106
     * @tc.desc Verify MDN Date instanceof example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let theDay = new Date(1995, 11, 17)
      expect(theDay instanceof Date).assertTrue()
      if (theDay instanceof Date) {
        expect(theDay instanceof Object).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNARY_OPERATOR_1170
     * @tc.name testUnaryOperator107
     * @tc.desc Verify void returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnaryOperator107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(void 0).assertUndefined()
      expect(void (1 + 2)).assertUndefined()
      expect(void 0 === undefined).assertTrue()
    });
  });
}

function foo() {
}

function process32(value: string | number): string {
  return typeof value === "string" ? value.toUpperCase() : value.toString()
}

function doubleValue33(value: string | number): number {
  if (typeof value === "number") {
    return value * 2
  }
  return parseInt(value) * 2
}

function safeCall34(fn: ESObject, ...args: ESObject[]): ESObject {
  return typeof fn === "function" ? fn(...args) : undefined
}

function describe36(value: ESObject): string {
  let type: string = typeof value
  return type === "string" ? `String: ${value}`
    : type === "number" ? `Number: ${value}`
      : type === "boolean" ? `Boolean: ${value}`
        : type === "function" ? "Function"
          : type === "object" ? (value === null ? "Null" : "Object")
            : `Other: ${type}`
}

function getType90(value: ESObject): string {
  if (value === null) {
    return "null"
  }
  let type: string = typeof value
  if (type !== "object" && type !== "function") {
    return type
  }
  if (Array.isArray(value)) {
    return "array"
  }
  if (value instanceof Date) {
    return "date"
  }
  if (value instanceof RegExp) {
    return "regexp"
  }
  if (value instanceof Map) {
    return "map"
  }
  if (value instanceof Set) {
    return "set"
  }
  if (value instanceof Error) {
    return "error"
  }
  return type
}
