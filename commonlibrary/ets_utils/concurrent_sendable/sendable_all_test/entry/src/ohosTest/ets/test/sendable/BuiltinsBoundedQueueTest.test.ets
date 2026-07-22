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
import Utils from '../utils'

@Sendable
class BoundedQueue {
  public queue_: collections.Array<number>

  public capacity_: number = 10
  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(capacity: number, queue_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.queue_ = queue_
    this.lock_ = lock_

    this.capacity_ = capacity
  }

  async offer(item: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (this.queue_.length < this.capacity_) {
        this.queue_.push(item)
        return true
      }
      return false
    })
  }

  async poll(): Promise<number | undefined> {
    return await this.lock_.lockAsync((): number | undefined => {
      if (this.queue_.length > 0) {
        const item: number = this.queue_[0]
        this.queue_.splice(0, 1)
        return item
      }
      return undefined
    })
  }

  async size(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.queue_.length)
  }

  async isFull(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.queue_.length >= this.capacity_)
  }

  async isEmpty(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.queue_.length === 0)
  }

  async peek(): Promise<number | undefined> {
    return await this.lock_.lockAsync((): number | undefined => {
      if (this.queue_.length > 0) {
        return this.queue_[0]
      }
      return undefined
    })
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.queue_.length > 0) { this.queue_.pop() }
    })
  }
}

@Concurrent
function offerTask(value: number): number {
  return value
}

export default function BuiltinsBoundedQueueTest(): void {
  describe('BuiltinsBoundedQueueTest', (): void => {
    let queue: BoundedQueue

    beforeEach((): void => {
      queue = new BoundedQueue(10, new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
    })
    it('testBoundedQueue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(await queue.size()).assertEqual(0)
      expect(await queue.isEmpty()).assertTrue()
    })

    it('testBoundedQueue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const success: boolean = await queue.offer(1)
      expect(success).assertTrue()
      expect(await queue.size()).assertEqual(1)
    })

    it('testBoundedQueue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 10; i++) {
        await queue.offer(i)
      }
      expect(await queue.isFull()).assertTrue()
      const success: boolean = await queue.offer(11)
      expect(success).assertFalse()
    })

    it('testBoundedQueue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await queue.offer(1)
      await queue.offer(2)
      const item1: number | undefined = await queue.poll()
      expect(item1).assertEqual(1)
      const item2: number | undefined = await queue.poll()
      expect(item2).assertEqual(2)
    })

    it('testBoundedQueue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const item: number | undefined = await queue.poll()
      expect(item === undefined).assertTrue()
    })

    it('testBoundedQueue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await queue.offer(1)
      await queue.offer(2)
      const item: number | undefined = await queue.peek()
      expect(item).assertEqual(1)
      expect(await queue.size()).assertEqual(2)
    })

    it('testBoundedQueue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises: Promise<boolean>[] = []
      for (let i = 0; i < 20; i++) {
        promises.push(queue.offer(i))
      }
      const results: boolean[] = await Promise.all(promises)
      let successCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i]) {
          successCount++
        }
      }
      expect(successCount).assertEqual(10)
      expect(await queue.size()).assertEqual(10)
    })

    it('testBoundedQueue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 10; i++) {
        await queue.offer(i)
      }
      const promises: Promise<number | undefined>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(queue.poll())
      }
      const results: (number | undefined)[] = await Promise.all(promises)
      let validCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i] !== undefined) {
          validCount++
        }
      }
      expect(validCount).assertEqual(10)
      expect(await queue.isEmpty()).assertTrue()
    })

    it('testBoundedQueue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(offerTask, i))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await queue.offer(results[i] as number)
      }
      expect(await queue.size()).assertLargerOrEqual(1)
    })

    it('testBoundedQueue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 10; i++) {
        await queue.offer(i)
      }
      for (let i = 0; i < 10; i++) {
        const item: number | undefined = await queue.poll()
        expect(item).assertEqual(i)
      }
    })

    it('testBoundedQueue1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const smallQueue: BoundedQueue = new BoundedQueue(5, new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 5; i++) {
        const success: boolean = await smallQueue.offer(i)
        expect(success).assertTrue()
      }
      expect(await smallQueue.isFull()).assertTrue()
      const overflow: boolean = await smallQueue.offer(99)
      expect(overflow).assertFalse()
    })

    it('testBoundedQueue1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 10; i++) {
        await queue.offer(i)
      }
      expect(await queue.isFull()).assertTrue()
      await queue.poll()
      expect(await queue.isFull()).assertFalse()
      const success: boolean = await queue.offer(10)
      expect(success).assertTrue()
    })
  })
}
