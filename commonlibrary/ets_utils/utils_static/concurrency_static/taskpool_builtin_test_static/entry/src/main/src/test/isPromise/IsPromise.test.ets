'use static';
/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import util from '@ohos.util';
import Utils, { sleep } from '../Utils.test';

const SLEEP_INTERVAL_MS: int = 100;

async function asyncFunction(): Promise<string> {
  return 'async result';
}

async function asyncFunctionReturnVoid(): Promise<void> {
  return;
}

class TestClassWithGetSet {
  private _id: number = 0;

  get id(): number {
    return this._id;
  }

  set id(value: number) {
    this._id = value;
  }

  async methodAfterGetSet(): Promise<string> {
    return 'after get/set';
  }

  async anotherMethodAfterGetSet(): Promise<number> {
    return 42;
  }
}

class TestClassGetBefore {
  async methodBeforeGet(): Promise<string> {
    return 'before get';
  }

  get value(): number {
    return 100;
  }
}

class TestClassSetBefore {
  async methodBeforeSet(): Promise<string> {
    return 'before set';
  }

  set value(val: number) {
    console.info('set value: ' + val.toString());
  }
}

class TestClassBetweenGetSet {
  get first(): number {
    return 1;
  }

  async methodBetween(): Promise<string> {
    return 'between get and set';
  }

  set second(val: number) {
    console.info('set second: ' + val.toString());
  }
}

class TestClassMixedMethods {
  async method1(): Promise<string> {
    return 'method1';
  }

  get prop1(): number {
    return 1;
  }

  async method2(): Promise<number> {
    return 2;
  }

  set prop2(val: number) {
    console.info('prop2 set: ' + val.toString());
  }

  async method3(): Promise<boolean> {
    return true;
  }

  get prop3(): string {
    return 'prop3';
  }

  normalMethod(): string {
    return 'normal';
  }

  async method4(): Promise<void> {
    return;
  }
}

class TestClassNormalMethodAfterGetSet {
  get id(): number {
    return 0;
  }

  set id(value: number) {
    console.info('set id: ' + value.toString());
  }

  methodReturnPromise(): Promise<string> {
    return Promise.resolve('normal method');
  }
}

interface AsyncMethodInterface {
  asyncMethod(): Promise<string>;
}

class TestObjectLiteral implements AsyncMethodInterface {
  async asyncMethod(): Promise<string> {
    return 'object literal';
  }
}

class TestObjectLiteralGetSet {
  get value(): number {
    return 0;
  }

  async methodAfterGet(): Promise<string> {
    return 'after get in object literal';
  }
}

class TestObjectLiteralSet {
  set value(val: number) {
    console.info('set value: ' + val.toString());
  }

  async methodAfterSet(): Promise<string> {
    return 'after set in object literal';
  }
}

class TestStaticAsyncMethod {
  static async staticAsyncMethod(): Promise<string> {
    return 'static async';
  }
}

class TestStaticAsyncWithGetSet {
  get id(): number {
    return 0;
  }

  set id(val: number) {
    console.info('set id: ' + val.toString());
  }

  static async staticAsyncAfterGetSet(): Promise<string> {
    return 'static after get/set';
  }
}

class TestBaseClass {
  async baseMethod(): Promise<string> {
    return 'base method';
  }
}

class TestDerivedClass extends TestBaseClass {
  async derivedMethod(): Promise<string> {
    return 'derived method';
  }
}

class TestOverrideClass extends TestBaseClass {
  async baseMethod(): Promise<string> {
    return 'overridden method';
  }
}

const arrowAsyncFunc: () => Promise<string> = async (): Promise<string> => {
  return 'arrow async';
};

const assignedAsyncFunc: () => Promise<number> = async (): Promise<number> => {
  return 123;
};

async function funcReturnAsyncFunc(): Promise<() => Promise<string>> {
  const returnedFn: () => Promise<string> = async (): Promise<string> => 'returned async';
  return returnedFn;
}

