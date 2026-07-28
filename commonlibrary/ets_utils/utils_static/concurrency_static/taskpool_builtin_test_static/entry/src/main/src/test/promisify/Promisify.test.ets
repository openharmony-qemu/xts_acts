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
import Utils, { sleep } from '../Utils.test';
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
  setTimeout(() => {
    callback(null, 'success');
  }, 100);
}

function errorCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(new Error('test-error'), '');
  }, 100);
}

function multiParamCallback(
  // a: int,
  b: string,
  callback: (err: Object | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, b.length as Object);
  }, 100);
}

function noErrorCallback(callback: (result: string) => void): void {
  setTimeout(() => {
    callback('no-error');
  }, 100);
}

function multiReturnValueCallback(
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, 'result1', 100);
  }, 100);
}

function singleParamCallback(
  a: int,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, a * 2);
  }, 100);
}

function restParamCallback(
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, 1, 2, 3);
  }, 100);
}

function objectParamCallback(
  obj: ObjectParamInterface,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, `${obj.x}-${obj.y}`);
  }, 100);
}

function arrayParamCallback(
  arr: int[],
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    let sum: int = 0;
    for (const item of arr) {
      sum += item;
    }
    callback(null, sum);
  }, 100);
}

class BasicCallbackClass {
  public value: int = 0;

  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.value * 2);
    }, 100);
  }

  public get dataValue(): int {
    return this.value;
  }

  public set dataValue(val: int) {
    this.value = val;
  }

  public methodBeforeGetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'before-getter');
    }, 100);
  }

  public methodAfterGetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'after-getter');
    }, 100);
  }

  public methodBeforeSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'before-setter');
    }, 100);
  }

  public methodAfterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'after-setter');
    }, 100);
  }

  public methodAfterGetterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'after-getter-setter');
    }, 100);
  }

  public methodBetweenGetterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'between-getter-setter');
    }, 100);
  }

  public static staticCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'static-result');
    }, 100);
  }
}

class MixedGetterSetterClass {
  public value: int = 0;
  private _data: string = '';

  public method1(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'method1');
    }, 100);
  }

  public get data(): string {
    return this._data;
  }

  public method2(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'method2');
    }, 100);
  }

  public set data(val: string) {
    this._data = val;
  }

  public method3(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'method3');
    }, 100);
  }

  public get readOnlyProp(): int {
    return this.value;
  }

  public method4(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'method4');
    }, 100);
  }

  public set writeOnlyProp(val: int) {
    this.value = val;
  }

  public method5(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'method5');
    }, 100);
  }
}

interface ObjectLiteralCallback {
  callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void;
}

const objectLiteralWithCallback: ObjectLiteralCallback = {
  callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
    setTimeout(() => {
      callback(null, 'object-literal');
    }, 100);
  }
};

interface ObjectLiteralGetterCallback {
  value: int;
  callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void;
}

const objectLiteralWithGetter: ObjectLiteralGetterCallback = {
  value: 100,
  callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
    setTimeout(() => {
      callback(null, 'object-literal-with-getter');
    }, 100);
  }
};

class ParentCallbackClass {
  public parentCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'parent');
    }, 100);
  }
}

class ChildCallbackClass extends ParentCallbackClass {
  public childCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'child');
    }, 100);
  }
}

class OverrideCallbackClass extends ParentCallbackClass {
  public parentCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'overridden');
    }, 100);
  }
}

const arrowCallback = (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
  setTimeout(() => {
    callback(null, 'arrow-callback');
  }, 100);
};

const assignedCallback: (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void =
  (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
  setTimeout(() => {
    callback(null, 'assigned-callback');
  }, 100);
};

function functionReturningCallback(): (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void {
  return (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
    setTimeout(() => {
      callback(null, 'returned-callback');
    }, 100);
  };
}

async function asyncFunctionForTest(): Promise<string> {
  return 'async-result';
}

function promiseReturningFunction(): Promise<string> {
  return Promise.resolve('promise-result');
}

function innerCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'inner');
  }, 100);
}

