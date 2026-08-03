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

interface Tagged {
  tag: string
}

interface TaggedMethod {
  tag: string
  method(): string
}

const receiverA: Tagged = { tag: 'A' }
const receiverB: Tagged = { tag: 'B' }

function reflect(this: Tagged): string {
  return this.tag
}

export function callReturnsA(): string {
  return reflect.call(receiverA)
}

export function applyReturnsA(): string {
  return reflect.apply(receiverA)
}

export function bindReturnsB(): string {
  return reflect.bind(receiverB)()
}

function strictThisFn(this: void): boolean {
  return this === undefined
}

export function plainStrictThis(): boolean {
  return strictThisFn()
}

const objLit1: TaggedMethod = {
  tag: 'OBJ1',
  method(): string {
    return this.tag
  }
}

export function objMethodThis(): string {
  return objLit1.method()
}

const arrow = (): Object | undefined => this

export function callCannotChangeArrowThis(): boolean {
  return arrow.call(receiverA) === undefined
}

export function bindThenCallReturnsB(): string {
  return reflect.bind(receiverB).call(receiverA)
}

class StaticThisCls {
  static selfIsClass(): boolean { return this === StaticThisCls }
  static selfReturnsClass(): Object { return this }
}

export function staticMethodThisIsClass(): boolean {
  return StaticThisCls.selfIsClass()
}

function runCallback(cb: () => string): string {
  return cb()
}

export function bindCallbackReturnsB(): string {
  const bound = reflect.bind(receiverB)
  return runCallback(bound)
}

function receiverFn(this: Object | null): Object | null {
  return this
}

export function callNullThisIsNull(): boolean {
  const t: Object | null = receiverFn.call(null)
  return t === null
}

export function bindCannotChangeArrowThis(): boolean {
  return arrow.bind(receiverA)() === undefined
}

export function bindNullThisIsNull(): boolean {
  const t: Object | null = receiverFn.bind(null)()
  return t === null
}
