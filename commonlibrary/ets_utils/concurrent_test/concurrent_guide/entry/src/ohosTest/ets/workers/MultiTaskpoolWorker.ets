/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import taskpool from '@ohos.taskpool';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

@Concurrent
function multiCompute(id: number): number {
  return id * 10
}

workerPort.onmessage = (e: MessageEvents): void => {
  let data = e.data as Record<string, Object>
  let msgType: string = data['type'] as string
  if (msgType === 'create_multiple') {
    let count: number = data['count'] as number
    let completed: number = 0
    for (let i: number = 0; i < count; i++) {
      let task: taskpool.Task = new taskpool.Task(multiCompute, i)
      taskpool.execute(task).then((result: Object) => {
        workerPort.postMessage({ type: 'result', id: i, value: result })
        completed++
        if (completed >= count) {
          workerPort.postMessage({ type: 'all_done', total: completed })
        }
      }).catch((err: Error) => {
        workerPort.postMessage({ type: 'task_error', id: i, message: err.message })
      })
    }
  } else {
    workerPort.postMessage({ type: 'unknown' })
  }
}
