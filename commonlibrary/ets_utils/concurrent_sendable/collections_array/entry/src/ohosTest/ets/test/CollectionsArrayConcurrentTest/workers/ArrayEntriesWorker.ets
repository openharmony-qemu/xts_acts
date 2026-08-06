/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  const arr: collections.Array<number> = event.data as collections.Array<number>;
  let count: number = 0;
  const iterator: IterableIterator<[number, number]> = arr.entries();
  let entry: IteratorResult<[number, number]> = iterator.next();
  while (!entry.done) {
    count++;
    entry = iterator.next();
  }
  workerPort.postMessage(count);
};

workerPort.onmessageerror = (event: MessageEvents): void => {
};

workerPort.onerror = (event: ErrorEvent): void => {
};
