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

export const exportedSharedArrayBuffer: SharedArrayBuffer = new SharedArrayBuffer(16);

export function exportedSharedArrayBufferFunc(size: number): SharedArrayBuffer {
  return new SharedArrayBuffer(size);
}

export class ExportedSharedArrayBufferClass {
  private _data: SharedArrayBuffer | null = null;

  get data(): number {
    return this._data !== null ? this._data.byteLength : 0;
  }

  set data(value: number) {
    this._data = new SharedArrayBuffer(value);
  }

  getBuffer(): SharedArrayBuffer {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }
}

const defaultBuffer: SharedArrayBuffer = new SharedArrayBuffer(32);
export default defaultBuffer;

export namespace sharedArrayBufferNamespace {
  export function createBuffer(size: number): SharedArrayBuffer {
    return new SharedArrayBuffer(size);
  }

  export class NamespaceBufferClass {
    private _buffer: SharedArrayBuffer = new SharedArrayBuffer(16);

    getBuffer(): SharedArrayBuffer {
      return this._buffer;
    }
  }
}