/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import util from '@ohos.util';

export function StringToUint8Array(str: string): Uint8Array {
  let textEncoder = new util.TextEncoder();
  return textEncoder.encodeInto(str);
}

export function Uint8ArrayToString(arr: Uint8Array): string {
  let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
  return textDecoder.decodeWithStream(arr, { stream: false });
}

export function GetDataBySize(size: number): string {
  return ''.padEnd(size, "x");
}