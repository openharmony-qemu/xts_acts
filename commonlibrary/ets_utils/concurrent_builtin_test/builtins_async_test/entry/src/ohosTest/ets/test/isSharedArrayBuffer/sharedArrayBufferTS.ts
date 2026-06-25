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

export function createSharedArrayBufferTS(size: number): SharedArrayBuffer {
  return new SharedArrayBuffer(size);
}

export function getSharedArrayBufferMethodTS(): SharedArrayBuffer {
  return new SharedArrayBuffer(16);
}

export class SharedArrayBufferClassTS {
  private _data: SharedArrayBuffer | null = null;

  get data(): number {
    return this._data !== null ? this._data.byteLength : 0;
  }

  set data(value: number) {
    this._data = new SharedArrayBuffer(value);
  }

  getMethodAfterGetSet(): SharedArrayBuffer {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }
}

export class SharedArrayBufferStaticTS {
  private static _instance: SharedArrayBuffer | null = null;

  static getSharedArrayBuffer(): SharedArrayBuffer {
    if (SharedArrayBufferStaticTS._instance === null) {
      SharedArrayBufferStaticTS._instance = new SharedArrayBuffer(16);
    }
    return SharedArrayBufferStaticTS._instance;
  }
}

export function createTestSymbol(): symbol {
  return Symbol('test');
}

export interface DynamicObjectTS {
  [key: string]: SharedArrayBuffer | number;
}

export function createDynamicObject(buffer: SharedArrayBuffer): DynamicObjectTS {
  const obj: DynamicObjectTS = {
    value: 42
  };
  obj.buffer = buffer;
  return obj;
}