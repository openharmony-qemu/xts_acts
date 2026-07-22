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
class CapacityConnection {
  public id_: number = 0
  public isActive_: boolean = true

  constructor(id: number) {
    this.id_ = id
    this.isActive_ = true
  }
}

@Sendable
class CapacityPool {
  public connections_: collections.Array<CapacityConnection>

  public maxPoolSize_: number = 5
  public totalCreated_: number = 0
  public rejectedCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(connections_: collections.Array<CapacityConnection>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.connections_ = connections_
    this.lock_ = lock_
  }


  async initialize(maxSize: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.maxPoolSize_ = maxSize
      this.totalCreated_ = 0
      this.rejectedCount_ = 0
    })
  }

  async tryAcquire(): Promise<CapacityConnection | null> {
    return await this.lock_.lockAsync((): CapacityConnection | null => {
      for (let i: number = 0; i < this.connections_.length; i++) {
        if (this.connections_[i].isActive_) {
          this.connections_[i].isActive_ = false
          return this.connections_[i]
        }
      }
      if (this.totalCreated_ < this.maxPoolSize_) {
        const conn: CapacityConnection = new CapacityConnection(this.totalCreated_)
        conn.isActive_ = false
        this.connections_.push(conn)
        this.totalCreated_++
        return conn
      }
      this.rejectedCount_++
      return null
    })
  }

  async release(conn: CapacityConnection): Promise<void> {
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

  async getRejectedCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.rejectedCount_)
  }

  async shutdown(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.totalCreated_ = 0
      this.rejectedCount_ = 0
    })
  }
}

@Concurrent
async function capacityAcquireTask(pool: CapacityPool): Promise<number> {
  return await pool.lock_.lockAsync((): number => {
    for (let i: number = 0; i < pool.connections_.length; i++) {
      if (pool.connections_[i].isActive_) {
        pool.connections_[i].isActive_ = false
        return pool.connections_[i].id_
      }
    }
    pool.rejectedCount_++
    return -1

  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsConnectionCapacityTest(): void {
  describe('BuiltinsConnectionCapacityTest', () => {
    let pool: CapacityPool

    beforeEach(async (): Promise<void> => {
      pool = new CapacityPool(new collections.Array<CapacityConnection>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await pool.shutdown()
    })

    it('testConnectionCapacity0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(5)
      expect(await pool.getMaxPoolSize()).assertEqual(5)
    })

    it('testConnectionCapacity0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pool.initialize(3)
      const conns: CapacityConnection[] = []
      for (let i: number = 0; i < 3; i++) {
        const conn: CapacityConnection | null = await pool.tryAcquire()
        conns.push(conn as CapacityConnection)
      }
      expect(await pool.getTotalCount()).assertEqual(3)
      expect(await pool.getActiveCount()).assertEqual(0)
      for (let i: number = 0; i < conns.length; i++) {
        await pool.release(conns[i])
      }
      expect(await pool.getActiveCount()).assertEqual(3)
    })

    it('testConnectionCapacity0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: CapacityConnection | null = await pool.tryAcquire()
      const conn2: CapacityConnection | null = await pool.tryAcquire()
      const conn3: CapacityConnection | null = await pool.tryAcquire()
      expect(conn3).assertEqual(null)
      expect(await pool.getRejectedCount()).assertEqual(1)
    })

    it('testConnectionCapacity0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: CapacityConnection | null = await pool.tryAcquire()
      const conn2: CapacityConnection | null = await pool.tryAcquire()
      await pool.release(conn1 as CapacityConnection)
      const conn3: CapacityConnection | null = await pool.tryAcquire()
    })

    it('testConnectionCapacity0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await pool.initialize(3)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(capacityAcquireTask, pool))
      }
      await executeTasksGetObjects(tasks)
      expect(await pool.getTotalCount() <= 3).assertTrue()
    })

    it('testConnectionCapacity0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(1)
      const conn1: CapacityConnection | null = await pool.tryAcquire()
      const conn2: CapacityConnection | null = await pool.tryAcquire()
      expect(conn2).assertEqual(null)
    })

    it('testConnectionCapacity0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(0)
      const conn: CapacityConnection | null = await pool.tryAcquire()
      expect(conn).assertEqual(null)
    })

    it('testConnectionCapacity0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await pool.initialize(5)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 20; i++) {
        tasks.push(new taskpool.Task(capacityAcquireTask, pool))
      }
      await executeTasksGetObjects(tasks)
      expect(await pool.getTotalCount() <= 5).assertTrue()
      expect(await pool.getRejectedCount() >= 15).assertTrue()
    })

    it('testConnectionCapacity0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      const conn1: CapacityConnection | null = await pool.tryAcquire()
      const conn2: CapacityConnection | null = await pool.tryAcquire()
      const conn3: CapacityConnection | null = await pool.tryAcquire()
      await pool.release(conn1 as CapacityConnection)
      await pool.release(conn2 as CapacityConnection)
      await pool.release(conn3 as CapacityConnection)
      expect(await pool.getActiveCount()).assertEqual(3)
    })

    it('testConnectionCapacity1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(2)
      const conn1: CapacityConnection | null = await pool.tryAcquire()
      const conn2: CapacityConnection | null = await pool.tryAcquire()
      expect(await pool.getTotalCount()).assertEqual(2)
    })

    it('testConnectionCapacity1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await pool.initialize(3)
      for (let i: number = 0; i < 3; i++) {
        await pool.tryAcquire()
      }
      expect(await pool.getRejectedCount()).assertEqual(0)
    })

    it('testConnectionCapacity1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await pool.initialize(2)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(capacityAcquireTask, pool))
      }
      await executeTasksGetObjects(tasks)
      expect(await pool.getTotalCount() <= 2).assertTrue()
    })
  })
}
