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

@Sendable
class EventBusEvent {
  public type_: string = ''
  public data_: string = ''

  constructor(type: string, data: string) {
    this.type_ = type
    this.data_ = data
  }
}

@Sendable
class PublishEventBus {
  public subscribers_: collections.Map<string, string>
  public eventQueue_: collections.Array<EventBusEvent>

  public publishCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(eventQueue_: collections.Array<EventBusEvent>, lock_: ArkTSUtils.locks.AsyncLock, subscribers_: collections.Map<string, string>) {
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
      this.eventQueue_.push(new EventBusEvent(eventType, data))
      this.publishCount_++
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing === undefined || existing === null || existing === '') {
        return 0
      }
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
async function publishTask(bus: PublishEventBus, eventType: string, data: string): Promise<number> {
  return await bus.lock_.lockAsync((): number => {
    bus.publishCount_++
    const existing: string | undefined = bus.subscribers_.get(eventType)
    if (existing === undefined || existing === null || existing === '') return 0
    return existing.split(',').length

  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function EventPublishTest(): void {
  describe('EventPublishTest', () => {
    let bus: PublishEventBus

    beforeEach(async (): Promise<void> => {
      bus = new PublishEventBus(new collections.Array<EventBusEvent>(), new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
    })

    afterEach(async (): Promise<void> => {
      await bus.reset()
    })

    /**
     * @tc.name   testEventPublish0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTPUBLISH_TEST_0100
     * @tc.desc   Verify testEventPublish0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventPublish0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await bus.subscribe('click', 'handler_1')
        const count: number = await bus.publish('click', 'test_data')
        expect(count).assertEqual(1)
        expect(await bus.getQueueLength()).assertEqual(1)
      } catch (error) {
        console.error("testEventPublish0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEventPublish0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTPUBLISH_TEST_0200
     * @tc.desc   Verify testEventPublish0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventPublish0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await bus.subscribe('click', 'handler_1')
        await bus.subscribe('click', 'handler_2')
        const count: number = await bus.publish('click', 'test_data')
        expect(count).assertEqual(2)
      } catch (error) {
        console.error("testEventPublish0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEventPublish0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTPUBLISH_TEST_0300
     * @tc.desc   Verify testEventPublish0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventPublish0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const count: number = await bus.publish('click', 'test_data')
        expect(count).assertEqual(0)
        expect(await bus.getQueueLength()).assertEqual(1)
      } catch (error) {
        console.error("testEventPublish0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEventPublish0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTPUBLISH_TEST_0400
     * @tc.desc   Verify testEventPublish0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventPublish0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await bus.publish('click', 'data_1')
        await bus.publish('click', 'data_2')
        expect(await bus.getPublishCount()).assertEqual(2)
        expect(await bus.getQueueLength()).assertEqual(2)
      } catch (error) {
        console.error("testEventPublish0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEventPublish0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTPUBLISH_TEST_0500
     * @tc.desc   Verify testEventPublish0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventPublish0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await bus.subscribe('click', 'handler_1')
        await bus.subscribe('hover', 'handler_2')
        const c1: number = await bus.publish('click', 'data')
        const c2: number = await bus.publish('hover', 'data')
        expect(c1).assertEqual(1)
        expect(c2).assertEqual(1)
      } catch (error) {
        console.error("testEventPublish0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEventPublish0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTPUBLISH_TEST_0600
     * @tc.desc   Verify testEventPublish0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventPublish0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await bus.subscribe('click', 'handler_1')
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(publishTask, bus, 'click', `data_${i}`))
        }
        await executeTasksGetObjects(tasks)
        expect(await bus.getPublishCount() >= 10).assertTrue()
      } catch (error) {
        console.error("testEventPublish0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEventPublish0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTPUBLISH_TEST_0700
     * @tc.desc   Verify testEventPublish0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventPublish0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await bus.subscribe('click', 'handler_1')
        await bus.subscribe('click', 'handler_2')
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(publishTask, bus, 'click', `data_${i}`))
        }
        await executeTasksGetObjects(tasks)
        expect(await bus.getPublishCount() >= 5).assertTrue()
      } catch (error) {
        console.error("testEventPublish0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEventPublish0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTPUBLISH_TEST_0800
     * @tc.desc   Verify testEventPublish0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventPublish0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        for (let i: number = 0; i < 10; i++) {
          await bus.publish('click', `data_${i}`)
        }
        expect(await bus.getPublishCount()).assertEqual(10)
        expect(await bus.getQueueLength()).assertEqual(10)
      } catch (error) {
        console.error("testEventPublish0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEventPublish0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTPUBLISH_TEST_0900
     * @tc.desc   Verify testEventPublish0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventPublish0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await bus.publish('click', 'data')
        await bus.reset()
        expect(await bus.getPublishCount()).assertEqual(0)
        expect(await bus.getQueueLength()).assertEqual(0)
      } catch (error) {
        console.error("testEventPublish0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEventPublish1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTPUBLISH_TEST_1000
     * @tc.desc   Verify testEventPublish1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventPublish1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await bus.subscribe('click', 'handler_1')
        await bus.publish('click', '')
        expect(await bus.getQueueLength()).assertEqual(1)
      } catch (error) {
        console.error("testEventPublish1000 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