function normalFunction(): string {
  return 'normal';
}

const normalArrowFunc = (): string => 'normal arrow';

interface ThenableInterface {
  then(onFulfilled: (value: string) => void, onRejected: (reason: Error) => void): void;
}

class ThenableObject implements ThenableInterface {
  then(onFulfilled: (value: string) => void, onRejected: (reason: Error) => void): void {
    onFulfilled('thenable');
  }
}

class TestClassInstance {
  public value: number = 100;
}

function callAsyncFunc(func: () => Promise<string>): Promise<string> {
  return func();
}


class SendableTestClass {
  public value: number = 0;

  constructor(value: number) {
    this.value = value;
  }

  async asyncMethod(): Promise<string> {
    return 'Sendable async method';
  }

  async asyncMethodWithParam(param: number): Promise<number> {
    return this.value + param;
  }

  async asyncMethodReturnVoid(): Promise<void> {
    return;
  }
}

class SendableTestClassWithMultipleMethods {
  public id: number = 0;

  get prop(): number {
    return this.id;
  }

  set prop(val: number) {
    this.id = val;
  }

  async method1AfterGetSet(): Promise<string> {
    return 'method1 after get/set';
  }

  async method2AfterGetSet(): Promise<number> {
    return this.id * 2;
  }

  async method3AfterGetSet(): Promise<boolean> {
    return this.id > 0;
  }
}

class SendableTestClassWithGetSet {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async asyncMethodAfterGetSet(): Promise<string> {
    return 'Sendable async after get/set';
  }
}

class SendableTestBaseClass {
  async baseAsyncMethod(): Promise<string> {
    return 'base async';
  }
}

class SendableTestDerivedClass extends SendableTestBaseClass {
  async derivedAsyncMethod(): Promise<string> {
    return 'derived async';
  }

  async baseAsyncMethod(): Promise<string> {
    return 'overridden in Sendable';
  }
}

class SendableStaticAsyncClass {
  static async staticAsyncMethod(): Promise<number> {
    return 42;
  }
}

class SendableNestedClass {
  public outerValue: number = 100;

  async outerAsyncMethod(): Promise<string> {
    return 'outer async';
  }
}

class SendableDecoratorClass {
  public value: number = 0;

  async sendableAsyncMethod(): Promise<string> {
    return 'Sendable decorated async';
  }

  async anotherSendableAsyncMethod(): Promise<number> {
    return this.value * 2;
  }
}

function concurrentAsyncFunction(): Promise<string> {
  return Promise.resolve('concurrent async result');
}

function concurrentAsyncArrowReturn(x: number): Promise<number> {
  return Promise.resolve(x * 2);
}

function concurrentDecoratorAsync(): Promise<string> {
  return Promise.resolve('concurrent decorated async');
}

function concurrentDecoratorStaticAsync(): Promise<number> {
  return Promise.resolve(42 as number);
}

async function passSendable(obj: SendableTestClass): Promise<number> {
  return obj.value;
}

class CustomDecoratorTestClass {
  public logs: string[] = [];

  async customDecoratedMethod(): Promise<string> {
    this.logs.push('custom method called');
    return 'custom decorated';
  }

  async methodWithCustomDecorator(): Promise<number> {
    return 100;
  }
}

class AccessorDecoratorClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async methodAfterAccessorDecorator(): Promise<string> {
    return 'method after accessor decorator';
  }
}

class MultiDecoratorClass {
  async multiDecoratedMethod(): Promise<string> {
    return 'multi decorated method';
  }

  async anotherMultiDecoratedMethod(): Promise<number> {
    return 200;
  }
}

class NestedDecoratorClass {
  async outerDecoratedMethod(): Promise<string> {
    return 'outer decorated';
  }
}

async function localAsyncFunction(): Promise<string> {
  return 'local async';
}

const localAsyncArrow: () => Promise<number> = async (): Promise<number> => {
  return 100;
};

