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
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => { resolve(0); }, time);
  });
}

type ReadonlyTuple = readonly [number, string];
function processReadonlyTuple(tuple: ReadonlyTuple): ReadonlyTuple { return tuple; }

type MyTupleType = [number, string];
function processMyTuple(value: MyTupleType): MyTupleType { return value; }

type UnionArray = (number | string)[];
function processUnionArray(arr: UnionArray): UnionArray { return arr; }

type Greeting = () => string;
function getGreetingFn(): Greeting { return () => "Hello, World!"; }

type ReadonlyNumberArray = readonly number[];
function processReadonlyNumberArray(arr: ReadonlyNumberArray): ReadonlyNumberArray { return arr; }

type MyFunction = (p: number) => number;
const myFunc: MyFunction = (p: number): number => p;

class BaseClass { methodOne(p: BaseClass): BaseClass { return p; } }
class DerivedClass extends BaseClass { override methodOne(p: BaseClass): BaseClass { return p; } }

enum MyEnum { A, B, C }
function processMyEnumValue(value: MyEnum): MyEnum { return value; }

type StringOrNumber = string | number;
function processStringOrNumberValue(value: StringOrNumber): StringOrNumber { return value; }

type MyTuple = [number, string];
function processMyTuple2(tuple: MyTuple): MyTuple { return tuple; }

type MyArrayType = number[];
function processMyArray(value: MyArrayType): MyArrayType { return value; }

type MyGenericType<T> = T;
function processGenericValue<T>(value: T): MyGenericType<T> { return value; }

class MyClass { method(a: number, b: string): string { return `${a} ${b}`; } }

type MyLiteralType = "Hello" | "World";
function processLiteral(value: MyLiteralType): MyLiteralType { return value; }

type MyFunctionType = (a: number, b: string) => string;
function myFunction(a: number, b: string): string { return `${a} ${b}`; }

type StringTransformer = (input: string) => string;
function processStringTransform(input: string, transformer: StringTransformer): string { return transformer(input); }

type NumberArray = number[];
function processNumberArray(arr: NumberArray): NumberArray { return arr; }

type MyTypeAlias = string;
function processTypeAlias(value: MyTypeAlias): MyTypeAlias { return value; }

type StringReturn = () => string;
function getStringReturn(): StringReturn { return () => "Hello"; }

class BaseGeneric<T> { methodOne(p: T): T { return p; } }
class DerivedGeneric<T> extends BaseGeneric<T> { override methodOne(p: T): T { return p; } }

type MyUnionType = string | number;
function processMyUnion(value: MyUnionType): MyUnionType { return value; }

type NumberArrayType = number[];
function processNumberArrayType(arr: NumberArrayType): NumberArrayType { return arr; }

