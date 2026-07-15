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

// design 026: generic class extends non-generic class
class BaseNonGeneric {
  baseValue: number = 10
}

class GenericChild<T> extends BaseNonGeneric {
  item: T

  constructor(item: T) {
    super()
    this.item = item
  }
}

// design 027: non-generic class extends generic class (concrete type)
class BaseGeneric<T> {
  value: T

  constructor(v: T) {
    this.value = v
  }
}

class ConcreteChild extends BaseGeneric<number> {
  constructor(v: number) {
    super(v)
  }
}

// design 028: derived class passes generic type to base
class PassthroughChild<T> extends BaseGeneric<T> {
  constructor(v: T) {
    super(v)
  }
}

export function testGenericExtendsNonGeneric(): number {
  let obj = new GenericChild<number>(42)
  return obj.baseValue + obj.item
}

export function testConcreteExtendsGeneric(): number {
  let obj = new ConcreteChild(99)
  return obj.value
}

export function testPassthroughGeneric(): number {
  let objNum = new PassthroughChild<number>(50)
  let objStr = new PassthroughChild<string>('hello')
  if (typeof objStr.value === 'string' && objStr.value === 'hello') {
    return objNum.value
  }
  return -1
}
