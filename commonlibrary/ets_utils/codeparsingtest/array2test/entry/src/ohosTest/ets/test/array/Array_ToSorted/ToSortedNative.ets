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

type CompareFn<T> = (a: T, b: T) => number;

/** Non-mutating sort copy matching Array.prototype.toSorted on dense arrays. */
export function arrayToSorted<T>(arr: T[], compareFn?: CompareFn<T>): T[] {
  const copy: T[] = arr.slice();
  if (compareFn === undefined) {
    copy.sort();
  } else {
    copy.sort(compareFn);
  }
  return copy;
}