export default function TypeIdentityCase(): void {
  describe('TypeIdentityCase', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_0100
     * @tc.name      testTypeIdentityCase0001
     * @tc.desc      Ensuring type identity in type alias with readonly tuple types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tuple: ReadonlyTuple = [42, "Hello"];
      let result = processReadonlyTuple(tuple);
      expect(result[0]).assertEqual(42)
      expect(result[1]).assertEqual("Hello")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_0200
     * @tc.name      testTypeIdentityCase0002
     * @tc.desc      Ensuring type identity in tuple type usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = processMyTuple([42, "Hello"]);
      expect(result[0]).assertEqual(42)
      expect(result[1]).assertEqual("Hello")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_0300
     * @tc.name      testTypeIdentityCase0003
     * @tc.desc      Ensuring type identity in type alias with union type arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: UnionArray = [1, "Hello", 2, "World"];
      let result = processUnionArray(arr);
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual("Hello")
      expect(result[2]).assertEqual(2)
      expect(result[3]).assertEqual("World")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_0400
     * @tc.name      testTypeIdentityCase0004
     * @tc.desc      Ensuring type identity in type aliases with function return values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let greeting: Greeting = getGreetingFn();
      let result = greeting();
      expect(result).assertEqual("Hello, World!")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_0500
     * @tc.name      testTypeIdentityCase0005
     * @tc.desc      Ensuring type identity in conditional types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value1: number | string = 42;
      let value2: number | string = "Hello";
      expect(typeof value1 === "number").assertTrue()
      expect(typeof value2 === "number").assertFalse()
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_0600
     * @tc.name      testTypeIdentityCase0006
     * @tc.desc      Ensuring type identity in readonly arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: ReadonlyNumberArray = [1, 2, 3];
      let result = processReadonlyNumberArray(arr);
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_0700
     * @tc.name      testTypeIdentityCase0007
     * @tc.desc      Ensuring type identity in function type assignments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = myFunc(42);
      expect(result).assertEqual(42)
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_0800
     * @tc.name      testTypeIdentityCase0008
     * @tc.desc      Ensuring that method_one in subclasses keeps parameter and return types unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let a = new BaseClass();
      let b = new DerivedClass();
      expect(a.methodOne(a)).assertEqual(b.methodOne(a))
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_0900
     * @tc.name      testTypeIdentityCase0009
     * @tc.desc      Ensuring type identity in type aliases with union types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(processStringOrNumberValue("Hello")).assertEqual("Hello")
      expect(processStringOrNumberValue(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_1000
     * @tc.name      testTypeIdentityCase0010
     * @tc.desc      Ensuring type identity in enum type usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(processMyEnumValue(MyEnum.A)).assertEqual(MyEnum.A)
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_1100
     * @tc.name      testTypeIdentityCase0011
     * @tc.desc      Ensuring type identity in type alias with tuple types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tuple: MyTuple = [42, "Hello"];
      let result = processMyTuple2(tuple);
      expect(result[0]).assertEqual(42)
      expect(result[1]).assertEqual("Hello")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_1200
     * @tc.name      testTypeIdentityCase0012
     * @tc.desc      Ensuring type identity in array type usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = processMyArray([1,2,3]);
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_1300
     * @tc.name      testTypeIdentityCase0013
     * @tc.desc      Ensuring type identity in generic type usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(processGenericValue<string>("Hello")).assertEqual("Hello")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_1400
     * @tc.name      testTypeIdentityCase0014
     * @tc.desc      Ensuring type identity in strict method type usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj = new MyClass();
      expect(obj.method(42, "Hello")).assertEqual("42 Hello")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_1500
     * @tc.name      testTypeIdentityCase0015
     * @tc.desc      Ensuring type identity in literal type usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(processLiteral("Hello")).assertEqual("Hello")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_1600
     * @tc.name      testTypeIdentityCase0016
     * @tc.desc      Ensuring type identity in function type usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let func: MyFunctionType = myFunction;
      expect(func(42, "Hello")).assertEqual("42 Hello")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_1700
     * @tc.name      testTypeIdentityCase0017
     * @tc.desc      Ensuring type identity in type aliases with function types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = processStringTransform("hello", (input) => input.toUpperCase());
      expect(result).assertEqual("HELLO")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_1800
     * @tc.name      testTypeIdentityCase0018
     * @tc.desc      Ensuring type identity in type aliases with array literals.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: NumberArray = [1,2,3];
      let result = processNumberArray(arr);
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_1900
     * @tc.name      testTypeIdentityCase0019
     * @tc.desc      Ensuring type identity in type alias usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(processTypeAlias("Hello")).assertEqual("Hello")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_2000
     * @tc.name      testTypeIdentityCase0020
     * @tc.desc      Ensuring type identity in type alias with function return types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fn = getStringReturn();
      expect(fn()).assertEqual("Hello")
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_2100
     * @tc.name      testTypeIdentityCase0021
     * @tc.desc       Ensuring type identity in generic class method overrides.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let a = new BaseGeneric<number>();
      let b = new DerivedGeneric<number>();
      expect(a.methodOne(42)).assertEqual(b.methodOne(42))
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_2200
     * @tc.name      testTypeIdentityCase0022
     * @tc.desc       Ensuring type identity in union type usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(processMyUnion("Hello")).assertEqual("Hello")
      expect(processMyUnion(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_BASEDATE_TYPE_IDENTITY_CASE_2400
     * @tc.name      testTypeIdentityCase0024
     * @tc.desc      Ensuring type identity in type alias with array types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeIdentityCase0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: NumberArrayType = [1,2,3];
      let result = processNumberArrayType(arr);
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
    })
  })
}