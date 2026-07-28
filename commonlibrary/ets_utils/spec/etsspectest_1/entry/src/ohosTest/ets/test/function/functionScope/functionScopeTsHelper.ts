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

export function getNestedValue(): number {
  let a: number = 5
  function inner(): number {
    return a + 3
  }
  return inner()
}

export function testShadowing(): boolean {
  let x: number = 1
  function inner(): number {
    let x: number = 2
    return x
  }
  return inner() === 2 && x === 1
}

export function testCatchErrorCapture(): string {
  let result: string = ''
  try {
    throw new Error('caught')
  } catch (e) {
    let fn = () => (e as Error).message
    result = fn()
  }
  return result
}
