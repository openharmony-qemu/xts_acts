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

    /**
     * @tc.name   testConnectionPoolInit0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONPOOLINIT_TEST_0100
     * @tc.desc   Verify testConnectionPoolInit0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionPoolInit0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(5)
      expect(await pool.getTotalCount()).assertEqual(5)
      expect(await pool.getActiveCount()).assertEqual(5)
    })

    /**
     * @tc.name   testConnectionPoolInit0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONPOOLINIT_TEST_0200
     * @tc.desc   Verify testConnectionPoolInit0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionPoolInit0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(5)
      const conn: SendableConnection | null = await pool.getConnection()
      expect(await pool.getActiveCount()).assertEqual(4)
    })

    /**
     * @tc.name   testConnectionPoolInit0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONPOOLINIT_TEST_0300
     * @tc.desc   Verify testConnectionPoolInit0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionPoolInit0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(5)
      const conn: SendableConnection | null = await pool.getConnection()
      await pool.releaseConnection(conn as SendableConnection)
      expect(await pool.getActiveCount()).assertEqual(5)
    })

    /**
     * @tc.name   testConnectionPoolInit0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONPOOLINIT_TEST_0400
     * @tc.desc   Verify testConnectionPoolInit0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionPoolInit0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(1)
      expect(await pool.getMaxPoolSize()).assertEqual(1)
    })

    /**
     * @tc.name   testConnectionPoolInit0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONPOOLINIT_TEST_0500
     * @tc.desc   Verify testConnectionPoolInit0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionPoolInit0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(0)
      expect(await pool.getTotalCount()).assertEqual(0)
      expect(await pool.getActiveCount()).assertEqual(0)
    })

    /**
     * @tc.name   testConnectionPoolInit0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONPOOLINIT_TEST_0600
     * @tc.desc   Verify testConnectionPoolInit0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionPoolInit0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      const conn1: SendableConnection | null = await pool.getConnection()
      const conn2: SendableConnection | null = await pool.getConnection()
      const conn3: SendableConnection | null = await pool.getConnection()
      expect(await pool.getActiveCount()).assertEqual(0)
    })

    /**
     * @tc.name   testConnectionPoolInit0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONPOOLINIT_TEST_0700
     * @tc.desc   Verify testConnectionPoolInit0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionPoolInit0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: SendableConnection | null = await pool.getConnection()
      const conn2: SendableConnection | null = await pool.getConnection()
      const conn3: SendableConnection | null = await pool.getConnection()
      expect(conn3).assertEqual(null)
    })

    /**
     * @tc.name   testConnectionPoolInit0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONPOOLINIT_TEST_0800
     * @tc.desc   Verify testConnectionPoolInit0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionPoolInit0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const conn: SendableConnection | null = await pool.getConnection()
      expect((conn as SendableConnection).id_ >= 0).assertTrue()
    })

    /**
     * @tc.name   testConnectionPoolInit0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONPOOLINIT_TEST_0900
     * @tc.desc   Verify testConnectionPoolInit0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionPoolInit0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(5)
      await pool.shutdown()
      expect(await pool.getTotalCount()).assertEqual(0)
      expect(await pool.getActiveCount()).assertEqual(0)
    })

    /**
     * @tc.name   testConnectionPoolInit1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONPOOLINIT_TEST_1000
     * @tc.desc   Verify testConnectionPoolInit1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionPoolInit1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      await pool.initialize(5)
      expect(await pool.getTotalCount()).assertEqual(5)
    })
  })
}
