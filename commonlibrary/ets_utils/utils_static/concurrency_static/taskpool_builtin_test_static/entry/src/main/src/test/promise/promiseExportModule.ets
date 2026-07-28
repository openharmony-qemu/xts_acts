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

export function exportedPromiseFunc(): Promise<string> {
  return Promise.resolve<string>('exported')
    .then((v: string): string => {
      return v + '-chain';
    });
}

export const exportedPromiseArrow: () => Promise<number> = (): Promise<number> => {
  return Promise.resolve<number>(42)
    .then((v: number): number => {
      return v * 2;
    });
};

export function exportedPromiseWithGetterSetter(): Promise<number> {
  return Promise.resolve<number>(10)
    .then((v: number): number => {
      return v + 5;
    });
}

export class ExportedPromiseClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  exportedPromiseMethod(): Promise<string> {
    return Promise.resolve<string>('class')
      .then((v: string): string => {
        return v + '-method';
      });
  }
}

export class ExportedMultiplePromiseClass {
  private _x: number = 0;
  private _y: number = 0;

  get x(): number {
    return this._x;
  }

  set x(val: number) {
    this._x = val;
  }

  promiseMethod1(): Promise<number> {
    return Promise.resolve<number>(this._x)
      .then((v: number): number => {
        return v * 2;
      });
  }

  get y(): number {
    return this._y;
  }

  set y(val: number) {
    this._y = val;
  }

  promiseMethod2(): Promise<number> {
    return Promise.resolve<number>(this._y)
      .then((v: number): number => {
        return v + 10;
      });
  }
}

export default exportedPromiseFunc;
