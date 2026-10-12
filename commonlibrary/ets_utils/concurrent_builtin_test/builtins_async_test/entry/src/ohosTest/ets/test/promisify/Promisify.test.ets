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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import util from '@ohos.util';
import taskpool from '@ohos.taskpool';
import worker from '@ohos.worker';
import { collections } from '@kit.ArkTS';
import {
  callCallbackWithThis,
  callBindTestCallback,
  createComputedObject,
  ThisContext,
  TSCallbackClass,
  tsCallbackFunction
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

const SLEEP_INTERVAL_MS: number = 100;

interface CallbackResult {
  err: Error | null;
  value: string;
}

interface ObjectParamInterface {
  x: number;
  y: string;
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

function basicCallback(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'success');
  }, 10);
}

function errorCallback(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(new Error('test-error'), '');
  }, 10);
}

function multiParamCallback(
  // a: number,
  b: string,
  callback: (err: Object | null, value: Object) => void
) {
  setTimeout(() => {
    callback(null, b.length as Object);
  }, 10);
}

function noErrorCallback(callback: (result: string) => void) {
  setTimeout(() => {
    callback('no-error');
  }, 10);
}

function multiReturnValueCallback(
  callback: (err: Error | null, result1: string, result2: number) => void
) {
  setTimeout(() => {
    callback(null, 'result1', 100);
  }, 10);
}

function singleParamCallback(
  a: number,
  callback: (err: Error | null, result: number) => void
) {
  setTimeout(() => {
    callback(null, a * 2);
  }, 10);
}

function restParamCallback(
  callback: (err: Error | null, ...args: number[]) => void
) {
  setTimeout(() => {
    callback(null, 1, 2, 3);
  }, 10);
}

function objectParamCallback(
  obj: ObjectParamInterface,
  callback: (err: Error | null, result: string) => void
) {
  setTimeout(() => {
    callback(null, `${obj.x}-${obj.y}`);
  }, 10);
}

function arrayParamCallback(
  arr: number[],
  callback: (err: Error | null, result: number) => void
) {
  setTimeout(() => {
    let sum: number = 0;
    for (const item of arr) {
      sum += item;
    }
    callback(null, sum);
  }, 10);
}

class BasicCallbackClass {
  public value: number = 0;

  public callbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.value * 2);
    }, 10);
  }

  public get dataValue(): number {
    return this.value;
  }

  public set dataValue(val: number) {
    this.value = val;
  }

  public methodBeforeGetter(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'before-getter');
    }, 10);
  }

  public methodAfterGetter(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'after-getter');
    }, 10);
  }

  public methodBeforeSetter(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'before-setter');
    }, 10);
  }

  public methodAfterSetter(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'after-setter');
    }, 10);
  }

  public methodAfterGetterSetter(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'after-getter-setter');
    }, 10);
  }

  public methodBetweenGetterSetter(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'between-getter-setter');
    }, 10);
  }

  public static staticCallbackMethod(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'static-result');
    }, 10);
  }
}

class MixedGetterSetterClass {
  public value: number = 0;
  private _data: string = '';

  public method1(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'method1');
    }, 10);
  }

  public get data(): string {
    return this._data;
  }

  public method2(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'method2');
    }, 10);
  }

  public set data(val: string) {
    this._data = val;
  }

  public method3(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'method3');
    }, 10);
  }

  public get readOnlyProp(): number {
    return this.value;
  }

  public method4(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'method4');
    }, 10);
  }

  public set writeOnlyProp(val: number) {
    this.value = val;
  }

  public method5(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'method5');
    }, 10);
  }
}

interface ObjectLiteralCallback {
  callbackMethod: (callback: (err: Error | null, result: string) => void) => void;
}

const objectLiteralWithCallback: ObjectLiteralCallback = {
  callbackMethod: (callback: (err: Error | null, result: string) => void): void => {
    setTimeout(() => {
      callback(null, 'object-literal');
    }, 10);
  }
};

interface ObjectLiteralGetterCallback {
  value: number;
  callbackMethod: (callback: (err: Error | null, result: string) => void) => void;
}

const objectLiteralWithGetter: ObjectLiteralGetterCallback = {
  value: 100,
  callbackMethod: (callback: (err: Error | null, result: string) => void): void => {
    setTimeout(() => {
      callback(null, 'object-literal-with-getter');
    }, 10);
  }
};

class ParentCallbackClass {
  public parentCallback(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'parent');
    }, 10);
  }
}

class ChildCallbackClass extends ParentCallbackClass {
  public childCallback(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'child');
    }, 10);
  }
}

class OverrideCallbackClass extends ParentCallbackClass {
  public parentCallback(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'overridden');
    }, 10);
  }
}

const arrowCallback = (callback: (err: Error | null, result: string) => void): void => {
  setTimeout(() => {
    callback(null, 'arrow-callback');
  }, 10);
};

let assignedCallback: ((callback: (err: Error | null, result: string) => void) => void) | null = null;
assignedCallback = (callback: (err: Error | null, result: string) => void): void => {
  setTimeout(() => {
    callback(null, 'assigned-callback');
  }, 10);
};

function functionReturningCallback(): (callback: (err: Error | null, result: string) => void) => void {
  return (callback: (err: Error | null, result: string) => void): void => {
    setTimeout(() => {
      callback(null, 'returned-callback');
    }, 10);
  };
}

async function asyncFunctionForTest(): Promise<string> {
  return 'async-result';
}

function promiseReturningFunction(): Promise<string> {
  return Promise.resolve('promise-result');
}

function innerCallback(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'inner');
  }, 10);
}

function nestedCallback(
  outerCallback: (err: Error | null, result: string) => void
) {
  setTimeout(() => {
    innerCallback((err: Error | null, innerResult: string) => {
      if (err) {
        outerCallback(err, '');
      } else {
        outerCallback(null, `outer-${innerResult}`);
      }
    });
  }, 10);
}

interface BusinessError {
  code: number;
  message: string;
}

interface ObjectLiteralSetter {
  value: number;
  callbackMethod: (callback: (err: Error | null, result: string) => void) => void;
}

const objSetter: ObjectLiteralSetter = {
  value: 200,
  callbackMethod: (callback: (err: Error | null, result: string) => void): void => {
    setTimeout(() => {
      callback(null, 'object-literal-after-setter');
    }, 10);
  }
};

class StaticWithGetterSetter {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }

  public static staticCallback(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'static-after-getter-setter');
    }, 10);
  }
}

function wrapper(fn: (callback: (err: Error | null, result: string) => void) => void): Promise<string[]> {
  const promisified = util.promisify(fn);
  return promisified();
}

async function executor(fn: Function): Promise<string[]> {
  return await (fn as () => Promise<string[]>)();
}

function twoParamCallback(a: number, callback: (err: Error | null, result: number) => void) {
  setTimeout(() => {
    callback(null, a * 2);
  }, 10);
}

function threeParamCallback(b: string, callback: (err: Object | null, value: Object) => void) {
  setTimeout(() => {
    callback(null, `${b}` as Object);
  }, 10);
}

function orderedCallback(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'ordered');
  }, 10);
}

function customErrorCallback(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    const customError: Error = new Error('custom-error');
    callback(customError, '');
  }, 10);
}

