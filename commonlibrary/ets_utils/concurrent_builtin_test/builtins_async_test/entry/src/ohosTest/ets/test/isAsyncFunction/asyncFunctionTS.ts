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

export function tsAsyncFunction(): Promise<number> {
  return new Promise<number>((resolve) => {
    resolve(42);
  });
}

export const tsAsyncArrow = async (): Promise<string> => {
  return 'ts async arrow';
};

export async function tsAsyncWithGetterSetter(): Promise<number> {
  class TSClassWithAccessor {
    private _value: number = 0;
    
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
  
  const instance = new TSClassWithAccessor();
  return await instance.method1();
}

export class TSAsyncClass {
  private _x: number = 0;
  
  get x(): number {
    return this._x;
  }
  
  set x(val: number) {
    this._x = val;
  }
  
  async tsAsyncMethod(): Promise<number> {
    return this._x * 3;
  }
}

export async function* tsAsyncGenerator(): AsyncGenerator<number, void, unknown> {
  yield 1;
  yield 2;
  yield 3;
}

export class TSMultipleAccessorClass {
  private _prop1: number = 10;
  private _prop2: number = 20;
  
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

export async function* asyncGeneratorFunc(): AsyncGenerator<number, void, unknown> {
  yield 1;
  yield 2;
  yield 3;
}

export const asyncGeneratorArrow = async function* (): AsyncGenerator<string, void, unknown> {
  yield 'a';
  yield 'b';
};

export class TSGeneratorClass {
  private _value: number = 0;

  get id(): number {
    return this._value;
  }

  set id(val: number) {
    this._value = val;
  }

  async* methodGenerator(): AsyncGenerator<number, void, unknown> {
    yield this._value;
    yield this._value * 2;
  }
}

export function wrapperFunc(): () => Promise<number> {
  const nestedAsync = async (): Promise<number> => {
    return 42;
  };
  return nestedAsync;
}

export class TSNestedFuncClass {
  get id(): number {
    return 0;
  }

  createNestedAsync(): () => Promise<string> {
    return async (): Promise<string> => 'nested';
  }
}

export const computedPropertyAsync = {
  ['dynamic' + 'Method']: async (): Promise<number> => 99
};

export const symbolKeyAsync = {
  [Symbol('async')]: async (): Promise<string> => 'symbol'
};

export function bindAsyncFunc(): () => Promise<number> {
  const originalAsync = async (x: number): Promise<number> => x * 2;
  return originalAsync.bind(null, 10);
}

export class TSPrototypeClass {
  get id(): number {
    return 0;
  }
}

// Prototype extension not supported in ArkTS
// TSPrototypeClass.prototype.prototypeAsyncMethod removed

export const forInObject: Record<string, () => Promise<number>> = {
  method1: async () => 1,
  method2: async () => 2,
  method3: async () => 3
};