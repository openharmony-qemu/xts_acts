/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

class parse {
  text: string = ''
}

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

interface Options {
  type: string,
  endings: string,
}


class ClassA {
  a: number = 1;
}

class ClassB {
  b: string = "test";
}

function returnUndefined() {
  return undefined;
}

function functionWithParams(a: number, b: string) {
}

function basicFunction() {
}

class IsReferenceTestClass {
  instanceMethod() {
  }

  static staticMethod() {
  }
}

class IsPrimitiveTestClass {
  instanceMethod() {
  }

  static staticMethod() {
  }
}

function anonymousFunctionExpr() {
};

class HasNameTestClass {
  instanceMethod() {
  }

  static staticMethod() {
  }

  private privateMethod() {
  }

  callPrivateMethod() {
    this.privateMethod();
  }
}

function namedFunction() {
}

function functionWithParameters(a: number, b: string) {
}

class NameTestClass {
  instanceMethod() {
  }

  static staticMethod() {
  }

  private privateMethod() {
  }

  callPrivateMethod() {
    this.privateMethod();
  }
}

class FunctionEqualityClass {
  methodX() {
  }

  methodY() {
  }

  calculate(a: number, b: number): number {
    return a + b;
  }
}

function identicalFunction() {
}

function functionA() {
}

function functionB() {
}

function add(a: number, b: number): number {
  return a + b;
}

function sum(a: number, b: number): number {
  return a + b;
}

function multiply(a: number, b: number): number {
  return a * b;
}

class ParameterTestClass {
  zeroParamMethod() {
  }

  oneParamMethod(value: number) {
  }

  twoParamsMethod(a: string, b: number) {
  }

  static staticThreeParamsMethod(x: boolean, y: object, z: string) {
  }
}

function genericFunction<T, U>(a: T, b: U): T {
  return a;
}

function noParamFunction() {
}

function oneParamFunction(a: number) {
}

function twoParamsFunction(a: string, b: boolean) {
}

function threeParamsFunction(x: number, y: string, z: object) {
}

function variableParamsFunction(...args: number[]) {
}

function defaultParamFunction(a: number, b: string = "default") {
}

class ExceptionTestClass {
  alwaysThrow(): void {
    throw new Error("Class method always throws");
  }

  conditionalThrow(flag: boolean): void {
    if (flag) {
      throw new Error("Class method conditionally throws");
    }
  }

  neverThrow(): string {
    return "Class method never throws";
  }

  static staticThrow(): void {
    throw new Error("Static method throws");
  }
}

function throwingWithTryCatch(): void {
  try {
    throw new Error("Error inside try block");
  } catch (e) {
    console.log("Error caught");
  }
}

function conditionallyThrowingFunction(shouldThrow: boolean): string {
  if (shouldThrow) {
    throw new Error("Conditionally throws an error");
  }
  return "No error thrown";
}

function neverThrowingFunction(): number {
  return 42;
}

function throwingInLoopFunction(count: number): void {
  for (let i = 0; i < count; i++) {
    if (i === count - 1) {
      throw new Error("Throws on last iteration");
    }
  }
}

function alwaysThrowingFunction(): void {
  throw new Error("Always throws an error");
}

function conditionalNeverFunction(condition: boolean): string | never {
  if (condition) {
    throw new Error("Conditionally throws");
  }
  return "returns string when condition is false";
}

function infiniteLoopFunction(): never {
  while (true) {
  }
}


function neverFunction(): never {
  throw new Error("This function never returns");
}

function genericUserFunction<T>(input: T): T {
  return input;
}

class UserClass {
  instanceMethod(): number {
    return 42;
  }

  static staticMethod(): boolean {
    return true;
  }

  private privateMethod(): string {
    return "private method";
  }

  callPrivateMethod(): string {
    return this.privateMethod();
  }
}

function parameterizedUserFunction(a: number, b: string): boolean {
  return a > b.length;
}

function basicUserFunction(): string {
  return "user function";
}

function voidSyncFunction(): void {
}

function genericSyncFunction<T>(input: T): T {
  return input;
}

function parameterizedSyncFunction(a: string, b: number): boolean {
  return a.length > b;
}

