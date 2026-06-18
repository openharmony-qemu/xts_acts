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

export async function exportedAsyncFunc(): Promise<number> {
  return 42;
}

export const exportedAsyncArrow = async (): Promise<string> => {
  return 'exported';
};

export async function exportedAsyncWithGetterSetter(): Promise<number> {
  return 100;
}

export class ExportedAsyncClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async exportedClassAsyncMethod(): Promise<number> {
    return this._value * 2;
  }
}

// Generator functions moved to TS file (isAsyncFunctionAdvanced.ts)
// export async function* exportedAsyncGenerator(): AsyncGenerator<number, void, unknown> {
//   yield 1;
//   yield 2;
// }

export class ExportedMultipleAccessorClass {
  private _prop1: number = 10;
  private _prop2: number = 20;

  get prop1(): number {
    return this._prop1;
  }

  set prop1(val: number) {
    this._prop1 = val;
  }

  async method1(): Promise<number> {
    return this._prop1;
  }

  get prop2(): number {
    return this._prop2;
  }

  set prop2(val: number) {
    this._prop2 = val;
  }

  async method2(): Promise<number> {
    return this._prop2;
  }
}

export default async function defaultExportedAsync(): Promise<string> {
  return 'default exported';
}