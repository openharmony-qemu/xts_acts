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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import { Request } from '../../../workers/sendable'
import Utils from '../utils'

@Sendable
class RequestBufferQueue {
  public buffer_: collections.Array<Request>

  public capacity_: number = 200
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(buffer_: collections.Array<Request>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.buffer_ = buffer_
    this.lock_ = lock_
  }

  public processedCount_: number = 0
  public droppedCount_: number = 0

  async bufferRequest(id: number, type: string, payload: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (this.buffer_.length >= this.capacity_) {
        this.droppedCount_++
        return false
      }
      const request: Request = new Request(id, type, payload)
      this.buffer_.push(request)
      return true
    })
  }

  async processBatch(batchSize: number): Promise<Request[]> {
    return await this.lock_.lockAsync((): Request[] => {
      const batch: Request[] = []
      const actualSize: number = Math.min(batchSize, this.buffer_.length)
      for (let i = 0; i < actualSize; i++) {
        batch.push(this.buffer_[i])
      }
      for (let i = 0; i < actualSize; i++) {
        this.buffer_.splice(0, 1)
      }
      this.processedCount_ += actualSize
      return batch
    })
  }

  async size(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.buffer_.length)
  }

  async isFull(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.buffer_.length >= this.capacity_)
  }

  async getUtilization(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      return Math.floor((this.buffer_.length / this.capacity_) * 100)
    })
  }

  async getProcessedCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.processedCount_)
  }

  async getDroppedCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.droppedCount_)
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.buffer_.length > 0) { this.buffer_.pop() }
      this.processedCount_ = 0
      this.droppedCount_ = 0
    })
  }
}

@Concurrent
function bufferRequestTask(id: number, type: string): string {
  return `${id}|${type}`
}

export default function BuiltinsRequestBufferQueueTest(): void {
  describe('BuiltinsRequestBufferQueueTest', (): void => {
    let bufferQueue: RequestBufferQueue

    beforeEach((): void => {
      bufferQueue = new RequestBufferQueue(new collections.Array<Request>(), new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testRequestBufferQueue0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REQUESTBUFFERQUEUE_TEST_0100
     * @tc.desc   Verify testRequestBufferQueue0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRequestBufferQueue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const success: boolean = await bufferQueue.bufferRequest(1, 'GET', 'test')
      expect(success).assertTrue()
      expect(await bufferQueue.size()).assertEqual(1)
    })

    /**
     * @tc.name   testRequestBufferQueue0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REQUESTBUFFERQUEUE_TEST_0200
     * @tc.desc   Verify testRequestBufferQueue0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRequestBufferQueue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bufferQueue.bufferRequest(1, 'GET', 'test')
      const batch: Request[] = await bufferQueue.processBatch(1)
      expect(batch.length).assertEqual(1)
      expect(batch[0].requestId_).assertEqual(1)
      expect(await bufferQueue.size()).assertEqual(0)
    })

    /**
     * @tc.name   testRequestBufferQueue0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REQUESTBUFFERQUEUE_TEST_0300
     * @tc.desc   Verify testRequestBufferQueue0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRequestBufferQueue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await bufferQueue.size()).assertEqual(0)
    })

    /**
     * @tc.name   testRequestBufferQueue0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REQUESTBUFFERQUEUE_TEST_0400
     * @tc.desc   Verify testRequestBufferQueue0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestBufferQueue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises: Promise<boolean>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(bufferQueue.bufferRequest(i, 'GET', `payload_${i}`))
      }
      const results: boolean[] = await Promise.all(promises)
      let successCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i]) {
          successCount++
        }
      }
      expect(successCount).assertEqual(100)
      expect(await bufferQueue.size()).assertEqual(100)
    })

    /**
     * @tc.name   testRequestBufferQueue0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REQUESTBUFFERQUEUE_TEST_0500
     * @tc.desc   Verify testRequestBufferQueue0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestBufferQueue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      bufferQueue.capacity_ = 50
      const promises: Promise<boolean>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(bufferQueue.bufferRequest(i, 'GET', `payload_${i}`))
      }
      const results: boolean[] = await Promise.all(promises)
      let successCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i]) {
          successCount++
        }
      }
      expect(successCount).assertEqual(50)
      expect(await bufferQueue.getDroppedCount()).assertEqual(50)
    })

    /**
     * @tc.name   testRequestBufferQueue0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REQUESTBUFFERQUEUE_TEST_0600
     * @tc.desc   Verify testRequestBufferQueue0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRequestBufferQueue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 50; i++) {
        await bufferQueue.bufferRequest(i, 'GET', `payload_${i}`)
      }
      const batch1: Request[] = await bufferQueue.processBatch(20)
      expect(batch1.length).assertEqual(20)
      expect(await bufferQueue.size()).assertEqual(30)
      const batch2: Request[] = await bufferQueue.processBatch(30)
      expect(batch2.length).assertEqual(30)
      expect(await bufferQueue.size()).assertEqual(0)
    })

    /**
     * @tc.name   testRequestBufferQueue0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REQUESTBUFFERQUEUE_TEST_0700
     * @tc.desc   Verify testRequestBufferQueue0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRequestBufferQueue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 100; i++) {
        await bufferQueue.bufferRequest(i, 'GET', `payload_${i}`)
      }
      const utilization: number = await bufferQueue.getUtilization()
      expect(utilization).assertEqual(50)
    })

    /**
     * @tc.name   testRequestBufferQueue0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REQUESTBUFFERQUEUE_TEST_0800
     * @tc.desc   Verify testRequestBufferQueue0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestBufferQueue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 50; i++) {
        tasks.push(new taskpool.Task(bufferRequestTask, i, 'GET'))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        const parts: string[] = (results[i] as string).split('|')
        await bufferQueue.bufferRequest(parseInt(parts[0]), parts[1], `payload_${parts[0]}`)
      }
      expect(await bufferQueue.size()).assertLargerOrEqual(1)
    })

    /**
     * @tc.name   testRequestBufferQueue0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REQUESTBUFFERQUEUE_TEST_0900
     * @tc.desc   Verify testRequestBufferQueue0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRequestBufferQueue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 30; i++) {
        await bufferQueue.bufferRequest(i, 'GET', `payload_${i}`)
      }
      await bufferQueue.processBatch(30)
      expect(await bufferQueue.getProcessedCount()).assertEqual(30)
    })

    /**
     * @tc.name   testRequestBufferQueue1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REQUESTBUFFERQUEUE_TEST_1000
     * @tc.desc   Verify testRequestBufferQueue1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestBufferQueue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      bufferQueue.capacity_ = 20
      for (let i = 0; i < 20; i++) {
        await bufferQueue.bufferRequest(i, 'GET', `payload_${i}`)
      }
      expect(await bufferQueue.isFull()).assertTrue()
      expect(await bufferQueue.getUtilization()).assertEqual(100)
    })
  })
}
