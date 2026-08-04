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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import { LogEntry } from '../../../workers/sendable'
import Utils from '../utils'
import { LogLevel } from './SendableTestEnums'


@Sendable
class LogCollectorQueue {
  public logs_: collections.Array<LogEntry>

  public capacity_: number = 100
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(logs_: collections.Array<LogEntry>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.logs_ = logs_
    this.lock_ = lock_
  }

  public totalEnqueued_: number = 0
  public totalDequeued_: number = 0

  async enqueue(level: number, message: string, timestamp: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (this.logs_.length >= this.capacity_) {
        return false
      }
      const entry: LogEntry = new LogEntry(level, message, timestamp)
      this.logs_.push(entry)
      this.totalEnqueued_++
      return true
    })
  }

  async dequeueBatch(batchSize: number): Promise<LogEntry[]> {
    return await this.lock_.lockAsync((): LogEntry[] => {
      const batch: LogEntry[] = []
      const actualSize: number = Math.min(batchSize, this.logs_.length)
      for (let i = 0; i < actualSize; i++) {
        batch.push(this.logs_[i])
      }
      for (let i = 0; i < actualSize; i++) {
        this.logs_.splice(0, 1)
      }
      this.totalDequeued_ += actualSize
      return batch
    })
  }

  async size(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.logs_.length)
  }

  async isFull(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.logs_.length >= this.capacity_)
  }

  async isEmpty(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.logs_.length === 0)
  }

  async getTotalEnqueued(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.totalEnqueued_)
  }

  async getTotalDequeued(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.totalDequeued_)
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.logs_.length > 0) { this.logs_.pop() }
      this.totalEnqueued_ = 0
      this.totalDequeued_ = 0
    })
  }
}

@Concurrent
function enqueueLogTask(level: number, message: string): string {
  return `${level}|${message}`
}

