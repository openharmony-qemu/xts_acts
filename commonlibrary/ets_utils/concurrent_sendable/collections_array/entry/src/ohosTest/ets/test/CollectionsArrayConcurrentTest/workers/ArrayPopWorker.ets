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
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker, collections, ArkTSUtils } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

class ArrayPopMessage {
  arr?: Object;
  count?: number;
  lock?: Object;
}

workerPort.onmessage = async (event: MessageEvents): Promise<void> => {
  const data: ArrayPopMessage = event.data as ArrayPopMessage;
  const arr: collections.Array<number> = data.arr as collections.Array<number>;
  const count: number = data.count as number;
  const lock: ArkTSUtils.locks.AsyncLock = data.lock as ArkTSUtils.locks.AsyncLock;
  const popCount: number = await lock.lockAsync(async (): Promise<number> => {
    let countPopped: number = 0;
    for (let i: number = 0; i < count; i++) {
      const val: number | undefined = arr.pop();
      if (val !== undefined) {
        countPopped++;
      }
    }
    return countPopped;
  });
  workerPort.postMessage(popCount);
};

workerPort.onmessageerror = (event: MessageEvents): void => {
};

workerPort.onerror = (event: ErrorEvent): void => {
};
