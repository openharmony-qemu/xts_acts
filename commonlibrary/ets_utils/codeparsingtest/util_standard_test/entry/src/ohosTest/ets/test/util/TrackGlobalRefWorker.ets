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

const workerPort = worker.workerPort;

workerPort.onmessage = (event: MessageEvents) => {
  let cmd: string = event.data as string;
  if (cmd === 'enable') {
    try {
      util.ArkTSVM.setTrackGlobalRef(true);
      workerPort.postMessage('enabled');
    } catch (e) {
      workerPort.postMessage('error');
    }
  } else if (cmd === 'disable') {
    try {
      util.ArkTSVM.setTrackGlobalRef(false);
      workerPort.postMessage('disabled');
    } catch (e) {
      workerPort.postMessage('error');
    }
  } else if (cmd === 'concurrentToggle') {
    try {
      for (let i = 0; i < 50; i++) {
        util.ArkTSVM.setTrackGlobalRef(true);
        util.ArkTSVM.setTrackGlobalRef(false);
      }
      workerPort.postMessage('concurrentDone');
    } catch (e) {
      workerPort.postMessage('error');
    }
  } else {
    workerPort.postMessage('unknown');
  }
}
