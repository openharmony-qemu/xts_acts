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
import { worker, MessageEvents, collections } from '@kit.ArkTS'
import { SharedConfigForWorker, WorkerConfigData } from '../../../workers/sendable'
import Utils from '../utils'

const WORKER_PATH = '../../workers/config_worker.ets'

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

    it('testWorkerConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
      workerList.push(workerInstance)
      const cmd: WorkerConfigData = new WorkerConfigData()
      cmd.action_ = 'set'
      cmd.key_ = 'theme'
      cmd.value_ = 'dark'
      const result: SharedConfigForWorker = await new Promise<SharedConfigForWorker>((resolve: Function): void => {
        workerInstance.onmessage = (e: MessageEvents): void => {
          resolve(e.data as SharedConfigForWorker)
        }
        workerInstance.onerror = (): void => {
          resolve(configManager)
        }
        workerInstance.postMessageWithSharedSendable(cmd)
      })
      expect(result.get('theme')).assertEqual('dark')
    })

    it('testWorkerConfig0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
      workerList.push(workerInstance)
      const cmd: WorkerConfigData = new WorkerConfigData()
      cmd.action_ = 'set'
      cmd.key_ = 'language'
      cmd.value_ = 'zh_CN'
      const result: SharedConfigForWorker = await new Promise<SharedConfigForWorker>((resolve: Function): void => {
        workerInstance.onmessage = (e: MessageEvents): void => {
          resolve(e.data as SharedConfigForWorker)
        }
        workerInstance.onerror = (): void => {
          resolve(configManager)
        }
        workerInstance.postMessageWithSharedSendable(cmd)
      })
      expect(result.get('language')).assertEqual('zh_CN')
      expect(result.version_).assertEqual(1)
    })

    it('testWorkerConfig0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
      workerList.push(workerInstance)
      const cmd: WorkerConfigData = new WorkerConfigData()
      cmd.action_ = 'set'
      cmd.key_ = 'font_size'
      cmd.value_ = '16'
      const result: SharedConfigForWorker = await new Promise<SharedConfigForWorker>((resolve: Function): void => {
        workerInstance.onmessage = (e: MessageEvents): void => {
          resolve(e.data as SharedConfigForWorker)
        }
        workerInstance.onerror = (): void => {
          resolve(configManager)
        }
        workerInstance.postMessageWithSharedSendable(cmd)
      })
      expect(result.get('font_size')).assertEqual('16')
      expect(result.get('nonexistent_key')).assertEqual(undefined)
    })
  })
}
