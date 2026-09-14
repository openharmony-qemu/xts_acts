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

import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker, ArkTSUtils } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

class LruCacheMessage {
  cache?: Object;
  lock?: Object;
  startKey?: number;
  count?: number;
}

workerPort.onmessage = async (event: MessageEvents): Promise<void> => {
  const data: LruCacheMessage = event.data as LruCacheMessage;
  const cache: ArkTSUtils.SendableLruCache<number, number> =
    data.cache as ArkTSUtils.SendableLruCache<number, number>;
  const lock: ArkTSUtils.locks.AsyncLock =
    data.lock as ArkTSUtils.locks.AsyncLock;
  const startKey: number = data.startKey ?? 0;
  const count: number = data.count ?? 0;

  let putCount: number = 0;
  await lock.lockAsync(async (): Promise<number> => {
    for (let i: number = 0; i < count; i++) {
      cache.put(startKey + i, startKey + i);
      putCount++;
    }
    return putCount;
  });

  workerPort.postMessage({ putCount: putCount, length: cache.length });
};

workerPort.onmessageerror = (event: MessageEvents): void => {
};

workerPort.onerror = (event: ErrorEvent): void => {
};
