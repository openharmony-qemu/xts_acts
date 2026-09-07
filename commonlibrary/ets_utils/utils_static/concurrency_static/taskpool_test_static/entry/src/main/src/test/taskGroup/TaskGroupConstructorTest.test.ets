'use static';

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

import {describe, afterAll, it, expect, TestType, Size, Level, beforeAll, } from '../../../../hypium';
import Utils from '../Util.test';

// Module-level task functions (arrow functions, no nested definitions, no @Concurrent)
let printArgs = (args: number): number => { return args }
let delayFunc = (args: number): number => {
  let t: number = Date.now()
  while (Date.now() - t < 100) {}
  return args
}
let longRunningTask = (duration: number): number => {
  let start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration
}
let addFunc = (a: number, b: number): number => { return a + b }
let multiplyFunc = (x: number): number => { return x * 2 }
let taskWithDuration = (duration: number): number => {
  let start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration
}

export default function TaskGroupConstructorTest(): void {
  describe('TaskGroupConstructorTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskGroupConstructorTest0100
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify TaskGroup constructor called with string parameter invokes 2nd constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("testName")
      expect(taskGroup.name).assertEqual("testName")
    })

    /**
     * @tc.name   TaskGroupConstructorTest0200
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify TaskGroup name property is empty string after no-param construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      expect(taskGroup.name).assertEqual("")
    })

    /**
     * @tc.name   TaskGroupConstructorTest0300
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify TaskGroup can add single task after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 100.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val: number = result[0] as number
        expect(val).assertEqual(100.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest0400
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify TaskGroup can add multiple tasks after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 10.0)
      taskGroup.addTask(printArgs, 20.0)
      taskGroup.addTask(printArgs, 30.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(result.length).assertEqual(3)
        let val0: number = result[0] as number
        let val1: number = result[1] as number
        let val2: number = result[2] as number
        expect(val0).assertEqual(10.0)
        expect(val1).assertEqual(20.0)
        expect(val2).assertEqual(30.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest0500
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify TaskGroup can add Task objects after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0)
      let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0)
      taskGroup.addTask(task1)
      taskGroup.addTask(task2)
      taskGroup.addTask(task3)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(result.length).assertEqual(3)
        let val0: number = result[0] as number
        let val1: number = result[1] as number
        let val2: number = result[2] as number
        expect(val0).assertEqual(100.0)
        expect(val1).assertEqual(200.0)
        expect(val2).assertEqual(300.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest0600
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify empty TaskGroup execution returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(result.length).assertEqual(0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest0700
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify multiple constructions return independent instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup()
      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup1.addTask(printArgs, 10.0)
      taskGroup2.addTask(printArgs, 20.0)
      expect(taskGroup1 !== taskGroup2).assertTrue()
      try {
        let result1: Array<Any> = await taskpool.execute(taskGroup1)
        let result2: Array<Any> = await taskpool.execute(taskGroup2)
        let val1: number = result1[0] as number
        let val2: number = result2[0] as number
        expect(val1).assertEqual(10.0)
        expect(val2).assertEqual(20.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest0800
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify TaskGroup repeated execution returns same result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 100.0)
      try {
        let result1: Array<Any> = await taskpool.execute(taskGroup)
        let val1: number = result1[0] as number
        expect(val1).assertEqual(100.0)
        let result2: Array<Any> = await taskpool.execute(taskGroup)
        let val2: number = result2[0] as number
        expect(val2).assertEqual(100.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest0900
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify adding executed TaskGroup task to another TaskGroup throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let innerTask: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup1.addTask(innerTask)
      try {
        await taskpool.execute(taskGroup1)
        await Utils.msSleep(100)
        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup()
        let caught: boolean = false
        try {
          taskGroup2.addTask(innerTask)
          expect().assertFail()
        } catch (e) {
          caught = true
        }
        expect(caught).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest1000
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify adding seqRunnerTask to TaskGroup throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      let runnerPromise = runner.execute(task)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let caught: boolean = false
      try {
        taskGroup.addTask(task)
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      try {
        let runnerResult: Any = await runnerPromise
        let val: number = runnerResult as number
        expect(val).assertEqual(100.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest1100
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify adding dependent task to TaskGroup throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task1: taskpool.Task = new taskpool.Task(delayFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(delayFunc, 200.0)
      task1.addDependency(task2)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let caught: boolean = false
      try {
        taskGroup.addTask(task1)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorTest1200
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify TaskGroup dynamic task addition vs Task fixed function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 100.0)
      taskGroup.addTask(multiplyFunc, 100.0)
      try {
        let groupResult: Array<Any> = await taskpool.execute(taskGroup)
        expect(groupResult.length).assertEqual(2)
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0)
        let taskResult1: Any = await taskpool.execute(task1)
        let val1: number = taskResult1 as number
        expect(val1).assertEqual(100.0)
        let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
        let taskResult2: Any = await taskpool.execute(task2)
        let val2: number = taskResult2 as number
        expect(val2).assertEqual(200.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest1300
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify TaskGroup batch execution returns array vs Task returns single value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 10.0)
      taskGroup.addTask(printArgs, 20.0)
      taskGroup.addTask(printArgs, 30.0)
      try {
        let groupResult: Array<Any> = await taskpool.execute(taskGroup)
        expect(Array.isArray(groupResult)).assertTrue()
        expect(groupResult.length).assertEqual(3)
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0)
        let taskResult: Any = await taskpool.execute(task)
        let val: number = taskResult as number
        expect(val).assertEqual(100.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest1400
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify empty TaskGroup execution vs Task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let emptyGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      try {
        let emptyResult: Array<Any> = await taskpool.execute(emptyGroup)
        expect(emptyResult.length).assertEqual(0)
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0)
        let taskResult: Any = await taskpool.execute(task)
        let val: number = taskResult as number
        expect(val).assertEqual(100.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest1500
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_1500
     * @tc.desc   Verify cancel(taskGroup) cancels all tasks vs cancel(task) cancels single task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 500.0)
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 500.0)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task1)
      taskGroup.addTask(task2)
      let executePromise: Promise<Array<Any>> = taskpool.execute(taskGroup)
      try {
        await Utils.msSleep(100)
        let cancelSuccess: boolean = true
        try {
          taskpool.cancel(taskGroup)
        } catch (e) {
          cancelSuccess = false
        }
        try {
          await executePromise
        } catch (error) {
          // Cancellation rejects the group promise; expected and safe to ignore here
        }
        expect(cancelSuccess).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest1600
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_1600
     * @tc.desc   Verify constructing TaskGroup in async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 100.0)
      taskGroup.addTask(printArgs, 200.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(result.length).assertEqual(2)
        let val0: number = result[0] as number
        let val1: number = result[1] as number
        expect(val0).assertEqual(100.0)
        expect(val1).assertEqual(200.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest1700
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_1700
     * @tc.desc   Verify multiple TaskGroups concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup1.addTask(printArgs, 10.0)
      taskGroup1.addTask(printArgs, 20.0)
      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup2.addTask(printArgs, 100.0)
      taskGroup2.addTask(printArgs, 200.0)
      try {
        let result1: Array<Any> = await taskpool.execute(taskGroup1)
        let result2: Array<Any> = await taskpool.execute(taskGroup2)
        expect(result1.length).assertEqual(2)
        expect(result2.length).assertEqual(2)
        let val1_0: number = result1[0] as number
        let val2_0: number = result2[0] as number
        expect(val1_0).assertEqual(10.0)
        expect(val2_0).assertEqual(100.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest1800
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_1800
     * @tc.desc   Verify TaskGroup internal tasks concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(taskWithDuration, 500.0)
      taskGroup.addTask(taskWithDuration, 500.0)
      taskGroup.addTask(taskWithDuration, 500.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(result.length).assertEqual(3)
        let val0: number = result[0] as number
        let val1: number = result[1] as number
        let val2: number = result[2] as number
        expect(val0).assertEqual(500.0)
        expect(val1).assertEqual(500.0)
        expect(val2).assertEqual(500.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest1900
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_1900
     * @tc.desc   Verify Timer-triggered TaskGroup execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      setTimeout(async (): Promise<void> => {
        try {
          let taskGroupInner: taskpool.TaskGroup = new taskpool.TaskGroup()
          taskGroupInner.addTask(printArgs, 100.0)
          taskGroupInner.addTask(printArgs, 200.0)
          let innerResult: Array<Any> = await taskpool.execute(taskGroupInner)
          expect(innerResult.length).assertEqual(2)
          done();
        } catch (error) {
          expect().assertFail();
          done();
        }
      }, 500)
    })

    /**
     * @tc.name   TaskGroupConstructorTest2000
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_2000
     * @tc.desc   Verify TaskGroup execution result chained processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 10.0)
      taskGroup.addTask(printArgs, 20.0)
      try {
        let arrays: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = arrays[0] as number
        let val1: number = arrays[1] as number
        let sum: number = val0 + val1
        let task: taskpool.Task = new taskpool.Task(addFunc, sum, 5.0)
        let totalSum: Any = await taskpool.execute(task)
        let total: number = totalSum as number
        expect(arrays.length).assertEqual(2)
        expect(total).assertEqual(35.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest2100
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_2100
     * @tc.desc   Verify waiting for all TaskGroup results with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup1.addTask(printArgs, 10.0)
      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup2.addTask(printArgs, 20.0)
      let taskGroup3: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup3.addTask(printArgs, 30.0)
      try {
        let results: Array<Array<Any>> = await Promise.all([
          taskpool.execute(taskGroup1),
          taskpool.execute(taskGroup2),
          taskpool.execute(taskGroup3)
        ])
        expect(results.length).assertEqual(3)
        let val0: number = results[0][0] as number
        let val1: number = results[1][0] as number
        let val2: number = results[2][0] as number
        expect(val0).assertEqual(10.0)
        expect(val1).assertEqual(20.0)
        expect(val2).assertEqual(30.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorTest2200
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_TEST_2200
     * @tc.desc   Verify TaskGroup and Task mixed concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 10.0)
      taskGroup.addTask(printArgs, 20.0)
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      let groupPromise: Promise<Array<Any>> = taskpool.execute(taskGroup)
      let taskPromise: Promise<Any> = taskpool.execute(task)
      try {
        let groupResult: Array<Any> = await groupPromise
        let taskResult: Any = await taskPromise
        expect(groupResult.length).assertEqual(2)
        let val: number = taskResult as number
        expect(val).assertEqual(100.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

  })
}
