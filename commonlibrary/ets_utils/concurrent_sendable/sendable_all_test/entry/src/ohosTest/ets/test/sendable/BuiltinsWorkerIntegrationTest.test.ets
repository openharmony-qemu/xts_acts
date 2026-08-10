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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import worker, { ErrorEvent, MessageEvents } from '@ohos.worker'
import { ArkTSUtils } from '@kit.ArkTS'
import { SharedWorkerData } from '../../../workers/sendable'

const WORKER_PATH = '../../workers/SharedModuleWorker.ets'
const MESSAGE_TIMEOUT_MS: number = 5000

function waitWorkerMessage<T>(workerInstance: worker.ThreadWorker): Promise<T> {
  return new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void): void => {
    const timeoutId: number = setTimeout((): void => {
      reject(new Error(`worker message timeout after ${MESSAGE_TIMEOUT_MS}ms`))
    }, MESSAGE_TIMEOUT_MS)
    workerInstance.onmessage = (e: MessageEvents): void => {
      clearTimeout(timeoutId)
      resolve(e.data as T)
    }
    workerInstance.onerror = (e: ErrorEvent): void => {
      clearTimeout(timeoutId)
      reject(new Error(`worker error: ${e.message}`))
    }
  })
}

export default function BuiltinsWorkerIntegrationTest(): void {
  describe('BuiltinsWorkerIntegrationTest', (): void => {
    let workerInstance: worker.ThreadWorker | null = null
    let sharedData: SharedWorkerData = new SharedWorkerData(new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      sharedData = new SharedWorkerData(new ArkTSUtils.locks.AsyncLock())
    })

    afterEach((): void => {
      if (workerInstance !== null) {
        try {
          workerInstance.terminate()
        } catch (e) {
        }
        workerInstance = null
      }
    })

    /**
     * @tc.name   testWorkerIntegration0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTEGRATION_TEST_0100
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

    /**
     * @tc.name   testWorkerIntegration0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTEGRATION_TEST_0200
     * @tc.desc   Verify Worker receives string message and echoes ack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerIntegration0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      workerInstance = new worker.ThreadWorker(WORKER_PATH)
      const messagePromise: Promise<string> = waitWorkerMessage<string>(workerInstance)
      workerInstance.postMessage('ping')
      const result: string = await messagePromise
      expect(result).assertEqual('ack_ping')
    })

    /**
     * @tc.name   testWorkerIntegration0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTEGRATION_TEST_0300
     * @tc.desc   Verify Worker increments shared Sendable data via message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerIntegration0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      workerInstance = new worker.ThreadWorker(WORKER_PATH)
      const messagePromise: Promise<number> = waitWorkerMessage<number>(workerInstance)
      workerInstance.postMessageWithSharedSendable(sharedData)
      const result: number = await messagePromise
      expect(result).assertEqual(1)
      // The main thread observes the worker's mutation on the shared instance.
      expect(await sharedData.getValue()).assertEqual(1)
    })

    /**
     * @tc.name   testWorkerIntegration0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTEGRATION_TEST_0400
     * @tc.desc   Verify Worker handles multiple sequential messages correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerIntegration0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      workerInstance = new worker.ThreadWorker(WORKER_PATH)
      const results: string[] = []
      for (let i: number = 0; i < 3; i++) {
        const msg: string = `seq_${i}`
        const messagePromise: Promise<string> = waitWorkerMessage<string>(workerInstance)
        workerInstance.postMessage(msg)
        const result: string = await messagePromise
        results.push(result)
      }
      expect(results[0]).assertEqual('ack_seq_0')
      expect(results[1]).assertEqual('ack_seq_1')
      expect(results[2]).assertEqual('ack_seq_2')
    })
  })
}
