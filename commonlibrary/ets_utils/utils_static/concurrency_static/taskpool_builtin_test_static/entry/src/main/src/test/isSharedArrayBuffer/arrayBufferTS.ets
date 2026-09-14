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

// 静态等价模块：动态 sharedArrayBufferTS.ts 中 SharedArrayBuffer -> ArrayBuffer；
// 动态专属 Symbol（createTestSymbol）与索引签名接口（DynamicObjectTS）在静态模型中
// 不适用，已在主测试中改为显式类型化等价设计，不在此模块重复提供。

export function createArrayBufferTS(size: int): ArrayBuffer {
  return new ArrayBuffer(size);
}

export function getArrayBufferMethodTS(): ArrayBuffer {
  return new ArrayBuffer(16);
}

export class ArrayBufferClassTS {
  private _data: ArrayBuffer | null = null;

  get data(): int {
    const data: ArrayBuffer | null = this._data;
    return data !== null ? data.byteLength : 0;
  }

  set data(value: int) {
    this._data = new ArrayBuffer(value);
  }

  getMethodAfterGetSet(): ArrayBuffer {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data;
  }
}

export class ArrayBufferStaticTS {
  private static _instance: ArrayBuffer | null = null;

  static getArrayBuffer(): ArrayBuffer {
    let instance: ArrayBuffer | null = ArrayBufferStaticTS._instance;
    if (instance === null) {
      instance = new ArrayBuffer(16);
      ArrayBufferStaticTS._instance = instance;
    }
    return instance;
  }
}
