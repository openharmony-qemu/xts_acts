/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/


import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker, ArkTSUtils, collections } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const buffer:collections.ArrayBuffer = e.data;
  console.log(`${buffer.byteLength}`)
  if (buffer.byteLength == 800){
    if (buffer instanceof collections.ArrayBuffer) {
      const sharedArray = new collections.Int32Array(buffer);
      const arrayLength = sharedArray.length;
      for (let i = 0; i < 100; i++) {
        if (i < arrayLength) {
          const subtractValue = 1;
          ArkTSUtils.Atomics.sub(sharedArray, i, subtractValue);
        }
      }
      workerPort.postMessage(sharedArray.buffer);
      workerPort.close();
    }
  }
}

workerPort.onerror = (err: ErrorEvent) => {
  console.info('workerPort onerror err is: ', err.message);
}