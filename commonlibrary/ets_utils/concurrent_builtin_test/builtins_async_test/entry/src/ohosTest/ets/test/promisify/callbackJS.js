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

export function jsCallbackFunction(callback) {
  setTimeout(() => {
    callback(null, 'js-success');
  }, 10);
}

export function jsErrorCallback(callback) {
  setTimeout(() => {
    callback(new Error('js-error'), null);
  }, 10);
}

export function jsMultiParamCallback(a, b, callback) {
  setTimeout(() => {
    callback(null, a + b);
  }, 10);
}

export class JSCallbackClass {
  constructor() {
    this.value = 0;
  }

  callbackMethod(callback) {
    setTimeout(() => {
      callback(null, this.value * 2);
    }, 10);
  }

  get dataValue() {
    return this.value;
  }

  set dataValue(val) {
    this.value = val;
  }

  methodAfterGetter(callback) {
    setTimeout(() => {
      callback(null, 'js-after-getter');
    }, 10);
  }

  methodAfterSetter(callback) {
    setTimeout(() => {
      callback(null, 'js-after-setter');
    }, 10);
  }

  static staticCallbackMethod(callback) {
    setTimeout(() => {
      callback(null, 'js-static-result');
    }, 10);
  }
}

export default function jsDefaultCallback(callback) {
  setTimeout(() => {
    callback(null, 'js-default-export');
  }, 10);
}