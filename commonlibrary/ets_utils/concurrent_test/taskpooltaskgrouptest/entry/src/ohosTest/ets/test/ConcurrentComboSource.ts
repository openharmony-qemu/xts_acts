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

/**
 * Cross-module source for the 'use sendable' / 'use concurrent' combination
 * design points (TC_USE_CON_037 / TC_USE_CON_038). 'use sendable' functions
 * and their 'use concurrent' helpers are hosted here so that a @Concurrent
 * wrapper in another module (ConcurrentTsFuncSource.ts) can invoke them
 * without same-module capture.
 */

/**
 * 'use sendable' function defined in a .ts file.
 * Imported by ConcurrentTsFuncSource.ts to verify the cross-file combination
 * of a 'use concurrent' function calling a 'use sendable' function (design
 * point TC_USE_CON_038).
 */
export function tsComboSendable(n: number): number {
  'use sendable'
  return n + 5
}

/**
 * 'use concurrent' helper called by ucComboSendableMain (design point
 * TC_USE_CON_037). Exported so the pair can be consumed from another module.
 */
export function ucComboConcurrentHelper(n: number): number {
  'use concurrent'
  return n * 2
}

/**
 * 'use sendable' function that calls the 'use concurrent' helper in the same
 * module (design point TC_USE_CON_037). Invoked through the @Concurrent
 * wrapper ucComboSendableMainDispatch in ConcurrentTsFuncSource.ts.
 */
export function ucComboSendableMain(n: number): number {
  'use sendable'
  return ucComboConcurrentHelper(n) + 1
}
