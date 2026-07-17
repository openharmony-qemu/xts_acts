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

workerPort.onmessage = (e: MessageEvents): void => {
  let data: string = e.data as string
  if (data === '__ready__') {
    workerPort.postMessage('ready')
  } else if (data === 'hello') {
    workerPort.postMessage('hello received')
  } else if (data === 'ping') {
    workerPort.postMessage('pong')
  } else if (data === 'compute') {
    let sum: number = 0
    for (let i: number = 0; i < 10000; i++) {
      sum += i
    }
    workerPort.postMessage(sum)
  } else {
    workerPort.postMessage('echo: ' + data)
  }
}
