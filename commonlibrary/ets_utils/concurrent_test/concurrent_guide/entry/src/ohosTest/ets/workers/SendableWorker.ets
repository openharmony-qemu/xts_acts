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

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

@Sendable
class SharedData {
  public value: number = 0
  public name: string = ''
  public count: number = 0
}

workerPort.onmessage = (e: MessageEvents): void => {
  let data = e.data as Record<string, Object>
  let msgType: string = data['type'] as string
  if (msgType === 'sendable_test') {
    let val: number = data['value'] as number
    let nm: string = data['name'] as string
    workerPort.postMessage({ type: 'sendable_response', value: val, name: nm })
  } else if (msgType === 'modify_shared') {
    let newVal: number = data['newValue'] as number
    workerPort.postMessage({ type: 'modified', newValue: newVal })
  } else if (msgType === 'echo') {
    workerPort.postMessage('received')
  } else {
    workerPort.postMessage('unknown')
  }
}

workerPort.onmessageerror = (e: MessageEvents): void => {
  workerPort.postMessage({ type: 'message_error' })
}