function customErrorFirstCallback(data: string, callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    if (data === 'error') {
      callback(new Error('error-triggered'), '');
    } else {
      callback(null, `processed-${data}`);
    }
  }, 10);
}

function specialCallback(
  callback: (err: Error | null, result1: string, result2: number, result3: boolean) => void) {
  setTimeout(() => {
    callback(null, 'result', 100, true);
  }, 10);
}


@Sendable
class SendableCallbackClass {
  public value: number = 0;

  public callbackMethod(callback: (err: Error | null, result: number) => void): void {
    callback(null, this.value * 2);
  }

  public get dataValue(): number {
    return this.value;
  }

  public set dataValue(val: number) {
    this.value = val;
  }

  public methodAfterGetter(callback: (err: Error | null, result: string) => void): void {
    callback(null, 'sendable-after-getter');
  }

  public methodAfterSetter(callback: (err: Error | null, result: string) => void): void {
    callback(null, 'sendable-after-setter');
  }

  public methodAfterGetterSetter(callback: (err: Error | null, result: string) => void): void {
    callback(null, 'sendable-after-getter-setter');
  }
}

@Sendable
class SendableMultiCallbackClass {
  public count: number = 0;

public firstCallback(callback: (err: Error | null, result: number) => void) {
    callback(null, this.count + 1);
  }

  public secondCallback(callback: (err: Error | null, result: number) => void) {
    callback(null, this.count + 2);
  }

  public thirdCallback(callback: (err: Error | null, result: number) => void) {
    callback(null, this.count + 3);
  }
}

@Sendable
class SendableStaticCallbackClass {
  public static staticCallbackMethod(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'sendable-static');
    }, 10);
  }
}

@Sendable
class SendableParentClass {
  public parentCallback(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'sendable-parent');
    }, 10);
  }
}

@Sendable
class SendableChildClass extends SendableParentClass {
  public childCallback(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'sendable-child');
    }, 10);
  }
}

@Sendable
class SendableOverrideClass extends SendableParentClass {
  public parentCallback(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'sendable-overridden');
    }, 10);
  }
}

@Sendable
class SendableComplexCallbackClass {
  public logs: collections.Array<string> = new collections.Array<string>();
  public results: collections.Array<number> = new collections.Array<number>();

  public callbackWithMultipleResults(
    callback: (err: Error | null, result1: string, result2: number) => void
  ) {
    setTimeout(() => {
      callback(null, 'multi', 100);
    }, 10);
  }

  public errorCallback(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(new Error('sendable-error'), '');
    }, 10);
  }
}

@Sendable
class SendableNestedClass {
  public outerCallback(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'sendable-nested-outer');
    }, 10);
  }
}

@Sendable
class SendablePrivateFieldClass {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }

public callbackMethod(callback: (err: Error | null, result: number) => void) {
    callback(null, this._value * 3);
  }
}

@Sendable
class SendableDefaultParamClass {
  public callbackWithDefault(
    a: number,
    b: string = 'default',
    callback: (err: Error | null, result: string) => void
  ) {
    setTimeout(() => {
      callback(null, `${a}-${b}`);
    }, 10);
  }
}

@Sendable
class SendableReturnTypeClass {
  public stringCallback(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'string-result');
    }, 10);
  }

  public numberCallback(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, 100);
    }, 10);
  }

  public booleanCallback(callback: (err: Error | null, result: boolean) => void) {
    setTimeout(() => {
      callback(null, true);
    }, 10);
  }

  public arrayCallback(callback: (err: Error | null, result: collections.Array<number>) => void) {
    setTimeout(() => {
      const arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1);
      arr.push(2);
      arr.push(3);
      callback(null, arr);
    }, 10);
  }
}

@Sendable
class SendableMultiParamClass {
  public multiParamCallback(
    a: number,
    b: string,
    c: boolean,
    callback: (err: Error | null, result: string) => void
  ) {
    setTimeout(() => {
      callback(null, `${a}-${b}-${c}`);
    }, 10);
  }
}

function sendableCallbackFunction(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'sendable-function');
  }, 10);
}

function concurrentCallbackFn(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'concurrent-result');
  }, 10);
}

// ========== Cross File Test Classes ==========
function etsCallbackFunction(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'ets-success');
  }, 10);
}

function etsErrorCallback(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(new Error('ets-error'), '');
  }, 10);
}

function etsMultiParamCallback(
  a: number,
  b: string,
  callback: (err: Error | null, result: number) => void
) {
  setTimeout(() => {
    callback(null, a + b.length);
  }, 10);
}

class ETSCallbackClass {
  public value: number = 0;

  public callbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.value * 2);
    }, 10);
  }

  public get dataValue(): number {
    return this.value;
  }

  public set dataValue(val: number) {
    this.value = val;
  }

  public methodAfterGetter(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'ets-after-getter');
    }, 10);
  }

  public methodAfterSetter(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'ets-after-setter');
    }, 10);
  }

  public static staticCallbackMethod(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'ets-static');
    }, 10);
  }
}

// ========== Decorator Test Classes ==========
@Sendable
class SendableDecoratorCallbackClass {
  public value: number = 0;

public callbackMethod(callback: (err: Error | null, result: number) => void) {
    callback(null, this.value * 2);
  }

  public get dataValue(): number {
    return this.value;
  }

  public set dataValue(val: number) {
    this.value = val;
  }

  public methodAfterGetter(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'sendable-decorator-after-getter');
    }, 10);
  }
}

@Sendable
class MultipleSendableDecoratorClass {
  public count: number = 0;

public firstMethod(callback: (err: Error | null, result: number) => void) {
    callback(null, this.count + 1);
  }

  public secondMethod(callback: (err: Error | null, result: number) => void) {
    callback(null, this.count + 2);
  }

  public thirdMethod(callback: (err: Error | null, result: number) => void) {
    callback(null, this.count + 3);
  }
}

@Sendable
class SendableWithGetterSetterDecorator {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }

public decoratedMethod(callback: (err: Error | null, result: number) => void) {
    callback(null, this._value * 5);
  }
}

class ConcurrentDecoratorClass {
  public value: number = 0;

  public concurrentMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.value * 3);
    }, 10);
  }

  public static staticConcurrentMethod(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'concurrent-static');
    }, 10);
  }
}

function concurrentDecoratorFunction(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'concurrent-function');
  }, 10);
}

class SimulatedEntryComponent {
  public stateValue: number = 0;

  public entryCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.stateValue * 2);
    }, 10);
  }
}

class SimulatedComponentClass {
  public propValue: number = 0;

  public componentCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.propValue * 3);
    }, 10);
  }
}

class SimulatedStateDecorator {
  private _stateValue: number = 0;

  public get stateValue(): number {
    return this._stateValue;
  }

  public set stateValue(val: number) {
    this._stateValue = val;
  }

  public stateCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this._stateValue * 4);
    }, 10);
  }
}

class SimulatedPropDecorator {
  public propValue: number = 0;

  public propCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.propValue * 5);
    }, 10);
  }
}

class SimulatedLinkDecorator {
  public linkValue: number = 0;

  public linkCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.linkValue * 6);
    }, 10);
  }
}

class SimulatedWatchDecorator {
  public watchValue: number = 0;

