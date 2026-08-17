import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class ProducerConsumerBuffer {
  public buffer_: collections.Array<number>

  public capacity_: number = 10
  public lock_: ArkTSUtils.locks.AsyncLock

  public notEmpty_: ArkTSUtils.locks.ConditionVariable

  public notFull_: ArkTSUtils.locks.ConditionVariable

  constructor(buffer_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock, notEmpty_: ArkTSUtils.locks.ConditionVariable, notFull_: ArkTSUtils.locks.ConditionVariable) {
    this.buffer_ = buffer_
    this.lock_ = lock_
    this.notEmpty_ = notEmpty_
    this.notFull_ = notFull_
  }

  public producedTotal_: number = 0
  public consumedTotal_: number = 0

  async produce(item: number): Promise<void> {
    while (true) {
      const canProduce: boolean = await this.lock_.lockAsync((): boolean => {
        if (this.buffer_.length < this.capacity_) {
          this.buffer_.push(item)
          this.producedTotal_++
          return true
        }
        return false
      })
      if (canProduce) {
        this.notEmpty_.notifyAll()
        return
      }
      await this.notFull_.waitFor(500)
    }
  }

  async consume(): Promise<number> {
    while (true) {
      const result: number | undefined = await this.lock_.lockAsync((): number | undefined => {
        if (this.buffer_.length > 0) {
          const item: number = this.buffer_[0]
          this.buffer_.splice(0, 1)
          this.consumedTotal_++
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

  async tryProduce(item: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (this.buffer_.length >= this.capacity_) {
        return false
      }
      this.buffer_.push(item)
      this.producedTotal_++
      return true
    })
  }

  async tryConsume(): Promise<number | undefined> {
    return await this.lock_.lockAsync((): number | undefined => {
      if (this.buffer_.length === 0) {
        return undefined
      }
      const item: number = this.buffer_[0]
      this.buffer_.splice(0, 1)
      this.consumedTotal_++
      return item
    })
  }

  async size(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.buffer_.length)
  }

  async getProducedTotal(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.producedTotal_)
  }

  async getConsumedTotal(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.consumedTotal_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.buffer_.length > 0) { this.buffer_.pop() }
      this.producedTotal_ = 0
      this.consumedTotal_ = 0
    })
  }
}

@Concurrent
function produceValue(value: number): number {
  return value
}

@Concurrent
function consumeValue(): number {
  return -1
}

@Concurrent
function notifyProducer(): void {
  taskpool.Task.sendData('item_0')
  taskpool.Task.sendData('item_1')
  taskpool.Task.sendData('item_2')
}

