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

workerPort.onmessage = (e: MessageEvents) => {
  let data = e.data as string;
  switch (data) {
    case 'start_timer_error': {
      // Save the timer handle. This setTimeout intentionally throws inside the
      // callback, so the worker will be destroyed after the error propagates —
      // clearTimeout cannot be called afterward. The handle is stored for
      // completeness but is cleaned up implicitly when the worker thread exits.
      let timerId: number = setTimeout(() => {
        throw new Error('Timer callback error');
      }, 100);
      break;
    }
    case 'start_interval_error': {
      let count = 0;
      let intervalId = setInterval(() => {
        count++;
        if (count >= 2) {
          clearInterval(intervalId);
          throw new Error('Interval callback error');
        }
      }, 100);
      break;
    }
    case 'start_promise_rejection':
      new Promise<void>((resolve: () => void, reject: (reason?: Object) => void) => {
        reject(new Error('Unhandled rejection'));
      });
      break;
    case 'throw_in_callback':
      throw new Error('Error in onmessage callback');
    default:
      break;
  }
}

workerPort.onmessageerror = (e: MessageEvents) => {
  console.info('InheritanceAsyncErrorWorker onmessageerror');
}
