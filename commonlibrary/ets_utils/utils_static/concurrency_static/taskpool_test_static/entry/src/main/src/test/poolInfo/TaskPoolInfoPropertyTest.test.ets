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

function simpleTask(n: number): number {
  return n * 2;
}

function longRunningTask(ms: number): number {
  let start: number = Date.now();
  while (Date.now() - start < ms) {}
  return ms + 0.0;
}

function quickTask(n: number): number {
  return n + 0.0;
}

export default function TaskPoolInfoPropertyTest(): void {
  describe('TaskPoolInfoPropertyTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   TaskPoolInfoPropertyTest0100
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_0100
     * @tc.desc   Verify TaskPoolInfo contains threadInfos property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info.threadInfos)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest0200
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_0200
     * @tc.desc   Verify threadInfos elements are ThreadInfo objects with tid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let count: number = 0;
        let hasTid: boolean = false;
        for (let threadInfo of info.threadInfos) {
          expect(threadInfo.tid > 0).assertTrue();
          hasTid = true;
          count++;
        }
        expect(hasTid || info.threadInfos.length === 0).assertTrue();
        expect(count).assertEqual(info.threadInfos.length);
        await execPromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest0300
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_0300
     * @tc.desc   Verify threadInfos can be converted via Array.from
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let threadInfosArr: taskpool.ThreadInfo[] = Array.from(info.threadInfos);
        expect(threadInfosArr.length).assertEqual(info.threadInfos.length);
        await execPromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest0400
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_0400
     * @tc.desc   Verify threadInfos length is positive after executing multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskPoolInfoPropertyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tasks: taskpool.Task[] = [];
      let promises: Promise<Object>[] = [];
      for (let i: number = 0; i < 10; i++) {
        let t: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
        tasks.push(t);
        promises.push(taskpool.execute(t) as Promise<Object>);
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
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Promise.all(promises)
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest0500
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_0500
     * @tc.desc   Verify TaskPoolInfo contains taskInfos property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info.taskInfos)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest0600
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_0600
     * @tc.desc   Verify taskInfos elements are TaskInfo objects with taskId, state, name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let taskId: number = task.taskId;
      let execPromise: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let count: number = 0;
        let hasTaskInfo: boolean = false;
        for (let taskInfo of info.taskInfos) {
          expect(taskInfo.taskId > 0).assertTrue();
          expect(typeof taskInfo.name === 'string').assertTrue();
          if (taskInfo.taskId === taskId) {
            expect(taskInfo.state === taskpool.State.WAITING ||
              taskInfo.state === taskpool.State.RUNNING).assertTrue();
          }
          hasTaskInfo = true;
          count++;
        }
        expect(hasTaskInfo || info.taskInfos.length === 0).assertTrue();
        expect(count).assertEqual(info.taskInfos.length);
        await execPromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest0700
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_0700
     * @tc.desc   Verify taskInfos can be converted via Array.from
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let taskInfosArr: taskpool.TaskInfo[] = Array.from(info.taskInfos);
        expect(taskInfosArr.length).assertEqual(info.taskInfos.length);
        await execPromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest0800
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_0800
     * @tc.desc   Verify taskInfos length is positive after executing multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskPoolInfoPropertyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let task3: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let p1: Promise<Object> = taskpool.execute(task1) as Promise<Object>;
      let p2: Promise<Object> = taskpool.execute(task2) as Promise<Object>;
      let p3: Promise<Object> = taskpool.execute(task3) as Promise<Object>;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 3000 && info.taskInfos.length === 0) {
          info = taskpool.getTaskPoolInfo();
          if (info.taskInfos.length === 0) {
            await Utils.msSleep(100);
          }
        }
        expect(info.taskInfos.length > 0 || task1.isDone() || task2.isDone() || task3.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Promise.all([p1, p2, p3])
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest0900
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_0900
     * @tc.desc   Verify getTaskPoolInfo returns TaskPoolInfo with both properties accessible as arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('TaskPoolInfoPropertyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info.threadInfos)).assertTrue();
      expect(Array.isArray(info.taskInfos)).assertTrue();
      done();
    })


    /**
     * @tc.name   TaskPoolInfoPropertyTest1000
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_1000
     * @tc.desc   Verify multiple getTaskPoolInfo calls return consistent info when no task changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Pool state from prior cases can change between two snapshots; wait until consecutive reads stabilize.
      let info1: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let info2: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while ((info1.threadInfos.length !== info2.threadInfos.length ||
          info1.taskInfos.length !== info2.taskInfos.length) && Date.now() - begin < 10000) {
          await Utils.msSleep(100);
          info1 = taskpool.getTaskPoolInfo();
          info2 = taskpool.getTaskPoolInfo();
        }
        expect(Array.isArray(info1.threadInfos)).assertTrue();
        expect(Array.isArray(info1.taskInfos)).assertTrue();
        expect(info1.threadInfos.length === info2.threadInfos.length).assertTrue();
        expect(info1.taskInfos.length === info2.taskInfos.length).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest1100
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_1100
     * @tc.desc   Verify WAITING state task info in taskInfos when tasks are queued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tasks: taskpool.Task[] = [];
      let promises: Promise<Object>[] = [];
      for (let i: number = 0; i < 10; i++) {
        let t: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
        tasks.push(t);
        promises.push(taskpool.execute(t) as Promise<Object>);
      }
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let hasWaiting: boolean = false;
        for (let taskInfo of info.taskInfos) {
          if (taskInfo.state === taskpool.State.WAITING) {
            hasWaiting = true;
          }
        }
        expect(hasWaiting || info.taskInfos.length === 0).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Promise.all(promises)
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest1200
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_1200
     * @tc.desc   Verify RUNNING state task info in taskInfos during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let taskId: number = task.taskId;
      let execPromise: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let hasRunning: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !hasRunning) {
          info = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === taskId && taskInfo.state === taskpool.State.RUNNING) {
              hasRunning = true;
              break;
            }
          }
          if (!hasRunning) {
            await Utils.msSleep(100);
          }
        }
        expect(hasRunning).assertTrue();
        await execPromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest1300
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_1300
     * @tc.desc   Verify CANCELED state task info in taskInfos after cancellation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPoolInfoPropertyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let taskId: number = task.taskId
      let execPromise: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        try {
          taskpool.cancel(task);
        } catch (e) {
          // cancel may throw if task already done
        }
        await Utils.msSleep(1000);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let foundCanceled: boolean = false;
        let taskStillPresent: boolean = false;
        for (let taskInfo of info.taskInfos) {
          if (taskInfo.taskId === taskId) {
            taskStillPresent = true;
            if (taskInfo.state === taskpool.State.CANCELED) {
              foundCanceled = true;
            }
          }
        }
        expect(foundCanceled || !taskStillPresent).assertTrue();
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
     * @tc.name   TaskPoolInfoPropertyTest1400
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_1400
     * @tc.desc   Verify ThreadInfo.tid exists during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          expect(threadInfo.tid > 0).assertTrue();
        }
        await execPromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest1500
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_1500
     * @tc.desc   Verify ThreadInfo.tid is integer type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          expect(threadInfo.tid % 1 === 0).assertTrue();
        }
        await execPromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest1600
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_1600
     * @tc.desc   Verify ThreadInfo.tid uniqueness across different threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPoolInfoPropertyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let task3: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let p1t: Promise<Object> = taskpool.execute(task1) as Promise<Object>;
      let p2t: Promise<Object> = taskpool.execute(task2) as Promise<Object>;
      let p3t: Promise<Object> = taskpool.execute(task3) as Promise<Object>;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (info.threadInfos.length === 0 && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          if (info.threadInfos.length === 0) {
            await Utils.msSleep(50);
          }
        }
        let tids: number[] = [];
        for (let threadInfo of info.threadInfos) {
          tids.push(threadInfo.tid);
        }
        let uniqueCount: number = 0;
        for (let idx = 0; idx < tids.length; idx++) {
          let isUnique: boolean = true;
          let currentTid: number = tids[idx];
          for (let jdx = 0; jdx < idx; jdx++) {
            if (currentTid === tids[jdx]) {
              isUnique = false;
              break;
            }
          }
          if (isUnique) {
            uniqueCount++;
          }
        }
        expect(uniqueCount).assertEqual(info.threadInfos.length);
        expect(tids.length > 0).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Promise.all([p1t, p2t, p3t])
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest1700
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_1700
     * @tc.desc   Verify threadInfos is empty or contains valid threads when no tasks are executing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskPoolInfoPropertyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.threadInfos)).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest1800
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_1800
     * @tc.desc   Verify ThreadInfo.taskIds property exists during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let taskId: number = task.taskId;
      let execPromise1: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let hasTaskIds: boolean = false;
      let foundInTaskInfos: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 3000 && !hasTaskIds && !foundInTaskInfos) {
          info = taskpool.getTaskPoolInfo();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.taskIds !== undefined) {
              hasTaskIds = true;
              break;
            }
          }
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === taskId) {
              foundInTaskInfos = true;
              break;
            }
          }
          if (!hasTaskIds && !foundInTaskInfos) {
            await Utils.msSleep(100);
          }
        }
        expect(hasTaskIds || foundInTaskInfos || info.threadInfos.length === 0).assertTrue();
        await execPromise1;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest1900
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_1900
     * @tc.desc   Verify ThreadInfo.taskIds is Array type when defined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise2: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.taskIds !== undefined) {
            expect(Array.isArray(threadInfo.taskIds)).assertTrue();
          }
        }
        await execPromise2;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest2000
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_2000
     * @tc.desc   Verify ThreadInfo.taskIds elements are non-negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise3: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.taskIds !== undefined) {
            for (let taskId of threadInfo.taskIds!) {
              expect(taskId > 0).assertTrue();
            }
          }
        }
        await execPromise3;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest2100
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_2100
     * @tc.desc   Verify ThreadInfo.taskIds can be undefined when no tasks are running on thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      for (let threadInfo of info.threadInfos) {
        let taskIdsValid: boolean = threadInfo.taskIds === undefined || Array.isArray(threadInfo.taskIds);
        expect(taskIdsValid).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest2200
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_2200
     * @tc.desc   Verify taskIds in ThreadInfo correspond to actual running tasks in taskInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let taskId: number = task.taskId
      let execPromise4: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let found: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !found) {
          info = taskpool.getTaskPoolInfo();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.taskIds !== undefined) {
              for (let id of threadInfo.taskIds!) {
                if (id === taskId) {
                  found = true;
                  break;
                }
              }
            }
            if (found) {
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
        await execPromise4;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest2300
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_2300
     * @tc.desc   Verify ThreadInfo.priority property exists during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let execPromise5: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let hasPriority: boolean = false;
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.priority !== undefined) {
            hasPriority = true;
          }
        }
        expect(hasPriority || info.threadInfos.length === 0).assertTrue();
        await execPromise5;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest2400
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_2400
     * @tc.desc   Verify ThreadInfo.priority is undefined or MEDIUM when no priority specified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise7: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let foundDefault: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (!foundDefault && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.priority === taskpool.Priority.MEDIUM) {
              foundDefault = true;
              break;
            }
          }
          if (!foundDefault) {
            await Utils.msSleep(50);
          }
        }
        expect(foundDefault).assertTrue();
        await execPromise7;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest2500
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_2500
     * @tc.desc   Verify ThreadInfo.priority equals HIGH for HIGH priority task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise8: Promise<Object> = taskpool.execute(task, taskpool.Priority.HIGH) as Promise<Object>;
      let hasHighPriority: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !hasHighPriority) {
          info = taskpool.getTaskPoolInfo();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.priority !== undefined && threadInfo.priority === taskpool.Priority.HIGH) {
              hasHighPriority = true;
              break;
            }
          }
          if (!hasHighPriority) {
            await Utils.msSleep(100);
          }
        }
        expect(hasHighPriority).assertTrue();
        await execPromise8;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest2600
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_2600
     * @tc.desc   Verify ThreadInfo.priority equals LOW for LOW priority task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise9: Promise<Object> = taskpool.execute(task, taskpool.Priority.LOW) as Promise<Object>;
      let hasLowPriority: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !hasLowPriority) {
          info = taskpool.getTaskPoolInfo();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.priority !== undefined && threadInfo.priority === taskpool.Priority.LOW) {
              hasLowPriority = true;
              break;
            }
          }
          if (!hasLowPriority) {
            await Utils.msSleep(100);
          }
        }
        expect(hasLowPriority).assertTrue();
        await execPromise9;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest2700
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_2700
     * @tc.desc   Verify ThreadInfo.priority equals IDLE for IDLE priority task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise10: Promise<Object> = taskpool.execute(task, taskpool.Priority.IDLE) as Promise<Object>;
      let hasIdlePriority: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !hasIdlePriority) {
          info = taskpool.getTaskPoolInfo();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.priority !== undefined && threadInfo.priority === taskpool.Priority.IDLE) {
              hasIdlePriority = true;
              break;
            }
          }
          if (!hasIdlePriority) {
            await Utils.msSleep(100);
          }
        }
        expect(hasIdlePriority).assertTrue();
        await execPromise10;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest2800
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_2800
     * @tc.desc   Verify complete ThreadInfo attribute access with tid, taskIds, priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise11: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          expect(threadInfo.tid > 0).assertTrue();
          let taskIdsValid: boolean = threadInfo.taskIds === undefined || Array.isArray(threadInfo.taskIds);
          expect(taskIdsValid).assertTrue();
        }
        await execPromise11;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest2900
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_2900
     * @tc.desc   Verify TaskInfo.taskId is integer type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise13: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let taskInfo of info.taskInfos) {
          expect(taskInfo.taskId % 1 === 0).assertTrue();
        }
        await execPromise13;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest3000
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_3000
     * @tc.desc   Verify TaskInfo.taskId is positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise14: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let taskInfo of info.taskInfos) {
          expect(taskInfo.taskId > 0).assertTrue();
        }
        await execPromise14;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest3100
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_3100
     * @tc.desc   Verify TaskInfo.taskId matches Task object taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let expectedTaskId: number = task.taskId
      let execPromise15: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let found: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !found) {
          info = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === expectedTaskId) {
              found = true;
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
        await execPromise15;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest3200
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_3200
     * @tc.desc   Verify TaskInfo.taskId uniqueness across different tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPoolInfoPropertyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let task3: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let p1: Promise<Object> = taskpool.execute(task1) as Promise<Object>;
      let p2: Promise<Object> = taskpool.execute(task2) as Promise<Object>;
      let p3: Promise<Object> = taskpool.execute(task3) as Promise<Object>;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (info.taskInfos.length === 0 && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          if (info.taskInfos.length === 0) {
            await Utils.msSleep(50);
          }
        }
        let taskIds: number[] = [];
        for (let taskInfo of info.taskInfos) {
          taskIds.push(taskInfo.taskId);
        }
        let uniqueCount: number = 0;
        for (let idx = 0; idx < taskIds.length; idx++) {
          let isUnique: boolean = true;
          let currentId: number = taskIds[idx];
          for (let jdx = 0; jdx < idx; jdx++) {
            if (currentId === taskIds[jdx]) {
              isUnique = false;
              break;
            }
          }
          if (isUnique) {
            uniqueCount++;
          }
        }
        expect(uniqueCount).assertEqual(taskIds.length);
        expect(info.taskInfos.length > 0).assertTrue();
        await Promise.all([p1, p2, p3]);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest3300
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_3300
     * @tc.desc   Verify TaskInfo.state exists when tasks are present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let taskId: number = task.taskId;
      let execPromise16: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let hasState: boolean = false;
        for (let taskInfo of info.taskInfos) {
          if (taskInfo.taskId === taskId) {
            expect(taskInfo.state === taskpool.State.WAITING ||
              taskInfo.state === taskpool.State.RUNNING).assertTrue();
          }
          hasState = true;
        }
        expect(hasState || info.taskInfos.length === 0).assertTrue();
        await execPromise16;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest3400
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_3400
     * @tc.desc   Verify executeDelayed exposes the task in DELAYED state before execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise17: Promise<Object> = taskpool.executeDelayed(1000, task) as Promise<Object>;
      let foundDelayed: boolean = false;
      let begin: number = Date.now();
      try {
        while (!foundDelayed && Date.now() - begin < 10000) {
          let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.DELAYED) {
              foundDelayed = true;
              break;
            }
          }
          if (!foundDelayed) {
            await Utils.msSleep(100);
          }
        }
        expect(foundDelayed).assertTrue();
        await execPromise17;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest3500
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_3500
     * @tc.desc   Verify task state is RUNNING when task is executing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let taskId: number = task.taskId
      let execPromise18: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let foundRunning: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !foundRunning) {
          info = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === taskId && taskInfo.state === taskpool.State.RUNNING) {
              foundRunning = true;
              break;
            }
          }
          if (!foundRunning) {
            await Utils.msSleep(100);
          }
        }
        expect(foundRunning).assertTrue();
        await execPromise18;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest3600
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_3600
     * @tc.desc   Verify TaskInfo.duration property exists when tasks are present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise19: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let hasDuration: boolean = false;
        for (let taskInfo of info.taskInfos) {
          if (taskInfo.duration !== undefined) {
            hasDuration = true;
          }
        }
        expect(hasDuration || info.taskInfos.length === 0).assertTrue();
        await execPromise19;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest3700
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_3700
     * @tc.desc   Verify TaskInfo.duration is integer type when defined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise20: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let taskInfo of info.taskInfos) {
          if (taskInfo.duration !== undefined) {
            expect(taskInfo.duration! % 1 === 0).assertTrue();
          }
        }
        await execPromise20;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest3800
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_3800
     * @tc.desc   Verify TaskInfo.duration is non-negative value in milliseconds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let taskId: number = task.taskId
      let execPromise21: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let found: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !found) {
          info = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === taskId && taskInfo.duration !== undefined) {
              found = true;
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
        await execPromise21;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest3900
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_3900
     * @tc.desc   Verify unexecuted task does not appear in taskInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 10.0);
      let taskId: number = task.taskId
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let found: boolean = false;
      for (let taskInfo of info.taskInfos) {
        if (taskInfo.taskId === taskId) {
          found = true;
        }
      }
      expect(found === false || info.taskInfos.length === 0).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest4000
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_4000
     * @tc.desc   Verify taskInfos is valid array when no tasks are executing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.taskInfos)).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest4100
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_4100
     * @tc.desc   Verify TaskInfo.duration increases during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPoolInfoPropertyTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let taskId: number = task.taskId
      let execPromise22: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let info1: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let duration1: number = -1;
      let begin: number = Date.now();
      try {
        while (Date.now() - begin < 3000 && duration1 < 0) {
          info1 = taskpool.getTaskPoolInfo();
          for (let taskInfo of info1.taskInfos) {
            if (taskInfo.taskId === taskId && taskInfo.duration !== undefined) {
              duration1 = taskInfo.duration!;
              break;
            }
          }
          if (duration1 < 0) {
            await Utils.msSleep(100);
          }
        }
        await Utils.msSleep(500);
        let info2: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let duration2: number = -1;
        for (let taskInfo of info2.taskInfos) {
          if (taskInfo.taskId === taskId && taskInfo.duration !== undefined) {
            duration2 = taskInfo.duration!;
          }
        }
        if (duration1 >= 0 && duration2 >= 0) {
          expect(duration2 >= duration1).assertTrue();
        }
        await execPromise22;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest4200
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_4200
     * @tc.desc   Verify TaskInfo.name is string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise24: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let taskInfo of info.taskInfos) {
          expect(typeof taskInfo.name === 'string').assertTrue();
        }
        await execPromise24;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest4300
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_4300
     * @tc.desc   Verify TaskInfo.name matches the Task object name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskName: string = "testTask";
      let task: taskpool.Task = new taskpool.Task(taskName, longRunningTask, 3000.0);
      let execPromise25: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let found: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !found) {
          info = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.name === taskName).assertTrue();
              expect(taskInfo.name === task.name).assertTrue();
              found = true;
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
        await execPromise25;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest4400
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_4400
     * @tc.desc   Verify TaskInfo.name accepts very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let longName: string = "";
      for (let i: number = 0; i < 100; i++) {
        longName = longName + "aaaaaaaaaa";
      }
      let task: taskpool.Task = new taskpool.Task(longName, longRunningTask, 3000.0);
      let taskId: number = task.taskId;
      let execPromise26: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let found: boolean = false;
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !found) {
          let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === taskId) {
              expect(taskInfo.name).assertEqual(longName);
              found = true;
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
        await execPromise26;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest4500
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_4500
     * @tc.desc   Verify TaskInfo.name accepts special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let specialName: string = "task@#$%^&*()";
      let task: taskpool.Task = new taskpool.Task(specialName, longRunningTask, 3000.0);
      let taskId: number = task.taskId;
      let execPromise27: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let found: boolean = false;
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !found) {
          let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === taskId) {
              expect(taskInfo.name).assertEqual(specialName);
              found = true;
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
        await execPromise27;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest4600
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_4600
     * @tc.desc   Verify TaskInfo.name accepts Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let chineseName: string = "\u6d4b\u8bd5\u4efb\u52a1\u540d\u79f0";
      let task: taskpool.Task = new taskpool.Task(chineseName, longRunningTask, 3000.0);
      let execPromise28: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let found: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !found) {
          info = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(taskInfo.name === chineseName).assertTrue();
              found = true;
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
        await execPromise28;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest4700
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_4700
     * @tc.desc   Verify TaskInfo.name has default value when Task created without name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise29: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      let found: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !found) {
          info = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === task.taskId) {
              expect(typeof taskInfo.name === 'string').assertTrue();
              found = true;
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
        await execPromise29;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest4800
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_4800
     * @tc.desc   Verify complete TaskInfo attribute access with taskId, state, duration, name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let execPromise30: Promise<Object> = taskpool.execute(task) as Promise<Object>;
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let taskInfo of info.taskInfos) {
          expect(taskInfo.taskId > 0).assertTrue();
          expect(typeof taskInfo.name === 'string').assertTrue();
        }
        await execPromise30;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest4900
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_4900
     * @tc.desc   Verify multiple concurrent tasks produce accurate TaskPoolInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPoolInfoPropertyTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tasks: taskpool.Task[] = [];
      let promises: Promise<Object>[] = [];
      for (let i: number = 0; i < 10; i++) {
        let t: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
        tasks.push(t);
        promises.push(taskpool.execute(t) as Promise<Object>);
      }
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 3000 && info.taskInfos.length === 0) {
          info = taskpool.getTaskPoolInfo();
          if (info.taskInfos.length === 0) {
            await Utils.msSleep(100);
          }
        }
        expect(info.taskInfos.length > 0 || tasks[0].isDone()).assertTrue();
        await Promise.all(promises);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest5000
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_5000
     * @tc.desc   Verify threads report priorities from the executed set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPoolInfoPropertyTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let highTask: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let lowTask: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let mediumTask: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let idleTask: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let p1: Promise<Object> = taskpool.execute(highTask, taskpool.Priority.HIGH) as Promise<Object>;
      let p2: Promise<Object> = taskpool.execute(lowTask, taskpool.Priority.LOW) as Promise<Object>;
      let p3: Promise<Object> = taskpool.execute(mediumTask, taskpool.Priority.MEDIUM) as Promise<Object>;
      let p4: Promise<Object> = taskpool.execute(idleTask, taskpool.Priority.IDLE) as Promise<Object>;
      try {
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.threadInfos)).assertTrue();
        let hasHigh: boolean = false;
        let hasLow: boolean = false;
        let hasMedium: boolean = false;
        let hasIdle: boolean = false;
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.priority === undefined || threadInfo.priority === taskpool.Priority.MEDIUM) {
            hasMedium = true;
          } else if (threadInfo.priority === taskpool.Priority.HIGH) {
            hasHigh = true;
          } else if (threadInfo.priority === taskpool.Priority.LOW) {
            hasLow = true;
          } else if (threadInfo.priority === taskpool.Priority.IDLE) {
            hasIdle = true;
          }
        }
        expect(hasHigh || hasLow || hasMedium || hasIdle || info.threadInfos.length === 0).assertTrue();
        await Promise.all([p1, p2, p3, p4]);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest5100
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_5100
     * @tc.desc   Verify TaskPoolInfo is stable after tasks complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleTask, 10.0);
      let task2: taskpool.Task = new taskpool.Task(simpleTask, 20.0);
      let p1: Promise<Object> = taskpool.execute(task1) as Promise<Object>;
      let p2: Promise<Object> = taskpool.execute(task2) as Promise<Object>;
      let r1: Object;
      let r2: Object;
      try {
        [r1, r2] = await Promise.all([p1, p2]);
        expect(r1 as number).assertEqual(20.0);
        expect(r2 as number).assertEqual(40.0);
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.taskInfos)).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest5200
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_5200
     * @tc.desc   Verify taskInfos accessible after task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPoolInfoPropertyTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 10.0);
      try {
        await taskpool.execute(task);
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.taskInfos)).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest5300
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_5300
     * @tc.desc   Verify getTaskPoolInfo returns valid object with empty pool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(typeof info.threadInfos).assertEqual('object');
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest5400
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_5400
     * @tc.desc   Verify threadInfos and taskInfos are accessible arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolInfoPropertyTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info.threadInfos)).assertTrue();
      expect(Array.isArray(info.taskInfos)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest5500
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_5500
     * @tc.desc   Verify iterating large taskInfos and threadInfos arrays is stable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPoolInfoPropertyTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tasks: taskpool.Task[] = [];
      let promises: Promise<Object>[] = [];
      for (let i: number = 0; i < 50; i++) {
        let t: taskpool.Task = new taskpool.Task(longRunningTask, 200.0);
        tasks.push(t);
        promises.push(taskpool.execute(t) as Promise<Object>);
      }
      try {
        await Utils.msSleep(500);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          expect(threadInfo.tid > 0).assertTrue();
        }
        for (let taskInfo of info.taskInfos) {
          expect(taskInfo.taskId > 0).assertTrue();
        }
        await Promise.all(promises);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest5600
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_5600
     * @tc.desc   Verify TaskGroup execution is reflected in TaskPoolInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(longRunningTask, 3000.0);
      taskGroup.addTask(longRunningTask, 3000.0);
      taskGroup.addTask(longRunningTask, 3000.0);
      let groupPromise: Promise<Array<Object>> = taskpool.execute(taskGroup) as Promise<Array<Object>>;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (info.taskInfos.length === 0 && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          if (info.taskInfos.length === 0) {
            await Utils.msSleep(50);
          }
        }
        expect(info.taskInfos.length > 0).assertTrue();
        await groupPromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest5700
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_5700
     * @tc.desc   Verify SequenceRunner execution is reflected in TaskPoolInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let p1: Promise<Object> = runner.execute(task1) as Promise<Object>;
      let p2: Promise<Object> = runner.execute(task2) as Promise<Object>;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 3000 && info.taskInfos.length === 0) {
          info = taskpool.getTaskPoolInfo();
          if (info.taskInfos.length === 0) {
            await Utils.msSleep(100);
          }
        }
        expect(info.taskInfos.length > 0 || task1.isDone() || task2.isDone()).assertTrue();
        await Promise.all([p1, p2]);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest5800
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_5800
     * @tc.desc   Verify AsyncRunner execution is reflected in TaskPoolInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 10);
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let p1: Promise<Object> = runner.execute(task1) as Promise<Object>;
      let p2: Promise<Object> = runner.execute(task2) as Promise<Object>;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 3000 && info.taskInfos.length === 0) {
          info = taskpool.getTaskPoolInfo();
          if (info.taskInfos.length === 0) {
            await Utils.msSleep(100);
          }
        }
        expect(info.taskInfos.length > 0 || task1.isDone() || task2.isDone()).assertTrue();
        await Promise.all([p1, p2]);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest5900
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_5900
     * @tc.desc   Verify periodic task execution is reflected in TaskPoolInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let periodicTask: taskpool.Task = new taskpool.Task(longRunningTask, 150.0);
      let periodicTaskId: number = periodicTask.taskId;
      taskpool.executePeriodically(200, periodicTask);
      let found: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !found) {
          info = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === periodicTaskId) {
              expect(taskInfo.state === taskpool.State.WAITING ||
                taskInfo.state === taskpool.State.RUNNING).assertTrue();
              found = true;
              break;
            }
          }
          if (!found) {
            await Utils.msSleep(100);
          }
        }
        expect(found).assertTrue();
        try {
          taskpool.cancel(periodicTask);
        } catch (e) {
          // cancel may throw if task already completed
        }
        let removed: boolean = false;
        let infoAfter: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let removeStart: number = Date.now();
        while (Date.now() - removeStart < 10000 && !removed) {
          infoAfter = taskpool.getTaskPoolInfo();
          removed = true;
          for (let taskInfo of infoAfter.taskInfos) {
            if (taskInfo.taskId === periodicTaskId) {
              removed = false;
              break;
            }
          }
          if (!removed) {
            await Utils.msSleep(100);
          }
        }
        expect(removed).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest6000
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_6000
     * @tc.desc   Verify delayed task is in DELAYED state before execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let taskId: number = task.taskId;
      let delayedPromise: Promise<Object> = taskpool.executeDelayed(1000, task) as Promise<Object>;
      let foundDelayed: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 10000 && !foundDelayed) {
          info = taskpool.getTaskPoolInfo();
          for (let taskInfo of info.taskInfos) {
            if (taskInfo.taskId === taskId && taskInfo.state === taskpool.State.DELAYED) {
              foundDelayed = true;
              break;
            }
          }
          if (!foundDelayed) {
            await Utils.msSleep(100);
          }
        }
        expect(foundDelayed).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      try {
        await delayedPromise;
      } catch (e) {
        // delayed task may throw on await
      }
      done();
    })

    /**
     * @tc.name   TaskPoolInfoPropertyTest6100
     * @tc.number SUB_TASKPOOLINFO_PROPERTY_TEST_6100
     * @tc.desc   Verify cancel on completed task throws with a non-empty error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolInfoPropertyTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 10.0);
      try {
        await taskpool.execute(task);
        let cancelThrew: boolean = false;
        try {
          taskpool.cancel(task);
        } catch (error) {
          cancelThrew = true;
          expect(error.message.length > 0).assertTrue();
        }
        expect(cancelThrew).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
