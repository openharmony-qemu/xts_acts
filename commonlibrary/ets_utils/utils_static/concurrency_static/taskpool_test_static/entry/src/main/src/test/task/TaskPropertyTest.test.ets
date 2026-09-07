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

let simpleReturnFunc = (): number => { return 42.0 }
let arrowStrFunc = (): string => { return "arrow" }
let addFunc = (a: number, b: number): number => { return a + b }
let multiplyFunc = (a: number, b: number): number => { return a * b }
let returnArgFunc = (a: number): number => { return a }
let cpuIntensiveFunc = (): number => {
  let sum: number = 0
  for (let i: number = 0; i < 1000000; i++) { sum += i }
  return sum
}
let longRunningFunc = (): number => {
  let start: number = Date.now()
  while (Date.now() - start < 100) {}
  return 1.0
}
let func1 = (): number => { return 1.0 }
let func2 = (): number => { return 2.0 }
let func3 = (): number => { return 3.0 }
let shortTaskFunc = (): number => { return 1.0 }

export default function TaskPropertyTest(): void {
  describe('TaskPropertyTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskPropertyTest0100
     * @tc.number SUB_TASK_PROPERTY_TEST_0100
     * @tc.desc   Verify Task executes the function passed to constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPropertyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      let result: number = 0;
      try {
        result = await taskpool.execute(task) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(42.0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest0200
     * @tc.number SUB_TASK_PROPERTY_TEST_0200
     * @tc.desc   Verify Task with arrow function executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPropertyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(arrowStrFunc)
      try {
        let result: string = await taskpool.execute(task) as string
        expect(result).assertEqual("arrow")
      } catch (error) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskPropertyTest0300
     * @tc.number SUB_TASK_PROPERTY_TEST_0300
     * @tc.desc   Verify Task with parameterized function executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPropertyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addFunc, 10.0, 20.0)
      try {
        let result: number = await taskpool.execute(task) as number
        expect(result).assertEqual(30.0)
      } catch (error) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskPropertyTest0400
     * @tc.number SUB_TASK_PROPERTY_TEST_0400
     * @tc.desc   Verify different Tasks with different functions produce different results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(func1)
      let task2: taskpool.Task = new taskpool.Task(func2)
      let task3: taskpool.Task = new taskpool.Task(func3)
      try {
        let result1: number = await taskpool.execute(task1) as number
        let result2: number = await taskpool.execute(task2) as number
        let result3: number = await taskpool.execute(task3) as number
        expect(result1).assertEqual(1.0)
        expect(result2).assertEqual(2.0)
        expect(result3).assertEqual(3.0)
      } catch (error) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskPropertyTest0500
     * @tc.number SUB_TASK_PROPERTY_TEST_0500
     * @tc.desc   Verify Task with return-arg function executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPropertyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnArgFunc, 99.0)
      try {
        let result: number = await taskpool.execute(task) as number
        expect(result).assertEqual(99.0)
      } catch (error) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskPropertyTest0600
     * @tc.number SUB_TASK_PROPERTY_TEST_0600
     * @tc.desc   Verify Task with multiply function executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPropertyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(multiplyFunc, 5.0, 6.0)
      let result: number = 0;
      try {
        result = await taskpool.execute(task) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(30.0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest0700
     * @tc.number SUB_TASK_PROPERTY_TEST_0700
     * @tc.desc   Verify Task.arguments returns args when created with arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPropertyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(addFunc, 10.0, 20.0)
      expect(task.arguments !== undefined).assertTrue()
      expect(task.arguments !== null).assertTrue()
      expect(task.arguments!.length).assertEqual(2)
      expect(task.arguments![0] as number).assertEqual(10.0)
      expect(task.arguments![1] as number).assertEqual(20.0)
    })

    /**
     * @tc.name   TaskPropertyTest0800
     * @tc.number SUB_TASK_PROPERTY_TEST_0800
     * @tc.desc   Verify Task.arguments length matches number of arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(addFunc, 10.0, 20.0)
      expect(task.arguments !== undefined).assertTrue()
      expect(task.arguments!.length).assertEqual(2)
    })

    /**
     * @tc.name   TaskPropertyTest0900
     * @tc.number SUB_TASK_PROPERTY_TEST_0900
     * @tc.desc   Verify Task.arguments elements can be accessed by index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addFunc, 10.0, 20.0)
      expect(task.arguments !== undefined).assertTrue()
      expect(task.arguments!.length).assertEqual(2)
      let result: number = 0;
      try {
        result = await taskpool.execute(task) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(30.0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest1000
     * @tc.number SUB_TASK_PROPERTY_TEST_1000
     * @tc.desc   Verify Task.arguments with name constructor returns correct args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task("myTask", addFunc, 30.0, 40.0)
      expect(task.arguments !== undefined).assertTrue()
      expect(task.arguments!.length).assertEqual(2)
    })

    /**
     * @tc.name   TaskPropertyTest1100
     * @tc.number SUB_TASK_PROPERTY_TEST_1100
     * @tc.desc   Verify Task.arguments with multiple args has correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(multiplyFunc, 5.0, 6.0)
      expect(task.arguments !== undefined).assertTrue()
      expect(task.arguments!.length).assertEqual(2)
      let result: number = 0;
      try {
        result = await taskpool.execute(task) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(30.0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest1200
     * @tc.number SUB_TASK_PROPERTY_TEST_1200
     * @tc.desc   Verify Task.name returns specified name with name constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPropertyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task("myTask", simpleReturnFunc)
      expect(task.name).assertEqual("myTask")
    })

    /**
     * @tc.name   TaskPropertyTest1300
     * @tc.number SUB_TASK_PROPERTY_TEST_1300
     * @tc.desc   Verify Task.name when created without name constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      expect(task.name.length > 0).assertTrue()
    })

    /**
     * @tc.name   TaskPropertyTest1400
     * @tc.number SUB_TASK_PROPERTY_TEST_1400
     * @tc.desc   Verify Task.name with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task("", simpleReturnFunc)
      expect(task.name).assertEqual("")
    })

    /**
     * @tc.name   TaskPropertyTest1500
     * @tc.number SUB_TASK_PROPERTY_TEST_1500
     * @tc.desc   Verify Task.name with long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName: string = ""
      for (let i: number = 0; i < 1000; i++) {
        longName += "a"
      }
      let task: taskpool.Task = new taskpool.Task(longName, simpleReturnFunc)
      expect(task.name).assertEqual(longName)
      expect(task.name.length).assertEqual(1000)
    })

    /**
     * @tc.name   TaskPropertyTest1600
     * @tc.number SUB_TASK_PROPERTY_TEST_1600
     * @tc.desc   Verify Task.name with special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task("task-Test_123!@#", simpleReturnFunc)
      expect(task.name).assertEqual("task-Test_123!@#")
    })

    /**
     * @tc.name   TaskPropertyTest1700
     * @tc.number SUB_TASK_PROPERTY_TEST_1700
     * @tc.desc   Verify Task.name with Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task("\u4EFB\u52A1\uD83C\uDF89", simpleReturnFunc)
      expect(task.name).assertEqual("\u4EFB\u52A1\uD83C\uDF89")
    })

    /**
     * @tc.name   TaskPropertyTest1800
     * @tc.number SUB_TASK_PROPERTY_TEST_1800
     * @tc.desc   Verify Task.totalDuration reflects actual execution time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningFunc)
      let beforeDuration: number = task.totalDuration
      expect(beforeDuration).assertEqual(0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let afterDuration: number = task.totalDuration
      expect(afterDuration).assertLarger(0)
      expect(afterDuration).assertLarger(beforeDuration)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest1900
     * @tc.number SUB_TASK_PROPERTY_TEST_1900
     * @tc.desc   Verify Task.totalDuration is 0 before and non-negative after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      expect(task.totalDuration).assertEqual(0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.totalDuration).assertLargerOrEqual(0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest2000
     * @tc.number SUB_TASK_PROPERTY_TEST_2000
     * @tc.desc   Verify Task.ioDuration is 0 before and non-negative after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      expect(task.ioDuration).assertEqual(0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.ioDuration).assertLargerOrEqual(0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest2100
     * @tc.number SUB_TASK_PROPERTY_TEST_2100
     * @tc.desc   Verify Task.ioDuration is non-negative after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cpuIntensiveFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.ioDuration).assertEqual(0)
      expect(task.cpuDuration).assertLarger(0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest2200
     * @tc.number SUB_TASK_PROPERTY_TEST_2200
     * @tc.desc   Verify totalDuration >= cpuDuration + ioDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cpuIntensiveFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let sumDuration: number = task.cpuDuration + task.ioDuration
      expect(task.totalDuration).assertLargerOrEqual(sumDuration)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest2300
     * @tc.number SUB_TASK_PROPERTY_TEST_2300
     * @tc.desc   Verify Task.cpuDuration is 0 before and non-negative after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      expect(task.cpuDuration).assertEqual(0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.cpuDuration).assertLargerOrEqual(0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest2400
     * @tc.number SUB_TASK_PROPERTY_TEST_2400
     * @tc.desc   Verify all duration properties default to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPropertyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      expect(task.totalDuration).assertEqual(0)
      expect(task.ioDuration).assertEqual(0)
      expect(task.cpuDuration).assertEqual(0)
    })

    /**
     * @tc.name   TaskPropertyTest2500
     * @tc.number SUB_TASK_PROPERTY_TEST_2500
     * @tc.desc   Verify Task with name constructor has correct name and function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("testTask", simpleReturnFunc)
      expect(task.name).assertEqual("testTask")
      let result: number = 0;
      try {
        result = await taskpool.execute(task) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(42.0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest2600
     * @tc.number SUB_TASK_PROPERTY_TEST_2600
     * @tc.desc   Verify totalDuration changes from 0 to positive after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPropertyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cpuIntensiveFunc)
      let beforeDuration: number = task.totalDuration
      expect(beforeDuration).assertEqual(0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let afterDuration: number = task.totalDuration
      expect(afterDuration).assertLarger(0)
      expect(afterDuration).assertLarger(beforeDuration)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest2700
     * @tc.number SUB_TASK_PROPERTY_TEST_2700
     * @tc.desc   Verify cpuDuration changes from 0 to positive after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cpuIntensiveFunc)
      let beforeCPU: number = task.cpuDuration
      expect(beforeCPU).assertEqual(0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let afterCPU: number = task.cpuDuration
      expect(afterCPU).assertLarger(0)
      expect(afterCPU).assertLarger(beforeCPU)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest2800
     * @tc.number SUB_TASK_PROPERTY_TEST_2800
     * @tc.desc   Verify ioDuration remains 0 for CPU-only task after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cpuIntensiveFunc)
      let beforeIO: number = task.ioDuration
      expect(beforeIO).assertEqual(0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.ioDuration).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest2900
     * @tc.number SUB_TASK_PROPERTY_TEST_2900
     * @tc.desc   Verify duration properties relationship after task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cpuIntensiveFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.totalDuration).assertLarger(0)
      expect(task.cpuDuration).assertLarger(0)
      expect(task.totalDuration).assertLargerOrEqual(task.cpuDuration)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest3000
     * @tc.number SUB_TASK_PROPERTY_TEST_3000
     * @tc.desc   Verify Task.name is writable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task("oldName", simpleReturnFunc)
      expect(task.name).assertEqual("oldName")
      task.name = "newName"
      expect(task.name).assertEqual("newName")
    })

    /**
     * @tc.name   TaskPropertyTest3100
     * @tc.number SUB_TASK_PROPERTY_TEST_3100
     * @tc.desc   Verify Task.arguments is writable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(addFunc, 10.0, 20.0)
      expect(task.arguments !== undefined).assertTrue()
      expect(task.arguments!.length).assertEqual(2)
      task.arguments = [30.0, 40.0]
      expect(task.arguments !== undefined).assertTrue()
      expect(task.arguments!.length).assertEqual(2)
      expect(task.arguments![0] as number).assertEqual(30.0)
      expect(task.arguments![1] as number).assertEqual(40.0)
    })

    /**
     * @tc.name   TaskPropertyTest3200
     * @tc.number SUB_TASK_PROPERTY_TEST_3200
     * @tc.desc   Verify Task.name can be modified to empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task("testTask", simpleReturnFunc)
      task.name = ""
      expect(task.name).assertEqual("")
    })

    /**
     * @tc.name   TaskPropertyTest3300
     * @tc.number SUB_TASK_PROPERTY_TEST_3300
     * @tc.desc   Verify Task.name can be modified to long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task("testTask", simpleReturnFunc)
      let longName: string = ""
      for (let i: number = 0; i < 2000; i++) {
        longName += "b"
      }
      task.name = longName
      expect(task.name).assertEqual(longName)
      expect(task.name.length).assertEqual(2000)
    })

    /**
     * @tc.name   TaskPropertyTest3400
     * @tc.number SUB_TASK_PROPERTY_TEST_3400
     * @tc.desc   Verify Task.totalDuration can be reassigned before execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      task.totalDuration = 999999
      expect(task.totalDuration).assertEqual(999999)
    })

    /**
     * @tc.name   TaskPropertyTest3500
     * @tc.number SUB_TASK_PROPERTY_TEST_3500
     * @tc.desc   Verify Task.ioDuration can be reassigned before execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      task.ioDuration = 999999
      expect(task.ioDuration).assertEqual(999999)
    })

    /**
     * @tc.name   TaskPropertyTest3600
     * @tc.number SUB_TASK_PROPERTY_TEST_3600
     * @tc.desc   Verify Task.cpuDuration can be reassigned before execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      task.cpuDuration = 999999
      expect(task.cpuDuration).assertEqual(999999)
    })

    /**
     * @tc.name   TaskPropertyTest3700
     * @tc.number SUB_TASK_PROPERTY_TEST_3700
     * @tc.desc   Verify Task.totalDuration can be reassigned after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cpuIntensiveFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      task.totalDuration = 999999
      expect(task.totalDuration).assertEqual(999999)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest3800
     * @tc.number SUB_TASK_PROPERTY_TEST_3800
     * @tc.desc   Verify duration values are non-negative after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPropertyTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cpuIntensiveFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.totalDuration).assertLarger(0)
      expect(task.cpuDuration).assertLarger(0)
      expect(task.ioDuration).assertEqual(0)
      expect(task.totalDuration).assertLargerOrEqual(task.cpuDuration)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest3900
     * @tc.number SUB_TASK_PROPERTY_TEST_3900
     * @tc.desc   Verify duration values after execution of a short task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(shortTaskFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.totalDuration).assertLargerOrEqual(task.cpuDuration)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest4000
     * @tc.number SUB_TASK_PROPERTY_TEST_4000
     * @tc.desc   Verify Task.name with escape characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task("task\n\tname", simpleReturnFunc)
      expect(task.name).assertEqual("task\n\tname")
    })

    /**
     * @tc.name   TaskPropertyTest4100
     * @tc.number SUB_TASK_PROPERTY_TEST_4100
     * @tc.desc   Verify Task with extra arguments executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addFunc, 10.0, 20.0, 30.0, 40.0, 50.0)
      expect(task.arguments !== undefined).assertTrue()
      expect(task.arguments!.length).assertEqual(5)
      let result: number = 0;
      try {
        result = await taskpool.execute(task) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(30.0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest4200
     * @tc.number SUB_TASK_PROPERTY_TEST_4200
     * @tc.desc   Verify Task with fewer arguments than expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addFunc, 10.0)
      expect(task.arguments !== undefined).assertTrue()
      expect(task.arguments!.length).assertEqual(1)
      let rejected: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        rejected = true
      }
      expect(rejected).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskPropertyTest4300
     * @tc.number SUB_TASK_PROPERTY_TEST_4300
     * @tc.desc   Verify concurrent tasks have independent function behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(func1)
      let task2: taskpool.Task = new taskpool.Task(func2)
      let task3: taskpool.Task = new taskpool.Task(func3)
      let results: number[] = [];
      try {
        results = await Promise.all([
          taskpool.execute(task1) as Promise<number>,
          taskpool.execute(task2) as Promise<number>,
          taskpool.execute(task3) as Promise<number>
        ]);
      } catch (error) {
        expect().assertFail();
      }
      expect(results[0]).assertEqual(1.0)
      expect(results[1]).assertEqual(2.0)
      expect(results[2]).assertEqual(3.0)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest4400
     * @tc.number SUB_TASK_PROPERTY_TEST_4400
     * @tc.desc   Verify concurrent tasks have independent arguments properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(addFunc, 10.0, 20.0)
      let task2: taskpool.Task = new taskpool.Task(addFunc, 30.0, 40.0)
      let task3: taskpool.Task = new taskpool.Task(addFunc, 50.0, 60.0)
      try {
        let results: number[] = await Promise.all([
          taskpool.execute(task1) as Promise<number>,
          taskpool.execute(task2) as Promise<number>,
          taskpool.execute(task3) as Promise<number>
        ])
        expect(results[0]).assertEqual(30.0)
        expect(results[1]).assertEqual(70.0)
        expect(results[2]).assertEqual(110.0)
      } catch (error) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskPropertyTest4500
     * @tc.number SUB_TASK_PROPERTY_TEST_4500
     * @tc.desc   Verify concurrent tasks have independent duration properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(cpuIntensiveFunc)
      let task2: taskpool.Task = new taskpool.Task(longRunningFunc)
      try {
        await Promise.all([
          taskpool.execute(task1),
          taskpool.execute(task2)
        ])
        expect(task1.totalDuration).assertLarger(0)
        expect(task2.totalDuration).assertLarger(0)
        expect(task1.totalDuration).assertLargerOrEqual(task1.cpuDuration)
        expect(task2.totalDuration).assertLargerOrEqual(task2.cpuDuration)
      } catch (error) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskPropertyTest4600
     * @tc.number SUB_TASK_PROPERTY_TEST_4600
     * @tc.desc   Verify Task.arguments unchanged after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addFunc, 10.0, 20.0)
      let originalArgsLen: number = 0
      if (task.arguments !== undefined && task.arguments !== null) {
        originalArgsLen = task.arguments!.length
      }
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let afterArgsLen: number = 0
      if (task.arguments !== undefined && task.arguments !== null) {
        afterArgsLen = task.arguments!.length
      }
      expect(afterArgsLen).assertEqual(originalArgsLen)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest4700
     * @tc.number SUB_TASK_PROPERTY_TEST_4700
     * @tc.desc   Verify Task.name unchanged after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("myTask", simpleReturnFunc)
      let originalName: string = task.name
      try {
        await taskpool.execute(task)
      } catch (error) {
        expect().assertFail()
      }
      expect(task.name).assertEqual(originalName)
      expect(task.name).assertEqual("myTask")
      done();
    })

    /**
     * @tc.name   TaskPropertyTest4800
     * @tc.number SUB_TASK_PROPERTY_TEST_4800
     * @tc.desc   Verify Task.name unchanged after execution with name constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPropertyTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("taskName", addFunc, 10.0, 20.0)
      let originalName: string = task.name
      try {
        await taskpool.execute(task)
      } catch (error) {
        expect().assertFail()
      }
      expect(task.name).assertEqual(originalName)
      done();
    })

    /**
     * @tc.name   TaskPropertyTest4900
     * @tc.number SUB_TASK_PROPERTY_TEST_4900
     * @tc.desc   Verify arguments reassignment does not change bound execution parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPropertyTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 2.0, 3.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 4.0, 5.0)
      task1.arguments = [10.0, 20.0]
      task2.arguments = [30.0, 40.0]
      expect(task1.arguments !== undefined).assertTrue()
      expect(task1.arguments!.length).assertEqual(2)
      expect(task1.arguments![0] as number).assertEqual(10.0)
      expect(task1.arguments![1] as number).assertEqual(20.0)
      expect(task2.arguments !== undefined).assertTrue()
      expect(task2.arguments!.length).assertEqual(2)
      expect(task2.arguments![0] as number).assertEqual(30.0)
      expect(task2.arguments![1] as number).assertEqual(40.0)
      try {
        let result1: number = await taskpool.execute(task1) as number
        let result2: number = await taskpool.execute(task2) as number
        expect(result1).assertEqual(6.0)
        expect(result2).assertEqual(20.0)
      } catch (error) {
        expect().assertFail()
      }
      done();
    })

  })
}
