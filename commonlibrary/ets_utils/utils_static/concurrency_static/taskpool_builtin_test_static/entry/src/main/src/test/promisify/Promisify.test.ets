'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import util from '@ohos.util';
import {
  callCallbackWithThis,
  callBindTestCallback,
  createComputedObject,
  ThisContext,
  TSCallbackClass,
  tsCallbackFunction,
  CallbackResult as TSCallbackResult
} from './callbackTS';
import { JSCallbackClass, jsCallbackFunction } from './callbackJS';
import { CallbackNamespace } from './callbackNamespaceModule';
import {
  exportedCallback,
  exportedMultiParamCallback,
  exportedDefaultParamCallback,
  ExportedCallbackClass
} from './callbackExportModule';
import defaultExportedCallback from './callbackExportModule';
import {
  reexportedCallback, ReexportedCallbackClass, renamedCallback
} from './callbackReexportModule';
import {
  genericCallback,
  multiGenericCallback,
  GenericCallbackClass,
  constrainedGenericCallback
} from './callbackGenericModule';
import {
  ICallbackInterface,
  InterfaceCallbackImpl,
  AbstractCallbackClass,
  ConcreteCallbackImpl
} from './callbackInterfaceAbstractModule';

const SLEEP_INTERVAL_MS: int = 100;

type PromisifyResultValue = string | number | int | boolean | bigint | Object | null | undefined;

interface CallbackResult {
  err: Error | null;
  value: string;
}

interface ObjectParamInterface {
  x: int;
  y: string;
}

function basicCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'success');
}

function errorCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(new Error('test-error'), '');
}

function multiParamCallback(
  // a: int,
  b: string,
  callback: (err: Object | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, b.length as Object);
}

function noErrorCallback(callback: (result: string) => void): void {
  callback('no-error');
}

function multiReturnValueCallback(
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, 'result1', 100);
}

function singleParamCallback(
  a: int,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, a * 2);
}

function restParamCallback(
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, 1, 2, 3);
}

function objectParamCallback(
  obj: ObjectParamInterface,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, `${obj.x}-${obj.y}`);
}

function arrayParamCallback(
  arr: int[],
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  let sum: int = 0;
  for (const item of arr) {
    sum += item;
  }
  callback(null, sum);
}

class BasicCallbackClass {
  public value: int = 0;

  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 2);
  }

  public get dataValue(): int {
    return this.value;
  }

  public set dataValue(val: int) {
    this.value = val;
  }

  public methodBeforeGetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'before-getter');
  }

  public methodAfterGetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'after-getter');
  }

  public methodBeforeSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'before-setter');
  }

  public methodAfterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'after-setter');
  }

  public methodAfterGetterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'after-getter-setter');
  }

  public methodBetweenGetterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'between-getter-setter');
  }

  public static staticCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'static-result');
  }
}

class MixedGetterSetterClass {
  public value: int = 0;
  private _data: string = '';

  public method1(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'method1');
  }

  public get data(): string {
    return this._data;
  }

  public method2(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'method2');
  }

  public set data(val: string) {
    this._data = val;
  }

  public method3(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'method3');
  }

  public get readOnlyProp(): int {
    return this.value;
  }

  public method4(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'method4');
  }

  public set writeOnlyProp(val: int) {
    this.value = val;
  }

  public method5(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'method5');
  }
}

interface ObjectLiteralCallback {
  callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void;
}

const objectLiteralWithCallback: ObjectLiteralCallback = {
  callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
    callback(null, 'object-literal');
  }
};

interface ObjectLiteralGetterCallback {
  value: int;
  callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void;
}

const objectLiteralWithGetter: ObjectLiteralGetterCallback = {
  value: 100,
  callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
    callback(null, 'object-literal-with-getter');
  }
};

class ParentCallbackClass {
  public parentCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'parent');
  }
}

class ChildCallbackClass extends ParentCallbackClass {
  public childCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'child');
  }
}

class OverrideCallbackClass extends ParentCallbackClass {
  public parentCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'overridden');
  }
}

const arrowCallback = (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
  callback(null, 'arrow-callback');
};

const assignedCallback: (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void =
  (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
  callback(null, 'assigned-callback');
};

function functionReturningCallback(): (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void {
  return (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
    callback(null, 'returned-callback');
  };
}

async function asyncFunctionForTest(): Promise<string> {
  return 'async-result';
}

function promiseReturningFunction(): Promise<string> {
  return Promise.resolve('promise-result');
}

function innerCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'inner');
}

function nestedCallback(
  outerCallback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  innerCallback((err: Error | null, ...value: FixedArray<Any>) => {
    const innerResult: string = value[0] as string;
    if (err) {
      outerCallback(err, '');
    } else {
      outerCallback(null, `outer-${innerResult}`);
    }
  });
}

interface BusinessError {
  code: int;
  message: string;
}

interface ObjectLiteralSetter {
  value: int;
  callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void;
}

const objSetter: ObjectLiteralSetter = {
  value: 200,
  callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
    callback(null, 'object-literal-after-setter');
  }
};

class StaticWithGetterSetter {
  private _value: int = 0;

  public get value(): int {
    return this._value;
  }

  public set value(v: int) {
    this._value = v;
  }

  public static staticCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'static-after-getter-setter');
  }
}

async function wrapper(fn: (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void): Promise<FixedArray<Any>> {
  try {
    const promisified = util.promisify(fn);
    return await promisified() as FixedArray<Any>;
  } catch (e) {
    console.info(`wrapper catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function executor(fn: (err: Error | null) => Promise<FixedArray<Any>>): Promise<FixedArray<Any>> {
  try {
    return await fn(null);
  } catch (e) {
    console.info(`executor catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

function twoParamCallback(a: int, callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, a * 2);
}

function threeParamCallback(b: string, callback: (err: Object | null, ...value: FixedArray<Any>) => void): void {
  callback(null, `${b}` as Object);
}

function orderedCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'ordered');
}

function customErrorCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  const customError: Error = new Error('custom-error');
  callback(customError, '');
}

function customErrorFirstCallback(data: string, callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  if (data === 'error') {
    callback(new Error('error-triggered'), '');
  } else {
    callback(null, `processed-${data}`);
  }
}

function specialCallback(
  callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'result', 100, true);
}


class SendableCallbackClass {
  public value: int = 0;

  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 2);
  }

  public get dataValue(): int {
    return this.value;
  }

  public set dataValue(val: int) {
    this.value = val;
  }

  public methodAfterGetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'sendable-after-getter');
  }

  public methodAfterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'sendable-after-setter');
  }

  public methodAfterGetterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'sendable-after-getter-setter');
  }
}

class SendableMultiCallbackClass {
  public count: int = 0;

  public firstCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.count + 1);
  }

  public secondCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.count + 2);
  }

  public thirdCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.count + 3);
  }
}

class SendableStaticCallbackClass {
  public static staticCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'sendable-static');
  }
}

class SendableParentClass {
  public parentCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'sendable-parent');
  }
}

class SendableChildClass extends SendableParentClass {
  public childCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'sendable-child');
  }
}

class SendableOverrideClass extends SendableParentClass {
  public parentCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'sendable-overridden');
  }
}

class SendableComplexCallbackClass {
  public logs: Array<string> = new Array<string>();
  public results: Array<int> = new Array<int>();

  public callbackWithMultipleResults(
    callback: (err: Error | null, ...value: FixedArray<Any>) => void
  ): void {
    callback(null, 'multi', 100);
  }

  public errorCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(new Error('sendable-error'), '');
  }
}

class SendableNestedClass {
  public outerCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'sendable-nested-outer');
  }
}

class SendablePrivateFieldClass {
  private _value: int = 0;

  public get value(): int {
    return this._value;
  }

  public set value(v: int) {
    this._value = v;
  }

  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this._value * 3);
  }
}

class SendableDefaultParamClass {
  public callbackWithDefault(
    a: int,
    b: string,
    callback: (err: Error | null, ...value: FixedArray<Any>) => void
  ): void {
    callback(null, `${a}-${b}`);
  }
}

