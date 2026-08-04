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

class SuperComputedBase {
  greet(): string {
    return 'hello'
  }

  farewell(): string {
    return 'goodbye'
  }
}

class SuperComputedChild extends SuperComputedBase {
  callMethod(name: string): string {
    return super[name]()
  }
}

export function testSuperComputed(name: string): string {
  let obj = new SuperComputedChild()
  return obj.callMethod(name)
}

const superSym: unique symbol = Symbol('superSym')

class SuperSymBase {
  [superSym](): string {
    return 'symbol-result'
  }
}

class SuperSymChild extends SuperSymBase {
  callSymbolMethod(): string {
    return super[superSym]()
  }
}

export function testSuperComputedSymbol(): string {
  let obj = new SuperSymChild()
  return obj.callSymbolMethod()
}

class SuperGetterBase {
  get computed(): string {
    return 'getter-value'
  }
}

class SuperGetterChild extends SuperGetterBase {
  callGetter(name: string): string {
    return super[name]
  }
}

export function testSuperComputedGetter(): string {
  let obj = new SuperGetterChild()
  return obj.callGetter('computed')
}

let sideEffectCounter: number = 0

function keyWithSideEffect(): string {
  sideEffectCounter++
  return 'greet'
}

class SuperSideEffectChild extends SuperComputedBase {
  callMethodWithSideEffect(): string {
    return super[keyWithSideEffect()]()
  }
}

export function testSuperComputedSideEffect(): string {
  sideEffectCounter = 0
  let obj = new SuperSideEffectChild()
  let result: string = obj.callMethodWithSideEffect()
  return result + "|" + String(sideEffectCounter)
}

class StaticSuperBase {
  static getBaseLabel(): string {
    return 'static-base'
  }
}

class StaticSuperChild extends StaticSuperBase {
  static getChildLabel(): string {
    return super.getBaseLabel() + '-child'
  }
}

export function testSuperStaticMethod(): string {
  return StaticSuperChild.getChildLabel()
}