function basicSyncFunction(): number {
  return 100;
}

class FieldTestClass {
  public publicField: number = 0;
  private privateField: string = "";
  static staticField: boolean = false;
}

class GenericClass<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

interface TestInterfacef {
  name: string;
  age: number;
}

function interfaceReturningFunction(): TestInterfacef {
  return { name: "test", age: 20 };
}

function arrayReturningFunction(): number[] {
  return [1, 2, 3];
}

function classInstanceReturningFunction(): TestClass {
  return new TestClass("test");
}

function booleanReturningFunction(): boolean {
  return true;
}

function genericIdentityFunction<T>(item: T): T {
  return item;
};

function FuncTestClass(user: TestClass): void {
};

function numberReturningFunction(): number {
  return 42;
};

function stringReturningFunction(): string {
  return "test";
};

function FuncAdd(a: number, b: number): number {
  return a + b;
};

function FuncMult(id: number, name: string, active: boolean): void {
};

function FuncX(value: string): string {
  return value;
};

function voidReturningFunction(name: string): void {
};

class AnotherTestClass {
  public publicField: number = 1; // 与 FieldTestClass 同名字段但值不同
  private privateField: number = 2; // 与 FieldTestClass 同名字段但类型不同
}

class ParentEntity {
  parentField: number = 0;
  protected parentProtectedField: string = "parent";
}

class ChildEntity extends ParentEntity {
  childField: boolean = false;
  public childPublicField: string = "child";
  static childStaticField: number = 100;
}

class SingleFieldClass {
  onlyField: short = 5;
}


class TestObject {
  id: number;
  static undefinedProp: undefined

  constructor(id: number) {
    this.id = id;
  }
}

class TestClass {
  uninitializedProp = null;
  undefinedField = undefined;
  name: string;
  public value: number = 0;

  constructor(name?: string) {
    this.name = name ?? "test";
  }

  defaultSyncMethod(): number {
    return this.privateSyncHelper();
  }

  private privateSyncHelper(): number {
    return 42;
  }

  static staticSyncMethod(): boolean {
    return true;
  }

  neverMethod(): never {
    throw new Error("Class method never returns");
  }

  stringMethod(): string {
    return "class method";
  }

  static staticNeverMethod(): never {
    throw new Error("Static method never returns");
  }
}

class ParentClass {
}

class ChildClass extends ParentClass {
}

interface TestInterface {}

class InterfaceImpl implements TestInterface {
}

interface Person {
  name: string;
  age: number;
}

function anonymousFunction() {
};
type NestedUnion = number | string ;