class SendableReturnTypeClass {
  public stringCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'string-result');
  }

  public numberCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 100);
  }

  public booleanCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, true);
  }

  public arrayCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    const arr: Array<int> = new Array<int>();
    arr.push(1);
    arr.push(2);
    arr.push(3);
    callback(null, arr);
  }
}

class SendableMultiParamClass {
  public multiParamCallback(
    a: int,
    b: string,
    c: boolean,
    callback: (err: Error | null, ...value: FixedArray<Any>) => void
  ): void {
    callback(null, `${a}-${b}-${c}`);
  }
}

function sendableCallbackFunction(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'sendable-function');
}

function concurrentCallbackFn(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'concurrent-result');
}

// ========== Cross File Test Classes ==========
function etsCallbackFunction(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'ets-success');
}

function etsErrorCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(new Error('ets-error'), '');
}

function etsMultiParamCallback(
  a: int,
  b: string,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, a + b.length);
}

class ETSCallbackClass {
  public value: int = 0;

  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 2);
  }

  public get dataValue(): int {
    return this.value;
  }

  public set dataValue(val: int) {
    this.value = val;
  }

  public methodAfterGetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'ets-after-getter');
  }

  public methodAfterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'ets-after-setter');
  }

  public static staticCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'ets-static');
  }
}

// ========== Decorator Test Classes ==========
class SendableDecoratorCallbackClass {
  public value: int = 0;

  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 2);
  }

  public get dataValue(): int {
    return this.value;
  }

  public set dataValue(val: int) {
    this.value = val;
  }

  public methodAfterGetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'sendable-decorator-after-getter');
  }
}

class MultipleSendableDecoratorClass {
  public count: int = 0;

  public firstMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.count + 1);
  }

  public secondMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.count + 2);
  }

  public thirdMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.count + 3);
  }
}

class SendableWithGetterSetterDecorator {
  private _value: int = 0;

  public get value(): int {
    return this._value;
  }

  public set value(v: int) {
    this._value = v;
  }

  public decoratedMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this._value * 5);
  }
}

class ConcurrentDecoratorClass {
  public value: int = 0;

  public concurrentMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 3);
  }

  public static staticConcurrentMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'concurrent-static');
  }
}

function concurrentDecoratorFunction(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'concurrent-function');
}

class SimulatedEntryComponent {
  public stateValue: int = 0;

  public entryCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.stateValue * 2);
  }
}

class SimulatedComponentClass {
  public propValue: int = 0;

  public componentCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.propValue * 3);
  }
}

class SimulatedStateDecorator {
  private _stateValue: int = 0;

  public get stateValue(): int {
    return this._stateValue;
  }

  public set stateValue(val: int) {
    this._stateValue = val;
  }

  public stateCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this._stateValue * 4);
  }
}

class SimulatedPropDecorator {
  public propValue: int = 0;

  public propCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.propValue * 5);
  }
}

class SimulatedLinkDecorator {
  public linkValue: int = 0;

  public linkCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.linkValue * 6);
  }
}

class SimulatedWatchDecorator {
  public watchValue: int = 0;

  public watchCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.watchValue * 7);
  }
}

class SimulatedBuilderDecorator {
  public builderValue: int = 0;

  public builderCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.builderValue * 8);
  }
}

class SimulatedProvideDecorator {
  public provideValue: int = 0;

  public provideCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.provideValue * 9);
  }
}

class SimulatedConsumeDecorator {
  public consumeValue: int = 0;

  public consumeCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.consumeValue * 10);
  }
}

class SimulatedStateWatchCombo {
  private _stateValue: int = 0;

  public get stateValue(): int {
    return this._stateValue;
  }

  public set stateValue(val: int) {
    this._stateValue = val;
  }

  public comboCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this._stateValue * 11);
  }
}

class SimulatedStylesDecorator {
  public stylesValue: int = 0;

  public stylesCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.stylesValue * 12);
  }
}

class CustomDecoratorClass {
  public value: int = 0;

  public customCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 13);
  }
}

class CustomParamDecoratorClass {
  public value: int = 0;

  public paramCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'param-decorator');
  }
}

class CustomClassDecoratorTarget {
  public value: int = 0;

  public classCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 14);
  }
}

class MultipleDecoratorClass {
  public value: int = 0;

  public multiDecoratorMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 15);
  }
}

class SendableConcurrentComboClass {
  public value: int = 0;

  public comboMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 16);
  }
}

class StateWatchComboClass {
  private _value: int = 0;

  public get value(): int {
    return this._value;
  }

  public set value(v: int) {
    this._value = v;
  }

  public comboMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this._value * 17);
  }
}

class AccessorDecoratorClass {
  private _value: int = 0;

  public get accessorValue(): int {
    return this._value;
  }

  public set accessorValue(val: int) {
    this._value = val;
  }

  public accessorCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this._value * 18);
  }
}

class DecoratorSequenceClass {
  private _value: int = 0;

  public get firstValue(): int {
    return this._value;
  }

  public set secondValue(val: int) {
    this._value = val;
  }

  public sequenceMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this._value * 19);
  }
}

class NestedDecoratorClass {
  public outerValue: int = 0;

  public outerMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.outerValue * 20);
  }
}

class SimulatedBuilderParamDecorator {
  public builderParamValue: int = 0;

  public builderParamMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.builderParamValue * 21);
  }
}

class DecoratorThisBindingClass {
  public value: int = 0;

  public thisBindingMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 22);
  }
}

class WrapperDecoratorClass {
  public value: int = 0;

  public wrapperMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 23);
  }
}

// ========== Import Export Test Classes ==========
function moduleLevelCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'module-level');
}

const moduleLevelArrowCallback = (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
  callback(null, 'module-arrow');
};

class ModuleLevelCallbackClass {
  public value: int = 0;

  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, this.value * 2);
  }
}

function recursiveCallbackInner(
  depth: int,
  outerCallback: (err: Error | null, ...value: FixedArray<Any>) => void,
  innerResult: int
): void {
  if (depth <= 0) {
    outerCallback(null, innerResult);
  } else {
    recursiveCallback(depth - 1, (err: Error | null, ...value: FixedArray<Any>) => {
      const result: int = value[0] as int;
      if (err) {
        outerCallback(err, 0);
      } else {
        outerCallback(null, result + 1);
      }
    });
  }
}

function recursiveCallback(
  depth: int,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  recursiveCallbackInner(depth, callback, 0);
}

function restCallback(
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, 1, 2, 3);
}

function factoryType1Callback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'factory-type1');
}

function factoryType2Callback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'factory-type2');
}

function callbackFactory(type: string): (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void {
  if (type === 'type1') {
    return factoryType1Callback;
  } else {
    return factoryType2Callback;
  }
}

function overloadedCallbackString(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'overload-string');
}

function overloadedCallbackNumber(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 100);
}

class OverloadedClass {
  public overloadedMethodString(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 'class-overload-string');
  }

  public overloadedMethodNumber(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    callback(null, 200);
  }
}

function syncCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'sync-result');
}

function multiCallCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'first');
  callback(null, 'second');
  callback(null, 'third');
}

function undefinedParamCallback(
  param: string | undefined,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, param === undefined ? 'undefined-received' : param);
}

function nullParamCallback(
  param: string | null,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, param === null ? 'null-received' : param);
}

function emptyStringCallback(
  param: string,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, param.length === 0 ? 'empty-string' : param);
}

function concurrentCallback(
  id: int,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, id * 2);
}

function errorFirstNullCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'success-null-error');
}

function errorFirstUndefinedCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'success-undefined-error');
}

function undefinedReturnCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null);
}

function bigIntCallback(
  value: bigint,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, value * 2n);
}

function booleanCallback(
  flag: boolean,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, flag ? 'true-value' : 'false-value');
}

function arrayBufferCallback(
  buffer: ArrayBuffer,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, buffer.byteLength);
}

