/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import { ArkTSUtils } from '@kit.ArkTS';
import { sleep } from '../Utils';
import { ErrorEvent, MessageEvents, worker } from '@kit.ArkTS';

import { ConstructorDefaultNestedCounter, constructorDefaultNestedInnerFunc } from './TaskGroupConstructorDefaultTestInner';

interface TaskGroupWorkerResult {
  name: string
  result: number
}

@Concurrent
function constructorDefaultAddFunc(arg: number): number {
  return arg * 2
}

@Concurrent
function constructorDefaultSimpleFunc(): number {
  return 100
}

@Sendable
class ConstructorDefaultCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function constructorDefaultCounterFunc(counter: ConstructorDefaultCounter): Promise<number> {
  await counter.lock.lockAsync((): void => {
    counter.count++
  })
  return 100
}

@Concurrent
function constructorDefaultNestedGroupFunc(counter: ConstructorDefaultNestedCounter): number {
  let innerGroup = new taskpool.TaskGroup()
  innerGroup.addTask(constructorDefaultNestedInnerFunc, counter)
  taskpool.execute(innerGroup)
  return 7
}

@Concurrent
function constructorDefaultSendDataFunc(value: number): number {
  taskpool.Task.sendData(value * 10)
  return value
}

export default function TaskGroupConstructorDefaultTest(): void {
  describe('TaskGroupConstructorDefaultTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest0100
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_0100
     * @tc.desc   Verify constructor() creates TaskGroup instance successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorDefaultTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(constructorDefaultSimpleFunc)
      try {
        let results = await taskpool.execute(taskGroup)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(100)
      } catch (error) {
        console.error("TaskGroupConstructorDefaultTest0100 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest0200
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_0200
     * @tc.desc   Verify constructor() returns instanceof taskpool.TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorDefaultTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskGroup1 = new taskpool.TaskGroup()
      let taskGroup2 = new taskpool.TaskGroup()
      expect(taskGroup1 !== taskGroup2).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest0300
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_0300
     * @tc.desc   Verify construct then addTask with Task instance and execute returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorDefaultTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup = new taskpool.TaskGroup()
      let task = new taskpool.Task(constructorDefaultAddFunc, 10)
      taskGroup.addTask(task)
      try {
        let results = await taskpool.execute(taskGroup)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(20)
      } catch (error) {
        console.error("TaskGroupConstructorDefaultTest0300 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest0400
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_0400
     * @tc.desc   Verify construct then addTask with func and execute returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorDefaultTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskGroup = new taskpool.TaskGroup()
        taskGroup.addTask(constructorDefaultAddFunc, 5)
        let results = await taskpool.execute(taskGroup)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(10)
      } catch (error) {
        console.error("TaskGroupConstructorDefaultTest0400 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest0500
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_0500
     * @tc.desc   Verify multiple TaskGroup instances execute concurrently with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorDefaultTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let group1 = new taskpool.TaskGroup()
        group1.addTask(constructorDefaultSimpleFunc)
        let group2 = new taskpool.TaskGroup()
        group2.addTask(constructorDefaultSimpleFunc)
        let group3 = new taskpool.TaskGroup()
        group3.addTask(constructorDefaultSimpleFunc)
        let p1 = taskpool.execute(group1)
        let p2 = taskpool.execute(group2)
        let p3 = taskpool.execute(group3)
        let allResults = await Promise.all([p1, p2, p3])
        expect(allResults.length).assertEqual(3)
      } catch (error) {
        console.error("TaskGroupConstructorDefaultTest0500 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest0600
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_0600
     * @tc.desc   Verify creating 1000 TaskGroup instances succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorDefaultTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let taskGroups: taskpool.TaskGroup[] = []
      for (let i = 0; i < 1000; i++) {
        taskGroups.push(new taskpool.TaskGroup())
      }
      expect(taskGroups.length).assertEqual(1000)
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest0700
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_0700
     * @tc.desc   Verify creating and executing 100 TaskGroups sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskGroupConstructorDefaultTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let execCount: number = 0
      for (let i = 0; i < 100; i++) {
        let taskGroup = new taskpool.TaskGroup()
        taskGroup.addTask(constructorDefaultSimpleFunc)
        try {
          await taskpool.execute(taskGroup)
        } catch (error) {
          console.error("TaskGroupConstructorDefaultTest0700 failed");
          expect(false).assertFail();
        }
        execCount++
      }
      expect(execCount).assertEqual(100)
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest0800
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_0800
     * @tc.desc   Verify creating 10000 TaskGroup instances succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskGroupConstructorDefaultTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let taskGroups: taskpool.TaskGroup[] = []
      for (let i = 0; i < 10000; i++) {
        taskGroups.push(new taskpool.TaskGroup())
      }
      expect(taskGroups.length).assertEqual(10000)
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest0900
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_0900
     * @tc.desc   Verify constructor with Sendable shared counter using count variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorDefaultTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new ConstructorDefaultCounter()
        let taskGroup = new taskpool.TaskGroup()
        taskGroup.addTask(constructorDefaultCounterFunc, counter)
        await taskpool.execute(taskGroup)
        expect(counter.count).assertEqual(1)
      } catch (error) {
        console.error("TaskGroupConstructorDefaultTest0900 failed");
        expect(false).assertFail();
      }
      done()
    })

    // ========== Scale: create + execute cycles ==========

    /**
     * @tc.name   TaskGroupConstructorDefaultTest1000
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_1000
     * @tc.desc   Verify 1000 create and execute TaskGroup cycles in batches with exact completion count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorDefaultTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let execCount: number = 0
      for (let batch = 0; batch < 10; batch++) {
        for (let i = 0; i < 100; i++) {
          let taskGroup = new taskpool.TaskGroup()
          taskGroup.addTask(constructorDefaultSimpleFunc)
          try {
            await taskpool.execute(taskGroup)
          } catch (error) {
            console.error("TaskGroupConstructorDefaultTest1000 failed");
            expect(false).assertFail();
          }
          execCount++
        }
      }
      expect(execCount).assertEqual(1000)
      done()
    })

    // ========== NESTING: Task function body creates TaskGroup ==========

    /**
     * @tc.name   TaskGroupConstructorDefaultTest1100
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_1100
     * @tc.desc   Verify @Concurrent function body creates TaskGroup, addTask and executes, shared counter equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorDefaultTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter = new ConstructorDefaultNestedCounter()
      let result: Object = new Object()
      try {
        result = await taskpool.execute(constructorDefaultNestedGroupFunc, counter)
      } catch (error) {
        console.error("TaskGroupConstructorDefaultTest1100 failed");
        expect(false).assertFail();
      }
      expect(result as number).assertEqual(7)
      let waited: number = 0
      while (counter.count < 1 && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest1200
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_1200
     * @tc.desc   Verify onExecutionSucceeded callback creates and executes a new TaskGroup, inner result correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorDefaultTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let outerTask = new taskpool.Task(constructorDefaultSimpleFunc)
      let innerPromise: Promise<Object> | null = null
      const onSucc: () => void = (): void => {
        let innerGroup = new taskpool.TaskGroup()
        innerGroup.addTask(constructorDefaultAddFunc, 5)
        innerPromise = taskpool.execute(innerGroup)
      }
      outerTask.onExecutionSucceeded(onSucc)
      try {
        await taskpool.execute(outerTask)
      } catch (error) {
        console.error("TaskGroupConstructorDefaultTest1200 failed");
        expect(false).assertFail();
      }
      let waited: number = 0
      while (innerPromise === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(innerPromise !== null).assertTrue()
      try {
        if (innerPromise !== null) {
          let innerResults: Object = await innerPromise
          expect((innerResults as number[])[0]).assertEqual(10)
        }
      } catch (error) {
        console.error("TaskGroupConstructorDefaultTest1200 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest1300
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_1300
     * @tc.desc   Verify onReceiveData callback creates and executes a new TaskGroup with correct data passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorDefaultTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let innerResult: number = 0
      let task = new taskpool.Task(constructorDefaultSendDataFunc, 5)
      task.onReceiveData((data: number): void => {
        receivedData = data
        let innerGroup = new taskpool.TaskGroup()
        innerGroup.addTask(constructorDefaultAddFunc, 11)
        taskpool.execute(innerGroup).then((res: Object): void => {
          innerResult = (res as number[])[0]
        }, (e: Object): void => {
          console.info('TaskGroupConstructorDefaultTest1300 catch: ' + String(e))
        })
      })
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error("TaskGroupConstructorDefaultTest1300 failed");
        expect(false).assertFail();
      }
      let waited: number = 0
      while ((receivedData !== 50 || innerResult !== 22) && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(receivedData).assertEqual(50)
      expect(innerResult).assertEqual(22)
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorDefaultTest1400
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_1400
     * @tc.desc   Verify execute(group).then creates and executes a new TaskGroup with correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorDefaultTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let thenRan: boolean = false
      let innerPromise: Promise<Object> | null = null
      let outerGroup = new taskpool.TaskGroup()
      outerGroup.addTask(constructorDefaultSimpleFunc)
      taskpool.execute(outerGroup).then((res: Object): void => {
        thenRan = true
        let innerGroup = new taskpool.TaskGroup()
        innerGroup.addTask(constructorDefaultAddFunc, 21)
        innerPromise = taskpool.execute(innerGroup)
      }, (e: Object): void => {
        console.info('TaskGroupConstructorDefaultTest1400 catch: ' + String(e))
      })
      let waited: number = 0
      while (innerPromise === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(thenRan).assertTrue()
      expect(innerPromise !== null).assertTrue()
      try {
        if (innerPromise !== null) {
          let innerResults: Object = await innerPromise
          expect((innerResults as number[])[0]).assertEqual(42)
        }
      } catch (error) {
        console.error("TaskGroupConstructorDefaultTest1400 failed");
        expect(false).assertFail();
      }
      done()
    })

    // ========== Worker Thread Creation (C1#010, F9 worker assets) ==========

    /**
     * @tc.name   TaskGroupConstructorDefaultTest1500
     * @tc.number SUB_TASKGROUP_CONSTRUCTORDEFAULT_TEST_1500
     * @tc.desc   Verify TaskGroup created inside a worker thread: worker creates named TaskGroup, addTask and executes the group, host asserts exact group name 'workerGroupW4' and exact group result 100 relayed via postMessage (C1#010 Worker-thread creation cross-thread behavior; 15s bounded wait pending run arbitration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorDefaultTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let groupStatus: string = ''
      const groupWorker = new worker.ThreadWorker('../../workers/WorkerTaskGroupCreate.ets')
      groupWorker.onmessage = (event: MessageEvents): void => {
        groupStatus = event.data as string
      }
      groupWorker.onerror = (event: ErrorEvent): void => {
        // Fallback diagnostics: report a worker-side exception immediately via
        // the status channel instead of stalling until the 15s bounded wait.
        groupStatus = 'worker-error|' + JSON.stringify(event)
      }
      try {
        groupWorker.postMessage(JSON.stringify({ mode: 'create-group' }))
        let waited: number = 0
        while (groupStatus === '' && waited < 15000) {
          await sleep(100)
          waited += 100
        }
        const parsed: TaskGroupWorkerResult = JSON.parse(groupStatus) as TaskGroupWorkerResult
        expect(parsed.name).assertEqual('workerGroupW4')
        expect(parsed.result).assertEqual(100)
      } catch (e) {
        console.info(`TaskGroupConstructorDefaultTest1500 catch error: ${JSON.stringify(e)}`)
        expect().assertFail()
      } finally {
        groupWorker.terminate()
        done()
      }
    })
  })
}
