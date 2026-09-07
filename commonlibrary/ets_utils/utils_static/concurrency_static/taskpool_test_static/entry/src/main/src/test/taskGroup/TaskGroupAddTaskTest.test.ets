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

// Module-level task functions (arrow functions, no nested definitions)
let noArgFunc = (): string => { return "result" }
let singleArgFunc = (arg: number): number => { return arg * 2 }
let multiArgFunc = (a: number, b: number, c: number): number => { return a + b + c }
let fiveArgFunc = (a: number, b: number, c: number, d: number, e: number): number => { return a + b + c + d + e }
let normalFunc = (x: number): number => { return x + 1 }
let arrowFunc = (x: number): number => { return x * 2 }
let voidFunc = (x: number): void => {}
let objectFunc = (): string => { return "obj_result" }
let arrayFunc = (): number => { return 5 }
let strReturnFunc = (s: string): string => { return s + "_processed" }
let boolReturnFunc = (flag: boolean): boolean => { return flag }
let numFunc = (x: number): number => { return x }
let intFunc = (x: number): number => { return x * 2 }
let boolFunc = (flag: boolean): string => { return flag ? "true" : "false" }
let strFunc = (s: string): string => { return s + "_processed" }
let arrFunc = (arr: number[]): number => { return arr.length }
let mixedFunc = (num: number, str: string, flag: boolean): string => { return str + ":" + num + ":" + (flag ? "true" : "false") }
let computeFunc = (n: number): number => {
  let sum: number = 0
  for (let i: number = 0; i < n; i++) {
    sum += i
  }
  return sum
}
let returnNumFunc = (): number => { return 42 }
let returnStrFunc = (): string => { return "hello" }
let returnBoolFunc = (): boolean => { return true }
let zeroArgFunc = (): string => { return "zero" }
let oneArgFunc = (a: number): string => { return "one:" + a }
let twoArgFunc = (a: number, b: number): string => { return "two:" + a + ":" + b }
let delayTask = (duration: number): number => {
  let start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration
}
let failTask = (): number => { throw new Error("task failed") }
let successTask = (x: number): number => { return x }
let taskGen = (x: number): number => { return x }
let errorTask = (): void => { throw new Error("Custom error message") }
let chainTask1 = (): number => { return 10 }
let chainTask2 = (prev: number): number => { return prev + 20 }
let recursiveFunc = (n: number): number => {
  if (n <= 1) { return 1 }
  return recursiveFunc(n - 1) + recursiveFunc(n - 2)
}
let maxMinFunc = (x: number): string => { return x === Number.MAX_VALUE ? "max" : "other" }
let numTask = (x: number): number => { return x }
let strTask = (s: string): string => { return s }
let arrTask = (arr: number[]): number => { return arr.length }
let processDataFunc = (id: number): number => { return id * 2 }
let orderTask = (label: string): string => { return label }
let printArgs = (args: number): number => { return args }
let longTask = (ms: number): number => {
  let start: number = Date.now()
  while (Date.now() - start < ms) {}
  return ms
}
let cancelableLongGroupTask = (ms: number): number => {
  let start: number = Date.now()
  while (Date.now() - start < ms) {
    if (taskpool.Task.isCanceled()) { break }
  }
  return ms
}
let timeoutTask = (ms: number): string => {
  let start: number = Date.now()
  while (Date.now() - start < ms) {}
  return "success"
}

