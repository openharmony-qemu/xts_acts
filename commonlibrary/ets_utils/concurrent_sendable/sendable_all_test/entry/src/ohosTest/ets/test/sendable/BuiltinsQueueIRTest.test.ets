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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class IRQueue {
  public items_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(items_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.items_ = items_
    this.lock_ = lock_
  }


  async enqueue(v: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.items_.push(v)
    })
  }

  async dequeue(): Promise<number | undefined> {
    return await this.lock_.lockAsync((): number | undefined => {
      if (this.items_.length > 0) {
        const item: number = this.items_[0]
        this.items_.splice(0, 1)
        return item
      }
      return undefined
    })
  }

  async getSize(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.items_.length)
  }
}

@Sendable
class ProducerConsumerIRQueue {
  public queue_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(queue_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.queue_ = queue_
    this.lock_ = lock_
  }


  async produce(v: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.queue_.push(v)
    })
  }

  async consume(): Promise<number | undefined> {
    return await this.lock_.lockAsync((): number | undefined => {
      if (this.queue_.length > 0) {
        const item: number = this.queue_[0]
        this.queue_.splice(0, 1)
        return item
      }
      return undefined
    })
  }
}

@Sendable
class ElementIRQueue {
  public items_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(items_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.items_ = items_
    this.lock_ = lock_
  }


  async getElement(idx: number): Promise<number | undefined> {
    return await this.lock_.lockAsync((): number | undefined => {
      if (idx >= 0 && idx < this.items_.length) {
        return this.items_[idx]
      }
      return undefined
    })
  }
}

@Sendable
class CapacityIRQueue {
  public items_: collections.Array<number>

  public capacity_: number = 1024
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(items_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.items_ = items_
    this.lock_ = lock_
  }


  async getCapacity(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.capacity_)
  }
}

@Sendable
class CrossThreadIRQueue {
  public items_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(items_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.items_ = items_
    this.lock_ = lock_
  }

}

@Concurrent
function readQueueItem(idx: number): number {
  return idx
}

@Concurrent
function produceIRTask(v: number): number {
  return v
}

export default function BuiltinsQueueIRTest(): void {
  describe('BuiltinsQueueIRTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    it('testQueueIR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const queue: IRQueue = new IRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1024; i++) {
        await queue.enqueue(i)
      }
      expect(await queue.getSize()).assertEqual(1024)
    })

    it('testQueueIR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const queue: IRQueue = new IRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1025; i++) {
        await queue.enqueue(i)
      }
      expect(await queue.getSize()).assertEqual(1025)
      const lastItem: number | undefined = await queue.dequeue()
      for (let i = 0; i < 1024; i++) {
        await queue.dequeue()
      }
      expect(lastItem).assertEqual(0)
    })

    it('testQueueIR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pcQueue: ProducerConsumerIRQueue = new ProducerConsumerIRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 100; i++) {
        await pcQueue.produce(i)
      }
      for (let i = 0; i < 100; i++) {
        const item: number | undefined = await pcQueue.consume()
        expect(item).assertEqual(i)
      }
    })

    it('testQueueIR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const queue: IRQueue = new IRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(produceIRTask, i))
      }
      const batchSize: number = 50
      for (let batch = 0; batch < Math.ceil(100 / batchSize); batch++) {
        const batchTasks: taskpool.Task[] = tasks.slice(batch * batchSize, (batch + 1) * batchSize)
        const promises: Promise<Object>[] = []
        for (let i = 0; i < batchTasks.length; i++) {
          promises.push(taskpool.execute(batchTasks[i]))
        }
        const results: Object[] = await Promise.all(promises)
        for (let i = 0; i < results.length; i++) {
          await queue.enqueue(results[i] as number)
        }
      }
      expect(await queue.getSize()).assertLargerOrEqual(1)
    })

    it('testQueueIR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const queue: IRQueue = new IRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      for (let cycle = 0; cycle < 10; cycle++) {
        for (let i = 0; i < 100; i++) {
          await queue.enqueue(i)
        }
        for (let i = 0; i < 50; i++) {
          await queue.dequeue()
        }
      }
      expect(await queue.getSize()).assertEqual(500)
    })

    it('testQueueIR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const queue: ElementIRQueue = new ElementIRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      await queue.lock_.lockAsync((): void => {
        for (let i = 0; i < 100; i++) {
          queue.items_.push(i)
        }
      })
      expect(await queue.getElement(0)).assertEqual(0)
      expect(await queue.getElement(99)).assertEqual(99)
    })

    it('testQueueIR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const queue: IRQueue = new IRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      await queue.enqueue(1)
      for (let i = 0; i < 50; i++) {
        const size: number = await queue.getSize()
        expect(size).assertEqual(1)
      }
    })

    it('testQueueIR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const queue: CapacityIRQueue = new CapacityIRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      expect(await queue.getCapacity()).assertEqual(1024)
      await queue.lock_.lockAsync((): void => {
        for (let i = 0; i < queue.capacity_; i++) {
          queue.items_.push(i)
        }
      })
      expect(queue.items_.length).assertEqual(1024)
    })

    it('testQueueIR0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const queue1: IRQueue = new IRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      const queue2: IRQueue = new IRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      await queue1.enqueue(1)
      await queue2.enqueue(2)
      expect(await queue1.getSize()).assertEqual(1)
      expect(await queue2.getSize()).assertEqual(1)
    })

    it('testQueueIR1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const queue: CrossThreadIRQueue = new CrossThreadIRQueue(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      await queue.lock_.lockAsync((): void => {
        for (let i = 0; i < 10; i++) {
          queue.items_.push(i)
        }
      })
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readQueueItem, i))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < 10; i++) {
        expect(results[i]).assertEqual(i)
      }
    })
  })
}
