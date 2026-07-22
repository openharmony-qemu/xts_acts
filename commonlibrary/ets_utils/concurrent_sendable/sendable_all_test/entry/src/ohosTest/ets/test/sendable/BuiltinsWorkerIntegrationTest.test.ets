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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import worker, { MessageEvents } from '@ohos.worker'
import { collections } from '@kit.ArkTS'
import { ArkTSUtils } from '@kit.ArkTS'
import { SharedWorkerData } from '../../../workers/sendable'
import Utils from '../utils'

const WORKER_PATH = '../../workers/SharedModuleWorker.ets'

export default function BuiltinsWorkerIntegrationTest(): void {
  describe('BuiltinsWorkerIntegrationTest', (): void => {
    let workerInstance: worker.ThreadWorker | null = null
    let sharedData: SharedWorkerData = new SharedWorkerData(new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      sharedData = new SharedWorkerData(new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      if (workerInstance !== null) {
        workerInstance.terminate()
        workerInstance = null
      }
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testWorkerIntegration0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTEGRATION_TEST_0800
     * @tc.desc   Verify Worker concurrent write to shared data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerIntegration0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await sharedData.increment()
      }
      expect(await sharedData.getValue()).assertEqual(5)
    })
  })
}
