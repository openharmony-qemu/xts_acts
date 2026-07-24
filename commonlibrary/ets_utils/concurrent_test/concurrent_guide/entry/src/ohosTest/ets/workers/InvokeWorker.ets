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

workerPort.onmessage = (e: MessageEvents): void => {
  let data = e.data as Record<string, Object>
  let msgType: string = data['type'] as string
  if (msgType === '__ready__') {
    workerPort.postMessage({ type: 'ready' })
  } else if (msgType === 'call_no_args') {
    let objName: string = data['objName'] as string
    let methodName: string = data['methodName'] as string
    try {
      let result: Object = workerPort.callGlobalCallObjectMethod(objName, methodName, 0)
      workerPort.postMessage({ type: 'call_result', value: result })
    } catch (err) {
      workerPort.postMessage({ type: 'call_error', message: (err as Error).message })
    }
  } else if (msgType === 'call_nonexistent_method') {
    let objName: string = data['objName'] as string
    try {
      let result: Object = workerPort.callGlobalCallObjectMethod(objName, 'nonExistentMethod', 0)
      workerPort.postMessage({ type: 'call_result', value: result })
    } catch (err) {
      workerPort.postMessage({ type: 'call_error', message: (err as Error).message })
    }
  } else if (msgType === 'call_nonexistent_object') {
    try {
      let result: Object = workerPort.callGlobalCallObjectMethod('nonExistentObj', 'someMethod', 0)
      workerPort.postMessage({ type: 'call_result', value: result })
    } catch (err) {
      workerPort.postMessage({ type: 'call_error', message: (err as Error).message })
    }
  } else if (msgType === 'call_add_values') {
    let objName: string = data['objName'] as string
    try {
      let result: Object = workerPort.callGlobalCallObjectMethod(objName, 'addValues', 2, 10, 20)
      workerPort.postMessage({ type: 'call_result', value: result })
    } catch (err) {
      workerPort.postMessage({ type: 'call_error', message: (err as Error).message })
    }
  } else {
    workerPort.postMessage({ type: 'unknown' })
  }
}
