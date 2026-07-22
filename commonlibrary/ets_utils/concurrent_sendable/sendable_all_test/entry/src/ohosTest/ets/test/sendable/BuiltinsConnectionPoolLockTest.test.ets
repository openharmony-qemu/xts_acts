import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class ConnectionPool {
  public maxConnections_: number = 5
  public inUse_: collections.Array<boolean>

  public lock_: ArkTSUtils.locks.AsyncLock

  public available_: ArkTSUtils.locks.ConditionVariable

  constructor(inUse_: collections.Array<boolean>, lock_: ArkTSUtils.locks.AsyncLock, available_: ArkTSUtils.locks.ConditionVariable) {
    this.inUse_ = inUse_
    this.lock_ = lock_
    this.available_ = available_
  }

  public acquireCount_: number = 0
  public releaseCount_: number = 0

  async initialize(size: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.maxConnections_ = size
      while (this.inUse_.length > 0) { this.inUse_.pop() }
      for (let i = 0; i < size; i++) {
        this.inUse_.push(false)
      }
    })
  }

  async acquire(): Promise<number> {
    while (true) {
      const result: number | undefined = await this.lock_.lockAsync((): number | undefined => {
        for (let i = 0; i < this.inUse_.length; i++) {
          if (!this.inUse_[i]) {
            this.inUse_[i] = true
            this.acquireCount_++
            return i
          }
        }
        if (this.inUse_.length < this.maxConnections_) {
          const idx: number = this.inUse_.length
          this.inUse_.push(true)
          this.acquireCount_++
          return idx
        }
        return undefined
      })
      if (result !== undefined) {
        return result
      }
      await this.available_.waitFor(100)
    }
  }

  async release(connId: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      if (connId >= 0 && connId < this.inUse_.length && this.inUse_[connId]) {
        this.inUse_[connId] = false
        this.releaseCount_++
      }
    })
    this.available_.notifyAll()
  }

  async getAvailableCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      let count: number = 0
      for (let i = 0; i < this.inUse_.length; i++) {
        if (!this.inUse_[i]) {
          count++
        }
      }
      return count
    })
  }

  async getTotalCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.inUse_.length)
  }

  async isInUse(connId: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (connId >= 0 && connId < this.inUse_.length) {
        return this.inUse_[connId]
      }
      return false
    })
  }

  async getAcquireCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.acquireCount_)
  }

  async getReleaseCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.releaseCount_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.inUse_.length > 0) { this.inUse_.pop() }
      this.acquireCount_ = 0
      this.releaseCount_ = 0
    })
  }
}

@Concurrent
function acquireConnectionId(): number {
  return 0
}

@Concurrent
function connectionNotifyTask(): void {
  taskpool.Task.sendData({ action: 'acquired', connId: 1 })
  taskpool.Task.sendData({ action: 'used', connId: 1 })
  taskpool.Task.sendData({ action: 'released', connId: 1 })
}

