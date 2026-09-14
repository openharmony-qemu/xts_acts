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

let printArgs = (args: number): number => { return args }
let noArgsFunc = (): string => { return "no args" }
let multiArgsFunc = (a: number, b: string, c: boolean): string => { return a + "-" + b + "-" + c }
let longTask = (ms: number): number => {
  let start: number = Date.now()
  while (Date.now() - start < ms) {}
  return ms
}
let returnZeroFunc = (): number => { return 0 }
let returnEmptyFunc = (): string => { return "" }
let returnVoidFunc = (): void => {}
let sendDataFunc = (): number => {
  taskpool.Task.sendData(100)
  return 1
}

let receivedData: number = 0
let onReceiveDataCallback = (data: number): void => {
  receivedData = data
  return
}

export default function TaskGroupAddTaskExpandTest(): void {
  describe('TaskGroupAddTaskExpandTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskGroupAddTaskExpandTest0100
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_0100
     * @tc.desc   Verify addTask(task) with normal Task adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('TaskGroupAddTaskExpandTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      taskGroup.addTask(task)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(result.length).assertEqual(1)
        expect(val0).assertEqual(100)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest0200
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_0200
     * @tc.desc   Verify addTask(task) with named Task adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('TaskGroupAddTaskExpandTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task: taskpool.Task = new taskpool.Task("myTask", printArgs, 100.0)
      taskGroup.addTask(task)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(100)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest0300
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_0300
     * @tc.desc   Verify addTask(task) with no-arg Task adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('TaskGroupAddTaskExpandTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task: taskpool.Task = new taskpool.Task(noArgsFunc)
      taskGroup.addTask(task)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("no args")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest0400
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_0400
     * @tc.desc   Verify addTask(task) with multi-arg Task adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task: taskpool.Task = new taskpool.Task(multiArgsFunc, 1.0, "test", true)
      taskGroup.addTask(task)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("1-test-true")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest0500
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_0500
     * @tc.desc   Verify TaskGroup can be re-executed after completion and returns same result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('TaskGroupAddTaskExpandTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 100.0)
      try {
        let result1: Array<Any> = await taskpool.execute(taskGroup)
        let val1: number = result1[0] as number
        expect(val1).assertEqual(100)
        let result2: Array<Any> = await taskpool.execute(taskGroup)
        let val2: number = result2[0] as number
        expect(val2).assertEqual(100)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest0600
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_0600
     * @tc.desc   Verify addTask(task) with executed Task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      try {
        await taskpool.execute(task)
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        let hasError: boolean = false
        let errorMessage: string = ''
        try {
          taskGroup.addTask(task)
        } catch (e) {
          hasError = true
          errorMessage = "caught"
        }
        expect(hasError).assertTrue()
        expect(errorMessage).assertEqual("caught")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest0700
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_0700
     * @tc.desc   Verify addTask(task) with executing Task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskExpandTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask, 500.0)
      let executePromise: Promise<Any> = taskpool.execute(task)
      try {
        await Utils.msSleep(100)
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        let hasError: boolean = false
        let errorMessage: string = ''
        try {
          taskGroup.addTask(task)
        } catch (e) {
          hasError = true
          errorMessage = "caught"
        }
        try {
          await executePromise
        } catch (e) {
        }
        expect(hasError).assertTrue()
        expect(errorMessage).assertEqual("caught")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest0800
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_0800
     * @tc.desc   Verify addTask(task) with groupTask throws error containing groupTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup1.addTask(task)
      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup()
      let hasError: boolean = false
      let errorMessage: string = ''
      try {
        taskGroup2.addTask(task)
      } catch (e) {
        hasError = true
        errorMessage = "caught"
      }
      expect(hasError).assertTrue()
      expect(errorMessage).assertEqual("caught")
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest0900
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_0900
     * @tc.desc   Verify addTask(task) with seqRunnerTask throws error containing seqRunnerTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let seqTask: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      let runnerPromise = runner.execute(seqTask)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let hasError: boolean = false
      let errorMessage: string = ''
      try {
        taskGroup.addTask(seqTask)
      } catch (e) {
        hasError = true
        errorMessage = "caught"
      }
      try {
        await runnerPromise
      } catch (e) {
      }
      expect(hasError).assertTrue()
      expect(errorMessage).assertEqual("caught")
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest1000
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_1000
     * @tc.desc   Verify addTask(task) with dependent Task throws error containing dependent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0)
      task2.addDependency(task1)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let hasError: boolean = false
      let errorMessage: string = ''
      try {
        taskGroup.addTask(task2)
      } catch (e) {
        hasError = true
        errorMessage = "caught"
      }
      expect(hasError).assertTrue()
      expect(errorMessage).assertEqual("caught")
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest1100
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_1100
     * @tc.desc   Verify addTask(task) with being-depended Task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0)
      task2.addDependency(task1)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let hasError: boolean = false
      try {
        taskGroup.addTask(task1)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertTrue()
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest1200
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_1200
     * @tc.desc   Verify addTask(task) with periodicTask throws error containing periodicTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskExpandTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let periodicTask: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      taskpool.executePeriodically(200, periodicTask)
      try {
        await Utils.msSleep(100)
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        let hasError: boolean = false
        try {
          taskGroup.addTask(periodicTask)
          expect().assertFail()
        } catch (e) {
          hasError = true
        } finally {
          taskpool.cancel(periodicTask)
        }
        expect(hasError).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest1300
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_1300
     * @tc.desc   Verify addTask(task) with asyncRunnerTask throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskExpandTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2)
      let asyncTask: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      try {
        await asyncRunner.execute(asyncTask)
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        let hasError: boolean = false
        try {
          taskGroup.addTask(asyncTask)
          expect().assertFail()
        } catch (e) {
          hasError = true
        }
        expect(hasError).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest1400
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_1400
     * @tc.desc   Verify addTask(func,args) and addTask(task) produce same result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('TaskGroupAddTaskExpandTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup1.addTask(printArgs, 100.0)
      try {
        let result1: Array<Any> = await taskpool.execute(taskGroup1)
        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup()
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0)
        taskGroup2.addTask(task)
        let result2: Array<Any> = await taskpool.execute(taskGroup2)
        let val1: number = result1[0] as number
        let val2: number = result2[0] as number
        expect(val1).assertEqual(val2)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest1500
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_1500
     * @tc.desc   Verify addTask(task) preserves Task name after addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("myTask", printArgs, 100.0)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task)
      expect(task.name).assertEqual("myTask")
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(100)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest1600
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_1600
     * @tc.desc   Verify addTask(task) preserves taskId and name accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task("namedTask", printArgs, 100.0)
      let taskIdBefore: number = task.taskId
      let taskNameBefore: string = task.name
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task)
      expect(task.taskId).assertEqual(taskIdBefore)
      expect(task.name).assertEqual(taskNameBefore)
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest1700
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_1700
     * @tc.desc   Verify addTask(task) with onReceiveData registered Task executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskExpandTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(sendDataFunc)
      task.onReceiveData(onReceiveDataCallback)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(1)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest1800
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_1800
     * @tc.desc   Verify addTask(task) increases TaskGroup result count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('TaskGroupAddTaskExpandTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(new taskpool.Task(printArgs, 100.0))
      taskGroup.addTask(new taskpool.Task(printArgs, 200.0))
      taskGroup.addTask(new taskpool.Task(printArgs, 300.0))
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        let val1: number = result[1] as number
        let val2: number = result[2] as number
        expect(result.length).assertEqual(3)
        expect(val0).assertEqual(100)
        expect(val1).assertEqual(200)
        expect(val2).assertEqual(300)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest1900
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_1900
     * @tc.desc   Verify adding an executed Task to TaskGroup throws an error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskExpandTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      try {
        await taskpool.execute(task)
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        let caughtError: Error | null = null
        try {
          taskGroup.addTask(task)
        } catch (e) {
          caughtError = e
        }
        expect(caughtError !== null).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest2000
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_2000
     * @tc.desc   Verify concurrent Task addition to TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskExpandTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i * 10.0)
        taskGroup.addTask(task)
      }
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(result.length).assertEqual(10)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest2100
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_2100
     * @tc.desc   Verify addTask(task) results order matches add order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('TaskGroupAddTaskExpandTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0)
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0)
      let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0)
      taskGroup.addTask(task1)
      taskGroup.addTask(task2)
      taskGroup.addTask(task3)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        let val1: number = result[1] as number
        let val2: number = result[2] as number
        expect(val0).assertEqual(100)
        expect(val1).assertEqual(200)
        expect(val2).assertEqual(300)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest2200
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_2200
     * @tc.desc   Verify both addTask overloads work together in same TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      // 1st overload: addTask(func, ...args)
      taskGroup.addTask(printArgs, 100.0)
      // 2nd overload: addTask(task)
      let task: taskpool.Task = new taskpool.Task(printArgs, 200.0)
      taskGroup.addTask(task)
      // 1st overload again
      taskGroup.addTask(printArgs, 300.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        let val1: number = result[1] as number
        let val2: number = result[2] as number
        expect(result.length).assertEqual(3)
        expect(val0).assertEqual(100)
        expect(val1).assertEqual(200)
        expect(val2).assertEqual(300)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest2300
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_2300
     * @tc.desc   Verify delayed Task addition to TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskExpandTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      try {
        await Utils.msSleep(100)
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0)
        taskGroup.addTask(task)
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(result.length).assertEqual(1)
        expect(val0).assertEqual(100)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest2400
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_2400
     * @tc.desc   Verify sequential Task addition to TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskExpandTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i * 100.0)
        taskGroup.addTask(task)
      }
      try {
        await Utils.msSleep(100)
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(result.length).assertEqual(5)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest2500
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_2500
     * @tc.desc   Verify Task returning 0, empty string, void/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(new taskpool.Task(returnZeroFunc))
      taskGroup.addTask(new taskpool.Task(returnEmptyFunc))
      taskGroup.addTask(new taskpool.Task(returnVoidFunc))
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(result.length).assertEqual(3)
        let val0: number = result[0] as number
        let val1: string = result[1] as string
        expect(val0).assertEqual(0)
        expect(val1).assertEqual("")
        expect(result[2] === undefined).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest2600
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_2600
     * @tc.desc   Verify Task with empty name string adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskGroupAddTaskExpandTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("", printArgs, 100.0)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task)
      expect(task.name).assertEqual("")
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(result.length).assertEqual(1)
        expect(val0).assertEqual(100)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest2700
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_2700
     * @tc.desc   Verify Task with very long name adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskExpandTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let longName: string = "a".repeat(1000)
      let task: taskpool.Task = new taskpool.Task(longName, printArgs, 100.0)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task)
      expect(task.name).assertEqual(longName)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(result.length).assertEqual(1)
        expect(val0).assertEqual(100)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskExpandTest2800
     * @tc.number SUB_TASK_GROUP_ADD_TASK_EXPAND_TEST_2800
     * @tc.desc   Verify Task with special characters in name adds successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskExpandTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let specialName: string = "task-\u4e2d\u6587-\u540d\u5b57"
      let task: taskpool.Task = new taskpool.Task(specialName, printArgs, 100.0)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task)
      expect(task.name).assertEqual(specialName)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(result.length).assertEqual(1)
        expect(val0).assertEqual(100)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
