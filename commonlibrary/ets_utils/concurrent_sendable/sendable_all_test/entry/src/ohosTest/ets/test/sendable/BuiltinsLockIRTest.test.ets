import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class IRLockResource {
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }

  public data_: number = 0
  public status_: number = 0

  async getLockStatus(): Promise<number[]> {
    return await this.lock_.lockAsync((): number[] => [this.data_, this.status_])
  }

  async updateData(value: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.data_ = value
      this.status_++
    })
  }
}

@Sendable
class ProtectedData {
  public value_: number = 0
  public version_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async update(v: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.value_ = v
      this.version_++
    })
  }

  async getIRProperties(): Promise<number[]> {
    return await this.lock_.lockAsync((): number[] => [this.value_, this.version_])
  }
}

@Sendable
class ConditionState {
  public waitCount_: number = 0
  public notifyCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  public cond_: ArkTSUtils.locks.ConditionVariable

  constructor(lock_: ArkTSUtils.locks.AsyncLock, cond_: ArkTSUtils.locks.ConditionVariable) {
    this.lock_ = lock_
    this.cond_ = cond_
  }


  async incrementWait(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.waitCount_++
    })
  }

  async incrementNotify(): Promise<void> {
    await this.lock_.lockAsync(async (): Promise<void> => {
      this.notifyCount_++
      await this.cond_.notifyAll()
    })
  }

  async getWaitCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.waitCount_)
  }

  async getNotifyCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.notifyCount_)
  }
}

@Sendable
class SharedLockResource {
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }

  public data_: number = 0
}

@Sendable
class ConcurrentLockData {
  public counter_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async increment(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.counter_++
      return this.counter_
    })
  }

  async getCounter(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.counter_)
  }
}

@Sendable
class LockPerformanceTest {
  public value_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async getValue(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.value_)
  }
}

@Sendable
class WaitCounter {
  public waiting_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async incrementWaiting(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.waiting_++
    })
  }

  async getWaiting(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.waiting_)
  }
}

@Sendable
class CrossThreadLock {
  public value_: number = 42
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }

}

@Concurrent
function readCrossThreadValue(lockObj: CrossThreadLock): number {
  return lockObj.value_
}

export default function BuiltinsLockIRTest(): void {
  describe('BuiltinsLockIRTest', (): void => {
    /**
     * @tc.name   testLockIR0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOCKIR_TEST_0100
     * @tc.desc   Verify testLockIR0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockIR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const resource: IRLockResource = new IRLockResource(new ArkTSUtils.locks.AsyncLock())
      const status: number[] = await resource.getLockStatus()
      expect(status[0]).assertEqual(0)
      expect(status[1]).assertEqual(0)
    })

    /**
     * @tc.name   testLockIR0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOCKIR_TEST_0200
     * @tc.desc   Verify testLockIR0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockIR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const data: ProtectedData = new ProtectedData(new ArkTSUtils.locks.AsyncLock())
      await data.update(100)
      const props: number[] = await data.getIRProperties()
      expect(props[0]).assertEqual(100)
      expect(props[1]).assertEqual(1)
    })

    /**
     * @tc.name   testLockIR0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOCKIR_TEST_0300
     * @tc.desc   Verify testLockIR0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLockIR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const state: ConditionState = new ConditionState(new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable())
      await state.incrementWait()
      expect(await state.getWaitCount()).assertEqual(1)
    })

    /**
     * @tc.name   testLockIR0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOCKIR_TEST_0400
     * @tc.desc   Verify testLockIR0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLockIR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const resource1: SharedLockResource = new SharedLockResource(new ArkTSUtils.locks.AsyncLock())
      const resource2: SharedLockResource = new SharedLockResource(new ArkTSUtils.locks.AsyncLock())
      expect(resource1.data_).assertEqual(0)
      expect(resource2.data_).assertEqual(0)
    })

    /**
     * @tc.name   testLockIR0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOCKIR_TEST_0500
     * @tc.desc   Verify testLockIR0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLockIR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const data: ConcurrentLockData = new ConcurrentLockData(new ArkTSUtils.locks.AsyncLock())
      const promises: Promise<number>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(data.increment())
      }
      await Promise.all(promises)
      expect(await data.getCounter()).assertEqual(50)
    })

    /**
     * @tc.name   testLockIR0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOCKIR_TEST_0600
     * @tc.desc   Verify testLockIR0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLockIR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const test: LockPerformanceTest = new LockPerformanceTest(new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 100; i++) {
        const value: number = await test.getValue()
        expect(value).assertEqual(0)
      }
    })

    /**
     * @tc.name   testLockIR0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOCKIR_TEST_0700
     * @tc.desc   Verify testLockIR0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLockIR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter: WaitCounter = new WaitCounter(new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 10; i++) {
        await counter.incrementWaiting()
      }
      expect(await counter.getWaiting()).assertEqual(10)
    })

    /**
     * @tc.name   testLockIR0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LOCKIR_TEST_0800
     * @tc.desc   Verify testLockIR0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLockIR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const lockObj: CrossThreadLock = new CrossThreadLock(new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readCrossThreadValue, lockObj))
      }
      const results = await Promise.all(tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t)))
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(42)
      }
    })
  })
}
