'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

export function isPositive103(value: number): boolean {
  return value > 0.0;
}
export function predFn005(value: number, index: int, array: Float64Array): boolean {
  return value > 3.0;
}

export function setFlagFn(): void {
  // external flag modifier
}
export function double107(x: number): number {
  return x * 2.0;
}
export function everyPred003(value: number, index: int, array: Float64Array): boolean {
  return value > 0.0;
}
export function predFn004(value: number, index: int, array: Float64Array): boolean {
  return value > 1.5;
}
export function predFn002(value: number, index: int, array: Float64Array): boolean {
  return value > 1.0;
}

export function extFn030(x: number): number {
  return x * 2.0;
}

export function recPred032(value: number, index: int, array: Float64Array): boolean {
  return value > 1.0;
}

export class CustomError004 extends Error {
  constructor(msg: string) {
    super(msg);
  }
}
export function forEachHandler004(value: number, index: int, array: Float64Array): void {
  // named function for callback test - logic handled in test body
}
export default class Utils{
  static async msSleep(count: int): Promise<int> {
    if (count <= 0) {
      return 0;
    }
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }
  static checkIsFloat64Array(obj: Object): boolean {
    return obj instanceof Float64Array;
  }
}
