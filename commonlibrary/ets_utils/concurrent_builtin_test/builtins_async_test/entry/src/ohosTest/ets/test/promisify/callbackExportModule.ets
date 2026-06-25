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

export function exportedCallback(callback: (err: Error | null, result: string) => void): void {
  setTimeout(() => {
    callback(null, 'exported-callback');
  }, 10);
}

export function exportedMultiParamCallback(
  a: number,
  b: string,
  callback: (err: Error | null, result: string) => void
): void {
  setTimeout(() => {
    callback(null, `${a}-${b}`);
  }, 10);
}

export function exportedDefaultParamCallback(
  a: number,
  b: string = 'default',
  callback: (err: Error | null, result: string) => void
): void {
  setTimeout(() => {
    callback(null, `${a}-${b}`);
  }, 10);
}

export class ExportedCallbackClass {
  public value: number = 0;

  public callbackMethod(callback: (err: Error | null, result: number) => void): void {
    setTimeout(() => {
      callback(null, this.value * 2);
    }, 10);
  }

  public get dataValue(): number {
    return this.value;
  }

  public set dataValue(val: number) {
    this.value = val;
  }

  public methodAfterGetter(callback: (err: Error | null, result: string) => void): void {
    setTimeout(() => {
      callback(null, 'exported-after-getter');
    }, 10);
  }

  public methodAfterSetter(callback: (err: Error | null, result: string) => void): void {
    setTimeout(() => {
      callback(null, 'exported-after-setter');
    }, 10);
  }

  public static staticCallbackMethod(callback: (err: Error | null, result: string) => void): void {
    setTimeout(() => {
      callback(null, 'exported-static');
    }, 10);
  }
}

export default function defaultExportedCallback(callback: (err: Error | null, result: string) => void): void {
  setTimeout(() => {
    callback(null, 'default-exported-callback');
  }, 10);
}