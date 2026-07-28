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

// Original .js helper converted to .ets.
// ArkTS-Sta does not support async generators (async function*); the async
// generator jsAsyncGenerator is converted to an async function returning the
// first yielded value, preserving the "is async/Promise" intent.

export async function jsAsyncFunction(): Promise<string> {
  return 'JS async function result';
}

export const jsAsyncArrowFunction: () => Promise<number> = async (): Promise<number> => {
  return 42;
};

export async function jsAsyncGenerator(): Promise<string> {
  return 'first';
}

export class JSTestClass {
  public value: number = 0;

  async asyncMethod(): Promise<string> {
    return 'JS async method';
  }

  get prop(): number {
    return this.value;
  }

  set prop(val: number) {
    this.value = val;
  }

  async asyncMethodAfterGetSet(): Promise<string> {
    return 'JS async after get/set';
  }
}

export class JSTestComplexClass {
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

export class JSTestStaticClass {
  static async staticAsyncMethod(): Promise<string> {
    return 'JS static async';
  }
}

export class JSTestDynamicClass {
  public dynamicMethod: () => Promise<string> = async (): Promise<string> => {
    return 'default';
  };

  constructor() {
    this.dynamicMethod = async (): Promise<string> => {
      return 'dynamic async method';
    };
  }

  async normalAsyncMethod(): Promise<string> {
    return 'normal async method';
  }
}

export function jsPromiseBasedMethod(): Promise<string> {
  return Promise.resolve('JS promise-based method');
}
