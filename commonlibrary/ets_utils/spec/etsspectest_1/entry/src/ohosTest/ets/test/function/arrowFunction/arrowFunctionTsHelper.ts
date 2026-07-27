/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * TypeScript helper for arrow function tests
 * ECMA-262 §14.2 Arrow Function Definitions
 * ArkTS: no indexed access on arguments (arkts-no-props-by-index)
 */

export function captureArgs(a: number, b: number): number {
  let fn = () => {
    return arguments[0] + arguments[1]
  }
  return fn()
}
