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

// Original .ts helper converted to .ets.
// ArkTS-Sta does not support async generators (async function*); tsAsyncGenerator
// is converted to an async function returning the first yielded value.
// Generic arrow async (tsGenericArrowAsync) is converted to a top-level generic
// async function declaration (generic arrow functions are not supported in Sta).

export async function tsAsyncFunction(): Promise<string> {
  return 'TS async function result';
}

export const tsAsyncArrowFunction: () => Promise<number> = async (): Promise<number> => {
  return 42;
};

export async function tsAsyncGenerator(): Promise<string> {
  return 'first';
}

export class TSTestClass {
  public value: number = 0;

  async asyncMethod(): Promise<string> {
    return 'TS async method';
  }

  get prop(): number {
    return this.value;
  }

  set prop(val: number) {
    this.value = val;
  }

  async asyncMethodAfterGetSet(): Promise<string> {
    return 'TS async after get/set';
  }
}

export class TSTestComplexClass {
  async method1(): Promise<string> {
    return 'method1';
  }

  get prop1(): number {
    return 1;
  }

  async method2(): Promise<number> {
    return 2;
  }

  set prop2(val: number) {
    console.info('prop2 set');
  }

  async method3(): Promise<boolean> {
    return true;
  }
}

export class TSTestStaticClass {
  static async staticAsyncMethod(): Promise<string> {
    return 'TS static async';
  }
}

export class TSTestGenericClass<T> {
  async genericAsyncMethod(param: T): Promise<T> {
    return param;
  }
}

export async function tsGenericAsyncFunction<T>(param: T): Promise<T> {
  return param;
}

export interface TSTestInterface {
  asyncMethod(): Promise<string>;
}

export class TSTestInterfaceImpl implements TSTestInterface {
  async asyncMethod(): Promise<string> {
    return 'interface implementation';
  }
}

export async function tsGenericArrowAsync<T>(param: T): Promise<T> {
  return param;
}

export async function tsMultiGenericAsync<T, U>(param1: T, param2: U): Promise<[T, U]> {
  return [param1, param2] as [T, U];
}

export async function tsConstrainedGenericAsync<T extends number>(param: T): Promise<T> {
  return param as T;
}
