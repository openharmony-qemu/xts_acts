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

export class Point {
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

export function createWithCtor(ctor: typeof Point, x: number, y: number): Point {
  return new ctor(x, y)
}

export function checkPrototypeChain(instance: any, classConstructor: any): boolean {
  return Object.getPrototypeOf(instance) === classConstructor.prototype
}

export function makeContainer(item: any): any {
  return {
    item: item,
    getItem(): any {
      return this.item
    }
  }
}

/*
 * Prototype chain test -- `prototype` and `Object.getPrototypeOf` restricted in ArkTS
 */
class ProtoBase {
  baseValue: number = 1
}

class ProtoDerived extends ProtoBase {
  derivedValue: number = 2
}

export function checkPrototypeChainAll(): boolean {
  let base = new ProtoBase()
  let derived = new ProtoDerived()

  let baseCtorOk = ProtoBase.prototype.constructor === ProtoBase
  let derivedCtorOk = ProtoDerived.prototype.constructor === ProtoDerived
  let baseProtoOfProtoOk = Object.getPrototypeOf(base) === ProtoBase.prototype
  let derivedProtoOfDerivedOk = Object.getPrototypeOf(derived) === ProtoDerived.prototype
  let derivedProtoChainOk = Object.getPrototypeOf(ProtoDerived.prototype) === ProtoBase.prototype
  let derivedCtorChainOk = Object.getPrototypeOf(ProtoDerived) === ProtoBase

  return ProtoBase.prototype.constructor === ProtoBase &&
    ProtoDerived.prototype.constructor === ProtoDerived &&
    Object.getPrototypeOf(base) === ProtoBase.prototype &&
    Object.getPrototypeOf(derived) === ProtoDerived.prototype &&
    Object.getPrototypeOf(ProtoDerived.prototype) === ProtoBase.prototype &&
    Object.getPrototypeOf(ProtoDerived) === ProtoBase &&
    derived.baseValue === 1 &&
    derived.derivedValue === 2
}
