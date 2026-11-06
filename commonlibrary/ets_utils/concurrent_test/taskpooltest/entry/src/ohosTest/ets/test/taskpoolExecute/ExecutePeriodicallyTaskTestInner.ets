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

import taskpool from '@ohos.taskpool';
import { ArkTSUtils } from '@kit.ArkTS';

@Concurrent
export async function epNestedInnerFunc(state: EPNestedProbeState, innerCounter: EPCounter): Promise<void> {
  await innerCounter.lock.lockAsync<void>((): void => {
    innerCounter.count++
  })
  if (innerCounter.count >= 3 && state.outerTaskId > 0) {
    taskpool.cancel(state.outerTaskId)
  }
}


@Sendable
export class EPNestedProbeState {
  execCount: number = 0
  attempted: boolean = false
  nestedCount: number = 0
  nestedError: number = 0
  outerTaskId: number = 0
  innerTaskId: number = 0
  // AsyncLock guarding epNestedPeriodicProbeFunc's shared-state RMW across periodic ticks
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}


@Sendable
export class EPCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}
