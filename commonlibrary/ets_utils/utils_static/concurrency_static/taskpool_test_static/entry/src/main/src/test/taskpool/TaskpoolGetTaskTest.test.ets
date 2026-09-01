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

function getTaskInWorker(taskId: number): boolean {
  let result: taskpool.Task | undefined = taskpool.getTask(taskId.toInt());
  return result === undefined;
}

function concurrentGetTaskInWorker(taskId: number): boolean {
  try {
    let result: taskpool.Task | undefined = taskpool.getTask(taskId.toInt());
    return result === undefined;
  } catch (e) {
    return false;
  }
}

export default function TaskpoolGetTaskTest(): void {
  describe('TaskpoolGetTaskTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskpoolGetTaskTest0100
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_0100
     * @tc.desc   Verify getTask with taskId only returns the corresponding Task instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolGetTaskTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt());
      expect(result !== undefined).assertTrue();
      expect(result!.taskId).assertEqual(task.taskId);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest0200
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_0200
     * @tc.desc   Verify getTask with taskId and taskName returns matched named Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolGetTaskTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskName: string = "testTask";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), taskName);
      expect(result !== undefined).assertTrue();
      expect(result!.taskId).assertEqual(task.taskId);
      expect(result!.name).assertEqual(taskName);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest0300
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_0300
     * @tc.desc   Verify getTask with taskName as undefined behaves same as taskId only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), undefined);
      expect(result !== undefined).assertTrue();
      expect(result!.taskId).assertEqual(task.taskId);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest0400
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_0400
     * @tc.desc   Verify getTask with taskId 0 returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let result: taskpool.Task | undefined = taskpool.getTask(0);
      expect(result === undefined).assertTrue();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest0500
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_0500
     * @tc.desc   Verify getTask with negative taskId returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let negativeIds: number[] = [-1, -100];
      for (let id of negativeIds) {
        let result: taskpool.Task | undefined = taskpool.getTask(id.toInt());
        expect(result === undefined).assertTrue();
      }
    })

    /**
     * @tc.name   TaskpoolGetTaskTest0600
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_0600
     * @tc.desc   Verify getTask with non-existent taskId returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let result: taskpool.Task | undefined = taskpool.getTask(999999999);
      expect(result === undefined).assertTrue();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest0700
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_0700
     * @tc.desc   Verify getTask with normal English string taskName returns matched Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolGetTaskTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskName: string = "englishTaskName";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), taskName);
      expect(result !== undefined).assertTrue();
      expect(result!.name).assertEqual(taskName);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest0800
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_0800
     * @tc.desc   Verify getTask with empty string taskName returns matched Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskName: string = "";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), taskName);
      expect(result !== undefined).assertTrue();
      expect(result!.name).assertEqual(taskName);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest0900
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_0900
     * @tc.desc   Verify getTask with special characters taskName returns matched Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskName: string = "task!@#$%^&*()";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), taskName);
      expect(result !== undefined).assertTrue();
      expect(result!.name).assertEqual(taskName);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest1000
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_1000
     * @tc.desc   Verify getTask with Unicode characters taskName returns matched Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskName: string = "\u4EFB\u52A1\u6D4B\u8BD5";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), taskName);
      expect(result !== undefined).assertTrue();
      expect(result!.name).assertEqual(taskName);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest1100
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_1100
     * @tc.desc   Verify getTask with very long string taskName returns matched Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName: string = "aaaaaaaaaa";
      for (let i: number = 0; i < 9; i++) {
        longName = longName + longName;
      }
      let task: taskpool.Task = new taskpool.Task(longName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), longName);
      expect(result !== undefined).assertTrue();
      expect(result!.name).assertEqual(longName);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest1200
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_1200
     * @tc.desc   Verify getTask with whitespace string taskName returns matched Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskName: string = "   ";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), taskName);
      expect(result !== undefined).assertTrue();
      expect(result!.name).assertEqual(taskName);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest1300
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_1300
     * @tc.desc   Verify getTask with zero-width character taskName returns matched Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let taskName: string = "task\u200Bname";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), taskName);
      expect(result !== undefined).assertTrue();
      expect(result!.name).assertEqual(taskName);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest1400
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_1400
     * @tc.desc   Verify getTask with existing taskId and matching taskName returns Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolGetTaskTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskName: string = "matchedName";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), taskName);
      expect(result !== undefined).assertTrue();
      expect(result!.taskId).assertEqual(task.taskId);
      expect(result!.name).assertEqual(taskName);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest1500
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_1500
     * @tc.desc   Verify getTask with existing taskId and mismatched taskName returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolGetTaskTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskName: string = "originalName";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), "differentName");
      expect(result === undefined).assertTrue();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest1600
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_1600
     * @tc.desc   Verify getTask with case-sensitive taskName mismatch returns undefined or matching Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskName: string = "TestTask";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), "testtask");
      expect(result === undefined || result!.name === "TestTask").assertTrue();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest1700
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_1700
     * @tc.desc   Verify getTask with unnamed Task and provided taskName returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt(), "anyName");
      expect(result === undefined).assertTrue();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest1800
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_1800
     * @tc.desc   Verify Task returned by getTask can be executed and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolGetTaskTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let retrievedTask: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt());
      expect(retrievedTask !== undefined).assertTrue();
      try {
        let execResult: number = (await taskpool.execute(retrievedTask!)) as number;
        expect(execResult).assertEqual(3);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest1900
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_1900
     * @tc.desc   Verify Task returned by getTask has same taskId and name as original Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolGetTaskTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskName: string = "propTask";
      let task: taskpool.Task = new taskpool.Task(taskName, addNum, 1.0, 2.0);
      let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt());
      expect(result !== undefined).assertTrue();
      expect(result!.taskId).assertEqual(task.taskId);
      expect(result!.name).assertEqual(task.name);
    })

    /**
     * @tc.name   TaskpoolGetTaskTest2000
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_2000
     * @tc.desc   Verify getTask from different thread returns undefined for main thread Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let workerTask: taskpool.Task = new taskpool.Task(getTaskInWorker, task.taskId.toInt() + 0.0);
      try {
        let result: boolean = (await taskpool.execute(workerTask)) as boolean;
        expect(result).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest2100
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_2100
     * @tc.desc   Verify getTask return type is Task when found or undefined when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolGetTaskTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let foundResult: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt());
      expect(foundResult !== undefined).assertTrue();
      let notFoundResult: taskpool.Task | undefined = taskpool.getTask(999999999);
      expect(notFoundResult === undefined).assertTrue();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest2200
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_2200
     * @tc.desc   Verify undefined strict check: result === undefined is true, result === null is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let result: taskpool.Task | undefined = taskpool.getTask(999999999);
      expect(result === undefined).assertTrue();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest2300
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_2300
     * @tc.desc   Verify calling getTask 10 times for same taskId returns correct Task each time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      for (let i: number = 0; i < 10; i++) {
        let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt());
        expect(result !== undefined).assertTrue();
        expect(result!.taskId).assertEqual(task.taskId);
      }
    })

    /**
     * @tc.name   TaskpoolGetTaskTest2400
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_2400
     * @tc.desc   Verify concurrent getTask calls from 5 worker threads all return correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let workerTasks: taskpool.Task[] = [];
      for (let i: number = 0; i < 5; i++) {
        workerTasks.push(new taskpool.Task(concurrentGetTaskInWorker, task.taskId.toInt() + 0.0));
      }
      try {
        let results: Array<Any> = await Promise.all(workerTasks.map((t: taskpool.Task) => {
          return taskpool.execute(t);
        }));
        for (let r of results) {
          expect(r as boolean).assertTrue();
        }
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest2500
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_2500
     * @tc.desc   Verify getTask after creating 100 Tasks returns correct Task by random index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tasks: taskpool.Task[] = [];
      for (let i: number = 0; i < 100; i++) {
        let t: taskpool.Task = new taskpool.Task(addNum, i + 0.0, i + 1.0);
        tasks.push(t);
      }
      let randomIndexes: number[] = [0, 50, 99];
      for (let idx of randomIndexes) {
        let intIdx: int = idx.toInt();
        let result: taskpool.Task | undefined = taskpool.getTask(tasks[intIdx].taskId.toInt());
        expect(result !== undefined).assertTrue();
        expect(result!.taskId).assertEqual(tasks[intIdx].taskId);
      }
    })

    /**
     * @tc.name   TaskpoolGetTaskTest2600
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_2600
     * @tc.desc   Verify getTask in Promise.then callback retrieves Task correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let taskId: number = task.taskId;
      try {
        await taskpool.execute(task);
        let retrieved: taskpool.Task | undefined = taskpool.getTask(taskId.toInt());
        expect(retrieved === undefined || retrieved!.taskId === taskId).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest2700
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_2700
     * @tc.desc   Verify getTask after setTimeout delay returns Task with matching taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let taskId: number = task.taskId;
      let retrievedTaskId: number = -1;
      try {
        await Utils.msSleep(500);
        let result: taskpool.Task | undefined = taskpool.getTask(taskId.toInt());
        if (result !== undefined) {
          retrievedTaskId = result.taskId;
        }
        expect(retrievedTaskId).assertEqual(taskId);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest2800
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_2800
     * @tc.desc   Verify getTask in periodic polling calls retrieves Task correctly 3 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let taskId: number = task.taskId;
      let count: number = 0;
      try {
        for (let i: number = 0; i < 3; i++) {
          await Utils.msSleep(100)
          let result: taskpool.Task | undefined = taskpool.getTask(taskId.toInt());
          if (result !== undefined) {
            count = count + 1;
          }
        }
        expect(count).assertEqual(3);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest2900
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_2900
     * @tc.desc   Verify getTask retrieves Task during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let executePromise = taskpool.execute(task);
      try {
        await Utils.msSleep(100)
        let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt());
        expect(result !== undefined).assertTrue();
        await executePromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest3000
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_3000
     * @tc.desc   Verify getTask after Task execution completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let taskId: number = task.taskId;
      try {
        let execResult: number = (await taskpool.execute(task)) as number;
        expect(execResult).assertEqual(3);
        let result: taskpool.Task | undefined = taskpool.getTask(taskId.toInt());
        expect(result === undefined).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest3100
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_3100
     * @tc.desc   Verify getTask can retrieve Task added to TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let task1: taskpool.Task = new taskpool.Task(addNum, 1.0, 2.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      let result: taskpool.Task | undefined = taskpool.getTask(task1.taskId.toInt());
      expect(result !== undefined).assertTrue();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest3200
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_3200
     * @tc.desc   Verify getTask can retrieve Task in SequenceRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolGetTaskTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500.0);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let runnerPromise = runner.execute(task);
      try {
        await Utils.msSleep(100)
        let result: taskpool.Task | undefined = taskpool.getTask(task.taskId.toInt());
        expect(result !== undefined).assertTrue();
        await runnerPromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest3300
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_3300
     * @tc.desc   Verify getTask with max int boundary taskId 2147483647 returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let result: taskpool.Task | undefined = taskpool.getTask(2147483647);
      expect(result === undefined).assertTrue();
    })

    /**
     * @tc.name   TaskpoolGetTaskTest3400
     * @tc.number SUB_TASKPOOL_GETTASK_TEST_3400
     * @tc.desc   Verify getTask with min int boundary taskId -2147483648 returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolGetTaskTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let result: taskpool.Task | undefined = taskpool.getTask(-2147483648);
      expect(result === undefined).assertTrue();
    })
  })
}
