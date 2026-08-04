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
class TimeoutConnection {
  public id_: number = 0
  public isActive_: boolean = true
  public lastUsedAt_: number = 0

  constructor(id: number) {
    this.id_ = id
    this.isActive_ = true
    this.lastUsedAt_ = Date.now()
  }
}

@Sendable
class TimeoutPool {
  public connections_: collections.Array<TimeoutConnection>

  public maxPoolSize_: number = 5
  public totalCreated_: number = 0
  public leakedCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(connections_: collections.Array<TimeoutConnection>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.connections_ = connections_
    this.lock_ = lock_
  }


  async initialize(size: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.maxPoolSize_ = size
      this.totalCreated_ = 0
      this.leakedCount_ = 0
      for (let i: number = 0; i < size; i++) {
        this.connections_.push(new TimeoutConnection(i))
        this.totalCreated_++
      }
    })
  }

  async acquire(): Promise<TimeoutConnection | null> {
    return await this.lock_.lockAsync((): TimeoutConnection | null => {
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (this.connections_[i].isActive_) {
          this.connections_[i].isActive_ = false
          this.connections_[i].lastUsedAt_ = Date.now()
          return this.connections_[i]
        }
      }
      if (this.totalCreated_ < this.maxPoolSize_) {
        const conn: TimeoutConnection = new TimeoutConnection(this.totalCreated_)
        conn.isActive_ = false
        this.connections_.push(conn)
        this.totalCreated_++
        return conn
      }
      return null
    })
  }

  async release(conn: TimeoutConnection): Promise<void> {
    await this.lock_.lockAsync((): void => {
      conn.isActive_ = true
      conn.lastUsedAt_ = Date.now()
    })
  }

  async getIdleConnections(timeoutMs: number): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const now: number = Date.now()
      let count: number = 0
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (this.connections_[i].isActive_ && (now - this.connections_[i].lastUsedAt_) >= timeoutMs) {
          count++
        }
      }
      return count
    })
  }

  async releaseIdleConnections(timeoutMs: number): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const now: number = Date.now()
      let released: number = 0
      let i: number = 0
      while (i < this.connections_.length) {
        if (this.connections_[i].isActive_ && (now - this.connections_[i].lastUsedAt_) >= timeoutMs) {
          this.connections_.splice(i, 1)
          released++
        } else {
          i++
        }
      }
      return released
    })
  }

  async checkLeak(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      let leakCount: number = 0
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (!this.connections_[i].isActive_) {
          leakCount++
        }
      }
      this.leakedCount_ = leakCount
      return leakCount
    })
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

  async getLeakedCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.leakedCount_)
  }

  async shutdown(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.totalCreated_ = 0
      this.leakedCount_ = 0
    })
  }
}

export default function BuiltinsConnectionTimeoutTest(): void {
  describe('BuiltinsConnectionTimeoutTest', () => {
    let pool: TimeoutPool

    beforeEach(async (): Promise<void> => {
      pool = new TimeoutPool(new collections.Array<TimeoutConnection>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await pool.shutdown()
    })

    /**
     * @tc.name   testConnectionTimeout0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_0100
     * @tc.desc   Verify testConnectionTimeout0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionTimeout0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      expect(await pool.checkLeak()).assertEqual(0)
    })

    /**
     * @tc.name   testConnectionTimeout0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_0200
     * @tc.desc   Verify testConnectionTimeout0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionTimeout0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      const conn: TimeoutConnection | null = await pool.acquire()
      expect(await pool.checkLeak()).assertEqual(1)
    })

    /**
     * @tc.name   testConnectionTimeout0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_0300
     * @tc.desc   Verify testConnectionTimeout0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionTimeout0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      const conn: TimeoutConnection | null = await pool.acquire()
      await pool.release(conn as TimeoutConnection)
      expect(await pool.checkLeak()).assertEqual(0)
    })

    /**
     * @tc.name   testConnectionTimeout0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_0400
     * @tc.desc   Verify testConnectionTimeout0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionTimeout0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const conns: TimeoutConnection[] = []
      for (let i: number = 0; i < 3; i++) {
        const conn: TimeoutConnection | null = await pool.acquire()
        conns.push(conn as TimeoutConnection)
      }
      expect(await pool.checkLeak()).assertEqual(3)
      for (let i: number = 0; i < conns.length; i++) {
        await pool.release(conns[i])
      }
      expect(await pool.checkLeak()).assertEqual(0)
    })

    /**
     * @tc.name   testConnectionTimeout0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_0500
     * @tc.desc   Verify testConnectionTimeout0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionTimeout0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const conn: TimeoutConnection | null = await pool.acquire()
      await pool.release(conn as TimeoutConnection)
      const idle: number = await pool.getIdleConnections(0)
      expect(idle >= 1).assertTrue()
    })

    /**
     * @tc.name   testConnectionTimeout0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_0600
     * @tc.desc   Verify testConnectionTimeout0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionTimeout0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const conn: TimeoutConnection | null = await pool.acquire()
      await pool.release(conn as TimeoutConnection)
      const released: number = await pool.releaseIdleConnections(0)
      expect(released >= 1).assertTrue()
    })

    /**
     * @tc.name   testConnectionTimeout0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_0700
     * @tc.desc   Verify testConnectionTimeout0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionTimeout0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const released: number = await pool.releaseIdleConnections(0)
      expect(released).assertEqual(3)
    })

    /**
     * @tc.name   testConnectionTimeout0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_0800
     * @tc.desc   Verify testConnectionTimeout0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionTimeout0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const conn: TimeoutConnection | null = await pool.acquire()
      expect((conn as TimeoutConnection).lastUsedAt_ > 0).assertTrue()
    })

    /**
     * @tc.name   testConnectionTimeout0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_0900
     * @tc.desc   Verify testConnectionTimeout0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionTimeout0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      await pool.acquire()
      await pool.acquire()
      await pool.acquire()
      expect(await pool.getLeakedCount()).assertEqual(0)
      await pool.checkLeak()
      expect(await pool.getLeakedCount()).assertEqual(3)
    })

    /**
     * @tc.name   testConnectionTimeout1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_1000
     * @tc.desc   Verify testConnectionTimeout1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionTimeout1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: TimeoutConnection | null = await pool.acquire()
      const conn2: TimeoutConnection | null = await pool.acquire()
      await pool.release(conn1 as TimeoutConnection)
      const released: number = await pool.releaseIdleConnections(0)
      expect(released >= 1).assertTrue()
    })

    /**
     * @tc.name   testConnectionTimeout1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONTIMEOUT_TEST_1100
     * @tc.desc   Verify testConnectionTimeout1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionTimeout1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const conn: TimeoutConnection | null = await pool.acquire()
      await pool.release(conn as TimeoutConnection)
      await pool.shutdown()
      expect(await pool.checkLeak()).assertEqual(0)
    })
  })
}
