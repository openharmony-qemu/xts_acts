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
class SendableConnection {
  public id_: number = 0
  public isActive_: boolean = true
  public createdAt_: number = 0

  constructor(id: number) {
    this.id_ = id
    this.isActive_ = true
    this.createdAt_ = Date.now()
  }
}

@Sendable
class ConnectionPool {
  public connections_: collections.Array<SendableConnection>

  public maxPoolSize_: number = 10
  public activeCount_: number = 0
  public totalCreated_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(connections_: collections.Array<SendableConnection>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.connections_ = connections_
    this.lock_ = lock_
  }


  async initialize(size: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.maxPoolSize_ = size
      this.activeCount_ = 0
      this.totalCreated_ = 0
      for (let i: number = 0; i < size; i++) {
        this.connections_.push(new SendableConnection(i))
        this.totalCreated_++
      }
      this.activeCount_ = size
    })
  }

  async getConnection(): Promise<SendableConnection | null> {
    return await this.lock_.lockAsync((): SendableConnection | null => {
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (this.connections_[i].isActive_) {
          this.connections_[i].isActive_ = false
          return this.connections_[i]
        }
      }
      if (this.totalCreated_ < this.maxPoolSize_) {
        const conn: SendableConnection = new SendableConnection(this.totalCreated_)
        conn.isActive_ = false
        this.connections_.push(conn)
        this.totalCreated_++
        return conn
      }
      return null
    })
  }

  async releaseConnection(conn: SendableConnection): Promise<void> {
    await this.lock_.lockAsync((): void => {
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

  async getTotalCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.totalCreated_)
  }

  async getMaxPoolSize(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.maxPoolSize_)
  }

  async shutdown(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.activeCount_ = 0
      this.totalCreated_ = 0
    })
  }

  async reset(): Promise<void> {
    await this.shutdown()
  }
}

export default function BuiltinsConnectionPoolInitTest(): void {
  describe('BuiltinsConnectionPoolInitTest', () => {
    let pool: ConnectionPool

    beforeEach(async (): Promise<void> => {
      pool = new ConnectionPool(new collections.Array<SendableConnection>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await pool.shutdown()
    })

    it('BuiltinsConnectionPoolInitTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(5)
      expect(await pool.getTotalCount()).assertEqual(5)
      expect(await pool.getActiveCount()).assertEqual(5)
    })

    it('BuiltinsConnectionPoolInitTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(5)
      const conn: SendableConnection | null = await pool.getConnection()
      expect(await pool.getActiveCount()).assertEqual(4)
    })

    it('BuiltinsConnectionPoolInitTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(5)
      const conn: SendableConnection | null = await pool.getConnection()
      await pool.releaseConnection(conn as SendableConnection)
      expect(await pool.getActiveCount()).assertEqual(5)
    })

    it('BuiltinsConnectionPoolInitTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(1)
      expect(await pool.getMaxPoolSize()).assertEqual(1)
    })

    it('BuiltinsConnectionPoolInitTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(0)
      expect(await pool.getTotalCount()).assertEqual(0)
      expect(await pool.getActiveCount()).assertEqual(0)
    })

    it('BuiltinsConnectionPoolInitTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      const conn1: SendableConnection | null = await pool.getConnection()
      const conn2: SendableConnection | null = await pool.getConnection()
      const conn3: SendableConnection | null = await pool.getConnection()
      expect(await pool.getActiveCount()).assertEqual(0)
    })

    it('BuiltinsConnectionPoolInitTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: SendableConnection | null = await pool.getConnection()
      const conn2: SendableConnection | null = await pool.getConnection()
      const conn3: SendableConnection | null = await pool.getConnection()
      expect(conn3).assertEqual(null)
    })

    it('BuiltinsConnectionPoolInitTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const conn: SendableConnection | null = await pool.getConnection()
      expect((conn as SendableConnection).id_ >= 0).assertTrue()
    })

    it('BuiltinsConnectionPoolInitTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(5)
      await pool.shutdown()
      expect(await pool.getTotalCount()).assertEqual(0)
      expect(await pool.getActiveCount()).assertEqual(0)
    })

    it('BuiltinsConnectionPoolInitTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      await pool.initialize(5)
      expect(await pool.getTotalCount()).assertEqual(5)
    })
  })
}
