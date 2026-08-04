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

export function getBigintAsString(): string {
  let v: any = 100n
  return v.toString()
}

class WithMethodCall {
  getBase(): number {
    return 10
  }

  value: number = this.getBase()
}

export function getWithMethodCallValue(): number {
  return new WithMethodCall().value
}

const symId: any = Symbol("symId")
const symName: any = Symbol("symName")

export function testSymbolFieldRead(): string {
  let obj: any = { x: 1 }
  obj[symId] = 100
  obj[symName] = "symbol-field"
  return String(obj[symId]) + "|" + obj[symName]
}

export function testSymbolFieldWrite(): string {
  let obj: any = { x: 1 }
  obj[symId] = 200
  return String(obj[symId])
}
