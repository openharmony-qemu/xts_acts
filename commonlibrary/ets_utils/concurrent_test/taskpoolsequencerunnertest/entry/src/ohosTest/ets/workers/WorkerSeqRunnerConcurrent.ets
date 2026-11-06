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
import taskpool from '@ohos.taskpool';
import { workerEchoNameFunc } from './WorkerTaskFuncs';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

// SeqC2#024: the worker concurrently obtains a same-name SequenceRunner as the
// host, submits one fast task through its own runner reference, and reports
// the exact task result plus the measured wait time back to the host via
// postMessage. When the same-name runner shares the host's underlying global
// serial queue, the fast task can only execute after the host's preceding slow
// task, which is observable through the reported elapsed time.

async function runThroughSharedQueue(queueName: string): Promise<void> {
  try {
    const sameNameRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner(queueName)
    const start: number = Date.now()
    const rawResult: Object = await sameNameRunner.execute(new taskpool.Task(workerEchoNameFunc))
    const elapsed: number = Date.now() - start
    const value: number = rawResult as number
    workerPort.postMessage('ok|' + value + '|' + elapsed)
  } catch (e) {
    workerPort.postMessage('fail|' + JSON.stringify(e))
  }
}

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = (event: MessageEvents) => {
  const queueName: string = event.data as string
  runThroughSharedQueue(queueName)
};

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessageerror = (event: MessageEvents) => {
  // Fallback diagnostics: report the failure to the host via postMessage so a
  // deserialization error cannot stall the host until its bounded wait expires.
  // The host consumer only accepts the 'ok|...' protocol, so 'fail|...' fails fast.
  workerPort.postMessage('fail|messageerror|' + JSON.stringify(event))
};

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param event error message
 */
workerPort.onerror = (event: ErrorEvent) => {
  // Fallback diagnostics: report the exception to the host via postMessage so a
  // worker-side error cannot stall the host until its bounded wait expires.
  // The host consumer only accepts the 'ok|...' protocol, so 'fail|...' fails fast.
  workerPort.postMessage('fail|error|' + JSON.stringify(event))
};
