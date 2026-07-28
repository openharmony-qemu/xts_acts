/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

function processValueImpl(x: number | string): number | string {
  return x
}

function handleMixedImpl(x: number | string): number | string {
  return x
}

function overloadRuntimeEntityImpl(x: number | string): number | string {
  return x
}

export function processValue(x: number): number

export function processValue(x: string): string

export function processValue(x: number | string): number | string {
  return processValueImpl(x)
}

export function handleMixed(x: number): number

export function handleMixed<T>(x: T): T

export function handleMixed(x: number | string): number | string {
  return handleMixedImpl(x)
}

export function processArrayOrItem<T>(x: T[]): T

export function processArrayOrItem<T>(x: T): T

export function processArrayOrItem<T>(x: T | T[]): T {
  if (Array.isArray(x)) {
    return x[0]
  }
  return x
}

export function overloadRuntimeEntity(x: number): number

export function overloadRuntimeEntity(x: string): string

export function overloadRuntimeEntity(x: number | string): number | string {
  return overloadRuntimeEntityImpl(x)
}

export function callProcessValueNumber(value: number): number {
  return processValue(value)
}

export function callProcessValueString(value: string): string {
  return processValue(value)
}

export function callHandleMixedNumber(value: number): number {
  return handleMixed(value)
}

export function callHandleMixedString(value: string): string {
  return handleMixed(value)
}

export function callProcessArrayOrItemString(value: string): string {
  return processArrayOrItem(value)
}

export function callProcessArrayOrItemNumberArray(values: number[]): number {
  return processArrayOrItem(values)
}

export function callProcessArrayOrItemNumber(value: number): number {
  return processArrayOrItem(value)
}

export function getOverloadRuntimeEntityType(): string {
  return typeof overloadRuntimeEntity
}

export function callOverloadRuntimeNumber(value: number): number {
  return overloadRuntimeEntity(value)
}

export function callOverloadRuntimeString(value: string): string {
  return overloadRuntimeEntity(value)
}
