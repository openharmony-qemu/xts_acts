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

@Concurrent
export async function addTaskFuncNestedInnerFunc(counter: AddTaskFuncNestedCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return 9
  })
  return 9
}


@Sendable
export class AddTaskFuncNestedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}