export default function BuiltinsLogCollectorQueueTest(): void {
  describe('BuiltinsLogCollectorQueueTest', (): void => {
    let logQueue: LogCollectorQueue

    beforeEach((): void => {
      logQueue = new LogCollectorQueue(new collections.Array<LogEntry>(), new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testLogCollectorQueue0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOGCOLLECTORQUEUE_TEST_0100
     * @tc.desc   Verify testLogCollectorQueue0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLogCollectorQueue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const success: boolean = await logQueue.enqueue(LogLevel.INFO, 'test log', Date.now())
      expect(success).assertTrue()
      expect(await logQueue.size()).assertEqual(1)
    })

    /**
     * @tc.name   testLogCollectorQueue0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOGCOLLECTORQUEUE_TEST_0200
     * @tc.desc   Verify testLogCollectorQueue0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLogCollectorQueue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await logQueue.enqueue(LogLevel.DEBUG, 'debug log', Date.now())
      await logQueue.enqueue(LogLevel.INFO, 'info log', Date.now())
      await logQueue.enqueue(LogLevel.WARN, 'warn log', Date.now())
      await logQueue.enqueue(LogLevel.ERROR, 'error log', Date.now())
      expect(await logQueue.size()).assertEqual(4)
    })

    /**
     * @tc.name   testLogCollectorQueue0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOGCOLLECTORQUEUE_TEST_0300
     * @tc.desc   Verify testLogCollectorQueue0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLogCollectorQueue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 10; i++) {
        await logQueue.enqueue(LogLevel.INFO, `log_${i}`, Date.now())
      }
      const batch: LogEntry[] = await logQueue.dequeueBatch(5)
      expect(batch.length).assertEqual(5)
      expect(await logQueue.size()).assertEqual(5)
    })

    /**
     * @tc.name   testLogCollectorQueue0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOGCOLLECTORQUEUE_TEST_0400
     * @tc.desc   Verify testLogCollectorQueue0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogCollectorQueue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises: Promise<boolean>[] = []
      for (let i = 0; i < 100; i++) {
        const level: number = i % 4
        promises.push(logQueue.enqueue(level, `log_${i}`, Date.now()))
      }
      const results: boolean[] = await Promise.all(promises)
      let successCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i]) {
          successCount++
        }
      }
      expect(successCount).assertEqual(100)
      expect(await logQueue.size()).assertEqual(100)
    })

    /**
     * @tc.name   testLogCollectorQueue0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOGCOLLECTORQUEUE_TEST_0500
     * @tc.desc   Verify testLogCollectorQueue0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogCollectorQueue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 20; i++) {
        const level: number = i % 4
        tasks.push(new taskpool.Task(enqueueLogTask, level, `log_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        const parts: string[] = (results[i] as string).split('|')
        await logQueue.enqueue(parseInt(parts[0]), parts[1], Date.now())
      }
      expect(await logQueue.getTotalEnqueued()).assertLargerOrEqual(1)
    })

    /**
     * @tc.name   testLogCollectorQueue0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOGCOLLECTORQUEUE_TEST_0600
     * @tc.desc   Verify testLogCollectorQueue0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLogCollectorQueue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logQueue.capacity_ = 50
      for (let i = 0; i < 50; i++) {
        await logQueue.enqueue(LogLevel.INFO, `log_${i}`, Date.now())
      }
      expect(await logQueue.isFull()).assertTrue()
      const success: boolean = await logQueue.enqueue(LogLevel.INFO, 'overflow log', Date.now())
      expect(success).assertFalse()
    })

    /**
     * @tc.name   testLogCollectorQueue0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOGCOLLECTORQUEUE_TEST_0700
     * @tc.desc   Verify testLogCollectorQueue0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogCollectorQueue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logQueue.capacity_ = 10
      for (let i = 0; i < 10; i++) {
        await logQueue.enqueue(LogLevel.INFO, `log_${i}`, Date.now())
      }
      expect(await logQueue.isFull()).assertTrue()
      await logQueue.dequeueBatch(5)
      const success: boolean = await logQueue.enqueue(LogLevel.INFO, 'new log', Date.now())
      expect(success).assertTrue()
    })

    /**
     * @tc.name   testLogCollectorQueue0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOGCOLLECTORQUEUE_TEST_0800
     * @tc.desc   Verify testLogCollectorQueue0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLogCollectorQueue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 20; i++) {
        await logQueue.enqueue(LogLevel.INFO, `log_${i}`, Date.now())
      }
      await logQueue.dequeueBatch(10)
      expect(await logQueue.getTotalEnqueued()).assertEqual(20)
      expect(await logQueue.getTotalDequeued()).assertEqual(10)
    })

    /**
     * @tc.name   testLogCollectorQueue0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOGCOLLECTORQUEUE_TEST_0900
     * @tc.desc   Verify testLogCollectorQueue0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogCollectorQueue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 10; i++) {
        await logQueue.enqueue(LogLevel.INFO, `log_${i}`, Date.now())
      }
      const batch: LogEntry[] = await logQueue.dequeueBatch(10)
      expect(batch.length).assertEqual(10)
      expect(await logQueue.isEmpty()).assertTrue()
    })

    /**
     * @tc.name   testLogCollectorQueue1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOGCOLLECTORQUEUE_TEST_1000
     * @tc.desc   Verify testLogCollectorQueue1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogCollectorQueue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises: Promise<boolean>[] = []
      for (let i = 0; i < 50; i++) {
        const level: number = i % 4
        promises.push(logQueue.enqueue(level, `log_${i}`, Date.now()))
      }
      await Promise.all(promises)
      const batch1: LogEntry[] = await logQueue.dequeueBatch(20)
      expect(batch1.length).assertEqual(20)
      const batch2: LogEntry[] = await logQueue.dequeueBatch(30)
      expect(batch2.length).assertEqual(30)
      expect(await logQueue.isEmpty()).assertTrue()
    })
  })
}
