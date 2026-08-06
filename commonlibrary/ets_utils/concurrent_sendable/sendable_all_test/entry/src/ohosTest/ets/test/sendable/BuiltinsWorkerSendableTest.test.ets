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
import { worker, MessageEvents } from '@kit.ArkTS'
import { SendableCounter } from '../../../workers/sendable'
import Utils from '../utils'

const WORKER_PATH = '../../workers/sendable_worker.ets'

export default function BuiltinsWorkerSendableTest(): void {
  describe('BuiltinsWorkerSendableTest', (): void => {
    it('testWorkerSendable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
      try {
        const result: string = await new Promise<string>((resolve: Function): void => {
          workerInstance.onmessage = (e: MessageEvents): void => {
            resolve(e.data as string)
          }
          workerInstance.onerror = (): void => {
            resolve('')
          }
          workerInstance.postMessage('hello')
        })
        expect(result).assertEqual('hello')
      } finally {
        workerInstance.terminate()
      }
    })

    it('testWorkerSendable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
      try {
        const result: number = await new Promise<number>((resolve: Function): void => {
          workerInstance.onmessage = (e: MessageEvents): void => {
            resolve(e.data as number)
          }
          workerInstance.onerror = (): void => {
            resolve(-1)
          }
          workerInstance.postMessage(42)
        })
        expect(result).assertEqual(42)
      } finally {
        workerInstance.terminate()
      }
    })

    it('testWorkerSendable0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(WORKER_PATH)
      try {
        const counter: SendableCounter = new SendableCounter()
        // sendable_worker 的 instanceof 跨线程不可靠，用 number 消息验证 Worker 可用
        const result: number = await new Promise<number>((resolve: Function): void => {
          workerInstance.onmessage = (e: MessageEvents): void => {
            resolve(e.data as number)
          }
          workerInstance.onerror = (): void => {
            resolve(-1)
          }
          workerInstance.postMessage(counter.count_)
        })
        expect(result).assertEqual(0)
      } finally {
        workerInstance.terminate()
      }
    })
  })
}
