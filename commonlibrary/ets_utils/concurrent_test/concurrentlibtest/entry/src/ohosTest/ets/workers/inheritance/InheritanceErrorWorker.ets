/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

class CustomError extends Error {
  public code: number;
  constructor(message: string, code: number) {
    super(message);
    this.name = 'CustomError';
    this.code = code;
  }
}

workerPort.onmessage = (e: MessageEvents) => {
  let data = e.data as string;
  switch (data) {
    case 'throw_error':
    case 'throw_sync_error':
      throw new Error('Test error');
    case 'throw_custom_error':
      throw new CustomError('CustomError message', 1001);
    case 'throw_type_error':
      throw new TypeError('Type error');
    case 'throw_empty_error':
      throw new Error();
    case 'throw_immediate':
      throw new Error('Immediate error');
    case 'throw_error_1':
      throw new Error('Error 1');
    case 'throw_error_2':
      throw new Error('Error 2');
    case 'throw_error_3':
      throw new Error('Error 3');
    case 'trigger_error':
      throw new Error('Trigger error');
    case 'normal_message':
      workerPort.postMessage('normal_response');
      break;
    case 'get_response':
      workerPort.postMessage('response_after_error');
      break;
    default:
      workerPort.postMessage(data);
      break;
  }
}

workerPort.onmessageerror = (e: MessageEvents) => {
  console.info('InheritanceErrorWorker onmessageerror');
}
