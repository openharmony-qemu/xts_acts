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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { worker, MessageEvents, ErrorEvent } from '@kit.ArkTS'
import { SendableCounter } from '../../workers/Sendable'

const WORKER_PATH = '../../workers/SendableWorker.ets'
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

export default function WorkerSendableTest(): void {
  describe('WorkerSendableTest', (): void => {
    /**
     * @tc.name   testWorkerSendable0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_SENDABLE_TEST_0100
     * @tc.desc   Verify Worker echoes string message via postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerSendable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
        try {
          const messagePromise: Promise<string> = waitWorkerMessage<string>(workerInstance)
          workerInstance.postMessage('hello')
          const result: string = await messagePromise
          expect(result).assertEqual('hello')
        } finally {
          try {
            workerInstance.terminate()
          } catch (e) {
          }
        }
      } catch (error) {
        console.error("testWorkerSendable0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testWorkerSendable0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_SENDABLE_TEST_0200
     * @tc.desc   Verify Worker echoes number message via postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerSendable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
      try {
        const messagePromise: Promise<number> = waitWorkerMessage<number>(workerInstance)
        workerInstance.postMessage(42)
        const result: number = await messagePromise
        expect(result).assertEqual(42)
      } catch (error) {
        console.info(`worker-catch: ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
        try {
          workerInstance.terminate()
        } catch (e) {
        }
      }
      done()
    })

    /**
     * @tc.name   testWorkerSendable0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_SENDABLE_TEST_0300
     * @tc.desc   Verify Worker increments shared Sendable instance in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerSendable0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
        try {
          const counter: SendableCounter = new SendableCounter()
          const messagePromise: Promise<number> = waitWorkerMessage<number>(workerInstance)
          workerInstance.postMessageWithSharedSendable(counter)
          const result: number = await messagePromise
          // Worker increments the shared instance in place and reports the new count.
          expect(result).assertEqual(1)
          // The main thread observes the mutation on the same shared instance.
          expect(counter.count_).assertEqual(1)
        } finally {
          try {
            workerInstance.terminate()
          } catch (e) {
          }
        }
      } catch (error) {
        console.error("testWorkerSendable0300 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