class LocalTestClass {
  async localAsyncMethod(): Promise<string> {
    return 'local class async';
  }
}

class InlinePromiseClass {
  async inlinePromiseMethod(): Promise<number> {
    return 42;
  }
}

async function passPromise(promise: Promise<string>): Promise<string> {
  return await promise;
}

async function returnPromise(): Promise<string> {
  return Promise.resolve('nested');
}

async function recursiveAsync(count: number): Promise<number> {
  if (count <= 0) {
    return 0;
  }
  return count + await recursiveAsync(count - 1);
}

async function asyncFactory(): Promise<string> {
  return 'factory result';
}

async function asyncCallback(): Promise<string> {
  return 'callback result';
}

function executeCallback(callback: () => Promise<string>): Promise<string> {
  return callback();
}

class ContextClass {
  public value: number = 100;

  async contextMethod(): Promise<number> {
    return this.value;
  }
}

function createPromise(value: string): Promise<string> {
  return Promise.resolve(value);
}

export async function moduleAsyncFunction(): Promise<string> {
  return 'module async function';
}

export const moduleAsyncArrow: () => Promise<number> = async (): Promise<number> => {
  return 789;
};

export class ModuleAsyncClass {
  async moduleAsyncMethod(): Promise<string> {
    return 'module class async method';
  }
}

async function defaultAsync(): Promise<string> {
  return 'default async';
}

class ExportedGetSetClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async asyncAfterGetSet(): Promise<string> {
    return 'exported async after get/set';
  }
}

namespace TestNamespace {
  export async function nsAsync(): Promise<string> {
    return 'namespace async';
  }

  export const nsArrow: () => Promise<number> = async (): Promise<number> => {
    return 100;
  };

  export class NSClass {
    async nsMethod(): Promise<string> {
      return 'namespace class method';
    }
  }
}

namespace OuterNS {
  export namespace InnerNS {
    export async function nestedAsync(): Promise<string> {
      return 'nested namespace';
    }
  }
}

async function genericAsync<T>(param: T): Promise<T> {
  return param;
}

class GenericClass<T> {
  async genericMethod(param: T): Promise<T> {
    return param;
  }
}

async function multiGeneric<T, U>(param1: T, param2: U): Promise<[T, U]> {
  return [param1, param2];
}

async function constrainedGeneric<T extends number>(param: T): Promise<T> {
  return param;
}

function genericArrowWrapper<T>(param: T): Promise<T> {
  return Promise.resolve(param) as Promise<T>;
}

interface AsyncInterface {
  asyncMethod(): Promise<string>;
}

class ImplClass implements AsyncInterface {
  async asyncMethod(): Promise<string> {
    return 'interface impl';
  }
}

interface ParamInterface {
  asyncMethod(param: number): Promise<number>;
}

class ParamImplClass implements ParamInterface {
  async asyncMethod(param: number): Promise<number> {
    return param * 2;
  }
}

async function defaultParamAsync(param: string = 'default'): Promise<string> {
  return param;
}

class OverloadClass {
  async overloadedMethodString(param: string): Promise<string> {
    return param;
  }

  async overloadedMethodNumber(param: number): Promise<number> {
    return param * 2;
  }
}

class ClassOverload {
  async methodString(param: string): Promise<string> {
    return param;
  }

  async methodNumber(param: number): Promise<number> {
    return param;
  }
}



async function reExportedAsync(): Promise<string> {
  return 're-exported async';
}

class ReExportedClass {
  async reExportedMethod(): Promise<string> {
    return 're-exported class method';
  }
}

async function asyncChainFunction(): Promise<string> {
  return 'chain start';
}

class CustomPromiseWrapper<T> {
  private _promise: Promise<T>;

  constructor(executor: (resolve: (value: T | PromiseLike<T>) => void, reject: (reason: Error) => void) => void) {
    this._promise = new Promise<T>(executor);
  }

  getPromise(): Promise<T> {
    return this._promise;
  }

