import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
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

export default function BuiltinsProducerConsumerCoordTest(): void {
  describe('BuiltinsProducerConsumerCoordTest', (): void => {
    let pcb: ProducerConsumerBuffer

    beforeAll((): void => {})
    beforeEach((): void => {
      pcb = new ProducerConsumerBuffer(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable(), new ArkTSUtils.locks.ConditionVariable())
    })
    afterEach((): void => {})
    afterAll((): void => {})

    it('BuiltinsProducerConsumerCoordTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pcb.produce(100)
      const item: number = await pcb.consume()
      expect(item).assertEqual(100)
      expect(await pcb.size()).assertEqual(0)
    })

    it('BuiltinsProducerConsumerCoordTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 5; i++) {
        await pcb.produce(i * 10)
      }
      const items: number[] = []
      for (let i = 0; i < 5; i++) {
        items.push(await pcb.consume())
      }
      expect(items.length).assertEqual(5)
      expect(await pcb.size()).assertEqual(0)
    })

    it('BuiltinsProducerConsumerCoordTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const producePromises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        producePromises.push(pcb.produce(i))
      }
      await Promise.all(producePromises)
      for (let i = 0; i < 5; i++) {
        await pcb.consume()
      }
      expect(await pcb.size()).assertEqual(0)
    })


    it('BuiltinsProducerConsumerCoordTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let consumeCompleted: boolean = false
      let consumeResult: number | undefined = undefined
      const consumePromise: Promise<number> = pcb.consume()
      consumePromise.then((result: number): void => {
        consumeResult = result
        consumeCompleted = true
      })
      await Utils.sleep(500)
      expect(consumeCompleted).assertFalse()
      await pcb.produce(42)
      await consumePromise
      expect(consumeCompleted).assertTrue()
      expect(consumeResult).assertEqual(42)
    })

    it('BuiltinsProducerConsumerCoordTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = await pcb.tryProduce(100)
      expect(result).assertTrue()
      expect(await pcb.size()).assertEqual(1)
    })

    it('BuiltinsProducerConsumerCoordTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 10; i++) {
        await pcb.produce(i)
      }
      const result: boolean = await pcb.tryProduce(999)
      expect(result).assertFalse()
      expect(await pcb.size()).assertEqual(10)
    })

    it('BuiltinsProducerConsumerCoordTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await pcb.produce(100)
      const item: number | undefined = await pcb.tryConsume()
      expect(item === 100).assertTrue()
      expect(await pcb.size()).assertEqual(0)
    })

    it('BuiltinsProducerConsumerCoordTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const item: number | undefined = await pcb.tryConsume()
      expect(item === undefined).assertTrue()
    })

    it('BuiltinsProducerConsumerCoordTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
    })

    it('BuiltinsProducerConsumerCoordTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const receivedData: string[] = []
      const task: taskpool.Task = new taskpool.Task(notifyProducer)
      task.onReceiveData((data: Object): void => {
        receivedData.push(data as string)
      })
      await taskpool.execute(task)
      await new Promise<void>((resolve: Function): void => {
        const checkInterval: Object = setInterval((): void => {
          if (receivedData.length >= 3) {
            clearInterval(checkInterval as number)
            resolve()
          }
        }, 10)
      })
      expect(receivedData.length).assertEqual(3)
    })

  })
}