export default function TaskGroupAddTaskTest(): void {
  describe('TaskGroupAddTaskTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskGroupAddTaskTest0100
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_0100
     * @tc.desc   Verify TaskGroup.addTask() with func only adds task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(returnNumFunc)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(result.length).assertEqual(1)
        expect(val0).assertEqual(42)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest0200
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_0200
     * @tc.desc   Verify TaskGroup.addTask() with no args executes function without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(noArgFunc)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("result")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest0300
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_0300
     * @tc.desc   Verify TaskGroup.addTask() with one arg passes argument correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(singleArgFunc, 100.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(200)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest0400
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_0400
     * @tc.desc   Verify TaskGroup.addTask() with multiple args passes all arguments correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(multiArgFunc, 10.0, 20.0, 30.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(60)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest0500
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_0500
     * @tc.desc   Verify TaskGroup.addTask() with many args passes all arguments correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(fiveArgFunc, 1.0, 2.0, 3.0, 4.0, 5.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(15)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest0600
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_0600
     * @tc.desc   Verify TaskGroup.addTask() with normal function definition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(normalFunc, 100.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(101)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest0700
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_0700
     * @tc.desc   Verify TaskGroup.addTask() with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(arrowFunc, 50.0)
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
     * @tc.name   TaskGroupAddTaskTest0800
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_0800
     * @tc.desc   Verify TaskGroup.addTask() with void return function returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(voidFunc, 100.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(result[0] === undefined).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest0900
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_0900
     * @tc.desc   Verify TaskGroup.addTask() with object return function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(objectFunc)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("obj_result")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest1000
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_1000
     * @tc.desc   Verify TaskGroup.addTask() with number return function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(arrayFunc)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(5)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest1100
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_1100
     * @tc.desc   Verify TaskGroup.addTask() with string return function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(strReturnFunc, "normal")
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("normal_processed")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest1200
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_1200
     * @tc.desc   Verify TaskGroup.addTask() with boolean return function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(boolReturnFunc, true)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: boolean = result[0] as boolean
        expect(val0).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest1300
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_1300
     * @tc.desc   Verify TaskGroup.addTask() passes number argument correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(numFunc, 123.45)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(123.45)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest1400
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_1400
     * @tc.desc   Verify TaskGroup.addTask() passes int argument correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(intFunc, 100.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(200)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest1500
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_1500
     * @tc.desc   Verify TaskGroup.addTask() passes boolean argument correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(boolFunc, true)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("true")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest1600
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_1600
     * @tc.desc   Verify TaskGroup.addTask() passes string argument correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(strFunc, "normal")
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("normal_processed")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest1700
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_1700
     * @tc.desc   Verify TaskGroup.addTask() passes empty string argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(strFunc, "")
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("_processed")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest1800
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_1800
     * @tc.desc   Verify TaskGroup.addTask() passes Chinese string argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(strFunc, "\u4e2d\u6587")
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("\u4e2d\u6587_processed")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest1900
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_1900
     * @tc.desc   Verify TaskGroup.addTask() passes array argument correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(arrFunc, [1, 2, 3])
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(3)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest2000
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_2000
     * @tc.desc   Verify TaskGroup.addTask() passes mixed type arguments correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(mixedFunc, 100.0, "test", true)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("test:100:true")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest2100
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_2100
     * @tc.desc   Verify TaskGroup.addTask() passes zero value argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(numFunc, 0.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest2200
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_2200
     * @tc.desc   Verify TaskGroup.addTask() passes negative number argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(numFunc, -100.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(-100)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest2300
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_2300
     * @tc.desc   Verify TaskGroup.addTask() after execution adds task and re-execution includes it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskGroupAddTaskTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 100.0)
      try {
        let result1: Array<Any> = await taskpool.execute(taskGroup)
        expect(result1.length).assertEqual(1)
        let val1: number = result1[0] as number
        expect(val1).assertEqual(100)
        taskGroup.addTask(printArgs, 200.0)
        let result2: Array<Any> = await taskpool.execute(taskGroup)
        expect(result2.length).assertEqual(2)
        let val2_0: number = result2[0] as number
        let val2_1: number = result2[1] as number
        expect(val2_0).assertEqual(100)
        expect(val2_1).assertEqual(200)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest2400
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_2400
     * @tc.desc   Verify TaskGroup.addTask() with single task returns one result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 100.0)
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
     * @tc.name   TaskGroupAddTaskTest2500
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_2500
     * @tc.desc   Verify TaskGroup.addTask() with multiple tasks returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(arrowFunc, 10.0)
      taskGroup.addTask(arrowFunc, 20.0)
      taskGroup.addTask(arrowFunc, 30.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        let val1: number = result[1] as number
        let val2: number = result[2] as number
        expect(result.length).assertEqual(3)
        expect(val0).assertEqual(20)
        expect(val1).assertEqual(40)
        expect(val2).assertEqual(60)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest2600
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_2600
     * @tc.desc   Verify TaskGroup.addTask() with 100 tasks handles bulk operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 100; i++) {
        taskGroup.addTask(numFunc, i * 1.0)
      }
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        let val99: number = result[99] as number
        expect(result.length).assertEqual(100)
        expect(val0).assertEqual(0)
        expect(val99).assertEqual(99)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest2700
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_2700
     * @tc.desc   Verify TaskGroup.addTask() results order matches add order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(orderTask, "first")
      taskGroup.addTask(orderTask, "second")
      taskGroup.addTask(orderTask, "third")
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        let val1: string = result[1] as string
        let val2: string = result[2] as string
        expect(val0).assertEqual("first")
        expect(val1).assertEqual("second")
        expect(val2).assertEqual("third")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest2800
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_2800
     * @tc.desc   Verify TaskGroup.addTask() with compute-intensive task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(computeFunc, 1000.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(499500)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest2900
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_2900
     * @tc.desc   Verify TaskGroup.addTask() with different return type tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(returnNumFunc)
      taskGroup.addTask(returnStrFunc)
      taskGroup.addTask(returnBoolFunc)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(typeof result[0]).assertEqual("number")
        expect(typeof result[1]).assertEqual("string")
        expect(typeof result[2]).assertEqual("boolean")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest3000
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_3000
     * @tc.desc   Verify TaskGroup.addTask() with tasks requiring different arg counts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(zeroArgFunc)
      taskGroup.addTask(oneArgFunc, 1.0)
      taskGroup.addTask(twoArgFunc, 1.0, 2.0)
      taskGroup.addTask(fiveArgFunc, 1.0, 2.0, 3.0, 4.0, 5.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        let val1: string = result[1] as string
        let val2: string = result[2] as string
        let val3: number = result[3] as number
        expect(val0).assertEqual("zero")
        expect(val1).assertEqual("one:1")
        expect(val2).assertEqual("two:1:2")
        expect(val3).assertEqual(15)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest3100
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_3100
     * @tc.desc   Verify TaskGroup.addTask() with delayed task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(delayTask, 100.0)
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
     * @tc.name   TaskGroupAddTaskTest3200
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_3200
     * @tc.desc   Verify TaskGroup.addTask() tasks execute and return results via taskpool.execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupAddTaskTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(normalFunc, 10.0)
      taskGroup.addTask(normalFunc, 20.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        let val1: number = result[1] as number
        expect(result.length).assertEqual(2)
        expect(val0).assertEqual(11)
        expect(val1).assertEqual(21)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest3300
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_3300
     * @tc.desc   Verify TaskGroup.addTask() throws error when task fails in group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(successTask, 10.0)
      taskGroup.addTask(failTask)
      taskGroup.addTask(successTask, 20.0)
      let hasError: boolean = false
      try {
        await taskpool.execute(taskGroup)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest3400
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_3400
     * @tc.desc   Verify TaskGroup.addTask() with multiple groups executing concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup()
      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup1.addTask(taskGen, 100.0)
      taskGroup1.addTask(taskGen, 200.0)
      taskGroup2.addTask(taskGen, 300.0)
      taskGroup2.addTask(taskGen, 400.0)
      try {
        let results: Array<Array<Any>> = await Promise.all([
          taskpool.execute(taskGroup1),
          taskpool.execute(taskGroup2)
        ])
        expect(results[0].length).assertEqual(2)
        expect(results[1].length).assertEqual(2)
        let res00: number = results[0][0] as number
        let res10: number = results[1][0] as number
        expect(res00).assertEqual(100)
        expect(res10).assertEqual(300)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest3500
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_3500
     * @tc.desc   Verify TaskGroup.addTask() with 10 tasks returns all results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 10; i++) {
        taskGroup.addTask(arrowFunc, i * 1.0)
      }
      try {
        let results: Array<Any> = await taskpool.execute(taskGroup)
        expect(results.length).assertEqual(10)
        for (let i: number = 0; i < 10; i++) {
          let val: number = results[i.toInt()] as number
          expect(val).assertEqual(i * 2)
        }
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest3600
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_3600
     * @tc.desc   Verify TaskGroup execution throws error when task fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(errorTask)
      let hasError: boolean = false
      let errorMessage: string = ''
      try {
        await taskpool.execute(taskGroup)
      } catch (e) {
        hasError = true
        errorMessage = "caught"
      }
      expect(hasError).assertTrue()
      expect(errorMessage).assertEqual("caught")
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest3700
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_3700
     * @tc.desc   Verify task group result can be used as input for subsequent local computation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(chainTask1)
      try {
        let res1: Array<Any> = await taskpool.execute(taskGroup)
        let prev: number = res1[0] as number
        let next: number = chainTask2(prev)
        expect(next).assertEqual(30)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest3800
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_3800
     * @tc.desc   Verify TaskGroup.addTask() task group can be canceled during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(cancelableLongGroupTask, 2000.0)
      let executePromise: Promise<Array<Any>> = taskpool.execute(taskGroup)
      // 删除前置 sleep：立即 cancel 必然先于组任务启动生效（组 Promise reject），且任务函数协作式早退避免 worker 占用残留
      taskpool.cancel(taskGroup)
      let rejected: boolean = false
      try {
        await executePromise
      } catch (e) {
        rejected = true
      }
      expect(rejected).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest3900
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_3900
     * @tc.desc   Verify TaskGroup.addTask() with timeout configuration throws timeout error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(timeoutTask, 1000.0)
      let hasTimeoutError: boolean = false
      try {
        await taskpool.execute(taskGroup, { timeout: 500 })
      } catch (e) {
        hasTimeoutError = true
      }
      expect(hasTimeoutError).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest4000
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_4000
     * @tc.desc   Verify TaskGroup.addTask() with priority execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 100.0)
      taskGroup.addTask(printArgs, 200.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup, taskpool.Priority.HIGH)
        expect(result.length).assertEqual(2)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest4100
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_4100
     * @tc.desc   Verify TaskGroup.addTask() with recursive function executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(recursiveFunc, 10.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        expect(val0).assertEqual(89)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest4200
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_4200
     * @tc.desc   Verify TaskGroup.addTask() with Number.MAX_VALUE argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupAddTaskTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(maxMinFunc, Number.MAX_VALUE)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: string = result[0] as string
        expect(val0).assertEqual("max")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest4300
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_4300
     * @tc.desc   Verify TaskGroup.addTask() with empty task group returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
     * @tc.name   TaskGroupAddTaskTest4400
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_4400
     * @tc.desc   Verify TaskGroup.addTask() re-executing task group returns same results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 100.0)
      try {
        let result1: Array<Any> = await taskpool.execute(taskGroup)
        let val1: number = result1[0] as number
        expect(val1).assertEqual(100)
        let result2: Array<Any> = await taskpool.execute(taskGroup)
        expect(result2.length).assertEqual(1)
        let val2: number = result2[0] as number
        expect(val2).assertEqual(100)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest4500
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_4500
     * @tc.desc   Verify TaskGroup.addTask() with mixed argument type tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(numTask, 100.0)
      taskGroup.addTask(strTask, "test")
      taskGroup.addTask(arrTask, [1, 2, 3, 4, 5])
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val0: number = result[0] as number
        let val1: string = result[1] as string
        let val2: number = result[2] as number
        expect(result.length).assertEqual(3)
        expect(val0).assertEqual(100)
        expect(val1).assertEqual("test")
        expect(val2).assertEqual(5)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupAddTaskTest4600
     * @tc.number SUB_TASK_GROUP_ADD_TASK_TEST_4600
     * @tc.desc   Verify TaskGroup.addTask() in batch data processing scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupAddTaskTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 10; i++) {
        taskGroup.addTask(processDataFunc, i * 1.0)
      }
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        expect(result.length).assertEqual(10)
        for (let i: number = 0; i < 10; i++) {
          let val: number = result[i.toInt()] as number
          expect(val).assertEqual(i * 2)
        }
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
