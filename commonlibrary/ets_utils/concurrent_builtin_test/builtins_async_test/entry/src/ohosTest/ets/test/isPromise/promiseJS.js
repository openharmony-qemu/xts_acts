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

export async function jsAsyncFunction() {
  return 'JS async function result';
}

export const jsAsyncArrowFunction = async () => {
  return 42;
};

export async function* jsAsyncGenerator() {
  yield 'first';
  yield 'second';
  yield 'third';
}

export class JSTestClass {
  constructor() {
    this.value = 0;
  }

  async asyncMethod() {
    return 'JS async method';
  }

  get prop() {
    return this.value;
  }

  set prop(val) {
    this.value = val;
  }

  async asyncMethodAfterGetSet() {
    return 'JS async after get/set';
  }
}

export class JSTestComplexClass {
  async method1() {
    return 'method1';
  }

  get prop1() {
    return 1;
  }

  async method2() {
    return 2;
  }

  set prop2(val) {
    console.log('prop2 set');
  }

  async method3() {
    return true;
  }
}

export class JSTestStaticClass {
  static async staticAsyncMethod() {
    return 'JS static async';
  }
}

export class JSTestDynamicClass {
  constructor() {
    this.dynamicMethod = async () => {
      return 'dynamic async method';
    };
  }

  async normalAsyncMethod() {
    return 'normal async method';
  }
}

export function jsPromiseBasedMethod() {
  return Promise.resolve('JS promise-based method');
}