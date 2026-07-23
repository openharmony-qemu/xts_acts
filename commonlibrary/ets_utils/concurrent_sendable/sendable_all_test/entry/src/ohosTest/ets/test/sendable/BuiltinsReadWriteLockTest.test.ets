import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class ReadWriteResource {
  public data_: number = 0
  public readers_: number = 0
  public writing_: boolean = false
  public lock_: ArkTSUtils.locks.AsyncLock

  public readCond_: ArkTSUtils.locks.ConditionVariable

  public writeCond_: ArkTSUtils.locks.ConditionVariable

  constructor(lock_: ArkTSUtils.locks.AsyncLock, readCond_: ArkTSUtils.locks.ConditionVariable, writeCond_: ArkTSUtils.locks.ConditionVariable) {
    this.lock_ = lock_
    this.readCond_ = readCond_
    this.writeCond_ = writeCond_
  }

  public readCount_: number = 0
  public writeCount_: number = 0

  async read(): Promise<number> {
    return await this.lock_.lockAsync(async (): Promise<number> => {
      while (this.writing_) {
        await this.readCond_.wait()
      }
      this.readers_++
      this.readCount_++
      const value: number = this.data_
      this.readers_--
      if (this.readers_ === 0) {
        await this.writeCond_.notifyOne()
      }
      return value
    })
  }

  async write(value: number): Promise<void> {
    await this.lock_.lockAsync(async (): Promise<void> => {
      while (this.writing_ || this.readers_ > 0) {
        await this.writeCond_.wait()
      }
      this.writing_ = true
      this.writeCount_++
      this.data_ = value
      this.writing_ = false
      await this.readCond_.notifyAll()
      await this.writeCond_.notifyOne()
    })
  }

  async getReadCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.readCount_)
  }

  async getWriteCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.writeCount_)
  }

  async getData(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.data_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.data_ = 0
      this.readers_ = 0
      this.writing_ = false
      this.readCount_ = 0
      this.writeCount_ = 0
    })
  }
}

@Concurrent
function readResourceValue(resource: ReadWriteResource): number {
  return resource.data_
}

@Concurrent
async function writeResourceValue(resource: ReadWriteResource, value: number): Promise<void> {
  return await resource.lock_.lockAsync((): void => {
    resource.data_ = value
    resource.writeCount_++
  })
}

export default function BuiltinsReadWriteLockTest(): void {
  describe('BuiltinsReadWriteLockTest', (): void => {
    let resource: ReadWriteResource

    beforeEach((): void => {
      resource = new ReadWriteResource(new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable(), new ArkTSUtils.locks.ConditionVariable())
    })
    /** @tc.level  LEVEL0 */
    it('testReadWriteLock0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await resource.write(100)
      const value: number = await resource.read()
      expect(value).assertEqual(100)
    })

    /** @tc.level  LEVEL1 */
    it('testReadWriteLock0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(resource.write(i * 10))
      }
      await Promise.all(promises)
      expect(await resource.getWriteCount()).assertEqual(5)
    })

    /** @tc.level  LEVEL1 */
    it('testReadWriteLock0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(resource.write(i))
      }
      await Promise.all(promises)
      const value: number = await resource.getData()
      expect(value >= 0 && value < 10).assertTrue()
    })

    /** @tc.level  LEVEL0 */
    it('testReadWriteLock0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await resource.write(50)
      const promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(resource.read())
      }
      const results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(50)
      }
    })

    /** @tc.level  LEVEL1 */
    it('testReadWriteLock0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await resource.write(100)
      const promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(resource.read())
      }
      await Promise.all(promises)
      expect(await resource.getReadCount()).assertEqual(10)
    })

    /** @tc.level  LEVEL2 */
    it('testReadWriteLock0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await resource.write(0)
      const readTasks: taskpool.Task[] = []
      const writeTasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        readTasks.push(new taskpool.Task(readResourceValue, resource))
      }
      for (let i = 0; i < 3; i++) {
        writeTasks.push(new taskpool.Task(writeResourceValue, resource, i * 100))
      }
      const allTasks: taskpool.Task[] = [...readTasks, ...writeTasks]
      const promises: Promise<Object>[] = []
      for (let i = 0; i < allTasks.length; i++) {
        promises.push(taskpool.execute(allTasks[i]))
      }
      await Promise.all(promises)
      expect(await resource.getWriteCount()).assertLargerOrEqual(3)
    })

    /** @tc.level  LEVEL1 */
    it('testReadWriteLock0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let readCompleted: boolean = false
      const writePromise: Promise<void> = resource.write(200)
      await writePromise
      const readPromise: Promise<number> = resource.read()
      readPromise.then((): void => {
        readCompleted = true
      })
      await readPromise
      expect(readCompleted).assertTrue()
    })

    /** @tc.level  LEVEL1 */
    it('testReadWriteLock0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 5; i++) {
        await resource.write(i * 10)
        const value: number = await resource.read()
        expect(value).assertEqual(i * 10)
      }
      expect(await resource.getWriteCount()).assertEqual(5)
      expect(await resource.getReadCount()).assertEqual(5)
    })

    /** @tc.level  LEVEL2 */
    it('testReadWriteLock0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises: Promise<void | number>[] = []
      for (let i = 0; i < 20; i++) {
        if (i % 3 === 0) {
          promises.push(resource.write(i))
        } else {
          promises.push(resource.read())
        }
      }
      await Promise.all(promises)
      const readCount: number = await resource.getReadCount()
      const writeCount: number = await resource.getWriteCount()
      expect(readCount + writeCount).assertEqual(20)
    })
  })
}
