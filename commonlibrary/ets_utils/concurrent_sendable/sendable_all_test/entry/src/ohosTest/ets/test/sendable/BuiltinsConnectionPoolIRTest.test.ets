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
class IRConnection {
  public id_: number = 0
  public isActive_: boolean = true
  public accessCount_: number = 0

  constructor(id: number) {
    this.id_ = id
    this.isActive_ = true
    this.accessCount_ = 0
  }
}

@Sendable
class IRPool {
  public connections_: collections.Array<IRConnection>

  public maxPoolSize_: number = 5
  public totalCreated_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(connections_: collections.Array<IRConnection>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.connections_ = connections_
    this.lock_ = lock_
  }


  async initialize(size: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.maxPoolSize_ = size
      this.totalCreated_ = 0
      for (let i: number = 0; i < size; i++) {
        this.connections_.push(new IRConnection(i))
        this.totalCreated_++
      }
    })
  }

  async acquire(): Promise<IRConnection | null> {
    return await this.lock_.lockAsync((): IRConnection | null => {
      for (let i: number = 0; i < this.connections_.length; i++) {
        this.connections_[i].accessCount_++
        if (this.connections_[i].isActive_) {
          this.connections_[i].isActive_ = false
          return this.connections_[i]
        }
      }
      if (this.totalCreated_ < this.maxPoolSize_) {
        const conn: IRConnection = new IRConnection(this.totalCreated_)
        conn.isActive_ = false
        this.connections_.push(conn)
        this.totalCreated_++
        return conn
      }
      return null
    })
  }

  async release(conn: IRConnection): Promise<void> {
    await this.lock_.lockAsync((): void => {
      conn.isActive_ = true
      conn.accessCount_++
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

  async getTotalAccessCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      let total: number = 0
      for (let i: number = 0; i < this.connections_.length; i++) {
        total += this.connections_[i].accessCount_
      }
      return total
    })
  }

  async shutdown(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.connections_.length > 0) { this.connections_.pop() }
      this.totalCreated_ = 0
    })
  }
}

@Sendable
class IRFieldPool {
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
async function irPoolAcquireTask(pool: IRPool): Promise<IRConnection | null> {
  return await pool.acquire()
}

@Concurrent
async function irFieldUpdateTask(pool: IRFieldPool): Promise<void> {
  return await pool.lock_.lockAsync((): void => {
    pool.field1_++
    pool.field2_ += 2
    pool.field3_ += 3

  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsConnectionPoolIRTest(): void {
  describe('BuiltinsConnectionPoolIRTest', () => {
    it('testConnectionPoolIR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pool: IRPool = new IRPool(new collections.Array<IRConnection>(), new ArkTSUtils.locks.AsyncLock())
      await pool.initialize(3)
      expect(await pool.getActiveCount()).assertEqual(3)
    })

    it('testConnectionPoolIR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pool: IRPool = new IRPool(new collections.Array<IRConnection>(), new ArkTSUtils.locks.AsyncLock())
      await pool.initialize(3)
      const conn: IRConnection | null = await pool.acquire()
      expect(await pool.getActiveCount()).assertEqual(2)
    })

    it('testConnectionPoolIR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pool: IRPool = new IRPool(new collections.Array<IRConnection>(), new ArkTSUtils.locks.AsyncLock())
      await pool.initialize(3)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(irPoolAcquireTask, pool))
      }
      await executeTasksGetObjects(tasks)
      expect(await pool.getActiveCount()).assertEqual(0)
    })

    it('testConnectionPoolIR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pool: IRFieldPool = new IRFieldPool(new ArkTSUtils.locks.AsyncLock())
      await pool.updateFields()
      expect(await pool.getField1()).assertEqual(1)
      expect(await pool.getField2()).assertEqual(2)
      expect(await pool.getField3()).assertEqual(3)
    })

    it('testConnectionPoolIR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pool: IRFieldPool = new IRFieldPool(new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(irFieldUpdateTask, pool))
      }
      await executeTasksGetObjects(tasks)
      expect(await pool.getField1()).assertEqual(5)
      expect(await pool.getField2()).assertEqual(10)
      expect(await pool.getField3()).assertEqual(15)
    })

    it('testConnectionPoolIR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pool1: IRPool = new IRPool(new collections.Array<IRConnection>(), new ArkTSUtils.locks.AsyncLock())
      const pool2: IRPool = new IRPool(new collections.Array<IRConnection>(), new ArkTSUtils.locks.AsyncLock())
      await pool1.initialize(3)
      await pool2.initialize(3)
      expect(await pool1.getActiveCount()).assertEqual(3)
      expect(await pool2.getActiveCount()).assertEqual(3)
    })

    it('testConnectionPoolIR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const pool: IRPool = new IRPool(new collections.Array<IRConnection>(), new ArkTSUtils.locks.AsyncLock())
      await pool.initialize(3)
      const conn: IRConnection | null = await pool.acquire()
      await pool.release(conn as IRConnection)
      expect(await pool.getActiveCount()).assertEqual(3)
    })

    it('testConnectionPoolIR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const pool: IRPool = new IRPool(new collections.Array<IRConnection>(), new ArkTSUtils.locks.AsyncLock())
      await pool.initialize(3)
      await pool.acquire()
      const accessCount: number = await pool.getTotalAccessCount()
      expect(accessCount > 0).assertTrue()
    })

    it('testConnectionPoolIR0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pool: IRFieldPool = new IRFieldPool(new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(irFieldUpdateTask, pool))
      }
      await executeTasksGetObjects(tasks)
      expect(await pool.getField1()).assertEqual(10)
      expect(await pool.getField2()).assertEqual(20)
      expect(await pool.getField3()).assertEqual(30)
    })

    it('testConnectionPoolIR1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const pool: IRPool = new IRPool(new collections.Array<IRConnection>(), new ArkTSUtils.locks.AsyncLock())
      await pool.initialize(3)
      for (let i: number = 0; i < 3; i++) {
        await pool.acquire()
      }
      await pool.shutdown()
      expect(await pool.getActiveCount()).assertEqual(0)
    })
  })
}
