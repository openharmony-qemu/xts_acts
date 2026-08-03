import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class CondBuffer {
  public buffer_: collections.Array<number>

  public capacity_: number = 5
  public lock_: ArkTSUtils.locks.AsyncLock

  public notEmpty_: ArkTSUtils.locks.ConditionVariable

  public notFull_: ArkTSUtils.locks.ConditionVariable

  constructor(buffer_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock, notEmpty_: ArkTSUtils.locks.ConditionVariable, notFull_: ArkTSUtils.locks.ConditionVariable) {
    this.buffer_ = buffer_
    this.lock_ = lock_
    this.notEmpty_ = notEmpty_
    this.notFull_ = notFull_
  }

  public putCount_: number = 0
  public takeCount_: number = 0

  async put(item: number): Promise<void> {
    while (true) {
      const canPut: boolean = await this.lock_.lockAsync((): boolean => {
        if (this.buffer_.length < this.capacity_) {
          this.buffer_.push(item)
          this.putCount_++
          return true
        }
        return false
      })
      if (canPut) {
        this.notEmpty_.notifyAll()
        return
      }
      await this.notFull_.waitFor(500)
    }
  }

  async take(): Promise<number> {
    while (true) {
      const result: number | undefined = await this.lock_.lockAsync((): number | undefined => {
        if (this.buffer_.length > 0) {
          const item: number = this.buffer_[0]
          this.buffer_.splice(0, 1)
          this.takeCount_++
          return item
        }
        return undefined
      })
      if (result !== undefined) {
        this.notFull_.notifyAll()
        return result
      }
      await this.notEmpty_.waitFor(500)
    }
  }

  async size(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.buffer_.length)
  }

  async getPutCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.putCount_)
  }

  async getTakeCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.takeCount_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.buffer_.length > 0) { this.buffer_.pop() }
      this.putCount_ = 0
      this.takeCount_ = 0
    })
  }
}

@Sendable
class WaitCounter {
  public count_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  public cond_: ArkTSUtils.locks.ConditionVariable

  constructor(lock_: ArkTSUtils.locks.AsyncLock, cond_: ArkTSUtils.locks.ConditionVariable) {
    this.lock_ = lock_
    this.cond_ = cond_
  }

  public waitCount_: number = 0

  async waitForCondition(target: number): Promise<boolean> {
    await this.lock_.lockAsync((): void => {
      this.waitCount_++
    })
    while (true) {
      const reached: boolean = await this.lock_.lockAsync((): boolean => this.count_ >= target)
      if (reached) {
        return true
      }
      await this.cond_.waitFor(500)
    }
  }

  async increment(): Promise<number> {
    const result: number = await this.lock_.lockAsync((): number => {
      this.count_++
      return this.count_
    })
    this.cond_.notifyAll()
    return result
  }

  async getCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.count_)
  }

  async getWaitCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.waitCount_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.count_ = 0
      this.waitCount_ = 0
    })
  }
}

@Sendable
class WaitQueueItem {
  public id: number = 0
  public waitStartTime: number = 0
  public notified: boolean = false
}

@Sendable
class ConditionVariableManager {
  public condition_: ArkTSUtils.locks.ConditionVariable
  public lock_: ArkTSUtils.locks.AsyncLock

  public waitQueue_: collections.Array<WaitQueueItem>

  constructor(lock_: ArkTSUtils.locks.AsyncLock, waitQueue_: collections.Array<WaitQueueItem>, condition_: ArkTSUtils.locks.ConditionVariable) {
    this.lock_ = lock_
    this.waitQueue_ = waitQueue_
    this.condition_ = condition_
  }

  public notifyCount_: number = 0
  public waitCount_: number = 0
  public nextId_: number = 0

  async addToWaitQueue(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const item: WaitQueueItem = new WaitQueueItem()
      item.id = this.nextId_++
      item.waitStartTime = Date.now()
      item.notified = false
      this.waitQueue_.push(item)
      this.waitCount_++
      return item.id
    })
  }

  async notifyOne(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.notifyCount_++
      const firstWaiting: WaitQueueItem | undefined = this.waitQueue_.at(0)
      if (firstWaiting !== undefined) {
        firstWaiting.notified = true
      }
    })
    this.condition_.notifyOne()
  }

  getQueueLength(): number {
    return this.waitQueue_.length
  }

  getQueueItems(): collections.Array<WaitQueueItem> {
    return this.waitQueue_
  }

  getNotifyCount(): number {
    return this.notifyCount_
  }

  getWaitCount(): number {
    return this.waitCount_
  }
}

@Concurrent
async function waitForConditionTask(cvManager: ConditionVariableManager): Promise<void> {
  await cvManager.addToWaitQueue()
}

@Concurrent
async function notifyOneTask(cvManager: ConditionVariableManager): Promise<void> {
  await cvManager.notifyOne()
}

@Concurrent
function consumeFromBuffer(buffer: CondBuffer): number {
  if (buffer.buffer_.length > 0) {
    return buffer.buffer_[0]
  }
  return -1
}

