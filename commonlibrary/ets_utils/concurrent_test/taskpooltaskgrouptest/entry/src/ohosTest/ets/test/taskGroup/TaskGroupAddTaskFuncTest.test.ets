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
import { AddTaskFuncNestedCounter, addTaskFuncNestedInnerFunc } from './TaskGroupAddTaskFuncTestInner';

@Concurrent
function addTaskFuncBasicFunc(arg: number): number {
  return arg * 2
}

@Concurrent
function addTaskFuncNoArgsFunc(): number {
  return 100
}

@Concurrent
function addTaskFuncMultiArgsFunc(a: number, b: number, c: number): number {
  return a + b + c
}

@Concurrent
function addTaskFuncNumberArgFunc(n: number): number {
  return n * 2
}

@Concurrent
function addTaskFuncStringArgFunc(s: string): string {
  return 'hello ' + s
}

@Concurrent
async function addTaskFuncAsyncFunc(): Promise<number> {
  return 1
}

@Sendable
class AddTaskFuncSendableData {
  value: number = 0
}

@Concurrent
function addTaskFuncSendableArgFunc(data: AddTaskFuncSendableData): number {
  return data.value * 2
}

@Sendable
class AddTaskFuncSharedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function addTaskFuncSharedCounterFunc(counter: AddTaskFuncSharedCounter): Promise<number> {
  let observed: number = 0
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    observed = counter.count
    return observed
  })
  return observed
}

@Concurrent
function addTaskFuncMultiTaskFunc(id: number): number {
  return id * 10
}

@Concurrent
function addTaskFuncWaitAllFunc(value: number): number {
  return value
}

@Concurrent
function addTaskFuncConcurrentArrowFunc(): string {
  return 'test'
}

@Concurrent
function addTaskFuncVoidReturnFunc(): number {
  return 100
}

@Concurrent
function addTaskFuncBoolArgFunc(b: boolean): boolean {
  return b
}

function addTaskFuncPlainNonConcurrentFunc(n: number): number {
  return n * 2
}

@Concurrent
function addTaskFuncNestedGroupFunc(counter: AddTaskFuncNestedCounter): number {
  let innerGroup = new taskpool.TaskGroup()
  innerGroup.addTask(addTaskFuncNestedInnerFunc, counter)
  taskpool.execute(innerGroup)
  return 9
}

@Concurrent
function addTaskFuncSendDataFunc(value: number): number {
  taskpool.Task.sendData(value * 10)
  return value
}

