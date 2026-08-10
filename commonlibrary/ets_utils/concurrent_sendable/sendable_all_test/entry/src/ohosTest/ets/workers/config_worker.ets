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
import { SharedConfigForWorker, WorkerConfigData, WorkerConfigResponse } from './sendable';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents): void => {
  console.info('config_worker received message:', e.data);
  const data: WorkerConfigData = e.data as WorkerConfigData;
  const resp: WorkerConfigResponse = new WorkerConfigResponse();
  resp.key_ = data.key_;
  if (data.config_ === null) {
    resp.error_ = 'shared config missing';
    workerPort.postMessageWithSharedSendable(resp);
    return;
  }
  // Mutate the shared config instance delivered by reference via
  // postMessageWithSharedSendable, so the main thread can observe the change.
  const config: SharedConfigForWorker = data.config_;
  if (data.action_ === 'set') {
    config.set(data.key_, data.value_);
    config.version_++;
    resp.ok_ = true;
    resp.found_ = true;
    resp.value_ = data.value_;
    resp.version_ = config.version_;
  } else if (data.action_ === 'get') {
    const value: string | undefined = config.get(data.key_);
    resp.ok_ = true;
    resp.found_ = value !== undefined;
    resp.value_ = value === undefined ? '' : value;
    resp.version_ = config.version_;
  } else {
    resp.error_ = `unknown action: ${data.action_}`;
  }
  workerPort.postMessageWithSharedSendable(resp);
};
