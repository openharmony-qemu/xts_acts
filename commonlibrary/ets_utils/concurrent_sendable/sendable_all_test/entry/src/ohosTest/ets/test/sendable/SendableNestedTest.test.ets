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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils } from '@kit.ArkTS'
import { NestedSharedCounter } from '../../workers/Sendable'
import Utils from '../utils'

@Concurrent
function triggerSendDataTask(): void {
  taskpool.Task.sendData('trigger')
}

@Concurrent
async function nestedIncrementTask(counter: NestedSharedCounter, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  const result: number = await lock.lockAsync((): number => {
    counter.count_++
    return counter.count_
  })
  return result
}

@Concurrent
function outerSuccessTask(): number {
  return 42
}

@Concurrent
function outerErrorTask(): number {
  throw new Error('outer error')
}

export default function SendableNestedTest(): void {
  describe('SendableNestedTest', (): void => {
    /**
     * @tc.name   testSendableNested0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_NESTED_TEST_0100
     * @tc.desc   Verify onReceiveData callback creates nested Sendable task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableNested0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const counter = new NestedSharedCounter()
        const task = new taskpool.Task(triggerSendDataTask)
        let nestedResult: number = -1
        task.onReceiveData((): void => {
          const innerTask = new taskpool.Task(nestedIncrementTask, counter, new ArkTSUtils.locks.AsyncLock())
          const nestedExecFn: () => Promise<void> = async (): Promise<void> => {
            try {
              const value: Object = await taskpool.execute(innerTask)
              nestedResult = value as number
            } catch (error) {
              console.error("testSendableNested0100 failed")
              expect(false).assertFail()
            }
          }
          nestedExecFn()
        })
        await taskpool.execute(task)
        const nestedStart: number = Date.now()
        while (nestedResult < 1 && Date.now() - nestedStart < 10000) {
          await Utils.sleep(10)
        }
        expect(counter.count_).assertEqual(1)
      } catch (error) {
        console.error("testSendableNested0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableNested0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_NESTED_TEST_0200
     * @tc.desc   Verify onExecutionSucceeded callback creates nested Sendable task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableNested0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const counter = new NestedSharedCounter()
        const task = new taskpool.Task(outerSuccessTask)
        let nestedResult: number = -1
        task.onExecutionSucceeded((): void => {
          const innerTask = new taskpool.Task(nestedIncrementTask, counter, new ArkTSUtils.locks.AsyncLock())
          const nestedExecFn: () => Promise<void> = async (): Promise<void> => {
            try {
              const result: Object = await taskpool.execute(innerTask)
              nestedResult = result as number
            } catch (error) {
              console.error("testSendableNested0200 failed")
              expect(false).assertFail()
            }
          }
          nestedExecFn()
        })
        await taskpool.execute(task)
        const nestedStart: number = Date.now()
        while (nestedResult < 1 && Date.now() - nestedStart < 10000) {
          await Utils.sleep(10)
        }
        expect(counter.count_).assertEqual(1)
      } catch (error) {
        console.error("testSendableNested0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableNested0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_NESTED_TEST_0300
     * @tc.desc   Verify onExecutionFailed callback creates nested Sendable task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableNested0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const counter = new NestedSharedCounter()
        const task = new taskpool.Task(outerErrorTask)
        let nestedResult: number = -1
        task.onExecutionFailed((e: Error): void => {
          console.info(`parent task failed as expected: ${e.message}`)
          const innerTask = new taskpool.Task(nestedIncrementTask, counter, new ArkTSUtils.locks.AsyncLock())
          const nestedExecFn: () => Promise<void> = async (): Promise<void> => {
            try {
              const value: Object = await taskpool.execute(innerTask)
              nestedResult = value as number
            } catch (error) {
              console.error("testSendableNested0300 failed")
              expect(false).assertFail()
            }
          }
          nestedExecFn()
        })
        let caught: boolean = false
        try {
          await taskpool.execute(task)
        } catch (e) {
          caught = true
          const err: Error = e
          expect(err.message).assertContain('outer error')
        }
        const nestedStart: number = Date.now()
        while (nestedResult < 1 && Date.now() - nestedStart < 10000) {
          await Utils.sleep(10)
        }
        // Failure may arrive via reject and/or onExecutionFailed; nested task proves the error path ran.
        expect(caught || nestedResult >= 1).assertTrue()
        expect(counter.count_).assertEqual(1)
      } catch (error) {
        console.error("testSendableNested0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableNested0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_NESTED_TEST_0400
     * @tc.desc   Verify onReceiveData callback creates multiple sequential nested tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableNested0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const counter = new NestedSharedCounter()
        const lock = new ArkTSUtils.locks.AsyncLock()
        const task = new taskpool.Task(triggerSendDataTask)
        let completedCount: number = 0
        task.onReceiveData((): void => {
          for (let i = 0; i < 5; i++) {
            const innerTask = new taskpool.Task(nestedIncrementTask, counter, lock)
            const nestedExecFn: () => Promise<void> = async (): Promise<void> => {
              try {
                await taskpool.execute(innerTask)
                completedCount++
              } catch (error) {
                console.error("testSendableNested0400 failed")
                expect(false).assertFail()
              }
            }
            nestedExecFn()
          }
        })
        await taskpool.execute(task)
        const sweepStart: number = Date.now()
        while (!(completedCount >= 5) && Date.now() - sweepStart < 10000) {
          await Utils.sleep(100)
        }
        expect(counter.count_).assertEqual(5)
      } catch (error) {
        console.error("testSendableNested0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableNested0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_NESTED_TEST_0500
     * @tc.desc   Verify onReceiveData callback creates 3 concurrent nested tasks with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableNested0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const counter = new NestedSharedCounter()
        const lock = new ArkTSUtils.locks.AsyncLock()
        const nestedPromises: Promise<number>[] = []
        const task = new taskpool.Task(triggerSendDataTask)
        const receivePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
          task.onReceiveData((data: Object): void => {
            if (data === null || data === undefined) {
              console.info('onReceiveData received empty data')
              return
            }
            for (let i = 0; i < 3; i++) {
              const innerTask = new taskpool.Task(nestedIncrementTask, counter, lock)
              nestedPromises.push(taskpool.execute(innerTask) as Promise<number>)
            }
            resolve()
          })
        })
        await taskpool.execute(task)
        await receivePromise
        await Promise.all(nestedPromises)
        expect(counter.count_).assertEqual(3)
      } catch (error) {
        console.error("testSendableNested0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableNested0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_NESTED_TEST_0600
     * @tc.desc   Verify onReceiveData callback creates 10 concurrent nested tasks with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableNested0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const counter = new NestedSharedCounter()
        const lock = new ArkTSUtils.locks.AsyncLock()
        const nestedPromises: Promise<number>[] = []
        const task = new taskpool.Task(triggerSendDataTask)
        const receivePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
          task.onReceiveData((data: Object): void => {
            if (data === null || data === undefined) {
              console.info('onReceiveData received empty data')
              return
            }
            for (let i = 0; i < 10; i++) {
              const innerTask = new taskpool.Task(nestedIncrementTask, counter, lock)
              nestedPromises.push(taskpool.execute(innerTask) as Promise<number>)
            }
            resolve()
          })
        })
        await taskpool.execute(task)
        await receivePromise
        await Promise.all(nestedPromises)
        expect(counter.count_).assertEqual(10)
      } catch (error) {
        console.error("testSendableNested0600 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
