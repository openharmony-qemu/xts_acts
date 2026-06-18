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

@Sendable
export class SendablePromiseClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  sendablePromiseMethod(): Promise<number> {
    return new Promise<number>((resolve: Function) => {
      resolve(this._value * 2);
    }).then((v: number): number => {
      return v + 10;
    });
  }
}

@Sendable
export function sendablePromiseFunc(): Promise<string> {
  return new Promise<string>((resolve: Function) => {
    resolve('sendable');
  }).then((v: string): string => {
    return v + '-chain';
  });
}

@Sendable
export class SendableMultiplePromiseClass {
  private _x: number = 0;
  private _y: number = 0;

  get x(): number {
    return this._x;
  }

  set x(val: number) {
    this._x = val;
  }

  sendablePromiseMethod1(): Promise<number> {
    return new Promise<number>((resolve: Function) => {
      resolve(this._x);
    }).then((v: number): number => {
      return v * 3;
    });
  }

  get y(): number {
    return this._y;
  }

  set y(val: number) {
    this._y = val;
  }

  sendablePromiseMethod2(): Promise<number> {
    return new Promise<number>((resolve: Function) => {
      resolve(this._y);
    }).then((v: number): number => {
      return v + 20;
    });
  }
}