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
class TaskDispatchQueue {
  public tasks_: collections.Array<number>

  public processed_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(tasks_: collections.Array<number>, processed_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.tasks_ = tasks_
    this.processed_ = processed_
    this.lock_ = lock_
  }


  async enqueue(taskId: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.tasks_.push(taskId)
    })
  }

  async dequeue(): Promise<number | undefined> {
    return await this.lock_.lockAsync((): number | undefined => {
      if (this.tasks_.length > 0) {
        const taskId: number = this.tasks_[0]
        this.tasks_.splice(0, 1)
        return taskId
      }
      return undefined
    })
  }

  async markProcessed(taskId: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.processed_.push(taskId)
    })
  }

  async getPendingSize(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.tasks_.length)
  }

  async getProcessedSize(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.processed_.length)
  }

  async isPendingEmpty(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.tasks_.length === 0)
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.tasks_.length > 0) { this.tasks_.pop() }
      while (this.processed_.length > 0) { this.processed_.pop() }
    })
  }
}

@Concurrent
function producerEnqueue(taskId: number): number {
  return taskId
}

@Concurrent
function consumerDequeue(): number {
  return -1
}

export default function BuiltinsTaskDispatchQueueTest(): void {
  describe('BuiltinsTaskDispatchQueueTest', (): void => {
    let queue: TaskDispatchQueue

    beforeEach((): void => {
      queue = new TaskDispatchQueue(new collections.Array<number>(), new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
    })
    it('testTaskDispatchQueue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await queue.enqueue(1)
      expect(await queue.getPendingSize()).assertEqual(1)
    })

    it('testTaskDispatchQueue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await queue.enqueue(1)
      const taskId: number | undefined = await queue.dequeue()
      expect(taskId).assertEqual(1)
      expect(await queue.getPendingSize()).assertEqual(0)
    })

    it('testTaskDispatchQueue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(await queue.isPendingEmpty()).assertTrue()
      expect(await queue.getPendingSize()).assertEqual(0)
    })

    it('testTaskDispatchQueue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 10; i++) {
        await queue.enqueue(i)
      }
      expect(await queue.getPendingSize()).assertEqual(10)
    })

    it('testTaskDispatchQueue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 50; i++) {
        await queue.enqueue(i)
      }
      expect(await queue.getPendingSize()).assertEqual(50)
    })

    it('testTaskDispatchQueue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 10; i++) {
        await queue.enqueue(i)
      }
      for (let i = 0; i < 10; i++) {
        const taskId: number | undefined = await queue.dequeue()
        expect(taskId).assertEqual(i)
      }
      expect(await queue.isPendingEmpty()).assertTrue()
    })

    it('testTaskDispatchQueue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 20; i++) {
        tasks.push(new taskpool.Task(producerEnqueue, i))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await queue.enqueue(results[i] as number)
      }
      expect(await queue.getPendingSize()).assertLargerOrEqual(1)
    })

    it('testTaskDispatchQueue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 10; i++) {
        await queue.enqueue(i)
      }
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(consumerDequeue))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      for (let i = 0; i < 10; i++) {
        const taskId: number | undefined = await queue.dequeue()
        if (taskId !== undefined) {
          await queue.markProcessed(taskId)
        }
      }
      expect(await queue.isPendingEmpty()).assertTrue()
      expect(await queue.getProcessedSize()).assertLargerOrEqual(1)
    })

    it('testTaskDispatchQueue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const producerTasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        producerTasks.push(new taskpool.Task(producerEnqueue, i))
      }
      const producerPromises: Promise<Object>[] = []
      for (let i = 0; i < producerTasks.length; i++) {
        producerPromises.push(taskpool.execute(producerTasks[i]))
      }
      const producerResults: Object[] = await Promise.all(producerPromises)
      for (let i = 0; i < producerResults.length; i++) {
        await queue.enqueue(producerResults[i] as number)
      }
      expect(await queue.getPendingSize()).assertLargerOrEqual(1)

      for (let i = 0; i < 10; i++) {
        const taskId: number | undefined = await queue.dequeue()
        if (taskId !== undefined) {
          await queue.markProcessed(taskId)
        }
      }
      expect(await queue.getPendingSize()).assertEqual(0)
      expect(await queue.getProcessedSize()).assertLargerOrEqual(1)
    })

    it('testTaskDispatchQueue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const iterations: number = 100
      const enqueuePromises: Promise<void>[] = []
      for (let i = 0; i < iterations; i++) {
        enqueuePromises.push(queue.enqueue(i))
      }
      await Promise.all(enqueuePromises)
      expect(await queue.getPendingSize()).assertEqual(iterations)

      const dequeuePromises: Promise<number | undefined>[] = []
      for (let i = 0; i < iterations; i++) {
        dequeuePromises.push(queue.dequeue())
      }
      await Promise.all(dequeuePromises)
      expect(await queue.getPendingSize()).assertEqual(0)
    })

    it('testTaskDispatchQueue1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await queue.enqueue(1)
      await queue.enqueue(2)
      await queue.enqueue(3)
      const first: number | undefined = await queue.dequeue()
      expect(first).assertEqual(1)
      const second: number | undefined = await queue.dequeue()
      expect(second).assertEqual(2)
      const third: number | undefined = await queue.dequeue()
      expect(third).assertEqual(3)
      expect(await queue.isPendingEmpty()).assertTrue()
    })
  })
}
