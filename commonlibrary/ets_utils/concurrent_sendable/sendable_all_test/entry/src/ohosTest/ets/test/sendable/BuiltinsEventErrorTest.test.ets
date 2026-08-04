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
class ErrorEventBus {
  public subscribers_: collections.Map<string, string>
  public errorLog_: collections.Array<string>

  public successCount_: number = 0
  public errorCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(errorLog_: collections.Array<string>, lock_: ArkTSUtils.locks.AsyncLock, subscribers_: collections.Map<string, string>) {
    this.subscribers_ = subscribers_
    this.errorLog_ = errorLog_
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

  async publishWithHandler(eventType: string, data: string, shouldFail: boolean): Promise<string> {
    return await this.lock_.lockAsync((): string => {
      if (shouldFail) {
        this.errorCount_++
        this.errorLog_.push(`Error processing ${eventType}: ${data}`)
        return `error:${eventType}`
      }
      this.successCount_++
      return `ok:${eventType}`
    })
  }

  async getErrorCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.errorCount_)
  }

  async getSuccessCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.successCount_)
  }

  async getErrorLogLength(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.errorLog_.length)
  }

  async getSubscriberCount(eventType: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing === undefined || existing === null || existing === '') return 0
      return existing.split(',').length
    })
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.subscribers_.clear()
      while (this.errorLog_.length > 0) { this.errorLog_.pop() }
      this.successCount_ = 0
      this.errorCount_ = 0
    })
  }
}

@Concurrent
async function errorPublishTask(bus: ErrorEventBus, eventType: string, shouldFail: boolean): Promise<string> {
  return await bus.lock_.lockAsync((): string => {
    if (shouldFail) {
      bus.errorCount_++
      bus.errorLog_.push(`Error processing ${eventType}`)
      return `error:${eventType}`
    }
    bus.successCount_++
    return `ok:${eventType}`

  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsEventErrorTest(): void {
  describe('BuiltinsEventErrorTest', () => {
    let bus: ErrorEventBus

    beforeEach(async (): Promise<void> => {
      bus = new ErrorEventBus(new collections.Array<string>(), new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
    })

    afterEach(async (): Promise<void> => {
      await bus.reset()
    })

    /**
     * @tc.name   testEventError0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTERROR_TEST_0100
     * @tc.desc   Verify testEventError0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: string = await bus.publishWithHandler('click', 'data', false)
      expect(result).assertEqual('ok:click')
      expect(await bus.getSuccessCount()).assertEqual(1)
    })

    /**
     * @tc.name   testEventError0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTERROR_TEST_0200
     * @tc.desc   Verify testEventError0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: string = await bus.publishWithHandler('click', 'data', true)
      expect(result).assertEqual('error:click')
      expect(await bus.getErrorCount()).assertEqual(1)
    })

    /**
     * @tc.name   testEventError0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTERROR_TEST_0300
     * @tc.desc   Verify testEventError0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventError0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.publishWithHandler('click', 'data_1', false)
      await bus.publishWithHandler('click', 'data_2', true)
      expect(await bus.getSuccessCount()).assertEqual(1)
      expect(await bus.getErrorCount()).assertEqual(1)
    })

    /**
     * @tc.name   testEventError0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTERROR_TEST_0400
     * @tc.desc   Verify testEventError0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventError0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.publishWithHandler('click', 'data', true)
      expect(await bus.getErrorLogLength()).assertEqual(1)
    })

    /**
     * @tc.name   testEventError0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTERROR_TEST_0500
     * @tc.desc   Verify testEventError0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventError0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(errorPublishTask, bus, 'click', false))
      }
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(errorPublishTask, bus, 'click', true))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getSuccessCount() >= 5).assertTrue()
      expect(await bus.getErrorCount() >= 5).assertTrue()
    })

    /**
     * @tc.name   testEventError0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTERROR_TEST_0600
     * @tc.desc   Verify testEventError0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventError0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.publishWithHandler('click', 'data', true)
      await bus.reset()
      expect(await bus.getErrorCount()).assertEqual(0)
      expect(await bus.getErrorLogLength()).assertEqual(0)
    })

    /**
     * @tc.name   testEventError0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTERROR_TEST_0700
     * @tc.desc   Verify testEventError0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventError0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.subscribe('click', 'handler_1')
      const result: string = await bus.publishWithHandler('click', 'data', false)
      expect(result).assertEqual('ok:click')
    })

    /**
     * @tc.name   testEventError0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTERROR_TEST_0800
     * @tc.desc   Verify testEventError0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventError0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i: number = 0; i < 5; i++) {
        await bus.publishWithHandler('click', `data_${i}`, true)
      }
      expect(await bus.getErrorCount()).assertEqual(5)
      expect(await bus.getErrorLogLength()).assertEqual(5)
    })

    /**
     * @tc.name   testEventError0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTERROR_TEST_0900
     * @tc.desc   Verify testEventError0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventError0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(errorPublishTask, bus, 'click', true))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getErrorCount() >= 10).assertTrue()
    })

    /**
     * @tc.name   testEventError1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_EVENTERROR_TEST_1000
     * @tc.desc   Verify testEventError1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventError1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.publishWithHandler('click', 'data', false)
      await bus.publishWithHandler('hover', 'data', true)
      expect(await bus.getSuccessCount()).assertEqual(1)
      expect(await bus.getErrorCount()).assertEqual(1)
    })
  })
}
