/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { worker, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { WorkerExchange, createEchoWorkerExchange } from '../WorkerHelper';

export default function WorkerCommunicationTest(): void {
  describe('WorkerCommunicationOverviewTest', (): void => {
    let currentWorker: worker.ThreadWorker | null = null

    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach(async (): Promise<void> => {
      if (currentWorker !== null) {
        await new Promise<void>((resolve: Function) => {
          currentWorker!.onexit = (): void => { resolve() }
          currentWorker!.terminate()
        })
        currentWorker = null
      }
    })
    afterAll(async (): Promise<void> => {
      await new Promise<void>((resolve: Function) => { setTimeout((): void => resolve(undefined), 500) })
    })

    /**
     * @tc.name   WorkerCommunicationOverviewTest0100
     * @tc.number SUB_WORKER_COMMUNICATION_OVERVIEW_TEST_0100
     * @tc.desc   Verify Worker thread creation and basic message echo communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerCommunicationOverviewTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')

      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('hello')
      })

      expect(result).assertEqual('hello received')
    })

    /**
     * @tc.name   WorkerCommunicationOverviewTest0200
     * @tc.number SUB_WORKER_COMMUNICATION_OVERVIEW_TEST_0200
     * @tc.desc   Verify Worker ping-pong message exchange pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerCommunicationOverviewTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')

      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('ping')
      })

      expect(result).assertEqual('pong')
    })

    /**
     * @tc.name   WorkerCommunicationOverviewTest0300
     * @tc.number SUB_WORKER_COMMUNICATION_OVERVIEW_TEST_0300
     * @tc.desc   Verify Worker handles compute task and returns calculation result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerCommunicationOverviewTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')

      let result: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as number)
        }
        currentWorker!.postMessage('compute')
      })

      expect(result).assertEqual(49995000)
    })

    /**
     * @tc.name   WorkerCommunicationOverviewTest0400
     * @tc.number SUB_WORKER_COMMUNICATION_OVERVIEW_TEST_0400
     * @tc.desc   Verify Worker handles long-running task with periodic tick messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerCommunicationOverviewTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/LongTaskWorker.ets')
      let receivedMessages: string[] = []

      await new Promise<void>((resolve: () => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let msg: string = e.data as string
          receivedMessages.push(msg)
          if (msg === 'complete') {
            resolve()
          }
        }
        currentWorker!.postMessage('start')
      })

      let tickCount: number = 0
      for (let i: number = 0; i < receivedMessages.length; i++) {
        if (receivedMessages[i] === 'tick') {
          tickCount++
        }
      }
      expect(tickCount >= 3).assertTrue()
      expect(receivedMessages[receivedMessages.length - 1]).assertEqual('complete')
    })

    /**
     * @tc.name   WorkerCommunicationOverviewTest0500
     * @tc.number SUB_WORKER_COMMUNICATION_OVERVIEW_TEST_0500
     * @tc.desc   Verify Worker onexit callback is invoked after terminate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerCommunicationOverviewTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let wk: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = wk

      let exitCode: number = await new Promise<number>((resolve: (value: number) => void) => {
        wk.onexit = (code: number): void => {
          resolve(code)
        }
        wk.terminate()
        currentWorker = null
      })

      expect(exitCode).assertEqual(0)
    })

    /**
     * @tc.name   WorkerCommunicationOverviewTest0600
     * @tc.number SUB_WORKER_COMMUNICATION_OVERVIEW_TEST_0600
     * @tc.desc   Verify Worker handles multiple sequential message exchanges correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerCommunicationOverviewTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let exchange: WorkerExchange = await createEchoWorkerExchange('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = exchange.getWorker()

      let result1: string = await exchange.sendString('hello')
      expect(result1).assertEqual('hello received')

      let result2: string = await exchange.sendString('ping')
      expect(result2).assertEqual('pong')

      let result3: string = await exchange.sendString('test data')
      expect(result3).assertEqual('echo: test data')
      await exchange.terminate()
      currentWorker = null
    })
  })
}
