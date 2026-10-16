/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { buffer } from '@kit.ArkTS';

export function StringToUint8Array(value: string): Uint8Array {
  const result: Uint8Array = new Uint8Array(value.length);
  for (let i = 0; i < value.length; i++) {
    result[i] = value.charCodeAt(i) & 0xff;
  }
  return result;
}

export function Uint8ArrayToString(data: Uint8Array): string {
  let result: string = '';
  for (let i = 0; i < data.length; i++) {
    result += String.fromCharCode(data[i]);
  }
  return result;
}

export function IntToUint8Array(value: number): Uint8Array {
  const arrayBuffer: ArrayBuffer = new ArrayBuffer(4);
  const view: DataView = new DataView(arrayBuffer);
  view.setUint32(0, value, true);
  return new Uint8Array(arrayBuffer);
}

export function HexToUint8Array(value: string): Uint8Array {
  if (value.length % 2 !== 0) {
    throw new Error('The hex string length must be even.');
  }
  const result: Uint8Array = new Uint8Array(value.length / 2);
  for (let i = 0; i < result.length; i++) {
    const high: number = Number.parseInt(value.substring(i * 2, i * 2 + 1), 16);
    const low: number = Number.parseInt(value.substring(i * 2 + 1, i * 2 + 2), 16);
    if (Number.isNaN(high) || Number.isNaN(low)) {
      throw new Error('The hex string contains an invalid character.');
    }
    result[i] = (high << 4) | low;
  }
  return result;
}

export function Uint8ArrayToHexString(data: Uint8Array): string {
  return buffer.from(data).toString('hex');
}

export function GetDataBySize(size: number): string {
  return 'A'.repeat(size);
}

export async function Sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}
