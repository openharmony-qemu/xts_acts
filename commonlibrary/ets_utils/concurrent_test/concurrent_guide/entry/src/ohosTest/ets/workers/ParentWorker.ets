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


import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
// Hold the child Worker reference so terminate_child actually releases it,
// otherwise every create_child/send_to_child leaks one Worker and stress runs
// eventually hit "the number of workers exceeds the maximum".
let childWorker: worker.ThreadWorker | null = null

function cleanupChildWorker(): void {
  if (childWorker !== null) {
    childWorker.terminate()
    childWorker = null
  }
}

workerPort.onmessage = (e: MessageEvents): void => {
  let data: string = e.data as string
  if (data === 'create_child') {
    cleanupChildWorker()
    childWorker = new worker.ThreadWorker('entry_test/ets/workers/ChildWorker.ets')
    childWorker.onmessage = (childEvent: MessageEvents): void => {
      workerPort.postMessage('child_msg:' + (childEvent.data as string))
    }
    childWorker.onexit = (code: number): void => {
      workerPort.postMessage('child_terminated')
      childWorker = null
    }
    workerPort.postMessage('child_created')
  } else if (data.startsWith('send_to_child:')) {
    cleanupChildWorker()
    let payload: string = data.substring(14)
    childWorker = new worker.ThreadWorker('entry_test/ets/workers/ChildWorker.ets')
    childWorker.onmessage = (childEvent: MessageEvents): void => {
      workerPort.postMessage('final_result:' + (childEvent.data as string))
    }
    childWorker.onexit = (code: number): void => {
      workerPort.postMessage('child_terminated')
      childWorker = null
    }
    childWorker.postMessage(payload)
  } else if (data === 'terminate_child') {
    if (childWorker !== null) {
      childWorker.terminate()
    } else {
      workerPort.postMessage('child_terminated')
    }
  } else if (data === 'close_self') {
    cleanupChildWorker()
    workerPort.close()
  } else {
    workerPort.postMessage('echo: ' + data)
  }
}
