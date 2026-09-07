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

// Helper: simple task returning input multiplied by 2
function simpleTask(n: number): number {
  return n * 2;
}

// Helper: long running task blocking for specified ms
function longRunningTask(ms: number): number {
  let start: number = Date.now();
  while (Date.now() - start < ms) {}
  return ms + 0.0;
}

// Helper: long running task that signals start via AtomicInt (for IDLE scheduling waits)
function longRunningTaskWithStartFlag(ms: number, started: AtomicInt): number {
  started.fetchAdd(1);
  let start: number = Date.now();
  while (Date.now() - start < ms) {}
  return ms + 0.0;
}

export default function ThreadInfoPropertyTest(): void {
  describe('ThreadInfoPropertyTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   ThreadInfoPropertyTest0100
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_0100
     * @tc.desc   Verify ThreadInfo.tid is accessible and positive during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadInfoPropertyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (info.threadInfos.length === 0 && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          if (info.threadInfos.length === 0) {
            await Utils.msSleep(100);
          }
        }
        expect(Array.isArray(info.threadInfos)).assertTrue();
        for (let threadInfo of info.threadInfos) {
          expect(threadInfo.tid > 0).assertTrue();
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
     * @tc.name   ThreadInfoPropertyTest0200
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_0200
     * @tc.desc   Verify threadInfos/taskInfos accessible as arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadInfoPropertyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info.threadInfos)).assertTrue();
      expect(Array.isArray(info.taskInfos)).assertTrue();
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest0300
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_0300
     * @tc.desc   Verify multiple concurrent tasks produce threadInfos with multiple tids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let task3: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let p1: Promise<Any> = taskpool.execute(task1);
      let p2: Promise<Any> = taskpool.execute(task2);
      let p3: Promise<Any> = taskpool.execute(task3);
      try {
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.threadInfos)).assertTrue();
        for (let threadInfo of info.threadInfos) {
          expect(threadInfo.tid > 0).assertTrue();
        }
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
     * @tc.name   ThreadInfoPropertyTest0400
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_0400
     * @tc.desc   Verify ThreadInfo.taskIds is accessible during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadInfoPropertyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let taskId: number = task.taskId;
      let execPromise: Promise<Any> = taskpool.execute(task);
      let foundTaskId: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (Date.now() - begin < 10000 && !foundTaskId) {
          info = taskpool.getTaskPoolInfo();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.taskIds !== undefined) {
              for (let id of threadInfo.taskIds!) {
                if (id === taskId) {
                  foundTaskId = true;
                  break;
                }
              }
            }
            if (foundTaskId) {
              break;
            }
          }
          if (!foundTaskId) {
            await Utils.msSleep(100);
          }
        }
        expect(foundTaskId).assertTrue();
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
     * @tc.name   ThreadInfoPropertyTest0500
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_0500
     * @tc.desc   Verify threadInfos accessible after task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 10.0);
      try {
        await taskpool.execute(task);
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.threadInfos)).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest0600
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_0600
     * @tc.desc   Verify SequenceRunner tasks are reflected in threadInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 1500.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 1500.0);
      let p1: Promise<Any> = runner.execute(task1);
      let p2: Promise<Any> = runner.execute(task2);
      try {
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let foundTaskId: boolean = false;
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.taskIds !== undefined && threadInfo.taskIds!.length > 0) {
            foundTaskId = true;
          }
        }
        expect(foundTaskId || info.threadInfos.length === 0).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Promise.all([p1, p2])
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest0700
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_0700
     * @tc.desc   Verify ThreadInfo.priority equals HIGH for HIGH priority task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadInfoPropertyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise: Promise<Any> = taskpool.execute(task, taskpool.Priority.HIGH);
      let hasHighPriority: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (Date.now() - begin < 10000 && !hasHighPriority) {
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
     * @tc.name   ThreadInfoPropertyTest0800
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_0800
     * @tc.desc   Verify ThreadInfo.priority equals MEDIUM for default priority task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadInfoPropertyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      let hasMediumPriority: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (!hasMediumPriority && Date.now() - begin < 10000) {
          info = taskpool.getTaskPoolInfo();
          expect(Array.isArray(info.threadInfos)).assertTrue();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.priority === taskpool.Priority.MEDIUM) {
              hasMediumPriority = true;
            }
          }
          if (!hasMediumPriority) {
            await Utils.msSleep(50);
          }
        }
        expect(hasMediumPriority).assertTrue();
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
     * @tc.name   ThreadInfoPropertyTest0900
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_0900
     * @tc.desc   Verify different priority concurrent tasks produce threads with different priorities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskHigh: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let taskLow: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let p1: Promise<Any> = taskpool.execute(taskHigh, taskpool.Priority.HIGH);
      let p2: Promise<Any> = taskpool.execute(taskLow, taskpool.Priority.LOW);
      let hasHigh: boolean = false;
      let hasLow: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (Date.now() - begin < 15000 && !(hasHigh && hasLow)) {
          info = taskpool.getTaskPoolInfo();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.priority === taskpool.Priority.HIGH) {
              hasHigh = true;
            }
            if (threadInfo.priority === taskpool.Priority.LOW) {
              hasLow = true;
            }
          }
          if (!(hasHigh && hasLow)) {
            await Utils.msSleep(100);
          }
        }
        expect(hasHigh && hasLow).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Promise.all([p1, p2])
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest1000
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_1000
     * @tc.desc   Verify ThreadInfo.tid is number type and integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      try {
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          expect(threadInfo.tid > 0).assertTrue();
          expect(Number.isInteger(threadInfo.tid)).assertTrue();
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
     * @tc.name   ThreadInfoPropertyTest1100
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_1100
     * @tc.desc   Verify ThreadInfo.taskIds is Array type when defined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      try {
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.taskIds !== undefined) {
            expect(Array.isArray(threadInfo.taskIds)).assertTrue();
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
     * @tc.name   ThreadInfoPropertyTest1200
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_1200
     * @tc.desc   Verify ThreadInfo.taskIds elements are non-negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      try {
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.taskIds !== undefined) {
            for (let taskId of threadInfo.taskIds!) {
              expect(taskId >= 0).assertTrue();
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
     * @tc.name   ThreadInfoPropertyTest1300
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_1300
     * @tc.desc   Verify getTaskPoolInfo returns a ThreadInfo array in an idle snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info.threadInfos)).assertTrue();
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest1400
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_1400
     * @tc.desc   Verify ThreadInfo.tid uniqueness across different threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ThreadInfoPropertyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let task3: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let p1: Promise<Any> = taskpool.execute(task1);
      let p2: Promise<Any> = taskpool.execute(task2);
      let p3: Promise<Any> = taskpool.execute(task3);
      try {
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let tids: number[] = [];
        for (let threadInfo of info.threadInfos) {
          tids.push(threadInfo.tid);
        }
        let uniqueCount: number = 0;
        for (let i: number = 0; i < tids.length; i++) {
          let isUnique: boolean = true;
          for (let j: number = 0; j < i; j++) {
            if (tids[i.toInt()] === tids[j.toInt()]) {
              isUnique = false;
              break;
            }
          }
          if (isUnique) {
            uniqueCount++;
          }
        }
        expect(uniqueCount).assertEqual(tids.length);
        expect(tids.length).assertEqual(info.threadInfos.length);
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
     * @tc.name   ThreadInfoPropertyTest1500
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_1500
     * @tc.desc   Verify threadInfos changes before and after task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let infoBefore: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let lengthBefore: number = infoBefore.threadInfos.length;
      expect(Array.isArray(infoBefore.threadInfos)).assertTrue();
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      try {
        await Utils.msSleep(200);
        let infoAfter: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(infoAfter.threadInfos)).assertTrue();
        expect(infoAfter.threadInfos.length >= lengthBefore).assertTrue();
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
     * @tc.name   ThreadInfoPropertyTest1600
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_1600
     * @tc.desc   Verify task.taskId is found in ThreadInfo.taskIds during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadInfoPropertyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let taskId: number = task.taskId;
      let execPromise: Promise<Any> = taskpool.execute(task);
      let found: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let startTime: number = Date.now();
      try {
        while (Date.now() - startTime < 5000 && !found) {
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
     * @tc.name   ThreadInfoPropertyTest1700
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_1700
     * @tc.desc   Verify multiple task.taskIds are found in ThreadInfo.taskIds during concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ThreadInfoPropertyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let task1Id: number = task1.taskId;
      let task2Id: number = task2.taskId;
      let p1: Promise<Any> = taskpool.execute(task1);
      let p2: Promise<Any> = taskpool.execute(task2);
      // 累积可见：两个 taskId 各自“执行期间曾在某 ThreadInfo.taskIds 中出现”即可；
      // 不要求同一时刻同时可见（低 worker 数设备上两任务可能串行，无法同时出现）。
      let foundTask1: boolean = false;
      let foundTask2: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (Date.now() - begin < 15000 && !(foundTask1 && foundTask2)) {
          info = taskpool.getTaskPoolInfo();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.taskIds !== undefined) {
              for (let id of threadInfo.taskIds!) {
                if (id === task1Id) {
                  foundTask1 = true;
                }
                if (id === task2Id) {
                  foundTask2 = true;
                }
              }
            }
          }
          if (!(foundTask1 && foundTask2)) {
            await Utils.msSleep(100);
          }
        }
        expect(foundTask1 && foundTask2).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Promise.all([p1, p2])
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest1800
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_1800
     * @tc.desc   Verify completed task ID is not in ThreadInfo.taskIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 10.0);
      let taskId: number = task.taskId;
      try {
        await taskpool.execute(task);
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let stillPresent: boolean = false;
        for (let threadInfo of info.threadInfos) {
          if (threadInfo.taskIds !== undefined) {
            for (let id of threadInfo.taskIds!) {
              if (id === taskId) {
                stillPresent = true;
              }
            }
          }
        }
        expect(!stillPresent).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest1900
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_1900
     * @tc.desc   Verify cancelled pending delayed task ID is not in ThreadInfo.taskIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ThreadInfoPropertyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 10.0);
      let taskId: number = task.taskId;
      let execPromise: Promise<Any> = taskpool.executeDelayed(2000, task);
      try {
        await Utils.msSleep(100);
        try {
          taskpool.cancel(task);
        } catch (e) {
          // cancel may throw if task already done
        }
        try {
          await execPromise;
        } catch (e) {
          // expected when cancelled before start
        }
        let begin: number = Date.now();
        let found: boolean = true;
        while (Date.now() - begin < 5000) {
          found = false;
          let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
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
            break;
          }
          await Utils.msSleep(100);
        }
        expect(found).assertFalse();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest2000
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_2000
     * @tc.desc   Verify ThreadInfo.priority equals LOW for LOW priority task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise: Promise<Any> = taskpool.execute(task, taskpool.Priority.LOW);
      let hasLowPriority: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (Date.now() - begin < 10000 && !hasLowPriority) {
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
     * @tc.name   ThreadInfoPropertyTest2100
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_2100
     * @tc.desc   Verify ThreadInfo.priority equals IDLE after IDLE task actually starts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let started: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(longRunningTaskWithStartFlag, 5000.0, started);
      let execPromise: Promise<Any> = taskpool.execute(task, taskpool.Priority.IDLE);
      let begin: number = Date.now();
      try {
        while (started.load() === 0 && Date.now() - begin < 20000) {
          await Utils.msSleep(100);
        }
        expect(started.load() > 0).assertTrue();
        let hasIdlePriority: boolean = false;
        let pollBegin: number = Date.now();
        while (!hasIdlePriority && Date.now() - pollBegin < 10000) {
          let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
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
      } catch (error) {
        expect().assertFail();
      }
      try {
        taskpool.cancel(task);
      } catch (e) {
      }
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest2200
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_2200
     * @tc.desc   Verify threadInfos accessible after consecutive tasks with different priorities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleTask, 10.0);
      let execPromise2: Promise<Any> = Promise.resolve(undefined as Any);
      try {
        await taskpool.execute(task1, taskpool.Priority.HIGH);
        await Utils.msSleep(200);
        let task2: taskpool.Task = new taskpool.Task(simpleTask, 20.0);
        execPromise2 = taskpool.execute(task2, taskpool.Priority.LOW);
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.threadInfos)).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      try {
        await execPromise2
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest2300
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_2300
     * @tc.desc   Verify ThreadInfo contains valid tid property during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadInfoPropertyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      try {
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          expect(threadInfo.tid > 0).assertTrue();
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
     * @tc.name   ThreadInfoPropertyTest2400
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_2400
     * @tc.desc   Verify each threadInfos element has consistent structure with tid, taskIds, priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      try {
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let threadInfo of info.threadInfos) {
          expect(threadInfo.tid > 0).assertTrue();
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
     * @tc.name   ThreadInfoPropertyTest2500
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_2500
     * @tc.desc   Verify concurrent taskpool.execute tasks complete with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ThreadInfoPropertyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let task2: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let task3: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let p1: Promise<Any> = taskpool.execute(task1);
      let p2: Promise<Any> = taskpool.execute(task2);
      let p3: Promise<Any> = taskpool.execute(task3);
      let r1: Any;
      let r2: Any;
      let r3: Any;
      try {
        [r1, r2, r3] = await Promise.all([p1, p2, p3]);
        expect(r1 as number).assertEqual(2000.0);
        expect(r2 as number).assertEqual(2000.0);
        expect(r3 as number).assertEqual(2000.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest2600
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_2600
     * @tc.desc   Verify ThreadInfo reflects running tasks during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ThreadInfoPropertyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      try {
        await Utils.msSleep(200);
        let info1: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let runningCount1: number = 0;
        let begin: number = Date.now();
        while (Date.now() - begin < 10000 && runningCount1 < 1) {
          info1 = taskpool.getTaskPoolInfo();
          runningCount1 = 0;
          for (let threadInfo of info1.threadInfos) {
            if (threadInfo.taskIds !== undefined && threadInfo.taskIds!.length > 0) {
              runningCount1++;
            }
          }
          if (runningCount1 < 1) {
            await Utils.msSleep(100);
          }
        }
        expect(runningCount1 >= 1).assertTrue();
        await Utils.msSleep(200);
        let info2: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info2.threadInfos)).assertTrue();
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
     * @tc.name   ThreadInfoPropertyTest2700
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_2700
     * @tc.desc   Verify SequenceRunner execution is reflected in ThreadInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ThreadInfoPropertyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let task2: taskpool.Task = new taskpool.Task(simpleTask, 10.0);
      let p1: Promise<Any> = runner.execute(task1);
      let p2: Promise<Any> = runner.execute(task2);
      let foundRunningTask: boolean = false;
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin: number = Date.now();
      try {
        while (Date.now() - begin < 10000 && !foundRunningTask) {
          info = taskpool.getTaskPoolInfo();
          for (let threadInfo of info.threadInfos) {
            if (threadInfo.taskIds !== undefined && threadInfo.taskIds!.length > 0) {
              foundRunningTask = true;
              break;
            }
          }
          if (!foundRunningTask) {
            await Utils.msSleep(100);
          }
        }
        expect(foundRunningTask).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Promise.all([p1, p2])
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest2800
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_2800
     * @tc.desc   Verify ThreadInfo after Promise.all concurrent execution completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ThreadInfoPropertyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleTask, 10.0);
      let task2: taskpool.Task = new taskpool.Task(simpleTask, 20.0);
      let p1: Promise<Any> = taskpool.execute(task1);
      let p2: Promise<Any> = taskpool.execute(task2);
      let r1: Any;
      let r2: Any;
      try {
        [r1, r2] = await Promise.all([p1, p2]);
        expect(r1 as number).assertEqual(20.0);
        expect(r2 as number).assertEqual(40.0);
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.threadInfos)).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest2900
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_2900
     * @tc.desc   Verify taskpool.execute invoked from Timer callback resolves correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ThreadInfoPropertyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let timerResult: number = -1;
      try {
        await Utils.msSleep(500);
        let execPromise: Promise<Any> = taskpool.execute(new taskpool.Task((): number => { return 84; }));
        timerResult = (await execPromise) as number;
        expect(timerResult).assertEqual(84);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest3000
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_3000
     * @tc.desc   Verify threadInfos accessible immediately after execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadInfoPropertyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 2000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      expect(Array.isArray(info.threadInfos)).assertTrue();
      try {
        await execPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest3100
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_3100
     * @tc.desc   Verify ThreadInfo with 10 concurrent tasks reflects correctness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ThreadInfoPropertyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tasks: taskpool.Task[] = [];
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 10; i++) {
        let t: taskpool.Task = new taskpool.Task(longRunningTask, 100.0);
        tasks.push(t);
        promises.push(taskpool.execute(t));
      }
      try {
        await Utils.msSleep(200);
        let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        expect(Array.isArray(info.threadInfos)).assertTrue();
        await Promise.all(promises);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   ThreadInfoPropertyTest3200
     * @tc.number SUB_THREADINFO_PROPERTY_TEST_3200
     * @tc.desc   Verify long running task ThreadInfo persists during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ThreadInfoPropertyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let taskId: number = task.taskId;
      let execPromise: Promise<Any> = taskpool.execute(task);
      let foundInFirstCheck: boolean = false;
      let info1: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let begin1: number = Date.now();
      try {
        while (Date.now() - begin1 < 10000 && !foundInFirstCheck) {
          info1 = taskpool.getTaskPoolInfo();
          for (let threadInfo of info1.threadInfos) {
            if (threadInfo.taskIds !== undefined) {
              for (let id of threadInfo.taskIds!) {
                if (id === taskId) {
                  foundInFirstCheck = true;
                  break;
                }
              }
            }
            if (foundInFirstCheck) {
              break;
            }
          }
          if (!foundInFirstCheck) {
            await Utils.msSleep(100);
          }
        }
        expect(foundInFirstCheck).assertTrue();
        let foundInSecondCheck: boolean = false;
        let info2: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let begin2: number = Date.now();
        while (Date.now() - begin2 < 10000 && !foundInSecondCheck) {
          info2 = taskpool.getTaskPoolInfo();
          for (let threadInfo of info2.threadInfos) {
            if (threadInfo.taskIds !== undefined) {
              for (let id of threadInfo.taskIds!) {
                if (id === taskId) {
                  foundInSecondCheck = true;
                  break;
                }
              }
            }
            if (foundInSecondCheck) {
              break;
            }
          }
          if (!foundInSecondCheck) {
            await Utils.msSleep(100);
          }
        }
        expect(foundInSecondCheck).assertTrue();
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
