/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { collections } from '@kit.ArkTS';
import { SharedSendableData } from './SendableSharedData';

@Sendable
export class CustomSendable {
  public value_: number = 0
  public name_: string = ''
  public data_: number = 0

  getValue(): number {
    return this.value_
  }

  setValue(v: number): void {
    this.value_ = v
  }

  addData(v: number): void {
    this.data_ = this.data_ + v
  }
}

@Sendable
export class NumericData {
  public numA_: number = 0
  public numB_: number = 0
  public numC_: number = 0
}

@Sendable
export class InnerSendable {
  public innerValue_: number = 0
}

@Sendable
export class OuterSendable {
  public outerValue_: number = 0
  public inner_: InnerSendable = new InnerSendable()

  getNestedValue(): number {
    return this.inner_.innerValue_
  }

  setNestedValue(v: number): void {
    this.inner_.innerValue_ = v
  }
}

@Sendable
export class ResultData {
  public value_: number = 0
}

// TC_USE_SEND_001: 'use sendable' function in .ets file (sum of array elements)
export function arraySum(arr: collections.Array<number>): number {
  'use sendable'
  let sum: number = 0
  for (let i = 0; i < arr.length; i++) {
    sum = sum + arr[i]
  }
  return sum
}

// TC_USE_SEND_004: number parameter
export function sendableWithNumberParam(n: number): number {
  'use sendable'
  return n * 2
}

export function sendableSquare(n: number): number {
  'use sendable'
  return n * n
}

// TC_USE_SEND_005: string parameter
export function sendableWithStringParam(s: string): number {
  'use sendable'
  return s.length
}

// TC_USE_SEND_006: boolean parameter
export function sendableWithBooleanParam(b: boolean): number {
  'use sendable'
  return b ? 1 : 0
}

export function sendableReturnBoolean(val: number): boolean {
  'use sendable'
  return val > 0
}

// TC_USE_SEND_007: collections.Array parameter
export function sendableArrayOp(arr: collections.Array<number>): number {
  'use sendable'
  arr.push(100)
  return arr.length
}

// TC_USE_SEND_008: collections.Map parameter
export function sendableMapOp(map: collections.Map<string, number>): number {
  'use sendable'
  map.set('result', 42)
  return map.size
}

export function mapCount(map: collections.Map<string, number>): number {
  'use sendable'
  return map.size
}

// TC_USE_SEND_009: collections.Set parameter
export function sendableSetOp(set: collections.Set<number>): number {
  'use sendable'
  set.add(99)
  return set.size
}

export function setDeleteOp(set: collections.Set<number>): number {
  'use sendable'
  set.delete(2)
  return set.size
}

export function returnSendableSet(): collections.Set<number> {
  'use sendable'
  let set = new collections.Set<number>()
  set.add(1); set.add(2); set.add(3)
  return set
}

// TC_USE_SEND_010: BitVector parameter
export function sendableBitVectorOp(bv: collections.BitVector): number {
  'use sendable'
  bv.push(1)
  return bv.length
}

// TC_USE_SEND_011: ArrayBuffer parameter
export function sendableWithArrayBuffer(ab: ArrayBuffer): number {
  'use sendable'
  return ab.byteLength
}

// TC_USE_SEND_012: @Sendable class parameter
export function sendableReadValue(instance: CustomSendable): number {
  'use sendable'
  return instance.value_
}

export function sendableModifyValue(instance: CustomSendable, val: number): number {
  'use sendable'
  instance.value_ = val
  return instance.value_
}

export function readNumericData(c: NumericData): number {
  'use sendable'
  return c.numA_ + c.numB_ + c.numC_
}

export function readNestedSendable(outer: OuterSendable): number {
  'use sendable'
  return outer.inner_.innerValue_
}

export function modifyNestedSendable(outer: OuterSendable, val: number): void {
  'use sendable'
  outer.inner_.innerValue_ = val
}

// TC_USE_SEND_013: number return
export function sendableReturnNumber(): number {
  'use sendable'
  return 42
}

// TC_USE_SEND_014: string return
export function sendableReturnString(): string {
  'use sendable'
  return 'hello'
}

// TC_USE_SEND_015: collections.Array return
export function sendableReturnArray(): collections.Array<number> {
  'use sendable'
  let arr = new collections.Array<number>()
  arr.push(1); arr.push(2); arr.push(3)
  return arr
}

// TC_USE_SEND_016: collections.Map return
export function sendableReturnMap(): collections.Map<string, number> {
  'use sendable'
  let map = new collections.Map<string, number>()
  map.set('a', 1)
  map.set('b', 2)
  return map
}

// TC_USE_SEND_017: @Sendable class return
export function returnSendableClass(result: ResultData): ResultData {
  'use sendable'
  result.value_ = 100
  return result
}

export function sendableClassReturnWithProp(result: ResultData): ResultData {
  'use sendable'
  result.value_ = 77
  return result
}

// TC_USE_SEND_018: 'use sendable' at first line of function body (correct position)
export function sendableCorrectPosition(): number {
  'use sendable'
  return 42
}

// TC_USE_SEND_019: 'use sendable' preceded by a blank line
export function sendableFuncWithLeadingBlankLine(): number {

  'use sendable'
  return 42
}

// TC_USE_SEND_023: nested function with 'use sendable'
export function sendableNestedFunction(): number {
  'use sendable'
  let inner = (): number => {
    'use sendable'
    return 50
  }
  return inner() + 50
}

// TC_USE_SEND_027: @Sendable class and 'use sendable' function mixed in same file
export function callSendableMethod(instance: CustomSendable): number {
  'use sendable'
  instance.setValue(50)
  instance.addData(10)
  return instance.getValue()
}

export function readOuterValue(outer: CustomSendable): number {
  'use sendable'
  return outer.getValue()
}

// TC_USE_SEND_028: cross-file mixed import (@Sendable class from another file)
export function processSharedSendableData(data: SharedSendableData): number {
  'use sendable'
  return data.value_
}
