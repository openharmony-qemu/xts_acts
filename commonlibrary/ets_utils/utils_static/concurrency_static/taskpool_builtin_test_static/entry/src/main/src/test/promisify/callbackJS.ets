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

export function jsCallbackFunction(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'js-success');
  }, 100);
}

export function jsErrorCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(new Error('js-error'), '');
  }, 100);
}

export function jsMultiParamCallback(
  a: int,
  b: int,
  callback: (err: Error | null, ...value: FixedArray<Any>) => void
): void {
  setTimeout(() => {
    callback(null, a + b);
  }, 100);
}

export class JSCallbackClass {
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
      callback(null, 'js-after-getter');
    }, 100);
  }

  public methodAfterSetter(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'js-after-setter');
    }, 100);
  }

  public static staticCallbackMethod(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
    setTimeout(() => {
      callback(null, 'js-static-result');
    }, 100);
  }
}

export default function jsDefaultCallback(callback: (err: Error | null, ...value: FixedArray<Any>) => void): void {
  setTimeout(() => {
    callback(null, 'js-default-export');
  }, 100);
}
