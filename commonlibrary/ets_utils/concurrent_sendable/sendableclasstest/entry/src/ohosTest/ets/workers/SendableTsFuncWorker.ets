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
import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { sendableFuncInTsSource } from '../test/SendableTsFuncSource';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Worker that imports and calls a sendable function defined in a .ts file.
 * Verifies that .ts sendable functions can be used inside Worker threads.
 *
 * @param e message data (input number)
 */
workerPort.onmessage = (e: MessageEvents): void => {
  let input: number = e.data as number
  let result: number = sendableFuncInTsSource() + input
  workerPort.postMessage(result)
};

workerPort.onmessageerror = (e: MessageEvents): void => {
  console.info('SendableTsFuncWorker onmessageerror')
};
