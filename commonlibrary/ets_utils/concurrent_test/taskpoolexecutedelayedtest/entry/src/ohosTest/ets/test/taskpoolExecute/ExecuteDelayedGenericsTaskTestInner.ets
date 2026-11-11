/** Copyright (c) 2026 RKH Corp.
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


import { ArkTSUtils } from '@kit.ArkTS';

@Sendable
export class EDGOutcome {
  result: number = 0
}

@Sendable
export class EDGWrapper {
  value: number = 0
}

@Sendable
export class EDGCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
  nestedExecuted: boolean = false
  nestedResult: number = 0
}

@Concurrent
export async function edgCounterFunc(counter: EDGCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return counter.count
  })
  return 100
}
