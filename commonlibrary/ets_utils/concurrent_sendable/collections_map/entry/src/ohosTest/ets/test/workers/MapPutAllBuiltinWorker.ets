/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker, collections } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (event: MessageEvents): void => {
  const map: collections.Map<number, string> = event.data as collections.Map<number, string>;
  const source: Map<number, string> = new Map<number, string>();
  source.set(1, 'a');
  source.set(2, 'b');
  source.set(3, 'c');
  map.putAll(source);
  workerPort.postMessage(map.size);
};

workerPort.onmessageerror = (event: MessageEvents): void => {
};

workerPort.onerror = (event: ErrorEvent): void => {
};
