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

export function createSharedArrayBufferJS(size) {
  return new SharedArrayBuffer(size);
}

export function getSharedArrayBufferMethodJS() {
  return new SharedArrayBuffer(16);
}

export class SharedArrayBufferClassJS {
  constructor() {
    this._data = null;
  }

  get data() {
    return this._data !== null ? this._data.byteLength : 0;
  }

  set data(value) {
    this._data = new SharedArrayBuffer(value);
  }

  getMethodAfterGetSet() {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }
}