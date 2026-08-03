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

export function makeMultiplier(factor: number): (x: number) => number {
  return function(x: number): number {
    return x * factor
  }
}

export function testReassign(): boolean {
  let fn: () => number = function(): number { return 1 }
  let first = fn()
  fn = function(): number { return 2 }
  let second = fn()
  return first === 1 && second === 2
}

export function compose(f: (x: number) => number, g: (x: number) => number, value: number): number {
  return f(g(value))
}

export function add1(x: number): number {
  return x + 1
}

export function dbl(x: number): number {
  return x * 2
}
