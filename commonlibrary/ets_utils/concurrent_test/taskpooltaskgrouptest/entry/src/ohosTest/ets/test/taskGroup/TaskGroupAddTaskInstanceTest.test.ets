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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import taskpool from '@ohos.taskpool';
import { ArkTSUtils } from '@kit.ArkTS';
import { sleep } from '../../testability/pages/Utils';
import { AddTaskInstanceNestedCounter, addTaskInstanceNestedInnerFunc } from './TaskGroupAddTaskInstanceTestInner';

@Concurrent
function addTaskInstanceBasicFunc(): number {
  return 1
}

@Concurrent
function addTaskInstanceArgsFunc(a: number, b: number): number {
  return a + b
}

@Concurrent
async function addTaskInstanceAsyncFunc(): Promise<number> {
  return 100
}

@Sendable
class AddTaskInstanceSharedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function addTaskInstanceCounterFunc(counter: AddTaskInstanceSharedCounter): Promise<number> {
  let observed: number = 0
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    observed = counter.count
    return observed
  })
  return observed
}

@Concurrent
function addTaskInstanceValueFunc(value: number): number {
  return value
}

@Concurrent
function addTaskInstanceSendDataFunc(value: number): number {
  taskpool.Task.sendData(value * 10)
  return value
}

@Concurrent
function addTaskInstanceThrowFunc(): number {
  throw new Error('task error')
}

@Concurrent
function addTaskInstanceNestedGroupTaskFunc(counter: AddTaskInstanceNestedCounter): number {
  let innerGroup = new taskpool.TaskGroup()
  let innerTask = new taskpool.Task(addTaskInstanceNestedInnerFunc, counter)
  innerGroup.addTask(innerTask)
  taskpool.execute(innerGroup)
  return 9
}

