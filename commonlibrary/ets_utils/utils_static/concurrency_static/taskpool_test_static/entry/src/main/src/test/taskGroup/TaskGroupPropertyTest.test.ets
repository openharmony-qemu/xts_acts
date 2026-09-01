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
let delayTask = (duration: number): number => {
  let start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration
}
let processData = (data: number): number => { return data * 2.0 }

export default function TaskGroupPropertyTest(): void {
  describe('TaskGroupPropertyTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskGroupPropertyTest0100
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_0100
     * @tc.desc   Verify TaskGroup.name returns empty string after constructor() without params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupPropertyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let name: string = taskGroup.name
      expect(name).assertEqual("")
    })

    /**
     * @tc.name   TaskGroupPropertyTest0200
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_0200
     * @tc.desc   Verify TaskGroup.name returns specified name after constructor(name: string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupPropertyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskGroupName: string = "groupName"
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(taskGroupName)
      let name: string = taskGroup.name
      expect(name).assertEqual("groupName")
    })

    /**
     * @tc.name   TaskGroupPropertyTest0300
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_0300
     * @tc.desc   Verify TaskGroup.name unchanged after executing task group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupPropertyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("testGroup")
      taskGroup.addTask(printArgs, 100.0)
      try {
        await taskpool.execute(taskGroup)
        let name: string = taskGroup.name
        expect(name).assertEqual("testGroup")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupPropertyTest0400
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_0400
     * @tc.desc   Verify TaskGroup.name with empty string initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("")
      expect(taskGroup.name).assertEqual("")
    })

    /**
     * @tc.name   TaskGroupPropertyTest0500
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_0500
     * @tc.desc   Verify TaskGroup.name with Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("\u6d4b\u8bd5\u7ec4\u4e2d\u6587")
      expect(taskGroup.name).assertEqual("\u6d4b\u8bd5\u7ec4\u4e2d\u6587")
    })

    /**
     * @tc.name   TaskGroupPropertyTest0600
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_0600
     * @tc.desc   Verify TaskGroup.name with special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("group_!@#$%^&*()")
      expect(taskGroup.name).assertEqual("group_!@#$%^&*()")
    })

    /**
     * @tc.name   TaskGroupPropertyTest0700
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_0700
     * @tc.desc   Verify TaskGroup.name with space characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("  space name  ")
      expect(taskGroup.name).assertEqual("  space name  ")
    })

    /**
     * @tc.name   TaskGroupPropertyTest0800
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_0800
     * @tc.desc   Verify TaskGroup.name with long string initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let longName: string = "aaaaaaaaaa"
      for (let i: number = 0; i < 10; i++) {
        longName = longName + longName
      }
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(longName)
      expect(taskGroup.name).assertEqual(longName)
      expect(taskGroup.name.length).assertEqual(longName.length)
    })

    /**
     * @tc.name   TaskGroupPropertyTest0900
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_0900
     * @tc.desc   Verify TaskGroup.name with template string initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let id: number = 1
      let name: string = `group_${id}`
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(name)
      expect(taskGroup.name).assertEqual("group_1")
    })

    /**
     * @tc.name   TaskGroupPropertyTest1000
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_1000
     * @tc.desc   Verify TaskGroup.name returns consistent value on multiple reads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("test")
      let name1: string = taskGroup.name
      let name2: string = taskGroup.name
      let name3: string = taskGroup.name
      expect(name1).assertEqual(name2)
      expect(name2).assertEqual(name3)
    })

    /**
     * @tc.name   TaskGroupPropertyTest1100
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_1100
     * @tc.desc   Verify TaskGroup.name unchanged after adding task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("stableName")
      taskGroup.addTask(printArgs, 100.0)
      expect(taskGroup.name).assertEqual("stableName")
    })

    /**
     * @tc.name   TaskGroupPropertyTest1200
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_1200
     * @tc.desc   Verify TaskGroup.name unchanged after canceling task group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupPropertyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let loogtask: taskpool.Task = new taskpool.Task(delayTask, 5000.0)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("stableName")
      taskGroup.addTask(loogtask)
      taskpool.execute(taskGroup)
      try {
        await Utils.msSleep(100)
        try {
          taskpool.cancel(taskGroup)
        } catch (e) {
        }
        expect(taskGroup.name).assertEqual("stableName")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupPropertyTest1300
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_1300
     * @tc.desc   Verify TaskGroup.name with single character boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("a")
      expect(taskGroup.name).assertEqual("a")
      expect(taskGroup.name.length).assertEqual(1)
    })

    /**
     * @tc.name   TaskGroupPropertyTest1400
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_1400
     * @tc.desc   Verify TaskGroup.name with zero-width space character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("test\u200Bgroup")
      expect(taskGroup.name).assertEqual("test\u200Bgroup")
    })

    /**
     * @tc.name   TaskGroupPropertyTest1500
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_1500
     * @tc.desc   Verify TaskGroup.name with XSS injection string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("<script>alert(1)</script>")
      expect(taskGroup.name).assertEqual("<script>alert(1)</script>")
    })

    /**
     * @tc.name   TaskGroupPropertyTest1600
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_1600
     * @tc.desc   Verify TaskGroup.name with multi-language characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("\u4e2d\u6587English\u65e5\u672c\u8a9e\ud55c\uad6d\uc5b4")
      expect(taskGroup.name).assertEqual("\u4e2d\u6587English\u65e5\u672c\u8a9e\ud55c\uad6d\uc5b4")
    })

    /**
     * @tc.name   TaskGroupPropertyTest1700
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_1700
     * @tc.desc   Verify TaskGroup.name with escape sequence characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("group\n\t\r")
      expect(taskGroup.name).assertEqual("group\n\t\r")
    })

    /**
     * @tc.name   TaskGroupPropertyTest1800
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_1800
     * @tc.desc   Verify multiple TaskGroup instances have independent name properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupPropertyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup("group1")
      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup("group2")
      let taskGroup3: taskpool.TaskGroup = new taskpool.TaskGroup("group3")
      expect(taskGroup1.name).assertEqual("group1")
      expect(taskGroup2.name).assertEqual("group2")
      expect(taskGroup3.name).assertEqual("group3")
    })

    /**
     * @tc.name   TaskGroupPropertyTest1900
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_1900
     * @tc.desc   Verify TaskGroup.name reads correctly during concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupPropertyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup("group1")
      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup("group2")
      taskGroup1.addTask(printArgs, 100.0)
      taskGroup2.addTask(printArgs, 200.0)
      try {
        await Promise.all([
          taskpool.execute(taskGroup1),
          taskpool.execute(taskGroup2)
        ])
        expect(taskGroup1.name).assertEqual("group1")
        expect(taskGroup2.name).assertEqual("group2")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupPropertyTest2000
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_2000
     * @tc.desc   Verify TaskGroup.name when constructor receives null as name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupPropertyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(null as string)
        expect(taskGroup.name).assertEqual("")
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskGroupPropertyTest2100
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_2100
     * @tc.desc   Verify TaskGroup.name when constructor receives undefined as name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupPropertyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(undefined as string)
        expect(taskGroup.name).assertEqual("")
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskGroupPropertyTest2200
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_2200
     * @tc.desc   Verify TaskGroup.name used for logging in actual scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupPropertyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("dataProcessingGroup")
      taskGroup.addTask(processData, 10.0)
      try {
        await taskpool.execute(taskGroup)
        expect(taskGroup.name).assertEqual("dataProcessingGroup")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskGroupPropertyTest2300
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_2300
     * @tc.desc   Verify TaskGroup.name used to distinguish different task groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupPropertyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let downloadGroup: taskpool.TaskGroup = new taskpool.TaskGroup("download")
      let uploadGroup: taskpool.TaskGroup = new taskpool.TaskGroup("upload")
      let processGroup: taskpool.TaskGroup = new taskpool.TaskGroup("process")

      downloadGroup.addTask(printArgs, 1.0)
      uploadGroup.addTask(printArgs, 2.0)
      processGroup.addTask(printArgs, 3.0)

      expect(downloadGroup.name).assertEqual("download")
      expect(uploadGroup.name).assertEqual("upload")
      expect(processGroup.name).assertEqual("process")
    })

    /**
     * @tc.name   TaskGroupPropertyTest2400
     * @tc.number SUB_TASK_GROUP_PROPERTY_TEST_2400
     * @tc.desc   Verify TaskGroup.name used with Task.name in getTask scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupPropertyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let task: taskpool.Task = new taskpool.Task("myTask", printArgs, 100.0)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("myGroup")
      taskGroup.addTask(task)
      expect(taskGroup.name).assertEqual("myGroup")
      expect(task.name).assertEqual("myTask")
    })
  })
}
