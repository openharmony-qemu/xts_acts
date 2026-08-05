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
class WaitConnection {
  public id_: number = 0
  public isActive_: boolean = true

  constructor(id: number) {
    this.id_ = id
    this.isActive_ = true
  }
}

@Sendable
class WaitQueuePool {
  public connections_: collections.Array<WaitConnection>

  public waitingCount_: number = 0
  public maxPoolSize_: number = 3
  public totalCreated_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  public cv_: ArkTSUtils.locks.ConditionVariable

  constructor(connections_: collections.Array<WaitConnection>, lock_: ArkTSUtils.locks.AsyncLock, cv_: ArkTSUtils.locks.ConditionVariable) {
    this.connections_ = connections_
    this.lock_ = lock_
    this.cv_ = cv_
  }


  async initialize(size: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.maxPoolSize_ = size
      this.totalCreated_ = 0
      this.waitingCount_ = 0
      for (let i: number = 0; i < size; i++) {
        this.connections_.push(new WaitConnection(i))
        this.totalCreated_++
      }
    })
  }

  async acquire(): Promise<WaitConnection | null> {
    return await this.lock_.lockAsync((): WaitConnection | null => {
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (this.connections_[i].isActive_) {
          this.connections_[i].isActive_ = false
          return this.connections_[i]
        }
      }
      if (this.totalCreated_ < this.maxPoolSize_) {
        const conn: WaitConnection = new WaitConnection(this.totalCreated_)
        conn.isActive_ = false
        this.connections_.push(conn)
        this.totalCreated_++
        return conn
      }
      return null
    })
  }

  async release(conn: WaitConnection): Promise<void> {
    await this.lock_.lockAsync((): void => {
      conn.isActive_ = true
    })
    this.cv_.notifyOne()
  }

  async releaseAll(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      for (let i: number = 0; i < this.connections_.length; i++) {
        this.connections_[i].isActive_ = true
      }
    })
    this.cv_.notifyAll()
  }

  async getActiveCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      let count: number = 0
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (this.connections_[i].isActive_) count++
      }
      return count
    })
  }

  async getTotalCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.totalCreated_)
  }

  async shutdown(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.totalCreated_ = 0
      this.waitingCount_ = 0
    })
  }
}

export default function ConnectionWaitQueueTest(): void {
  describe('ConnectionWaitQueueTest', () => {
    let pool: WaitQueuePool

    beforeEach(async (): Promise<void> => {
      pool = new WaitQueuePool(new collections.Array<WaitConnection>(), new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable())
    })

    afterEach(async (): Promise<void> => {
      await pool.shutdown()
    })

    /**
     * @tc.name   testConnectionWaitQueue0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONWAITQUEUE_TEST_0100
     * @tc.desc   Verify testConnectionWaitQueue0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionWaitQueue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      const conn: WaitConnection | null = await pool.acquire()
      expect(conn !== null).assertTrue()
    })

    /**
     * @tc.name   testConnectionWaitQueue0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONWAITQUEUE_TEST_0200
     * @tc.desc   Verify testConnectionWaitQueue0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionWaitQueue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      const conn: WaitConnection | null = await pool.acquire()
      await pool.release(conn as WaitConnection)
      expect(await pool.getActiveCount()).assertEqual(3)
    })

    /**
     * @tc.name   testConnectionWaitQueue0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONWAITQUEUE_TEST_0300
     * @tc.desc   Verify testConnectionWaitQueue0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionWaitQueue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(2)
      const conn1: WaitConnection | null = await pool.acquire()
      const conn2: WaitConnection | null = await pool.acquire()
      await pool.releaseAll()
      expect(await pool.getActiveCount()).assertEqual(2)
    })

    /**
     * @tc.name   testConnectionWaitQueue0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONWAITQUEUE_TEST_0400
     * @tc.desc   Verify testConnectionWaitQueue0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionWaitQueue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: WaitConnection | null = await pool.acquire()
      const conn2: WaitConnection | null = await pool.acquire()
      const conn3: WaitConnection | null = await pool.acquire()
      expect(conn3).assertEqual(null)
    })

    /**
     * @tc.name   testConnectionWaitQueue0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONWAITQUEUE_TEST_0500
     * @tc.desc   Verify testConnectionWaitQueue0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionWaitQueue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: WaitConnection | null = await pool.acquire()
      const conn2: WaitConnection | null = await pool.acquire()
      await pool.release(conn1 as WaitConnection)
      const conn3: WaitConnection | null = await pool.acquire()
      expect(conn3).assertEqual(conn1)
    })

    /**
     * @tc.name   testConnectionWaitQueue0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONWAITQUEUE_TEST_0600
     * @tc.desc   Verify testConnectionWaitQueue0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionWaitQueue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const conns: WaitConnection[] = []
      for (let i: number = 0; i < 3; i++) {
        const conn: WaitConnection | null = await pool.acquire()
        conns.push(conn as WaitConnection)
      }
      for (let i: number = 0; i < conns.length; i++) {
        await pool.release(conns[i])
      }
      expect(await pool.getActiveCount()).assertEqual(3)
    })

    /**
     * @tc.name   testConnectionWaitQueue0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONWAITQUEUE_TEST_0700
     * @tc.desc   Verify testConnectionWaitQueue0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionWaitQueue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(1)
      const conn: WaitConnection | null = await pool.acquire()
      await pool.release(conn as WaitConnection)
      const conn2: WaitConnection | null = await pool.acquire()
      expect(conn2).assertEqual(conn)
    })

    /**
     * @tc.name   testConnectionWaitQueue0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONWAITQUEUE_TEST_0800
     * @tc.desc   Verify testConnectionWaitQueue0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionWaitQueue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      await pool.shutdown()
      expect(await pool.getTotalCount()).assertEqual(0)
    })
  })
}
