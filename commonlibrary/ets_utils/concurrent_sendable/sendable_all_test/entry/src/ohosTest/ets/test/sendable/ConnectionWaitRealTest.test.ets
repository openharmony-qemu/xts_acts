/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class RealWaitConnectionPool {
  public capacity_: number = 1
  public inUse_: number = 0
  public acquiredCount_: number = 0
  public waitEnterCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock
  public cv_: ArkTSUtils.locks.ConditionVariable

  constructor(lock_: ArkTSUtils.locks.AsyncLock, cv_: ArkTSUtils.locks.ConditionVariable) {
    this.lock_ = lock_
    this.cv_ = cv_
  }

  async acquire(): Promise<boolean> {
    while (true) {
      const granted: boolean = await this.lock_.lockAsync((): boolean => {
        if (this.inUse_ < this.capacity_) {
          this.inUse_++
          this.acquiredCount_++
          return true
        }
        return false
      })
      if (granted) {
        return true
      }
      this.waitEnterCount_++
      await this.cv_.waitFor(3000)
    }
  }

  async release(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.inUse_--
    })
    this.cv_.notifyAll()
  }

  getInUse(): number {
    return this.inUse_
  }

  getAcquiredCount(): number {
    return this.acquiredCount_
  }

  getWaitEnterCount(): number {
    return this.waitEnterCount_
  }
}

@Sendable
class HoldThenReleasePayload {
  public pool_: RealWaitConnectionPool
  public holdMs_: number = 0

  constructor(pool_: RealWaitConnectionPool, holdMs_: number) {
    this.pool_ = pool_
    this.holdMs_ = holdMs_
  }
}

@Concurrent
async function holdAndReleaseTask(payload: HoldThenReleasePayload): Promise<number> {
  await payload.pool_.acquire()
  await Utils.sleep(payload.holdMs_)
  await payload.pool_.release()
  return payload.pool_.getAcquiredCount()
}

export default function ConnectionWaitRealTest(): void {
  describe('ConnectionWaitRealTest', (): void => {
    /**
     * @tc.name   testConnectionWaitReal0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTION_WAIT_REAL_TEST_0100
     * @tc.desc   Verify second acquire really waits on ConditionVariable until first connection is released
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionWaitReal0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const pool: RealWaitConnectionPool = new RealWaitConnectionPool(
          new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable())
        pool.capacity_ = 1
        const first: taskpool.Task = new taskpool.Task(holdAndReleaseTask, new HoldThenReleasePayload(pool, 1000))
        const second: taskpool.Task = new taskpool.Task(holdAndReleaseTask, new HoldThenReleasePayload(pool, 100))
        const firstStart: number = Date.now()
        const p1: Promise<Object> = taskpool.execute(first)
        await Utils.sleep(200)
        expect(pool.getInUse()).assertEqual(1)
        const p2: Promise<Object> = taskpool.execute(second)
        const results: Object[] = await Promise.all([p1, p2])
        const elapsed: number = Date.now() - firstStart
        expect(results[0] as number >= 1).assertTrue()
        expect(results[1] as number).assertEqual(2)
        expect(pool.getAcquiredCount()).assertEqual(2)
        expect(pool.getWaitEnterCount() >= 1).assertTrue()
        expect(pool.getInUse()).assertEqual(0)
        expect(elapsed >= 1100).assertTrue()
      } catch (error) {
        console.error("testConnectionWaitReal0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testConnectionWaitReal0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTION_WAIT_REAL_TEST_0200
     * @tc.desc   Verify pool of capacity one serializes three concurrent acquires without over-granting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConnectionWaitReal0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
        const pool: RealWaitConnectionPool = new RealWaitConnectionPool(
          new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable())
        pool.capacity_ = 1
        const promises: Promise<Object>[] = []
        for (let i: number = 0; i < 3; i++) {
          const task: taskpool.Task = new taskpool.Task(holdAndReleaseTask, new HoldThenReleasePayload(pool, 300))
          promises.push(taskpool.execute(task))
        }
        const results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(pool.getAcquiredCount()).assertEqual(3)
        expect(pool.getInUse()).assertEqual(0)
      } catch (error) {
        console.error("testConnectionWaitReal0200 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
