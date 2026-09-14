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

import utils from '@arkts.utils';
import {
  readSendableValue, modifySendableValue, processNumeric, createAndReturnSendable,
  nestedSendableAccess, nestedSendableModify, incrementSendableValue, incrementShared,
  readValidated, readInherited, asyncLockCrossThread, readCalculated, readIsValid,
  readFormatValue, modifyAndCalculate, readInstanceOwnValue, readBig, readMultiCount,
  CustomSendable, NumericData, ResultData, OuterSendable, SharedCounter, ValidatedSendable,
  ChildSendableClass, ExtendedSendable, InstanceMethodSendable, BigIntSendable,
  MultiInterfaceSendable
} from './ISendableImplFuncs';

@Concurrent
export function readSendableValueDispatch(instance: CustomSendable): number {
  return readSendableValue(instance)
}

@Concurrent
export function modifySendableValueDispatch(instance: CustomSendable, newVal: number): number {
  return modifySendableValue(instance, newVal)
}

@Concurrent
export function processNumericDispatch(instance: NumericData): number {
  return processNumeric(instance)
}

@Concurrent
export function createAndReturnSendableDispatch(result: ResultData): ResultData {
  return createAndReturnSendable(result)
}

@Concurrent
export function nestedSendableAccessDispatch(outer: OuterSendable): number {
  return nestedSendableAccess(outer)
}

@Concurrent
export function nestedSendableModifyDispatch(outer: OuterSendable, val: number): void {
  nestedSendableModify(outer, val)
}

@Concurrent
export function incrementSendableValueDispatch(data: CustomSendable): number {
  return incrementSendableValue(data)
}

@Concurrent
export function incrementSharedDispatch(data: SharedCounter): number {
  return incrementShared(data)
}

@Concurrent
export function readValidatedDispatch(instance: ValidatedSendable): number {
  return readValidated(instance)
}

@Concurrent
export function readInheritedDispatch(instance: ChildSendableClass): number {
  return readInherited(instance)
}

@Concurrent
export function asyncLockCrossThreadDispatch(lock: utils.locks.AsyncLock, data: SharedCounter): number {
  return asyncLockCrossThread(lock, data)
}

@Concurrent
export function readCalculatedDispatch(data: ExtendedSendable, factor: number): number {
  return readCalculated(data, factor)
}

@Concurrent
export function readIsValidDispatch(data: ExtendedSendable): boolean {
  return readIsValid(data)
}

@Concurrent
export function readFormatValueDispatch(data: ExtendedSendable): string {
  return readFormatValue(data)
}

@Concurrent
export function modifyAndCalculateDispatch(data: ExtendedSendable, newVal: number, factor: number): number {
  return modifyAndCalculate(data, newVal, factor)
}

@Concurrent
export function readInstanceOwnValueDispatch(instance: InstanceMethodSendable): number {
  return readInstanceOwnValue(instance)
}

@Concurrent
export function readBigDispatch(data: BigIntSendable): bigint {
  return readBig(data)
}

@Concurrent
export function readMultiCountDispatch(instance: MultiInterfaceSendable): number {
  return readMultiCount(instance)
}
