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

// 静态等价模块：动态 sharedArrayBufferExportModule.ets 中 SharedArrayBuffer -> ArrayBuffer；
// 动态 namespace（sharedArrayBufferNamespace）为静态模型禁用语法，已移除，
// 其测试点由模块顶层导出函数/类覆盖。

export const exportedArrayBuffer: ArrayBuffer = new ArrayBuffer(16);

export function exportedArrayBufferFunc(size: int): ArrayBuffer {
  return new ArrayBuffer(size);
}

export class ExportedArrayBufferClass {
  private _data: ArrayBuffer | null = null;

  get data(): int {
    const data: ArrayBuffer | null = this._data;
    return data !== null ? data.byteLength : 0;
  }

  set data(value: int) {
    this._data = new ArrayBuffer(value);
  }

  getBuffer(): ArrayBuffer {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data;
  }
}

const defaultArrayBuffer: ArrayBuffer = new ArrayBuffer(32);
export default defaultArrayBuffer;
