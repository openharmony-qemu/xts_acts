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

import { tsComboSendable } from './ConcurrentComboSource';
import { ucComboSendableMain } from './ConcurrentComboSource';

/**
 * 'use concurrent' functions defined in a .ts file.
 * These exercise the extended support for 'use concurrent' in .ts source files,
 * and verify cross-file import into .ets test modules.
 *
 * Note: .ts files cannot import collections from @kit.ArkTS, so only
 * primitive type parameters are used here.
 */

export function tsConcurrentAdd(a: number, b: number): number {
  'use concurrent'
  return a + b
}

export function tsConcurrentMultiply(a: number, b: number): number {
  'use concurrent'
  return a * b
}

export function tsConcurrentIdentity(n: number): number {
  'use concurrent'
  return n
}

export function tsConcurrentStringLength(s: string): number {
  'use concurrent'
  return s.length
}

/**
 * 'use concurrent' function calling a 'use sendable' function imported from
 * another .ts file (cross-file combination, design point TC_USE_CON_038).
 */
export function tsComboConcurrent(n: number): number {
  'use concurrent'
  return tsComboSendable(n) * 10
}

/**
 * Dispatch wrapper calling the 'use sendable' function imported from
 * ConcurrentComboSource.ts (cross-file combination, design point TC_USE_CON_037).
 * Uses the 'use concurrent' directive: the @Concurrent decorator is not
 * available in .ts files (runtime evidence 2026-08-19: decorator form is not
 * marked as concurrent and fails taskpool function serialization).
 */
export function ucComboSendableMainDispatch(n: number): number {
  'use concurrent'
  return ucComboSendableMain(n)
}
