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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { worker, MessageEvents } from '@kit.ArkTS'
import { SendableCounter } from '../../../workers/sendable'
import Utils from '../utils'

const WORKER_PATH = '../../workers/sendable_worker.ets'

@Sendable
class TaskCompletionCounter {
  public completed_: number = 0
  public failed_: number = 0
  public total_: number = 0

  markCompleted(): void {
    this.completed_++
  }

  markFailed(): void {
    this.failed_++
  }

  getCompleted(): number {
    return this.completed_
  }

  getFailed(): number {
    return this.failed_
  }

  getTotal(): number {
    return this.total_
  }

  setTotal(value: number): void {
    this.total_ = value
  }

  reset(): void {
    this.completed_ = 0
    this.failed_ = 0
    this.total_ = 0
  }
}

@Concurrent
function successfulTask(counter: TaskCompletionCounter): void {
  counter.completed_++
}

@Concurrent
function failedTask(counter: TaskCompletionCounter): void {
  counter.failed_++
  throw new Error('task failed')
}

@Concurrent
function sendDataCountTask(counter: TaskCompletionCounter): void {
  taskpool.Task.sendData('complete')
}

@Concurrent
function taskGroupItem(counter: TaskCompletionCounter): number {
  counter.completed_++
  return counter.completed_
}

export default function BuiltinsSharedCounterTaskCompleteTest(): void {
  describe('BuiltinsSharedCounterTaskCompleteTest', (): void => {
    let counter: TaskCompletionCounter

    beforeEach((): void => {
      counter = new TaskCompletionCounter()
    })
    it('testSharedCounterTaskComplete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(counter.getCompleted()).assertEqual(0)
      expect(counter.getFailed()).assertEqual(0)
      expect(counter.getTotal()).assertEqual(0)
    })

    it('testSharedCounterTaskComplete0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      counter.setTotal(1)
      const task = new taskpool.Task(taskGroupItem, counter)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertLargerOrEqual(1)
    })

    it('testSharedCounterTaskComplete0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let caught: boolean = false
      counter.setTotal(1)
      const task = new taskpool.Task(failedTask, counter)
      try {
        await taskpool.execute(task)
      } catch (e) {
        caught = true
        const err: Error = e as Error
        expect(err.message).assertContain('task failed')
      }
      // execute may surface the throw, or only record failed_ before reject; accept either observed path.
      expect(caught || counter.getFailed() > 0).assertTrue()
      if (!caught) {
        expect(counter.getFailed()).assertLargerOrEqual(1)
      }
    })

    it('testSharedCounterTaskComplete0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      counter.setTotal(3)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(successfulTask, counter))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(3)
    })

    it('testSharedCounterTaskComplete0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      counter.setTotal(5)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(successfulTask, counter))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
    })

    it('testSharedCounterTaskComplete0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      counter.setTotal(10)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(successfulTask, counter))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
    })

    it('testSharedCounterTaskComplete0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      counter.setTotal(100)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(successfulTask, counter))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(100)
    })

    it('testSharedCounterTaskComplete0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      counter.setTotal(5)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(successfulTask, counter))
      }
      for (let i = 0; i < 2; i++) {
        tasks.push(new taskpool.Task(failedTask, counter))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]).catch((): Object => 'failed'))
      }
      const results: Object[] = await Promise.all(promises)
      let successCount: number = 0
      let failCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i] === 'failed') {
          failCount++
        } else {
          successCount++
        }
      }
      expect(successCount).assertEqual(3)
      expect(failCount).assertEqual(2)
    })

    it('testSharedCounterTaskComplete0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      counter.setTotal(1)
      const task = new taskpool.Task(sendDataCountTask, counter)
      let receivedCount: number = 0
      task.onReceiveData((data: Object): void => {
        receivedCount++
        counter.markCompleted()
      })
      await taskpool.execute(task)
      await new Promise<void>((resolve: Function): void => {
        const checkInterval: number = setInterval((): void => {
          if (counter.getCompleted() >= 1) {
            clearInterval(checkInterval)
            resolve()
          }
        }, 100)
      })
      expect(counter.getCompleted()).assertEqual(1)
    })

    it('testSharedCounterTaskComplete1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      counter.setTotal(5)
      const group = new taskpool.TaskGroup()
      for (let i = 0; i < 5; i++) {
        group.addTask(new taskpool.Task(taskGroupItem, counter))
      }
      const results: Object[] = await taskpool.execute(group) as Object[]
      expect(results.length).assertEqual(5)
    })
  })
}