function nestedCallback(
  outerCallback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    innerCallback((err: Error | null, ...value: FixedArray<Any>) => {
      const innerResult: string = value[0] as string;
      if (err) {
        outerCallback(err, '');
      } else {
        outerCallback(null, `outer-${innerResult}`);
      }
    });
  }, 100);
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
    setTimeout(() => {
      callback(null, 'object-literal-after-setter');
    }, 100);
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
    setTimeout(() => {
      callback(null, 'static-after-getter-setter');
    }, 100);
  }
}

async function wrapper(fn: (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void): Promise<FixedArray<Any>> {
  const promisified = util.promisify(fn);
  return await promisified() as FixedArray<Any>;
}

async function executor(fn: () => Promise<FixedArray<Any>>): Promise<FixedArray<Any>> {
  return await fn();
}

function twoParamCallback(a: int, callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, a * 2);
  }, 100);
}

function threeParamCallback(b: string, callback: (err: Object | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, `${b}` as Object);
  }, 100);
}

function orderedCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'ordered');
  }, 100);
}

function customErrorCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    const customError: Error = new Error('custom-error');
    callback(customError, '');
  }, 100);
}

function customErrorFirstCallback(data: string, callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    if (data === 'error') {
      callback(new Error('error-triggered'), '');
    } else {
      callback(null, `processed-${data}`);
    }
  }, 100);
}

function specialCallback(
  callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'result', 100, true);
  }, 100);
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
    setTimeout(() => {
      callback(null, 'sendable-static');
    }, 100);
  }
}

class SendableParentClass {
  public parentCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'sendable-parent');
    }, 100);
  }
}

class SendableChildClass extends SendableParentClass {
  public childCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'sendable-child');
    }, 100);
  }
}

class SendableOverrideClass extends SendableParentClass {
  public parentCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'sendable-overridden');
    }, 100);
  }
}

class SendableComplexCallbackClass {
  public logs: Array<string> = new Array<string>();
  public results: Array<int> = new Array<int>();

  public callbackWithMultipleResults(
    callback: (err: Error | null, ...value: FixedArray<Any>) => void
  ): void {
    setTimeout(() => {
      callback(null, 'multi', 100);
    }, 100);
  }

  public errorCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(new Error('sendable-error'), '');
    }, 100);
  }
}

class SendableNestedClass {
  public outerCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'sendable-nested-outer');
    }, 100);
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
    setTimeout(() => {
      callback(null, `${a}-${b}`);
    }, 100);
  }
}

class SendableReturnTypeClass {
  public stringCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'string-result');
    }, 100);
  }

  public numberCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 100);
    }, 100);
  }

  public booleanCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, true);
    }, 100);
  }

  public arrayCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      const arr: Array<int> = new Array<int>();
      arr.push(1);
      arr.push(2);
      arr.push(3);
      callback(null, arr);
    }, 100);
  }
}

class SendableMultiParamClass {
  public multiParamCallback(
    a: int,
    b: string,
    c: boolean,
    callback: (err: Error | null, ...value: FixedArray<Any>) => void
  ): void {
    setTimeout(() => {
      callback(null, `${a}-${b}-${c}`);
    }, 100);
  }
}

function sendableCallbackFunction(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'sendable-function');
  }, 100);
}

function concurrentCallbackFn(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'concurrent-result');
  }, 100);
}

// ========== Cross File Test Classes ==========
function etsCallbackFunction(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'ets-success');
  }, 100);
}

function etsErrorCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(new Error('ets-error'), '');
  }, 100);
}

function etsMultiParamCallback(
  a: int,
  b: string,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, a + b.length);
  }, 100);
}

class ETSCallbackClass {
  public value: int = 0;

  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.value * 2);
    }, 100);
  }

  public get dataValue(): int {
    return this.value;
  }

  public set dataValue(val: int) {
    this.value = val;
  }

  public methodAfterGetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'ets-after-getter');
    }, 100);
  }

  public methodAfterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'ets-after-setter');
    }, 100);
  }

  public static staticCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'ets-static');
    }, 100);
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
    setTimeout(() => {
      callback(null, 'sendable-decorator-after-getter');
    }, 100);
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
    setTimeout(() => {
      callback(null, this.value * 3);
    }, 100);
  }

  public static staticConcurrentMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'concurrent-static');
    }, 100);
  }
}

function concurrentDecoratorFunction(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'concurrent-function');
  }, 100);
}