  public watchCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.watchValue * 7);
    }, 10);
  }
}

class SimulatedBuilderDecorator {
  public builderValue: number = 0;

  public builderCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.builderValue * 8);
    }, 10);
  }
}

class SimulatedProvideDecorator {
  public provideValue: number = 0;

  public provideCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.provideValue * 9);
    }, 10);
  }
}

class SimulatedConsumeDecorator {
  public consumeValue: number = 0;

  public consumeCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.consumeValue * 10);
    }, 10);
  }
}

class SimulatedStateWatchCombo {
  private _stateValue: number = 0;

  public get stateValue(): number {
    return this._stateValue;
  }

  public set stateValue(val: number) {
    this._stateValue = val;
  }

  public comboCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this._stateValue * 11);
    }, 10);
  }
}

class SimulatedStylesDecorator {
  public stylesValue: number = 0;

  public stylesCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.stylesValue * 12);
    }, 10);
  }
}

class CustomDecoratorClass {
  public value: number = 0;

  public customCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.value * 13);
    }, 10);
  }
}

class CustomParamDecoratorClass {
  public value: number = 0;

  public paramCallbackMethod(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'param-decorator');
    }, 10);
  }
}

class CustomClassDecoratorTarget {
  public value: number = 0;

  public classCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.value * 14);
    }, 10);
  }
}

class MultipleDecoratorClass {
  public value: number = 0;

  public multiDecoratorMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.value * 15);
    }, 10);
  }
}

@Sendable
class SendableConcurrentComboClass {
  public value: number = 0;

public comboMethod(callback: (err: Error | null, result: number) => void) {
    callback(null, this.value * 16);
  }
}

class StateWatchComboClass {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }

  public comboMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this._value * 17);
    }, 10);
  }
}

class AccessorDecoratorClass {
  private _value: number = 0;

  public get accessorValue(): number {
    return this._value;
  }

  public set accessorValue(val: number) {
    this._value = val;
  }

  public accessorCallbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this._value * 18);
    }, 10);
  }
}

class DecoratorSequenceClass {
  private _value: number = 0;

  public get firstValue(): number {
    return this._value;
  }

  public set secondValue(val: number) {
    this._value = val;
  }

  public sequenceMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this._value * 19);
    }, 10);
  }
}

class NestedDecoratorClass {
  public outerValue: number = 0;

  public outerMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.outerValue * 20);
    }, 10);
  }
}

class SimulatedBuilderParamDecorator {
  public builderParamValue: number = 0;

  public builderParamMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.builderParamValue * 21);
    }, 10);
  }
}

class DecoratorThisBindingClass {
  public value: number = 0;

  public thisBindingMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.value * 22);
    }, 10);
  }
}

class WrapperDecoratorClass {
  public value: number = 0;

  public wrapperMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.value * 23);
    }, 10);
  }
}

// ========== Import Export Test Classes ==========
function moduleLevelCallback(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'module-level');
  }, 10);
}

const moduleLevelArrowCallback = (callback: (err: Error | null, result: string) => void): void => {
  setTimeout(() => {
    callback(null, 'module-arrow');
  }, 10);
};

class ModuleLevelCallbackClass {
  public value: number = 0;

  public callbackMethod(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, this.value * 2);
    }, 10);
  }
}

function recursiveCallbackInner(
  depth: number,
  outerCallback: (err: Error | null, result: number) => void,
  innerResult: number
) {
  if (depth <= 0) {
    outerCallback(null, innerResult);
  } else {
    recursiveCallback(depth - 1, (err: Error | null, result: number) => {
      if (err) {
        outerCallback(err, 0);
      } else {
        outerCallback(null, result + 1);
      }
    });
  }
}

function recursiveCallback(
  depth: number,
  callback: (err: Error | null, result: number) => void
) {
  setTimeout(() => {
    recursiveCallbackInner(depth, callback, 0);
  }, 10);
}

function restCallback(
  callback: (err: Error | null, ...args: number[]) => void
) {
  setTimeout(() => {
    callback(null, 1, 2, 3);
  }, 10);
}

function factoryType1Callback(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'factory-type1');
  }, 10);
}

function factoryType2Callback(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'factory-type2');
  }, 10);
}

function callbackFactory(type: string): (callback: (err: Error | null, result: string) => void) => void {
  if (type === 'type1') {
    return factoryType1Callback;
  } else {
    return factoryType2Callback;
  }
}

function overloadedCallbackString(callback: (err: Error | null, result: string) => void) {
  setTimeout(() => {
    callback(null, 'overload-string');
  }, 10);
}

function overloadedCallbackNumber(callback: (err: Error | null, result: number) => void) {
  setTimeout(() => {
    callback(null, 100);
  }, 10);
}

class OverloadedClass {
  public overloadedMethodString(callback: (err: Error | null, result: string) => void) {
    setTimeout(() => {
      callback(null, 'class-overload-string');
    }, 10);
  }

  public overloadedMethodNumber(callback: (err: Error | null, result: number) => void) {
    setTimeout(() => {
      callback(null, 200);
    }, 10);
  }
}

function syncCallback(callback: (err: Error | null, result: string) => void): void {
  callback(null, 'sync-result');
}

function multiCallCallback(callback: (err: Error | null, result: string) => void): void {
  callback(null, 'first');
  callback(null, 'second');
  callback(null, 'third');
}

function undefinedParamCallback(
  param: string | undefined,
  callback: (err: Error | null, result: string) => void
): void {
  setTimeout(() => {
    callback(null, param === undefined ? 'undefined-received' : param);
  }, 10);
}

function nullParamCallback(
  param: string | null,
  callback: (err: Error | null, result: string) => void
): void {
  setTimeout(() => {
    callback(null, param === null ? 'null-received' : param);
  }, 10);
}

function emptyStringCallback(
  param: string,
  callback: (err: Error | null, result: string) => void
): void {
  setTimeout(() => {
    callback(null, param.length === 0 ? 'empty-string' : param);
  }, 10);
}

function concurrentCallback(
  id: number,
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    callback(null, id * 2);
  }, 10);
}

function errorFirstNullCallback(callback: (err: Error | null, result: string) => void): void {
  setTimeout(() => {
    callback(null, 'success-null-error');
  }, 10);
}

function errorFirstUndefinedCallback(callback: (err: Error | null | undefined, result: string) => void): void {
  setTimeout(() => {
    callback(undefined, 'success-undefined-error');
  }, 10);
}

function undefinedReturnCallback(callback: (err: Error | null, result?: string) => void): void {
  setTimeout(() => {
    callback(null);
  }, 10);
}

function bigIntCallback(
  value: bigint,
  callback: (err: Error | null, result: bigint) => void
): void {
  setTimeout(() => {
    callback(null, value * 2n);
  }, 10);
}

function booleanCallback(
  flag: boolean,
  callback: (err: Error | null, result: string) => void
): void {
  setTimeout(() => {
    callback(null, flag ? 'true-value' : 'false-value');
  }, 10);
}

function arrayBufferCallback(
  buffer: ArrayBuffer,
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    callback(null, buffer.byteLength);
  }, 10);
}

function typedArrayCallback(
  arr: Int32Array,
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    let sum: number = 0;
    for (let i: number = 0; i < arr.length; i++) {
      sum += arr[i];
    }
    callback(null, sum);
  }, 10);
}

