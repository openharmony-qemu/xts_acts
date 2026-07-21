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
function computeSquare(value: number): number {
  return value * value
}

@Concurrent
function largeCompute(n: number): number {
  let sum: number = 0
  for (let i: number = 0; i < n; i++) {
    sum += i
  }
  return sum
}

@Concurrent
function failingTask(): number {
  throw new Error('TaskPool intentional failure')
}

workerPort.onmessage = (e: MessageEvents): void => {
  let data = e.data as Record<string, Object>
  let msgType: string = data['type'] as string
  if (msgType === 'taskpool_compute') {
    let value: number = data['value'] as number
    let task: taskpool.Task = new taskpool.Task(computeSquare, value)
    taskpool.execute(task).then((result: Object) => {
      workerPort.postMessage({ type: 'compute_result', value: result })
    }).catch((err: Error) => {
      workerPort.postMessage({ type: 'compute_error', message: err.message })
    })
  } else if (msgType === 'taskpool_large') {
    let n: number = data['n'] as number
    let task: taskpool.Task = new taskpool.Task(largeCompute, n)
    taskpool.execute(task).then((result: Object) => {
      workerPort.postMessage({ type: 'compute_result', value: result })
    }).catch((err: Error) => {
      workerPort.postMessage({ type: 'compute_error', message: err.message })
    })
  } else if (msgType === 'taskpool_fail') {
    let task: taskpool.Task = new taskpool.Task(failingTask)
    taskpool.execute(task).then((result: Object) => {
      workerPort.postMessage({ type: 'compute_result', value: result })
    }).catch((err: Error) => {
      workerPort.postMessage({ type: 'compute_error', message: err.message })
    })
  } else {
    workerPort.postMessage({ type: 'unknown' })
  }
}
