'use static';
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

export async function genericAsyncFunc<T>(value: T): Promise<T> {
  return value;
}

export async function genericAsyncArrow<T>(value: T): Promise<T> {
  return value;
}

export class GenericAsyncClass<T> {
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

  async genericAsyncMethod(): Promise<T> {
    return this._value;
  }
}

export async function multiGenericAsync<K, V>(key: K, value: V): Promise<Map<K, V>> {
  const map = new Map<K, V>();
  map.set(key, value);
  return map;
}

export interface HasLength {
  length: number;
}

export class ConstrainedGenericAsyncClass {
  get id(): number {
    return 0;
  }

  async constrainedGenericMethod<T extends HasLength>(data: T): Promise<number> {
    return data.length;
  }
}
