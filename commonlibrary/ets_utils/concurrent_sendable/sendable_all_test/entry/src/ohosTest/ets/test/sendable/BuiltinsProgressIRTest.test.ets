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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class IRProgressTracker {
  public progress_: number = 0
  public total_: number = 100
  public step_: number = 10
  public accessCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async setTotal(total: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.total_ = total
      this.progress_ = 0
      this.accessCount_ = 0
    })
  }

  async increment(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.progress_ += this.step_
      this.accessCount_++
      if (this.progress_ > this.total_) {
        this.progress_ = this.total_
      }
      return this.progress_
    })
  }

  async getProgress(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.accessCount_++
      return this.progress_
    })
  }

  async getAccessCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.accessCount_)
  }

  async isCompleted(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.progress_ >= this.total_)
  }
}

@Sendable
class IRFieldAccessTracker {
  public field1_: number = 0
  public field2_: number = 0
  public field3_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async updateFields(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.field1_++
      this.field2_ += 2
      this.field3_ += 3
    })
  }

  async getField1(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.field1_)
  }

  async getField2(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.field2_)
  }

  async getField3(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.field3_)
  }
}

@Concurrent
function irProgressTask(tracker: IRProgressTracker): number {
  return tracker.progress_
}

@Concurrent
async function irFieldAccessTask(tracker: IRFieldAccessTracker): Promise<void> {
  return await tracker.lock_.lockAsync((): void => {
    tracker.field1_++
    tracker.field2_ += 2
    tracker.field3_ += 3

  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsProgressIRTest(): void {
  describe('BuiltinsProgressIRTest', () => {
    /**
     * @tc.name   testProgressIR0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROGRESSIR_TEST_0100
     * @tc.desc   Verify testProgressIR0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testProgressIR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tracker: IRProgressTracker = new IRProgressTracker(new ArkTSUtils.locks.AsyncLock())
      await tracker.setTotal(100)
      expect(await tracker.getProgress()).assertEqual(0)
      expect(await tracker.getAccessCount()).assertEqual(1)
    })

    /**
     * @tc.name   testProgressIR0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROGRESSIR_TEST_0200
     * @tc.desc   Verify testProgressIR0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testProgressIR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tracker: IRProgressTracker = new IRProgressTracker(new ArkTSUtils.locks.AsyncLock())
      await tracker.setTotal(100)
      const p: number = await tracker.increment()
      expect(p).assertEqual(10)
      expect(await tracker.getProgress()).assertEqual(10)
    })

    /**
     * @tc.name   testProgressIR0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROGRESSIR_TEST_0300
     * @tc.desc   Verify testProgressIR0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testProgressIR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: IRProgressTracker = new IRProgressTracker(new ArkTSUtils.locks.AsyncLock())
      await tracker.setTotal(100)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(irProgressTask, tracker))
      }
      const results: Object[] = await executeTasksGetObjects(tasks)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number >= 0).assertTrue()
        expect(results[i] as number <= 100).assertTrue()
      }
    })

    /**
     * @tc.name   testProgressIR0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROGRESSIR_TEST_0400
     * @tc.desc   Verify testProgressIR0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testProgressIR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tracker: IRFieldAccessTracker = new IRFieldAccessTracker(new ArkTSUtils.locks.AsyncLock())
      await tracker.updateFields()
      expect(await tracker.getField1()).assertEqual(1)
      expect(await tracker.getField2()).assertEqual(2)
      expect(await tracker.getField3()).assertEqual(3)
    })

    /**
     * @tc.name   testProgressIR0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROGRESSIR_TEST_0500
     * @tc.desc   Verify testProgressIR0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testProgressIR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: IRFieldAccessTracker = new IRFieldAccessTracker(new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(irFieldAccessTask, tracker))
      }
      await executeTasksGetObjects(tasks)
      expect(await tracker.getField1()).assertEqual(5)
      expect(await tracker.getField2()).assertEqual(10)
      expect(await tracker.getField3()).assertEqual(15)
    })

    /**
     * @tc.name   testProgressIR0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROGRESSIR_TEST_0600
     * @tc.desc   Verify testProgressIR0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testProgressIR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tracker1: IRProgressTracker = new IRProgressTracker(new ArkTSUtils.locks.AsyncLock())
      const tracker2: IRProgressTracker = new IRProgressTracker(new ArkTSUtils.locks.AsyncLock())
      await tracker1.setTotal(100)
      await tracker2.setTotal(100)
      await tracker1.increment()
      await tracker2.increment()
      expect(await tracker1.getProgress()).assertEqual(10)
      expect(await tracker2.getProgress()).assertEqual(10)
    })

    /**
     * @tc.name   testProgressIR0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROGRESSIR_TEST_0700
     * @tc.desc   Verify testProgressIR0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressIR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: IRProgressTracker = new IRProgressTracker(new ArkTSUtils.locks.AsyncLock())
      await tracker.setTotal(100)
      for (let i: number = 0; i < 10; i++) {
        await tracker.increment()
      }
      expect(await tracker.getProgress()).assertEqual(100)
      expect(await tracker.isCompleted()).assertTrue()
    })

    /**
     * @tc.name   testProgressIR0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROGRESSIR_TEST_0800
     * @tc.desc   Verify testProgressIR0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressIR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: IRProgressTracker = new IRProgressTracker(new ArkTSUtils.locks.AsyncLock())
      await tracker.setTotal(50)
      for (let i: number = 0; i < 10; i++) {
        await tracker.increment()
      }
      expect(await tracker.getProgress()).assertEqual(50)
      expect(await tracker.isCompleted()).assertTrue()
    })

    /**
     * @tc.name   testProgressIR0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROGRESSIR_TEST_0900
     * @tc.desc   Verify testProgressIR0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testProgressIR0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: IRFieldAccessTracker = new IRFieldAccessTracker(new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(irFieldAccessTask, tracker))
      }
      await executeTasksGetObjects(tasks)
      expect(await tracker.getField1()).assertEqual(10)
      expect(await tracker.getField2()).assertEqual(20)
      expect(await tracker.getField3()).assertEqual(30)
    })

    /**
     * @tc.name   testProgressIR1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROGRESSIR_TEST_1000
     * @tc.desc   Verify testProgressIR1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressIR1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: IRProgressTracker = new IRProgressTracker(new ArkTSUtils.locks.AsyncLock())
      await tracker.setTotal(100)
      const accessBefore: number = await tracker.getAccessCount()
      for (let i: number = 0; i < 5; i++) {
        await tracker.getProgress()
      }
      const accessAfter: number = await tracker.getAccessCount()
      expect(accessAfter - accessBefore >= 5).assertTrue()
    })
  })
}
