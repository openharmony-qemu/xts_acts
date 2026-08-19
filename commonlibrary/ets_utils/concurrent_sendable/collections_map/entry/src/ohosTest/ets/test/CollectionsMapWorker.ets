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

import { worker } from '@kit.ArkTS';
import { collections } from '@kit.ArkTS';
import { ArkTSUtils } from '@kit.ArkTS';

const workerPort = worker.workerPort;

workerPort.onmessage = async (e) => {
  let map: collections.Map<string, number> = e.data.map;
  let lock: ArkTSUtils.locks.AsyncLock = e.data.lock;

  let count: number = 0;
  let value50: number | undefined = undefined;
  await lock.lockAsync(async () => {
    map.forEach((_value: number, _key: string) => {
      count++;
    });
    value50 = map.get('key_50');
  });

  let result: string = JSON.stringify({
    count: count,
    value50: value50
  });
  workerPort.postMessage(result);
};
