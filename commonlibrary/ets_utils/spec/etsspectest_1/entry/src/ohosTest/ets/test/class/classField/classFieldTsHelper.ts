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

/*
 * Field init calling this.method() â€?uses `this` in field initializer
 * to invoke a prototype method, may be restricted in ArkTS
 */
class WithMethodCall {
  getBase(): number {
    return 10
  }

  value: number = this.getBase()
}

export function getWithMethodCallValue(): number {
  return new WithMethodCall().value
}

/*
 * Symbol field test â€?Symbol() and indexed access not supported in ArkTS
 */
const symFieldId = Symbol("fieldId")
const symFieldName = Symbol("fieldName")

class SymbolField {
  [symFieldId] = 100
  [symFieldName] = "symbol-field"
}

export function testSymbolFieldReadId(): any {
  let obj: any = new SymbolField()
  return obj[symFieldId]
}

export function testSymbolFieldReadName(): any {
  let obj: any = new SymbolField()
  return obj[symFieldName]
}

export function testSymbolFieldWrite(): any {
  let obj: any = new SymbolField()
  obj[symFieldId] = 200
  return obj[symFieldId]
}
