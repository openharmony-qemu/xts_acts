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
export async function tsAsyncFunc(): Promise<string> {
  return 'ts-async';
}

export let tsAsyncArrowFunc: () => Promise<number> = async (): Promise<number> => {
  return 456;
};

export interface TsReturnObject {
  name: string;
  value: number;
}

export class TsTestClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async asyncMethodAfterGetterSetter(): Promise<number> {
    return this._value * 10;
  }

  async asyncMethodBeforeGetter(): Promise<string> {
    return 'before-getter-ts';
  }

  static async staticAsyncMethod(): Promise<string> {
    return 'ts-static-async';
  }
}

export async function tsAsyncFuncMultiParams(a: number, b: string, c: boolean): Promise<string> {
  return `${a}-${b}-${c}`;
}

export async function tsAsyncFuncReturnObject(): Promise<TsReturnObject> {
  const result: TsReturnObject = { name: 'ts-object', value: 123 };
  return result;
}

export class TsTestClassComplex {
  private _data: string = 'data';
  private _count: number = 0;

  get data(): string {
    return this._data;
  }

  set data(val: string) {
    this._data = val;
  }

  async asyncMethod1(): Promise<string> {
    return this._data;
  }

  get count(): number {
    return this._count;
  }

  set count(val: number) {
    this._count = val;
  }

  async asyncMethod2(): Promise<number> {
    return this._count;
  }
}
