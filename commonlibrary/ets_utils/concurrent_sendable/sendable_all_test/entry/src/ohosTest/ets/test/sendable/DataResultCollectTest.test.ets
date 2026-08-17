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

export default function DataResultCollectTest(): void {
  describe('DataResultCollectTest', (): void => {
    let collector: DataResultCollector

    beforeEach((): void => {
      collector = new DataResultCollector(new collections.Array<string>(), new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testDataResultCollect0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_0100
     * @tc.desc   Verify testDataResultCollect0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataResultCollect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await collector.addResult(1, 'result_1')
        expect(collector.getResultCount()).assertEqual(1)
      } catch (error) {
        console.error("testDataResultCollect0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_0200
     * @tc.desc   Verify testDataResultCollect0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataResultCollect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await collector.addResult(1, 'result_1')
        await collector.addResult(2, 'result_2')
        expect(collector.getResultCount()).assertEqual(2)
      } catch (error) {
        console.error("testDataResultCollect0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_0300
     * @tc.desc   Verify testDataResultCollect0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataResultCollect0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await collector.addResult(1, 'test_data')
        const result: string = collector.getResultByIndex(0)
        expect(result).assertEqual('test_data')
      } catch (error) {
        console.error("testDataResultCollect0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_0400
     * @tc.desc   Verify testDataResultCollect0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDataResultCollect0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
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
      } catch (error) {
        console.error("testDataResultCollect0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_0500
     * @tc.desc   Verify testDataResultCollect0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDataResultCollect0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
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
      } catch (error) {
        console.error("testDataResultCollect0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_0600
     * @tc.desc   Verify testDataResultCollect0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDataResultCollect0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
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
      } catch (error) {
        console.error("testDataResultCollect0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_0700
     * @tc.desc   Verify testDataResultCollect0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDataResultCollect0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
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
      } catch (error) {
        console.error("testDataResultCollect0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_0800
     * @tc.desc   Verify testDataResultCollect0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataResultCollect0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(processData, 1, 'test')
        const result: Object = await taskpool.execute(task)
        await collector.addResult(1, result as string)
        expect(collector.getResultCount()).assertEqual(1)
        const res: string = collector.getResultByIndex(0)
        expect(res).assertContain('processed_test_1')
      } catch (error) {
        console.error("testDataResultCollect0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_0900
     * @tc.desc   Verify testDataResultCollect0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataResultCollect0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (error) {
        console.error("testDataResultCollect0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_1000
     * @tc.desc   Verify testDataResultCollect1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDataResultCollect1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
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
      } catch (error) {
        console.error("testDataResultCollect1000 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_1100
     * @tc.desc   Verify testDataResultCollect1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataResultCollect1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        for (let i = 0; i < 5; i++) {
          await collector.addResult(i, `sequential_${i}`)
        }
        const results: collections.Array<string> = collector.getResults()
        for (let i = 0; i < 5; i++) {
          expect(results[i]).assertEqual(`sequential_${i}`)
        }
      } catch (error) {
        console.error("testDataResultCollect1100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataResultCollect1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATARESULTCOLLECT_TEST_1200
     * @tc.desc   Verify testDataResultCollect1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataResultCollect1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await collector.addResult(1, 'result_1')
        await collector.addResult(2, 'result_2')
        await collector.addResult(3, 'result_3')
        const taskIds: collections.Array<number> = collector.getTaskIds()
        expect(taskIds.length).assertEqual(3)
        expect(taskIds[0]).assertEqual(1)
        expect(taskIds[1]).assertEqual(2)
        expect(taskIds[2]).assertEqual(3)
      } catch (error) {
        console.error("testDataResultCollect1200 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