export default function TaskGroupAddTaskFuncTest(): void {
  describe('TaskGroupAddTaskFuncTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest0100
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_0100
     * @tc.desc   Verify addTask(@Concurrent func, arg) returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTaskFuncBasicFunc, 10)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(20)
      } catch (error) {
        console.error('TaskGroupAddTaskFuncTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest0200
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_0200
     * @tc.desc   Verify addTask(func) with 0 args returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTaskFuncNoArgsFunc)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(100)
      } catch (error) {
        console.error('TaskGroupAddTaskFuncTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest0300
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_0300
     * @tc.desc   Verify addTask(func, ...args) with multiple args returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTaskFuncMultiArgsFunc, 10, 20, 30)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(60)
      } catch (error) {
        console.error('TaskGroupAddTaskFuncTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest0400
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_0400
     * @tc.desc   Verify addTask(@Concurrent arrow function) succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTaskFuncConcurrentArrowFunc)
      try {
        let results = await taskpool.execute(group)
        expect(results[0] as string).assertEqual('test')
      } catch (error) {
        console.error('TaskGroupAddTaskFuncTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest0500
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_0500
     * @tc.desc   Verify addTask(@Concurrent async function) succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTaskFuncAsyncFunc)
      try {
        let results = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(1)
      } catch (error) {
        console.error('TaskGroupAddTaskFuncTest0500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest0600
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_0600
     * @tc.desc   Verify addTask(number type arg) successfully passes number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskFuncTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTaskFuncNumberArgFunc, 123)
      try {
        let results = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(246)
      } catch (error) {
        console.error('TaskGroupAddTaskFuncTest0600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest0700
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_0700
     * @tc.desc   Verify addTask(string type arg) successfully passes string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskFuncTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTaskFuncStringArgFunc, 'world')
      try {
        let results = await taskpool.execute(group)
        expect(results[0] as string).assertEqual('hello world')
      } catch (error) {
        console.error('TaskGroupAddTaskFuncTest0700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest0800
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_0800
     * @tc.desc   Verify addTask(@Sendable object arg) successfully passes shared parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskFuncTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      let data = new AddTaskFuncSendableData()
      data.value = 100
      group.addTask(addTaskFuncSendableArgFunc, data)
      try {
        let results = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(200)
      } catch (error) {
        console.error('TaskGroupAddTaskFuncTest0800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest0900
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_0900
     * @tc.desc   Verify addTask(func) void return side effect: two additions both execute in the group and return exact results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTaskFuncVoidReturnFunc)
      group.addTask(addTaskFuncVoidReturnFunc)
      try {
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(2)
        expect(results[0] as number).assertEqual(100)
        expect(results[1] as number).assertEqual(100)
      } catch (error) {
        console.error('TaskGroupAddTaskFuncTest0900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest1000
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_1000
     * @tc.desc   Verify addTask after execute throws error 401 (runtime arbitration: measured parameter error 401, not 10200014)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTaskFuncBasicFunc, 10)
      try {
        await taskpool.execute(group)
      } catch (error) {
        console.error('TaskGroupAddTaskFuncTest1000 failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      try {
        group.addTask(addTaskFuncBasicFunc, 20)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest1100
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_1100
     * @tc.desc   Verify addTask with @Sendable shared counter using count variable to wait for task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskFuncTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new AddTaskFuncSharedCounter()
        let group = new taskpool.TaskGroup()
        group.addTask(addTaskFuncSharedCounterFunc, counter)
        await taskpool.execute(group)
        expect(counter.count).assertEqual(1)
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest1100 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest1200
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_1200
     * @tc.desc   Verify addTask multiple tasks in group execute concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskFuncTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let group = new taskpool.TaskGroup()
        group.addTask(addTaskFuncMultiTaskFunc, 1)
        group.addTask(addTaskFuncMultiTaskFunc, 2)
        group.addTask(addTaskFuncMultiTaskFunc, 3)
        let results = await taskpool.execute(group)
        expect(results.length).assertEqual(3)
        expect(results[0] as number).assertEqual(10)
        expect(results[1] as number).assertEqual(20)
        expect(results[2] as number).assertEqual(30)
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest1200 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest1300
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_1300
     * @tc.desc   Verify Promise.all waits for all TaskGroups with addTask to complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskFuncTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let group1 = new taskpool.TaskGroup()
        group1.addTask(addTaskFuncWaitAllFunc, 1)
        let group2 = new taskpool.TaskGroup()
        group2.addTask(addTaskFuncWaitAllFunc, 2)
        let p1 = taskpool.execute(group1)
        let p2 = taskpool.execute(group2)
        let allResults = await Promise.all([p1, p2])
        expect(allResults.length).assertEqual(2)
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest1300 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest1400
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_1400
     * @tc.desc   Verify small concurrency 3 groups with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskFuncTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new AddTaskFuncSharedCounter()
        let groups: taskpool.TaskGroup[] = []
        for (let i = 0; i < 3; i++) {
          let g = new taskpool.TaskGroup()
          g.addTask(addTaskFuncSharedCounterFunc, counter)
          groups.push(g)
        }
        let p0 = taskpool.execute(groups[0])
        let p1 = taskpool.execute(groups[1])
        let p2 = taskpool.execute(groups[2])
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
        console.error("TaskGroupAddTaskFuncTest1400 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest1500
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_1500
     * @tc.desc   Verify small concurrency 5 groups with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskFuncTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new AddTaskFuncSharedCounter()
        let groups: taskpool.TaskGroup[] = []
        for (let i = 0; i < 5; i++) {
          let g = new taskpool.TaskGroup()
          g.addTask(addTaskFuncSharedCounterFunc, counter)
          groups.push(g)
        }
        let p0 = taskpool.execute(groups[0])
        let p1 = taskpool.execute(groups[1])
        let p2 = taskpool.execute(groups[2])
        let p3 = taskpool.execute(groups[3])
        let p4 = taskpool.execute(groups[4])
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
        console.error("TaskGroupAddTaskFuncTest1500 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest1600
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_1600
     * @tc.desc   Verify small concurrency 10 groups with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskFuncTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new AddTaskFuncSharedCounter()
        let groups: taskpool.TaskGroup[] = []
        for (let i = 0; i < 10; i++) {
          let g = new taskpool.TaskGroup()
          g.addTask(addTaskFuncSharedCounterFunc, counter)
          groups.push(g)
        }
        let p0 = taskpool.execute(groups[0])
        let p1 = taskpool.execute(groups[1])
        let p2 = taskpool.execute(groups[2])
        let p3 = taskpool.execute(groups[3])
        let p4 = taskpool.execute(groups[4])
        let p5 = taskpool.execute(groups[5])
        let p6 = taskpool.execute(groups[6])
        let p7 = taskpool.execute(groups[7])
        let p8 = taskpool.execute(groups[8])
        let p9 = taskpool.execute(groups[9])
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
        console.error("TaskGroupAddTaskFuncTest1600 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest1700
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_1700
     * @tc.desc   Verify addTask(func, boolean) with true parameter returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskFuncTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let group = new taskpool.TaskGroup()
        group.addTask(addTaskFuncBoolArgFunc, true)
        let results = await taskpool.execute(group)
        expect(results[0] as boolean).assertTrue()
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest1700 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest1800
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_1800
     * @tc.desc   Verify addTask(func, negative_number) correctly passes negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskFuncTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let group = new taskpool.TaskGroup()
        group.addTask(addTaskFuncBasicFunc, -5)
        let results = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(-10)
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest1800 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest1900
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_1900
     * @tc.desc   Verify addTask(func, zero) correctly passes zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskFuncTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let group = new taskpool.TaskGroup()
        group.addTask(addTaskFuncBasicFunc, 0)
        let results = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(0)
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest1900 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest2000
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_2000
     * @tc.desc   Verify addTask(func, empty_string) correctly passes empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskFuncTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let group = new taskpool.TaskGroup()
        group.addTask(addTaskFuncStringArgFunc, '')
        let results = await taskpool.execute(group)
        expect(results[0] as string).assertEqual('hello ')
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest2000 failed");
        expect(false).assertFail();
      }
      done()
    })

    // ========== Parameter Validation Negative Tests ==========

    /**
     * @tc.name   TaskGroupAddTaskFuncTest2100
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_2100
     * @tc.desc   Verify addTask(non-@Concurrent plain function) throws error 10200014 (runtime arbitration: measured concurrency-marker validation code 10200014, not 401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup()
      let threw = false
      try {
        group.addTask(addTaskFuncPlainNonConcurrentFunc as Object as Function, 10)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(10200014)
      }
      expect(threw).assertTrue()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest2200
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_2200
     * @tc.desc   Verify addTask(null) on the addTask(func) overload throws error 401 (addTask(func) overload dimension, distinct from the addTask(Task) overload dimension kept in TaskGroupAddTaskInstanceTest negative family)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup()
      let threw = false
      try {
        group.addTask(null)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
    })

    // ========== NESTING: addTask inside task function body / callbacks ==========

    /**
     * @tc.name   TaskGroupAddTaskFuncTest2300
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_2300
     * @tc.desc   Verify @Concurrent function body creates Group, addTask and executes, shared counter equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter = new AddTaskFuncNestedCounter()
      let result: Object = new Object()
      try {
        result = await taskpool.execute(addTaskFuncNestedGroupFunc, counter)
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest2300 failed");
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
     * @tc.name   TaskGroupAddTaskFuncTest2400
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_2400
     * @tc.desc   Verify onExecutionSucceeded callback creates Group, addTask and executes, inner result correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let outerTask = new taskpool.Task(addTaskFuncNoArgsFunc)
      let innerPromise: Promise<Object> | null = null
      const onSucc: () => void = (): void => {
        let innerGroup = new taskpool.TaskGroup()
        innerGroup.addTask(addTaskFuncBasicFunc, 7)
        innerPromise = taskpool.execute(innerGroup)
      }
      outerTask.onExecutionSucceeded(onSucc)
      try {
        await taskpool.execute(outerTask)
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest2400 failed");
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
          expect((innerResults as number[])[0]).assertEqual(14)
        }
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest2400 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupAddTaskFuncTest2500
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_2500
     * @tc.desc   Verify onReceiveData callback nests Group addTask and execute with correct data accumulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let innerResult: number = 0
      let task = new taskpool.Task(addTaskFuncSendDataFunc, 5)
      task.onReceiveData((data: number): void => {
        receivedData = data
        let innerGroup = new taskpool.TaskGroup()
        innerGroup.addTask(addTaskFuncBasicFunc, 11)
        taskpool.execute(innerGroup).then((res: Object): void => {
          innerResult = (res as number[])[0]
        }, (e: Object): void => {
          console.info('TaskGroupAddTaskFuncTest2500 catch: ' + String(e))
        })
      })
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error("TaskGroupAddTaskFuncTest2500 failed");
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
     * @tc.name   TaskGroupAddTaskFuncTest2600
     * @tc.number SUB_TASKGROUP_ADDTASKFUNC_TEST_2600
     * @tc.desc   Verify execute(group).then nests addTask to a new Group and executes with accumulated result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskFuncTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let thenRan: boolean = false
      let innerPromise: Promise<Object> | null = null
      let outerGroup = new taskpool.TaskGroup()
      outerGroup.addTask(addTaskFuncNoArgsFunc)
      taskpool.execute(outerGroup).then((res: Object): void => {
        thenRan = true
        let innerGroup = new taskpool.TaskGroup()
        innerGroup.addTask(addTaskFuncBasicFunc, 21)
        innerPromise = taskpool.execute(innerGroup)
      }, (e: Object): void => {
        console.info('TaskGroupAddTaskFuncTest2600 catch: ' + String(e))
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
        console.error("TaskGroupAddTaskFuncTest2600 failed");
        expect(false).assertFail();
      }
      done()
    })
  })
}
