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

import { describe, beforeAll, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

function addNum(num1: number, num2: number): number {
  return num1 + num2 + 0.0;
}

function longRunningTask(ms: number): number {
  let start: number = Date.now();
  while (Date.now() - start < ms) {}
  return ms + 0.0;
}

function simpleReturnTask(args: number): number {
  return args + 0.0;
}

function getPoolInfoInWorker(): boolean {
  let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
  return Array.isArray(info.threadInfos) && Array.isArray(info.taskInfos);
}

export default function TaskpoolGetTaskPoolInfoTest(): void {
  describe('TaskpoolGetTaskPoolInfoTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest0100
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_0100
     * @tc.desc   Verify returned TaskPoolInfo has threadInfos and taskInfos arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolGetTaskPoolInfoTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info.threadInfos)).assertTrue();
      expect(Array.isArray(info.taskInfos)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest0200
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_0200
     * @tc.desc   Verify empty pool returns valid taskInfos array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolGetTaskPoolInfoTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info.taskInfos)).assertTrue();
      expect(Array.isArray(info.threadInfos)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest0300
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_0300
     * @tc.desc   Verify ThreadInfo.taskIds is optional array when present during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500);
      let execPromise: Promise<Any> = taskpool.execute(task);
      try {
        await Utils.msSleep(100);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.taskIds !== undefined) {
            expect(Array.isArray(threadInfo.taskIds!)).assertTrue();
            for (let taskId of threadInfo.taskIds!) {
              expect(taskId > 0).assertTrue();
            }
          }
        }
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
     * @tc.name   TaskpoolGetTaskPoolInfoTest0400
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_0400
     * @tc.desc   Verify getTaskPoolInfo reports an active state during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000);
      let execPromise: Promise<Any> = taskpool.execute(task);
      let foundActive: boolean = false;
      let begin: number = Date.now();
      try {
        while (!foundActive && Date.now() - begin < 10000) {
          let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === task.taskId &&
              (taskInfo.state === taskpool.State.WAITING || taskInfo.state === taskpool.State.RUNNING)) {
              foundActive = true;
              break;
            }
          }
          if (!foundActive) {
            await Utils.msSleep(100);
          }
        }
        expect(foundActive).assertTrue();
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
     * @tc.name   TaskpoolGetTaskPoolInfoTest0500
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_0500
     * @tc.desc   Verify TaskInfo.duration is reported while the task is in the pool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000);
      let execPromise: Promise<Any> = taskpool.execute(task);
      let foundDuration: boolean = false;
      let begin: number = Date.now();
      try {
        while (!foundDuration && Date.now() - begin < 10000) {
          let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.duration !== undefined) {
              foundDuration = true;
              break;
            }
          }
          if (!foundDuration) {
            await Utils.msSleep(100);
          }
        }
        expect(foundDuration).assertTrue();
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
     * @tc.name   TaskpoolGetTaskPoolInfoTest0600
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_0600
     * @tc.desc   Verify TaskInfo.name matches the executed task name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000);
      let execPromise: Promise<Any> = taskpool.execute(task);
      let found: boolean = false;
      let begin: number = Date.now();
      try {
        while (!found && Date.now() - begin < 10000) {
          let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.name).assertEqual("longRunningTask");
              found = true;
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
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
     * @tc.name   TaskpoolGetTaskPoolInfoTest0700
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_0700
     * @tc.desc   Verify multiple calls return independent objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let info1: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let info2: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(info1 !== info2).assertTrue();
      expect(Array.isArray(info1.threadInfos)).assertTrue();
      expect(Array.isArray(info2.threadInfos)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest0800
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_0800
     * @tc.desc   Verify running task reflected in TaskPoolInfo taskInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000);
      let execPromise: Promise<Any> = taskpool.execute(task);
      let found: boolean = false;
      let begin: number = Date.now();
      try {
        while (!found && Date.now() - begin < 10000) {
          let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              found = true;
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
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
     * @tc.name   TaskpoolGetTaskPoolInfoTest0900
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_0900
     * @tc.desc   Verify TaskPoolInfo during TaskGroup execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let task2: taskpool.Task = new taskpool.Task(addNum, 3.0, 4.0);
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      let execPromise: Promise<Array<Any>> = taskpool.execute(taskGroup);
      try {
        await Utils.msSleep(100);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.taskInfos)).assertTrue();
        let results: Array<Any> = await execPromise;
        expect(results.length).assertEqual(2);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest1000
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_1000
     * @tc.desc   Verify TaskPoolInfo during SequenceRunner execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500);
      let execPromise: Promise<Any> = runner.execute(task);
      try {
        await Utils.msSleep(100);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.taskInfos)).assertTrue();
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
     * @tc.name   TaskpoolGetTaskPoolInfoTest1100
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_1100
     * @tc.desc   Verify TaskPoolInfo during AsyncRunner execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2);
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500);
      let execPromise: Promise<Any> = runner.execute(task);
      try {
        await Utils.msSleep(100);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.taskInfos)).assertTrue();
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
     * @tc.name   TaskpoolGetTaskPoolInfoTest1200
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_1200
     * @tc.desc   Verify TaskPoolInfo with HIGH priority task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000);
      let execPromise: Promise<Any> = taskpool.execute(task, taskpool.Priority.HIGH);
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (info.threadInfos.length === 0 && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          if (info.threadInfos.length === 0) {
            await Utils.msSleep(50);
          }
        }
        expect(info.threadInfos.length > 0).assertTrue();
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.priority !== undefined) {
            let p: number = threadInfo.priority!;
            expect(p === taskpool.Priority.HIGH || p === taskpool.Priority.MEDIUM ||
              p === taskpool.Priority.LOW || p === taskpool.Priority.IDLE).assertTrue();
          }
        }
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
     * @tc.name   TaskpoolGetTaskPoolInfoTest1300
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_1300
     * @tc.desc   Verify TaskPoolInfo with LOW priority task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000);
      let execPromise: Promise<Any> = taskpool.execute(task, taskpool.Priority.LOW);
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (info.threadInfos.length === 0 && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          if (info.threadInfos.length === 0) {
            await Utils.msSleep(50);
          }
        }
        expect(info.threadInfos.length > 0).assertTrue();
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.priority !== undefined) {
            let p: number = threadInfo.priority!;
            expect(p === taskpool.Priority.HIGH || p === taskpool.Priority.MEDIUM ||
              p === taskpool.Priority.LOW || p === taskpool.Priority.IDLE).assertTrue();
          }
        }
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
     * @tc.name   TaskpoolGetTaskPoolInfoTest1400
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_1400
     * @tc.desc   Verify TaskPoolInfo with 10 concurrent tasks for large scale correctness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tasks: taskpool.Task[] = [];
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 10; i++) {
        let t: taskpool.Task = new taskpool.Task(simpleReturnTask, i);
        tasks.push(t);
        promises.push(taskpool.execute(t));
      }
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (info.threadInfos.length === 0 && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          if (info.threadInfos.length === 0) {
            await Utils.msSleep(50);
          }
        }
        expect(info.threadInfos.length > 0).assertTrue();
        let results: Array<Any> = await Promise.all(promises);
        for (let i: number = 0; i < 10; i++) {
          expect(results[i.toInt()] as number).assertEqual(i);
        }
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest1500
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_1500
     * @tc.desc   Verify getTaskPoolInfo before task execution returns valid info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let infoBefore: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(infoBefore.threadInfos)).assertTrue();
      expect(Array.isArray(infoBefore.taskInfos)).assertTrue();
      try {
        let result: number = (await taskpool.execute(task)) as number;
        expect(result).assertEqual(3.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest1600
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_1600
     * @tc.desc   Verify getTaskPoolInfo after task execution completes returns valid info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      try {
        let result: number = (await taskpool.execute(task)) as number;
        expect(result).assertEqual(3.0);
        let infoAfter: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(infoAfter.threadInfos)).assertTrue();
        expect(Array.isArray(infoAfter.taskInfos)).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest1700
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_1700
     * @tc.desc   Verify TaskPoolInfo with multiple concurrent tasks contains thread info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 3000);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 3000);
      let task3: taskpool.Task = new taskpool.Task(longRunningTask, 3000);
      let p1: Promise<Any> = taskpool.execute(task1);
      let p2: Promise<Any> = taskpool.execute(task2);
      let p3: Promise<Any> = taskpool.execute(task3);
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (info.threadInfos.length === 0 && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          if (info.threadInfos.length === 0) {
            await Utils.msSleep(50);
          }
        }
        expect(info.threadInfos.length > 0).assertTrue();
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
     * @tc.name   TaskpoolGetTaskPoolInfoTest1800
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_1800
     * @tc.desc   Verify 100 high-frequency getTaskPoolInfo calls are stable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      for (let i: number = 0; i < 100; i++) {
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.threadInfos)).assertTrue();
        expect(Array.isArray(info.taskInfos)).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest1900
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_1900
     * @tc.desc   Verify getTaskPoolInfo concurrent with taskpool.execute does not interfere
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 10.0, 20.0);
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      try {
        let result: number = (await taskpool.execute(task)) as number;
        expect(Array.isArray(info.threadInfos)).assertTrue();
        expect(result).assertEqual(30.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest2000
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_2000
     * @tc.desc   Verify consecutive calls return consistent data structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let info1: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let info2: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let info3: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info1.threadInfos)).assertTrue();
      expect(Array.isArray(info2.threadInfos)).assertTrue();
      expect(Array.isArray(info3.threadInfos)).assertTrue();
      expect(Array.isArray(info1.taskInfos)).assertTrue();
      expect(Array.isArray(info2.taskInfos)).assertTrue();
      expect(Array.isArray(info3.taskInfos)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest2100
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_2100
     * @tc.desc   Verify integration with execute reflects task state before and after
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let infoBefore: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(infoBefore.threadInfos)).assertTrue();
      let task: taskpool.Task = new taskpool.Task(addNum, 5.0, 10.0);
      try {
        let result: number = (await taskpool.execute(task)) as number;
        expect(result).assertEqual(15.0);
        let infoAfter: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(infoAfter.threadInfos)).assertTrue();
        expect(infoBefore !== infoAfter).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest2200
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_2200
     * @tc.desc   Verify integration with cancel reflects valid state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000);
      let execPromise: Promise<Any> = taskpool.execute(task);
      let foundBeforeCancel: boolean = false;
      let begin: number = Date.now();
      try {
        while (!foundBeforeCancel && Date.now() - begin < 10000) {
          let infoBeforeCancel: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          for (let taskInfo of infoBeforeCancel.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              foundBeforeCancel = true;
              break;
            }
          }
          if (!foundBeforeCancel) {
            await Utils.msSleep(100);
          }
        }
        expect(foundBeforeCancel).assertTrue();
        try {
          taskpool.cancel(task);
        } catch (e) {
          // Cancel may throw depending on task execution state
        }
        try {
          await execPromise
        } catch (error) {
        }
        let infoAfterCancel: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let clearedOrCanceled: boolean = true;
        for (let taskInfo of infoAfterCancel.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state !== taskpool.State.CANCELED) {
            clearedOrCanceled = false;
          }
        }
        expect(clearedOrCanceled).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest2300
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_2300
     * @tc.desc   Verify new Task not in taskInfos until execute is called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskPoolInfoTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info.taskInfos)).assertTrue();
      let foundBeforeExecute: boolean = false;
      for (let taskInfo of info.taskInfos) {
        if (taskInfo.taskId === task.taskId) {
          foundBeforeExecute = true;
        }
      }
      expect(foundBeforeExecute).assertFalse();
      try {
        let result: number = (await taskpool.execute(task)) as number;
        expect(result).assertEqual(3.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest2400
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_2400
     * @tc.desc   Verify TaskGroup tasks reflected in TaskPoolInfo during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      let execPromise: Promise<Array<Any>> = taskpool.execute(taskGroup);
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (info.threadInfos.length === 0 && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          if (info.threadInfos.length === 0) {
            await Utils.msSleep(50);
          }
        }
        expect(info.threadInfos.length > 0).assertTrue();
        expect(Array.isArray(info.taskInfos)).assertTrue();
        let results: Array<Any> = await execPromise;
        expect(results.length).assertEqual(2);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskPoolInfoTest2500
     * @tc.number SUB_TASKPOOL_GETTASKPOOLINFO_TEST_2500
     * @tc.desc   Verify getTaskPoolInfo called from worker thread returns valid info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskPoolInfoTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let workerTask: taskpool.Task = new taskpool.Task(getPoolInfoInWorker);
      try {
        let result: boolean = (await taskpool.execute(workerTask)) as boolean;
        expect(result).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