export default function type_05Test() {
  describe("type_05Test", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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

    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETPARAMETERSNUM_0500
     * @tc.name    testFunctionTypeGetParametersNum_0005
     * @tc.desc    Check parameter count for function with rest parameters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetParametersNum_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetParametersNum_0005";
      try {
        const functionType: FunctionType = Type.of(variableParamsFunction) as FunctionType;
        const result: number = functionType.getParametersNum();
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETPARAMETERSNUM_0600
     * @tc.name    testFunctionTypeGetParametersNum_0006
     * @tc.desc    Check parameter count for function with default parameters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetParametersNum_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetParametersNum_0006";
      try {
        const functionType: FunctionType = Type.of(defaultParamFunction) as FunctionType;
        const result: number = functionType.getParametersNum();
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETPARAMETERSNUM_0700
     * @tc.name    testFunctionTypeGetParametersNum_0007
     * @tc.desc    Check parameter count for arrow function with no parameters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetParametersNum_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetParametersNum_0007";
      try {
        const noParamArrow = () => {
        };

        const lambdaType: LambdaType = Type.of(noParamArrow) as LambdaType;
        const result: number = lambdaType.getParametersNum();
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETPARAMETERSNUM_0800
     * @tc.name    testFunctionTypeGetParametersNum_0008
     * @tc.desc    Check parameter count for arrow function with one parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetParametersNum_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetParametersNum_0008";
      try {
        const oneParamArrow = (name: string) => {
        };
        const lambdaType: LambdaType = Type.of(oneParamArrow) as LambdaType;
        const result: number = lambdaType.getParametersNum();
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETPARAMETERSNUM_0900
     * @tc.name    testFunctionTypeGetParametersNum_0009
     * @tc.desc    Check parameter count for arrow function with multiple parameters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetParametersNum_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetParametersNum_0009";
      try {
        const multiParamArrow = (a: number, b: boolean, c: string) => {
        };
        const lambdaType: LambdaType = Type.of(multiParamArrow) as LambdaType;
        const result: number = lambdaType.getParametersNum();
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETPARAMETERSNUM_1000
     * @tc.name    testFunctionTypeGetParametersNum_0010
     * @tc.desc    Check parameter count for class method with no parameters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetParametersNum_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetParametersNum_0010";
      try {
        const instance = new ParameterTestClass();
        const functionType: FunctionType = Type.of(instance.zeroParamMethod) as FunctionType;
        const result: number = functionType.getParametersNum();
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETPARAMETERSNUM_1100
     * @tc.name    testFunctionTypeGetParametersNum_0011
     * @tc.desc    Check parameter count for class method with one parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetParametersNum_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetParametersNum_0011";
      try {
        const instance = new ParameterTestClass();
        const functionType: FunctionType = Type.of(instance.oneParamMethod) as FunctionType;
        const result: number = functionType.getParametersNum();
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETPARAMETERSNUM_1200
     * @tc.name    testFunctionTypeGetParametersNum_0012
     * @tc.desc    Check parameter count for class method with two parameters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetParametersNum_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetParametersNum_0012";
      try {
        const instance = new ParameterTestClass();
        const functionType: FunctionType = Type.of(instance.twoParamsMethod) as FunctionType;
        const result: number = functionType.getParametersNum();
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETPARAMETERSNUM_1300
     * @tc.name    testFunctionTypeGetParametersNum_0013
     * @tc.desc    Check parameter count for static class method with three parameters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetParametersNum_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetParametersNum_0013";
      try {
        const functionType: FunctionType = Type.of(ParameterTestClass.staticThreeParamsMethod) as FunctionType;
        const result: number = functionType.getParametersNum();
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETPARAMETERSNUM_1400
     * @tc.name    testFunctionTypeGetParametersNum_0014
     * @tc.desc    Check parameter count for generic function with two parameters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetParametersNum_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetParametersNum_0014";
      try {
        const functionType: FunctionType = Type.of(genericFunction) as FunctionType;
        const result: number = functionType.getParametersNum();
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_0100
     * @tc.name    testFunctionTypeEquals_0001
     * @tc.desc    Check if function equals to itself returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0001";
      try {
        const functionType1: FunctionType = Type.of(identicalFunction) as FunctionType;
        const functionType2: FunctionType = Type.of(identicalFunction) as FunctionType;
        const result: boolean = functionType1.equals(functionType2);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_0200
     * @tc.name    testFunctionTypeEquals_0002
     * @tc.desc    Check if different functions with same signature return false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0002";
      try {
        const functionType1: FunctionType = Type.of(functionA) as FunctionType;
        const functionType2: FunctionType = Type.of(functionB) as FunctionType;
        const result: boolean = functionType1.equals(functionType2);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_0300
     * @tc.name    testFunctionTypeEquals_0003
     * @tc.desc    Check if functions with same parameters and implementation return false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0003";
      try {
        const functionType1: FunctionType = Type.of(add) as FunctionType;
        const functionType2: FunctionType = Type.of(sum) as FunctionType;
        const result: boolean = functionType1.equals(functionType2);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_0400
     * @tc.name    testFunctionTypeEquals_0004
     * @tc.desc    Check if functions with same parameters but different implementation return false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0004";
      try {

        const functionType1: FunctionType = Type.of(add) as FunctionType;
        const functionType2: FunctionType = Type.of(multiply) as FunctionType;
        const result: boolean = functionType1.equals(functionType2);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_0500
     * @tc.name    testFunctionTypeEquals_0005
     * @tc.desc    Check if arrow function equals to itself returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0005";
      try {
        const arrowSame = () => {
        };

        const lambdaType1: LambdaType = Type.of(arrowSame) as LambdaType;
        const lambdaType2: LambdaType = Type.of(arrowSame) as LambdaType;
        const result: boolean = lambdaType1.equals(lambdaType2);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_0600
     * @tc.name    testFunctionTypeEquals_0006
     * @tc.desc    Check if different arrow functions return false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0006";
      try {
        const arrowOne = () => {
        };
        const arrowTwo = () => {
        };
        const lambdaType1: LambdaType = Type.of(arrowOne) as LambdaType;
        const lambdaType2: LambdaType = Type.of(arrowTwo) as LambdaType;
        const result: boolean = lambdaType1.equals(lambdaType2);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_0700
     * @tc.name    testFunctionTypeEquals_0007
     * @tc.desc    Check if arrow function equals to regular function with same implementation returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0007";
      try {
        const arrowAdd = (a: number, b: number): number => {
          return a + b;
        };

        const functionType: FunctionType = Type.of(add) as FunctionType;
        const lambdaType: LambdaType = Type.of(arrowAdd) as LambdaType;
        const result: boolean = functionType.equals(lambdaType);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_0800
     * @tc.name    testFunctionTypeEquals_0008
     * @tc.desc    Check if same class method from different instances returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0008";
      try {

        const instance1 = new FunctionEqualityClass();
        const instance2 = new FunctionEqualityClass();
        const functionType1: FunctionType = Type.of(instance1.methodX) as FunctionType;
        const functionType2: FunctionType = Type.of(instance2.methodX) as FunctionType;
        const result: boolean = functionType1.equals(functionType2);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_0900
     * @tc.name    testFunctionTypeEquals_0009
     * @tc.desc    Check if different class methods from same instance returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0009";
      try {

        const instance1 = new FunctionEqualityClass();

        const functionType1: FunctionType = Type.of(instance1.methodX) as FunctionType;
        const functionType2: FunctionType = Type.of(instance1.methodY) as FunctionType;
        const result: boolean = functionType1.equals(functionType2);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_1000
     * @tc.name    testFunctionTypeEquals_0010
     * @tc.desc    Check if class method equals to function with same implementation returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0010";
      try {

        const instance1 = new FunctionEqualityClass();

        const functionType1: FunctionType = Type.of(add) as FunctionType;
        const functionType2: FunctionType = Type.of(instance1.calculate) as FunctionType;
        const result: boolean = functionType1.equals(functionType2);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_1100
     * @tc.name    testFunctionTypeEquals_0011
     * @tc.desc    Check if function equals to non-function type returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0011";
      try {
        const functionType: FunctionType = Type.of(functionA) as FunctionType;
        const numberType: Type = Type.of(123) as Type;
        const result: boolean = functionType.equals(numberType);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_EQUALS_1200
     * @tc.name    testFunctionTypeEquals_0012
     * @tc.desc    Check if comparing function type with null returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeEquals_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeEquals_0012";
      try {
        const functionType: FunctionType = Type.of(functionA) as FunctionType;
        const result: boolean = functionType.equals(Type.of(null));
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETNAME_0100
     * @tc.name    testFunctionTypeGetName_0001
     * @tc.desc    Check name of explicitly named function
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetName_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetName_0001";
      try {
        const functionType: FunctionType = Type.of(namedFunction) as FunctionType;
        const result: string = functionType.getName();
        expect(result).assertEqual("");
        expect(functionType.getLiteral()).assertEqual("(): void");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETNAME_0200
     * @tc.name    testFunctionTypeGetName_0002
     * @tc.desc    Check name of anonymous function assigned to variable
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetName_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetName_0002";
      try {

        const functionType: FunctionType = Type.of(anonymousFunction) as FunctionType;
        const result: string = functionType.getName();
        expect(result).assertEqual("");
        expect(functionType.getLiteral()).assertEqual("(): void");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETNAME_0300
     * @tc.name    testFunctionTypeGetName_0003
     * @tc.desc    Check name of arrow function
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetName_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetName_0003";
      try {
        const arrowFunction = () => {
        };
        const lambdaType: LambdaType = Type.of(arrowFunction) as LambdaType;
        const result: string = lambdaType.getName();
        expect(result).assertEqual("");
        expect(lambdaType.getLiteral()).assertEqual("(): void");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETNAME_0400
     * @tc.name    testFunctionTypeGetName_0004
     * @tc.desc    Check name of function with parameters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetName_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetName_0004";
      try {
        const functionType: FunctionType = Type.of(functionWithParameters) as FunctionType;
        const result: string = functionType.getName();
        expect(result).assertEqual("");
        expect(functionType.getLiteral()).assertEqual("(1: double, 2: string): void");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETNAME_0500
     * @tc.name    testFunctionTypeGetName_0005
     * @tc.desc    Check name of class instance method
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetName_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetName_0005";
      try {
        const instance = new NameTestClass();
        const functionType: FunctionType = Type.of(instance.instanceMethod) as FunctionType;
        const result: string = functionType.getName();
        expect(result).assertEqual("");
        expect(functionType.getLiteral()).assertEqual("(): void");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETNAME_0600
     * @tc.name    testFunctionTypeGetName_0006
     * @tc.desc    Check name of class static method
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetName_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetName_0006";
      try {
        const functionType: FunctionType = Type.of(NameTestClass.staticMethod) as FunctionType;
        const result: string = functionType.getName();
        expect(result).assertEqual("");
        expect(functionType.getLiteral()).assertEqual("(): void");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_GETNAME_0700
     * @tc.name    testFunctionTypeGetName_0007
     * @tc.desc    Check name of class private method caller
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeGetName_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeGetName_0007";
      try {
        const instance = new NameTestClass();
        const functionType: FunctionType = Type.of(instance.callPrivateMethod) as FunctionType;
        const result: string = functionType.getName();
        expect(result).assertEqual("");
        expect(functionType.getLiteral()).assertEqual("(): void");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_HASNAME_0100
     * @tc.name    testFunctionTypeHasName_0001
     * @tc.desc    Check if explicitly named function has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeHasName_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeHasName_0001";
      try {
        const functionType: FunctionType = Type.of(namedFunction) as FunctionType;
        const result: boolean = functionType.hasName();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_HASNAME_0200
     * @tc.name    testFunctionTypeHasName_0002
     * @tc.desc    Check if anonymous function expression has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeHasName_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeHasName_0002";
      try {
        const functionType: FunctionType = Type.of(anonymousFunctionExpr) as FunctionType;
        const result: boolean = functionType.hasName();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_HASNAME_0300
     * @tc.name    testFunctionTypeHasName_0003
     * @tc.desc    Check if arrow function has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeHasName_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeHasName_0003";
      try {
        const arrowFunction = () => {
        };
        const lambdaType: LambdaType = Type.of(arrowFunction) as LambdaType;
        const result: boolean = lambdaType.hasName();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_HASNAME_0400
     * @tc.name    testFunctionTypeHasName_0004
     * @tc.desc    Check if function with parameters has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeHasName_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeHasName_0004";
      try {
        const functionType: FunctionType = Type.of(functionWithParameters) as FunctionType;
        const result: boolean = functionType.hasName();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_HASNAME_0500
     * @tc.name    testFunctionTypeHasName_0005
     * @tc.desc    Check if class instance method has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeHasName_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeHasName_0005";
      try {
        const instance = new HasNameTestClass();
        const functionType: FunctionType = Type.of(instance.instanceMethod) as FunctionType;
        const result: boolean = functionType.hasName();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_HASNAME_0600
     * @tc.name    testFunctionTypeHasName_0006
     * @tc.desc    Check if class static method has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeHasName_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeHasName_0006";
      try {
        const functionType: FunctionType = Type.of(HasNameTestClass.staticMethod) as FunctionType;
        const result: boolean = functionType.hasName();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_HASNAME_0700
     * @tc.name    testFunctionTypeHasName_0007
     * @tc.desc    Check if class private method has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeHasName_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeHasName_0007";
      try {
        const instance = new HasNameTestClass();
        const functionType: FunctionType = Type.of(instance.callPrivateMethod) as FunctionType;
        const result: boolean = functionType.hasName();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISPRIMITIVE_0100
     * @tc.name    testFunctionTypeIsPrimitive_0001
     * @tc.desc    Check if basic function is considered primitive type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsPrimitive_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsPrimitive_0001";
      try {
        const functionType: FunctionType = Type.of(basicFunction) as FunctionType;
        const result: boolean = functionType.isPrimitive();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISPRIMITIVE_0200
     * @tc.name    testFunctionTypeIsPrimitive_0002
     * @tc.desc    Check if arrow function is considered primitive type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsPrimitive_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsPrimitive_0002";
      try {

        const arrowFunction = () => {
        };
        const lambdaType: LambdaType = Type.of(arrowFunction) as LambdaType;
        const result: boolean = lambdaType.isPrimitive();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISPRIMITIVE_0300
     * @tc.name    testFunctionTypeIsPrimitive_0003
     * @tc.desc    Check if function with parameters is considered primitive type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsPrimitive_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsPrimitive_0003";
      try {
        const functionType: FunctionType = Type.of(functionWithParams) as FunctionType;
        const result: boolean = functionType.isPrimitive();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISPRIMITIVE_0400
     * @tc.name    testFunctionTypeIsPrimitive_0004
     * @tc.desc    Check if class instance method is considered primitive type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsPrimitive_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsPrimitive_0004";
      try {
        const instance = new IsPrimitiveTestClass();
        const functionType: FunctionType = Type.of(instance.instanceMethod) as FunctionType;
        const result: boolean = functionType.isPrimitive();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISPRIMITIVE_0500
     * @tc.name    testFunctionTypeIsPrimitive_0005
     * @tc.desc    Check if class static method is considered primitive type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsPrimitive_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsPrimitive_0005";
      try {
        const functionType: FunctionType = Type.of(IsPrimitiveTestClass.staticMethod) as FunctionType;
        const result: boolean = functionType.isPrimitive();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISPRIMITIVE_0600
     * @tc.name    testFunctionTypeIsPrimitive_0006
     * @tc.desc    Verify that number primitive type returns true for comparison
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsPrimitive_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsPrimitive_0006";
      try {
        const numberType = Type.of(42);
        const result: boolean = numberType.isPrimitive();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISPRIMITIVE_0700
     * @tc.name    testFunctionTypeIsPrimitive_0007
     * @tc.desc    Verify that string primitive type returns true for comparison
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsPrimitive_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsPrimitive_0007";
      try {
        const stringType = Type.of("test");
        const result: boolean = stringType.isPrimitive();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISPRIMITIVE_0800
     * @tc.name    testFunctionTypeIsPrimitive_0008
     * @tc.desc    Verify that boolean primitive type returns true for comparison
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsPrimitive_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsPrimitive_0008";
      try {
        const booleanType = Type.of(true);
        const result: boolean = booleanType.isPrimitive();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISREFERENCE_0100
     * @tc.name    testFunctionTypeIsReference_0001
     * @tc.desc    Check if basic function is considered reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsReference_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsReference_0001";
      try {
        const functionType: FunctionType = Type.of(basicFunction) as FunctionType;
        const result: boolean = functionType.isReference();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISREFERENCE_0200
     * @tc.name    testFunctionTypeIsReference_0002
     * @tc.desc    Check if arrow function is considered reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsReference_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsReference_0002";
      try {
        const arrowFunction = () => {
        };
        const lambdaType: LambdaType = Type.of(arrowFunction) as LambdaType;
        const result: boolean = lambdaType.isReference();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISREFERENCE_0300
     * @tc.name    testFunctionTypeIsReference_0003
     * @tc.desc    Check if function with parameters is considered reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsReference_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsReference_0003";
      try {
        const functionType: FunctionType = Type.of(functionWithParams) as FunctionType;
        const result: boolean = functionType.isReference();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISREFERENCE_0400
     * @tc.name    testFunctionTypeIsReference_0004
     * @tc.desc    Check if class instance method is considered reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsReference_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsReference_0004";
      try {
        const instance = new IsReferenceTestClass();
        const functionType: FunctionType = Type.of(instance.instanceMethod) as FunctionType;
        const result: boolean = functionType.isReference();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISREFERENCE_0500
     * @tc.name    testFunctionTypeIsReference_0005
     * @tc.desc    Check if class static method is considered reference type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsReference_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsReference_0005";
      try {
        const functionType: FunctionType = Type.of(IsReferenceTestClass.staticMethod) as FunctionType;
        const result: boolean = functionType.isReference();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISREFERENCE_0600
     * @tc.name    testFunctionTypeIsReference_0006
     * @tc.desc    Verify that number primitive returns false for isReference()
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsReference_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsReference_0006";
      try {
        const numberType = Type.of(3.14159);
        const result: boolean = numberType.isReference();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISREFERENCE_0700
     * @tc.name    testFunctionTypeIsReference_0007
     * @tc.desc    Verify that string primitive returns false for isReference()
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsReference_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsReference_0007";
      try {
        const stringType = Type.of("primitive string");
        const result: boolean = stringType.isReference();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISREFERENCE_0800
     * @tc.name    testFunctionTypeIsReference_0008
     * @tc.desc    Verify that boolean primitive returns false for isReference()
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsReference_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsReference_0008";
      try {
        const booleanType = Type.of(false);
        const result: boolean = booleanType.isReference();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISREFERENCE_0900
     * @tc.name    testFunctionTypeIsReference_0009
     * @tc.desc    Verify that array object returns true for isReference()
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsReference_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsReference_0009";
      try {
        const arrayType = Type.of([true, false, true]);
        const result: boolean = arrayType.isReference();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FUNCTIONTYPE_ISREFERENCE_1400
     * @tc.name    testFunctionTypeIsReference_0014
     * @tc.desc    Verify that class instance returns true for isReference()
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFunctionTypeIsReference_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testFunctionTypeIsReference_0014";
      try {
        const instance = new IsReferenceTestClass();
        const objectType = Type.of(instance);
        const result: boolean = objectType.isReference();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_EQUALS_0100
     * @tc.name    testEquals_0001
     * @tc.desc    Check if UndefinedType equals to itself
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testEquals_0001";
      try {
        const undefinedValue = undefined;
        const type: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const result: boolean = type.equals(type);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_EQUALS_0200
     * @tc.name    testEquals_0002
     * @tc.desc    Check if UndefinedType equals to another UndefinedType instance
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testEquals_0002";
      try {
        const undefinedValue = undefined;
        const anotherUndefined = undefined;
        const type1: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const type2: UndefinedType = Type.of(anotherUndefined) as UndefinedType;
        const result: boolean = type1.equals(type2);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_EQUALS_0300
     * @tc.name    testEquals_0003
     * @tc.desc    Check if UndefinedType equals to Null type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testEquals_0003";
      try {
        const undefinedValue = undefined;
        const nullValue = null;
        const undefinedType: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const nullType = Type.of(nullValue);
        const result: boolean = undefinedType.equals(nullType);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_EQUALS_0400
     * @tc.name    testEquals_0004
     * @tc.desc    Check if UndefinedType equals to Number type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testEquals_0004";
      try {
        const undefinedValue = undefined;
        const numberValue = 42;
        const undefinedType: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const numberType = Type.of(numberValue);
        const result: boolean = undefinedType.equals(numberType);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_EQUALS_0500
     * @tc.name    testEquals_0005
     * @tc.desc    Check if UndefinedType equals to String type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testEquals_0005";
      try {
        const undefinedValue = undefined;
        const stringValue = "test";
        const undefinedType: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const stringType = Type.of(stringValue);
        const result: boolean = undefinedType.equals(stringType);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_EQUALS_0600
     * @tc.name    testEquals_0006
     * @tc.desc    Check if UndefinedType equals to Boolean type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testEquals_0006";
      try {
        const undefinedValue = undefined;
        const booleanValue = true;
        const undefinedType: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const booleanType = Type.of(booleanValue);
        const result: boolean = undefinedType.equals(booleanType);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_EQUALS_0700
     * @tc.name    testEquals_0007
     * @tc.desc    Check if UndefinedType equals to Function type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testEquals_0007";
      try {
        const undefinedValue = undefined;
        const functionValue = () => {
        };
        const undefinedType: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const functionType = Type.of(functionValue);
        const result: boolean = undefinedType.equals(functionType);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_EQUALS_0800
     * @tc.name    testEquals_0008
     * @tc.desc    Check if UndefinedType equals to Array type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testEquals_0008";
      try {
        const undefinedValue = undefined;
        const arrayValue = [1, 2, 3];
        const undefinedType: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const arrayType = Type.of(arrayValue);
        const result: boolean = undefinedType.equals(arrayType);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_EQUALS_0900
     * @tc.name    testEquals_0009
     * @tc.desc    Check if UndefinedType equals to Object type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testEquals_0009";
      try {
        const undefinedValue = undefined;
        const tupleValue = ['s', 1];
        const undefinedType: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const tupleType = Type.of(tupleValue);
        const result: boolean = undefinedType.equals(tupleType);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_EQUALS_1000
     * @tc.name    testUndefinedTypeEquals_0010
     * @tc.desc    Check if UndefinedType equals to Class instance type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testUndefinedTypeEquals_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testUndefinedTypeEquals_0010";
      try {
        const undefinedValue = undefined;
        const classInstance = new TestClass();
        const undefinedType: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const classType = Type.of(classInstance);
        const result: boolean = undefinedType.equals(classType);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_GETLITERAL_0100
     * @tc.name    testUndefinedTypeGetLiteral_0001
     * @tc.desc    Check literal value of UndefinedType from direct undefined value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testUndefinedTypeGetLiteral_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testUndefinedTypeGetLiteral_0001";
      try {
        const undefinedValue = undefined;
        const type: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const result: string = type.getLiteral();
        expect(result).assertEqual("undefined");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_GETLITERAL_0200
     * @tc.name    testUndefinedTypeGetLiteral_0002
     * @tc.desc    Check literal value of UndefinedType from variable-assigned undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testUndefinedTypeGetLiteral_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testUndefinedTypeGetLiteral_0002";
      try {
        let undefinedVar = null;
        const type: UndefinedType = Type.of(undefinedVar) as UndefinedType;
        const result: string = type.getLiteral();
        expect(result).assertEqual("undefined");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_GETLITERAL_0300
     * @tc.name    testUndefinedTypeGetLiteral_0003
     * @tc.desc    Check literal consistency across different UndefinedType instances
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testUndefinedTypeGetLiteral_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testUndefinedTypeGetLiteral_0003";
      try {
        const undefined1 = undefined;
        const undefined2 = undefined;
        const type1: UndefinedType = Type.of(undefined1) as UndefinedType;
        const type2: UndefinedType = Type.of(undefined2) as UndefinedType;
        const result1: string = type1.getLiteral();
        const result2: string = type2.getLiteral();
        expect(result1).assertEqual(result2);
        expect(result1).assertEqual("undefined");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_GETLITERAL_0400
     * @tc.name    testUndefinedTypeGetLiteral_0004
     * @tc.desc    Check literal value of UndefinedType from function return
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testUndefinedTypeGetLiteral_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testUndefinedTypeGetLiteral_0004";
      try {

        const returnValue = returnUndefined();
        const type: UndefinedType = Type.of(returnValue) as UndefinedType;
        const result: string = type.getLiteral();
        expect(result).assertEqual("undefined");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_GETLITERAL_0500
     * @tc.name    testUndefinedTypeGetLiteral_0005
     * @tc.desc    Check literal value of UndefinedType from uninitialized property
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testUndefinedTypeGetLiteral_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testUndefinedTypeGetLiteral_0005";
      try {

        const instance = new TestClass();
        const type: UndefinedType = Type.of(instance.uninitializedProp) as UndefinedType;
        const result: string = type.getLiteral();
        expect(result).assertEqual("undefined");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_UNDEFINEDTYPE_HASNAME_0100
     * @tc.name    testUndefinedTypeHasName_0001
     * @tc.desc    Check if direct undefined value type has a name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testUndefinedTypeHasName_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testUndefinedTypeHasName_0001";
      try {
        const undefinedValue = undefined;
        const type: UndefinedType = Type.of(undefinedValue) as UndefinedType;
        const result: boolean = type.hasName();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

  });
}
