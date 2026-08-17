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
async function producerEnqueue(queue: TaskDispatchQueue, taskId: number): Promise<void> {
  await queue.enqueue(taskId)
}

@Concurrent
async function consumerDequeue(queue: TaskDispatchQueue): Promise<void> {
  const taskId: number | undefined = await queue.dequeue()
  if (taskId !== undefined) {
    await queue.markProcessed(taskId)
  }
}

export default function TaskDispatchQueueTest(): void {
  describe('TaskDispatchQueueTest', (): void => {
    let queue: TaskDispatchQueue

    beforeEach((): void => {
      queue = new TaskDispatchQueue(new collections.Array<number>(), new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testTaskDispatchQueue0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_0100
     * @tc.desc   Verify testTaskDispatchQueue0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskDispatchQueue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await queue.enqueue(1)
        expect(await queue.getPendingSize()).assertEqual(1)
      } catch (error) {
        console.error("testTaskDispatchQueue0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskDispatchQueue0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_0200
     * @tc.desc   Verify testTaskDispatchQueue0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskDispatchQueue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await queue.enqueue(1)
        const taskId: number | undefined = await queue.dequeue()
        expect(taskId).assertEqual(1)
        expect(await queue.getPendingSize()).assertEqual(0)
      } catch (error) {
        console.error("testTaskDispatchQueue0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskDispatchQueue0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_0300
     * @tc.desc   Verify testTaskDispatchQueue0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskDispatchQueue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        expect(await queue.isPendingEmpty()).assertTrue()
        expect(await queue.getPendingSize()).assertEqual(0)
      } catch (error) {
        console.error("testTaskDispatchQueue0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskDispatchQueue0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_0400
     * @tc.desc   Verify testTaskDispatchQueue0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskDispatchQueue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        for (let i = 0; i < 10; i++) {
          await queue.enqueue(i)
        }
        expect(await queue.getPendingSize()).assertEqual(10)
      } catch (error) {
        console.error("testTaskDispatchQueue0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskDispatchQueue0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_0500
     * @tc.desc   Verify testTaskDispatchQueue0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskDispatchQueue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        for (let i = 0; i < 50; i++) {
          await queue.enqueue(i)
        }
        expect(await queue.getPendingSize()).assertEqual(50)
      } catch (error) {
        console.error("testTaskDispatchQueue0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskDispatchQueue0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_0600
     * @tc.desc   Verify testTaskDispatchQueue0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskDispatchQueue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        for (let i = 0; i < 10; i++) {
          await queue.enqueue(i)
        }
        for (let i = 0; i < 10; i++) {
          const taskId: number | undefined = await queue.dequeue()
          expect(taskId).assertEqual(i)
        }
        expect(await queue.isPendingEmpty()).assertTrue()
      } catch (error) {
        console.error("testTaskDispatchQueue0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskDispatchQueue0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_0700
     * @tc.desc   Verify testTaskDispatchQueue0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskDispatchQueue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i = 0; i < 20; i++) {
          tasks.push(new taskpool.Task(producerEnqueue, queue, i))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        expect(await queue.getPendingSize()).assertEqual(20)
      } catch (error) {
        console.error("testTaskDispatchQueue0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskDispatchQueue0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_0800
     * @tc.desc   Verify testTaskDispatchQueue0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskDispatchQueue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        for (let i = 0; i < 10; i++) {
          await queue.enqueue(i)
        }
        const tasks: taskpool.Task[] = []
        for (let i = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(consumerDequeue, queue))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        expect(await queue.isPendingEmpty()).assertTrue()
        expect(await queue.getProcessedSize()).assertEqual(10)
      } catch (error) {
        console.error("testTaskDispatchQueue0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskDispatchQueue0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_0900
     * @tc.desc   Verify testTaskDispatchQueue0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskDispatchQueue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const producerTasks: taskpool.Task[] = []
        for (let i = 0; i < 10; i++) {
          producerTasks.push(new taskpool.Task(producerEnqueue, queue, i))
        }
        const producerPromises: Promise<Object>[] = []
        for (let i = 0; i < producerTasks.length; i++) {
          producerPromises.push(taskpool.execute(producerTasks[i]))
        }
        await Promise.all(producerPromises)
        expect(await queue.getPendingSize()).assertEqual(10)

        const consumerPromises: Promise<Object>[] = []
        for (let i = 0; i < 10; i++) {
          consumerPromises.push(taskpool.execute(new taskpool.Task(consumerDequeue, queue)))
        }
        await Promise.all(consumerPromises)
        expect(await queue.getPendingSize()).assertEqual(0)
        expect(await queue.getProcessedSize()).assertEqual(10)
      } catch (error) {
        console.error("testTaskDispatchQueue0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskDispatchQueue1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_1000
     * @tc.desc   Verify testTaskDispatchQueue1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskDispatchQueue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
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
      } catch (error) {
        console.error("testTaskDispatchQueue1000 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskDispatchQueue1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKDISPATCHQUEUE_TEST_1100
     * @tc.desc   Verify testTaskDispatchQueue1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskDispatchQueue1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
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
      } catch (error) {
        console.error("testTaskDispatchQueue1100 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