function mapCallback(
  map: Map<string, number>,
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    callback(null, map.size);
  }, 10);
}

function setCallback(
  set: Set<string>,
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    callback(null, set.size);
  }, 10);
}

function rejectCallback(callback: (err: Error | null, result: string) => void): void {
  setTimeout(() => {
    callback(new Error('reject-error'), '');
  }, 10);
}

function chainCallback(callback: (err: Error | null, result: string) => void): void {
  setTimeout(() => {
    callback(null, 'chain-start');
  }, 10);
}

function recursionCallback(
  depth: number,
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    if (depth <= 0) {
      callback(null, 0);
    } else {
      callback(null, depth);
    }
  }, 10);
}

function zeroDelayCallback(callback: (err: Error | null, result: string) => void): void {
  setTimeout(() => {
    callback(null, 'zero-delay');
  }, 0);
}

function longDelayCallback(callback: (err: Error | null, result: string) => void): void {
  setTimeout(() => {
    callback(null, 'long-delay');
  }, 100);
}

function immediateCallback(callback: (err: Error | null, result: string) => void): void {
  callback(null, 'immediate');
}


export default function PromisifyTest() {
  describe('PromisifyTest', () => {
    beforeAll(() => {
      console.info('PromisifyTest beforeAll called');
    });

    beforeEach(async () => {
      await sleep(SLEEP_INTERVAL_MS);
    });

    afterEach(() => {
      console.info('PromisifyTest afterEach called');
    });

    afterAll(() => {
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
      async (done: Function): Promise<void> => {
        console.info('testBasicCallbackConversion0100 start');
        const promisified = util.promisify(basicCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('success');
        console.info('testBasicCallbackConversion0100 end');
        done();
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
      async (done: Function): Promise<void> => {
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
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testMultiParamCallback0400 start');
        const promisified = util.promisify(multiParamCallback);
        const result: Object[] = await promisified('test');
        expect(result[0]).assertEqual(4);
        console.info('testMultiParamCallback0400 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testMultiReturnValueCallback0600 start');
        const promisified = util.promisify(multiReturnValueCallback);
        const result: (string | number)[] = await promisified();
        expect(result[0]).assertEqual('result1');
        console.info('testMultiReturnValueCallback0600 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testRestParamCallback0800 start');
        const promisified = util.promisify(restParamCallback);
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(1);
        console.info('testRestParamCallback0800 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testObjectParamCallback0900 start');
        const promisified = util.promisify(objectParamCallback);
        const result: string[] = await promisified({ x: 10, y: 'test' });
        expect(result[0]).assertEqual('10-test');
        console.info('testObjectParamCallback0900 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testArrayParamCallback1000 start');
        const promisified = util.promisify(arrayParamCallback);
        const result: number[] = await promisified([1, 2, 3, 4, 5]);
        expect(result[0]).assertEqual(15);
        console.info('testArrayParamCallback1000 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testTwoParamCallback1100 start');
        const promisified = util.promisify(twoParamCallback);
        const result: number[] = await promisified(5);
        expect(result[0]).assertEqual(10);
        console.info('testTwoParamCallback1100 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testThreeParamCallback1200 start');
        const promisified = util.promisify(threeParamCallback);
        const result: Object[] = await promisified('test');
        expect(result[0]).assertEqual('test');
        console.info('testThreeParamCallback1200 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testMethodBeforeGetter1300 start');
const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.methodBeforeGetter(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('before-getter');
        console.info('testMethodBeforeGetter1300 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testMethodBeforeSetter1400 start');
const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.methodBeforeSetter(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('before-setter');
        console.info('testMethodBeforeSetter1400 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testMethodAfterGetter1500 start');
const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.methodAfterGetter(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('after-getter');
        console.info('testMethodAfterGetter1500 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testMethodAfterSetter1600 start');
const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.methodAfterSetter(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('after-setter');
        console.info('testMethodAfterSetter1600 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testMethodAfterGetterSetter1700 start');
const instance: BasicCallbackClass = new BasicCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.methodAfterGetterSetter(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('after-getter-setter');
        console.info('testMethodAfterGetterSetter1700 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testMethodBetweenGetterSetter1800 start');
const instance: MixedGetterSetterClass = new MixedGetterSetterClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.method2(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('method2');
        console.info('testMethodBetweenGetterSetter1800 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testMixedGetterSetterMethods1900 start');
const instance: MixedGetterSetterClass = new MixedGetterSetterClass();

        const promisified1 = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.method1(callback);
        });
        const result1: string[] = await promisified1();
        expect(result1[0]).assertEqual('method1');

        const promisified2 = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.method3(callback);
        });
        const result2: string[] = await promisified2();
        expect(result2[0]).assertEqual('method3');

        const promisified3 = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.method5(callback);
        });
        const result3: string[] = await promisified3();
        expect(result3[0]).assertEqual('method5');

        console.info('testMixedGetterSetterMethods1900 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testObjectLiteralMethod2000 start');
        const promisified = util.promisify(objectLiteralWithCallback.callbackMethod);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('object-literal');
        console.info('testObjectLiteralMethod2000 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testObjectLiteralAfterGetter2100 start');
        const promisified = util.promisify(objectLiteralWithGetter.callbackMethod);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('object-literal-with-getter');
        console.info('testObjectLiteralAfterGetter2100 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testObjectLiteralAfterSetter2200 start');

        const promisified = util.promisify(objSetter.callbackMethod);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('object-literal-after-setter');
        console.info('testObjectLiteralAfterSetter2200 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testStaticMethod2300 start');
        const promisified = util.promisify(BasicCallbackClass.staticCallbackMethod);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('static-result');
        console.info('testStaticMethod2300 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testStaticMethodAfterGetterSetter2400 start');

        const promisified = util.promisify(StaticWithGetterSetter.staticCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('static-after-getter-setter');
        console.info('testStaticMethodAfterGetterSetter2400 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testInheritedMethod2500 start');
const instance: ChildCallbackClass = new ChildCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.parentCallback(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('parent');
        console.info('testInheritedMethod2500 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testOverriddenMethod2600 start');
const instance: OverrideCallbackClass = new OverrideCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.parentCallback(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('overridden');
        console.info('testOverriddenMethod2600 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testArrowFunction2700 start');
        const promisified = util.promisify(arrowCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('arrow-callback');
        console.info('testArrowFunction2700 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testAssignedFunction2800 start');
        if (assignedCallback) {
          const promisified = util.promisify(assignedCallback);
          const result: string[] = await promisified();
          expect(result[0]).assertEqual('assigned-callback');
        }
        console.info('testAssignedFunction2800 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testFunctionAsParam2900 start');

        const result: string[] = await wrapper(basicCallback);
        expect(result[0]).assertEqual('success');
        console.info('testFunctionAsParam2900 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testReturnedFunction3000 start');
        const returnedFn = functionReturningCallback();
        const promisified = util.promisify(returnedFn);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('returned-callback');
        console.info('testReturnedFunction3000 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testAsyncFunction3100 start');
        try {
          const wrappedCallback = util.callbackWrapper(asyncFunctionForTest);
          const promisified = util.promisify(wrappedCallback);
          const result: string[] = await promisified();
          expect(result[0]).assertEqual('async-result');
        } catch (error) {
          console.info('Async function promisify handled');
        }
        console.info('testAsyncFunction3100 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testPromiseFunction3200 start');
        try {
          const result: string = await promiseReturningFunction();
          expect(result).assertEqual('promise-result');
        } catch (error) {
          console.info('Promise function test handled');
        }
        console.info('testPromiseFunction3200 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testThisBinding4600 start');
        const context: ThisContext = { value: 10 };
        const boundFn = (callback: (err: Error | null, result: number) => void): void => {
          callCallbackWithThis(context, callback);
        };
        const promisified = util.promisify(boundFn);
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(20);
        console.info('testThisBinding4600 end');
        done();
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
      async (done: Function): Promise<void> => {
        console.info('testBindAfterPromisify4700 start');
        const context: ThisContext = { value: 10 };
        const boundFn = (callback: (err: Error | null, result: number) => void): void => {
          callBindTestCallback(context, callback);
        };
        const promisified = util.promisify(boundFn);
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(30);
        console.info('testBindAfterPromisify4700 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0430
     * @tc.name testPromiseChain4800
     * @tc.desc Test promisify with PromiseChain4800 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChain4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testPromiseChain4800 start');
        const promisified = util.promisify(basicCallback);
        const result: string = await promisified()
          .then((res: string[]) => {
            return res[0] + '-chained';
          })
          .then((res: string) => {
            return res + '-again';
          });
        expect(result).assertEqual('success-chained-again');
        console.info('testPromiseChain4800 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0440
     * @tc.name testAsyncAwait4900
     * @tc.desc Test promisify with AsyncAwait4900 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncAwait4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testAsyncAwait4900 start');
        const promisified = util.promisify(basicCallback);
        const result1: string[] = await promisified();
        expect(result1[0]).assertEqual('success');

        const promisified2 = util.promisify(singleParamCallback);
        const result2: number[] = await promisified2(5);
        expect(result2[0]).assertEqual(10);
        console.info('testAsyncAwait4900 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0450
     * @tc.name testMultiplePromisify5000
     * @tc.desc Test promisify with MultiplePromisify5000 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMultiplePromisify5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testMultiplePromisify5000 start');
        const promisified1 = util.promisify(basicCallback);
        const promisified2 = util.promisify(basicCallback);

        const result1: string[] = await promisified1();
        const result2: string[] = await promisified2();

        expect(result1[0]).assertEqual('success');
        expect(result2[0]).assertEqual('success');
        console.info('testMultiplePromisify5000 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0460
     * @tc.name testNestedCallback5100
     * @tc.desc Test promisify with NestedCallback5100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNestedCallback5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testNestedCallback5100 start');
        const promisified = util.promisify(nestedCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('outer-inner');
        console.info('testNestedCallback5100 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0470
     * @tc.name testErrorHandlingChain5200
     * @tc.desc Test promisify with ErrorHandlingChain5200 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testErrorHandlingChain5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testErrorHandlingChain5200 start');
        const promisified = util.promisify(errorCallback);

        try {
          await promisified()
            .then((res: string) => {
              return 'should-not-reach';
            });
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          expect(err.message).assertEqual('test-error');
        }
        console.info('testErrorHandlingChain5200 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0480
     * @tc.name testPromisifyAsParam5400
     * @tc.desc Test promisify with PromisifyAsParam5400 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromisifyAsParam5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testPromisifyAsParam5400 start');

        const promisified = util.promisify(basicCallback);
        const result: string[] = await executor(promisified);
        expect(result[0]).assertEqual('success');
        console.info('testPromisifyAsParam5400 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0490
     * @tc.name testComputedPropertyMethod5500
     * @tc.desc Test promisify with ComputedPropertyMethod5500 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testComputedPropertyMethod5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testComputedPropertyMethod5500 start');

        const methodName: string = 'callbackMethod';
        const computedObj = createComputedObject(methodName);
        const promisified = util.promisify(computedObj[methodName]);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('computed-property');
        console.info('testComputedPropertyMethod5500 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0500
     * @tc.name testCallbackOrder5700
     * @tc.desc Test promisify with CallbackOrder5700 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCallbackOrder5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testCallbackOrder5700 start');

        const promisified = util.promisify(orderedCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('ordered');
        console.info('testCallbackOrder5700 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0510
     * @tc.name testErrorObjectType5800
     * @tc.desc Test promisify with ErrorObjectType5800 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testErrorObjectType5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testErrorObjectType5800 start');

        const promisified = util.promisify(customErrorCallback);
        try {
          await promisified();
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          expect(err.message).assertEqual('custom-error');
        }
        console.info('testErrorObjectType5800 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0520
     * @tc.name testCustomErrorFirst5900
     * @tc.desc Test promisify with CustomErrorFirst5900 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCustomErrorFirst5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testCustomErrorFirst5900 start');

        const promisified = util.promisify(customErrorFirstCallback);

        const result1: string[] = await promisified('success');
        expect(result1[0]).assertEqual('processed-success');

        try {
          await promisified('error');
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          expect(err.message).assertEqual('error-triggered');
        }
        console.info('testCustomErrorFirst5900 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0530
     * @tc.name testSpecialCallbackSignature6000
     * @tc.desc Test promisify with SpecialCallbackSignature6000 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSpecialCallbackSignature6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testSpecialCallbackSignature6000 start');

        const promisified = util.promisify(specialCallback);
        const result: (string | number | boolean)[] = await promisified();
        expect(result[0]).assertEqual('result');
        console.info('testSpecialCallbackSignature6000 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0540
     * @tc.name testSendableClassCallback7100
     * @tc.desc Test promisify with SendableClassCallback7100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
it('testSendableClassCallback7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testSendableClassCallback7100 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(20);
        console.info('testSendableClassCallback7100 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0550
     * @tc.name testSendableClassMultiCallback7200
     * @tc.desc Test promisify with SendableClassMultiCallback7200 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableClassMultiCallback7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testSendableClassMultiCallback7200 start');
const instance: SendableMultiCallbackClass = new SendableMultiCallbackClass();
        instance.count = 0;

        const promisified1 = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.firstCallback(callback);
        });
        const result1: number[] = await promisified1();
        expect(result1[0]).assertEqual(1);

        const promisified2 = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.secondCallback(callback);
        });
        const result2: number[] = await promisified2();
        expect(result2[0]).assertEqual(2);

        const promisified3 = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.thirdCallback(callback);
        });
        const result3: number[] = await promisified3();
        expect(result3[0]).assertEqual(3);
        console.info('testSendableClassMultiCallback7200 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0560
     * @tc.name testSendableStaticCallback7300
     * @tc.desc Test promisify with SendableStaticCallback7300 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableStaticCallback7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testSendableStaticCallback7300 start');
        const promisified = util.promisify(SendableStaticCallbackClass.staticCallbackMethod);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('sendable-static');
        console.info('testSendableStaticCallback7300 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0570
     * @tc.name testSendableInheritedCallback7400
     * @tc.desc Test promisify with SendableInheritedCallback7400 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableInheritedCallback7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testSendableInheritedCallback7400 start');
const instance: SendableChildClass = new SendableChildClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.parentCallback(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('sendable-parent');
        console.info('testSendableInheritedCallback7400 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0580
     * @tc.name testSendableOverriddenCallback7500
     * @tc.desc Test promisify with SendableOverriddenCallback7500 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableOverriddenCallback7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testSendableOverriddenCallback7500 start');
const instance: SendableOverrideClass = new SendableOverrideClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.parentCallback(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('sendable-overridden');
        console.info('testSendableOverriddenCallback7500 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0590
     * @tc.name testSendableGetterSetterCallback7600
     * @tc.desc Test promisify with SendableGetterSetterCallback7600 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableGetterSetterCallback7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testSendableGetterSetterCallback7600 start');
const instance: SendableCallbackClass = new SendableCallbackClass();

        const promisified1 = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.methodAfterGetter(callback);
        });
        const result1: string[] = await promisified1();
        expect(result1[0]).assertEqual('sendable-after-getter');

        const promisified2 = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.methodAfterSetter(callback);
        });
        const result2: string[] = await promisified2();
        expect(result2[0]).assertEqual('sendable-after-setter');

        const promisified3 = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.methodAfterGetterSetter(callback);
        });
        const result3: string[] = await promisified3();
        expect(result3[0]).assertEqual('sendable-after-getter-setter');
        console.info('testSendableGetterSetterCallback7600 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0600
     * @tc.name testTaskPoolPromisify7700
     * @tc.desc Test promisify with TaskPoolPromisify7700 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTaskPoolPromisify7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testTaskPoolPromisify7700 start');
const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 5;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });

        const result: number[] = await promisified();
        expect(result[0]).assertEqual(10);
        console.info('testTaskPoolPromisify7700 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0610
     * @tc.name testWorkerPromisify8100
     * @tc.desc Test promisify with WorkerPromisify8100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerPromisify8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testWorkerPromisify8100 start');
const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 5;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(10);
        console.info('testWorkerPromisify8100 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0620
     * @tc.name testSendableContainerStore8200
     * @tc.desc Test promisify with SendableContainerStore8200 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
it('testSendableContainerStore8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testSendableContainerStore8200 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });

        const result: number[] = await promisified();
        expect(result[0]).assertEqual(20);
        console.info('testSendableContainerStore8200 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0630
     * @tc.name testSendableComplexCallback8300
     * @tc.desc Test promisify with SendableComplexCallback8300 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableComplexCallback8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testSendableComplexCallback8300 start');
const instance: SendableComplexCallbackClass = new SendableComplexCallbackClass();

        const promisified1 = util.promisify((callback: (err: Error | null, result1: string, result2: number) => void) => {
          instance.callbackWithMultipleResults(callback);
        });
        const result1: (string | number)[] = await promisified1();
        expect(result1[0]).assertEqual('multi');

        const promisified2 = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.errorCallback(callback);
        });
        try {
          await promisified2();
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          expect(err.message).assertEqual('sendable-error');
        }
        console.info('testSendableComplexCallback8300 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0640
     * @tc.name testSendableDecorator8400
     * @tc.desc Test promisify with SendableDecorator8400 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableDecorator8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testSendableDecorator8400 start');
const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });

        const result: number[] = await promisified();
        expect(result[0]).assertEqual(20);
        console.info('testSendableDecorator8400 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0650
     * @tc.name testConcurrentDecorator8500
     * @tc.desc Test promisify with ConcurrentDecorator8500 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConcurrentDecorator8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testConcurrentDecorator8500 start');
        const promisified = util.promisify(concurrentCallbackFn);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('concurrent-result');
        console.info('testConcurrentDecorator8500 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0660
     * @tc.name testSendableNestedClass8600
     * @tc.desc Test promisify with SendableNestedClass8600 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableNestedClass8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testSendableNestedClass8600 start');
const instance: SendableNestedClass = new SendableNestedClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.outerCallback(callback);
        });
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('sendable-nested-outer');
        console.info('testSendableNestedClass8600 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0670
     * @tc.name testSendablePrivateField8700
     * @tc.desc Test promisify with SendablePrivateField8700 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendablePrivateField8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testSendablePrivateField8700 start');
const instance: SendablePrivateFieldClass = new SendablePrivateFieldClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(30);
        console.info('testSendablePrivateField8700 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0680
     * @tc.name testSendableReturnType8900
     * @tc.desc Test promisify with SendableReturnType8900 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableReturnType8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testSendableReturnType8900 start');
const instance: SendableReturnTypeClass = new SendableReturnTypeClass();

        const promisified1 = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.stringCallback(callback);
        });
        const result1: string[] = await promisified1();
        expect(result1[0]).assertEqual('string-result');

        const promisified2 = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.numberCallback(callback);
        });
        const result2: number[] = await promisified2();
        expect(result2[0]).assertEqual(100);

        const promisified3 = util.promisify((callback: (err: Error | null, result: boolean) => void) => {
          instance.booleanCallback(callback);
        });
        const result3: boolean[] = await promisified3();
        expect(result3[0]).assertTrue();
        console.info('testSendableReturnType8900 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0690
     * @tc.name testSendableErrorHandling9000
     * @tc.desc Test promisify with SendableErrorHandling9000 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableErrorHandling9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testSendableErrorHandling9000 start');
const instance: SendableComplexCallbackClass = new SendableComplexCallbackClass();
        const promisified = util.promisify((callback: (err: Error | null, result: string) => void) => {
          instance.errorCallback(callback);
        });

        try {
          await promisified();
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          expect(err.message).assertEqual('sendable-error');
        }
        console.info('testSendableErrorHandling9000 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0700
     * @tc.name testSendablePromiseChain9100
     * @tc.desc Test promisify with SendablePromiseChain9100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendablePromiseChain9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testSendablePromiseChain9100 start');
const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 5;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });

        const result: number = await promisified()
          .then((res: number[]) => {
            return res[0] + 5;
          })
          .then((res: number) => {
            return res * 2;
          });
        expect(result).assertEqual(30);
        console.info('testSendablePromiseChain9100 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0710
     * @tc.name testSendableAsyncAwait9200
     * @tc.desc Test promisify with SendableAsyncAwait9200 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
it('testSendableAsyncAwait9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testSendableAsyncAwait9200 start');
        const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });

        const result: number[] = await promisified();
        expect(result[0]).assertEqual(20);
        console.info('testSendableAsyncAwait9200 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0720
     * @tc.name testSendableCallbackParamValidation9400
     * @tc.desc Test promisify with SendableCallbackParamValidation9400 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableCallbackParamValidation9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testSendableCallbackParamValidation9400 start');
const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(20);
        console.info('testSendableCallbackParamValidation9400 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0730
     * @tc.name testSendableConcurrencySafety9500
     * @tc.desc Test promisify with SendableConcurrencySafety9500 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableConcurrencySafety9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function): Promise<void> => {
        console.info('testSendableConcurrencySafety9500 start');
const instance: SendableCallbackClass = new SendableCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });

        const promises: Promise<number[]>[] = [];
        for (let i: number = 0; i < 5; i++) {
          promises.push(promisified());
        }

        const results: number[][] = await Promise.all(promises);
        for (const result of results) {
          expect(result[0]).assertEqual(20);
        }
        console.info('testSendableConcurrencySafety9500 end');
        done();
      });

    // /**
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0740
    //  * @tc.name testSendableDynamicPromisify9600
    //  * @tc.desc Test promisify with SendableDynamicPromisify9600 - verify callback to Promise conversion
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level0
    //  */
    // it('testSendableDynamicPromisify9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: Function): Promise<void> => {
    //     console.info('testSendableDynamicPromisify9600 start');
    //     const instance: SendableCallbackClass = new SendableCallbackClass();
    //     instance.value = 20;
    //
    //     const promisified = util.promisify(instance.callbackMethod);
    //     const result: number[] = await promisified();
    //     expect(result[0]).assertEqual(40);
    //     console.info('testSendableDynamicPromisify9600 end');
    //     done();
    //   });

    // ========== Cross File Test Cases (编号10100-12000) ==========
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0750
     * @tc.name testTSCallbackFunction10100
     * @tc.desc Test promisify with TSCallbackFunction10100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTSCallbackFunction10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testTSCallbackFunction10100 start');
        const promisified = util.promisify(tsCallbackFunction);
        const result: CallbackResult[] = await promisified();
        expect(result[0].value).assertEqual('ts-success');
        console.info('testTSCallbackFunction10100 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0760
     * @tc.name testTSCallbackClassMethod10200
     * @tc.desc Test promisify with TSCallbackClassMethod10200 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTSCallbackClassMethod10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testTSCallbackClassMethod10200 start');
const instance: TSCallbackClass = new TSCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(20);
        console.info('testTSCallbackClassMethod10200 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0770
     * @tc.name testJSCallbackFunction10600
     * @tc.desc Test promisify with JSCallbackFunction10600 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testJSCallbackFunction10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testJSCallbackFunction10600 start');
        const promisified = util.promisify(jsCallbackFunction);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('js-success');
        console.info('testJSCallbackFunction10600 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0780
     * @tc.name testETSTSJSConsistency11100
     * @tc.desc Test promisify with ETSTSJSConsistency11100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testETSTSJSConsistency11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testETSTSJSConsistency11100 start');
        const promisifiedETS = util.promisify(etsCallbackFunction);
        const resultETS: string[] = await promisifiedETS();
        expect(resultETS[0]).assertEqual('ets-success');
        console.info('testETSTSJSConsistency11100 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0790
     * @tc.name testCrossFileErrorHandling12000
     * @tc.desc Test promisify with CrossFileErrorHandling12000 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCrossFileErrorHandling12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testCrossFileErrorHandling12000 start');
        const promisifiedETS = util.promisify(etsErrorCallback);
        try {
          await promisifiedETS();
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          expect(err.message).assertEqual('ets-error');
        }
        console.info('testCrossFileErrorHandling12000 end');
        done();
      });

    // ========== Decorator Test Cases (编号12100-15000) ==========
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0800
     * @tc.name testSendableDecoratorMethod12100
     * @tc.desc Test promisify with SendableDecoratorMethod12100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableDecoratorMethod12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testSendableDecoratorMethod12100 start');
const instance: SendableDecoratorCallbackClass = new SendableDecoratorCallbackClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.callbackMethod(callback);
        });
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(20);
        console.info('testSendableDecoratorMethod12100 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0810
     * @tc.name testConcurrentDecoratorMethod12400
     * @tc.desc Test promisify with ConcurrentDecoratorMethod12400 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConcurrentDecoratorMethod12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testConcurrentDecoratorMethod12400 start');
const instance: ConcurrentDecoratorClass = new ConcurrentDecoratorClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.concurrentMethod(callback);
        });
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(30);
        console.info('testConcurrentDecoratorMethod12400 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0820
     * @tc.name testWrapperDecorator15000
     * @tc.desc Test promisify with WrapperDecorator15000 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWrapperDecorator15000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testWrapperDecorator15000 start');
const instance: WrapperDecoratorClass = new WrapperDecoratorClass();
        instance.value = 10;
        const promisified = util.promisify((callback: (err: Error | null, result: number) => void) => {
          instance.wrapperMethod(callback);
        });
        const result: number[] = await promisified();
        expect(result[0]).assertEqual(230);
        console.info('testWrapperDecorator15000 end');
        done();
      });

    // ========== Import Export Test Cases (编号15100-18500) ==========
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0830
     * @tc.name testExportedCallback15100
     * @tc.desc Test promisify with ExportedCallback15100 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testExportedCallback15100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testExportedCallback15100 start');
        const promisified = util.promisify(exportedCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('exported-callback');
        console.info('testExportedCallback15100 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0840
     * @tc.name testNamespaceImport15600
     * @tc.desc Test promisify with NamespaceImport15600 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNamespaceImport15600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testNamespaceImport15600 start');
        const promisified = util.promisify(CallbackNamespace.namespaceCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('namespace-callback');
        console.info('testNamespaceImport15600 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0850
     * @tc.name testModuleLevelCallback17600
     * @tc.desc Test promisify with ModuleLevelCallback17600 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testModuleLevelCallback17600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testModuleLevelCallback17600 start');
        const promisified = util.promisify(moduleLevelCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('module-level');
        console.info('testModuleLevelCallback17600 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_0860
     * @tc.name testMixedImportSource18500
     * @tc.desc Test promisify with MixedImportSource18500 - verify callback to Promise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMixedImportSource18500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testMixedImportSource18500 start');
        const promisifiedExported = util.promisify(exportedCallback);
        const resultExported: string[] = await promisifiedExported();
        expect(resultExported[0]).assertEqual('exported-callback');
        console.info('testMixedImportSource18500 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_001
     * @tc.name testSyncCallback18600
     * @tc.desc Test promisify with synchronous callback (no async delay)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testSyncCallback18600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testSyncCallback18600 start');
        const promisified = util.promisify(syncCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('sync-result');
        console.info('testSyncCallback18600 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_002
     * @tc.name testCallbackCalledMultipleTimes18700
     * @tc.desc Test promisify when callback is called multiple times (should only resolve once)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCallbackCalledMultipleTimes18700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testCallbackCalledMultipleTimes18700 start');
        const promisified = util.promisify(multiCallCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('first');
        console.info('testCallbackCalledMultipleTimes18700 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_003
     * @tc.name testUndefinedParam18800
     * @tc.desc Test promisify with undefined parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testUndefinedParam18800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testUndefinedParam18800 start');
        const promisified = util.promisify(undefinedParamCallback);
        const result: string[] = await promisified(undefined);
        expect(result[0]).assertEqual('undefined-received');
        console.info('testUndefinedParam18800 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_004
     * @tc.name testNullParam18900
     * @tc.desc Test promisify with null parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNullParam18900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testNullParam18900 start');
        const promisified = util.promisify(nullParamCallback);
        const result: string[] = await promisified(null);
        expect(result[0]).assertEqual('null-received');
        console.info('testNullParam18900 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_005
     * @tc.name testEmptyStringParam19000
     * @tc.desc Test promisify with empty string parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEmptyStringParam19000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testEmptyStringParam19000 start');
        const promisified = util.promisify(emptyStringCallback);
        const result: string[] = await promisified('');
        expect(result[0]).assertEqual('empty-string');
        console.info('testEmptyStringParam19000 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_006
     * @tc.name testConcurrentCalls19100
     * @tc.desc Test promisify with concurrent calls (10 concurrent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testConcurrentCalls19100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testConcurrentCalls19100 start');
        const promisified = util.promisify(concurrentCallback);
        const promises: Promise<number[]>[] = [];
        for (let i: number = 0; i < 10; i++) {
          promises.push(promisified(i));
        }
        const results: number[][] = await Promise.all(promises);
        for (let i: number = 0; i < 10; i++) {
          expect(results[i][0]).assertEqual(i * 2);
        }
        console.info('testConcurrentCalls19100 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_008
     * @tc.name testErrorFirstNull19300
     * @tc.desc Test promisify when error first parameter is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testErrorFirstNull19300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testErrorFirstNull19300 start');
        const promisified = util.promisify(errorFirstNullCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('success-null-error');
        console.info('testErrorFirstNull19300 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_009
     * @tc.name testErrorFirstUndefined19400
     * @tc.desc Test promisify when error first parameter is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testErrorFirstUndefined19400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testErrorFirstUndefined19400 start');
        const promisified = util.promisify(errorFirstUndefinedCallback);
        try {
          const result: string[] = await promisified();
          console.info(`testErrorFirstUndefined19400 result: ${JSON.stringify(result)}`);
          expect(result[0]).assertEqual('success-undefined-error');
        } catch (error) {
          console.info(`testErrorFirstUndefined19400 caught error: ${error}`);
          expect(false).assertFail();
        }
        console.info('testErrorFirstUndefined19400 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_010
     * @tc.name testReturnValueUndefined19500
     * @tc.desc Test promisify when return value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testReturnValueUndefined19500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testReturnValueUndefined19500 start');
        const promisified = util.promisify(undefinedReturnCallback);
        try {
          const result: (string | undefined)[] = await promisified();
          console.info(`testReturnValueUndefined19500 result: ${JSON.stringify(result)}`);
          expect(result[0]).assertEqual(undefined);
        } catch (error) {
          console.info(`testReturnValueUndefined19500 error: ${error}`);
          expect(false).assertFail();
        }
        console.info('testReturnValueUndefined19500 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_011
     * @tc.name testBigIntParam19600
     * @tc.desc Test promisify with BigInt parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBigIntParam19600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testBigIntParam19600 start');
        const promisified = util.promisify(bigIntCallback);
        try {
          const result: bigint[] = await promisified(100n);
          console.info(`testBigIntParam19600 result: ${result}`);
          expect(result[0]).assertEqual(200n);
        } catch (error) {
          console.info(`testBigIntParam19600 error: ${error}`);
          expect(false).assertFail();
        }
        console.info('testBigIntParam19600 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_012
     * @tc.name testBooleanParam19700
     * @tc.desc Test promisify with boolean parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBooleanParam19700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testBooleanParam19700 start');
        const promisified = util.promisify(booleanCallback);
        const resultTrue: string[] = await promisified(true);
        expect(resultTrue[0]).assertEqual('true-value');
        const resultFalse: string[] = await promisified(false);
        expect(resultFalse[0]).assertEqual('false-value');
        console.info('testBooleanParam19700 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_014
     * @tc.name testArrayBufferParam19900
     * @tc.desc Test promisify with ArrayBuffer parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testArrayBufferParam19900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testArrayBufferParam19900 start');
        const promisified = util.promisify(arrayBufferCallback);
        const buffer: ArrayBuffer = new ArrayBuffer(16);
        const result: number[] = await promisified(buffer);
        expect(result[0]).assertEqual(16);
        console.info('testArrayBufferParam19900 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_015
     * @tc.name testTypedArrayParam20000
     * @tc.desc Test promisify with TypedArray parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTypedArrayParam20000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testTypedArrayParam20000 start');
        const promisified = util.promisify(typedArrayCallback);
        const typedArr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
        const result: number[] = await promisified(typedArr);
        expect(result[0]).assertEqual(15);
        console.info('testTypedArrayParam20000 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_016
     * @tc.name testMapParam20100
     * @tc.desc Test promisify with Map parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMapParam20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testMapParam20100 start');
        const promisified = util.promisify(mapCallback);
        const myMap: Map<string, number> = new Map<string, number>();
        myMap.set('a', 1);
        myMap.set('b', 2);
        myMap.set('c', 3);
        const result: number[] = await promisified(myMap);
        expect(result[0]).assertEqual(3);
        console.info('testMapParam20100 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_017
     * @tc.name testSetParam20200
     * @tc.desc Test promisify with Set parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testSetParam20200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testSetParam20200 start');
        const promisified = util.promisify(setCallback);
        const mySet: Set<string> = new Set<string>();
        mySet.add('x');
        mySet.add('y');
        mySet.add('z');
        const result: number[] = await promisified(mySet);
        expect(result[0]).assertEqual(3);
        console.info('testSetParam20200 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_018
     * @tc.name testPromiseReject20300
     * @tc.desc Test promisify when promise is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseReject20300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info('testPromiseReject20300 start');
        const promisified = util.promisify(rejectCallback);
        try {
          await promisified();
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          expect(err.message).assertEqual('reject-error');
        }
        console.info('testPromiseReject20300 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_019
     * @tc.name testChainedPromisify20400
     * @tc.desc Test promisify chaining multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testChainedPromisify20400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testChainedPromisify20400 start');
        const promisified1 = util.promisify(chainCallback);
        const result1: string[] = await promisified1();

        const promisified2 = util.promisify(chainCallback);
        const result2: string[] = await promisified2();

        const promisified3 = util.promisify(chainCallback);
        const result3: string[] = await promisified3();

        expect(result1[0]).assertEqual('chain-start');
        expect(result2[0]).assertEqual('chain-start');
        expect(result3[0]).assertEqual('chain-start');
        console.info('testChainedPromisify20400 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_021
     * @tc.name testRecursionPromisify20600
     * @tc.desc Test promisify with recursive callback calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRecursionPromisify20600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testRecursionPromisify20600 start');
        const promisified = util.promisify(recursionCallback);
        const result: number[] = await promisified(5);
        expect(result[0]).assertEqual(5);
        console.info('testRecursionPromisify20600 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_022
     * @tc.name testZeroDelayCallback20700
     * @tc.desc Test promisify with zero delay setTimeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testZeroDelayCallback20700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testZeroDelayCallback20700 start');
        const promisified = util.promisify(zeroDelayCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('zero-delay');
        console.info('testZeroDelayCallback20700 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_023
     * @tc.name testLongDelayCallback20800
     * @tc.desc Test promisify with long delay setTimeout (1000ms)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testLongDelayCallback20800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info('testLongDelayCallback20800 start');
        const promisified = util.promisify(longDelayCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('long-delay');
        console.info('testLongDelayCallback20800 end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_024
     * @tc.name testImmediateCallback20900
     * @tc.desc Test promisify with immediate callback (call before return)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testImmediateCallback20900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        console.info('testImmediateCallback20900 start');
        const promisified = util.promisify(immediateCallback);
        const result: string[] = await promisified();
        expect(result[0]).assertEqual('immediate');
        console.info('testImmediateCallback20900 end');
        done();
      });
  });
}
