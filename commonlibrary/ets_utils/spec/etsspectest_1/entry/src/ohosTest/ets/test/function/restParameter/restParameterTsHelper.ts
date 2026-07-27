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
 * TypeScript helper for rest parameter tests
 * ECMA-262 §15.2.4.2, §15.3.4.3 — function.length and apply
 * ArkTS: no nested functions, no Function.apply/Function.call
 */

export function restLength(): number {
  function f(a: number, b: number, ...rest: number[]): void {}
  return f.length
}

export function sumArrayViaApply(numbers: number[]): number {
  function sum(...args: number[]): number {
    let total: number = 0
    for (let i: number = 0; i < args.length; i++) {
      total = total + args[i]
    }
    return total
  }
  return sum.apply(null, numbers)
}

export function restDestruct(...[a, b]: number[]): number {
  return a + b
}
