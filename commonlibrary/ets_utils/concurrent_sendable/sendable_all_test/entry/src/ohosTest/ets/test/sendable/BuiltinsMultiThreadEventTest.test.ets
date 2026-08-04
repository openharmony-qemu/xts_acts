/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

@Sendable
class MultiThreadEventBus {
  public subscribers_: collections.Map<string, string>
  public eventQueue_: collections.Array<string>

  public publishCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(eventQueue_: collections.Array<string>, lock_: ArkTSUtils.locks.AsyncLock, subscribers_: collections.Map<string, string>) {
    this.subscribers_ = subscribers_
    this.eventQueue_ = eventQueue_
    this.lock_ = lock_
  }


  async subscribe(eventType: string, handlerId: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing === undefined || existing === null) {
        this.subscribers_.set(eventType, handlerId)
      } else {
        this.subscribers_.set(eventType, existing + ',' + handlerId)
      }
    })
  }

  async publish(eventType: string, data: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.eventQueue_.push(data)
      this.publishCount_++
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing === undefined || existing === null || existing === '') return 0
      return existing.split(',').length
    })
  }

  async getSubscriberCount(eventType: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing === undefined || existing === null || existing === '') return 0
      return existing.split(',').length
    })
  }

  async getQueueLength(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.eventQueue_.length)
  }

  async getPublishCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.publishCount_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.subscribers_.clear()
      while (this.eventQueue_.length > 0) { this.eventQueue_.pop() }
      this.publishCount_ = 0
    })
  }
}

@Concurrent
async function concurrentPublishTask(bus: MultiThreadEventBus, eventType: string, data: string): Promise<void> {
  await bus.publish(eventType, data)
}

@Concurrent
async function concurrentSubscribeTask(bus: MultiThreadEventBus, eventType: string, handlerId: string): Promise<void> {
  await bus.subscribe(eventType, handlerId)
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsMultiThreadEventTest(): void {
  describe('BuiltinsMultiThreadEventTest', () => {
    let bus: MultiThreadEventBus

    beforeEach(async (): Promise<void> => {
      bus = new MultiThreadEventBus(new collections.Array<string>(), new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
    })

    afterEach(async (): Promise<void> => {
      await bus.reset()
    })

    /**
     * @tc.name   testMultiThreadEvent0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREADEVENT_TEST_0100
     * @tc.desc   Verify testMultiThreadEvent0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiThreadEvent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(concurrentSubscribeTask, bus, 'click', `handler_${i}`))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getSubscriberCount('click')).assertEqual(10)
    })

    /**
     * @tc.name   testMultiThreadEvent0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREADEVENT_TEST_0200
     * @tc.desc   Verify testMultiThreadEvent0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiThreadEvent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await bus.subscribe('click', 'handler_1')
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(concurrentPublishTask, bus, 'click', `data_${i}`))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getPublishCount() >= 10).assertTrue()
    })

    /**
     * @tc.name   testMultiThreadEvent0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREADEVENT_TEST_0300
     * @tc.desc   Verify testMultiThreadEvent0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiThreadEvent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const subTasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        subTasks.push(new taskpool.Task(concurrentSubscribeTask, bus, 'click', `handler_${i}`))
      }
      await executeTasksGetObjects(subTasks)
      const pubTasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        pubTasks.push(new taskpool.Task(concurrentPublishTask, bus, 'click', `data_${i}`))
      }
      await executeTasksGetObjects(pubTasks)
      expect(await bus.getPublishCount() >= 5).assertTrue()
    })

    /**
     * @tc.name   testMultiThreadEvent0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREADEVENT_TEST_0400
     * @tc.desc   Verify testMultiThreadEvent0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiThreadEvent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const subTasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        subTasks.push(new taskpool.Task(concurrentSubscribeTask, bus, 'click', `handler_${i}`))
        subTasks.push(new taskpool.Task(concurrentSubscribeTask, bus, 'hover', `handler_${i}`))
      }
      await executeTasksGetObjects(subTasks)
      expect(await bus.getSubscriberCount('click')).assertEqual(5)
      expect(await bus.getSubscriberCount('hover')).assertEqual(5)
    })

    /**
     * @tc.name   testMultiThreadEvent0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREADEVENT_TEST_0500
     * @tc.desc   Verify testMultiThreadEvent0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiThreadEvent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 20; i++) {
        tasks.push(new taskpool.Task(concurrentPublishTask, bus, 'click', `data_${i}`))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getPublishCount() >= 20).assertTrue()
      expect(await bus.getQueueLength() >= 20).assertTrue()
    })

    /**
     * @tc.name   testMultiThreadEvent0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREADEVENT_TEST_0600
     * @tc.desc   Verify testMultiThreadEvent0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiThreadEvent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(concurrentSubscribeTask, bus, 'click', `handler_${i}`))
      }
      await executeTasksGetObjects(tasks)
      const pubTasks: taskpool.Task[] = []
      for (let i: number = 0; i < 20; i++) {
        pubTasks.push(new taskpool.Task(concurrentPublishTask, bus, 'click', `data_${i}`))
      }
      await executeTasksGetObjects(pubTasks)
      expect(await bus.getPublishCount() >= 20).assertTrue()
    })

    /**
     * @tc.name   testMultiThreadEvent0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREADEVENT_TEST_0700
     * @tc.desc   Verify testMultiThreadEvent0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiThreadEvent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 50; i++) {
        tasks.push(new taskpool.Task(concurrentSubscribeTask, bus, 'click', `handler_${i}`))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getSubscriberCount('click')).assertEqual(50)
    })

    /**
     * @tc.name   testMultiThreadEvent0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREADEVENT_TEST_0800
     * @tc.desc   Verify testMultiThreadEvent0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiThreadEvent0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(concurrentSubscribeTask, bus, `event_${i % 3}`, `handler_${i}`))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getSubscriberCount('event_0') > 0).assertTrue()
      expect(await bus.getSubscriberCount('event_1') > 0).assertTrue()
      expect(await bus.getSubscriberCount('event_2') > 0).assertTrue()
    })

    /**
     * @tc.name   testMultiThreadEvent0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREADEVENT_TEST_0900
     * @tc.desc   Verify testMultiThreadEvent0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiThreadEvent0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(concurrentPublishTask, bus, 'click', `data_${i}`))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getQueueLength() >= 10).assertTrue()
    })

    /**
     * @tc.name   testMultiThreadEvent1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREADEVENT_TEST_1000
     * @tc.desc   Verify testMultiThreadEvent1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiThreadEvent1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(concurrentSubscribeTask, bus, 'click', `handler_${i}`))
        tasks.push(new taskpool.Task(concurrentPublishTask, bus, 'click', `data_${i}`))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getSubscriberCount('click') > 0).assertTrue()
      expect(await bus.getPublishCount() >= 5).assertTrue()
    })
  })
}
