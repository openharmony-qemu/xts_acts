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

import util from '@ohos.util';
import worker, { MessageEvents } from '@ohos.worker';
import testNapi from 'libentry.so';

const WORKER_STRONG_REF_COUNT = 50;

const workerPort = worker.workerPort;

workerPort.onmessage = (event: MessageEvents) => {
  let cmd: string = event.data as string;
  if (cmd === 'strongRefTest') {
    let before: number = util.ArkTSVM.getGlobalHandleCount();
    let created: boolean = testNapi.createStrongRefs(WORKER_STRONG_REF_COUNT);
    let afterCreate: number = created ? util.ArkTSVM.getGlobalHandleCount() : -1;
    let deleted: boolean = testNapi.deleteStrongRefs(WORKER_STRONG_REF_COUNT);
    let afterDelete: number = deleted ? util.ArkTSVM.getGlobalHandleCount() : -1;
    let result: number[] = [before, afterCreate, afterDelete, WORKER_STRONG_REF_COUNT,
      created ? 1 : 0, deleted ? 1 : 0];
    workerPort.postMessage(result);
  } else if (cmd === 'capiConsistency') {
    let arktsCount: number = util.ArkTSVM.getGlobalHandleCount();
    let capiCount: number = testNapi.getCApiHandleCount();
    let result: number[] = [arktsCount, capiCount];
    workerPort.postMessage(result);
  } else if (cmd === 'concurrentQuery') {
    const CALL_TIMES = 100;
    let results: number[] = [];
    for (let i = 0; i < CALL_TIMES; i++) {
      results.push(util.ArkTSVM.getGlobalHandleCount());
    }
    workerPort.postMessage(results);
  } else {
    let count: number = util.ArkTSVM.getGlobalHandleCount();
    workerPort.postMessage(count);
  }
}
