'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils, { sleep } from '../Utils.test';
import util from '@ohos.util';
import defaultExportedAsync, {
  exportedAsyncArrow,
  ExportedAsyncClass,
  exportedAsyncFunc,
  exportedAsyncWithGetterSetter,
  ExportedMultipleAccessorClass
} from './asyncExportModule';
import { AsyncNamespace } from './asyncNamespaceModule';
import {
  ConstrainedGenericAsyncClass,
  genericAsyncArrow,
  GenericAsyncClass,
  genericAsyncFunc,
  HasLength,
  multiGenericAsync
} from './asyncGenericModule';
import {
  jsAsyncArrow,
  JSAsyncClass,
  jsAsyncFunction,
  jsAsyncWithGetterSetter,
  JSMultipleAccessorClass
} from './asyncFunctionJS';
import {
  bindAsyncFunc,
  computedPropertyAsync,
  forInObject,
  symbolKeyAsync,
  tsAsyncArrow,
  TSAsyncClass,
  tsAsyncFunction,
  tsAsyncWithGetterSetter,
  TSMultipleAccessorClass,
  TSNestedFuncClass,
  TSPrototypeClass,
  wrapperFunc
} from './asyncFunctionTS';
import { AbstractAsyncImpl, AsyncMethodInterfaceImpl, InterfaceAsyncImpl } from './asyncInterfaceAbstractModule';
import { ReexportedAsyncClass, reexportedAsyncFunc } from './asyncReexportModule';
import {
  DecoratedAsyncClass,
  MultiDecoratorClass,
  ParamDecoratedClass
} from './decoratorFunc';
import {
  DeclaredAbstractAsyncImpl,
  declaredAsyncArrow,
  DeclaredAsyncClass,
  declaredAsyncFunc,
  DeclaredAsyncInterfaceImpl
} from './asyncDeclareModule';
import {
  jsBindAsyncFunc,
  jsDynamicProperty,
  jsForInObject,
  JSNestedFuncClass,
  JSPrivateFieldClass,
  jsWrapperFunc
} from './isAsyncFunctionAdvanced';

async function basicAsyncFunc(): Promise<void> {
  return;
}

async function testAsyncFunc(): Promise<void> {
  return;
}

async function testAsyncFuncWithReturn(): Promise<number> {
  return 42;
}

const basicAsyncArrow = async (): Promise<void> => {
  return;
};
const testAsyncArrow = async (): Promise<void> => {
  return;
};
const testAsyncArrowWithReturn = async (): Promise<number> => 42;

function testWrapper(fn: () => Promise<void>): boolean {
  const type = new util.types();
  return type.isAsyncFunction(fn);
}

function testGetAsyncFunc(): () => Promise<number> {
  return async (): Promise<number> => 42;
}

function testNormalFunc(): void {
}

const testArrowFunc = (): void => {
};

function testNormalWrapper(fn: () => void): boolean {
  const type = new util.types();
  return type.isAsyncFunction(fn);
}

interface ObjectWithAsyncMethod {
  asyncMethod: () => Promise<string>;
}

interface ObjectWithGetterAndAsync {
  id: number;
  asyncMethod: () => Promise<number>;
}

interface ObjectWithSetterAndAsync {
  id: number;
  asyncMethod: () => Promise<number>;
}

interface ObjectParam {
  x: number;
}

interface AsyncMethodsObject {
  method1: () => Promise<string>;
  method2: () => Promise<string>;
}

interface InlineAsyncMethodObject {
  method: () => Promise<void>;
}

let testObjValue: number = 0;
const testObjWithAsyncMethod: ObjectWithAsyncMethod = {
  asyncMethod: async (): Promise<string> => 'test'
};

class TestObjWithGetterClass implements ObjectWithGetterAndAsync {
  asyncMethod: () => Promise<number> = async (): Promise<number> => 10;
  get id(): number {
    return testObjValue;
  }
  set id(val: number) {
    testObjValue = val;
  }
}

class TestObjWithSetterClass implements ObjectWithSetterAndAsync {
  asyncMethod: () => Promise<number> = async (): Promise<number> => 20;
  get id(): number {
    return testObjValue;
  }
  set id(val: number) {
    testObjValue = val;
  }
}

const testObjWithGetter: ObjectWithGetterAndAsync = new TestObjWithGetterClass();
const testObjWithSetter: ObjectWithSetterAndAsync = new TestObjWithSetterClass();

function testOuterFunc(): () => Promise<number> {
  const innerAsync = async (): Promise<number> => {
    return 42;
  };
  return innerAsync;
}

function testCreateAsyncClosure(x: number): () => Promise<number> {
  return async (): Promise<number> => x * 2;
}

const testAsyncWithObjectParam = async (obj: ObjectParam): Promise<number> => obj.x;
const testAsyncWithArrayParam = async (arr: number[]): Promise<number> => arr.length;

class BasicTestClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async asyncMethod(): Promise<number> {
    return this._value * 2;
  }
}

class GetterSetterTestClass {
  private _id: number = 0;

  get id(): number {
    return this._id;
  }

  set id(val: number) {
    this._id = val;
  }

  async method1(): Promise<void> {
    return;
  }
}

class MultipleAccessorTestClass {
  private _x: number = 0;
  private _y: number = 0;

  get x(): number {
    return this._x;
  }

  set x(val: number) {
    this._x = val;
  }

  async method1(): Promise<number> {
    return this._x;
  }

  get y(): number {
    return this._y;
  }

  set y(val: number) {
    this._y = val;
  }

  async method2(): Promise<number> {
    return this._y;
  }
}

class NormalClass {
  syncMethod(): void {
  }
}

class SetterTestClass {
  private _value: number = 0;

  set value(val: number) {
    this._value = val;
  }

  async asyncMethod(): Promise<number> {
    return this._value * 3;
  }
}

class BeforeGetterTestClass {
  async asyncMethod(): Promise<number> {
    return 42;
  }

  private _value: number = 0;

  get value(): number {
    return this._value;
  }
}

class BetweenGetterSetterTestClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  async asyncMethod(): Promise<number> {
    return this._value * 4;
  }

  set value(val: number) {
    this._value = val;
  }
}

class MultipleAsyncMethodsTestClass {
  private _value: number = 0;

  get id(): number {
    return this._value;
  }

  set id(val: number) {
    this._value = val;
  }

  async method1(): Promise<number> {
    return 1;
  }

  async method2(): Promise<number> {
    return 2;
  }
}

class StaticAsyncMethodTestClass {
  static async staticAsyncMethod(): Promise<number> {
    return 100;
  }
}

class StaticGetterSetterTestClass {
  private static _count: number = 0;

  static get count(): number {
    return StaticGetterSetterTestClass._count;
  }

  static set count(val: number) {
    StaticGetterSetterTestClass._count = val;
  }

  static async staticAsyncMethod(): Promise<number> {
    return StaticGetterSetterTestClass._count * 2;
  }
}

class InheritedParentClass {
  async parentMethod(): Promise<string> {
    return 'parent';
  }
}