  static customResolve<T>(value: T): CustomPromiseWrapper<T> {
    return new CustomPromiseWrapper<T>((resolve: (val: T | PromiseLike<T>) => void): void => {
      resolve(value);
    });
  }

  static customReject<T>(reason: Error): CustomPromiseWrapper<T> {
    return new CustomPromiseWrapper<T>((resolve: (val: T | PromiseLike<T>) => void, reject: (err: Error) => void): void => {
      reject(reason);
    });
  }

  then(onFulfilled: (value: T) => T | PromiseLike<T>): Promise<T> {
    return this._promise.then(onFulfilled) as Promise<T>;
  }

  catch(onRejected: (reason: Error) => T | PromiseLike<T>): Promise<T> {
    return this._promise.catch(onRejected) as Promise<T>;
  }

  finally(onFinally?: () => void): Promise<T> {
    return this._promise.finally(onFinally as () => T | PromiseLike<T>) as Promise<T>;
  }
}

class ExtendedPromiseWrapper<T> extends CustomPromiseWrapper<T> {
  constructor(executor: (resolve: (value: T | PromiseLike<T>) => void, reject: (reason: Error) => void) => void) {
    super(executor);
  }
}


// Top-level declarations moved from inside it() blocks (ArkTS-Sta requires
// class/interface declarations at top-level — local declarations inside it()
// cannot have access modifiers and trigger ESE0365-style errors).

interface NormalObject {
  key: string;
  value: number;
}

interface DecoratorAsyncInterface {
  asyncMethod(): Promise<string>;
}

class InterfaceImplClass implements DecoratorAsyncInterface {
  async asyncMethod(): Promise<string> {
    return 'interface implementation';
  }
}

abstract class AbstractBaseClass {
  abstract asyncMethod(): Promise<string>;
}

class ConcreteClass extends AbstractBaseClass {
  async asyncMethod(): Promise<string> {
    return 'concrete implementation';
  }
}

class DecoratorGenericClass {
  async genericMethod<T>(param: T): Promise<T> {
    return param;
  }
}


