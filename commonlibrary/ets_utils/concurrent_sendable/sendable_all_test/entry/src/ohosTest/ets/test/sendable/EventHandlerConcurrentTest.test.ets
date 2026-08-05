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
class ConcurrentHandlerEventBus {
  public handlers_: collections.Map<string, string>
  public executionCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock, handlers_: collections.Map<string, string>) {
    this.handlers_ = handlers_
    this.lock_ = lock_
  }


  async registerHandler(eventType: string, handlerId: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const existing: string | undefined = this.handlers_.get(eventType)
      if (existing === undefined || existing === null) {
        this.handlers_.set(eventType, handlerId)
      } else {
        this.handlers_.set(eventType, existing + ',' + handlerId)
      }
    })
  }

  async executeHandlers(eventType: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const existing: string | undefined = this.handlers_.get(eventType)
      if (existing === undefined || existing === null || existing === '') return 0
      const count: number = existing.split(',').length
      this.executionCount_ += count
      return count
    })
  }

  async getHandlerCount(eventType: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const existing: string | undefined = this.handlers_.get(eventType)
      if (existing === undefined || existing === null || existing === '') return 0
      return existing.split(',').length
    })
  }

  async getExecutionCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.executionCount_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.handlers_.clear()
      this.executionCount_ = 0
    })
  }
}

@Concurrent
async function concurrentExecuteTask(bus: ConcurrentHandlerEventBus, eventType: string): Promise<number> {
  return await bus.lock_.lockAsync((): number => {
    const existing: string | undefined = bus.handlers_.get(eventType)
    if (existing === undefined || existing === null || existing === '') return 0
    const count: number = existing.split(',').length
    bus.executionCount_ += count
    return count

  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function EventHandlerConcurrentTest(): void {
  describe('EventHandlerConcurrentTest', () => {
    let bus: ConcurrentHandlerEventBus

    beforeEach(async (): Promise<void> => {
      bus = new ConcurrentHandlerEventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
    })

    afterEach(async (): Promise<void> => {
      await bus.reset()
    })

    /**
     * @tc.name   testEventHandlerConcurrent0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTHANDLERCONCURRENT_TEST_0100
     * @tc.desc   Verify testEventHandlerConcurrent0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventHandlerConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.registerHandler('click', 'handler_1')
      const count: number = await bus.executeHandlers('click')
      expect(count).assertEqual(1)
      expect(await bus.getExecutionCount()).assertEqual(1)
    })

    /**
     * @tc.name   testEventHandlerConcurrent0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTHANDLERCONCURRENT_TEST_0200
     * @tc.desc   Verify testEventHandlerConcurrent0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventHandlerConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.registerHandler('click', 'handler_1')
      await bus.registerHandler('click', 'handler_2')
      const count: number = await bus.executeHandlers('click')
      expect(count).assertEqual(2)
    })

    /**
     * @tc.name   testEventHandlerConcurrent0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTHANDLERCONCURRENT_TEST_0300
     * @tc.desc   Verify testEventHandlerConcurrent0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventHandlerConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await bus.registerHandler('click', 'handler_1')
      await bus.registerHandler('click', 'handler_2')
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(concurrentExecuteTask, bus, 'click'))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getExecutionCount() >= 10).assertTrue()
    })

    /**
     * @tc.name   testEventHandlerConcurrent0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTHANDLERCONCURRENT_TEST_0400
     * @tc.desc   Verify testEventHandlerConcurrent0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventHandlerConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const count: number = await bus.executeHandlers('unknown')
      expect(count).assertEqual(0)
    })

    /**
     * @tc.name   testEventHandlerConcurrent0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTHANDLERCONCURRENT_TEST_0500
     * @tc.desc   Verify testEventHandlerConcurrent0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventHandlerConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i: number = 0; i < 10; i++) {
        await bus.registerHandler('click', `handler_${i}`)
      }
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(concurrentExecuteTask, bus, 'click'))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getExecutionCount() >= 30).assertTrue()
    })

    /**
     * @tc.name   testEventHandlerConcurrent0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTHANDLERCONCURRENT_TEST_0600
     * @tc.desc   Verify testEventHandlerConcurrent0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventHandlerConcurrent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.registerHandler('click', 'handler_1')
      await bus.registerHandler('hover', 'handler_2')
      const c1: number = await bus.executeHandlers('click')
      const c2: number = await bus.executeHandlers('hover')
      expect(c1).assertEqual(1)
      expect(c2).assertEqual(1)
    })

    /**
     * @tc.name   testEventHandlerConcurrent0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTHANDLERCONCURRENT_TEST_0700
     * @tc.desc   Verify testEventHandlerConcurrent0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventHandlerConcurrent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i: number = 0; i < 5; i++) {
        await bus.registerHandler('click', `handler_${i}`)
        await bus.registerHandler('hover', `handler_${i}`)
      }
      const tasks: taskpool.Task[] = []
      tasks.push(new taskpool.Task(concurrentExecuteTask, bus, 'click'))
      tasks.push(new taskpool.Task(concurrentExecuteTask, bus, 'hover'))
      await executeTasksGetObjects(tasks)
      expect(await bus.getExecutionCount() >= 10).assertTrue()
    })

    /**
     * @tc.name   testEventHandlerConcurrent0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTHANDLERCONCURRENT_TEST_0800
     * @tc.desc   Verify testEventHandlerConcurrent0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventHandlerConcurrent0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.registerHandler('click', 'handler_1')
      await bus.executeHandlers('click')
      await bus.reset()
      expect(await bus.getExecutionCount()).assertEqual(0)
      expect(await bus.getHandlerCount('click')).assertEqual(0)
    })
  })
}
