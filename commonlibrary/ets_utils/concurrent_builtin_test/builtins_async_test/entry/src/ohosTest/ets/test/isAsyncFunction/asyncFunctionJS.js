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

export async function jsAsyncFunction() {
  return 42;
}

export const jsAsyncArrow = async () => {
  return 'js async arrow';
};

export async function jsAsyncWithGetterSetter() {
  class JSClassWithAccessor {
    constructor() {
      this._value = 0;
    }
    
    get id() {
      return this._value;
    }
    
    set id(val) {
      this._value = val;
    }
    
    async method1() {
      return this._value * 2;
    }
  }
  
  const instance = new JSClassWithAccessor();
  return await instance.method1();
}

export class JSAsyncClass {
  constructor() {
    this._x = 0;
  }
  
  get x() {
    return this._x;
  }
  
  set x(val) {
    this._x = val;
  }
  
  async jsAsyncMethod() {
    return this._x * 3;
  }
}

export async function* jsAsyncGenerator() {
  yield 1;
  yield 2;
  yield 3;
}

export class JSMultipleAccessorClass {
  constructor() {
    this._prop1 = 10;
    this._prop2 = 20;
  }
  
  get prop1() {
    return this._prop1;
  }
  
  set prop1(val) {
    this._prop1 = val;
  }
  
  async method1() {
    return this._prop1;
  }
  
  get prop2() {
    return this._prop2;
  }
  
  set prop2(val) {
    this._prop2 = val;
  }
  
  async method2() {
    return this._prop2;
  }
}

