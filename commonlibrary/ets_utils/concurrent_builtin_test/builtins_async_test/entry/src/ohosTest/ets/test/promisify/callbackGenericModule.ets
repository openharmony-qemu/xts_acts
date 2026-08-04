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

export function genericCallback<T>(value: T, callback: (err: Error | null, result: T) => void): void {
  setTimeout(() => {
    callback(null, value);
  }, 10);
}

export function multiGenericCallback<T, U>(
  value1: T,
  value2: U,
  callback: (err: Error | null, result: string) => void
): void {
  setTimeout(() => {
    callback(null, `${String(value1)}-${String(value2)}`);
  }, 10);
}

export class GenericCallbackClass<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  public callbackMethod(callback: (err: Error | null, result: T) => void): void {
    setTimeout(() => {
      callback(null, this.value);
    }, 10);
  }
}

export function constrainedGenericCallback<T extends number>(
  value: T,
  callback: (err: Error | null, result: T) => void
): void {
  setTimeout(() => {
    callback(null, value);
  }, 10);
}