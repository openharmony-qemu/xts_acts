/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

export function shareTypeTask0001(data: ConcatArray<number>): ConcatArray<number> {
  return data.slice(0, 1);
}

export function shareTypeTask0002(data: Array<number>): Array<number> {
  data.push(1);
  return data;
}

export function shareTypeTask0003(data: Map<string, string>): Map<string, string> {
  data.set('key', 'value');
  return data;
}

export function shareTypeTask0004(data: Set<number>): Set<number> {
  data.add(1);
  return data;
}

// export function shareTypeTask0005(data: BitVector): BitVector {
//   data.push(1);
//   return data;
// }

export function shareTypeTask0006(data: AsyncLock): AsyncLock {
  data.lockAsync(() => {
  });
  return data;
}

export class SendableClass {
  count_: number = 0;
  static count: number = 1;

  static getPromiseCount(): number {
    return SendableClass.count;
  }
}

export function shareTypeTask0008(data: number): number {
  data = 1;
  return data;
}

export function SendableFunc(): boolean {
  console.info(`SendableFunc done`);
  return true;
}

export function shareTypeTaskFun(data: Function): Function {
  data!.unsafeCall();
  return data;
}

export function shareTypeTask0011(data: SendableClass): SendableClass {
  data.count_ = 1;
  return data;
}

export function shareTypeTask0013(data: number): number {
  return data + 1;
}

export type unionType = string | number | boolean

export function shareTypeTask0016(data: unionType): unionType {
  data = true;
  return data;
}

export class CustomizeClass {
  name: string = 'CustomizeClass';
  count: number = 0;
  sendable: SendableClass = new SendableClass();
}

export function shareTypeTask0017(data: CustomizeClass): CustomizeClass {
  data.sendable.count_ = 1;
  return data;
}