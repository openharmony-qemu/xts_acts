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
let longRunningTask = (duration: number): number => {
  let start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration
}
let cancelableLongRunningTask = (duration: number): number => {
  let start: number = Date.now()
  while (Date.now() - start < duration) {
    if (taskpool.Task.isCanceled()) { break }
  }
  return duration
}
let multiplyFunc = (x: number): number => { return x * 2 }
let incrementFunc = (x: number): number => { return x + 1 }

export default function TaskGroupConstructorExpandTest(): void {
  describe('TaskGroupConstructorExpandTest', ()=> {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskGroupConstructorExpandTest0100
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_0100
     * @tc.desc   Verify TaskGroup constructor with name parameter returns valid object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorExpandTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("groupName")
      expect(taskGroup.name).assertEqual("groupName")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest0200
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_0200
     * @tc.desc   Verify TaskGroup constructor without name uses no-param constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      expect(taskGroup.name).assertEqual("")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest0300
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_0300
     * @tc.desc   Verify TaskGroup constructor with name parameter sets name correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("testName")
      expect(taskGroup.name).assertEqual("testName")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest0400
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_0400
     * @tc.desc   Verify TaskGroup constructor with regular string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorExpandTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("normalName")
      expect(taskGroup.name).assertEqual("normalName")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest0500
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_0500
     * @tc.desc   Verify TaskGroup constructor with Chinese string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorExpandTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("测试任务组")
      expect(taskGroup.name).assertEqual("测试任务组")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest0600
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_0600
     * @tc.desc   Verify TaskGroup constructor with numeric string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("123456")
      expect(taskGroup.name).assertEqual("123456")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest0700
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_0700
     * @tc.desc   Verify TaskGroup constructor with mixed alphanumeric string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("Group_001")
      expect(taskGroup.name).assertEqual("Group_001")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest0800
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_0800
     * @tc.desc   Verify TaskGroup constructor with Unicode Chinese string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("\u4e2d\u6587")
      expect(taskGroup.name).assertEqual("中文")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest0900
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_0900
     * @tc.desc   Verify TaskGroup constructor with Unicode special character name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("\u0041\u0042\u0043")
      expect(taskGroup.name).assertEqual("ABC")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest1000
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_1000
     * @tc.desc   Verify TaskGroup constructor with emoji string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("Group\uD83D\uDE00")
      expect(taskGroup.name.length > 0).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest1100
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_1100
     * @tc.desc   Verify TaskGroup constructor with empty string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("")
      expect(taskGroup.name).assertEqual("")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest1200
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_1200
     * @tc.desc   Verify TaskGroup constructor with whitespace-only string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("   ")
      expect(taskGroup.name).assertEqual("   ")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest1300
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_1300
     * @tc.desc   Verify TaskGroup constructor with tab character string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("\tGroupName")
      expect(taskGroup.name.length > 0).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest1400
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_1400
     * @tc.desc   Verify TaskGroup constructor with newline character string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("Group\nName")
      expect(taskGroup.name.length > 0).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest1500
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_1500
     * @tc.desc   Verify TaskGroup constructor with zero-width space string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("Group\u200BName")
      expect(taskGroup.name.length > 0).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest1600
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_1600
     * @tc.desc   Verify TaskGroup constructor with special symbols string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("!@#$%^&*()")
      expect(taskGroup.name).assertEqual("!@#$%^&*()")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest1700
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_1700
     * @tc.desc   Verify TaskGroup constructor with XSS string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("<script>alert(1)</script>")
      expect(taskGroup.name).assertEqual("<script>alert(1)</script>")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest1800
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_1800
     * @tc.desc   Verify TaskGroup constructor with UUID format string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uuid: string = "550e8400-e29b-41d4-a716-446655440000"
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(uuid)
      expect(taskGroup.name).assertEqual(uuid)
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest1900
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_1900
     * @tc.desc   Verify TaskGroup constructor with date format string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("2026-04-28")
      expect(taskGroup.name).assertEqual("2026-04-28")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest2000
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_2000
     * @tc.desc   Verify TaskGroup constructor with single character name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("a")
      expect(taskGroup.name).assertEqual("a")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest2100
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_2100
     * @tc.desc   Verify TaskGroup constructor with very long string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let longName: string = "a".repeat(10000)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(longName)
      expect(taskGroup.name.length).assertEqual(10000)
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest2200
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_2200
     * @tc.desc   Verify TaskGroup constructor with Japanese string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("テスト")
      expect(taskGroup.name).assertEqual("テスト")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest2300
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_2300
     * @tc.desc   Verify TaskGroup constructor with Korean string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("테스트")
      expect(taskGroup.name).assertEqual("테스트")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest2400
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_2400
     * @tc.desc   Verify TaskGroup constructor with Russian string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("АБВГД")
      expect(taskGroup.name).assertEqual("АБВГД")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest2500
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_2500
     * @tc.desc   Verify TaskGroup constructor with Arabic string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("الاختبار")
      expect(taskGroup.name).assertEqual("الاختبار")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest2600
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_2600
     * @tc.desc   Verify TaskGroup constructor with mixed multilingual string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("Test测试テスト테스트")
      expect(taskGroup.name.length).assertEqual(12)
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest2700
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_2700
     * @tc.desc   Verify TaskGroup constructor with phone number format string name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("13800138000")
      expect(taskGroup.name).assertEqual("13800138000")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest2800
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_2800
     * @tc.desc   Verify TaskGroup with name can add tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorExpandTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("myGroup")
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
     * @tc.name   TaskGroupConstructorExpandTest2900
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_2900
     * @tc.desc   Verify multiple TaskGroups with different names exist independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group1: taskpool.TaskGroup = new taskpool.TaskGroup("group1")
      let group2: taskpool.TaskGroup = new taskpool.TaskGroup("group2")
      expect(group1.name).assertEqual("group1")
      expect(group2.name).assertEqual("group2")
      expect(group1 !== group2).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest3000
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_3000
     * @tc.desc   Verify TaskGroups with same name are independent instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group1: taskpool.TaskGroup = new taskpool.TaskGroup("sameName")
      let group2: taskpool.TaskGroup = new taskpool.TaskGroup("sameName")
      expect(group1.name).assertEqual("sameName")
      expect(group2.name).assertEqual("sameName")
      expect(group1 !== group2).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest3100
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_3100
     * @tc.desc   Verify TaskGroup constructor with name in try block succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorExpandTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskGroup: taskpool.TaskGroup | undefined = undefined
      try {
        taskGroup = new taskpool.TaskGroup("tryTest")
      } catch (error) {
        expect().assertFail()
      }
      expect((taskGroup as taskpool.TaskGroup).name).assertEqual("tryTest")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest3200
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_3200
     * @tc.desc   Verify finally block always executes after constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let finallyExecuted: boolean = false
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("finallyTest")
      } catch (error) {
        // catch block
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest3300
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_3300
     * @tc.desc   Verify unnamed TaskGroup functional completeness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(printArgs, 10.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup)
        let val: number = result[0] as number
        expect(val).assertEqual(10.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest3400
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_3400
     * @tc.desc   Verify Task name in named TaskGroup is accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorExpandTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task("myTask", printArgs, 100.0)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("myGroup")
      taskGroup.addTask(task)
      expect(task.name).assertEqual("myTask")
      expect(taskGroup.name).assertEqual("myGroup")
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest3500
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_3500
     * @tc.desc   Verify unnamed TaskGroup cancel returns result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorExpandTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(longRunningTask, 5000.0)
      taskGroup.addTask(longRunningTask, 5000.0)
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
     * @tc.name   TaskGroupConstructorExpandTest3600
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_3600
     * @tc.desc   Verify named TaskGroup cancel returns result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorExpandTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("cancelNamedGroup")
      taskGroup.addTask(longRunningTask, 5000.0)
      taskGroup.addTask(longRunningTask, 5000.0)
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
     * @tc.name   TaskGroupConstructorExpandTest3700
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_3700
     * @tc.desc   Verify named TaskGroup execution in async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorExpandTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("asyncGroup")
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
     * @tc.name   TaskGroupConstructorExpandTest3800
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_3800
     * @tc.desc   Verify multiple named TaskGroups concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorExpandTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let group1: taskpool.TaskGroup = new taskpool.TaskGroup("group1")
      group1.addTask(printArgs, 10.0)
      let group2: taskpool.TaskGroup = new taskpool.TaskGroup("group2")
      group2.addTask(printArgs, 20.0)
      let group3: taskpool.TaskGroup = new taskpool.TaskGroup("group3")
      group3.addTask(printArgs, 30.0)
      try {
        let results: Array<Array<Any>> = await Promise.all([
          taskpool.execute(group1),
          taskpool.execute(group2),
          taskpool.execute(group3)
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
     * @tc.name   TaskGroupConstructorExpandTest3900
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_3900
     * @tc.desc   Verify same-name TaskGroups concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorExpandTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let groupA: taskpool.TaskGroup = new taskpool.TaskGroup("sameName")
      groupA.addTask(printArgs, 100.0)
      let groupB: taskpool.TaskGroup = new taskpool.TaskGroup("sameName")
      groupB.addTask(printArgs, 200.0)
      try {
        let results: Array<Array<Any>> = await Promise.all([
          taskpool.execute(groupA),
          taskpool.execute(groupB)
        ])
        expect(results.length).assertEqual(2)
        let val0: number = results[0][0] as number
        let val1: number = results[1][0] as number
        expect(val0).assertEqual(100.0)
        expect(val1).assertEqual(200.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest4000
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_4000
     * @tc.desc   Verify named TaskGroup execution with timeout config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorExpandTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("timeoutGroup")
      taskGroup.addTask(printArgs, 100.0)
      try {
        let result: Array<Any> = await taskpool.execute(taskGroup, { timeout: 5000 })
        let val: number = result[0] as number
        expect(val).assertEqual(100.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest4100
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_4100
     * @tc.desc   Verify multiple TaskGroups share same task function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorExpandTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let group1: taskpool.TaskGroup = new taskpool.TaskGroup("share1")
      group1.addTask(multiplyFunc, 10.0)
      let group2: taskpool.TaskGroup = new taskpool.TaskGroup("share2")
      group2.addTask(multiplyFunc, 20.0)
      try {
        let results: Array<Array<Any>> = await Promise.all([
          taskpool.execute(group1),
          taskpool.execute(group2)
        ])
        let val0: number = results[0][0] as number
        let val1: number = results[1][0] as number
        expect(val0).assertEqual(20.0)
        expect(val1).assertEqual(40.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest4200
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_4200
     * @tc.desc   Verify named TaskGroups sequential chain execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorExpandTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let group1: taskpool.TaskGroup = new taskpool.TaskGroup("chain1")
      group1.addTask(incrementFunc, 10.0)
      let group2: taskpool.TaskGroup = new taskpool.TaskGroup("chain2")
      group2.addTask(incrementFunc, 20.0)
      let group3: taskpool.TaskGroup = new taskpool.TaskGroup("chain3")
      group3.addTask(incrementFunc, 30.0)
      try {
        let result1: Array<Any> = await taskpool.execute(group1)
        let result2: Array<Any> = await taskpool.execute(group2)
        let result3: Array<Any> = await taskpool.execute(group3)
        let val1: number = result1[0] as number
        let val2: number = result2[0] as number
        let val3: number = result3[0] as number
        expect(val1).assertEqual(11.0)
        expect(val2).assertEqual(21.0)
        expect(val3).assertEqual(31.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupConstructorExpandTest4300
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_4300
     * @tc.desc   Verify named TaskGroup cancellation during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorExpandTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("interruptGroup")
      taskGroup.addTask(longRunningTask, 5000.0)
      taskGroup.addTask(longRunningTask, 5000.0)
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
     * @tc.name   TaskGroupConstructorExpandTest4400
     * @tc.number SUB_TASK_GROUP_CONSTRUCTOR_EXPAND_TEST_4400
     * @tc.desc   Verify partial cancellation of multiple TaskGroups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorExpandTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let fastGroup: taskpool.TaskGroup = new taskpool.TaskGroup("fastGroup")
      fastGroup.addTask(printArgs, 100.0)
      let slowGroup: taskpool.TaskGroup = new taskpool.TaskGroup("slowGroup")
      slowGroup.addTask(cancelableLongRunningTask, 5000.0)
      slowGroup.addTask(cancelableLongRunningTask, 5000.0)
      try {
        let fastResult: Array<Any> = await taskpool.execute(fastGroup)
        let val: number = fastResult[0] as number
        expect(val).assertEqual(100.0)
        let slowPromise: Promise<Array<Any>> = taskpool.execute(slowGroup)
        // 删除前置 sleep：立即 cancel 必然先于组任务启动生效（组 Promise reject），且任务函数协作式早退避免 worker 占用残留
        let slowCancelSuccess: boolean = true
        try {
          taskpool.cancel(slowGroup)
        } catch (e) {
          slowCancelSuccess = false
        }
        let slowCanceled: boolean = false
        try {
          await slowPromise
        } catch (e) {
          slowCanceled = true
        }
        expect(slowCancelSuccess).assertTrue()
        expect(slowCanceled).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
