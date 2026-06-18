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

export async function* jsAsyncGenerator() {
  yield 1;
  yield 2;
}

export class JSGeneratorClass {
  constructor() {
    this._value = 0;
  }

  get id() {
    return this._value;
  }

  set id(val) {
    this._value = val;
  }

  async* methodGenerator() {
    yield this._value;
  }
}

export function jsWrapperFunc() {
  const nestedAsync = async () => {
    return 42;
  };
  return nestedAsync;
}

export class JSNestedFuncClass {
  constructor() {
    this._id = 0;
  }

  get id() {
    return this._id;
  }

  createNestedAsync() {
    return async () => 'nested';
  }
}

export const jsDynamicProperty = {
  ['dynamic' + 'Async']: async () => 99
};

export const jsBindAsyncFunc = (() => {
  const originalAsync = async (x) => x * 2;
  return originalAsync.bind(null, 10);
})();

JSGeneratorClass.prototype.prototypeAsyncMethod = async function() {
  return 100;
};

export const jsForInObject = {
  method1: async () => 1,
  method2: async () => 2,
  method3: async () => 3
};

export class JSPrivateFieldClass {
  #privateValue = 100;

  get publicValue() {
    return this.#privateValue;
  }

  async getPrivateValue() {
    return this.#privateValue;
  }

  async setPrivateValue(val) {
    this.#privateValue = val;
  }
}