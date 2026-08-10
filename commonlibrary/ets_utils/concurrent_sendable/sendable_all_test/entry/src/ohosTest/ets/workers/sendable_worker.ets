/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { SendableCounter } from './sendable';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents): void => {
  console.info('sendable_worker received message:', e.data);
  if (typeof e.data === 'string') {
    workerPort.postMessage(e.data);
  } else if (typeof e.data === 'number') {
    workerPort.postMessage(e.data);
  } else {
    // Shared Sendable instance arrives by shared reference via
    // postMessageWithSharedSendable; instanceof across worker threads is
    // unreliable, so dispatch by typeof and cast to the shared class.
    const counter: SendableCounter = e.data as SendableCounter;
    counter.count_++;
    workerPort.postMessage(counter.count_);
  }
};