class InheritedChildClass extends InheritedParentClass {
}

class OverriddenParentClass {
  async asyncMethod(): Promise<string> {
    return 'parent';
  }
}

class OverriddenChildClass extends OverriddenParentClass {
  async asyncMethod(): Promise<string> {
    return 'child';
  }
}

class EmptyTestClass {
}

class TestGetterClassLocal {
  private _value: number = 10;
  get value(): number {
    return this._value;
  }
}

class TestSetterClassLocal {
  private _value: number = 10;
  get value(): number {
    return this._value;
  }
  set value(val: number) {
    this._value = val;
  }
}

class MultipleGetterSetterTestClass {
  private _x: number = 0;
  private _y: number = 0;
  private _z: number = 0;

  get x(): number {
    return this._x;
  }

  set x(val: number) {
    this._x = val;
  }

  async method1(): Promise<number> {
    return this._x;
  }

  get y(): number {
    return this._y;
  }

  set y(val: number) {
    this._y = val;
  }

  async method2(): Promise<number> {
    return this._y;
  }

  get z(): number {
    return this._z;
  }

  set z(val: number) {
    this._z = val;
  }

  async method3(): Promise<number> {
    return this._z;
  }
}

class MethodCallTestClass {
  async asyncMethod(): Promise<number> {
    return 42;
  }
}

class ComplexTestClass {
  private _value: number = 0;
  private _name: string = '';

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  get name(): string {
    return this._name;
  }

  set name(val: string) {
    this._name = val;
  }

  async init(): Promise<void> {
    this._value = 10;
    this._name = 'test';
  }

  async compute(): Promise<number> {
    return this._value * 2;
  }

  async fetch(): Promise<string> {
    return this._name.toUpperCase();
  }
}

class MixedTestClass {
  private _count: number = 0;

  get count(): number {
    return this._count;
  }

  syncMethod(): number {
    return this._count;
  }

  async asyncMethod(): Promise<number> {
    return this._count * 2;
  }

  set count(val: number) {
    this._count = val;
  }

  async anotherAsyncMethod(): Promise<string> {
    return 'test';
  }
}

async function iifeAsyncFunc(): Promise<number> {
  return 100;
}

async function sendableAsyncFunc(): Promise<number> {
  return new Promise<number>((resolve) => {
    resolve(42);
  });
}

function sendableNoAsyncFunc(): Promise<number> {
  return new Promise<number>((resolve) => {
    resolve(42);
  });
}

function taskPoolAsyncFunc(x: number): Promise<number> {
  return new Promise<number>((resolve) => {
    resolve(x * 2);
  });
}

async function asyncArrowForTaskPool(x: number): Promise<number> {
  return new Promise<number>((resolve) => {
    resolve(x * 2);
  });
}

