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

export function tsCallbackFunction(callback: (err: Error | null, result: CallbackResult) => void): void {
  setTimeout(() => {
    callback(null, { value: 'ts-success' });
  }, 10);
}

export function tsErrorCallback(callback: (err: Error | null, result: CallbackResult) => void): void {
  setTimeout(() => {
    callback(new Error('ts-error'), { value: '' });
  }, 10);
}

export function tsMultiParamCallback(
  a: number,
  b: string,
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    callback(null, a + b.length);
  }, 10);
}

export class TSCallbackClass {
  public value: number = 0;

  public callbackMethod(callback: (err: Error | null, result: number) => void): void {
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

  public methodAfterGetter(callback: (err: Error | null, result: string) => void): void {
    setTimeout(() => {
      callback(null, 'after-getter');
    }, 10);
  }

  public methodAfterSetter(callback: (err: Error | null, result: string) => void): void {
    setTimeout(() => {
      callback(null, 'after-setter');
    }, 10);
  }

  public static staticCallbackMethod(callback: (err: Error | null, result: string) => void): void {
    setTimeout(() => {
      callback(null, 'static-result');
    }, 10);
  }
}

export function tsGenericCallback<T>(value: T, callback: (err: Error | null, result: T) => void): void {
  setTimeout(() => {
    callback(null, value);
  }, 10);
}

export interface ICallbackInterface {
  callbackMethod(callback: (err: Error | null, result: string) => void): void;
}

export class TSCallbackImpl implements ICallbackInterface {
  public callbackMethod(callback: (err: Error | null, result: string) => void): void {
    setTimeout(() => {
      callback(null, 'ts-impl-success');
    }, 10);
  }
}

export default function tsDefaultCallback(callback: (err: Error | null, result: string) => void): void {
  setTimeout(() => {
    callback(null, 'default-export');
  }, 10);
}

// ArkTS不支持this参数的独立函数，移到TS文件
export function callbackWithThis(
  this: { value: number },
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    callback(null, this.value * 2);
  }, 10);
}

export interface ThisContext {
  value: number;
}

export function bindTestCallback(
  this: ThisContext,
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    callback(null, this.value * 3);
  }, 10);
}

// 提供call方法的包装函数
export function callCallbackWithThis(
  context: ThisContext,
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    callback(null, context.value * 2);
  }, 10);
}

export function callBindTestCallback(
  context: ThisContext,
  callback: (err: Error | null, result: number) => void
): void {
  setTimeout(() => {
    callback(null, context.value * 3);
  }, 10);
}

// ArkTS不支持索引签名，移到TS文件
export interface ComputedObject {
  [key: string]: (callback: (err: Error | null, result: string) => void) => void;
}

export function createComputedObject(methodName: string): ComputedObject {
  return {
    [methodName]: (callback: (err: Error | null, result: string) => void): void => {
      setTimeout(() => {
        callback(null, 'computed-property');
      }, 10);
    }
  };
}

export function customMethodDecorator(
  target: Object,
  propertyKey: string,
  descriptor: PropertyDescriptor
): PropertyDescriptor {
  return descriptor;
}

export function customDecoratorWithParam(param: string): MethodDecorator {
  return (target: Object, propertyKey: string, descriptor: PropertyDescriptor): PropertyDescriptor => {
    return descriptor;
  };
}

export function customClassDecorator<T extends { new (...args: any[]): {} }>(
  constructor: T
): T {
  return constructor;
}

export function wrapperDecorator(
  target: Object,
  propertyKey: string,
  descriptor: PropertyDescriptor
): PropertyDescriptor {
  const originalMethod: Function = descriptor.value as Function;
  descriptor.value = function(...args: any[]): any {
    return originalMethod.apply(this, args);
  };
  return descriptor;
}