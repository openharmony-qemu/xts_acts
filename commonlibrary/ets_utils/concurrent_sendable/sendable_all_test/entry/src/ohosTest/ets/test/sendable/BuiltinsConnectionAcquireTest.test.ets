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
class PoolConnection {
  public id_: number = 0
  public isActive_: boolean = true

  constructor(id: number) {
    this.id_ = id
    this.isActive_ = true
  }
}

@Sendable
class ConnectionAcquirePool {
  public connections_: collections.Array<PoolConnection>

  public maxPoolSize_: number = 10
  public totalCreated_: number = 0
  public acquireCount_: number = 0
  public releaseCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(connections_: collections.Array<PoolConnection>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.connections_ = connections_
    this.lock_ = lock_
  }


  async initialize(size: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.maxPoolSize_ = size
      this.totalCreated_ = 0
      this.acquireCount_ = 0
      this.releaseCount_ = 0
      for (let i: number = 0; i < size; i++) {
        this.connections_.push(new PoolConnection(i))
        this.totalCreated_++
      }
    })
  }

  async acquire(): Promise<PoolConnection | null> {
    return await this.lock_.lockAsync((): PoolConnection | null => {
      this.acquireCount_++
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (this.connections_[i].isActive_) {
          this.connections_[i].isActive_ = false
          return this.connections_[i]
        }
      }
      if (this.totalCreated_ < this.maxPoolSize_) {
        const conn: PoolConnection = new PoolConnection(this.totalCreated_)
        conn.isActive_ = false
        this.connections_.push(conn)
        this.totalCreated_++
        return conn
      }
      return null
    })
  }

  async release(conn: PoolConnection): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.releaseCount_++
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

  async getAcquireCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.acquireCount_)
  }

  async getReleaseCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.releaseCount_)
  }

  async getTotalCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.totalCreated_)
  }

  async shutdown(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.totalCreated_ = 0
      this.acquireCount_ = 0
      this.releaseCount_ = 0
    })
  }
}

@Concurrent
async function acquireTask(pool: ConnectionAcquirePool): Promise<PoolConnection | null> {
  return await pool.lock_.lockAsync((): PoolConnection | null => {
    pool.acquireCount_++
    for (let i: number = 0; i < pool.connections_.length; i++) {
      if (pool.connections_[i].isActive_) {
        pool.connections_[i].isActive_ = false
        return pool.connections_[i]
      }
    }
    return null

  })
}

