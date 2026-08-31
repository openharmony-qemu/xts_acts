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

class MapRemoveMessage {
  map?: Object;
  key?: Object;
}

workerPort.onmessage = (event: MessageEvents): void => {
  const data: MapRemoveMessage = event.data as MapRemoveMessage;
  const map: collections.Map<number, string> = data.map as collections.Map<number, string>;
  const key: number = data.key as number;
  map.remove(key);
  workerPort.postMessage(map.size);
};

workerPort.onmessageerror = (event: MessageEvents): void => {
};

workerPort.onerror = (event: ErrorEvent): void => {
};
