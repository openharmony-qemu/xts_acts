/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/** Element-wise equality for dense arrays (replaces JS same() without Object.is). */
export function arraysSame<T>(a: T[], b: T[]): boolean {
  if (a.length !== b.length) {
    return false;
  }
  for (let i: number = 0; i < a.length; i++) {
    if (a[i] !== b[i]) {
      return false;
    }
  }
  return true;
}

/** Non-mutating splice copy matching Array.prototype.toSpliced on dense arrays. */
export function arrayToSpliced<T>(arr: T[], start?: number, deleteCount?: number, ...items: T[]): T[] {
  const copy: T[] = arr.slice();
  if (start === undefined) {
    return copy;
  }
  if (deleteCount === undefined) {
    if (items.length === 0) {
      copy.splice(start);
    } else {
      copy.splice(start, 0, ...items);
    }
  } else {
    copy.splice(start, deleteCount, ...items);
  }
  return copy;
}