class SimulatedEntryComponent {
  public stateValue: int = 0;

  public entryCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.stateValue * 2);
    }, 100);
  }
}

class SimulatedComponentClass {
  public propValue: int = 0;

  public componentCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.propValue * 3);
    }, 100);
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
    setTimeout(() => {
      callback(null, this._stateValue * 4);
    }, 100);
  }
}

class SimulatedPropDecorator {
  public propValue: int = 0;

  public propCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.propValue * 5);
    }, 100);
  }
}

class SimulatedLinkDecorator {
  public linkValue: int = 0;

  public linkCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.linkValue * 6);
    }, 100);
  }
}

class SimulatedWatchDecorator {
  public watchValue: int = 0;

  public watchCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.watchValue * 7);
    }, 100);
  }
}

class SimulatedBuilderDecorator {
  public builderValue: int = 0;

  public builderCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.builderValue * 8);
    }, 100);
  }
}

class SimulatedProvideDecorator {
  public provideValue: int = 0;

  public provideCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.provideValue * 9);
    }, 100);
  }
}

class SimulatedConsumeDecorator {
  public consumeValue: int = 0;

  public consumeCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.consumeValue * 10);
    }, 100);
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
    setTimeout(() => {
      callback(null, this._stateValue * 11);
    }, 100);
  }
}

class SimulatedStylesDecorator {
  public stylesValue: int = 0;

  public stylesCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.stylesValue * 12);
    }, 100);
  }
}

class CustomDecoratorClass {
  public value: int = 0;

  public customCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.value * 13);
    }, 100);
  }
}

class CustomParamDecoratorClass {
  public value: int = 0;

  public paramCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'param-decorator');
    }, 100);
  }
}

class CustomClassDecoratorTarget {
  public value: int = 0;

  public classCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.value * 14);
    }, 100);
  }
}

class MultipleDecoratorClass {
  public value: int = 0;

  public multiDecoratorMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.value * 15);
    }, 100);
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
    setTimeout(() => {
      callback(null, this._value * 17);
    }, 100);
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
    setTimeout(() => {
      callback(null, this._value * 18);
    }, 100);
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
    setTimeout(() => {
      callback(null, this._value * 19);
    }, 100);
  }
}

class NestedDecoratorClass {
  public outerValue: int = 0;

  public outerMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.outerValue * 20);
    }, 100);
  }
}

class SimulatedBuilderParamDecorator {
  public builderParamValue: int = 0;

  public builderParamMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.builderParamValue * 21);
    }, 100);
  }
}

class DecoratorThisBindingClass {
  public value: int = 0;

  public thisBindingMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.value * 22);
    }, 100);
  }
}

class WrapperDecoratorClass {
  public value: int = 0;

  public wrapperMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.value * 23);
    }, 100);
  }
}

// ========== Import Export Test Classes ==========
function moduleLevelCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'module-level');
  }, 100);
}

const moduleLevelArrowCallback = (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
  setTimeout(() => {
    callback(null, 'module-arrow');
  }, 100);
};

class ModuleLevelCallbackClass {
  public value: int = 0;

  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, this.value * 2);
    }, 100);
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
  setTimeout(() => {
    recursiveCallbackInner(depth, callback, 0);
  }, 100);
}

function restCallback(
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, 1, 2, 3);
  }, 100);
}

function factoryType1Callback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'factory-type1');
  }, 100);
}

function factoryType2Callback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'factory-type2');
  }, 100);
}

function callbackFactory(type: string): (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void {
  if (type === 'type1') {
    return factoryType1Callback;
  } else {
    return factoryType2Callback;
  }
}

function overloadedCallbackString(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'overload-string');
  }, 100);
}

function overloadedCallbackNumber(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 100);
  }, 100);
}

class OverloadedClass {
  public overloadedMethodString(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'class-overload-string');
    }, 100);
  }

  public overloadedMethodNumber(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 200);
    }, 100);
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
  setTimeout(() => {
    callback(null, param === undefined ? 'undefined-received' : param);
  }, 100);
}

function nullParamCallback(
  param: string | null,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, param === null ? 'null-received' : param);
  }, 100);
}

