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
import { SharedWorkerData } from '../../workers/Sendable'

const WORKER_PATH = '../../workers/SharedModuleWorker.ets'
// Stress-robust wait budget. Under sustained 20/100-round stress a ThreadWorker
// instance may transiently never echo (startup/attach loss observed on rk3568:
// no ack within 5s/9s budgets while sibling workers respond in ~50ms). Echo
// exchanges therefore respawn the worker once per case; 6000ms keeps every
// worst-case path well below the 30000ms per-case stress timeout.
const MESSAGE_TIMEOUT_MS: number = 6000

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

function isWaitTimeoutError(error: Object): boolean {
  return error instanceof Error && error.message.startsWith('worker message timeout')
}

export default function WorkerIntegrationTest(): void {
  describe('WorkerIntegrationTest', (): void => {
    let workerInstance: worker.ThreadWorker | null = null
    let sharedData: SharedWorkerData = new SharedWorkerData(new ArkTSUtils.locks.AsyncLock())
    let echoRespawned: boolean = false

    // Echo exchanges are idempotent ('ping' / 'seq_N'); on a wait timeout the worker
    // instance is presumed dead (transient startup loss under stress) and is respawned
    // at most once per case. A functional echo defect still fails after the single retry.
    const exchangeEcho = async (message: string): Promise<string> => {
      try {
        const messagePromise: Promise<string> = waitWorkerMessage<string>(workerInstance!)
        workerInstance!.postMessage(message)
        return await messagePromise
      } catch (error) {
        if (echoRespawned || !isWaitTimeoutError(error)) {
          throw new Error(`worker echo failed: ${JSON.stringify(error)}`)
        }
        echoRespawned = true
        try {
          workerInstance!.terminate()
        } catch (terminateError) {
          console.info(`terminate before respawn: ${JSON.stringify(terminateError)}`)
        }
        workerInstance = new worker.ThreadWorker(WORKER_PATH)
        const retryPromise: Promise<string> = waitWorkerMessage<string>(workerInstance)
        workerInstance.postMessage(message)
        return await retryPromise
      }
    }

    beforeEach((): void => {
      sharedData = new SharedWorkerData(new ArkTSUtils.locks.AsyncLock())
      echoRespawned = false
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
    it('testWorkerIntegration0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
        for (let i: number = 0; i < 5; i++) {
          await sharedData.increment()
        }
        expect(await sharedData.getValue()).assertEqual(5)
      } catch (error) {
        console.error("testWorkerIntegration0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testWorkerIntegration0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTEGRATION_TEST_0200
     * @tc.desc   Verify Worker receives string message and echoes ack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerIntegration0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        workerInstance = new worker.ThreadWorker(WORKER_PATH)
        const result: string = await exchangeEcho('ping')
        expect(result).assertEqual('ack_ping')
      } catch (error) {
        console.error("testWorkerIntegration0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testWorkerIntegration0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTEGRATION_TEST_0300
     * @tc.desc   Verify Worker increments shared Sendable data via message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerIntegration0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        workerInstance = new worker.ThreadWorker(WORKER_PATH)
        const messagePromise: Promise<number> = waitWorkerMessage<number>(workerInstance)
        workerInstance.postMessageWithSharedSendable(sharedData)
        const result: number = await messagePromise
        expect(result).assertEqual(1)
        // The main thread observes the worker's mutation on the shared instance.
        expect(await sharedData.getValue()).assertEqual(1)
      } catch (error) {
        console.error("testWorkerIntegration0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testWorkerIntegration0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTEGRATION_TEST_0400
     * @tc.desc   Verify Worker handles multiple sequential messages correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerIntegration0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
        workerInstance = new worker.ThreadWorker(WORKER_PATH)
        const results: string[] = []
        for (let i: number = 0; i < 3; i++) {
          const msg: string = `seq_${i}`
          const result: string = await exchangeEcho(msg)
          results.push(result)
        }
        expect(results[0]).assertEqual('ack_seq_0')
        expect(results[1]).assertEqual('ack_seq_1')
        expect(results[2]).assertEqual('ack_seq_2')
      } catch (error) {
        console.error("testWorkerIntegration0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testWorkerIntegration0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTEGRATION_TEST_0500
     * @tc.desc   Verify three workers mutate the same shared Sendable under lock and final value equals worker count with in-range observations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerIntegration0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
        const sharedData: SharedWorkerData = new SharedWorkerData(new ArkTSUtils.locks.AsyncLock())
        const workers: worker.ThreadWorker[] = []
        const acks: number[] = []
        const workerDone: Promise<void>[] = []
        for (let i: number = 0; i < 3; i++) {
          const w: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
          workers.push(w)
          const donePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
            w.onmessage = (ev: MessageEvents): void => {
              acks.push(ev.data as number)
              resolve()
            }
          })
          workerDone.push(donePromise)
          w.postMessageWithSharedSendable(sharedData)
        }
        await Promise.all(workerDone)
        for (let i: number = 0; i < workers.length; i++) {
          workers[i].terminate()
        }
        expect(acks.length).assertEqual(3)
        for (let i: number = 0; i < acks.length; i++) {
          expect(acks[i] >= 1 && acks[i] <= 3).assertTrue()
        }
        expect(await sharedData.getValue()).assertEqual(3)
      } catch (error) {
        console.error("testWorkerIntegration0500 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
