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
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'
import { EventQueueItem } from '../../../workers/sendable'

@Sendable
class EventQueueBus {
  public queue_: collections.Array<EventQueueItem>

  public maxSize_: number = 100
  public droppedCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(queue_: collections.Array<EventQueueItem>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.queue_ = queue_
    this.lock_ = lock_
  }


  async setMaxSize(maxSize: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.maxSize_ = maxSize
    })
  }

  async enqueue(type: string, data: string, priority: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (this.queue_.length >= this.maxSize_) {
        this.droppedCount_++
        return false
      }
      this.queue_.push(new EventQueueItem(type, data, priority))
      return true
    })
  }

  async dequeue(): Promise<EventQueueItem | null> {
    return await this.lock_.lockAsync((): EventQueueItem | null => {
      if (this.queue_.length === 0) return null
      const item: EventQueueItem = this.queue_[0]
      this.queue_.shift()
      return item
    })
  }

  async peek(): Promise<EventQueueItem | null> {
    return await this.lock_.lockAsync((): EventQueueItem | null => {
      if (this.queue_.length === 0) return null
      return this.queue_[0]
    })
  }

  async getQueueLength(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.queue_.length)
  }

  async getDroppedCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.droppedCount_)
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.queue_.length > 0) { this.queue_.pop() }
      this.droppedCount_ = 0
    })
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.queue_.length > 0) { this.queue_.pop() }
      this.maxSize_ = 100
      this.droppedCount_ = 0
    })
  }
}

@Concurrent
async function enqueueTask(bus: EventQueueBus, type: string, data: string, priority: number): Promise<boolean> {
  return await bus.lock_.lockAsync((): boolean => {
    if (bus.queue_.length >= bus.maxSize_) {
      bus.droppedCount_++
      return false
    }
    bus.queue_.push(new EventQueueItem(type, data, priority))
    return true
  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function EventQueueTest(): void {
  describe('EventQueueTest', () => {
    let bus: EventQueueBus

    beforeEach(async (): Promise<void> => {
      bus = new EventQueueBus(new collections.Array<EventQueueItem>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await bus.reset()
    })

    /**
     * @tc.name   testEventQueue0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_0100
     * @tc.desc   Verify testEventQueue0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventQueue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = await bus.enqueue('click', 'data', 1)
      expect(result).assertTrue()
      expect(await bus.getQueueLength()).assertEqual(1)
    })

    /**
     * @tc.name   testEventQueue0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_0200
     * @tc.desc   Verify testEventQueue0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventQueue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.enqueue('click', 'data_1', 1)
      await bus.enqueue('click', 'data_2', 2)
      expect(await bus.getQueueLength()).assertEqual(2)
    })

    /**
     * @tc.name   testEventQueue0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_0300
     * @tc.desc   Verify testEventQueue0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventQueue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.enqueue('click', 'data', 1)
      const item: EventQueueItem | null = await bus.dequeue()
      expect((item as EventQueueItem).data_).assertEqual('data')
      expect(await bus.getQueueLength()).assertEqual(0)
    })

    /**
     * @tc.name   testEventQueue0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_0400
     * @tc.desc   Verify testEventQueue0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventQueue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const item: EventQueueItem | null = await bus.dequeue()
      expect(item === null).assertTrue()
    })

    /**
     * @tc.name   testEventQueue0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_0500
     * @tc.desc   Verify testEventQueue0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventQueue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.enqueue('click', 'data', 1)
      const item: EventQueueItem | null = await bus.peek()
      expect(await bus.getQueueLength()).assertEqual(1)
    })

    /**
     * @tc.name   testEventQueue0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_0600
     * @tc.desc   Verify testEventQueue0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventQueue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.setMaxSize(2)
      const r1: boolean = await bus.enqueue('click', 'data_1', 1)
      const r2: boolean = await bus.enqueue('click', 'data_2', 2)
      const r3: boolean = await bus.enqueue('click', 'data_3', 3)
      expect(r1).assertTrue()
      expect(r2).assertTrue()
      expect(r3).assertFalse()
      expect(await bus.getDroppedCount()).assertEqual(1)
    })

    /**
     * @tc.name   testEventQueue0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_0700
     * @tc.desc   Verify testEventQueue0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventQueue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(enqueueTask, bus, 'click', `data_${i}`, 1))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getQueueLength()).assertEqual(10)
    })

    /**
     * @tc.name   testEventQueue0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_0800
     * @tc.desc   Verify testEventQueue0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventQueue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await bus.setMaxSize(5)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(enqueueTask, bus, 'click', `data_${i}`, 1))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getQueueLength()).assertEqual(5)
      expect(await bus.getDroppedCount() >= 5).assertTrue()
    })

    /**
     * @tc.name   testEventQueue0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_0900
     * @tc.desc   Verify testEventQueue0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventQueue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i: number = 0; i < 5; i++) {
        await bus.enqueue('click', `data_${i}`, 1)
      }
      await bus.clear()
      expect(await bus.getQueueLength()).assertEqual(0)
    })

    /**
     * @tc.name   testEventQueue1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_1000
     * @tc.desc   Verify testEventQueue1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventQueue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.enqueue('click', 'data_1', 1)
      await bus.enqueue('click', 'data_2', 2)
      const item1: EventQueueItem | null = await bus.dequeue()
      const item2: EventQueueItem | null = await bus.dequeue()
      expect((item1 as EventQueueItem).data_).assertEqual('data_1')
      expect((item2 as EventQueueItem).data_).assertEqual('data_2')
    })

    /**
     * @tc.name   testEventQueue1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_1100
     * @tc.desc   Verify testEventQueue1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventQueue1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.enqueue('click', 'data', 1)
      await bus.reset()
      expect(await bus.getQueueLength()).assertEqual(0)
      expect(await bus.getDroppedCount()).assertEqual(0)
    })

    /**
     * @tc.name   testEventQueue1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTQUEUE_TEST_1200
     * @tc.desc   Verify testEventQueue1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventQueue1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i: number = 0; i < 20; i++) {
        await bus.enqueue('click', `data_${i}`, 1)
      }
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(enqueueTask, bus, 'click', `extra_${i}`, 1))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getQueueLength()).assertEqual(30)
    })
  })
}
