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

class GenericBase<T> {
  value: T

  constructor(v: T) {
    this.value = v
  }
}

class GenericSuperChild<T> extends GenericBase<T> {
  constructor(v: T) {
    super(v)
  }
}

export function testGenericSuperCtor(): number {
  let obj = new GenericSuperChild<number>(42)
  return obj.value
}

/*
 * super(...args) spread passing -- rest params in derived constructor may be restricted in ArkTS
 */
class SpreadBase {
  value1: number
  value2: string

  constructor(v1: number, v2: string) {
    this.value1 = v1
    this.value2 = v2
  }
}

class SpreadChild extends SpreadBase {
  constructor(...args: [number, string]) {
    super(...args)
  }
}

export function testSuperSpreadArgs(): string {
  let obj = new SpreadChild(10, "x")
  return String(obj.value1) + "|" + obj.value2
}
