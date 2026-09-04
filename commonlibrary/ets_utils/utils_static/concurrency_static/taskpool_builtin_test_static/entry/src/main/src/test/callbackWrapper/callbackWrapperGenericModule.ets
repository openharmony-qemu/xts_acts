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
export async function genericAsyncFunc<T>(value: T): Promise<T> {
  return value;
}

export async function genericAsyncArrowFunc<T>(value: T): Promise<T> {
  return value;
}

export class GenericTestClass<T> {
  private _value: T;

  constructor(value: T) {
    this._value = value;
  }

  get value(): T {
    return this._value;
  }

  set value(val: T) {
    this._value = val;
  }

  async asyncMethodAfterGetterSetter(): Promise<T> {
    return this._value;
  }

  async asyncMethodReturnGeneric(): Promise<T> {
    return this._value;
  }
}

export async function multiGenericAsyncFunc<T, U>(a: T, b: U): Promise<string> {
  return `${a}-${b}`;
}

export async function constrainedGenericAsyncFunc<T extends number>(value: T): Promise<number> {
  return (value as number) * 2;
}

export class MultiGenericTestClass<T, U> {
  private _first: T;
  private _second: U;

  constructor(first: T, second: U) {
    this._first = first;
    this._second = second;
  }

  async asyncMethodMultiGeneric(): Promise<string> {
    return `${this._first}-${this._second}`;
  }
}

export async function genericAsyncFuncDefault<T = string>(value?: T): Promise<T> {
  return value!;
}
