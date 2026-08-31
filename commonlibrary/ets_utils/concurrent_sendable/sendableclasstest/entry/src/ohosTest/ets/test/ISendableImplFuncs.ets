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

import { lang } from '@kit.ArkTS';
import utils from '@arkts.utils';

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
export class NumericData {
  public numA_: number = 0
  public numB_: number = 0
  public numC_: number = 0
}

@Sendable
export class ResultData {
  public value_: number = 0
}

export function readSendableValue(instance: CustomSendable): number {
  'use sendable'
  return instance.value_
}

export function modifySendableValue(instance: CustomSendable, newVal: number): number {
  'use sendable'
  instance.value_ = newVal
  return instance.value_
}

export function processNumeric(instance: NumericData): number {
  'use sendable'
  return instance.numA_
}

export function createAndReturnSendable(result: ResultData): ResultData {
  'use sendable'
  result.value_ = 42
  return result
}

export function nestedSendableAccess(outer: OuterSendable): number {
  'use sendable'
  return outer.inner_.innerValue_
}

export function nestedSendableModify(outer: OuterSendable, val: number): void {
  'use sendable'
  outer.inner_.innerValue_ = val
}

export function incrementSendableValue(data: CustomSendable): number {
  'use sendable'
  data.value_ = data.value_ + 1
  return data.value_
}

@Sendable
export class SharedCounter {
  public counter_: number = 0
}

@Sendable
export class ValidatedSendable implements lang.ISendable {
  public validatedValue_: number = 0
}

@Sendable
export class BaseSendableClass {
  public baseValue_: number = 0
}

@Sendable
export class ChildSendableClass extends BaseSendableClass {
  public childValue_: string = ''
}

export function incrementShared(data: SharedCounter): number {
  'use sendable'
  data.counter_ = data.counter_ + 1
  return data.counter_
}

export function readValidated(instance: ValidatedSendable): number {
  'use sendable'
  return instance.validatedValue_
}

export function readInherited(instance: ChildSendableClass): number {
  'use sendable'
  return instance.baseValue_
}

export function asyncLockCrossThread(lock: utils.locks.AsyncLock, data: SharedCounter): number {
  'use sendable'
  // AsyncLock is @Sendable (implements ISendable), so it can be transferred to
  // the worker thread. However lockAsync() is an async API, and 'use sendable'
  // functions cannot be declared async nor await async calls — a language
  // constraint of ArkTS sendable functions. Therefore the lock object is
  // received and its transferability is verified, but lockAsync() is not invoked
  // inside this sendable function. The data increment below is unprotected
  // only because a single task is dispatched (ISendableImplTest3400), so there is
  // no concurrent contention and the value is deterministic.
  data.counter_ = data.counter_ + 1
  return data.counter_
}

/**
 * @Sendable class with extension methods (calculate, isValid, formatValue).
 * Covers mind map §3.5 — custom class adding extra methods beyond ISendable.
 */
@Sendable
export class ExtendedSendable {
  public value_: number = 0

  calculate(factor: number): number {
    return this.value_ * factor
  }

  isValid(): boolean {
    return this.value_ > 0
  }

  formatValue(): string {
    return 'Extended(' + this.value_ + ')'
  }
}

export function readCalculated(data: ExtendedSendable, factor: number): number {
  'use sendable'
  return data.calculate(factor)
}

export function readIsValid(data: ExtendedSendable): boolean {
  'use sendable'
  return data.isValid()
}

export function readFormatValue(data: ExtendedSendable): string {
  'use sendable'
  return data.formatValue()
}

export function modifyAndCalculate(data: ExtendedSendable, newVal: number, factor: number): number {
  'use sendable'
  data.value_ = newVal
  return data.calculate(factor)
}

@Sendable
export class InstanceMethodSendable {
  public ownVar_: number = 10

  getOwnValue(): number {
    return this.ownVar_
  }

  setOwnValue(v: number): void {
    this.ownVar_ = v
  }
}

export function readInstanceOwnValue(instance: InstanceMethodSendable): number {
  'use sendable'
  return instance.getOwnValue()
}

@Sendable
export class BigIntSendable {
  public bigValue_: bigint = BigInt(0)
}

export function readBig(data: BigIntSendable): bigint {
  'use sendable'
  return data.bigValue_
}

export interface ICounter {
  increment(): void
  getCount(): number
}

@Sendable
export class MultiInterfaceSendable implements ICounter {
  public count_: number = 0

  increment(): void {
    this.count_ = this.count_ + 1
  }

  getCount(): number {
    return this.count_
  }
}

export function readMultiCount(instance: MultiInterfaceSendable): number {
  'use sendable'
  return instance.getCount()
}
