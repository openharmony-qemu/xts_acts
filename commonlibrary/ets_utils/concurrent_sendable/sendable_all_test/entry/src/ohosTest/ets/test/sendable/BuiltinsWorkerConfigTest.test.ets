/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import { worker, MessageEvents, collections } from '@kit.ArkTS'
import { SharedConfigForWorker, WorkerConfigData } from '../../../workers/sendable'
import Utils from '../utils'

const WORKER_PATH = '../../workers/config_worker.ets'

function createWorkerConfigPromise(workerInstance: worker.ThreadWorker, cmd: WorkerConfigData): Promise<WorkerConfigData> {
  return new Promise<WorkerConfigData>((resolve: Function): void => {
    workerInstance.onmessage = (e: MessageEvents): void => {
      resolve(e.data as WorkerConfigData)
    }
    workerInstance.postMessageWithSharedSendable(cmd)
  })
}

export default function BuiltinsWorkerConfigTest(): void {
  describe('BuiltinsWorkerConfigTest', (): void => {
    let configManager: SharedConfigForWorker
    let workerList: worker.ThreadWorker[] = []

    beforeEach((): void => {
      configManager = new SharedConfigForWorker(new collections.Map<string, string>())
    })

    afterEach((): void => {
      for (let i = 0; i < workerList.length; i++) {
        workerList[i].terminate()
      }
      workerList = []
    })
  })
}
