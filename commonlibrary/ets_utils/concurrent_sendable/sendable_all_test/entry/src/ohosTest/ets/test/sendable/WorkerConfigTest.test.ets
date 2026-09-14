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
import { worker, MessageEvents, ErrorEvent, collections } from '@kit.ArkTS'
import { SharedConfigForWorker, WorkerConfigData, WorkerConfigResponse } from '../../workers/Sendable'

const WORKER_PATH = '../../workers/ConfigWorker.ets'
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

export default function WorkerConfigTest(): void {
  describe('WorkerConfigTest', (): void => {
    let configManager: SharedConfigForWorker
    let workerList: worker.ThreadWorker[] = []

    beforeEach((): void => {
      configManager = new SharedConfigForWorker(new collections.Map<string, string>())
    })

    afterEach((): void => {
      for (let i = 0; i < workerList.length; i++) {
        try {
          workerList[i].terminate()
        } catch (e) {
        }
      }
      workerList = []
    })

    /**
     * @tc.name   testWorkerConfig0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_CONFIG_TEST_0100
     * @tc.desc   Verify Worker sets shared config value via postMessageWithSharedSendable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
        workerList.push(workerInstance)
        const cmd: WorkerConfigData = new WorkerConfigData()
        cmd.action_ = 'set'
        cmd.key_ = 'theme'
        cmd.value_ = 'dark'
        cmd.config_ = configManager
        const messagePromise: Promise<WorkerConfigResponse> = waitWorkerMessage<WorkerConfigResponse>(workerInstance)
        workerInstance.postMessageWithSharedSendable(cmd)
        const result: WorkerConfigResponse = await messagePromise
        expect(result.ok_).assertTrue()
        expect(result.value_).assertEqual('dark')
        // The main thread observes the mutation on the shared config instance.
        expect(configManager.get('theme')).assertEqual('dark')
      } catch (error) {
        console.error("testWorkerConfig0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testWorkerConfig0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_CONFIG_TEST_0200
     * @tc.desc   Verify Worker bumps shared config version after set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerConfig0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
        workerList.push(workerInstance)
        const cmd: WorkerConfigData = new WorkerConfigData()
        cmd.action_ = 'set'
        cmd.key_ = 'language'
        cmd.value_ = 'zh_CN'
        cmd.config_ = configManager
        const messagePromise: Promise<WorkerConfigResponse> = waitWorkerMessage<WorkerConfigResponse>(workerInstance)
        workerInstance.postMessageWithSharedSendable(cmd)
        const result: WorkerConfigResponse = await messagePromise
        expect(result.ok_).assertTrue()
        expect(result.value_).assertEqual('zh_CN')
        // version_ starts at 1 and is bumped once by the worker's set.
        expect(result.version_).assertEqual(2)
        expect(configManager.get('language')).assertEqual('zh_CN')
        expect(configManager.getVersion()).assertEqual(2)
      } catch (error) {
        console.error("testWorkerConfig0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testWorkerConfig0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_CONFIG_TEST_0300
     * @tc.desc   Verify Worker get on missing key returns not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerConfig0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
        workerList.push(workerInstance)
        const setCmd: WorkerConfigData = new WorkerConfigData()
        setCmd.action_ = 'set'
        setCmd.key_ = 'font_size'
        setCmd.value_ = '16'
        setCmd.config_ = configManager
        const setPromise: Promise<WorkerConfigResponse> = waitWorkerMessage<WorkerConfigResponse>(workerInstance)
        workerInstance.postMessageWithSharedSendable(setCmd)
        const setResult: WorkerConfigResponse = await setPromise
        expect(setResult.ok_).assertTrue()
        expect(setResult.value_).assertEqual('16')
        expect(configManager.get('font_size')).assertEqual('16')

        const getCmd: WorkerConfigData = new WorkerConfigData()
        getCmd.action_ = 'get'
        getCmd.key_ = 'nonexistent_key'
        getCmd.config_ = configManager
        const getPromise: Promise<WorkerConfigResponse> = waitWorkerMessage<WorkerConfigResponse>(workerInstance)
        workerInstance.postMessageWithSharedSendable(getCmd)
        const getResult: WorkerConfigResponse = await getPromise
        expect(getResult.ok_).assertTrue()
        expect(getResult.found_).assertFalse()
        expect(configManager.get('nonexistent_key')).assertEqual(undefined)
      } catch (error) {
        console.error("testWorkerConfig0300 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
