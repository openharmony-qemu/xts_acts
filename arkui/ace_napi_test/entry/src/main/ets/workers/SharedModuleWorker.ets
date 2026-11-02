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

import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

declare function requireNapi(moduleName: string, isShared?: boolean): Object | undefined;

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  switch (e.data) {
    case 'loadSharedModule': {
      try {
        let mod = requireNapi('sharedtestvalid', true);
        let isSendable = mod !== undefined && mod !== null;
        let initCount = -1;
        let addResult = -1;
        if (isSendable) {
          initCount = (mod as Object as Record<string, Function>)['getInitCount']() as number;
          addResult = (mod as Object as Record<string, Function>)['add'](3, 4);
        }
        workerPort.postMessage({ isSendable, initCount, addResult });
      } catch (err) {
        workerPort.postMessage({ isSendable: false, initCount: -1, addResult: -1, error: String(err) });
      }
      break;
    }
    case 'loadSharedModuleFail': {
      try {
        let mod = requireNapi('sharedtestfail', true);
        let isUndefined = (mod === undefined || mod === null);
        workerPort.postMessage({ isUndefined });
      } catch (err) {
        workerPort.postMessage({ isUndefined: true, error: String(err) });
      }
      break;
    }
    default:
      break;
  }
};
