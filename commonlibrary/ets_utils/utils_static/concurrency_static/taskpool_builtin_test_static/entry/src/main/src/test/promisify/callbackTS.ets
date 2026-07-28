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

export interface CallbackResult {
  value: string;
}

export function tsCallbackFunction(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    const result: CallbackResult = { value: 'ts-success' };
    callback(null, result);
  }, 100);
}

export function tsErrorCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    const result: CallbackResult = { value: '' };
    callback(new Error('ts-error'), result);
  }, 100);
}

export function tsMultiParamCallback(
  a: int,
  b: string,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, a + b.length);
  }, 100);
}

export class TSCallbackClass {
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
      callback(null, 'after-getter');
    }, 100);
  }

  public methodAfterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'after-setter');
    }, 100);
  }

  public static staticCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'static-result');
    }, 100);
  }
}

export function tsGenericCallback<T>(value: T, callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, value);
  }, 100);
}

export interface ICallbackInterface {
  callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void;
}

export class TSCallbackImpl implements ICallbackInterface {
  public callbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'ts-impl-success');
    }, 100);
  }
}

export default function tsDefaultCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'default-export');
  }, 100);
}

export interface ThisContext {
  value: int;
}

export function callCallbackWithThis(
  context: ThisContext,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, context.value * 2);
  }, 100);
}

export function callBindTestCallback(
  context: ThisContext,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, context.value * 3);
  }, 100);
}

export class ComputedObject {
  public callbackMethod: (callback: (err: Error | null, ...value: FixedArray<Any>) => void) => void;

  constructor() {
    this.callbackMethod = (callback: (err: Error | null, ...value: FixedArray<Any>) => void): void => {
      setTimeout(() => {
        callback(null, 'computed-property');
      }, 100);
    };
  }
}

export function createComputedObject(methodName: string): ComputedObject {
  return new ComputedObject();
}
