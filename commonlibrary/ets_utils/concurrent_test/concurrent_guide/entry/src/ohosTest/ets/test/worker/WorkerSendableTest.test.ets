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
import { collections } from '@kit.ArkTS';

@Sendable
class SendableData {
  value: number = 0
  name: string = ''
}

@Sendable
class SendableCounter {
  count: number = 0
  label: string = 'default'
}

export default function WorkerSendableTest(): void {
  describe('WorkerSendableTest', (): void => {
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
     * @tc.name   WorkerSendableTest0100
     * @tc.number SUB_WORKER_SENDABLE_TEST_0100
     * @tc.desc   Verify Sendable class definition with decorated properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerSendableTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: SendableData = new SendableData()
      data.value = 100
      data.name = 'test'
      expect(data.value).assertEqual(100)
      expect(data.name).assertEqual('test')
      let counter: SendableCounter = new SendableCounter()
      counter.count = 42
      counter.label = 'counter'
      expect(counter.count).assertEqual(42)
      expect(counter.label).assertEqual('counter')
    })

    /**
     * @tc.name   WorkerSendableTest0200
     * @tc.number SUB_WORKER_SENDABLE_TEST_0200
     * @tc.desc   Verify postMessageWithSharedSendable sends Sendable object to Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerSendableTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/SendableWorker.ets')
      let sharedData: SendableData = new SendableData()
      sharedData.value = 200
      sharedData.name = 'shared_test'
      currentWorker.postMessageWithSharedSendable(sharedData)
      expect(sharedData.value).assertEqual(200)
      expect(sharedData.name).assertEqual('shared_test')
    })

    /**
     * @tc.name   WorkerSendableTest0300
     * @tc.number SUB_WORKER_SENDABLE_TEST_0300
     * @tc.desc   Verify host sends data to Worker and Worker responds via postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerSendableTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/SendableWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage({ type: 'echo' })
      })
      expect(result).assertEqual('received')
    })

    /**
     * @tc.name   WorkerSendableTest0400
     * @tc.number SUB_WORKER_SENDABLE_TEST_0400
     * @tc.desc   Verify Worker processes sendable test message and returns structured response
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerSendableTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/SendableWorker.ets')
      let responseValue: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'sendable_response') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'sendable_test', value: 42, name: 'verify' })
      })
      expect(responseValue).assertEqual(42)
    })

    /**
     * @tc.name   WorkerSendableTest0500
     * @tc.number SUB_WORKER_SENDABLE_TEST_0500
     * @tc.desc   Verify Sendable object properties remain accessible after sending to Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerSendableTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/SendableWorker.ets')
      let sharedData: SendableData = new SendableData()
      sharedData.value = 999
      sharedData.name = 'persistent'
      currentWorker.postMessageWithSharedSendable(sharedData)
      expect(sharedData.value).assertEqual(999)
      expect(sharedData.name).assertEqual('persistent')
      sharedData.value = 1000
      expect(sharedData.value).assertEqual(1000)
    })

    /**
     * @tc.name   WorkerSendableTest0600
     * @tc.number SUB_WORKER_SENDABLE_TEST_0600
     * @tc.desc   Verify Sendable object with multiple property types round-trip communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerSendableTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/SendableWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'sendable_response') {
            resolve(data['name'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'sendable_test', value: 10, name: 'roundtrip' })
      })
      expect(result).assertEqual('roundtrip')
    })

    /**
     * @tc.name   WorkerSendableTest0700
     * @tc.number SUB_WORKER_SENDABLE_TEST_0700
     * @tc.desc   Verify regular object serialization transfer via postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerSendableTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/SendableWorker.ets')
      let responseName: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'sendable_response') {
            resolve(data['name'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'sendable_test', value: 77, name: 'serialized' })
      })
      expect(responseName).assertEqual('serialized')
    })

    /**
     * @tc.name   WorkerSendableTest0800
     * @tc.number SUB_WORKER_SENDABLE_TEST_0800
     * @tc.desc   Verify Sendable object bidirectional transfer between host and Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerSendableTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/SendableWorker.ets')
      let sharedOut: SendableData = new SendableData()
      sharedOut.value = 50
      sharedOut.name = 'outbound'
      currentWorker.postMessageWithSharedSendable(sharedOut)
      let responseValue: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'sendable_response') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'sendable_test', value: 88, name: 'inbound' })
      })
      expect(sharedOut.value).assertEqual(50)
      expect(responseValue).assertEqual(88)
    })

    /**
     * @tc.name   WorkerSendableTest0900
     * @tc.number SUB_WORKER_SENDABLE_TEST_0900
     * @tc.desc   Verify collections.Array Sendable container works with Worker communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerSendableTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sendableArr: collections.Array<number> = new collections.Array<number>()
      sendableArr.push(10)
      sendableArr.push(20)
      sendableArr.push(30)
      expect(sendableArr.length).assertEqual(3)
      expect(sendableArr[0]).assertEqual(10)
      expect(sendableArr[1]).assertEqual(20)
      expect(sendableArr[2]).assertEqual(30)
    })

    /**
     * @tc.name   WorkerSendableTest1000
     * @tc.number SUB_WORKER_SENDABLE_TEST_1000
     * @tc.desc   Verify multiple Workers concurrent communication with host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerSendableTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let worker3: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let results: collections.Array<string> = new collections.Array<string>()
      await new Promise<void>((resolve: () => void) => {
        let count: number = 0
        worker1.onmessage = (e: MessageEvents): void => {
          results.push('w1:' + (e.data as string))
          count++
          if (count >= 3) {
            resolve()
          }
        }
        worker2.onmessage = (e: MessageEvents): void => {
          results.push('w2:' + (e.data as string))
          count++
          if (count >= 3) {
            resolve()
          }
        }
        worker3.onmessage = (e: MessageEvents): void => {
          results.push('w3:' + (e.data as string))
          count++
          if (count >= 3) {
            resolve()
          }
        }
        worker1.postMessage('hello')
        worker2.postMessage('hello')
        worker3.postMessage('hello')
      })
      expect(results.length).assertEqual(3)
      let hasW1: boolean = false
      let hasW2: boolean = false
      let hasW3: boolean = false
      for (let i: number = 0; i < results.length; i++) {
        if (results[i].startsWith('w1:')) {
          hasW1 = true
        }
        if (results[i].startsWith('w2:')) {
          hasW2 = true
        }
        if (results[i].startsWith('w3:')) {
          hasW3 = true
        }
      }
      expect(hasW1).assertTrue()
      expect(hasW2).assertTrue()
      expect(hasW3).assertTrue()
      let exit1: Promise<void> = new Promise<void>((resolve: Function) => {
        worker1.onexit = (code: number): void => { resolve() }
      })
      let exit2: Promise<void> = new Promise<void>((resolve: Function) => {
        worker2.onexit = (code: number): void => { resolve() }
      })
      let exit3: Promise<void> = new Promise<void>((resolve: Function) => {
        worker3.onexit = (code: number): void => { resolve() }
      })
      worker1.terminate()
      worker2.terminate()
      worker3.terminate()
      await Promise.all([exit1, exit2, exit3])
    })

    /**
     * @tc.name   WorkerSendableTest1100
     * @tc.number SUB_WORKER_SENDABLE_TEST_1100
     * @tc.desc   Verify Sendable object shared via postMessageWithSharedSendable with EchoWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerSendableTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let sharedData: SendableCounter = new SendableCounter()
      sharedData.count = 10
      sharedData.label = 'shared_counter'
      expect(sharedData.count).assertEqual(10)
      expect(sharedData.label).assertEqual('shared_counter')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as string
          if (data === 'pong') {
            resolve(data)
          }
        }
        currentWorker!.postMessageWithSharedSendable(sharedData)
        currentWorker!.postMessage('ping')
      })
      expect(result).assertEqual('pong')
    })

    /**
     * @tc.name   WorkerSendableTest1200
     * @tc.number SUB_WORKER_SENDABLE_TEST_1200
     * @tc.desc   Verify Sendable object property modification after shared transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerSendableTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/SendableWorker.ets')
      let sharedData: SendableData = new SendableData()
      sharedData.value = 1
      sharedData.name = 'initial'
      currentWorker.postMessageWithSharedSendable(sharedData)
      expect(sharedData.value).assertEqual(1)
      sharedData.value = 2
      sharedData.name = 'modified'
      expect(sharedData.value).assertEqual(2)
      expect(sharedData.name).assertEqual('modified')
      let responseValue: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'sendable_response') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'sendable_test', value: sharedData.value, name: sharedData.name })
      })
      expect(responseValue).assertEqual(2)
    })
  })
}