export default function ProducerConsumerCoordTest(): void {
  describe('ProducerConsumerCoordTest', (): void => {
    let pcb: ProducerConsumerBuffer

    beforeEach((): void => {
      pcb = new ProducerConsumerBuffer(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable(), new ArkTSUtils.locks.ConditionVariable())
    })
    /**
     * @tc.name   testProducerConsumerCoord0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PRODUCERCONSUMERCOORD_TEST_0100
     * @tc.desc   Verify testProducerConsumerCoord0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testProducerConsumerCoord0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await pcb.produce(100)
        const item: number = await pcb.consume()
        expect(item).assertEqual(100)
        expect(await pcb.size()).assertEqual(0)
      } catch (error) {
        console.error("testProducerConsumerCoord0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testProducerConsumerCoord0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PRODUCERCONSUMERCOORD_TEST_0200
     * @tc.desc   Verify testProducerConsumerCoord0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProducerConsumerCoord0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        for (let i = 0; i < 5; i++) {
          await pcb.produce(i * 10)
        }
        const items: number[] = []
        for (let i = 0; i < 5; i++) {
          items.push(await pcb.consume())
        }
        expect(items.length).assertEqual(5)
        expect(await pcb.size()).assertEqual(0)
      } catch (error) {
        console.error("testProducerConsumerCoord0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testProducerConsumerCoord0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PRODUCERCONSUMERCOORD_TEST_0300
     * @tc.desc   Verify testProducerConsumerCoord0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProducerConsumerCoord0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const producePromises: Promise<void>[] = []
        for (let i = 0; i < 5; i++) {
          producePromises.push(pcb.produce(i))
        }
        await Promise.all(producePromises)
        for (let i = 0; i < 5; i++) {
          await pcb.consume()
        }
        expect(await pcb.size()).assertEqual(0)
      } catch (error) {
        console.error("testProducerConsumerCoord0300 failed");
        expect(false).assertFail();
      }
      done();
    })


    /**
     * @tc.name   testProducerConsumerCoord0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PRODUCERCONSUMERCOORD_TEST_0400
     * @tc.desc   Verify testProducerConsumerCoord0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProducerConsumerCoord0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let consumeCompleted: boolean = false
        let consumeResult: number | undefined = undefined
        const consumePromise: Promise<number> = pcb.consume()
        const consumeWatchFn: () => Promise<void> = async (): Promise<void> => {
          try {
            const result: number = await consumePromise
            consumeResult = result
            consumeCompleted = true
          } catch (error) {
            console.error("testProducerConsumerCoord0400 failed")
            expect(false).assertFail()
          }
        }
        const consumeWatch: Promise<void> = consumeWatchFn()
        await Utils.sleep(500)
        expect(consumeCompleted).assertFalse()
        await pcb.produce(42)
        await consumePromise
        expect(consumeCompleted).assertTrue()
        expect(consumeResult).assertEqual(42)
      } catch (error) {
        console.error("testProducerConsumerCoord0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testProducerConsumerCoord0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PRODUCERCONSUMERCOORD_TEST_0500
     * @tc.desc   Verify testProducerConsumerCoord0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testProducerConsumerCoord0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const result: boolean = await pcb.tryProduce(100)
        expect(result).assertTrue()
        expect(await pcb.size()).assertEqual(1)
      } catch (error) {
        console.error("testProducerConsumerCoord0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testProducerConsumerCoord0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PRODUCERCONSUMERCOORD_TEST_0600
     * @tc.desc   Verify testProducerConsumerCoord0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProducerConsumerCoord0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        for (let i = 0; i < 10; i++) {
          await pcb.produce(i)
        }
        const result: boolean = await pcb.tryProduce(999)
        expect(result).assertFalse()
        expect(await pcb.size()).assertEqual(10)
      } catch (error) {
        console.error("testProducerConsumerCoord0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testProducerConsumerCoord0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PRODUCERCONSUMERCOORD_TEST_0700
     * @tc.desc   Verify testProducerConsumerCoord0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testProducerConsumerCoord0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await pcb.produce(100)
        const item: number | undefined = await pcb.tryConsume()
        expect(item === 100).assertTrue()
        expect(await pcb.size()).assertEqual(0)
      } catch (error) {
        console.error("testProducerConsumerCoord0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testProducerConsumerCoord0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PRODUCERCONSUMERCOORD_TEST_0800
     * @tc.desc   Verify testProducerConsumerCoord0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProducerConsumerCoord0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const item: number | undefined = await pcb.tryConsume()
        expect(item === undefined).assertTrue()
      } catch (error) {
        console.error("testProducerConsumerCoord0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testProducerConsumerCoord0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PRODUCERCONSUMERCOORD_TEST_0900
     * @tc.desc   Verify testProducerConsumerCoord0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testProducerConsumerCoord0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(produceValue, i * 10))
        }
        const results = await Promise.all(tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t)))
        for (let i = 0; i < results.length; i++) {
          const val: number = results[i] as number
          await pcb.produce(val)
        }
        expect(await pcb.getProducedTotal()).assertEqual(5)
      } catch (error) {
        console.error("testProducerConsumerCoord0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testProducerConsumerCoord1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PRODUCERCONSUMERCOORD_TEST_1000
     * @tc.desc   Verify testProducerConsumerCoord1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testProducerConsumerCoord1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const receivedData: string[] = []
        const task: taskpool.Task = new taskpool.Task(notifyProducer)
        task.onReceiveData((data: Object): void => {
          receivedData.push(data as string)
        })
        await taskpool.execute(task)
        const sweepStart: number = Date.now()
        while (!(receivedData.length >= 3) && Date.now() - sweepStart < 10000) {
          await Utils.sleep(100)
        }
        expect(receivedData.length).assertEqual(3)
      } catch (error) {
        console.error("testProducerConsumerCoord1000 failed");
        expect(false).assertFail();
      }
      done();
    })

  })
}
