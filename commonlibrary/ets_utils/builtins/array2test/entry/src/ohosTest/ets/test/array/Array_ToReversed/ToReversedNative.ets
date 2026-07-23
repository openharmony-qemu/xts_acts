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

/** Non-mutating reverse copy matching Array.prototype.toReversed on dense arrays. */
export function arrayToReversed<T>(arr: T[]): T[] {
  const len = arr.length;
  const result = new Array<T>(len);
  for (let k = 0; k < len; k++) {
    result[k] = arr[len - 1 - k];
  }
  return result;
}