function emptyStringCallback(
  param: string,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, param.length === 0 ? 'empty-string' : param);
  }, 100);
}

function concurrentCallback(
  id: int,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, id * 2);
  }, 100);
}

function errorFirstNullCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'success-null-error');
  }, 100);
}

function errorFirstUndefinedCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'success-undefined-error');
  }, 100);
}

function undefinedReturnCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null);
  }, 100);
}

function bigIntCallback(
  value: bigint,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, value * 2n);
  }, 100);
}

function booleanCallback(
  flag: boolean,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, flag ? 'true-value' : 'false-value');
  }, 100);
}

function arrayBufferCallback(
  buffer: ArrayBuffer,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, buffer.byteLength);
  }, 100);
}

function typedArrayCallback(
  arr: Int32Array,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout((): void => {
    let sum: int = 0;
    for (let i: int = 0; i < arr.length; i++) {
      sum += arr[i];
    }
    callback(null, sum);
  }, 100);
}

function mapCallback(
  map: Map<string, int>,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, map.size);
  }, 100);
}

function setCallback(
  set: Set<string>,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, set.size);
  }, 100);
}

function rejectCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(new Error('reject-error'), '');
  }, 100);
}

function chainCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'chain-start');
  }, 100);
}

function recursionCallback(
  depth: int,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    if (depth <= 0) {
      callback(null, 0);
    } else {
      callback(null, depth);
    }
  }, 100);
}

function zeroDelayCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'zero-delay');
  }, 100);
}

function longDelayCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'long-delay');
  }, 100);
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBasicCallbackConversion0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testBasicCallbackConversion0100 start');
        const promisified = util.promisify(basicCallback);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('success');
        console.info('testBasicCallbackConversion0100 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0120
     * @tc.name testFailCallbackConversion0300
     * @tc.desc Test promisify with FailCallbackConversion0300 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFailCallbackConversion0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testFailCallbackConversion0300 start');
        const promisified = util.promisify(errorCallback);
        try {
          await promisified();
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          expect(err.message).assertEqual('test-error');
        }
        console.info('testFailCallbackConversion0300 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0130
     * @tc.name testMultiParamCallback0400
     * @tc.desc Test promisify with MultiParamCallback0400 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMultiParamCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testMultiParamCallback0400 start');
        const promisified = util.promisify(multiParamCallback);
        const result: FixedArray<Any>= await promisified('test') as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual(4);
        console.info('testMultiParamCallback0400 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0140
     * @tc.name testMultiReturnValueCallback0600
     * @tc.desc Test promisify with MultiReturnValueCallback0600 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMultiReturnValueCallback0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testMultiReturnValueCallback0600 start');
        const promisified = util.promisify(multiReturnValueCallback);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('result1');
        console.info('testMultiReturnValueCallback0600 end');
      });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0140
     * @tc.name testMultiReturnValueCallback0600
     * @tc.desc Test promisify with RestParamCallback0800 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testRestParamCallback0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        console.info('testRestParamCallback0800 start');
        const promisified = util.promisify(restParamCallback);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual(1);
        console.info('testRestParamCallback0800 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0170
     * @tc.name testObjectParamCallback0900
     * @tc.desc Test promisify with ObjectParamCallback0900 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testObjectParamCallback0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testObjectParamCallback0900 start');
        const promisified = util.promisify(objectParamCallback);
        const obj: ObjectParamInterface = { x: 10, y: 'test' };
        const result: FixedArray<Any>= await promisified(obj) as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('10-test');
        console.info('testObjectParamCallback0900 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0180
     * @tc.name testArrayParamCallback1000
     * @tc.desc Test promisify with ArrayParamCallback1000 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testArrayParamCallback1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testArrayParamCallback1000 start');
        const promisified = util.promisify(arrayParamCallback);
        const result: FixedArray<Any>= await promisified([1, 2, 3, 4, 5]) as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual(15);
        console.info('testArrayParamCallback1000 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0190
     * @tc.name testTwoParamCallback1100
     * @tc.desc Test promisify with TwoParamCallback1100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTwoParamCallback1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testTwoParamCallback1100 start');
        const promisified = util.promisify(twoParamCallback);
        const result: FixedArray<Any>= await promisified(5) as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual(10);
        console.info('testTwoParamCallback1100 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0200
     * @tc.name testThreeParamCallback1200
     * @tc.desc Test promisify with ThreeParamCallback1200 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testThreeParamCallback1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testThreeParamCallback1200 start');
        const promisified = util.promisify(threeParamCallback);
        const result: FixedArray<Any>= await promisified('test') as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('test');
        console.info('testThreeParamCallback1200 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0210
     * @tc.name testMethodBeforeGetter1300
     * @tc.desc Test promisify with MethodBeforeGetter1300 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMethodBeforeGetter1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testMethodBeforeGetter1300 start');
        const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodBeforeGetter(callback);
        });
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('before-getter');
        console.info('testMethodBeforeGetter1300 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0220
     * @tc.name testMethodBeforeSetter1400
     * @tc.desc Test promisify with MethodBeforeSetter1400 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMethodBeforeSetter1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testMethodBeforeSetter1400 start');
        const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodBeforeSetter(callback);
        });
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('before-setter');
        console.info('testMethodBeforeSetter1400 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0230
     * @tc.name testMethodAfterGetter1500
     * @tc.desc Test promisify with MethodAfterGetter1500 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMethodAfterGetter1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testMethodAfterGetter1500 start');
        const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodAfterGetter(callback);
        });
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('after-getter');
        console.info('testMethodAfterGetter1500 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0240
     * @tc.name testMethodAfterSetter1600
     * @tc.desc Test promisify with MethodAfterSetter1600 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMethodAfterSetter1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testMethodAfterSetter1600 start');
        const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodAfterSetter(callback);
        });
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('after-setter');
        console.info('testMethodAfterSetter1600 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0250
     * @tc.name testMethodAfterGetterSetter1700
     * @tc.desc Test promisify with MethodAfterGetterSetter1700 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMethodAfterGetterSetter1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testMethodAfterGetterSetter1700 start');
        const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.methodAfterGetterSetter(callback);
        });
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('after-getter-setter');
        console.info('testMethodAfterGetterSetter1700 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0260
     * @tc.name testMethodBetweenGetterSetter1800
     * @tc.desc Test promisify with MethodBetweenGetterSetter1800 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMethodBetweenGetterSetter1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testMethodBetweenGetterSetter1800 start');
        const instance: MixedGetterSetterClass = new MixedGetterSetterClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.method2(callback);
        });
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('method2');
        console.info('testMethodBetweenGetterSetter1800 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0270
     * @tc.name testMixedGetterSetterMethods1900
     * @tc.desc Test promisify with MixedGetterSetterMethods1900 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMixedGetterSetterMethods1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testMixedGetterSetterMethods1900 start');
        const instance: MixedGetterSetterClass = new MixedGetterSetterClass();

        const promisified1 = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.method1(callback);
        });
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
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0280
     * @tc.name testObjectLiteralMethod2000
     * @tc.desc Test promisify with ObjectLiteralMethod2000 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testObjectLiteralMethod2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testObjectLiteralMethod2000 start');
        const promisified = util.promisify(objectLiteralWithCallback.callbackMethod);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('object-literal');
        console.info('testObjectLiteralMethod2000 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0290
     * @tc.name testObjectLiteralAfterGetter2100
     * @tc.desc Test promisify with ObjectLiteralAfterGetter2100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testObjectLiteralAfterGetter2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testObjectLiteralAfterGetter2100 start');
        const promisified = util.promisify(objectLiteralWithGetter.callbackMethod);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('object-literal-with-getter');
        console.info('testObjectLiteralAfterGetter2100 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0300
     * @tc.name testObjectLiteralAfterSetter2200
     * @tc.desc Test promisify with ObjectLiteralAfterSetter2200 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testObjectLiteralAfterSetter2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        console.info('testObjectLiteralAfterSetter2200 start');

        const promisified = util.promisify(objSetter.callbackMethod);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('object-literal-after-setter');
        console.info('testObjectLiteralAfterSetter2200 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0310
     * @tc.name testStaticMethod2300
     * @tc.desc Test promisify with StaticMethod2300 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticMethod2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        console.info('testStaticMethod2300 start');
        const promisified = util.promisify(BasicCallbackClass.staticCallbackMethod);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('static-result');
        console.info('testStaticMethod2300 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0320
     * @tc.name testStaticMethodAfterGetterSetter2400
     * @tc.desc Test promisify with StaticMethodAfterGetterSetter2400 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticMethodAfterGetterSetter2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        console.info('testStaticMethodAfterGetterSetter2400 start');

        const promisified = util.promisify(StaticWithGetterSetter.staticCallback);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('static-after-getter-setter');
        console.info('testStaticMethodAfterGetterSetter2400 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0330
     * @tc.name testInheritedMethod2500
     * @tc.desc Test promisify with InheritedMethod2500 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testInheritedMethod2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testInheritedMethod2500 start');
        const instance: ChildCallbackClass = new ChildCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.parentCallback(callback);
        });
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('parent');
        console.info('testInheritedMethod2500 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0340
     * @tc.name testOverriddenMethod2600
     * @tc.desc Test promisify with OverriddenMethod2600 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testOverriddenMethod2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testOverriddenMethod2600 start');
        const instance: OverrideCallbackClass = new OverrideCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, ...value: FixedArray<Any>) => void) => {
          instance.parentCallback(callback);
        });
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('overridden');
        console.info('testOverriddenMethod2600 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0350
     * @tc.name testArrowFunction2700
     * @tc.desc Test promisify with ArrowFunction2700 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testArrowFunction2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testArrowFunction2700 start');
        const promisified = util.promisify(arrowCallback);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('arrow-callback');
        console.info('testArrowFunction2700 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0360
     * @tc.name testAssignedFunction2800
     * @tc.desc Test promisify with AssignedFunction2800 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAssignedFunction2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testAssignedFunction2800 start');
        const promisified = util.promisify(assignedCallback);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('assigned-callback');
        console.info('testAssignedFunction2800 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0370
     * @tc.name testFunctionAsParam2900
     * @tc.desc Test promisify with FunctionAsParam2900 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFunctionAsParam2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        console.info('testFunctionAsParam2900 start');

        const result: FixedArray<Any> = await wrapper(basicCallback);
        expect(result[0] as PromisifyResultValue).assertEqual('success');
        console.info('testFunctionAsParam2900 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0380
     * @tc.name testReturnedFunction3000
     * @tc.desc Test promisify with ReturnedFunction3000 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testReturnedFunction3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        console.info('testReturnedFunction3000 start');
        const returnedFn = functionReturningCallback();
        const promisified = util.promisify(returnedFn);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('returned-callback');
        console.info('testReturnedFunction3000 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0390
     * @tc.name testAsyncFunction3100
     * @tc.desc Test promisify with AsyncFunction3100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncFunction3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        console.info('testAsyncFunction3100 start');
        const wrappedCallback = util.callbackWrapper(asyncFunctionForTest);
        const promisified = util.promisify(wrappedCallback);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('async-result');
        console.info('testAsyncFunction3100 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0400
     * @tc.name testPromiseFunction3200
     * @tc.desc Test promisify with PromiseFunction3200 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseFunction3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        console.info('testPromiseFunction3200 start');
        const wrappedCallback = util.callbackWrapper(promiseReturningFunction);
        const promisified = util.promisify(wrappedCallback);
        const result: FixedArray<Any> = await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual('promise-result');
        console.info('testPromiseFunction3200 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0410
     * @tc.name testThisBinding4600
     * @tc.desc Test promisify with ThisBinding4600 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testThisBinding4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info('testThisBinding4600 start');
        const context: ThisContext = { value: 10 };
        const boundFn = (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
          callCallbackWithThis(context, callback);
        };
        const promisified = util.promisify(boundFn);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;
        expect(result[0] as PromisifyResultValue).assertEqual(20);
        console.info('testThisBinding4600 end');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0420
     * @tc.name testBindAfterPromisify4700
     * @tc.desc Test promisify with BindAfterPromisify4700 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBindAfterPromisify4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        console.info('testBindAfterPromisify4700 start');
        const context: ThisContext = { value: 10 };
        const boundFn = (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
          callBindTestCallback(context, callback);
        };
        const promisified = util.promisify(boundFn);
        const result: FixedArray<Any>= await promisified() as FixedArray<Any>;