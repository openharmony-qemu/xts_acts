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
import { sendableFuncInTsSource } from './SendableTsFuncSource';
import { sendableFuncInTsConsumer } from './SendableTsFuncConsumer';
import { jsSendableFunc } from './SendableJsFuncSource';
import { SharedSendableData } from './SendableSharedData';
import {
  arraySum, sendableWithNumberParam, sendableSquare, sendableWithStringParam,
  sendableWithBooleanParam, sendableReturnBoolean, sendableArrayOp, sendableMapOp,
  mapCount, sendableSetOp, setDeleteOp, returnSendableSet, sendableBitVectorOp,
  sendableWithArrayBuffer, sendableReadValue, sendableModifyValue, readNumericData,
  readNestedSendable, modifyNestedSendable, sendableReturnNumber, sendableReturnString,
  sendableReturnArray, sendableReturnMap, returnSendableClass,
  sendableClassReturnWithProp, sendableCorrectPosition, sendableFuncWithLeadingBlankLine,
  sendableNestedFunction, callSendableMethod, readOuterValue, processSharedSendableData,
  CustomSendable, NumericData, OuterSendable, ResultData
} from './UseSendableFuncs';

// TaskPool dispatch wrappers for sendable functions imported from .ts/.js sources.
// These @Concurrent wrappers are the only functions passed to taskpool.Task; the
// underlying sendable functions remain the test subjects and are untouched.
@Concurrent
export function sendableFuncInTsSourceDispatch(): number {
  return sendableFuncInTsSource()
}

@Concurrent
export function sendableFuncInTsConsumerDispatch(): number {
  return sendableFuncInTsConsumer()
}

@Concurrent
export function jsSendableFuncDispatch(input: number): number {
  return jsSendableFunc(input)
}

@Concurrent
export function arraySumDispatch(arr: collections.Array<number>): number {
  return arraySum(arr)
}

@Concurrent
export function sendableWithNumberParamDispatch(n: number): number {
  return sendableWithNumberParam(n)
}

@Concurrent
export function sendableSquareDispatch(n: number): number {
  return sendableSquare(n)
}

@Concurrent
export function sendableWithStringParamDispatch(s: string): number {
  return sendableWithStringParam(s)
}

@Concurrent
export function sendableWithBooleanParamDispatch(b: boolean): number {
  return sendableWithBooleanParam(b)
}

@Concurrent
export function sendableReturnBooleanDispatch(val: number): boolean {
  return sendableReturnBoolean(val)
}

@Concurrent
export function sendableArrayOpDispatch(arr: collections.Array<number>): number {
  return sendableArrayOp(arr)
}

@Concurrent
export function sendableMapOpDispatch(map: collections.Map<string, number>): number {
  return sendableMapOp(map)
}

@Concurrent
export function mapCountDispatch(map: collections.Map<string, number>): number {
  return mapCount(map)
}

@Concurrent
export function sendableSetOpDispatch(set: collections.Set<number>): number {
  return sendableSetOp(set)
}

@Concurrent
export function setDeleteOpDispatch(set: collections.Set<number>): number {
  return setDeleteOp(set)
}

@Concurrent
export function returnSendableSetDispatch(): collections.Set<number> {
  return returnSendableSet()
}

@Concurrent
export function sendableBitVectorOpDispatch(bv: collections.BitVector): number {
  return sendableBitVectorOp(bv)
}

@Concurrent
export function sendableWithArrayBufferDispatch(ab: ArrayBuffer): number {
  return sendableWithArrayBuffer(ab)
}

@Concurrent
export function sendableReadValueDispatch(instance: CustomSendable): number {
  return sendableReadValue(instance)
}

@Concurrent
export function sendableModifyValueDispatch(instance: CustomSendable, val: number): number {
  return sendableModifyValue(instance, val)
}

@Concurrent
export function readNumericDataDispatch(c: NumericData): number {
  return readNumericData(c)
}

@Concurrent
export function readNestedSendableDispatch(outer: OuterSendable): number {
  return readNestedSendable(outer)
}

@Concurrent
export function modifyNestedSendableDispatch(outer: OuterSendable, val: number): void {
  modifyNestedSendable(outer, val)
}

@Concurrent
export function sendableReturnNumberDispatch(): number {
  return sendableReturnNumber()
}

@Concurrent
export function sendableReturnStringDispatch(): string {
  return sendableReturnString()
}

@Concurrent
export function sendableReturnArrayDispatch(): collections.Array<number> {
  return sendableReturnArray()
}

@Concurrent
export function sendableReturnMapDispatch(): collections.Map<string, number> {
  return sendableReturnMap()
}

@Concurrent
export function returnSendableClassDispatch(result: ResultData): ResultData {
  return returnSendableClass(result)
}

@Concurrent
export function sendableClassReturnWithPropDispatch(result: ResultData): ResultData {
  return sendableClassReturnWithProp(result)
}

@Concurrent
export function sendableCorrectPositionDispatch(): number {
  return sendableCorrectPosition()
}

@Concurrent
export function sendableFuncWithLeadingBlankLineDispatch(): number {
  return sendableFuncWithLeadingBlankLine()
}

@Concurrent
export function sendableNestedFunctionDispatch(): number {
  return sendableNestedFunction()
}

@Concurrent
export function callSendableMethodDispatch(instance: CustomSendable): number {
  return callSendableMethod(instance)
}

@Concurrent
export function readOuterValueDispatch(outer: CustomSendable): number {
  return readOuterValue(outer)
}

@Concurrent
export function processSharedSendableDataDispatch(data: SharedSendableData): number {
  return processSharedSendableData(data)
}
