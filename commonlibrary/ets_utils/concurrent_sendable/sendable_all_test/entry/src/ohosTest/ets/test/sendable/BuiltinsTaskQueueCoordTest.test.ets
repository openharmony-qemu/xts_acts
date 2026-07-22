import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class TaskItem {
  public id_: number = 0
  public name_: string = ''
  public priority_: number = 0
}

@Sendable
class TaskQueue {
  public queue_: collections.Array<TaskItem>

  public capacity_: number = 20
  public lock_: ArkTSUtils.locks.AsyncLock

  public notEmpty_: ArkTSUtils.locks.ConditionVariable

  public notFull_: ArkTSUtils.locks.ConditionVariable

  constructor(queue_: collections.Array<TaskItem>, lock_: ArkTSUtils.locks.AsyncLock, notEmpty_: ArkTSUtils.locks.ConditionVariable, notFull_: ArkTSUtils.locks.ConditionVariable) {
    this.queue_ = queue_
    this.lock_ = lock_
    this.notEmpty_ = notEmpty_
    this.notFull_ = notFull_
  }

  public enqueueCount_: number = 0
  public dequeueCount_: number = 0

  async enqueue(task: TaskItem): Promise<void> {
    while (true) {
      const canEnqueue: boolean = await this.lock_.lockAsync((): boolean => {
        if (this.queue_.length < this.capacity_) {
          this.queue_.push(task)
          this.enqueueCount_++
          return true
        }
        return false
      })
      if (canEnqueue) {
        this.notEmpty_.notifyAll()
        return
      }
      await this.notFull_.waitFor(500)
    }
  }

  async dequeue(): Promise<TaskItem> {
    while (true) {
      const result: TaskItem | undefined = await this.lock_.lockAsync((): TaskItem | undefined => {
        if (this.queue_.length > 0) {
          const task: TaskItem = this.queue_[0]
          this.queue_.splice(0, 1)
          this.dequeueCount_++
          return task
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

  async tryEnqueue(task: TaskItem): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (this.queue_.length >= this.capacity_) {
        return false
      }
      this.queue_.push(task)
      this.enqueueCount_++
      return true
    })
  }

  async tryDequeue(): Promise<TaskItem | undefined> {
    return await this.lock_.lockAsync((): TaskItem | undefined => {
      if (this.queue_.length === 0) {
        return undefined
      }
      const task: TaskItem = this.queue_[0]
      this.queue_.splice(0, 1)
      this.dequeueCount_++
      return task
    })
  }

  async size(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.queue_.length)
  }

  async isEmpty(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.queue_.length === 0)
  }

  async isFull(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.queue_.length >= this.capacity_)
  }

  async peek(): Promise<TaskItem | undefined> {
    return await this.lock_.lockAsync((): TaskItem | undefined => {
      return this.queue_.length > 0 ? this.queue_[0] : undefined
    })
  }

  async clear(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const count: number = this.queue_.length
      while (this.queue_.length > 0) { this.queue_.pop() }
      return count
    })
  }

  async getEnqueueCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.enqueueCount_)
  }

  async getDequeueCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.dequeueCount_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.queue_.length > 0) { this.queue_.pop() }
      this.enqueueCount_ = 0
      this.dequeueCount_ = 0
    })
  }
}

function createTask(id: number, name: string, priority: number): TaskItem {
  const task: TaskItem = new TaskItem()
  task.id_ = id
  task.name_ = name
  task.priority_ = priority
  return task
}

@Concurrent
function enqueueValue(taskId: number): number {
  return taskId
}

@Concurrent
function dequeueValue(): number {
  return -1
}

@Concurrent
function notifyTask(): void {
  taskpool.Task.sendData({ action: 'start', taskId: 0 })
  taskpool.Task.sendData({ action: 'process', taskId: 1 })
  taskpool.Task.sendData({ action: 'complete', taskId: 2 })
}