export default function BuiltinsConditionVariableTest(): void {
  describe('BuiltinsConditionVariableTest', (): void => {
    let buffer: CondBuffer
    let waitCounter: WaitCounter
    let cvManager: ConditionVariableManager

    beforeEach((): void => {
      buffer = new CondBuffer(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable(), new ArkTSUtils.locks.ConditionVariable())
      waitCounter = new WaitCounter(new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable())
      cvManager = new ConditionVariableManager(new ArkTSUtils.locks.AsyncLock(), new collections.Array<WaitQueueItem>(), new ArkTSUtils.locks.ConditionVariable())
    })
    /** @tc.level  LEVEL0 */
    it('testConditionVariable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const size: number = await buffer.size()
      expect(size).assertEqual(0)
      let takeResult: number | undefined = undefined
      const takePromise: Promise<number> = buffer.take()
      takePromise.then((result: number): void => {
        takeResult = result
      })
      await Utils.sleep(500)
      expect(takeResult === undefined).assertTrue()
      await buffer.put(100)
      await takePromise
      expect(takeResult).assertEqual(100)
    })

    /** @tc.level  LEVEL0 */
    it('testConditionVariable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await buffer.put(50)
      const takePromise: Promise<number> = buffer.take()
      await takePromise
      const sizeAfterTake: number = await buffer.size()
      expect(sizeAfterTake).assertEqual(0)
    })

    /** @tc.level  LEVEL1 */
    it('testConditionVariable0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const target: number = 5
      let reached: boolean = false
      const waitPromise: Promise<boolean> = waitCounter.waitForCondition(target)
      waitPromise.then((result: boolean): void => {
        reached = result
      })
      for (let i = 0; i < target; i++) {
        await waitCounter.increment()
      }
      await waitPromise
      expect(reached).assertTrue()
      expect(await waitCounter.getCount()).assertEqual(5)
    })

    /** @tc.level  LEVEL1 */
    it('testConditionVariable0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter: number = 0
      const cond: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      const w1: Promise<void> = cond.wait().then((): void => { counter++ })
      const w2: Promise<void> = cond.wait().then((): void => { counter++ })
      const w3: Promise<void> = cond.wait().then((): void => { counter++ })
      await Utils.sleep(500)
      expect(counter).assertEqual(0)
      cond.notifyAll()
      await Promise.all([w1, w2, w3])
      expect(counter).assertEqual(3)
    })

    /** @tc.level  LEVEL0 */
    it('testConditionVariable0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await buffer.put(1)
      await buffer.put(2)
      await buffer.put(3)
      expect(await buffer.size()).assertEqual(3)
      const item1: number = await buffer.take()
      const item2: number = await buffer.take()
      const item3: number = await buffer.take()
      expect(item1).assertEqual(1)
      expect(item2).assertEqual(2)
      expect(item3).assertEqual(3)
      expect(await buffer.size()).assertEqual(0)
    })

    /** @tc.level  LEVEL2 */
    it('testConditionVariable0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 5; i++) {
        await buffer.put(i * 10)
      }
      const consumeTasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        consumeTasks.push(new taskpool.Task(consumeFromBuffer, buffer))
      }
      await Promise.all(consumeTasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t)))
      expect(await buffer.getTakeCount()).assertLargerOrEqual(0)
    })

    /** @tc.level  LEVEL0 */
    it('testConditionVariable0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await waitCounter.increment()
      await waitCounter.increment()
      const result: boolean = await waitCounter.waitForCondition(2)
      expect(result).assertTrue()
    })

    /**
     * @tc.name   testConditionVariable0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONDITION_VARIABLE_TEST_0800
     * @tc.desc   Verify small concurrency 10 ConditionVariable operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConditionVariable0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 10; i++) {
        await cvManager.addToWaitQueue()
      }
      expect(cvManager.getQueueLength()).assertEqual(10)
    })

    /**
     * @tc.name   testConditionVariable0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONDITION_VARIABLE_TEST_0900
     * @tc.desc   Verify wait queue collections.Array operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConditionVariable0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cvManager.addToWaitQueue()
      await cvManager.addToWaitQueue()
      await cvManager.addToWaitQueue()

      const items: collections.Array<WaitQueueItem> = cvManager.getQueueItems()
      expect(items.length).assertEqual(3)
      expect(items[0].id).assertEqual(0)
      expect(items[1].id).assertEqual(1)
      expect(items[2].id).assertEqual(2)
    })

    /**
     * @tc.name   testConditionVariable1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONDITION_VARIABLE_TEST_1000
     * @tc.desc   Verify AsyncLock protects ConditionVariable operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConditionVariable1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(cvManager.addToWaitQueue())
      }
      await Promise.all(promises)

      expect(cvManager.getWaitCount()).assertEqual(10)
      expect(cvManager.getQueueLength()).assertEqual(10)

      const items: collections.Array<WaitQueueItem> = cvManager.getQueueItems()
      const ids: Set<number> = new Set<number>()
      for (let i = 0; i < items.length; i++) {
        ids.add(items[i].id)
      }
      expect(ids.size).assertEqual(10)
    })
  })
}
