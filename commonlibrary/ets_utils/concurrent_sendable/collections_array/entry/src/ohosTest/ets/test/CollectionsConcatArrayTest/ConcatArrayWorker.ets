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

import { collections, worker, MessageEvents } from '@kit.ArkTS';

const workerPort = worker.workerPort;

class WorkerMessage {
  type: string = '';
  set?: Object;
  value?: number;
}

workerPort.onmessage = (event: MessageEvents): void => {
  let data = event.data as WorkerMessage;

  switch (data.type) {
    case 'concatArraySize': {
      let arr = data.set as collections.ConcatArray<number>;
      let result = arr.length;
      workerPort.postMessage({ result: result });
      break;
    }

    case 'concatArrayJoin': {
      let arr = data.set as collections.ConcatArray<number>;
      let result = arr.join(",");
      workerPort.postMessage({ result: result });
      break;
    }

    case 'concatArraySlice': {
      let arr = data.set as collections.ConcatArray<number>;
      let sliced = arr.slice(0, 2);
      workerPort.postMessage({ result: sliced.length });
      break;
    }

    default: {
      workerPort.postMessage({ result: -1 });
      break;
    }
  }
};