@Concurrent
async function acquireReleaseTask(pool: ConnectionAcquirePool): Promise<boolean> {
  return await pool.lock_.lockAsync((): boolean => {
    pool.acquireCount_++
    for (let i: number = 0; i < pool.connections_.length; i++) {
      if (pool.connections_[i].isActive_) {
        pool.connections_[i].isActive_ = false
        pool.releaseCount_++
        pool.connections_[i].isActive_ = true
        return true
      }
    }
    return false

  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsConnectionAcquireTest(): void {
  describe('BuiltinsConnectionAcquireTest', () => {
    let pool: ConnectionAcquirePool

    beforeEach(async (): Promise<void> => {
      pool = new ConnectionAcquirePool(new collections.Array<PoolConnection>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await pool.shutdown()
    })

    /**
     * @tc.name   testConnectionAcquire0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_0100
     * @tc.desc   Verify testConnectionAcquire0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionAcquire0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(5)
      const conn: PoolConnection | null = await pool.acquire()
      expect(await pool.getActiveCount()).assertEqual(4)
    })

    /**
     * @tc.name   testConnectionAcquire0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_0200
     * @tc.desc   Verify testConnectionAcquire0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionAcquire0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(5)
      const conn: PoolConnection | null = await pool.acquire()
      await pool.release(conn as PoolConnection)
      expect(await pool.getActiveCount()).assertEqual(5)
      expect(await pool.getReleaseCount()).assertEqual(1)
    })

    /**
     * @tc.name   testConnectionAcquire0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_0300
     * @tc.desc   Verify testConnectionAcquire0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionAcquire0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      const conns: PoolConnection[] = []
      for (let i: number = 0; i < 3; i++) {
        const conn: PoolConnection | null = await pool.acquire()
        conns.push(conn as PoolConnection)
      }
      expect(await pool.getActiveCount()).assertEqual(0)
      for (let i: number = 0; i < conns.length; i++) {
        await pool.release(conns[i])
      }
      expect(await pool.getActiveCount()).assertEqual(3)
    })

    /**
     * @tc.name   testConnectionAcquire0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_0400
     * @tc.desc   Verify testConnectionAcquire0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionAcquire0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: PoolConnection | null = await pool.acquire()
      const conn2: PoolConnection | null = await pool.acquire()
      const conn3: PoolConnection | null = await pool.acquire()
      expect(conn3).assertEqual(null)
    })

    /**
     * @tc.name   testConnectionAcquire0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_0500
     * @tc.desc   Verify testConnectionAcquire0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionAcquire0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: PoolConnection | null = await pool.acquire()
      const conn2: PoolConnection | null = await pool.acquire()
      await pool.release(conn1 as PoolConnection)
      const conn3: PoolConnection | null = await pool.acquire()
      expect(conn3).assertEqual(conn1)
    })

    /**
     * @tc.name   testConnectionAcquire0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_0600
     * @tc.desc   Verify testConnectionAcquire0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConnectionAcquire0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await pool.initialize(5)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(acquireTask, pool))
      }
      await executeTasksGetObjects(tasks)
      expect(await pool.getAcquireCount() >= 5).assertTrue()
    })

    /**
     * @tc.name   testConnectionAcquire0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_0700
     * @tc.desc   Verify testConnectionAcquire0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConnectionAcquire0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await pool.initialize(5)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(acquireReleaseTask, pool))
      }
      await executeTasksGetObjects(tasks)
      expect(await pool.getAcquireCount() >= 10).assertTrue()
      expect(await pool.getReleaseCount() >= 10).assertTrue()
    })

    /**
     * @tc.name   testConnectionAcquire0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_0800
     * @tc.desc   Verify testConnectionAcquire0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionAcquire0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      for (let i: number = 0; i < 10; i++) {
        const conn: PoolConnection | null = await pool.acquire()
        if (conn !== null) {
          await pool.release(conn)
        }
      }
      expect(await pool.getAcquireCount()).assertEqual(10)
      expect(await pool.getReleaseCount()).assertEqual(10)
    })

    /**
     * @tc.name   testConnectionAcquire0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_0900
     * @tc.desc   Verify testConnectionAcquire0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionAcquire0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(1)
      const conn: PoolConnection | null = await pool.acquire()
      expect((conn as PoolConnection).id_).assertEqual(0)
    })

    /**
     * @tc.name   testConnectionAcquire1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_1000
     * @tc.desc   Verify testConnectionAcquire1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConnectionAcquire1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await pool.initialize(3)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 20; i++) {
        tasks.push(new taskpool.Task(acquireReleaseTask, pool))
      }
      await executeTasksGetObjects(tasks)
      expect(await pool.getActiveCount() >= 0).assertTrue()
    })

    /**
     * @tc.name   testConnectionAcquire1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_1100
     * @tc.desc   Verify testConnectionAcquire1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionAcquire1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: PoolConnection | null = await pool.acquire()
      const conn2: PoolConnection | null = await pool.acquire()
      expect((conn1 as PoolConnection).id_ !== (conn2 as PoolConnection).id_).assertTrue()
    })

    /**
     * @tc.name   testConnectionAcquire1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_1200
     * @tc.desc   Verify testConnectionAcquire1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionAcquire1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn: PoolConnection | null = await pool.acquire()
      await pool.release(conn as PoolConnection)
      await pool.release(conn as PoolConnection)
      expect(await pool.getActiveCount()).assertEqual(2)
    })

    /**
     * @tc.name   testConnectionAcquire1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_1300
     * @tc.desc   Verify testConnectionAcquire1300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectionAcquire1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      expect(await pool.getAcquireCount()).assertEqual(0)
      expect(await pool.getReleaseCount()).assertEqual(0)
    })

    /**
     * @tc.name   testConnectionAcquire1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONNECTIONACQUIRE_TEST_1400
     * @tc.desc   Verify testConnectionAcquire1400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConnectionAcquire1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await pool.initialize(5)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(acquireTask, pool))
      }
      await executeTasksGetObjects(tasks)
      expect(await pool.getActiveCount()).assertEqual(0)
    })
  })
}
