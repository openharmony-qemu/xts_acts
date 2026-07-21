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
import { WorkerExchange, createEchoWorkerExchange, createTaskTypeWorkerExchange, CalculateRequest, EchoRequest } from '../WorkerHelper';

export default function WorkerCommunicationTest(): void {
  describe('WorkerCommunicationTest', (): void => {
    let currentWorker: worker.ThreadWorker | null = null

    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach(async (): Promise<void> => {
      if (currentWorker !== null) {
        await new Promise<void>((resolve: () => void) => {
          currentWorker!.onexit = (): void => { resolve() }
          currentWorker!.terminate()
        })
        currentWorker = null
      }
    })
    afterAll(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => { setTimeout((): void => resolve(), 500) })
    })

    /**
     * @tc.name   WorkerCommunicationTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_COMMUNICATION_TEST_0100
     * @tc.desc   Verify host thread sends string message and Worker echoes back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerCommunicationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
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
     * @tc.name   WorkerCommunicationTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_COMMUNICATION_TEST_0200
     * @tc.desc   Verify Worker returns computed result to host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerCommunicationTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
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
     * @tc.name   WorkerCommunicationTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_COMMUNICATION_TEST_0300
     * @tc.desc   Verify string type message round-trip between host and Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerCommunicationTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('test_string_message')
      })
      expect(result).assertEqual('echo: test_string_message')
    })

    /**
     * @tc.name   WorkerCommunicationTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_COMMUNICATION_TEST_0400
     * @tc.desc   Verify Worker processes long-running task with periodic status messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerCommunicationTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/LongTaskWorker.ets')
      let messages: string[] = []
      await new Promise<void>((resolve: () => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let msg: string = e.data as string
          messages.push(msg)
          if (msg === 'complete') {
            resolve()
          }
        }
        currentWorker!.postMessage('start')
      })
      let tickCount: number = 0
      for (let i: number = 0; i < messages.length; i++) {
        if (messages[i] === 'tick') {
          tickCount++
        }
      }
      expect(tickCount >= 3).assertTrue()
      expect(messages[messages.length - 1]).assertEqual('complete')
    })

    /**
     * @tc.name   WorkerCommunicationTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_COMMUNICATION_TEST_0500
     * @tc.desc   Verify rapid sequential message sending and ordered processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerCommunicationTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let results: string[] = []
      let expectedCount: number = 5
      await new Promise<void>((resolve: () => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          results.push(e.data as string)
          if (results.length >= expectedCount) {
            resolve()
          }
        }
        for (let i: number = 0; i < expectedCount; i++) {
          currentWorker!.postMessage('msg_' + i.toString())
        }
      })
      expect(results.length).assertEqual(expectedCount)
      for (let i: number = 0; i < expectedCount; i++) {
        expect(results[i]).assertEqual('echo: msg_' + i.toString())
      }
    })

    /**
     * @tc.name   WorkerCommunicationTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_COMMUNICATION_TEST_0600
     * @tc.desc   Verify bidirectional communication with multiple message exchanges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerCommunicationTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let exchange: WorkerExchange = await createEchoWorkerExchange('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = exchange.getWorker()
      let r1: string = await exchange.sendString('hello')
      expect(r1).assertEqual('hello received')
      let r2: string = await exchange.sendString('ping')
      expect(r2).assertEqual('pong')
      let r3: string = await exchange.sendString('custom')
      expect(r3).assertEqual('echo: custom')
      await exchange.terminate()
      currentWorker = null
    })

    /**
     * @tc.name   WorkerCommunicationTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_COMMUNICATION_TEST_0700
     * @tc.desc   Verify Worker receives and processes object type message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerCommunicationTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/TaskTypeWorker.ets')
      let result: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          let msgType: string = data['type'] as string
          if (msgType === 'calc_result') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'calculate', a: 15, b: 25, op: 'add' })
      })
      expect(result).assertEqual(40)
    })

    /**
     * @tc.name   WorkerCommunicationTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_COMMUNICATION_TEST_0800
     * @tc.desc   Verify Worker handles empty string message correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerCommunicationTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('')
      })
      expect(result).assertEqual('echo: ')
    })

    /**
     * @tc.name   WorkerCommunicationTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_COMMUNICATION_TEST_0900
     * @tc.desc   Verify Worker handles large volume data message within serialization limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerCommunicationTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let largeStr: string = ''
      for (let i: number = 0; i < 1000; i++) {
        largeStr += 'abcdefghij'
      }
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage(largeStr)
      })
      expect(result).assertEqual('echo: ' + largeStr)
      expect(result.length).assertEqual(largeStr.length + 6)
    })

    /**
     * @tc.name   WorkerCommunicationTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_COMMUNICATION_TEST_1000
     * @tc.desc   Verify Worker handles multiple message types in sequence correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerCommunicationTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let exchange: WorkerExchange = await createTaskTypeWorkerExchange('entry_test/ets/workers/TaskTypeWorker.ets')
      currentWorker = exchange.getWorker()
      let addData: Record<string, Object> = await exchange.send(new CalculateRequest(10, 20, 'add')) as Record<string, Object>
      expect(addData['value'] as number).assertEqual(30)
      let mulData: Record<string, Object> = await exchange.send(new CalculateRequest(7, 8, 'multiply')) as Record<string, Object>
      expect(mulData['value'] as number).assertEqual(56)
      let echoData: Record<string, Object> = await exchange.send(new EchoRequest('hello_worker')) as Record<string, Object>
      expect(echoData['type'] as string).assertEqual('echo_response')
      expect(echoData['payload'] as string).assertEqual('hello_worker')
      await exchange.terminate()
      currentWorker = null
    })
  })
}
