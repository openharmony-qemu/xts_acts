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

interface A {
  getA(): string
}

interface B extends A {
  getB(): string
}

interface C extends A, B {
  getC(): string
}

class MultiInterfaceImpl implements C {
  getA(): string {
    return "impl-A"
  }

  getB(): string {
    return "impl-B"
  }

  getC(): string {
    return "impl-C"
  }
}

export function testMultiInterfaceExtends(): string {
  let obj = new MultiInterfaceImpl()
  return obj.getA() + "|" + obj.getB() + "|" + obj.getC()
}

// Generic interface
interface Container<T> {
  value: T

  getValue(): T
}

class StringContainer implements Container<string> {
  value: string

  constructor(v: string) {
    this.value = v
  }

  getValue(): string {
    return this.value
  }
}

class NumberContainer implements Container<number> {
  value: number

  constructor(v: number) {
    this.value = v
  }

  getValue(): number {
    return this.value
  }
}

export function testGenericInterfaceImpl(): string {
  let s = new StringContainer("hello")
  let n = new NumberContainer(42)
  return s.getValue() + "|" + String(n.getValue())
}
