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

export async function jsAsyncFunction(): Promise<number> {
  return 42;
}

export const jsAsyncArrow: () => Promise<string> = async (): Promise<string> => {
  return 'js async arrow';
};

class JSClassWithAccessor {
  private _value: number = 0;

  constructor() {
    this._value = 0;
  }

  get id(): number {
    return this._value;
  }

  set id(val: number) {
    this._value = val;
  }

  async method1(): Promise<number> {
    return this._value * 2;
  }
}

export async function jsAsyncWithGetterSetter(): Promise<number> {
  const instance = new JSClassWithAccessor();
  return await instance.method1();
}

export class JSAsyncClass {
  private _x: number = 0;

  constructor() {
    this._x = 0;
  }

  get x(): number {
    return this._x;
  }

  set x(val: number) {
    this._x = val;
  }

  async jsAsyncMethod(): Promise<number> {
    return this._x * 3;
  }
}

export class JSMultipleAccessorClass {
  private _prop1: number = 10;
  private _prop2: number = 20;

  constructor() {
    this._prop1 = 10;
    this._prop2 = 20;
  }

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
