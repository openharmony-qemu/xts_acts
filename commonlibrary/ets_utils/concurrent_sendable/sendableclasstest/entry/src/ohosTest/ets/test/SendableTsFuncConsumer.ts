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

import { sendableFuncInTsSource } from './SendableTsFuncSource';

/**
 * Sendable ('use sendable') function defined in a .ts file that imports and
 * calls a sendable function from another .ts file. Verifies cross-file .ts
 * module composition of sendable functions, executed through TaskPool from the
 * .ets test suite.
 */
export function sendableFuncInTsConsumer(): number {
  'use sendable'
  return sendableFuncInTsSource() + 50
}
