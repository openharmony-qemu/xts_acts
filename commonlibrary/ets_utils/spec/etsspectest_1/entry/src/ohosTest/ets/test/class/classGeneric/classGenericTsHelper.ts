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

export class Mapper<T> {
  value: T

  constructor(v: T) {
    this.value = v
  }

  map<U>(fn: (v: T) => U): U {
    return fn(this.value)
  }
}

export function testGenericMethod(): string {
  let obj = new Mapper<number>(5)
  let result = obj.map<string>((x: number) => String(x * 2))
  return result
}

// Generic constraint
interface HasLength {
  length: number
}

export class ConstrainedContainer<T extends HasLength> {
  item: T

  constructor(item: T) {
    this.item = item
  }

  getLength(): number {
    return this.item.length
  }
}

export function testGenericConstraint(): string {
  let obj = new ConstrainedContainer("hello")
  return String(obj.getLength())
}
