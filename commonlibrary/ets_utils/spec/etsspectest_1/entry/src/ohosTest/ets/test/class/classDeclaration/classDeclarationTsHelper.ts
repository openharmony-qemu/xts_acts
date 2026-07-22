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

// Computed getter/setter with Symbol
const symIdDecl: unique symbol = Symbol("id")
const symNameDecl: unique symbol = Symbol("name")

class ComputedGetterSetter {
  private _data: string = "default-data"
  private _label: string = "default-label"

  get [symIdDecl](): string {
    return "sym-value"
  }

  get data(): string {
    return this._data
  }

  set data(v: string) {
    this._data = v
  }

  get [symNameDecl](): string {
    return this._label
  }

  set [symNameDecl](v: string) {
    this._label = v
  }
}

export function testComputedAccessor(): string {
  let obj = new ComputedGetterSetter()
  let idVal = obj[symIdDecl] as string
  let initialData = obj.data
  obj.data = "updated-data"
  obj[symNameDecl] = "my-label"
  let nameVal = obj[symNameDecl] as string
  return idVal + "|" + initialData + "|" + obj.data + "|" + nameVal
}

// Anonymous class expression
export function testAnonymousClassExpression(): void {
  let Point = class {
    x: number
    y: number

    constructor(x: number, y: number) {
      this.x = x
      this.y = y
    }

    magnitude(): number {
      return this.x * this.x + this.y * this.y
    }
  }
  let p = new Point(3, 4)
  if (p.x !== 3) { throw new Error("fail-x") }
  if (p.y !== 4) { throw new Error("fail-y") }
  if (p.magnitude() !== 25) { throw new Error("fail-mag") }
  if (!(p instanceof Point)) { throw new Error("fail-instanceof") }
}

// Named class expression
export function testNamedClassExpression(): void {
  let Factory = class MyClass {
    id: number

    constructor(id: number) {
      this.id = id
    }

    getId(): number {
      return this.id
    }
  }
  let obj = new Factory(42)
  if (obj.id !== 42) { throw new Error("fail-id") }
  if (obj.getId() !== 42) { throw new Error("fail-getId") }
  if (!(obj instanceof Factory)) { throw new Error("fail-instanceof") }
}

// Class expression with extends
class BaseForExpr {
  value: number

  constructor(v: number) {
    this.value = v
  }
}

export function testExpressionExtends(): void {
  let Derived = class extends BaseForExpr {
    derivedValue: number = 1

    getBase(): number {
      return this.value
    }
  }
  let obj = new Derived(0)
  if (obj.value !== 0) { throw new Error("fail-value") }
  if (obj.derivedValue !== 1) { throw new Error("fail-derived") }
  if (obj.getBase() !== 0) { throw new Error("fail-getBase") }
  if (!(obj instanceof BaseForExpr)) { throw new Error("fail-instanceof") }
}