export default function IsAsyncFunctionTest(): void {
  describe('IsAsyncFunctionTest', (): void => {
    afterEach((): void => { });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0100
     * @tc.name testIsAsyncFunctionBasicAsyncFunction
     * @tc.desc Test isAsyncFunction with basic async function declaration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionBasicAsyncFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(basicAsyncFunc);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0110
     * @tc.name testIsAsyncFunctionAsyncArrowFunction
     * @tc.desc Test isAsyncFunction with async arrow function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionAsyncArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(basicAsyncArrow);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0120
     * @tc.name testIsAsyncFunctionClassMethodAfterGetterSetter
     * @tc.desc Test isAsyncFunction with class async method after getter/setter - Core Problem
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionClassMethodAfterGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new GetterSetterTestClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.method1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0130
     * @tc.name testIsAsyncFunctionClassMethodAfterGetter
     * @tc.desc Test isAsyncFunction with class async method after getter only
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionClassMethodAfterGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new BasicTestClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.asyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0140
     * @tc.name testIsAsyncFunctionMultipleAccessorClass
     * @tc.desc Test isAsyncFunction with multiple getter/setter and async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionMultipleAccessorClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new MultipleAccessorTestClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.method1)).assertTrue();
      expect(type.isAsyncFunction(instance.method2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0150
     * @tc.name testIsAsyncFunctionClassMethodAfterSetter
     * @tc.desc Test isAsyncFunction with class async method after setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionClassMethodAfterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new SetterTestClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.asyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0160
     * @tc.name testIsAsyncFunctionNormalFunction
     * @tc.desc Test isAsyncFunction with normal sync function should return false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionNormalFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new NormalClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.syncMethod);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0170
     * @tc.name testIsAsyncFunctionNull
     * @tc.desc Test isAsyncFunction with null should return false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      let result = false;
      let castFailed = false;
      try {
        result = type.isAsyncFunction(null as Object);
      } catch (error) {
        castFailed = true;
        const err: Error = error as Error;
        expect(err instanceof Error).assertTrue();
      }
      if (!castFailed) {
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0180
     * @tc.name testIsAsyncFunctionUndefined
     * @tc.desc Test isAsyncFunction with undefined should return false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      let result = false;
      let castFailed = false;
      try {
        result = type.isAsyncFunction(undefined as Object);
      } catch (error) {
        castFailed = true;
        const err: Error = error as Error;
        expect(err instanceof Error).assertTrue();
      }
      if (!castFailed) {
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0190
     * @tc.name testIsAsyncFunctionNumber
     * @tc.desc Test isAsyncFunction with number should return false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(123);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0200
     * @tc.name testIsAsyncFunctionString
     * @tc.desc Test isAsyncFunction with string should return false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction('test');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0210
     * @tc.name testIsAsyncFunctionClassMethodBeforeGetter
     * @tc.desc Test isAsyncFunction with class async method before getter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionClassMethodBeforeGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new BeforeGetterTestClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.asyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0220
     * @tc.name testIsAsyncFunctionClassMethodBetweenGetterSetter
     * @tc.desc Test isAsyncFunction with class async method between getter and setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionClassMethodBetweenGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new BetweenGetterSetterTestClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.asyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0230
     * @tc.name testIsAsyncFunctionMultipleAsyncMethods
     * @tc.desc Test isAsyncFunction with multiple async methods in class
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionMultipleAsyncMethods', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new MultipleAsyncMethodsTestClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.method1)).assertTrue();
      expect(type.isAsyncFunction(instance.method2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0240
     * @tc.name testIsAsyncFunctionObjectLiteralMethod
     * @tc.desc Test isAsyncFunction with object literal async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionObjectLiteralMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(testObjWithAsyncMethod.asyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0250
     * @tc.name testIsAsyncFunctionObjectLiteralMethodAfterGetter
     * @tc.desc Test isAsyncFunction with object literal async method after getter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionObjectLiteralMethodAfterGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(testObjWithGetter.asyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0260
     * @tc.name testIsAsyncFunctionObjectLiteralMethodAfterSetter
     * @tc.desc Test isAsyncFunction with object literal async method after setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionObjectLiteralMethodAfterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(testObjWithSetter.asyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0270
     * @tc.name testIsAsyncFunctionStaticAsyncMethod
     * @tc.desc Test isAsyncFunction with static async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionStaticAsyncMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(StaticAsyncMethodTestClass.staticAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0280
     * @tc.name testIsAsyncFunctionStaticAsyncMethodAfterGetterSetter
     * @tc.desc Test isAsyncFunction with static async method after static getter/setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionStaticAsyncMethodAfterGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const type = new util.types();
        const result: boolean = type.isAsyncFunction(StaticGetterSetterTestClass.staticAsyncMethod);
        expect(result).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0290
     * @tc.name testIsAsyncFunctionInheritedAsyncMethod
     * @tc.desc Test isAsyncFunction with inherited async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionInheritedAsyncMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new InheritedChildClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.parentMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0300
     * @tc.name testIsAsyncFunctionOverriddenAsyncMethod
     * @tc.desc Test isAsyncFunction with overridden async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionOverriddenAsyncMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new OverriddenChildClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.asyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0310
     * @tc.name testIsAsyncFunctionArrowFunctionExpression
     * @tc.desc Test isAsyncFunction with async arrow function expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionArrowFunctionExpression', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const asyncExpr = async (x: number): Promise<number> => x * 2;
      const result: boolean = type.isAsyncFunction(asyncExpr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0320
     * @tc.name testIsAsyncFunctionAssignedAsyncFunction
     * @tc.desc Test isAsyncFunction with assigned async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionAssignedAsyncFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      let assignedFunc: () => Promise<void>;
      assignedFunc = async (): Promise<void> => {
        return;
      };
      const result: boolean = type.isAsyncFunction(assignedFunc);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0330
     * @tc.name testIsAsyncFunctionPassedAsArgument
     * @tc.desc Test isAsyncFunction with async function passed as argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionPassedAsArgument', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result: boolean = testWrapper(testAsyncArrow);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0340
     * @tc.name testIsAsyncFunctionReturnedFromFunction
     * @tc.desc Test isAsyncFunction with async function returned from function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionReturnedFromFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const asyncFn = testGetAsyncFunc();
      const result: boolean = type.isAsyncFunction(asyncFn);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0350
     * @tc.name testIsAsyncFunctionNormalFunction2
     * @tc.desc Test isAsyncFunction with normal function (should return false)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionNormalFunction2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(testNormalFunc);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0360
     * @tc.name testIsAsyncFunctionArrowFunction2
     * @tc.desc Test isAsyncFunction with normal arrow function (should return false)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionArrowFunction2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(testArrowFunc);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0370
     * @tc.name testIsAsyncFunctionObject
     * @tc.desc Test isAsyncFunction with object (should return false)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const obj: InlineAsyncMethodObject = {
        method: async (): Promise<void> => {
          return;
        }
      };
      const result: boolean = type.isAsyncFunction(obj);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0380
     * @tc.name testIsAsyncFunctionArray
     * @tc.desc Test isAsyncFunction with array (should return false)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const asyncArr: Array<() => Promise<void>> = [
        async (): Promise<void> => {
          return;
        }
      ];
      const result: boolean = type.isAsyncFunction(asyncArr);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0390
     * @tc.name testIsAsyncFunctionBoolean
     * @tc.desc Test isAsyncFunction with boolean (should return false)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0400
     * @tc.name testIsAsyncFunctionPromise
     * @tc.desc Test isAsyncFunction with Promise object (should return false)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const promise = Promise.resolve(42);
      const result: boolean = type.isAsyncFunction(promise);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0410
     * @tc.name testIsAsyncFunctionClassConstructor
     * @tc.desc Test isAsyncFunction with class constructor (should return false)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionClassConstructor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(new EmptyTestClass() as Object);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0420
     * @tc.name testIsAsyncFunctionGetter
     * @tc.desc Test isAsyncFunction with getter - limited stdlib, simplified test
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new TestGetterClassLocal();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0430
     * @tc.name testIsAsyncFunctionSetter
     * @tc.desc Test isAsyncFunction with setter - limited stdlib, simplified test
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new TestSetterClassLocal();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0440
     * @tc.name testIsAsyncFunctionNestedScope
     * @tc.desc Test isAsyncFunction with async function in nested scope
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionNestedScope', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const asyncFn = testOuterFunc();
      const result: boolean = type.isAsyncFunction(asyncFn);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0450
     * @tc.name testIsAsyncFunctionClosure
     * @tc.desc Test isAsyncFunction with async function closure
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionClosure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const asyncFn = testCreateAsyncClosure(10);
      const result: boolean = type.isAsyncFunction(asyncFn);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0460
     * @tc.name testIsAsyncFunctionIIFE
     * @tc.desc Test isAsyncFunction with async IIFE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionIIFE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const asyncIIFE: Promise<number> = iifeAsyncFunc();
      const result: boolean = type.isAsyncFunction(asyncIIFE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0470
     * @tc.name testIsAsyncFunctionMultipleGetterSetter
     * @tc.desc Test isAsyncFunction with multiple getters/setters and async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionMultipleGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new MultipleGetterSetterTestClass();
      const type = new util.types();

      expect(type.isAsyncFunction(instance.method1)).assertTrue();
      expect(type.isAsyncFunction(instance.method2)).assertTrue();
      expect(type.isAsyncFunction(instance.method3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0480
     * @tc.name testIsAsyncFunctionMethodCall
     * @tc.desc Test isAsyncFunction with method call (not function reference)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionMethodCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const instance = new MethodCallTestClass();
      const result: boolean = type.isAsyncFunction(instance.asyncMethod());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0490
     * @tc.name testIsAsyncFunctionDifferentParameterCounts
     * @tc.desc Test isAsyncFunction with async functions having different parameter counts
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionDifferentParameterCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();

      const asyncNoParam = async (): Promise<void> => {
        return;
      };
      const asyncOneParam = async (x: number): Promise<number> => x;
      const asyncTwoParams = async (x: number, y: number): Promise<number> => x + y;
      const asyncRestParams = async (...args: number[]): Promise<number> => args.reduce((a: number, b: number): number => a + b, 0);

      expect(type.isAsyncFunction(asyncNoParam)).assertTrue();
      expect(type.isAsyncFunction(asyncOneParam)).assertTrue();
      expect(type.isAsyncFunction(asyncTwoParams)).assertTrue();
      expect(type.isAsyncFunction(asyncRestParams)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0500
     * @tc.name testIsAsyncFunctionDefaultParameters
     * @tc.desc Test isAsyncFunction with async function having default parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionDefaultParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const asyncDefaultParams = async (x: number = 10): Promise<number> => x * 2;
      const result: boolean = type.isAsyncFunction(asyncDefaultParams);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0510
     * @tc.name testIsAsyncFunctionComplexClass
     * @tc.desc Test isAsyncFunction with complex class containing getters, setters and async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionComplexClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new ComplexTestClass();
      const type = new util.types();

      expect(type.isAsyncFunction(instance.init)).assertTrue();
      expect(type.isAsyncFunction(instance.compute)).assertTrue();
      expect(type.isAsyncFunction(instance.fetch)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0520
     * @tc.name testIsAsyncFunctionMixedMethods
     * @tc.desc Test isAsyncFunction with class containing both sync and async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionMixedMethods', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new MixedTestClass();
      const type = new util.types();

      expect(type.isAsyncFunction(instance.syncMethod)).assertFalse();
      expect(type.isAsyncFunction(instance.asyncMethod)).assertTrue();
      expect(type.isAsyncFunction(instance.anotherAsyncMethod)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0530
     * @tc.name testIsAsyncFunctionInArray
     * @tc.desc Test isAsyncFunction with async function stored in array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionInArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const asyncFuncArray: Array<() => Promise<number>> = [
        async (): Promise<number> => 1,
        async (): Promise<number> => 2,
        async (): Promise<number> => 3
      ];

      for (const func of asyncFuncArray) {
        const result: boolean = type.isAsyncFunction(func);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0540
     * @tc.name testIsAsyncFunctionInMap
     * @tc.desc Test isAsyncFunction with async function stored in Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionInMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const funcMap = new Map<string, () => Promise<number>>();
      funcMap.set('first', async (): Promise<number> => 1);
      funcMap.set('second', async (): Promise<number> => 2);

      funcMap.forEach((func: () => Promise<number>): void => {
        const result: boolean = type.isAsyncFunction(func);
        expect(result).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0550
     * @tc.name testIsAsyncFunctionInObject
     * @tc.desc Test isAsyncFunction with async function as object property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionInObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const obj: AsyncMethodsObject = {
        method1: async (): Promise<string> => 'first',
        method2: async (): Promise<string> => 'second'
      };
      expect(type.isAsyncFunction(obj.method1)).assertTrue();
      expect(type.isAsyncFunction(obj.method2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0560
     * @tc.name testIsAsyncFunctionWithParameters
     * @tc.desc Test isAsyncFunction with async function having various parameter types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionWithParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      expect(type.isAsyncFunction(testAsyncWithObjectParam)).assertTrue();
      expect(type.isAsyncFunction(testAsyncWithArrayParam)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0570
     * @tc.name testIsAsyncFunctionExportedAsyncFunc
     * @tc.desc Test isAsyncFunction with exported async function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionExportedAsyncFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(exportedAsyncFunc);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0580
     * @tc.name testIsAsyncFunctionExportedAsyncArrow
     * @tc.desc Test isAsyncFunction with exported async arrow function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionExportedAsyncArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(exportedAsyncArrow);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0590
     * @tc.name testIsAsyncFunctionExportedAsyncWithGetterSetter
     * @tc.desc Test isAsyncFunction with exported async function named with getter/setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionExportedAsyncWithGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(exportedAsyncWithGetterSetter);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0600
     * @tc.name testIsAsyncFunctionExportedAsyncClassMethod
     * @tc.desc Test isAsyncFunction with exported class async method after getter/setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionExportedAsyncClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new ExportedAsyncClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.exportedClassAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0610
     * @tc.name testIsAsyncFunctionExportedMultipleAccessorClass
     * @tc.desc Test isAsyncFunction with exported class having multiple accessor and async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionExportedMultipleAccessorClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new ExportedMultipleAccessorClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.method1)).assertTrue();
      expect(type.isAsyncFunction(instance.method2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0620
     * @tc.name testIsAsyncFunctionDefaultExportedAsync
     * @tc.desc Test isAsyncFunction with default exported async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionDefaultExportedAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(defaultExportedAsync);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0630
     * @tc.name testIsAsyncFunctionNamespaceAsyncFunc
     * @tc.desc Test isAsyncFunction with namespace async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionNamespaceAsyncFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(AsyncNamespace.namespaceAsyncFunc);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0640
     * @tc.name testIsAsyncFunctionNamespaceAsyncArrow
     * @tc.desc Test isAsyncFunction with namespace async arrow function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionNamespaceAsyncArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(AsyncNamespace.namespaceAsyncArrow);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0650
     * @tc.name testIsAsyncFunctionNamespaceClassMethod
     * @tc.desc Test isAsyncFunction with namespace class async method after getter/setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionNamespaceClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new AsyncNamespace.NamespaceAsyncClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.namespaceAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0660
     * @tc.name testIsAsyncFunctionInnerNamespaceAsyncFunc
     * @tc.desc Test isAsyncFunction with inner namespace async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionInnerNamespaceAsyncFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(AsyncNamespace.InnerNamespace.innerNamespaceAsyncFunc);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0670
     * @tc.name testIsAsyncFunctionInnerNamespaceClassMethod
     * @tc.desc Test isAsyncFunction with inner namespace class async method after getter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionInnerNamespaceClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new AsyncNamespace.InnerNamespace.InnerNamespaceClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.innerNamespaceAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0680
     * @tc.name testIsAsyncFunctionGenericAsyncFunc
     * @tc.desc Test isAsyncFunction with generic async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionGenericAsyncFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(genericAsyncFunc<number>);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0690
     * @tc.name testIsAsyncFunctionGenericAsyncArrow
     * @tc.desc Test isAsyncFunction with generic async arrow function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionGenericAsyncArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(genericAsyncArrow<number>);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0700
     * @tc.name testIsAsyncFunctionGenericAsyncClassMethod
     * @tc.desc Test isAsyncFunction with generic class async method after getter/setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionGenericAsyncClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new GenericAsyncClass<number>(42);
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.genericAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0710
     * @tc.name testIsAsyncFunctionGenericAsyncClassMethodString
     * @tc.desc Test isAsyncFunction with generic class async method with string type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionGenericAsyncClassMethodString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new GenericAsyncClass<string>('test');
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.genericAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0720
     * @tc.name testIsAsyncFunctionMultiGenericAsync
     * @tc.desc Test isAsyncFunction with multi-parameter generic async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionMultiGenericAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(multiGenericAsync<number, string>);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0730
     * @tc.name testIsAsyncFunctionConstrainedGenericMethod
     * @tc.desc Test isAsyncFunction with constrained generic async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionConstrainedGenericMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new ConstrainedGenericAsyncClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.constrainedGenericMethod<HasLength>);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0740
     * @tc.name testIsAsyncFunctionJSAsyncFunction
     * @tc.desc Test isAsyncFunction with JS async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionJSAsyncFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(jsAsyncFunction);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0750
     * @tc.name testIsAsyncFunctionJSAsyncArrow
     * @tc.desc Test isAsyncFunction with JS async arrow function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionJSAsyncArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(jsAsyncArrow);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0760
     * @tc.name testIsAsyncFunctionJSAsyncWithGetterSetter
     * @tc.desc Test isAsyncFunction with JS async function with getter/setter context
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionJSAsyncWithGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(jsAsyncWithGetterSetter);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0770
     * @tc.name testIsAsyncFunctionJSAsyncClassMethod
     * @tc.desc Test isAsyncFunction with JS class async method after getter/setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionJSAsyncClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new JSAsyncClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.jsAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0790
     * @tc.name testIsAsyncFunctionJSMultipleAccessorClass
     * @tc.desc Test isAsyncFunction with JS class having multiple accessor and async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionJSMultipleAccessorClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new JSMultipleAccessorClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.method1)).assertTrue();
      expect(type.isAsyncFunction(instance.method2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0800
     * @tc.name testIsAsyncFunctionTSAsyncArrow
     * @tc.desc Test isAsyncFunction with TS async arrow function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionTSAsyncArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(tsAsyncArrow);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0810
     * @tc.name testIsAsyncFunctionTSAsyncWithGetterSetter
     * @tc.desc Test isAsyncFunction with TS async function with getter/setter context
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionTSAsyncWithGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(tsAsyncWithGetterSetter);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0820
     * @tc.name testIsAsyncFunctionTSAsyncClassMethod
     * @tc.desc Test isAsyncFunction with TS class async method after getter/setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionTSAsyncClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new TSAsyncClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.tsAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0840
     * @tc.name testIsAsyncFunctionTSMultipleAccessorClass
     * @tc.desc Test isAsyncFunction with TS class having multiple accessor and async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionTSMultipleAccessorClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new TSMultipleAccessorClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.method1)).assertTrue();
      expect(type.isAsyncFunction(instance.method2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0850
     * @tc.name testIsAsyncFunctionTSAsyncFunctionNotAsyncKeyword
     * @tc.desc Test isAsyncFunction with TS function returning Promise but not using async keyword
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionTSAsyncFunctionNotAsyncKeyword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(tsAsyncFunction);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0860
     * @tc.name testIsAsyncFunctionInterfaceAsyncImplMethod
     * @tc.desc Test isAsyncFunction with interface implementation async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionInterfaceAsyncImplMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new InterfaceAsyncImpl();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.asyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0870
     * @tc.name testIsAsyncFunctionAsyncMethodInterfaceImpl
     * @tc.desc Test isAsyncFunction with async method interface implementation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionAsyncMethodInterfaceImpl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new AsyncMethodInterfaceImpl();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.asyncMethodWithParams);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0880
     * @tc.name testIsAsyncFunctionAbstractClassConcreteMethod
     * @tc.desc Test isAsyncFunction with abstract class concrete async method after getter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionAbstractClassConcreteMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new AbstractAsyncImpl();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.concreteAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0890
     * @tc.name testIsAsyncFunctionAbstractImplAsyncMethod
     * @tc.desc Test isAsyncFunction with abstract implementation async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionAbstractImplAsyncMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new AbstractAsyncImpl();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.asyncAbstractMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0900
     * @tc.name testIsAsyncFunctionReexportedAsyncFunc
     * @tc.desc Test isAsyncFunction with re-exported async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionReexportedAsyncFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(reexportedAsyncFunc);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0910
     * @tc.name testIsAsyncFunctionReexportedAsyncClassMethod
     * @tc.desc Test isAsyncFunction with re-exported class async method after getter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionReexportedAsyncClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new ReexportedAsyncClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.reexportedAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0920
     * @tc.name testIsAsyncFunctionDecoratorFunction
     * @tc.desc Test isAsyncFunction with async method decorated by customDecorator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionDecoratorFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new DecoratedAsyncClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.decoratedAsyncMethod)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0930
     * @tc.name testIsAsyncFunctionParamDecorator
     * @tc.desc Test isAsyncFunction with async method decorated by paramDecorator factory
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionParamDecorator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new ParamDecoratedClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.paramDecoratedMethod)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0940
     * @tc.name testIsAsyncFunctionDecorator1
     * @tc.desc Test isAsyncFunction with async method decorated by decorator1 (preserve async)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionDecorator1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new DecoratedAsyncClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.methodWithDecorator1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0950
     * @tc.name testIsAsyncFunctionDecorator2
     * @tc.desc Test isAsyncFunction with async method decorated by decorator2 (preserve async)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionDecorator2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new DecoratedAsyncClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.methodWithDecorator2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0960
     * @tc.name testIsAsyncFunctionSyncMethodDecoratedToAsync
     * @tc.desc Test isAsyncFunction with sync method decorated to async by customDecorator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionSyncMethodDecoratedToAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new DecoratedAsyncClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.syncMethodDecorated)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0970
     * @tc.name testIsAsyncFunctionMultiDecoratedAsyncMethod
     * @tc.desc Test isAsyncFunction with async method decorated by multiple decorators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionMultiDecoratedAsyncMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new MultiDecoratorClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.multiDecoratedMethod)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0980
     * @tc.name testIsAsyncFunctionDecoratedMethodAfterAccessor
     * @tc.desc Test isAsyncFunction with decorated async method after accessor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionDecoratedMethodAfterAccessor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new DecoratedAsyncClass();
      const type = new util.types();
      expect(type.isAsyncFunction(instance.methodAfterAccessor)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1100
     * @tc.name testIsAsyncFunctionSendableFunction
     * @tc.desc Test isAsyncFunction with @Sendable decorated async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsAsyncFunctionSendableFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(sendableAsyncFunc);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1110
     * @tc.name testIsAsyncFunctionSendableNoAsyncFunc
     * @tc.desc Test isAsyncFunction with @Sendable decorated async arrow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsAsyncFunctionSendableNoAsyncFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(sendableNoAsyncFunc);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1060
     * @tc.name testIsAsyncFunctionTaskPoolArrow
     * @tc.desc Test isAsyncFunction with async arrow function for TaskPool
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsAsyncFunctionTaskPoolArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(asyncArrowForTaskPool);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0990
     * @tc.name testIsAsyncFunctionAllExportedArrows
     * @tc.desc Test isAsyncFunction with all exported arrow functions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionAllExportedArrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      expect(type.isAsyncFunction(exportedAsyncArrow)).assertTrue();
      expect(type.isAsyncFunction(AsyncNamespace.namespaceAsyncArrow)).assertTrue();
      expect(type.isAsyncFunction(genericAsyncArrow<number>)).assertTrue();
      expect(type.isAsyncFunction(jsAsyncArrow)).assertTrue();
      expect(type.isAsyncFunction(tsAsyncArrow)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1190
     * @tc.name testIsAsyncFunctionDeclaredAsyncFunc
     * @tc.desc Test isAsyncFunction with declared async function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionDeclaredAsyncFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(declaredAsyncFunc);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1200
     * @tc.name testIsAsyncFunctionDeclaredAsyncArrow
     * @tc.desc Test isAsyncFunction with declared async arrow function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionDeclaredAsyncArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(declaredAsyncArrow);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1210
     * @tc.name testIsAsyncFunctionDeclaredAsyncClassMethod
     * @tc.desc Test isAsyncFunction with declared class async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionDeclaredAsyncClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new DeclaredAsyncClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.declaredAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1220
     * @tc.name testIsAsyncFunctionDeclaredAsyncStaticMethod
     * @tc.desc Test isAsyncFunction with declared class static async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionDeclaredAsyncStaticMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(DeclaredAsyncClass.declaredAsyncStaticMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1230
     * @tc.name testIsAsyncFunctionDeclaredAsyncInterfaceImplMethod
     * @tc.desc Test isAsyncFunction with declared interface implementation async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionDeclaredAsyncInterfaceImplMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const instance = new DeclaredAsyncInterfaceImpl();
        const type = new util.types();
        const result: boolean = type.isAsyncFunction(instance.asyncInterfaceMethod);
        expect(result).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1240
     * @tc.name testIsAsyncFunctionDeclaredAbstractAsyncImplMethod
     * @tc.desc Test isAsyncFunction with declared abstract implementation async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionDeclaredAbstractAsyncImplMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new DeclaredAbstractAsyncImpl();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.declaredAbstractAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1250
     * @tc.name testIsAsyncFunctionDeclaredConcreteAsyncMethod
     * @tc.desc Test isAsyncFunction with declared abstract class concrete async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsAsyncFunctionDeclaredConcreteAsyncMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new DeclaredAbstractAsyncImpl();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.concreteAsyncMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1260
     * @tc.name testIsAsyncFunctionWrapperFunc
     * @tc.desc Test isAsyncFunction with TS wrapper function returning async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionWrapperFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const asyncFn = wrapperFunc();
      const result: boolean = type.isAsyncFunction(asyncFn);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1270
     * @tc.name testIsAsyncFunctionTSNestedFuncClass
     * @tc.desc Test isAsyncFunction with TS nested function class method returning async
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionTSNestedFuncClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new TSNestedFuncClass();
      const type = new util.types();
      const asyncFn = instance.createNestedAsync();
      const result: boolean = type.isAsyncFunction(asyncFn);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1280
     * @tc.name testIsAsyncFunctionComputedPropertyAsync
     * @tc.desc Test isAsyncFunction with computed property async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionComputedPropertyAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const dynamicMethod = computedPropertyAsync.dynamicMethod;
      const result: boolean = type.isAsyncFunction(dynamicMethod);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1290
     * @tc.name testIsAsyncFunctionSymbolKeyAsync
     * @tc.desc Test isAsyncFunction with symbol key async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionSymbolKeyAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      expect(type.isAsyncFunction(symbolKeyAsync)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1300
     * @tc.name testIsAsyncFunctionBindAsyncFunc
     * @tc.desc Test isAsyncFunction with bind async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionBindAsyncFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const boundAsync = bindAsyncFunc();
      const result: boolean = type.isAsyncFunction(boundAsync);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1310
     * @tc.name testIsAsyncFunctionTSPrototypeAsyncMethod
     * @tc.desc Test isAsyncFunction with TS prototype async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionTSPrototypeAsyncMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new TSPrototypeClass();
      const type = new util.types();
      expect(instance.id).assertEqual(0);
      expect(type.isAsyncFunction(new TSPrototypeClass() as Object)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1320
     * @tc.name testIsAsyncFunctionForInObject
     * @tc.desc Test isAsyncFunction with forInObject async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionForInObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      expect(type.isAsyncFunction(forInObject.method1)).assertTrue();
      expect(type.isAsyncFunction(forInObject.method2)).assertTrue();
      expect(type.isAsyncFunction(forInObject.method3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1330
     * @tc.name testIsAsyncFunctionJSWrapperFunc
     * @tc.desc Test isAsyncFunction with JS wrapper function returning async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionJSWrapperFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const asyncFn = jsWrapperFunc();
      const result: boolean = type.isAsyncFunction(asyncFn);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1340
     * @tc.name testIsAsyncFunctionJSNestedFuncClass
     * @tc.desc Test isAsyncFunction with JS nested function class method returning async
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionJSNestedFuncClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new JSNestedFuncClass();
      const type = new util.types();
      const asyncFn = instance.createNestedAsync();
      const result: boolean = type.isAsyncFunction(asyncFn);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1350
     * @tc.name testIsAsyncFunctionJSDynamicProperty
     * @tc.desc Test isAsyncFunction with JS dynamic property async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionJSDynamicProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const dynamicAsync = jsDynamicProperty.dynamicAsync;
      const result: boolean = type.isAsyncFunction(dynamicAsync);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1360
     * @tc.name testIsAsyncFunctionJSBindAsyncFunc
     * @tc.desc Test isAsyncFunction with JS bind async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionJSBindAsyncFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(jsBindAsyncFunc);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1370
     * @tc.name testIsAsyncFunctionJSForInObject
     * @tc.desc Test isAsyncFunction with JS forInObject async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionJSForInObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const type = new util.types();
      expect(type.isAsyncFunction(jsForInObject.method1)).assertTrue();
      expect(type.isAsyncFunction(jsForInObject.method2)).assertTrue();
      expect(type.isAsyncFunction(jsForInObject.method3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1380
     * @tc.name testIsAsyncFunctionJSPrivateFieldClassGetter
     * @tc.desc Test isAsyncFunction with JS private field class getter async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionJSPrivateFieldClassGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new JSPrivateFieldClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.getPrivateValue);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1390
     * @tc.name testIsAsyncFunctionJSPrivateFieldClassSetter
     * @tc.desc Test isAsyncFunction with JS private field class setter async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testIsAsyncFunctionJSPrivateFieldClassSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance = new JSPrivateFieldClass();
      const type = new util.types();
      const result: boolean = type.isAsyncFunction(instance.setPrivateValue);
      expect(result).assertTrue();
    });

    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1400
    //  * @tc.name testIsAsyncFunctionAsyncGeneratorFunc
    //  * @tc.desc Test isAsyncFunction with TS async generator function
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionAsyncGeneratorFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(asyncGeneratorFunc);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1410
    //  * @tc.name testIsAsyncFunctionAsyncGeneratorArrow
    //  * @tc.desc Test isAsyncFunction with TS async generator arrow function
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionAsyncGeneratorArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(asyncGeneratorArrow);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1420
    //  * @tc.name testIsAsyncFunctionTSGeneratorClassMethod
    //  * @tc.desc Test isAsyncFunction with TS generator class async generator method after getter
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionTSGeneratorClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const instance = new TSGeneratorClass();
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(instance.methodGenerator);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1430
    //  * @tc.name testIsAsyncFunctionJSGeneratorClassMethod
    //  * @tc.desc Test isAsyncFunction with JS generator class async generator method after getter
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionJSGeneratorClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const instance = new JSGeneratorClass();
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(instance.methodGenerator);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1440
    //  * @tc.name testIsAsyncFunctionAllGeneratorsSummary
    //  * @tc.desc Test isAsyncFunction with all async generators from modules
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionAllGeneratorsSummary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(asyncGeneratorFunc)).assertTrue();
    //   expect(type.isAsyncFunction(asyncGeneratorArrow)).assertTrue();
    //   expect(type.isAsyncFunction(jsAsyncGenerator)).assertTrue();
    //
    //   const tsGenInstance = new TSGeneratorClass();
    //   expect(type.isAsyncFunction(tsGenInstance.methodGenerator)).assertTrue();
    //
    //   const jsGenInstance = new JSGeneratorClass();
    //   expect(type.isAsyncFunction(jsGenInstance.methodGenerator)).assertTrue();
    // });
    //
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0780
    //  * @tc.name testIsAsyncFunctionJSAsyncGenerator
    //  * @tc.desc Test isAsyncFunction with JS async generator function
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionJSAsyncGenerator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(jsAsyncGenerator);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0830
    //  * @tc.name testIsAsyncFunctionTSAsyncGenerator
    //  * @tc.desc Test isAsyncFunction with TS async generator function
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionTSAsyncGenerator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(tsAsyncGenerator);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1000
    //  * @tc.name testIsAsyncFunctionSendableClassMethod
    //  * @tc.desc Test isAsyncFunction with Sendable class async method
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableTestClass {
    //     private _value: number = 0;
    //
    //     get value(): number {
    //       return this._value;
    //     }
    //
    //     set value(val: number) {
    //       this._value = val;
    //     }
    //
    //     async asyncMethod(): Promise<number> {
    //       return this._value * 2;
    //     }
    //   }
    //   const instance = new SendableTestClass();
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(instance.asyncMethod);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1010
    //  * @tc.name testIsAsyncFunctionSendableMultipleMethods
    //  * @tc.desc Test isAsyncFunction with multiple async methods in Sendable class
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableMultipleMethods', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableTestClass {
    //     private _x: number = 0;
    //     private _y: number = 0;
    //
    //     get x(): number {
    //       return this._x;
    //     }
    //
    //     set x(val: number) {
    //       this._x = val;
    //     }
    //
    //     async method1(): Promise<number> {
    //       return this._x;
    //     }
    //
    //     get y(): number {
    //       return this._y;
    //     }
    //
    //     set y(val: number) {
    //       this._y = val;
    //     }
    //
    //     async method2(): Promise<number> {
    //       return this._y;
    //     }
    //   }
    //   const instance = new SendableTestClass();
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(instance.method1)).assertTrue();
    //   expect(type.isAsyncFunction(instance.method2)).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1020
    //  * @tc.name testIsAsyncFunctionSendableStaticMethod
    //  * @tc.desc Test isAsyncFunction with static async method in Sendable class
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableStaticMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableTestClass {
    //     static async staticAsyncMethod(): Promise<number> {
    //       return 100;
    //     }
    //   }
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(SendableTestClass.staticAsyncMethod);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1030
    //  * @tc.name testIsAsyncFunctionSendableInherited
    //  * @tc.desc Test isAsyncFunction with inherited async method in Sendable class
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableInherited', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableParentClass {
    //     async parentMethod(): Promise<string> {
    //       return 'parent';
    //     }
    //   }
    //   @Sendable
    //   class SendableChildClass extends SendableParentClass {
    //     async childMethod(): Promise<string> {
    //       return 'child';
    //     }
    //   }
    //   const instance = new SendableChildClass();
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(instance.parentMethod)).assertTrue();
    //   expect(type.isAsyncFunction(instance.childMethod)).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1040
    //  * @tc.name testIsAsyncFunctionSendableOverridden
    //  * @tc.desc Test isAsyncFunction with overridden async method in Sendable class
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableOverridden', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableParentClass {
    //     async asyncMethod(): Promise<string> {
    //       return 'parent';
    //     }
    //   }
    //   @Sendable
    //   class SendableChildClass extends SendableParentClass {
    //     async asyncMethod(): Promise<string> {
    //       return 'child';
    //     }
    //   }
    //   const instance = new SendableChildClass();
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(instance.asyncMethod);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1050
    //  * @tc.name testIsAsyncFunctionTaskPoolAsync
    //  * @tc.desc Test isAsyncFunction with async function in TaskPool
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL2
    //  */
    // it('testIsAsyncFunctionTaskPoolAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(taskPoolAsyncFunc);
    //   expect(result).assertFalse();
    // });
    //
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1070
    //  * @tc.name testIsAsyncFunctionSendableComplexScenario
    //  * @tc.desc Test isAsyncFunction with complex Sendable class scenario
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL2
    //  */
    // it('testIsAsyncFunctionSendableComplexScenario', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    //   @Sendable
    //   class SendableComplexClass {
    //     private _id: number = 0;
    //     private _name: string = '';
    //     private _status: boolean = false;
    //
    //     get id(): number {
    //       return this._id;
    //     }
    //
    //     set id(val: number) {
    //       this._id = val;
    //     }
    //
    //     async initAsync(): Promise<void> {
    //       this._id = 100;
    //     }
    //
    //     get name(): string {
    //       return this._name;
    //     }
    //
    //     set name(val: string) {
    //       this._name = val;
    //     }
    //
    //     async setNameAsync(val: string): Promise<void> {
    //       this._name = val;
    //     }
    //
    //     get status(): boolean {
    //       return this._status;
    //     }
    //
    //     set status(val: boolean) {
    //       this._status = val;
    //     }
    //
    //     async computeAsync(): Promise<number> {
    //       return this._id * 2 + this._name.length;
    //     }
    //   }
    //   const instance = new SendableComplexClass();
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(instance.initAsync)).assertTrue();
    //   expect(type.isAsyncFunction(instance.setNameAsync)).assertTrue();
    //   expect(type.isAsyncFunction(instance.computeAsync)).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1080
    //  * @tc.name testIsAsyncFunctionSendableGetterSetterSequence
    //  * @tc.desc Test isAsyncFunction with Sendable class having getter/setter sequence
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableGetterSetterSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableSequenceClass {
    //     private _prop1: number = 1;
    //     private _prop2: number = 2;
    //     private _prop3: number = 3;
    //
    //     get prop1(): number {
    //       return this._prop1;
    //     }
    //
    //     set prop1(val: number) {
    //       this._prop1 = val;
    //     }
    //
    //     async method1(): Promise<number> {
    //       return this._prop1;
    //     }
    //
    //     get prop2(): number {
    //       return this._prop2;
    //     }
    //
    //     set prop2(val: number) {
    //       this._prop2 = val;
    //     }
    //
    //     async method2(): Promise<number> {
    //       return this._prop2;
    //     }
    //
    //     get prop3(): number {
    //       return this._prop3;
    //     }
    //
    //     set prop3(val: number) {
    //       this._prop3 = val;
    //     }
    //
    //     async method3(): Promise<number> {
    //       return this._prop3;
    //     }
    //   }
    //   const instance = new SendableSequenceClass();
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(instance.method1)).assertTrue();
    //   expect(type.isAsyncFunction(instance.method2)).assertTrue();
    //   expect(type.isAsyncFunction(instance.method3)).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1090
    //  * @tc.name testIsAsyncFunctionSendableMixedAccessors
    //  * @tc.desc Test isAsyncFunction with Sendable class having mixed accessors and methods
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableMixedAccessors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableMixedClass {
    //     private _value: number = 0;
    //
    //     getValue(): number {
    //       return this._value;
    //     }
    //
    //     async asyncGetValue(): Promise<number> {
    //       return this._value;
    //     }
    //
    //     get value(): number {
    //       return this._value;
    //     }
    //
    //     set value(val: number) {
    //       this._value = val;
    //     }
    //
    //     async asyncSetValue(val: number): Promise<void> {
    //       this._value = val;
    //     }
    //   }
    //   const instance = new SendableMixedClass();
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(instance.getValue)).assertFalse();
    //   expect(type.isAsyncFunction(instance.asyncGetValue)).assertTrue();
    //   expect(type.isAsyncFunction(instance.asyncSetValue)).assertTrue();
    // });
    //
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1120
    //  * @tc.name testIsAsyncFunctionSendableNestedClass
    //  * @tc.desc Test isAsyncFunction with nested Sendable class
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL2
    //  */
    // it('testIsAsyncFunctionSendableNestedClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    //   @Sendable
    //   class SendableNestedClass {
    //     private _value: number = 10;
    //
    //     get value(): number {
    //       return this._value;
    //     }
    //
    //     async nestedAsyncMethod(): Promise<number> {
    //       return this._value * 2;
    //     }
    //   }
    //   const instance = new SendableNestedClass();
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(instance.nestedAsyncMethod)).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1130
    //  * @tc.name testIsAsyncFunctionSendableConcurrentContainer
    //  * @tc.desc Test isAsyncFunction with async functions in concurrent container
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL2
    //  */
    // it('testIsAsyncFunctionSendableConcurrentContainer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    //   const type = new util.types();
    //   @Sendable
    //   class SendableTaskClass {
    //     private _result: number = 0;
    //
    //     get result(): number {
    //       return this._result;
    //     }
    //
    //     async compute(x: number): Promise<number> {
    //       return x * 2;
    //     }
    //   }
    //   const instance = new SendableTaskClass();
    //   const result: boolean = type.isAsyncFunction(instance.compute);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1140
    //  * @tc.name testIsAsyncFunctionSendableMethodWithParams
    //  * @tc.desc Test isAsyncFunction with Sendable class async method with parameters
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableMethodWithParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableParamClass {
    //     private _base: number = 5;
    //
    //     get base(): number {
    //       return this._base;
    //     }
    //
    //     async compute(x: number, y: number): Promise<number> {
    //       return x + y + this._base;
    //     }
    //
    //     async multiply(...args: number[]): Promise<number> {
    //       return args.reduce((a: number, b: number) => a * b, 1);
    //     }
    //   }
    //   const instance = new SendableParamClass();
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(instance.compute)).assertTrue();
    //   expect(type.isAsyncFunction(instance.multiply)).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1150
    //  * @tc.name testIsAsyncFunctionSendableAccessorPatterns
    //  * @tc.desc Test various accessor patterns in Sendable class
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableAccessorPatterns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableAccessorPatterns {
    //     private _readOnlyProp: number = 10;
    //     private _writeOnlyProp: number = 20;
    //     private _fullProp: number = 30;
    //
    //     get readOnlyProp(): number {
    //       return this._readOnlyProp;
    //     }
    //
    //     set writeOnlyProp(val: number) {
    //       this._writeOnlyProp = val;
    //     }
    //
    //     get fullProp(): number {
    //       return this._fullProp;
    //     }
    //
    //     set fullProp(val: number) {
    //       this._fullProp = val;
    //     }
    //
    //     async methodAfterReadOnly(): Promise<number> {
    //       return this._readOnlyProp;
    //     }
    //
    //     async methodAfterWriteOnly(): Promise<number> {
    //       return this._writeOnlyProp;
    //     }
    //
    //     async methodAfterFull(): Promise<number> {
    //       return this._fullProp;
    //     }
    //   }
    //   const instance = new SendableAccessorPatterns();
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(instance.methodAfterReadOnly)).assertTrue();
    //   expect(type.isAsyncFunction(instance.methodAfterWriteOnly)).assertTrue();
    //   expect(type.isAsyncFunction(instance.methodAfterFull)).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1160
    //  * @tc.name testIsAsyncFunctionSendablePrivateFields
    //  * @tc.desc Test isAsyncFunction with Sendable class having private fields
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL2
    //  */
    // it('testIsAsyncFunctionSendablePrivateFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    //   @Sendable
    //   class SendablePrivateFieldClass {
    //     private privateValue: number = 100;
    //
    //     get publicValue(): number {
    //       return this.privateValue;
    //     }
    //
    //     async getPrivateValue(): Promise<number> {
    //       return this.privateValue;
    //     }
    //
    //     async setPrivateValue(val: number): Promise<void> {
    //       this.privateValue = val;
    //     }
    //   }
    //   const instance = new SendablePrivateFieldClass();
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(instance.getPrivateValue)).assertTrue();
    //   expect(type.isAsyncFunction(instance.setPrivateValue)).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1170
    //  * @tc.name testIsAsyncFunctionSendableDefaultValue
    //  * @tc.desc Test isAsyncFunction with Sendable class async method with default values
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableDefaultValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableDefaultValueClass {
    //     get id(): number {
    //       return 0;
    //     }
    //
    //     async compute(x: number = 10, y: number = 20): Promise<number> {
    //       return x + y;
    //     }
    //   }
    //   const instance = new SendableDefaultValueClass();
    //   const type = new util.types();
    //   const result: boolean = type.isAsyncFunction(instance.compute);
    //   expect(result).assertTrue();
    // });
    //
    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_1180
    //  * @tc.name testIsAsyncFunctionSendableReturnTypeVariations
    //  * @tc.desc Test isAsyncFunction with various return types in Sendable class
    //  * @tc.size MEDIUMTEST
    //  * @tc.type FUNCTION
    //  * @tc.level LEVEL1
    //  */
    // it('testIsAsyncFunctionSendableReturnTypeVariations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   @Sendable
    //   class SendableReturnClass {
    //     get value(): number {
    //       return 0;
    //     }
    //
    //     async returnNumber(): Promise<number> {
    //       return 42;
    //     }
    //
    //     async returnString(): Promise<string> {
    //       return 'test';
    //     }
    //
    //     async returnBoolean(): Promise<boolean> {
    //       return true;
    //     }
    //
    //     async returnArray(): Promise<number[]> {
    //       return [1, 2, 3];
    //     }
    //
    //     async returnObject(): Promise<object> {
    //       return new Object();
    //     }
    //   }
    //   const instance = new SendableReturnClass();
    //   const type = new util.types();
    //   expect(type.isAsyncFunction(instance.returnNumber)).assertTrue();
    //   expect(type.isAsyncFunction(instance.returnString)).assertTrue();
    //   expect(type.isAsyncFunction(instance.returnBoolean)).assertTrue();
    //   expect(type.isAsyncFunction(instance.returnArray)).assertTrue();
    //   expect(type.isAsyncFunction(instance.returnObject)).assertTrue();
    // });
  });
}