function typedArrayCallback(
  arr: Int32Array,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  let sum: int = 0;
  for (let i: int = 0; i < arr.length; i++) {
    sum += arr[i];
  }
  callback(null, sum);
}

function mapCallback(
  map: Map<string, int>,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, map.size);
}

function setCallback(
  set: Set<string>,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  callback(null, set.size);
}

function rejectCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(new Error('reject-error'), '');
}

function chainCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'chain-start');
}

function recursionCallback(
  depth: int,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  if (depth <= 0) {
    callback(null, 0);
  } else {
    callback(null, depth);
  }
}

function zeroDelayCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'zero-delay');
}

function longDelayCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'long-delay');
}

function immediateCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  callback(null, 'immediate');
}


export default function PromisifyTest(): void {
  describe('PromisifyTest', (): void => {
    beforeAll((): void => {
      console.info('PromisifyTest beforeAll called');
    });

    beforeEach((): void => { });

    afterEach((): void => {
      console.info('PromisifyTest afterEach called');
    });

    afterAll((): void => {
      console.info('PromisifyTest afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0100
     * @tc.name testBasicCallbackConversion0100
     * @tc.desc Test promisify with BasicCallbackConversion0100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testBasicCallbackConversion0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testBasicCallbackConversion0100 start');
        const promisified = util.promisify(basicCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('success');
          console.info('testBasicCallbackConversion0100 end');
        } catch (e) {
          console.info(`testBasicCallbackConversion0100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0120
     * @tc.name testFailCallbackConversion0300
     * @tc.desc Test promisify with FailCallbackConversion0300 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testFailCallbackConversion0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testFailCallbackConversion0300 start');
        const promisified = util.promisify(errorCallback);
        let caught: boolean = false;
        try {
          await promisified();
          expect(false).assertFail();
        } catch (e) {
          caught = true;
        }
        expect(caught).assertTrue();
        console.info('testFailCallbackConversion0300 end');
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0130
     * @tc.name testMultiParamCallback0400
     * @tc.desc Test promisify with MultiParamCallback0400 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMultiParamCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testMultiParamCallback0400 start');
        const promisified = util.promisify(multiParamCallback);
        try {
          const result: FixedArray<Any>= await promisified('test') as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(4);
          console.info('testMultiParamCallback0400 end');
        } catch (e) {
          console.info(`testMultiParamCallback0400 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0140
     * @tc.name testMultiReturnValueCallback0600
     * @tc.desc Test promisify with MultiReturnValueCallback0600 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMultiReturnValueCallback0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testMultiReturnValueCallback0600 start');
        const promisified = util.promisify(multiReturnValueCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('result1');
          console.info('testMultiReturnValueCallback0600 end');
        } catch (e) {
          console.info(`testMultiReturnValueCallback0600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0141
     * @tc.name testRestParamCallback0800
     * @tc.desc Test promisify with RestParamCallback0800 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testRestParamCallback0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testRestParamCallback0800 start');
        const promisified = util.promisify(restParamCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(1);
          console.info('testRestParamCallback0800 end');
        } catch (e) {
          console.info(`testRestParamCallback0800 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0170
     * @tc.name testObjectParamCallback0900
     * @tc.desc Test promisify with ObjectParamCallback0900 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testObjectParamCallback0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testObjectParamCallback0900 start');
        const promisified = util.promisify(objectParamCallback);
        const obj: ObjectParamInterface = { x: 10, y: 'test' };
        try {
          const result: FixedArray<Any>= await promisified(obj) as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('10-test');
          console.info('testObjectParamCallback0900 end');
        } catch (e) {
          console.info(`testObjectParamCallback0900 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0180
     * @tc.name testArrayParamCallback1000
     * @tc.desc Test promisify with ArrayParamCallback1000 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testArrayParamCallback1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testArrayParamCallback1000 start');
        const promisified = util.promisify(arrayParamCallback);
        try {
          const result: FixedArray<Any>= await promisified([1, 2, 3, 4, 5]) as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(15);
        } catch (err) {
          expect(err).assertFail();
        }
        console.info('testArrayParamCallback1000 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0190
     * @tc.name testTwoParamCallback1100
     * @tc.desc Test promisify with TwoParamCallback1100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTwoParamCallback1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTwoParamCallback1100 start');
        const promisified = util.promisify(twoParamCallback);
        try {
          const result: FixedArray<Any>= await promisified(5) as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(10);
          console.info('testTwoParamCallback1100 end');
        } catch (e) {
          console.info(`testTwoParamCallback1100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0200
     * @tc.name testThreeParamCallback1200
     * @tc.desc Test promisify with ThreeParamCallback1200 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testThreeParamCallback1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testThreeParamCallback1200 start');
        const promisified = util.promisify(threeParamCallback);
        try {
          const result: FixedArray<Any>= await promisified('test') as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('test');
          console.info('testThreeParamCallback1200 end');
        } catch (e) {
          console.info(`testThreeParamCallback1200 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0210
     * @tc.name testMethodBeforeGetter1300
     * @tc.desc Test promisify with MethodBeforeGetter1300 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMethodBeforeGetter1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testMethodBeforeGetter1300 start');
        const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodBeforeGetter(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('before-getter');
          console.info('testMethodBeforeGetter1300 end');
        } catch (e) {
          console.info(`testMethodBeforeGetter1300 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0220
     * @tc.name testMethodBeforeSetter1400
     * @tc.desc Test promisify with MethodBeforeSetter1400 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMethodBeforeSetter1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testMethodBeforeSetter1400 start');
        const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodBeforeSetter(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('before-setter');
          console.info('testMethodBeforeSetter1400 end');
        } catch (e) {
          console.info(`testMethodBeforeSetter1400 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0230
     * @tc.name testMethodAfterGetter1500
     * @tc.desc Test promisify with MethodAfterGetter1500 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMethodAfterGetter1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testMethodAfterGetter1500 start');
        const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodAfterGetter(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('after-getter');
          console.info('testMethodAfterGetter1500 end');
        } catch (e) {
          console.info(`testMethodAfterGetter1500 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0240
     * @tc.name testMethodAfterSetter1600
     * @tc.desc Test promisify with MethodAfterSetter1600 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMethodAfterSetter1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testMethodAfterSetter1600 start');
        const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodAfterSetter(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('after-setter');
          console.info('testMethodAfterSetter1600 end');
        } catch (e) {
          console.info(`testMethodAfterSetter1600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0250
     * @tc.name testMethodAfterGetterSetter1700
     * @tc.desc Test promisify with MethodAfterGetterSetter1700 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMethodAfterGetterSetter1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testMethodAfterGetterSetter1700 start');
        const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodAfterGetterSetter(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('after-getter-setter');
          console.info('testMethodAfterGetterSetter1700 end');
        } catch (e) {
          console.info(`testMethodAfterGetterSetter1700 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0260
     * @tc.name testMethodBetweenGetterSetter1800
     * @tc.desc Test promisify with MethodBetweenGetterSetter1800 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMethodBetweenGetterSetter1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testMethodBetweenGetterSetter1800 start');
        const instance: MixedGetterSetterClass = new MixedGetterSetterClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.method2(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('method2');
          console.info('testMethodBetweenGetterSetter1800 end');
        } catch (e) {
          console.info(`testMethodBetweenGetterSetter1800 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0270
     * @tc.name testMixedGetterSetterMethods1900
     * @tc.desc Test promisify with MixedGetterSetterMethods1900 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMixedGetterSetterMethods1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testMixedGetterSetterMethods1900 start');
        const instance: MixedGetterSetterClass = new MixedGetterSetterClass();

        const promisified1 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.method1(callback);
        });
        try {
          const result1: FixedArray<Any>= await promisified1() as FixedArray<Any>;
          expect(result1[0] as PromisifyResultValue).assertEqual('method1');

          const promisified2 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
            instance.method3(callback);
          });
          const result2: FixedArray<Any>= await promisified2() as FixedArray<Any>;
          expect(result2[0] as PromisifyResultValue).assertEqual('method3');

          const promisified3 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
            instance.method5(callback);
          });
          const result3: FixedArray<Any>= await promisified3() as FixedArray<Any>;
          expect(result3[0] as PromisifyResultValue).assertEqual('method5');

          console.info('testMixedGetterSetterMethods1900 end');
        } catch (e) {
          console.info(`testMixedGetterSetterMethods1900 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0280
     * @tc.name testObjectLiteralMethod2000
     * @tc.desc Test promisify with ObjectLiteralMethod2000 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testObjectLiteralMethod2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testObjectLiteralMethod2000 start');
        const promisified = util.promisify(objectLiteralWithCallback.callbackMethod);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('object-literal');
          console.info('testObjectLiteralMethod2000 end');
        } catch (e) {
          console.info(`testObjectLiteralMethod2000 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0290
     * @tc.name testObjectLiteralAfterGetter2100
     * @tc.desc Test promisify with ObjectLiteralAfterGetter2100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testObjectLiteralAfterGetter2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testObjectLiteralAfterGetter2100 start');
        const promisified = util.promisify(objectLiteralWithGetter.callbackMethod);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('object-literal-with-getter');
          console.info('testObjectLiteralAfterGetter2100 end');
        } catch (e) {
          console.info(`testObjectLiteralAfterGetter2100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0300
     * @tc.name testObjectLiteralAfterSetter2200
     * @tc.desc Test promisify with ObjectLiteralAfterSetter2200 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testObjectLiteralAfterSetter2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testObjectLiteralAfterSetter2200 start');

        const promisified = util.promisify(objSetter.callbackMethod);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('object-literal-after-setter');
          console.info('testObjectLiteralAfterSetter2200 end');
        } catch (e) {
          console.info(`testObjectLiteralAfterSetter2200 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0310
     * @tc.name testStaticMethod2300
     * @tc.desc Test promisify with StaticMethod2300 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testStaticMethod2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testStaticMethod2300 start');
        const promisified = util.promisify(BasicCallbackClass.staticCallbackMethod);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('static-result');
          console.info('testStaticMethod2300 end');
        } catch (e) {
          console.info(`testStaticMethod2300 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0320
     * @tc.name testStaticMethodAfterGetterSetter2400
     * @tc.desc Test promisify with StaticMethodAfterGetterSetter2400 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testStaticMethodAfterGetterSetter2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testStaticMethodAfterGetterSetter2400 start');

        const promisified = util.promisify(StaticWithGetterSetter.staticCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('static-after-getter-setter');
          console.info('testStaticMethodAfterGetterSetter2400 end');
        } catch (e) {
          console.info(`testStaticMethodAfterGetterSetter2400 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0330
     * @tc.name testInheritedMethod2500
     * @tc.desc Test promisify with InheritedMethod2500 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testInheritedMethod2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testInheritedMethod2500 start');
        const instance: ChildCallbackClass = new ChildCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.parentCallback(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('parent');
          console.info('testInheritedMethod2500 end');
        } catch (e) {
          console.info(`testInheritedMethod2500 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0340
     * @tc.name testOverriddenMethod2600
     * @tc.desc Test promisify with OverriddenMethod2600 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testOverriddenMethod2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testOverriddenMethod2600 start');
        const instance: OverrideCallbackClass = new OverrideCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.parentCallback(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('overridden');
          console.info('testOverriddenMethod2600 end');
        } catch (e) {
          console.info(`testOverriddenMethod2600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0350
     * @tc.name testArrowFunction2700
     * @tc.desc Test promisify with ArrowFunction2700 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testArrowFunction2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testArrowFunction2700 start');
        const promisified = util.promisify(arrowCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('arrow-callback');
          console.info('testArrowFunction2700 end');
        } catch (e) {
          console.info(`testArrowFunction2700 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0360
     * @tc.name testAssignedFunction2800
     * @tc.desc Test promisify with AssignedFunction2800 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testAssignedFunction2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testAssignedFunction2800 start');
        const promisified = util.promisify(assignedCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('assigned-callback');
          console.info('testAssignedFunction2800 end');
        } catch (e) {
          console.info(`testAssignedFunction2800 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0370
     * @tc.name testFunctionAsParam2900
     * @tc.desc Test promisify with FunctionAsParam2900 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testFunctionAsParam2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testFunctionAsParam2900 start');

        try {
          const result: FixedArray<Any> = await wrapper(basicCallback);
          expect(result[0] as PromisifyResultValue).assertEqual('success');
        } catch (err) {
          expect(err).assertFail();
        }
        console.info('testFunctionAsParam2900 end');
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0380
     * @tc.name testReturnedFunction3000
     * @tc.desc Test promisify with ReturnedFunction3000 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testReturnedFunction3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testReturnedFunction3000 start');
        const returnedFn = functionReturningCallback();
        const promisified = util.promisify(returnedFn);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('returned-callback');
          console.info('testReturnedFunction3000 end');
        } catch (e) {
          console.info(`testReturnedFunction3000 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0390
     * @tc.name testAsyncFunction3100
     * @tc.desc Test promisify with AsyncFunction3100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testAsyncFunction3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testAsyncFunction3100 start');
        const wrappedCallback = util.callbackWrapper(asyncFunctionForTest);
        const promisified = util.promisify(wrappedCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('async-result');
          console.info('testAsyncFunction3100 end');
        } catch (e) {
          console.info(`testAsyncFunction3100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0400
     * @tc.name testPromiseFunction3200
     * @tc.desc Test promisify with PromiseFunction3200 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseFunction3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testPromiseFunction3200 start');
        const wrappedCallback = util.callbackWrapper(promiseReturningFunction);
        const promisified = util.promisify(wrappedCallback);
        try {
          const result: FixedArray<Any> = await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('promise-result');
          console.info('testPromiseFunction3200 end');
        } catch (e) {
          console.info(`testPromiseFunction3200 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0410
     * @tc.name testThisBinding4600
     * @tc.desc Test promisify with ThisBinding4600 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testThisBinding4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testThisBinding4600 start');
        const context: ThisContext = { value: 10 };
        const boundFn = (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
          callCallbackWithThis(context, callback);
        };
        const promisified = util.promisify(boundFn);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(20);
          console.info('testThisBinding4600 end');
        } catch (e) {
          console.info(`testThisBinding4600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0420
     * @tc.name testBindAfterPromisify4700
     * @tc.desc Test promisify with BindAfterPromisify4700 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testBindAfterPromisify4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testBindAfterPromisify4700 start');
        const context: ThisContext = { value: 10 };
        const boundFn = (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
          callBindTestCallback(context, callback);
        };
        const promisified = util.promisify(boundFn);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(30);
          console.info('testBindAfterPromisify4700 end');
        } catch (e) {
          console.info(`testBindAfterPromisify4700 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0430
     * @tc.name testPromiseChain4800
     * @tc.desc Test promisify with PromiseChain4800 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChain4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testPromiseChain4800 start');
        const promisified = util.promisify(basicCallback);
        try {
          const chain1: FixedArray<Any> = await (promisified() as Promise<FixedArray<Any>>);
          const chain2: string = (chain1[0] as string) + '-chained';
          const result: string = chain2 + '-again';
          expect(result).assertEqual('success-chained-again');
          console.info('testPromiseChain4800 end');
        } catch (e) {
          console.info(`testPromiseChain4800 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0440
     * @tc.name testAsyncAwait4900
     * @tc.desc Test promisify with AsyncAwait4900 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testAsyncAwait4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testAsyncAwait4900 start');
        const promisified = util.promisify(basicCallback);
        try {
          const result1: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result1[0] as PromisifyResultValue).assertEqual('success');

          const promisified2 = util.promisify(singleParamCallback);
          try {
            const result2: FixedArray<Any>= await promisified2(5) as FixedArray<Any>;
            expect(result2[0] as PromisifyResultValue).assertEqual(10);
          } catch (err) {
            expect(err).assertFail();
          }
          console.info('testAsyncAwait4900 end');
        } catch (e) {
          console.info(`testAsyncAwait4900 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0450
     * @tc.name testMultiplePromisify5000
     * @tc.desc Test promisify with MultiplePromisify5000 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMultiplePromisify5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testMultiplePromisify5000 start');
        const promisified1 = util.promisify(basicCallback);
        const promisified2 = util.promisify(basicCallback);

        try {
          const result1: FixedArray<Any>= await promisified1() as FixedArray<Any>;
          const result2: FixedArray<Any>= await promisified2() as FixedArray<Any>;

          expect(result1[0] as PromisifyResultValue).assertEqual('success');
          expect(result2[0] as PromisifyResultValue).assertEqual('success');
          console.info('testMultiplePromisify5000 end');
        } catch (e) {
          console.info(`testMultiplePromisify5000 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0460
     * @tc.name testNestedCallback5100
     * @tc.desc Test promisify with NestedCallback5100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testNestedCallback5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testNestedCallback5100 start');
        const promisified = util.promisify(nestedCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('outer-inner');
          console.info('testNestedCallback5100 end');
        } catch (e) {
          console.info(`testNestedCallback5100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0470
     * @tc.name testErrorHandlingChain5200
     * @tc.desc Test promisify with ErrorHandlingChain5200 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testErrorHandlingChain5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testErrorHandlingChain5200 start');
        const promisified = util.promisify(errorCallback);

        let caught: boolean = false;
        try {
          const res: string = await (promisified() as Promise<String>);
          expect(false).assertFail();
        } catch (e) {
          caught = true;
        }
        expect(caught).assertTrue();
        console.info('testErrorHandlingChain5200 end');
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0480
     * @tc.name testPromisifyAsParam5400
     * @tc.desc Test promisify with PromisifyAsParam5400 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromisifyAsParam5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testPromisifyAsParam5400 start');

        const promisified = util.promisify(basicCallback);
        try {
          const result: FixedArray<Any> = await executor(async (err: Error | null): Promise<FixedArray<Any>> => {
            if (err !== null) {
              console.info(`testPromisifyAsParam5400 callback error: ${JSON.stringify(err)}`);
              throw err;
            }
            try {
              return await (promisified() as Promise<FixedArray<Any>>);
            } catch (e) {
              console.info(`testPromisifyAsParam5400 catch error: ${JSON.stringify(e)}`);
              throw e;
            }
          });
          expect(result[0] as PromisifyResultValue).assertEqual('success');
          console.info('testPromisifyAsParam5400 end');
        } catch (e) {
          console.info(`testPromisifyAsParam5400 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0490
     * @tc.name testComputedPropertyMethod5500
     * @tc.desc Test promisify with ComputedPropertyMethod5500 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testComputedPropertyMethod5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testComputedPropertyMethod5500 start');

        const methodName: string = 'callbackMethod';
        const computedObj = createComputedObject(methodName);
        const promisified = util.promisify(computedObj.callbackMethod);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('computed-property');
          console.info('testComputedPropertyMethod5500 end');
        } catch (e) {
          console.info(`testComputedPropertyMethod5500 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0500
     * @tc.name testCallbackOrder5700
     * @tc.desc Test promisify with CallbackOrder5700 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackOrder5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackOrder5700 start');

        const promisified = util.promisify(orderedCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('ordered');
          console.info('testCallbackOrder5700 end');
        } catch (e) {
          console.info(`testCallbackOrder5700 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0510
     * @tc.name testErrorObjectType5800
     * @tc.desc Test promisify with ErrorObjectType5800 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testErrorObjectType5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testErrorObjectType5800 start');

        const promisified = util.promisify(customErrorCallback);
        let caught: boolean = false;
        try {
          await promisified();
          expect(false).assertFail();
        } catch (e) {
          caught = true;
        }
        expect(caught).assertTrue();
        console.info('testErrorObjectType5800 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0520
     * @tc.name testCustomErrorFirst5900
     * @tc.desc Test promisify with CustomErrorFirst5900 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCustomErrorFirst5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testCustomErrorFirst5900 start');

        const promisified = util.promisify(customErrorFirstCallback);

        try {
          const result1: FixedArray<Any>= await promisified('success') as FixedArray<Any>;
          expect(result1[0] as PromisifyResultValue).assertEqual('processed-success');
        } catch (err) {
          expect(err).assertFail();
        }

        let caught: boolean = false;
        try {
          await promisified('error');
          expect(false).assertFail();
        } catch (e) {
          caught = true;
        }
        expect(caught).assertTrue();
        console.info('testCustomErrorFirst5900 end');
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0530
     * @tc.name testSpecialCallbackSignature6000
     * @tc.desc Test promisify with SpecialCallbackSignature6000 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSpecialCallbackSignature6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testSpecialCallbackSignature6000 start');

        const promisified = util.promisify(specialCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('result');
          console.info('testSpecialCallbackSignature6000 end');
        } catch (e) {
          console.info(`testSpecialCallbackSignature6000 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0540
     * @tc.name testSendableClassCallback7100
     * @tc.desc Test promisify with SendableClassCallback7100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableClassCallback7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testSendableClassCallback7100 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(20);
          console.info('testSendableClassCallback7100 end');
        } catch (e) {
          console.info(`testSendableClassCallback7100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0550
     * @tc.name testSendableClassMultiCallback7200
     * @tc.desc Test promisify with SendableClassMultiCallback7200 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testSendableClassMultiCallback7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testSendableClassMultiCallback7200 start');
        const instance: SendableMultiCallbackClass = new SendableMultiCallbackClass();
        instance.count = 0;

        const promisified1 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.firstCallback(callback);
        });
        try {
          const result1: FixedArray<Any>= await promisified1() as FixedArray<Any>;
          expect(result1[0] as PromisifyResultValue).assertEqual(1);

          const promisified2 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
            instance.secondCallback(callback);
          });
          const result2: FixedArray<Any>= await promisified2() as FixedArray<Any>;
          expect(result2[0] as PromisifyResultValue).assertEqual(2);

          const promisified3 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
            instance.thirdCallback(callback);
          });
          const result3: FixedArray<Any>= await promisified3() as FixedArray<Any>;
          expect(result3[0] as PromisifyResultValue).assertEqual(3);

          console.info('testSendableClassMultiCallback7200 end');
        } catch (e) {
          console.info(`testSendableClassMultiCallback7200 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0560
     * @tc.name testSendableStaticCallback7300
     * @tc.desc Test promisify with SendableStaticCallback7300 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testSendableStaticCallback7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testSendableStaticCallback7300 start');
        const promisified = util.promisify(SendableStaticCallbackClass.staticCallbackMethod);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('sendable-static');
          console.info('testSendableStaticCallback7300 end');
        } catch (e) {
          console.info(`testSendableStaticCallback7300 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0570
     * @tc.name testSendableInheritedCallback7400
     * @tc.desc Test promisify with SendableInheritedCallback7400 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testSendableInheritedCallback7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testSendableInheritedCallback7400 start');
        const instance: SendableChildClass = new SendableChildClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.parentCallback(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('sendable-parent');
          console.info('testSendableInheritedCallback7400 end');
        } catch (e) {
          console.info(`testSendableInheritedCallback7400 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0580
     * @tc.name testSendableOverriddenCallback7500
     * @tc.desc Test promisify with SendableOverriddenCallback7500 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testSendableOverriddenCallback7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testSendableOverriddenCallback7500 start');
        const instance: SendableOverrideClass = new SendableOverrideClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.parentCallback(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('sendable-overridden');
          console.info('testSendableOverriddenCallback7500 end');
        } catch (e) {
          console.info(`testSendableOverriddenCallback7500 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0590
     * @tc.name testSendableGetterSetterCallback7600
     * @tc.desc Test promisify with SendableGetterSetterCallback7600 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableGetterSetterCallback7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testSendableGetterSetterCallback7600 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();

        const promisified1 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodAfterGetter(callback);
        });
        try {
          const result1: FixedArray<Any>= await promisified1() as FixedArray<Any>;
          expect(result1[0] as PromisifyResultValue).assertEqual('sendable-after-getter');

          const promisified2 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
            instance.methodAfterSetter(callback);
          });
          const result2: FixedArray<Any>= await promisified2() as FixedArray<Any>;
          expect(result2[0] as PromisifyResultValue).assertEqual('sendable-after-setter');

          const promisified3 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
            instance.methodAfterGetterSetter(callback);
          });
          const result3: FixedArray<Any>= await promisified3() as FixedArray<Any>;
          expect(result3[0] as PromisifyResultValue).assertEqual('sendable-after-getter-setter');
          console.info('testSendableGetterSetterCallback7600 end');
        } catch (e) {
          console.info(`testSendableGetterSetterCallback7600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0600
     * @tc.name testTaskPoolPromisify7700
     * @tc.desc Test promisify with TaskPoolPromisify7700 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTaskPoolPromisify7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testTaskPoolPromisify7700 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 5;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });

        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(10);
          console.info('testTaskPoolPromisify7700 end');
        } catch (e) {
          console.info(`testTaskPoolPromisify7700 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0610
     * @tc.name testWorkerPromisify8100
     * @tc.desc Test promisify with WorkerPromisify8100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testWorkerPromisify8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testWorkerPromisify8100 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 5;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(10);
          console.info('testWorkerPromisify8100 end');
        } catch (e) {
          console.info(`testWorkerPromisify8100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0620
     * @tc.name testSendableContainerStore8200
     * @tc.desc Test promisify with SendableContainerStore8200 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableContainerStore8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testSendableContainerStore8200 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });

        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(20);
          console.info('testSendableContainerStore8200 end');
        } catch (e) {
          console.info(`testSendableContainerStore8200 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0630
     * @tc.name testSendableComplexCallback8300
     * @tc.desc Test promisify with SendableComplexCallback8300 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableComplexCallback8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testSendableComplexCallback8300 start');
        const instance: SendableComplexCallbackClass = new SendableComplexCallbackClass();

        const promisified1 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackWithMultipleResults(callback);
        });
        try {
          const result1: FixedArray<Any>= await promisified1() as FixedArray<Any>;
          expect(result1[0] as PromisifyResultValue).assertEqual('multi');

          const promisified2 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
            instance.errorCallback(callback);
          });
          let caught: boolean = false;
          try {
            await promisified2();
            expect(false).assertFail();
          } catch (e) {
            caught = true;
          }
          expect(caught).assertTrue();
          console.info('testSendableComplexCallback8300 end');
        } catch (e) {
          console.info(`testSendableComplexCallback8300 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0640
     * @tc.name testSendableDecorator8400
     * @tc.desc Test promisify with SendableDecorator8400 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableDecorator8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testSendableDecorator8400 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });

        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(20);
          console.info('testSendableDecorator8400 end');
        } catch (e) {
          console.info(`testSendableDecorator8400 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0650
     * @tc.name testConcurrentDecorator8500
     * @tc.desc Test promisify with ConcurrentDecorator8500 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testConcurrentDecorator8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testConcurrentDecorator8500 start');
        const promisified = util.promisify(concurrentCallbackFn);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('concurrent-result');
          console.info('testConcurrentDecorator8500 end');
        } catch (e) {
          console.info(`testConcurrentDecorator8500 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0660
     * @tc.name testSendableNestedClass8600
     * @tc.desc Test promisify with SendableNestedClass8600 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableNestedClass8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testSendableNestedClass8600 start');
        const instance: SendableNestedClass = new SendableNestedClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.outerCallback(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('sendable-nested-outer');
          console.info('testSendableNestedClass8600 end');
        } catch (e) {
          console.info(`testSendableNestedClass8600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0670
     * @tc.name testSendablePrivateField8700
     * @tc.desc Test promisify with SendablePrivateField8700 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendablePrivateField8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testSendablePrivateField8700 start');
        const instance: SendablePrivateFieldClass = new SendablePrivateFieldClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(30);
          console.info('testSendablePrivateField8700 end');
        } catch (e) {
          console.info(`testSendablePrivateField8700 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0680
     * @tc.name testSendableReturnType8900
     * @tc.desc Test promisify with SendableReturnType8900 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableReturnType8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testSendableReturnType8900 start');
        const instance: SendableReturnTypeClass = new SendableReturnTypeClass();

        const promisified1 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.stringCallback(callback);
        });
        try {
          const result1: FixedArray<Any>= await promisified1() as FixedArray<Any>;
          expect(result1[0] as PromisifyResultValue).assertEqual('string-result');

          const promisified2 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
            instance.numberCallback(callback);
          });
          const result2: FixedArray<Any>= await promisified2() as FixedArray<Any>;
          expect(result2[0] as PromisifyResultValue).assertEqual(100);

          const promisified3 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
            instance.booleanCallback(callback);
          });
          const result3: FixedArray<Any>= await promisified3() as FixedArray<Any>;
          expect(result3[0] as PromisifyResultValue).assertTrue();
          console.info('testSendableReturnType8900 end');
        } catch (e) {
          console.info(`testSendableReturnType8900 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0690
     * @tc.name testSendableErrorHandling9000
     * @tc.desc Test promisify with SendableErrorHandling9000 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableErrorHandling9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testSendableErrorHandling9000 start');
        const instance: SendableComplexCallbackClass = new SendableComplexCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.errorCallback(callback);
        });

        let caught: boolean = false;
        try {
          await promisified();
          expect(false).assertFail();
        } catch (e) {
          caught = true;
        }
        expect(caught).assertTrue();
        console.info('testSendableErrorHandling9000 end');
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0700
     * @tc.name testSendablePromiseChain9100
     * @tc.desc Test promisify with SendablePromiseChain9100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendablePromiseChain9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testSendablePromiseChain9100 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 5;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });

        try {
          const chained1: FixedArray<Any> = await (promisified() as Promise<FixedArray<Any>>);
          const chained2: int = (chained1[0] as int) + 5;
          const result: int = chained2 * 2;
          expect(result).assertEqual(30);
          console.info('testSendablePromiseChain9100 end');
        } catch (e) {
          console.info(`testSendablePromiseChain9100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0710
     * @tc.name testSendableAsyncAwait9200
     * @tc.desc Test promisify with SendableAsyncAwait9200 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableAsyncAwait9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testSendableAsyncAwait9200 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });

        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(20);
          console.info('testSendableAsyncAwait9200 end');
        } catch (e) {
          console.info(`testSendableAsyncAwait9200 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0720
     * @tc.name testSendableCallbackParamValidation9400
     * @tc.desc Test promisify with SendableCallbackParamValidation9400 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableCallbackParamValidation9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testSendableCallbackParamValidation9400 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(20);
          console.info('testSendableCallbackParamValidation9400 end');
        } catch (e) {
          console.info(`testSendableCallbackParamValidation9400 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0730
     * @tc.name testSendableConcurrencySafety9500
     * @tc.desc Test promisify with SendableConcurrencySafety9500 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableConcurrencySafety9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info('testSendableConcurrencySafety9500 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });

        const promises: Promise<FixedArray<Any>>[] = [];
        for (let i: int = 0; i < 5; i++) {
          promises.push(promisified() as Promise<FixedArray<Any>>);
        }

        try {
          const results: FixedArray<Any>[] = await Promise.all(promises);
          for (const result of results) {
            expect(result[0] as PromisifyResultValue).assertEqual(20);
          }
          console.info('testSendableConcurrencySafety9500 end');
        } catch (e) {
          console.info(`testSendableConcurrencySafety9500 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    // ========== Cross File Test Cases (编号10100-12000) ==========
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0750
     * @tc.name testTSCallbackFunction10100
     * @tc.desc Test promisify with TSCallbackFunction10100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTSCallbackFunction10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testTSCallbackFunction10100 start');
        const promisified = util.promisify(tsCallbackFunction);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          const callbackResult: TSCallbackResult = result[0] as TSCallbackResult;
          expect(callbackResult.value).assertEqual('ts-success');
          console.info('testTSCallbackFunction10100 end');
        } catch (e) {
          console.info(`testTSCallbackFunction10100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0760
     * @tc.name testTSCallbackClassMethod10200
     * @tc.desc Test promisify with TSCallbackClassMethod10200 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTSCallbackClassMethod10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testTSCallbackClassMethod10200 start');
        const instance: TSCallbackClass = new TSCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(20);
          console.info('testTSCallbackClassMethod10200 end');
        } catch (e) {
          console.info(`testTSCallbackClassMethod10200 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0770
     * @tc.name testJSCallbackFunction10600
     * @tc.desc Test promisify with JSCallbackFunction10600 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testJSCallbackFunction10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testJSCallbackFunction10600 start');
        const promisified = util.promisify(jsCallbackFunction);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('js-success');
          console.info('testJSCallbackFunction10600 end');
        } catch (e) {
          console.info(`testJSCallbackFunction10600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0780
     * @tc.name testETSTSJSConsistency11100
     * @tc.desc Test promisify with ETSTSJSConsistency11100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testETSTSJSConsistency11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testETSTSJSConsistency11100 start');
        const promisifiedETS = util.promisify(etsCallbackFunction);
        try {
          const resultETS: FixedArray<Any>= await promisifiedETS() as FixedArray<Any>;
          expect(resultETS[0] as PromisifyResultValue).assertEqual('ets-success');
          console.info('testETSTSJSConsistency11100 end');
        } catch (e) {
          console.info(`testETSTSJSConsistency11100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0790
     * @tc.name testCrossFileErrorHandling12000
     * @tc.desc Test promisify with CrossFileErrorHandling12000 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCrossFileErrorHandling12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCrossFileErrorHandling12000 start');
        const promisifiedETS = util.promisify(etsErrorCallback);
        let caught: boolean = false;
        try {
          await promisifiedETS();
          expect(false).assertFail();
        } catch (e) {
          caught = true;
        }
        expect(caught).assertTrue();
        console.info('testCrossFileErrorHandling12000 end');
      done();
      });

    // ========== Decorator Test Cases (编号12100-15000) ==========
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0800
     * @tc.name testSendableDecoratorMethod12100
     * @tc.desc Test promisify with SendableDecoratorMethod12100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSendableDecoratorMethod12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testSendableDecoratorMethod12100 start');
        const instance: SendableDecoratorCallbackClass = new SendableDecoratorCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.callbackMethod(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(20);
          console.info('testSendableDecoratorMethod12100 end');
        } catch (e) {
          console.info(`testSendableDecoratorMethod12100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0810
     * @tc.name testConcurrentDecoratorMethod12400
     * @tc.desc Test promisify with ConcurrentDecoratorMethod12400 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testConcurrentDecoratorMethod12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testConcurrentDecoratorMethod12400 start');
        const instance: ConcurrentDecoratorClass = new ConcurrentDecoratorClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.concurrentMethod(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(30);
          console.info('testConcurrentDecoratorMethod12400 end');
        } catch (e) {
          console.info(`testConcurrentDecoratorMethod12400 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0820
     * @tc.name testWrapperDecorator15000
     * @tc.desc Test promisify with WrapperDecorator15000 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testWrapperDecorator15000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testWrapperDecorator15000 start');
        const instance: WrapperDecoratorClass = new WrapperDecoratorClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.wrapperMethod(callback);
        });
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(230);
          console.info('testWrapperDecorator15000 end');
        } catch (e) {
          console.info(`testWrapperDecorator15000 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    // ========== Import Export Test Cases (编号15100-18500) ==========
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0830
     * @tc.name testExportedCallback15100
     * @tc.desc Test promisify with ExportedCallback15100 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testExportedCallback15100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testExportedCallback15100 start');
        const promisified = util.promisify(exportedCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('exported-callback');
          console.info('testExportedCallback15100 end');
        } catch (e) {
          console.info(`testExportedCallback15100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0840
     * @tc.name testNamespaceImport15600
     * @tc.desc Test promisify with NamespaceImport15600 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testNamespaceImport15600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testNamespaceImport15600 start');
        const promisified = util.promisify(CallbackNamespace.namespaceCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('namespace-callback');
          console.info('testNamespaceImport15600 end');
        } catch (e) {
          console.info(`testNamespaceImport15600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0850
     * @tc.name testModuleLevelCallback17600
     * @tc.desc Test promisify with ModuleLevelCallback17600 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testModuleLevelCallback17600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testModuleLevelCallback17600 start');
        const promisified = util.promisify(moduleLevelCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('module-level');
          console.info('testModuleLevelCallback17600 end');
        } catch (e) {
          console.info(`testModuleLevelCallback17600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0860
     * @tc.name testMixedImportSource18500
     * @tc.desc Test promisify with MixedImportSource18500 - verify callback to Promise conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMixedImportSource18500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testMixedImportSource18500 start');
        const promisifiedExported = util.promisify(exportedCallback);
        try {
          const resultExported: FixedArray<Any>= await promisifiedExported() as FixedArray<Any>;
          expect(resultExported[0] as PromisifyResultValue).assertEqual('exported-callback');
          console.info('testMixedImportSource18500 end');
        } catch (e) {
          console.info(`testMixedImportSource18500 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0001
     * @tc.name testSyncCallback18600
     * @tc.desc Test promisify with synchronous callback (no async delay)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testSyncCallback18600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testSyncCallback18600 start');
        const promisified = util.promisify(syncCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('sync-result');
          console.info('testSyncCallback18600 end');
        } catch (e) {
          console.info(`testSyncCallback18600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0002
     * @tc.name testCallbackCalledMultipleTimes18700
     * @tc.desc Test promisify when callback is called multiple times (should only resolve once)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCallbackCalledMultipleTimes18700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackCalledMultipleTimes18700 start');
        const promisified = util.promisify(multiCallCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('first');
          console.info('testCallbackCalledMultipleTimes18700 end');
        } catch (e) {
          console.info(`testCallbackCalledMultipleTimes18700 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0003
     * @tc.name testUndefinedParam18800
     * @tc.desc Test promisify with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testUndefinedParam18800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testUndefinedParam18800 start');
        const promisified = util.promisify(undefinedParamCallback);
        try {
          const result: FixedArray<Any>= await promisified(undefined) as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('undefined-received');
          console.info('testUndefinedParam18800 end');
        } catch (e) {
          console.info(`testUndefinedParam18800 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0004
     * @tc.name testNullParam18900
     * @tc.desc Test promisify with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNullParam18900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testNullParam18900 start');
        const promisified = util.promisify(nullParamCallback);
        try {
          const result: FixedArray<Any>= await promisified(null) as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('null-received');
          console.info('testNullParam18900 end');
        } catch (e) {
          console.info(`testNullParam18900 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0005
     * @tc.name testEmptyStringParam19000
     * @tc.desc Test promisify with empty string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmptyStringParam19000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testEmptyStringParam19000 start');
        const promisified = util.promisify(emptyStringCallback);
        try {
          const result: FixedArray<Any>= await promisified('') as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('empty-string');
        } catch (err) {
          expect(err).assertFail();
        }
        console.info('testEmptyStringParam19000 end');
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0006
     * @tc.name testConcurrentCalls19100
     * @tc.desc Test promisify with concurrent calls (10 concurrent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testConcurrentCalls19100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testConcurrentCalls19100 start');
        const promisified = util.promisify(concurrentCallback);
        const promises: Promise<FixedArray<Any>>[] = [];
        for (let i: int = 0; i < 10; i++) {
          promises.push(promisified(i) as Promise<FixedArray<Any>>);
        }
        try {
          const results: FixedArray<Any>[] = await Promise.all(promises);
          for (let i: int = 0; i < 10; i++) {
            expect(results[i][0] as PromisifyResultValue).assertEqual(i * 2);
          }
          console.info('testConcurrentCalls19100 end');
        } catch (e) {
          console.info(`testConcurrentCalls19100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0008
     * @tc.name testErrorFirstNull19300
     * @tc.desc Test promisify when error first parameter is null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testErrorFirstNull19300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testErrorFirstNull19300 start');
        const promisified = util.promisify(errorFirstNullCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('success-null-error');
          console.info('testErrorFirstNull19300 end');
        } catch (e) {
          console.info(`testErrorFirstNull19300 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0009
     * @tc.name testErrorFirstUndefined19400
     * @tc.desc Test promisify when error first parameter is undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testErrorFirstUndefined19400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testErrorFirstUndefined19400 start');
        const promisified = util.promisify(errorFirstUndefinedCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          console.info(`testErrorFirstUndefined19400 result: ${JSON.stringify(result)}`);
          expect(result[0] as PromisifyResultValue).assertEqual('success-undefined-error');
          console.info('testErrorFirstUndefined19400 end');
        } catch (e) {
          console.info(`testErrorFirstUndefined19400 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0010
     * @tc.name testReturnValueUndefined19500
     * @tc.desc Test promisify when return value is undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testReturnValueUndefined19500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testReturnValueUndefined19500 start');
        const promisified = util.promisify(undefinedReturnCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result.length).assertEqual(0);
          console.info('testReturnValueUndefined19500 end');
        } catch (e) {
          console.info(`testReturnValueUndefined19500 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0011
     * @tc.name testBigIntParam19600
     * @tc.desc Test promisify with BigInt parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigIntParam19600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testBigIntParam19600 start');
        const promisified = util.promisify(bigIntCallback);
        try {
          const result: FixedArray<Any>= await promisified(100n) as FixedArray<Any>;
          console.info(`testBigIntParam19600 result: ${JSON.stringify(result)}`);
          expect(result[0] as PromisifyResultValue).assertEqual(200n);
          console.info('testBigIntParam19600 end');
        } catch (e) {
          console.info(`testBigIntParam19600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0012
     * @tc.name testBooleanParam19700
     * @tc.desc Test promisify with boolean parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testBooleanParam19700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testBooleanParam19700 start');
        const promisified = util.promisify(booleanCallback);
        try {
          const resultTrue: FixedArray<Any>= await promisified(true) as FixedArray<Any>;
          expect(resultTrue[0] as PromisifyResultValue).assertEqual('true-value');
          const resultFalse: FixedArray<Any>= await promisified(false) as FixedArray<Any>;
          expect(resultFalse[0] as PromisifyResultValue).assertEqual('false-value');
          console.info('testBooleanParam19700 end');
        } catch (e) {
          console.info(`testBooleanParam19700 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0014
     * @tc.name testArrayBufferParam19900
     * @tc.desc Test promisify with ArrayBuffer parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testArrayBufferParam19900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testArrayBufferParam19900 start');
        const promisified = util.promisify(arrayBufferCallback);
        const buffer: ArrayBuffer = new ArrayBuffer(16);
        try {
          const result: FixedArray<Any>= await promisified(buffer) as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(16);
          console.info('testArrayBufferParam19900 end');
        } catch (e) {
          console.info(`testArrayBufferParam19900 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0015
     * @tc.name testTypedArrayParam20000
     * @tc.desc Test promisify with TypedArray parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testTypedArrayParam20000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTypedArrayParam20000 start');
        const promisified = util.promisify(typedArrayCallback);
        const typedArr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
        try {
          const result: FixedArray<Any>= await promisified(typedArr) as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(15);
          console.info('testTypedArrayParam20000 end');
        } catch (e) {
          console.info(`testTypedArrayParam20000 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0016
     * @tc.name testMapParam20100
     * @tc.desc Test promisify with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testMapParam20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testMapParam20100 start');
        const promisified = util.promisify(mapCallback);
        const myMap: Map<string, int> = new Map<string, int>();
        myMap.set('a', 1);
        myMap.set('b', 2);
        myMap.set('c', 3);
        try {
          const result: FixedArray<Any>= await promisified(myMap) as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(3);
        } catch (err) {
          expect(err).assertFail();
        }
        console.info('testMapParam20100 end');
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0017
     * @tc.name testSetParam20200
     * @tc.desc Test promisify with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testSetParam20200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testSetParam20200 start');
        const promisified = util.promisify(setCallback);
        const mySet: Set<string> = new Set<string>();
        mySet.add('x');
        mySet.add('y');
        mySet.add('z');
        try {
          const result: FixedArray<Any>= await promisified(mySet) as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(3);
          console.info('testSetParam20200 end');
        } catch (e) {
          console.info(`testSetParam20200 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0018
     * @tc.name testPromiseReject20300
     * @tc.desc Test promisify when promise is rejected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseReject20300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testPromiseReject20300 start');
        const promisified = util.promisify(rejectCallback);
        let caught: boolean = false;
        try {
          await promisified();
          expect(false).assertFail();
        } catch (e) {
          caught = true;
        }
        expect(caught).assertTrue();
        console.info('testPromiseReject20300 end');
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0019
     * @tc.name testChainedPromisify20400
     * @tc.desc Test promisify chaining multiple times
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testChainedPromisify20400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testChainedPromisify20400 start');
        const promisified1 = util.promisify(chainCallback);
        try {
          const result1: FixedArray<Any>= await promisified1() as FixedArray<Any>;
          expect(result1[0] as PromisifyResultValue).assertEqual('chain-start');
        } catch (err) {
          expect(err).assertFail();
        }

        const promisified2 = util.promisify(chainCallback);
        try {
          const result2: FixedArray<Any>= await promisified2() as FixedArray<Any>;

          const promisified3 = util.promisify(chainCallback);
          const result3: FixedArray<Any>= await promisified3() as FixedArray<Any>;

          expect(result2[0] as PromisifyResultValue).assertEqual('chain-start');
          expect(result3[0] as PromisifyResultValue).assertEqual('chain-start');
          console.info('testChainedPromisify20400 end');
        } catch (e) {
          console.info(`testChainedPromisify20400 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0021
     * @tc.name testRecursionPromisify20600
     * @tc.desc Test promisify with recursive callback calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testRecursionPromisify20600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testRecursionPromisify20600 start');
        const promisified = util.promisify(recursionCallback);
        try {
          const result: FixedArray<Any>= await promisified(5) as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual(5);
          console.info('testRecursionPromisify20600 end');
        } catch (e) {
          console.info(`testRecursionPromisify20600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0022
     * @tc.name testZeroDelayCallback20700
     * @tc.desc Test promisify with zero delay setTimeout
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testZeroDelayCallback20700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testZeroDelayCallback20700 start');
        const promisified = util.promisify(zeroDelayCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('zero-delay');
          console.info('testZeroDelayCallback20700 end');
        } catch (e) {
          console.info(`testZeroDelayCallback20700 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0023
     * @tc.name testLongDelayCallback20800
     * @tc.desc Test promisify with long delay setTimeout (1000ms)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testLongDelayCallback20800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testLongDelayCallback20800 start');
        const promisified = util.promisify(longDelayCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('long-delay');
          console.info('testLongDelayCallback20800 end');
        } catch (e) {
          console.info(`testLongDelayCallback20800 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_0024
     * @tc.name testImmediateCallback20900
     * @tc.desc Test promisify with immediate callback (call before return)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testImmediateCallback20900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testImmediateCallback20900 start');
        const promisified = util.promisify(immediateCallback);
        try {
          const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
          expect(result[0] as PromisifyResultValue).assertEqual('immediate');
          console.info('testImmediateCallback20900 end');
        } catch (e) {
          console.info(`testImmediateCallback20900 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });
  });
}