export default function TaskGroupAddTaskInstanceTest(): void {
  describe('TaskGroupAddTaskInstanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest0100
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_0100
     * @tc.desc   Verify addTask(Task) with basic Task instance returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      let taskItem = new taskpool.Task(addTaskInstanceBasicFunc)
      group.addTask(taskItem)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(1)
      } catch (error) {
        console.error('TaskGroupAddTaskInstanceTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest0200
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_0200
     * @tc.desc   Verify addTask(Task) with Task carrying arguments returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      let taskItem = new taskpool.Task(addTaskInstanceArgsFunc, 10, 20)
      group.addTask(taskItem)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(30)
      } catch (error) {
        console.error('TaskGroupAddTaskInstanceTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest0300
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_0300
     * @tc.desc   Verify addTask(Task) with named Task instance returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      let taskItem = new taskpool.Task('myTask', addTaskInstanceBasicFunc)
      group.addTask(taskItem)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(1)
      } catch (error) {
        console.error('TaskGroupAddTaskInstanceTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest0400
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_0400
     * @tc.desc   Verify addTask(Task) with async Task instance succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskInstanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      let taskItem = new taskpool.Task(addTaskInstanceAsyncFunc)
      group.addTask(taskItem)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(100)
      } catch (error) {
        console.error('TaskGroupAddTaskInstanceTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest0500
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_0500
     * @tc.desc   Verify addTask(Task) void return side effect: the added Task instance executes in the group and returns the correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      let taskItem = new taskpool.Task(addTaskInstanceValueFunc, 7)
      group.addTask(taskItem)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(7)
      } catch (error) {
        console.error('TaskGroupAddTaskInstanceTest0500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest0600
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_0600
     * @tc.desc   Verify addTask(Task) after execute throws error 401 (runtime arbitration: measured parameter error 401, not 10200014)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      let taskItem = new taskpool.Task(addTaskInstanceBasicFunc)
      group.addTask(taskItem)
      try {
        await taskpool.execute(group)
      } catch (error) {
        console.error('TaskGroupAddTaskInstanceTest0600 failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      try {
        let task2 = new taskpool.Task(addTaskInstanceBasicFunc)
        group.addTask(task2)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest0700
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_0700
     * @tc.desc   Verify addTask same Task to two TaskGroups throws error 401 (runtime arbitration: measured parameter error 401, not 10200051)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group1 = new taskpool.TaskGroup()
      let group2 = new taskpool.TaskGroup()
      let taskItem = new taskpool.Task(addTaskInstanceBasicFunc)
      group1.addTask(taskItem)
      let caught: boolean = false
      try {
        group2.addTask(taskItem)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest0800
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_0800
     * @tc.desc   Verify addTask multiple Task instances in group execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskInstanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      let task1 = new taskpool.Task(addTaskInstanceValueFunc, 1)
      let task2 = new taskpool.Task(addTaskInstanceValueFunc, 2)
      let task3 = new taskpool.Task(addTaskInstanceValueFunc, 3)
      group.addTask(task1)
      group.addTask(task2)
      group.addTask(task3)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(3)
        expect(results[0] as number).assertEqual(1)
        expect(results[1] as number).assertEqual(2)
        expect(results[2] as number).assertEqual(3)
      } catch (error) {
        console.error('TaskGroupAddTaskInstanceTest0800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest0900
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_0900
     * @tc.desc   Verify Promise.all with two TaskGroups each having addTask(Task)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskInstanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let group1 = new taskpool.TaskGroup()
        group1.addTask(new taskpool.Task(addTaskInstanceValueFunc, 1))
        let group2 = new taskpool.TaskGroup()
        group2.addTask(new taskpool.Task(addTaskInstanceValueFunc, 2))
        let p1 = taskpool.execute(group1)
        let p2 = taskpool.execute(group2)
        let allResults = await Promise.all([p1, p2])
        expect(allResults.length).assertEqual(2)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest0900 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest1000
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_1000
     * @tc.desc   Verify addTask(Task) with @Sendable shared counter using count variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskInstanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new AddTaskInstanceSharedCounter()
        let group = new taskpool.TaskGroup()
        let taskItem = new taskpool.Task(addTaskInstanceCounterFunc, counter)
        group.addTask(taskItem)
        await taskpool.execute(group)
        expect(counter.count).assertEqual(1)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest1000 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest1100
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_1100
     * @tc.desc   Verify small concurrency 3 TaskGroups with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskInstanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new AddTaskInstanceSharedCounter()
        let g0 = new taskpool.TaskGroup()
        g0.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g1 = new taskpool.TaskGroup()
        g1.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g2 = new taskpool.TaskGroup()
        g2.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let p0 = taskpool.execute(g0)
        let p1 = taskpool.execute(g1)
        let p2 = taskpool.execute(g2)
        let results = await Promise.all([p0, p1, p2])
        expect(results.length).assertEqual(3)
        let observedValues: number[] = []
        for (let i = 0; i < results.length; i++) {
          observedValues.push((results[i] as number[])[0])
        }
        observedValues.sort((a: number, b: number): number => {
          return a - b
        })
        for (let i = 0; i < observedValues.length; i++) {
          expect(observedValues[i]).assertEqual(i + 1)
        }
        expect(counter.count).assertEqual(3)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest1100 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest1200
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_1200
     * @tc.desc   Verify small concurrency 5 TaskGroups with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskInstanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new AddTaskInstanceSharedCounter()
        let g0 = new taskpool.TaskGroup()
        g0.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g1 = new taskpool.TaskGroup()
        g1.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g2 = new taskpool.TaskGroup()
        g2.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g3 = new taskpool.TaskGroup()
        g3.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g4 = new taskpool.TaskGroup()
        g4.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let p0 = taskpool.execute(g0)
        let p1 = taskpool.execute(g1)
        let p2 = taskpool.execute(g2)
        let p3 = taskpool.execute(g3)
        let p4 = taskpool.execute(g4)
        let results = await Promise.all([p0, p1, p2, p3, p4])
        expect(results.length).assertEqual(5)
        let observedValues: number[] = []
        for (let i = 0; i < results.length; i++) {
          observedValues.push((results[i] as number[])[0])
        }
        observedValues.sort((a: number, b: number): number => {
          return a - b
        })
        for (let i = 0; i < observedValues.length; i++) {
          expect(observedValues[i]).assertEqual(i + 1)
        }
        expect(counter.count).assertEqual(5)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest1200 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest1300
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_1300
     * @tc.desc   Verify small concurrency 10 TaskGroups with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskInstanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new AddTaskInstanceSharedCounter()
        let g0 = new taskpool.TaskGroup()
        g0.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g1 = new taskpool.TaskGroup()
        g1.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g2 = new taskpool.TaskGroup()
        g2.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g3 = new taskpool.TaskGroup()
        g3.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g4 = new taskpool.TaskGroup()
        g4.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g5 = new taskpool.TaskGroup()
        g5.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g6 = new taskpool.TaskGroup()
        g6.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g7 = new taskpool.TaskGroup()
        g7.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g8 = new taskpool.TaskGroup()
        g8.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let g9 = new taskpool.TaskGroup()
        g9.addTask(new taskpool.Task(addTaskInstanceCounterFunc, counter))
        let p0 = taskpool.execute(g0)
        let p1 = taskpool.execute(g1)
        let p2 = taskpool.execute(g2)
        let p3 = taskpool.execute(g3)
        let p4 = taskpool.execute(g4)
        let p5 = taskpool.execute(g5)
        let p6 = taskpool.execute(g6)
        let p7 = taskpool.execute(g7)
        let p8 = taskpool.execute(g8)
        let p9 = taskpool.execute(g9)
        let results = await Promise.all([p0, p1, p2, p3, p4, p5, p6, p7, p8, p9])
        expect(results.length).assertEqual(10)
        let observedValues: number[] = []
        for (let i = 0; i < results.length; i++) {
          observedValues.push((results[i] as number[])[0])
        }
        observedValues.sort((a: number, b: number): number => {
          return a - b
        })
        for (let i = 0; i < observedValues.length; i++) {
          expect(observedValues[i]).assertEqual(i + 1)
        }
        expect(counter.count).assertEqual(10)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest1300 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest1400
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_1400
     * @tc.desc   Verify addTask(Task with onReceiveData) callback receives data after execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskInstanceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let group = new taskpool.TaskGroup()
        let receivedData: number = 0
        let taskItem = new taskpool.Task(addTaskInstanceSendDataFunc, 5)
        taskItem.onReceiveData((data: number): void => {
          receivedData = data
        })
        group.addTask(taskItem)
        let results = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(5)
        let waitCount: number = 0
        while (receivedData !== 50 && waitCount < 50) {
          await sleep(100)
          waitCount++
        }
        expect(receivedData).assertEqual(50)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest1400 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest1500
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_1500
     * @tc.desc   Verify addTask(executed Task) throws error 401 (runtime arbitration: measured parameter error 401, not 10200057)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskItem = new taskpool.Task(addTaskInstanceBasicFunc)
      try {
        await taskpool.execute(taskItem)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest1500 failed");
        expect(false).assertFail();
      }
      let group = new taskpool.TaskGroup()
      let caught: boolean = false
      try {
        group.addTask(taskItem)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest1600
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_1600
     * @tc.desc   Verify addTask(Task with dependency) is rejected for dependent task (runtime arbitration: actual error code 401, not design 10200052; supplementary evidence for Task_addDependency#016)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task1 = new taskpool.Task(addTaskInstanceBasicFunc)
      let task2 = new taskpool.Task(addTaskInstanceBasicFunc)
      task2.addDependency(task1)
      let group = new taskpool.TaskGroup()
      let caught: boolean = false
      try {
        group.addTask(task2)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest1700
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_1700
     * @tc.desc   Verify addTask(Task from SequenceRunner) throws error 401 (runtime arbitration: measured parameter error 401, not 10200051)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let runner = new taskpool.SequenceRunner()
      let taskItem = new taskpool.Task(addTaskInstanceBasicFunc)
      runner.execute(taskItem)
      let group = new taskpool.TaskGroup()
      let caught: boolean = false
      try {
        group.addTask(taskItem)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest1800
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_1800
     * @tc.desc   Verify addTask(Task that throws) group execute fails with error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskInstanceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      let taskItem = new taskpool.Task(addTaskInstanceThrowFunc)
      group.addTask(taskItem)
      let caught: boolean = false
      try {
        await taskpool.execute(group)
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      done()
    })

    // ========== Parameter Validation Negative Tests ==========

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest1900
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_1900
     * @tc.desc   Verify addTask with non-Task types (number/string/object) each throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup()
      let numVal: Object = 123
      let threwNum = false
      try {
        group.addTask(numVal as taskpool.Task)
      } catch (error) {
        threwNum = true
        expect(error.code).assertEqual(401)
      }
      expect(threwNum).assertTrue()
      let strVal: Object = 'notATask'
      let threwStr = false
      try {
        group.addTask(strVal as taskpool.Task)
      } catch (error) {
        threwStr = true
        expect(error.code).assertEqual(401)
      }
      expect(threwStr).assertTrue()
      let objVal: Object = new Object()
      let threwObj = false
      try {
        group.addTask(objVal as taskpool.Task)
      } catch (error) {
        threwObj = true
        expect(error.code).assertEqual(401)
      }
      expect(threwObj).assertTrue()
    })

    // ========== Restricted Combination Tests ==========

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest2000
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_2000
     * @tc.desc   Verify addTask(LongTask) throws error 401 (runtime arbitration: measured parameter error 401, not 10200057)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup()
      let longTask = new taskpool.LongTask(addTaskInstanceBasicFunc)
      let threw = false
      try {
        group.addTask(longTask)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest2100
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_2100
     * @tc.desc   Verify addTask(periodic task) throws error 10200051
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup()
      let taskItem = new taskpool.Task(addTaskInstanceBasicFunc)
      taskpool.executePeriodically(200, taskItem)
      let threw = false
      try {
        group.addTask(taskItem)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(10200051)
      }
      expect(threw).assertTrue()
      try {
        taskpool.cancel(taskItem)
      } catch (e) {
        console.info(`TaskGroupAddTaskInstanceTest2200 cancel catch: ${JSON.stringify(e)}`)
      }
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest2200
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_2200
     * @tc.desc   Verify addTask(AsyncRunner task) throws error 10200057
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup()
      let runner = new taskpool.AsyncRunner(2)
      let taskItem = new taskpool.Task(addTaskInstanceBasicFunc)
      runner.execute(taskItem)
      let threw = false
      try {
        group.addTask(taskItem)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(10200057)
      }
      expect(threw).assertTrue()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest2300
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_2300
     * @tc.desc   Verify addTask(GenericsTask instance) succeeds and group execute returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      let genericsTask: taskpool.Task = new taskpool.GenericsTask<[], number>(addTaskInstanceBasicFunc)
      group.addTask(genericsTask)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(1)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest2400 failed");
        expect(false).assertFail();
      }
      done()
    })

    // ========== NESTING: addTask(Task) inside task function body / callbacks ==========

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest2400
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_2400
     * @tc.desc   Verify @Concurrent function body creates Group, addTask(Task) and executes, shared counter equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter = new AddTaskInstanceNestedCounter()
      let result: Object = new Object()
      try {
        result = await taskpool.execute(addTaskInstanceNestedGroupTaskFunc, counter)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest2500 failed");
        expect(false).assertFail();
      }
      expect(result as number).assertEqual(9)
      let waited: number = 0
      while (counter.count < 1 && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest2500
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_2500
     * @tc.desc   Verify onExecutionSucceeded callback nests Group addTask(Task) and execute, inner result correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let outerTask = new taskpool.Task(addTaskInstanceBasicFunc)
      let innerPromise: Promise<Object> | null = null
      const onSucc: () => void = (): void => {
        let innerGroup = new taskpool.TaskGroup()
        let innerTask = new taskpool.Task(addTaskInstanceValueFunc, 21)
        innerGroup.addTask(innerTask)
        innerPromise = taskpool.execute(innerGroup)
      }
      outerTask.onExecutionSucceeded(onSucc)
      try {
        await taskpool.execute(outerTask)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest2600 failed");
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
          expect((innerResults as number[])[0]).assertEqual(21)
        }
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest2600 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest2600
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_2600
     * @tc.desc   Verify onReceiveData callback nests Group addTask(Task) and execute with correct data accumulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let innerResult: number = 0
      let task = new taskpool.Task(addTaskInstanceSendDataFunc, 5)
      task.onReceiveData((data: number): void => {
        receivedData = data
        let innerGroup = new taskpool.TaskGroup()
        let innerTask = new taskpool.Task(addTaskInstanceValueFunc, 11)
        innerGroup.addTask(innerTask)
        taskpool.execute(innerGroup).then((res: Object): void => {
          innerResult = (res as number[])[0]
        }, (e: Object): void => {
          console.info('TaskGroupAddTaskInstanceTest2600 catch: ' + String(e))
        })
      })
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest2700 failed");
        expect(false).assertFail();
      }
      let waited: number = 0
      while ((receivedData !== 50 || innerResult !== 11) && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(receivedData).assertEqual(50)
      expect(innerResult).assertEqual(11)
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest2700
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_2700
     * @tc.desc   Verify execute(group).then nests addTask(Task) to a new Group and executes with accumulated result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let thenRan: boolean = false
      let innerPromise: Promise<Object> | null = null
      let outerGroup = new taskpool.TaskGroup()
      outerGroup.addTask(new taskpool.Task(addTaskInstanceBasicFunc))
      taskpool.execute(outerGroup).then((res: Object): void => {
        thenRan = true
        let innerGroup = new taskpool.TaskGroup()
        innerGroup.addTask(new taskpool.Task(addTaskInstanceValueFunc, 21))
        innerPromise = taskpool.execute(innerGroup)
      }, (e: Object): void => {
        console.info('TaskGroupAddTaskInstanceTest2700 catch: ' + String(e))
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
          expect((innerResults as number[])[0]).assertEqual(21)
        }
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest2800 failed");
        expect(false).assertFail();
      }
      done()
    })

    // ========== Stress: massive Task additions ==========

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest2800
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_2800
     * @tc.desc   Verify adding 1000 Task instances to one TaskGroup succeeds and executes with
     *            full result count (scale reduced from 10000 which exceeds the 15s per-case
     *            budget; runtime arbitration 2026-09-06)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      for (let i = 0; i < 1000; i++) {
        group.addTask(new taskpool.Task(addTaskInstanceValueFunc, 1))
      }
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(1000)
      } catch (error) {
        console.error("TaskGroupAddTaskInstanceTest2900 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskInstanceTest2900
     * @tc.number SUB_TASKGROUP_ADDTASKINSTANCE_TEST_2900
     * @tc.desc   Verify addTask(null as taskpool.Task) on the addTask(Task) overload throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskInstanceTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup()
      let threw = false
      try {
        group.addTask(null!)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
    })
  })
}
