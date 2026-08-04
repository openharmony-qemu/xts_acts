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

export function jsWrapperFunc(): () => Promise<number> {
  const nestedAsync = async (): Promise<number> => {
    return 42;
  };
  return nestedAsync;
}

export class JSNestedFuncClass {
  private _id: number = 0;

  constructor() {
    this._id = 0;
  }

  get id(): number {
    return this._id;
  }

  createNestedAsync(): () => Promise<string> {
    return async (): Promise<string> => 'nested';
  }
}

export interface JsDynamicPropertyObj {
  dynamicAsync: () => Promise<number>;
}

export const jsDynamicProperty: JsDynamicPropertyObj = {
  dynamicAsync: async (): Promise<number> => 99
};

export function jsBindAsyncFunc(): Promise<number> {
  return Promise.resolve(20 as number);
}

export interface JsForInObject {
  method1: () => Promise<number>;
  method2: () => Promise<number>;
  method3: () => Promise<number>;
}

export const jsForInObject: JsForInObject = {
  method1: async (): Promise<number> => 1,
  method2: async (): Promise<number> => 2,
  method3: async (): Promise<number> => 3
};

export class JSPrivateFieldClass {
  private _privateValue: number = 100;

  get publicValue(): number {
    return this._privateValue;
  }

  async getPrivateValue(): Promise<number> {
    return this._privateValue;
  }

  async setPrivateValue(val: number): Promise<void> {
    this._privateValue = val;
  }
}
