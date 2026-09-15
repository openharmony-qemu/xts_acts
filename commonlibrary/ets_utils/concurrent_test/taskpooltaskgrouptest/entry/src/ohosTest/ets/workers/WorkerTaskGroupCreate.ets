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
import { workerEchoNameFunc, workerGroupSimpleFunc } from './WorkerTaskFuncs';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

// Envelope structure posted from the host thread (JSON string
// { mode: string, name?: string }).
interface WorkerGroupEnvelope {
  mode: string
  name: string
}

async function createAndRunGroup(): Promise<void> {
  // Create a TaskGroup inside the worker thread, add a task, execute the
  // group, and report the exact group name and group result to the host.
  const group: taskpool.TaskGroup = new taskpool.TaskGroup('workerGroupW4')
  group.addTask(workerGroupSimpleFunc)
  const results: Object = await taskpool.execute(group)
  const firstResult: number = (results as number[])[0]
  workerPort.postMessage(JSON.stringify({ name: group.name, result: firstResult }))
}

async function runGroupWithReceivedName(groupName: string): Promise<void> {
  // The group name serialized from the host thread is used to construct a
  // TaskGroup inside the worker thread; the name round-trips back to the host
  // together with the exact group execution result.
  const group: taskpool.TaskGroup = new taskpool.TaskGroup(groupName)
  group.addTask(workerEchoNameFunc)
  const results: Object = await taskpool.execute(group)
  const firstResult: number = (results as number[])[0]
  workerPort.postMessage(JSON.stringify({ echoName: group.name, result: firstResult }))
}

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = (event: MessageEvents) => {
  // Envelope format: JSON string { mode: string, name?: string }.
  const payload: WorkerGroupEnvelope = JSON.parse(event.data as string) as WorkerGroupEnvelope
  const mode: string = payload.mode as string
  if (mode === 'create-group') {
    createAndRunGroup()
  } else if (mode === 'serialize-name') {
    // Payload mode: the envelope carries the serialized group name.
    const groupName: string = payload.name as string
    runGroupWithReceivedName(groupName)
  }
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
  // The host consumers only accept the exact group-result JSON protocol, so
  // 'fail|...' fails fast and stays distinguishable from a silent crash.
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
  // The host consumers only accept the exact group-result JSON protocol, so
  // 'fail|...' fails fast and stays distinguishable from a silent crash.
  workerPort.postMessage('fail|error|' + JSON.stringify(event))
};