export default function isPromiseTest(): void {
  describe('IsPromiseTest', (): void => {
    beforeAll((): void => {
      console.info('beforeAll called');
    });

    beforeEach((): void => { });

    afterEach((): void => {
      console.info('afterEach called');
    });

    afterAll((): void => {
      console.info('afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0100
     * @tc.name testIsPromisePendingState
     * @tc.desc Test isPromise with PendingState - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromisePendingState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromisePendingState';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = new Promise<string>((resolve: (value: string | PromiseLike<string>) => void, reject: (reason: Error) => void) => {
        });
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0110
     * @tc.name testIsPromiseFulfilledState
     * @tc.desc Test isPromise with FulfilledState - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseFulfilledState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseFulfilledState';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = Promise.resolve('fulfilled');
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0120
     * @tc.name testIsPromiseRejectedState
     * @tc.desc Test isPromise with RejectedState - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseRejectedState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseRejectedState';
        console.info(`${caseName} test start`);

        const promise: Promise<void> = Promise.reject(new Error('rejected')).catch(() => {
        });
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0130
     * @tc.name testIsPromiseResolve
     * @tc.desc Test isPromise with Resolve - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseResolve';
        console.info(`${caseName} test start`);

        const promise: Promise<number> = Promise.resolve(42 as number);
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0140
     * @tc.name testIsPromiseReject
     * @tc.desc Test isPromise with Reject - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseReject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseReject';
        console.info(`${caseName} test start`);

        const promise: Promise<void> = Promise.reject(new Error('test reject')).catch(() => {
        });
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0150
     * @tc.name testIsPromiseAsyncFunction
     * @tc.desc Test isPromise with AsyncFunction - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAsyncFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAsyncFunction';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = asyncFunction();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0160
     * @tc.name testIsPromiseAfterGet
     * @tc.desc Test isPromise with AfterGet - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAfterGet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAfterGet';
        console.info(`${caseName} test start`);

        const instance: TestClassGetBefore = new TestClassGetBefore();
        const promise: Promise<string> = instance.methodBeforeGet();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0170
     * @tc.name testIsPromiseAfterSet
     * @tc.desc Test isPromise with AfterSet - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAfterSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAfterSet';
        console.info(`${caseName} test start`);

        const instance: TestClassSetBefore = new TestClassSetBefore();
        const promise: Promise<string> = instance.methodBeforeSet();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0180
     * @tc.name testIsPromiseAfterGetSet
     * @tc.desc Test isPromise with AfterGetSet - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAfterGetSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAfterGetSet';
        console.info(`${caseName} test start`);

        const instance: TestClassWithGetSet = new TestClassWithGetSet();
        const promise: Promise<string> = instance.methodAfterGetSet();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0190
     * @tc.name testIsPromiseBetweenGetSet
     * @tc.desc Test isPromise with BetweenGetSet - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseBetweenGetSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseBetweenGetSet';
        console.info(`${caseName} test start`);

        const instance: TestClassBetweenGetSet = new TestClassBetweenGetSet();
        const promise: Promise<string> = instance.methodBetween();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0200
     * @tc.name testIsPromiseMixedGetSet
     * @tc.desc Test isPromise with MixedGetSet - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseMixedGetSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseMixedGetSet';
        console.info(`${caseName} test start`);

        const instance: TestClassMixedMethods = new TestClassMixedMethods();
        const type: util.types = new util.types();

        const promise1: Promise<string> = instance.method1();
        const result1: boolean = type.isPromise(promise1);
        expect(result1).assertTrue();

        const promise2: Promise<number> = instance.method2();
        const result2: boolean = type.isPromise(promise2);
        expect(result2).assertTrue();

        const promise3: Promise<boolean> = instance.method3();
        const result3: boolean = type.isPromise(promise3);
        expect(result3).assertTrue();

        const promise4: Promise<void> = instance.method4();
        const result4: boolean = type.isPromise(promise4);
        expect(result4).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0210
     * @tc.name testIsPromiseNormalMethodAfterGetSet
     * @tc.desc Test isPromise with NormalMethodAfterGetSet - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNormalMethodAfterGetSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNormalMethodAfterGetSet';
        console.info(`${caseName} test start`);

        const instance: TestClassNormalMethodAfterGetSet = new TestClassNormalMethodAfterGetSet();
        const promise: Promise<string> = instance.methodReturnPromise();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0220
     * @tc.name testIsPromiseObjectLiteralAsync
     * @tc.desc Test isPromise with ObjectLiteralAsync - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseObjectLiteralAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseObjectLiteralAsync';
        console.info(`${caseName} test start`);

        const instance: TestObjectLiteral = new TestObjectLiteral();
        const promise: Promise<string> = instance.asyncMethod();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0230
     * @tc.name testIsPromiseObjectLiteralGet
     * @tc.desc Test isPromise with ObjectLiteralGet - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseObjectLiteralGet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseObjectLiteralGet';
        console.info(`${caseName} test start`);

        const instance: TestObjectLiteralGetSet = new TestObjectLiteralGetSet();
        const promise: Promise<string> = instance.methodAfterGet();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0240
     * @tc.name testIsPromiseObjectLiteralSet
     * @tc.desc Test isPromise with ObjectLiteralSet - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseObjectLiteralSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseObjectLiteralSet';
        console.info(`${caseName} test start`);

        const instance: TestObjectLiteralSet = new TestObjectLiteralSet();
        const promise: Promise<string> = instance.methodAfterSet();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0250
     * @tc.name testIsPromiseStaticAsyncMethod
     * @tc.desc Test isPromise with StaticAsyncMethod - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseStaticAsyncMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseStaticAsyncMethod';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = TestStaticAsyncMethod.staticAsyncMethod();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0260
     * @tc.name testIsPromiseStaticAsyncAfterGetSet
     * @tc.desc Test isPromise with StaticAsyncAfterGetSet - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseStaticAsyncAfterGetSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseStaticAsyncAfterGetSet';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = TestStaticAsyncWithGetSet.staticAsyncAfterGetSet();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0270
     * @tc.name testIsPromiseInheritedAsync
     * @tc.desc Test isPromise with InheritedAsync - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseInheritedAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseInheritedAsync';
        console.info(`${caseName} test start`);

        const instance: TestDerivedClass = new TestDerivedClass();
        const promise: Promise<string> = instance.baseMethod();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0280
     * @tc.name testIsPromiseOverriddenAsync
     * @tc.desc Test isPromise with OverriddenAsync - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseOverriddenAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseOverriddenAsync';
        console.info(`${caseName} test start`);

        const instance: TestOverrideClass = new TestOverrideClass();
        const promise: Promise<string> = instance.baseMethod();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0290
     * @tc.name testIsPromiseArrowFunction
     * @tc.desc Test isPromise with ArrowFunction - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseArrowFunction';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = arrowAsyncFunc();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0300
     * @tc.name testIsPromiseAssignedAsync
     * @tc.desc Test isPromise with AssignedAsync - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAssignedAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAssignedAsync';
        console.info(`${caseName} test start`);

        const promise: Promise<number> = assignedAsyncFunc();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0310
     * @tc.name testIsPromiseAsParameter
     * @tc.desc Test isPromise with AsParameter - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAsParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAsParameter';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = callAsyncFunc(asyncFunction);
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0320
     * @tc.name testIsPromiseFromFunctionReturn
     * @tc.desc Test isPromise with FromFunctionReturn - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseFromFunctionReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseFromFunctionReturn';
        console.info(`${caseName} test start`);

        const asyncFunc: () => Promise<string> = await funcReturnAsyncFunc();
        const promise: Promise<string> = asyncFunc();
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0330
     * @tc.name testIsPromiseNotFunction
     * @tc.desc Test isPromise with NotFunction - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNotFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNotFunction';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const result: boolean = type.isPromise(normalFunction);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0340
     * @tc.name testIsPromiseNotObject
     * @tc.desc Test isPromise with NotObject - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNotObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNotObject';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();

        const obj: NormalObject = { key: 'test', value: 123 };
        const result: boolean = type.isPromise(obj);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0350
     * @tc.name testIsPromiseNotArray
     * @tc.desc Test isPromise with NotArray - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNotArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNotArray';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const arr: number[] = [1, 2, 3];
        const result: boolean = type.isPromise(arr);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0360
     * @tc.name testIsPromiseNotNumber
     * @tc.desc Test isPromise with NotNumber - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNotNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNotNumber';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const num: number = 42;
        const result: boolean = type.isPromise(num);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0370
     * @tc.name testIsPromiseNotString
     * @tc.desc Test isPromise with NotString - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNotString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNotString';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const str: string = 'test string';
        const result: boolean = type.isPromise(str);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0380
     * @tc.name testIsPromiseNotBoolean
     * @tc.desc Test isPromise with NotBoolean - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNotBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNotBoolean';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const bool: boolean = true;
        const result: boolean = type.isPromise(bool);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0390
     * @tc.name testIsPromiseNotThenable
     * @tc.desc Test isPromise with NotThenable - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNotThenable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNotThenable';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const thenable: ThenableObject = new ThenableObject();
        const result: boolean = type.isPromise(thenable);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0400
     * @tc.name testIsPromiseNotClassInstance
     * @tc.desc Test isPromise with NotClassInstance - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNotClassInstance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNotClassInstance';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const instance: TestClassInstance = new TestClassInstance();
        const result: boolean = type.isPromise(instance);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0410
     * @tc.name testIsPromiseNotArrowFunction
     * @tc.desc Test isPromise with NotArrowFunction - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNotArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNotArrowFunction';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const result: boolean = type.isPromise(normalArrowFunc);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0420
     * @tc.name testIsPromiseNull
     * @tc.desc Test isPromise with Null - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseNull';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        let result = false;
        let castFailed = false;
        try {
          result = type.isPromise(null as Object);
        } catch (error) {
          castFailed = true;
          const err: Error = error as Error;
          expect(err.message.includes('cannot be cast')).assertTrue();
        }
        if (!castFailed) {
          expect(result).assertFalse();
        }

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0430
     * @tc.name testIsPromiseUndefined
     * @tc.desc Test isPromise with Undefined - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseUndefined';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        let result = false;
        let castFailed = false;
        try {
          result = type.isPromise(undefined as Object);
        } catch (error) {
          castFailed = true;
          const err: Error = error as Error;
          expect(err.message.includes('cannot be cast')).assertTrue();
        }
        if (!castFailed) {
          expect(result).assertFalse();
        }

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0440
     * @tc.name testIsPromiseGetterValue
     * @tc.desc Test isPromise with GetterValue - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseGetterValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseGetterValue';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const instance: TestClassWithGetSet = new TestClassWithGetSet();
        const value: number = instance.id;
        const result: boolean = type.isPromise(value);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0450
     * @tc.name testIsPromiseSetterValue
     * @tc.desc Test isPromise with SetterValue - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseSetterValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseSetterValue';
        console.info(`${caseName} test start`);

        const instance: TestClassWithGetSet = new TestClassWithGetSet();
        instance.id = 10;
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(instance.methodAfterGetSet());
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0460
     * @tc.name testIsPromiseConstructor
     * @tc.desc Test isPromise with Constructor - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseConstructor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseConstructor';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const result: boolean = type.isPromise(new TestClassWithGetSet() as Object);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0470
     * @tc.name testIsPromiseMap
     * @tc.desc Test isPromise with Map - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseMap';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const map: Map<string, number> = new Map<string, number>();
        map.set('key', 1);
        const result: boolean = type.isPromise(map);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0480
     * @tc.name testIsPromiseSet
     * @tc.desc Test isPromise with Set - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseSet';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const set: Set<number> = new Set<number>();
        set.add(1);
        const result: boolean = type.isPromise(set);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0490
     * @tc.name testIsPromiseDate
     * @tc.desc Test isPromise with Date - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseDate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseDate';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        const date: Date = new Date();
        const result: boolean = type.isPromise(date);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0500
     * @tc.name testIsPromiseThen
     * @tc.desc Test isPromise with Then - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseThen';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = Promise.resolve('test').then((value: string): string => value + ' then');
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0510
     * @tc.name testIsPromiseCatch
     * @tc.desc Test isPromise with Catch - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseCatch';
        console.info(`${caseName} test start`);

        const promise: Promise<void> = Promise.reject(new Error('test')).catch((): void => {
        });
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0520
     * @tc.name testIsPromiseFinally
     * @tc.desc Test isPromise with Finally - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseFinally', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseFinally';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = Promise.resolve('test').finally(() => {
        });
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0530
     * @tc.name testIsPromiseDelayedResolve
     * @tc.desc Test isPromise with DelayedResolve - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseDelayedResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseDelayedResolve';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = new Promise<string>((resolve: (value: string | PromiseLike<string>) => void) => {
          setTimeout(() => {
            resolve('delayed');
          }, 100);
        });
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0540
     * @tc.name testIsPromiseMultiLevelThen
     * @tc.desc Test isPromise with MultiLevelThen - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseMultiLevelThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseMultiLevelThen';
        console.info(`${caseName} test start`);

        const promise: Promise<string> = Promise.resolve('start')
          .then((value: string): string => value + ' level1')
          .then((value: string): string => value + ' level2')
          .then((value: string): string => value + ' level3');
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(promise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0550
     * @tc.name testIsPromiseAll
     * @tc.desc Test isPromise with All - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAll';
        console.info(`${caseName} test start`);

        const promise1: Promise<number> = Promise.resolve(1 as number);
        const promise2: Promise<number> = Promise.resolve(2 as number);
        const promise3: Promise<number> = Promise.resolve(3 as number);
        const allPromise: Promise<number[]> = Promise.all([promise1, promise2, promise3]);
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(allPromise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0560
     * @tc.name testIsPromiseRace
     * @tc.desc Test isPromise with Race - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseRace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseRace';
        console.info(`${caseName} test start`);

        const promise1: Promise<number> = Promise.resolve(1 as number);
        const promise2: Promise<number> = new Promise<number>((resolve: (value: number) => void): void => {
          setTimeout(() => resolve(2), 100);
        });
        const racePromise: Promise<number> = Promise.race([promise1, promise2]);
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(racePromise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0570
     * @tc.name testIsPromiseAllSettled
     * @tc.desc Test isPromise with AllSettled - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAllSettled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAllSettled';
        console.info(`${caseName} test start`);

        const promise1: Promise<string> = Promise.resolve('success');
        const promise2: Promise<string> = Promise.reject(new Error('failure')).catch(() => 'caught');
        const allSettledPromise: Promise<Object[]> = Promise.allSettled([promise1, promise2]) as Promise<Object[]>;
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(allSettledPromise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0580
     * @tc.name testIsPromiseAny
     * @tc.desc Test isPromise with Any - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAny', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAny';
        console.info(`${caseName} test start`);

        const promise1: Promise<string> = Promise.resolve('first success');
        const promise2: Promise<string> = Promise.reject(new Error('first failure')).catch(() => 'caught');
        const anyPromise: Promise<string> = Promise.any([promise1, promise2]);
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(anyPromise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0590
     * @tc.name testIsPromiseAllNested
     * @tc.desc Test isPromise with AllNested - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAllNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAllNested';
        console.info(`${caseName} test start`);

        const innerPromise1: Promise<number> = Promise.resolve(1 as number);
        const innerPromise2: Promise<number> = Promise.resolve(2 as number);
        const outerPromise1: Promise<number> = Promise.resolve(10 as number);
        const outerPromise2: Promise<number[]> = Promise.all([innerPromise1, innerPromise2]);
        const allPromise: Promise<[number, number[]]> = Promise.all([outerPromise1, outerPromise2]) as Promise<[number, number[]]>;
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(allPromise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0600
     * @tc.name testIsPromiseRaceNested
     * @tc.desc Test isPromise with RaceNested - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseRaceNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseRaceNested';
        console.info(`${caseName} test start`);

        const promise1: Promise<number> = Promise.resolve(1 as number);
        const promise2: Promise<number> = Promise.resolve(2 as number);
        const innerRace: Promise<number> = Promise.race([promise1, promise2]);
        const outerPromise: Promise<number> = Promise.resolve(10 as number);
        const racePromise: Promise<number> = Promise.race([innerRace, outerPromise]);
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(racePromise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0610
     * @tc.name testIsPromiseAllThenChain
     * @tc.desc Test isPromise with AllThenChain - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAllThenChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAllThenChain';
        console.info(`${caseName} test start`);

        const promise1: Promise<number> = Promise.resolve(1 as number);
        const promise2: Promise<number> = Promise.resolve(2 as number);
        const allPromise: Promise<number[]> = Promise.all([promise1, promise2]);
        const chainedPromise: Promise<number[]> = allPromise.then((values: number[]): number[] => {
          return values.map((value: number): number => value * 2);
        });
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(chainedPromise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0620
     * @tc.name testIsPromiseAllEmptyArray
     * @tc.desc Test isPromise with AllEmptyArray - verify Promise detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsPromiseAllEmptyArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testIsPromiseAllEmptyArray';
        console.info(`${caseName} test start`);

        const emptyArray: Promise<void>[] = [];
        const allPromise: Promise<void[]> = Promise.all(emptyArray);
        const type: util.types = new util.types();
        const result: boolean = type.isPromise(allPromise);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROMISE_0630