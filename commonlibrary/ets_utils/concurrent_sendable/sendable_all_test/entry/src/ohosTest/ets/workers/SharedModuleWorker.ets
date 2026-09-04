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
import { SharedWorkerData } from './Sendable';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = async (e: MessageEvents): Promise<void> => {
  console.info('SharedModuleWorker received message:', e.data);
  if (typeof e.data === 'string') {
    const msg: string = e.data as string;
    if (msg === 'error_trigger') {
      throw new Error('triggered error');
    }
    workerPort.postMessage('ack_' + msg);
  } else {
    const data: SharedWorkerData = e.data as SharedWorkerData;
    await data.increment();
    workerPort.postMessage(await data.getValue());
  }
};