export default function BuiltinsConnectionPoolLockTest(): void {
  describe('BuiltinsConnectionPoolLockTest', (): void => {
    let pool: ConnectionPool

    beforeEach(async (): Promise<void> => {
      pool = new ConnectionPool(new collections.Array<boolean>(), new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable())
      await pool.initialize(5)
    })
    it('testConnectionPoolLock0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(await pool.getTotalCount()).assertEqual(5)
      expect(await pool.getAvailableCount()).assertEqual(5)
    })

    it('testConnectionPoolLock0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const connId: number = await pool.acquire()
      expect(connId >= 0).assertTrue()
      expect(await pool.isInUse(connId)).assertTrue()
      expect(await pool.getAvailableCount()).assertEqual(4)
    })

    it('testConnectionPoolLock0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const connId: number = await pool.acquire()
      expect(await pool.getAvailableCount()).assertEqual(4)
      await pool.release(connId)
      expect(await pool.getAvailableCount()).assertEqual(5)
      expect(await pool.isInUse(connId)).assertFalse()
    })

    it('testConnectionPoolLock0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const conn1: number = await pool.acquire()
      const conn2: number = await pool.acquire()
      expect(await pool.getAvailableCount()).assertEqual(3)
      await pool.release(conn1)
      expect(await pool.getAvailableCount()).assertEqual(4)
    })

    it('testConnectionPoolLock0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const connIds: number[] = []
      for (let i = 0; i < 5; i++) {
        connIds.push(await pool.acquire())
      }
      expect(await pool.getAvailableCount()).assertEqual(0)
      let acquireCompleted: boolean = false
      const acquirePromise: Promise<number> = pool.acquire()
      acquirePromise.then((): void => {
        acquireCompleted = true
      })
      await Utils.sleep(500)
      expect(acquireCompleted).assertFalse()
      await pool.release(connIds[0])
      await acquirePromise
      expect(acquireCompleted).assertTrue()
    })

    it('testConnectionPoolLock0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const connIds: number[] = []
      for (let i = 0; i < 5; i++) {
        connIds.push(await pool.acquire())
      }
      let acquireCompleted: boolean = false
      let acquiredConnId: number = -1
      const acquirePromise: Promise<number> = pool.acquire()
      acquirePromise.then((connId: number): void => {
        acquiredConnId = connId
        acquireCompleted = true
      })
      await Utils.sleep(500)
      expect(acquireCompleted).assertFalse()
      await pool.release(connIds[2])
      await acquirePromise
      expect(acquireCompleted).assertTrue()
      expect(acquiredConnId >= 0).assertTrue()
    })

    it('testConnectionPoolLock0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(pool.acquire())
      }
      const connIds: number[] = await Promise.all(promises)
      expect(connIds.length).assertEqual(5)
      expect(await pool.getAvailableCount()).assertEqual(0)
      for (let i = 0; i < connIds.length; i++) {
        await pool.release(connIds[i])
      }
      expect(await pool.getAvailableCount()).assertEqual(5)
    })

    it('testConnectionPoolLock0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await pool.getAcquireCount()).assertEqual(0)
      expect(await pool.getReleaseCount()).assertEqual(0)
      const connId: number = await pool.acquire()
      await pool.release(connId)
      expect(await pool.getAcquireCount()).assertEqual(1)
      expect(await pool.getReleaseCount()).assertEqual(1)
    })

    it('testConnectionPoolLock0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const conn1: number = await pool.acquire()
      await pool.release(conn1)
      const conn2: number = await pool.acquire()
      expect(conn1).assertEqual(conn2)
      expect(await pool.getAvailableCount()).assertEqual(4)
    })

    it('testConnectionPoolLock1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(acquireConnectionId))
      }
      await Promise.all(tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t)))
      for (let i = 0; i < 3; i++) {
        await pool.acquire()
      }
      expect(await pool.getAcquireCount()).assertLargerOrEqual(3)
    })

    it('testConnectionPoolLock1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const connIds: number[] = []
      for (let round = 0; round < 3; round++) {
        for (let i = 0; i < 5; i++) {
          connIds.push(await pool.acquire())
        }
        expect(await pool.getAvailableCount()).assertEqual(0)
        while (connIds.length > 0) {
          const connId: number = connIds.pop()!
          await pool.release(connId)
        }
        expect(await pool.getAvailableCount()).assertEqual(5)
      }
      const acquireCount: number = await pool.getAcquireCount()
      const releaseCount: number = await pool.getReleaseCount()
      expect(acquireCount).assertEqual(releaseCount)
    })

    it('testConnectionPoolLock1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notifications: Object[] = []
      const task: taskpool.Task = new taskpool.Task(connectionNotifyTask)
      task.onReceiveData((data: Object): void => {
        notifications.push(data)
      })
      await taskpool.execute(task)
      await new Promise<void>((resolve: Function): void => {
        const checkInterval: Object = setInterval((): void => {
          if (notifications.length >= 3) {
            clearInterval(checkInterval as number)
            resolve()
          }
        }, 10)
      })
      expect(notifications.length).assertEqual(3)
    })
  })
}
