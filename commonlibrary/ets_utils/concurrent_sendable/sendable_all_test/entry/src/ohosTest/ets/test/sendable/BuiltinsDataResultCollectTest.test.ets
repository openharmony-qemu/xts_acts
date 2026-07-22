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
import { collections, ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class DataResultCollector {
  public results_: collections.Array<string>

  public taskIds_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(results_: collections.Array<string>, taskIds_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.results_ = results_
    this.taskIds_ = taskIds_
    this.lock_ = lock_
  }


  async addResult(taskId: number, result: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.taskIds_.push(taskId)
      this.results_.push(result)
    })
  }

  getResultCount(): number {
    return this.results_.length
  }

  getResults(): collections.Array<string> {
    return this.results_
  }

  getTaskIds(): collections.Array<number> {
    return this.taskIds_
  }

  getResultByIndex(index: number): string {
    if (index >= 0 && index < this.results_.length) {
      return this.results_[index]
    }
    return ''
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.results_.length > 0) { this.results_.pop() }
      while (this.taskIds_.length > 0) { this.taskIds_.pop() }
    })
  }
}

@Concurrent
function processData(taskId: number, data: string): string {
  return `processed_${data}_${taskId}`
}

@Concurrent
function triggerNestedData(): void {
  taskpool.Task.sendData('trigger')
}

export default function BuiltinsDataResultCollectTest(): void {
  describe('BuiltinsDataResultCollectTest', (): void => {
    let collector: DataResultCollector

    beforeAll((): void => {})
    beforeEach((): void => {
      collector = new DataResultCollector(new collections.Array<string>(), new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
    })
    afterEach((): void => {})
    afterAll((): void => {})

    it('testDataResultCollect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addResult(1, 'result_1')
      expect(collector.getResultCount()).assertEqual(1)
    })

    it('testDataResultCollect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addResult(1, 'result_1')
      await collector.addResult(2, 'result_2')
      expect(collector.getResultCount()).assertEqual(2)
    })

    it('testDataResultCollect0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addResult(1, 'test_data')
      const result: string = collector.getResultByIndex(0)
      expect(result).assertEqual('test_data')
    })

    it('testDataResultCollect0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(processData, i, `data_${i}`))
      }
      const p1 = taskpool.execute(tasks[0])
      const p2 = taskpool.execute(tasks[1])
      const p3 = taskpool.execute(tasks[2])
      const results: Object[] = await Promise.all([p1, p2, p3])
      for (let i = 0; i < results.length; i++) {
        await collector.addResult(i, results[i] as string)
      }
      expect(collector.getResultCount()).assertEqual(3)
    })

    it('testDataResultCollect0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(processData, i, `data_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.addResult(i, results[i] as string)
      }
      const res: collections.Array<string> = collector.getResults()
      const taskIds: collections.Array<number> = collector.getTaskIds()
      expect(res.length).assertEqual(10)
      expect(taskIds.length).assertEqual(10)
    })

    it('testDataResultCollect0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(processData, i, `data_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.addResult(i, results[i] as string)
      }
      expect(collector.getResultCount()).assertEqual(5)
    })

    it('testDataResultCollect0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 50; i++) {
        tasks.push(new taskpool.Task(processData, i, `data_${i}`))
      }
      const batchSize: number = 25
      for (let batch = 0; batch < Math.ceil(50 / batchSize); batch++) {
        const batchTasks: taskpool.Task[] = tasks.slice(batch * batchSize, (batch + 1) * batchSize)
        const promises: Promise<Object>[] = []
        for (let i = 0; i < batchTasks.length; i++) {
          promises.push(taskpool.execute(batchTasks[i]))
        }
        const results: Object[] = await Promise.all(promises)
        for (let i = 0; i < results.length; i++) {
          const idx: number = batch * batchSize + i
          await collector.addResult(idx, results[i] as string)
        }
      }
      expect(collector.getResultCount()).assertEqual(50)
    })

    it('testDataResultCollect0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const task = new taskpool.Task(processData, 1, 'test')
      const result: Object = await taskpool.execute(task)
      await collector.addResult(1, result as string)
      expect(collector.getResultCount()).assertEqual(1)
      const res: string = collector.getResultByIndex(0)
      expect(res).assertContain('processed_test_1')
    })

    it('testDataResultCollect0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const receivedData: string[] = []
      const task = new taskpool.Task(triggerNestedData)
      const receivePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
        task.onReceiveData((data: string): void => {
          receivedData.push(data)
          resolve()
        })
      })
      await taskpool.execute(task)
      await receivePromise
      expect(receivedData.length).assertEqual(1)
      expect(receivedData[0]).assertEqual('trigger')
    })

    it('testDataResultCollect1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const nestedPromises: Promise<Object>[] = []
      const task = new taskpool.Task(triggerNestedData)
      const receivePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
        task.onReceiveData((): void => {
          for (let i = 0; i < 3; i++) {
            const nestedTask = new taskpool.Task(processData, i, `nested_${i}`)
            nestedPromises.push(taskpool.execute(nestedTask))
          }
          resolve()
        })
      })
      await taskpool.execute(task)
      await receivePromise
      const nestedResults: Object[] = await Promise.all(nestedPromises)
      for (let i = 0; i < nestedResults.length; i++) {
        await collector.addResult(i, nestedResults[i] as string)
      }
      expect(collector.getResultCount()).assertEqual(3)
    })

    it('testDataResultCollect1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 5; i++) {
        await collector.addResult(i, `sequential_${i}`)
      }
      const results: collections.Array<string> = collector.getResults()
      for (let i = 0; i < 5; i++) {
        expect(results[i]).assertEqual(`sequential_${i}`)
      }
    })

    it('testDataResultCollect1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await collector.addResult(1, 'result_1')
      await collector.addResult(2, 'result_2')
      await collector.addResult(3, 'result_3')
      const taskIds: collections.Array<number> = collector.getTaskIds()
      expect(taskIds.length).assertEqual(3)
      expect(taskIds[0]).assertEqual(1)
      expect(taskIds[1]).assertEqual(2)
      expect(taskIds[2]).assertEqual(3)
    })
  })
}
