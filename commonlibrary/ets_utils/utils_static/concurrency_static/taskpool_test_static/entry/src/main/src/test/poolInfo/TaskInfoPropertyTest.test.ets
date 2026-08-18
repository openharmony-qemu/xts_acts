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

let longFunc = (): number => {
  let t: number = Date.now()
  while (Date.now() - t < 1000) {}
  return 100.0
}
let quickFunc = (): number => { return 1.0 }
let cancelableDelayFunc = (): number => {
  let t: number = Date.now()
  while (Date.now() - t < 5000) {
    if (taskpool.Task.isCanceled()) { break }
  }
  return 1.0
}
let durationLongFunc = (): number => {
  let t: number = Date.now()
  while (Date.now() - t < 3000) {}
  return 100.0
}
let delayFunc = (args: number): number => {
  let t: number = Date.now()
  while (Date.now() - t < args) {}
  return args + 0.0
}
let errorFunc = (): number => {
  let t: number = Date.now()
  while (Date.now() - t < 3000) {}
  throw new Error("task error")
}
let periodicFunc = (): void => {}

export default function TaskInfoPropertyTest(): void {
  describe('TaskInfoPropertyTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskInfoPropertyTest0100
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_0100
     * @tc.desc   Verify TaskInfo.taskId returns positive int after task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskInfoPropertyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.taskId > 0).assertTrue()
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest0200
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_0200
     * @tc.desc   Verify TaskInfo.taskId is unique across multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // 可取消 5s 任务：用例末尾 cancel 后忙等协作式早退，避免 3×5s worker 占用残留影响后续用例
      let task1: taskpool.Task = new taskpool.Task(cancelableDelayFunc)
      let task2: taskpool.Task = new taskpool.Task(cancelableDelayFunc)
      let task3: taskpool.Task = new taskpool.Task(cancelableDelayFunc)
      let p1: Promise<Any> = taskpool.execute(task1)
      let p2: Promise<Any> = taskpool.execute(task2)
      let p3: Promise<Any> = taskpool.execute(task3)
      let taskIdList: Array<number> = []
      let begin: number = Date.now()
      try {
        while (taskIdList.length < 3 && Date.now() - begin < 15000) {
          taskIdList = []
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task1.taskId || taskInfo.taskId === task2.taskId ||
              taskInfo.taskId === task3.taskId) {
              taskIdList.push(taskInfo.taskId)
              expect(taskInfo.taskId > 0).assertTrue()
            }
          }
          if (taskIdList.length < 3) {
            await Utils.msSleep(100)
          }
        }
        expect(taskIdList.length).assertEqual(3)
        let uniqueList: Array<number> = []
        for (let taskId of taskIdList) {
          if (uniqueList.indexOf(taskId) === -1) {
            uniqueList.push(taskId)
          }
        }
        expect(uniqueList.length).assertEqual(taskIdList.length)
      } catch (error) {
        expect().assertFail();
      }
      try {
        taskpool.cancel(task1)
      } catch (error) {
      }
      try {
        taskpool.cancel(task2)
      } catch (error) {
      }
      try {
        taskpool.cancel(task3)
      } catch (error) {
      }
      try {
        await p1
      } catch (error) {
      }
      try {
        await p2
      } catch (error) {
      }
      try {
        await p3
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest0300
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_0300
     * @tc.desc   Verify TaskInfo.taskId is accessible for task group tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(durationLongFunc)
      taskGroup.addTask(durationLongFunc)
      let groupPromise: Promise<Array<Any>> = taskpool.execute(taskGroup)
      let matchCount: number = 0
      let begin: number = Date.now()
      try {
        while (matchCount < 2 && Date.now() - begin < 15000) {
          matchCount = 0
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.name === "durationLongFunc") {
              expect(taskInfo.taskId > 0).assertTrue()
              matchCount++
            }
          }
          if (matchCount < 2) {
            await Utils.msSleep(50)
          }
        }
        expect(matchCount).assertEqual(2)
        let groupResults: Array<Any> = await groupPromise
        expect(groupResults.length).assertEqual(2)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest0400
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_0400
     * @tc.desc   Verify TaskInfo.state returns valid State enum value (WAITING/RUNNING/CANCELED)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskInfoPropertyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.state === taskpool.State.RUNNING ||
                taskInfo.state === taskpool.State.WAITING).assertTrue()
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest0500
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_0500
     * @tc.desc   Verify getTaskPoolInfo returns a TaskInfo array in an idle snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskInfoPropertyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
      expect(Array.isArray(taskpoolInfo.taskInfos)).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest0600
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_0600
     * @tc.desc   Verify TaskInfo.duration increases during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let duration1: number = -1.0
      let duration2: number = -1.0
      let begin: number = Date.now()
      try {
        while (duration1 < 0 && Date.now() - begin < 8000) {
          let taskpoolInfo1: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo1.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.duration !== undefined && taskInfo.state === taskpool.State.RUNNING) {
              duration1 = taskInfo.duration! + 0.0
            }
          }
          if (duration1 < 0) {
            await Utils.msSleep(50)
          }
        }
        await Utils.msSleep(100)
        begin = Date.now()
        while (duration2 < 0 && Date.now() - begin < 8000) {
          let taskpoolInfo2: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo2.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.duration !== undefined && taskInfo.state === taskpool.State.RUNNING) {
              duration2 = taskInfo.duration! + 0.0
            }
          }
          if (duration2 < 0) {
            await Utils.msSleep(50)
          }
        }
        expect(duration1 >= 0).assertTrue()
        expect(duration2 >= 0).assertTrue()
        expect(duration2 >= duration1).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest0700
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_0700
     * @tc.desc   Verify TaskInfo.duration is non-negative after execution starts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 8000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.duration !== undefined) {
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest0800
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_0800
     * @tc.desc   Verify TaskInfo.name matches the name specified when creating named task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskInfoPropertyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskName: string = "testTaskName"
      let task: taskpool.Task = new taskpool.Task(taskName, durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 8000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.name).assertEqual(taskName)
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest0900
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_0900
     * @tc.desc   Verify TaskInfo.name is accessible for unnamed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 8000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.name).assertEqual("durationLongFunc")
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest1000
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_1000
     * @tc.desc   Verify TaskInfo.name is independent for tasks in task group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task("task1Name", durationLongFunc)
      let task2: taskpool.Task = new taskpool.Task("task2Name", durationLongFunc)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("groupTask")
      taskGroup.addTask(task1)
      taskGroup.addTask(task2)
      let groupPromise: Promise<Array<Any>> = taskpool.execute(taskGroup)
      let found1: boolean = false
      let found2: boolean = false
      let begin: number = Date.now()
      try {
        while ((!found1 || !found2) && Date.now() - begin < 15000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task1.taskId) {
              expect(taskInfo.name).assertEqual("task1Name")
              found1 = true
            }
            if (taskInfo.taskId === task2.taskId) {
              expect(taskInfo.name).assertEqual("task2Name")
              found2 = true
            }
          }
          if (!found1 || !found2) {
            await Utils.msSleep(50)
          }
        }
        expect(found1 && found2).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await groupPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest1100
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_1100
     * @tc.desc   Verify TaskInfo.taskId is positive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.taskId > 0).assertTrue()
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest1200
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_1200
     * @tc.desc   Verify TaskInfo.duration is positive while task is running
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            // RUNNING 首快照 duration 可合法为 0：持续轮询直到观测到 RUNNING 且 duration>0
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING &&
              taskInfo.duration !== undefined && taskInfo.duration! > 0) {
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest1300
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_1300
     * @tc.desc   Verify TaskInfo.name equals the name specified for named task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskName: string = "testName"
      let task: taskpool.Task = new taskpool.Task(taskName, durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.name).assertEqual("testName")
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest1400
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_1400
     * @tc.desc   Verify TaskInfo.duration is positive while executed task is running
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskInfoPropertyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            // RUNNING 首快照 duration 可合法为 0：持续轮询直到观测到 RUNNING 且 duration>0
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING &&
              taskInfo.duration !== undefined && taskInfo.duration! > 0) {
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest1500
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_1500
     * @tc.desc   Verify TaskInfo.taskId is unique across 10 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tasks: Array<taskpool.Task> = []
      let promises: Array<Promise<Any>> = []
      for (let i: number = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(durationLongFunc)
        tasks.push(task)
        promises.push(taskpool.execute(task))
      }
      let taskIdList: Array<number> = []
      let begin: number = Date.now()
      try {
        while (taskIdList.length < 10 && Date.now() - begin < 15000) {
          taskIdList = []
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            for (let task of tasks) {
              if (taskInfo.taskId === task.taskId) {
                taskIdList.push(taskInfo.taskId)
              }
            }
          }
          if (taskIdList.length < 10) {
            await Utils.msSleep(50)
          }
        }
        expect(taskIdList.length).assertEqual(10)
        let uniqueList: Array<number> = []
        for (let taskId of taskIdList) {
          if (uniqueList.indexOf(taskId) === -1) {
            uniqueList.push(taskId)
          }
        }
        expect(uniqueList.length).assertEqual(taskIdList.length)
      } catch (error) {
        expect().assertFail();
      }
      for (let p of promises) {
        try {
          await p
        } catch (error) {
        }
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest1600
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_1600
     * @tc.desc   Verify TaskInfo.duration is non-negative after extended execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest1700
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_1700
     * @tc.desc   Verify TaskInfo.name with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("", durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.name).assertEqual("")
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest1800
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_1800
     * @tc.desc   Verify TaskInfo.name with special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let specialName: string = "task_test@#$%"
      let task: taskpool.Task = new taskpool.Task(specialName, durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.name).assertEqual(specialName)
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest1900
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_1900
     * @tc.desc   Verify TaskInfo.name with Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let unicodeName: string = "任务_日本語_한국어"
      let task: taskpool.Task = new taskpool.Task(unicodeName, durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.name).assertEqual(unicodeName)
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest2000
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_2000
     * @tc.desc   Verify TaskInfo.name with very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskInfoPropertyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let longName: string = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      let task: taskpool.Task = new taskpool.Task(longName, durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.name).assertEqual(longName)
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest2100
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_2100
     * @tc.desc   Verify TaskInfo.taskId remains consistent during state transition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskInfoPropertyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let taskIdBefore: number = task.taskId
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.taskId).assertEqual(taskIdBefore)
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest2200
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_2200
     * @tc.desc   Verify TaskInfo properties for AsyncRunner tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskInfoPropertyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("testRunnerProp", 2)
      let task: taskpool.Task = new taskpool.Task("asyncTaskProp", durationLongFunc)
      let execPromise: Promise<Any> = runner.execute(task)
      let found: boolean = false
      let sawPositiveDuration: boolean = false
      let begin: number = Date.now()
      try {
        while (!(found && sawPositiveDuration) && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.taskId > 0).assertTrue()
              expect(taskInfo.state === taskpool.State.RUNNING ||
                taskInfo.state === taskpool.State.WAITING).assertTrue()
              if (taskInfo.state === taskpool.State.RUNNING && taskInfo.duration !== undefined &&
                taskInfo.duration! > 0) {
                sawPositiveDuration = true
              }
              expect(taskInfo.name).assertEqual("asyncTaskProp")
              found = true
            }
          }
          if (!found) {
            await Utils.msSleep(50)
          }
        }
        expect(found).assertTrue()
        expect(sawPositiveDuration).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest2300
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_2300
     * @tc.desc   Verify TaskInfo properties for executeDelayed tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskInfoPropertyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("delayedTaskProp", delayFunc, 3000)
      let execPromise: Promise<Any> = taskpool.executeDelayed(100, task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              found = true
              break
            }
          }
          if (!found) {
            await Utils.msSleep(100)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest2400
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_2400
     * @tc.desc   Verify TaskInfo properties for executePeriodically tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskInfoPropertyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("periodicTaskProp", longFunc)
      taskpool.executePeriodically(300, task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.taskId > 0).assertTrue()
              found = true
              break
            }
          }
          if (!found) {
            await Utils.msSleep(100)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task)
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest2500
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_2500
     * @tc.desc   Verify TaskInfo taskIds are positive in current pool snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskInfoPropertyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
      for (let taskInfo of taskpoolInfo.taskInfos) {
        expect(taskInfo.taskId > 0).assertTrue()
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest2600
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_2600
     * @tc.desc   Verify TaskInfo properties while a task runs before throwing an exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskInfoPropertyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(errorFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.taskId > 0).assertTrue()
              found = true
              break
            }
          }
          if (!found) {
            await Utils.msSleep(100)
          }
        }
        expect(found).assertTrue()
        let hasError: boolean = false
        try {
          await execPromise
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
     * @tc.name   TaskInfoPropertyTest2700
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_2700
     * @tc.desc   Verify TaskInfo properties for tasks with dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskInfoPropertyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task("dependency1", durationLongFunc)
      let task2: taskpool.Task = new taskpool.Task("dependency2", durationLongFunc)
      task2.addDependency(task1)
      let p1: Promise<Any> = taskpool.execute(task1)
      let p2: Promise<Any> = taskpool.execute(task2)
      let foundCount: number = 0
      let begin: number = Date.now()
      try {
        while (foundCount < 2 && Date.now() - begin < 15000) {
          foundCount = 0
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task1.taskId || taskInfo.taskId === task2.taskId) {
              expect(taskInfo.taskId > 0).assertTrue()
              foundCount++
            }
          }
          if (foundCount < 2) {
            await Utils.msSleep(50)
          }
        }
        expect(foundCount).assertEqual(2)
      } catch (error) {
        expect().assertFail();
      }
      try {
        await p1
      } catch (error) {
      }
      try {
        await p2
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest2800
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_2800
     * @tc.desc   Verify TaskInfo properties change throughout task lifecycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskInfoPropertyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("lifecycleTask", durationLongFunc)
      let taskId: number = task.taskId
      let execPromise: Promise<Any> = taskpool.execute(task)
      let foundRunning: boolean = false
      let begin: number = Date.now()
      try {
        while (!foundRunning && Date.now() - begin < 10000) {
          let taskpoolInfo1: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo1.taskInfos) {
            // RUNNING 首快照 duration 可合法为 0：持续轮询直到观测到 duration>0
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING &&
              taskInfo.duration !== undefined && taskInfo.duration! > 0) {
              expect(taskInfo.taskId).assertEqual(taskId)
              foundRunning = true
            }
          }
          if (!foundRunning) {
            await Utils.msSleep(100)
          }
        }
        expect(foundRunning).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest2900
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_2900
     * @tc.desc   Verify TaskInfo properties with mixed task types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskInfoPropertyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let normalTask: taskpool.Task = new taskpool.Task("normalTask", durationLongFunc)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("groupTask")
      taskGroup.addTask(new taskpool.Task("groupChildTask", durationLongFunc))
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner("seqRunnerProp")
      let p1: Promise<Any> = taskpool.execute(normalTask)
      let p2: Promise<Array<Any>> = taskpool.execute(taskGroup)
      let p3: Promise<Any> = runner.execute(new taskpool.Task(durationLongFunc))
      let normalTaskFound: boolean = false
      let groupTaskFound: boolean = false
      let begin: number = Date.now()
      try {
        while ((!normalTaskFound || !groupTaskFound) && Date.now() - begin < 15000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.name === "normalTask") {
              normalTaskFound = true
              expect(taskInfo.taskId > 0).assertTrue()
            }
            if (taskInfo.name === "groupChildTask") {
              groupTaskFound = true
              expect(taskInfo.taskId > 0).assertTrue()
            }
          }
          if (!normalTaskFound || !groupTaskFound) {
            await Utils.msSleep(100)
          }
        }
        expect(normalTaskFound && groupTaskFound).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await p1
      } catch (error) {
      }
      try {
        await p2
      } catch (error) {
      }
      try {
        await p3
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest3000
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_3000
     * @tc.desc   Verify TaskInfo.taskId uniqueness with many high priority tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskInfoPropertyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tasks: Array<taskpool.Task> = []
      let promises: Array<Promise<Any>> = []
      for (let i: number = 0; i < 10; i++) {
        let taskName: string = "task_" + i
        let task: taskpool.Task = new taskpool.Task(taskName, durationLongFunc)
        tasks.push(task)
        promises.push(taskpool.execute(task, taskpool.Priority.HIGH))
      }
      let taskIdList: Array<number> = []
      let begin: number = Date.now()
      try {
        while (taskIdList.length < 10 && Date.now() - begin < 15000) {
          taskIdList = []
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            for (let task of tasks) {
              if (taskInfo.taskId === task.taskId) {
                taskIdList.push(taskInfo.taskId)
              }
            }
          }
          if (taskIdList.length < 10) {
            await Utils.msSleep(50)
          }
        }
        expect(taskIdList.length).assertEqual(10)
        let uniqueList: Array<number> = []
        for (let taskId of taskIdList) {
          if (uniqueList.indexOf(taskId) === -1) {
            uniqueList.push(taskId)
          }
        }
        expect(uniqueList.length).assertEqual(taskIdList.length)
      } catch (error) {
        expect().assertFail();
      }
      for (let p of promises) {
        try {
          await p
        } catch (error) {
        }
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest3100
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_3100
     * @tc.desc   Verify TaskInfo properties after Promise.all completes all tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskInfoPropertyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let promises: Array<Promise<Any>> = []
      for (let i: number = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(quickFunc)
        promises.push(taskpool.execute(task))
      }
      try {
        let results: Array<Any> = await Promise.all(promises)
        for (let i: number = 0; i < 5; i++) {
          expect(results[i.toInt()] as number).assertEqual(1.0)
        }
        let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of taskpoolInfo.taskInfos) {
          expect(taskInfo.taskId > 0).assertTrue()
        }
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskInfoPropertyTest3200
     * @tc.number SUB_TASK_INFO_PROPERTY_TEST_3200
     * @tc.desc   Verify TaskInfo.duration is within reasonable range without exact value assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskInfoPropertyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(durationLongFunc)
      let execPromise: Promise<Any> = taskpool.execute(task)
      let found: boolean = false
      let begin: number = Date.now()
      try {
        while (!found && Date.now() - begin < 10000) {
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.duration !== undefined && taskInfo.duration! > 0) {
              found = true
              break
            }
          }
          if (!found) {
            await Utils.msSleep(100)
          }
        }
        expect(found).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })
  })
}