export default function BuiltinsTaskQueueCoordTest(): void {
  describe('BuiltinsTaskQueueCoordTest', (): void => {
    let queue: TaskQueue

    beforeAll((): void => {})
    beforeEach((): void => {
      queue = new TaskQueue(new collections.Array<TaskItem>(), new ArkTSUtils.locks.AsyncLock(), new ArkTSUtils.locks.ConditionVariable(), new ArkTSUtils.locks.ConditionVariable())
    })
    afterEach((): void => {})
    afterAll((): void => {})

    it('BuiltinsTaskQueueCoordTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const task: TaskItem = createTask(1, 'task_1', 0)
      await queue.enqueue(task)
      expect(await queue.size()).assertEqual(1)
    })

    it('BuiltinsTaskQueueCoordTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const task: TaskItem = createTask(1, 'task_1', 0)
      await queue.enqueue(task)
      const dequeued: TaskItem = await queue.dequeue()
      expect(dequeued.id_).assertEqual(1)
      expect(await queue.size()).assertEqual(0)
    })

    it('BuiltinsTaskQueueCoordTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      for (let i = 0; i < 5; i++) {
        await queue.enqueue(createTask(i, `task_${i}`, 0))
      }
      expect(await queue.size()).assertEqual(5)
    })

    it('BuiltinsTaskQueueCoordTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 10; i++) {
        await queue.enqueue(createTask(i, `task_${i}`, 0))
      }
      const cleared: number = await queue.clear()
      expect(cleared).assertEqual(10)
      expect(await queue.size()).assertEqual(0)
    })

    it('BuiltinsTaskQueueCoordTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let dequeueCompleted: boolean = false
      const dequeuePromise: Promise<TaskItem> = queue.dequeue()
      dequeuePromise.then((): void => {
        dequeueCompleted = true
      })
      await Utils.sleep(500)
      expect(dequeueCompleted).assertFalse()
      await queue.enqueue(createTask(1, 'task_1', 0))
      await dequeuePromise
      expect(dequeueCompleted).assertTrue()
    })

    it('BuiltinsTaskQueueCoordTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 20; i++) {
        await queue.enqueue(createTask(i, `task_${i}`, 0))
      }
      expect(await queue.isFull()).assertTrue()
      let enqueueCompleted: boolean = false
      const enqueuePromise: Promise<void> = queue.enqueue(createTask(999, 'task_999', 0))
      enqueuePromise.then((): void => {
        enqueueCompleted = true
      })
      await Utils.sleep(500)
      expect(enqueueCompleted).assertFalse()
      await queue.dequeue()
      await enqueuePromise
      expect(enqueueCompleted).assertTrue()
    })

    it('BuiltinsTaskQueueCoordTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const dequeuePromise: Promise<TaskItem> = queue.dequeue()
      await Utils.sleep(500)
      await queue.enqueue(createTask(42, 'task_42', 0))
      const task: TaskItem = await dequeuePromise
      expect(task.id_).assertEqual(42)
    })

    it('BuiltinsTaskQueueCoordTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 20; i++) {
        await queue.enqueue(createTask(i, `task_${i}`, 0))
      }
      const enqueuePromise: Promise<void> = queue.enqueue(createTask(999, 'task_999', 0))
      await Utils.sleep(500)
      await queue.dequeue()
      await enqueuePromise
      expect(await queue.size()).assertEqual(20)
    })

    it('BuiltinsTaskQueueCoordTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = await queue.tryEnqueue(createTask(1, 'task_1', 0))
      expect(result).assertTrue()
      expect(await queue.size()).assertEqual(1)
    })

    it('BuiltinsTaskQueueCoordTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 20; i++) {
        await queue.enqueue(createTask(i, `task_${i}`, 0))
      }
      const result: boolean = await queue.tryEnqueue(createTask(999, 'task_999', 0))
      expect(result).assertFalse()
    })

    it('BuiltinsTaskQueueCoordTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await queue.enqueue(createTask(1, 'task_1', 0))
      const task: TaskItem | undefined = await queue.tryDequeue()
      expect(task !== undefined).assertTrue()
      expect(task!.id_).assertEqual(1)
    })

    it('BuiltinsTaskQueueCoordTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const task: TaskItem | undefined = await queue.tryDequeue()
      expect(task === undefined).assertTrue()
    })

    it('BuiltinsTaskQueueCoordTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(enqueueValue, i))
      }
      const results = await Promise.all(tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t)))
      for (let i = 0; i < results.length; i++) {
        const val: number = results[i] as number
        await queue.enqueue(createTask(val, `task_${val}`, 0))
      }
      expect(await queue.getEnqueueCount()).assertEqual(10)
    })

    it('BuiltinsTaskQueueCoordTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 15; i++) {
        await queue.enqueue(createTask(i, `task_${i}`, 0))
      }
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(dequeueValue))
      }
      await Promise.all(tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t)))
      for (let i = 0; i < 5; i++) {
        await queue.dequeue()
      }
      expect(await queue.getDequeueCount()).assertLargerOrEqual(5)
    })

    it('BuiltinsTaskQueueCoordTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await queue.enqueue(createTask(1, 'task_1', 0))
      await queue.enqueue(createTask(2, 'task_2', 0))
      const task: TaskItem | undefined = await queue.peek()
      expect(task !== undefined).assertTrue()
      expect(task!.id_).assertEqual(1)
      expect(await queue.size()).assertEqual(2)
    })

    it('BuiltinsTaskQueueCoordTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(await queue.isEmpty()).assertTrue()
      expect(await queue.isFull()).assertFalse()
      for (let i = 0; i < 20; i++) {
        await queue.enqueue(createTask(i, `task_${i}`, 0))
      }
      expect(await queue.isEmpty()).assertFalse()
      expect(await queue.isFull()).assertTrue()
    })

    it('BuiltinsTaskQueueCoordTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notifications: Object[] = []
      const task: taskpool.Task = new taskpool.Task(notifyTask)
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
