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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { collections } from '@kit.ArkTS'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class StatsConnection {
  public id_: number = 0
  public isActive_: boolean = true

  constructor(id: number) {
    this.id_ = id
    this.isActive_ = true
  }
}

@Sendable
class StatsPool {
  public connections_: collections.Array<StatsConnection>

  public maxPoolSize_: number = 5
  public totalCreated_: number = 0
  public totalAcquired_: number = 0
  public totalReleased_: number = 0
  public totalRejected_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(connections_: collections.Array<StatsConnection>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.connections_ = connections_
    this.lock_ = lock_
  }


  async initialize(size: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.maxPoolSize_ = size
      this.totalCreated_ = 0
      this.totalAcquired_ = 0
      this.totalReleased_ = 0
      this.totalRejected_ = 0
      for (let i: number = 0; i < size; i++) {
        this.connections_.push(new StatsConnection(i))
        this.totalCreated_++
      }
    })
  }

  async acquire(): Promise<StatsConnection | null> {
    return await this.lock_.lockAsync((): StatsConnection | null => {
      this.totalAcquired_++
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (this.connections_[i].isActive_) {
          this.connections_[i].isActive_ = false
          return this.connections_[i]
        }
      }
      if (this.totalCreated_ < this.maxPoolSize_) {
        const conn: StatsConnection = new StatsConnection(this.totalCreated_)
        conn.isActive_ = false
        this.connections_.push(conn)
        this.totalCreated_++
        return conn
      }
      this.totalRejected_++
      return null
    })
  }

  async release(conn: StatsConnection): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.totalReleased_++
      conn.isActive_ = true
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

  async getIdleCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      let count: number = 0
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (!this.connections_[i].isActive_) count++
      }
      return count
    })
  }

  async getTotalCreated(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.totalCreated_)
  }

  async getTotalAcquired(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.totalAcquired_)
  }

  async getTotalReleased(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.totalReleased_)
  }

  async getTotalRejected(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.totalRejected_)
  }

  async getUtilizationRate(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      if (this.totalCreated_ === 0) return 0
      let idle: number = 0
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (!this.connections_[i].isActive_) idle++
      }
      return Math.floor((idle / this.totalCreated_) * 100)
    })
  }

  async shutdown(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.totalCreated_ = 0
      this.totalAcquired_ = 0
      this.totalReleased_ = 0
      this.totalRejected_ = 0
    })
  }
}

export default function BuiltinsConnectionStatsTest(): void {
  describe('BuiltinsConnectionStatsTest', () => {
    let pool: StatsPool

    beforeEach(async (): Promise<void> => {
      pool = new StatsPool(new collections.Array<StatsConnection>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await pool.shutdown()
    })

    it('testConnectionStats0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      expect(await pool.getTotalCreated()).assertEqual(3)
      expect(await pool.getTotalAcquired()).assertEqual(0)
    })

    it('testConnectionStats0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      await pool.acquire()
      expect(await pool.getTotalAcquired()).assertEqual(1)
    })

    it('testConnectionStats0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      const conn: StatsConnection | null = await pool.acquire()
      await pool.release(conn as StatsConnection)
      expect(await pool.getTotalReleased()).assertEqual(1)
    })

    it('testConnectionStats0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      await pool.acquire()
      await pool.acquire()
      await pool.acquire()
      expect(await pool.getTotalRejected()).assertEqual(1)
    })

    it('testConnectionStats0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      expect(await pool.getActiveCount()).assertEqual(3)
      expect(await pool.getIdleCount()).assertEqual(0)
    })

    it('testConnectionStats0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      await pool.acquire()
      expect(await pool.getActiveCount()).assertEqual(2)
      expect(await pool.getIdleCount()).assertEqual(1)
    })

    it('testConnectionStats0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      await pool.acquire()
      await pool.acquire()
      await pool.acquire()
      expect(await pool.getUtilizationRate()).assertEqual(100)
    })

    it('testConnectionStats0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      expect(await pool.getUtilizationRate()).assertEqual(0)
    })

    it('testConnectionStats0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      await pool.acquire()
      const rate: number = await pool.getUtilizationRate()
      expect(rate >= 0 && rate <= 100).assertTrue()
    })

    it('testConnectionStats1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      for (let i: number = 0; i < 5; i++) {
        const conn: StatsConnection | null = await pool.acquire()
        if (conn !== null) {
          await pool.release(conn)
        }
      }
      expect(await pool.getTotalAcquired()).assertEqual(5)
      expect(await pool.getTotalReleased()).assertEqual(5)
    })

    it('testConnectionStats1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(0)
      expect(await pool.getUtilizationRate()).assertEqual(0)
    })

    it('testConnectionStats1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const conn1: StatsConnection | null = await pool.acquire()
      const conn2: StatsConnection | null = await pool.acquire()
      await pool.release(conn1 as StatsConnection)
      expect(await pool.getActiveCount()).assertEqual(2)
      expect(await pool.getIdleCount()).assertEqual(1)
    })
  })
}
