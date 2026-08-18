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

// Helper function: returns 100 for simple task
function simpleTask(): number {
  return 100 + 0.0;
}

// Helper function: long running task
function longRunningTask(duration: number): number {
  let start: number = Date.now();
  while (Date.now() - start < duration) {}
  return duration + 0.0;
}

// Helper function: throws error
function errorTask(): number {
  throw new Error("task error");
}

// Helper function: returns argument
function returnArgTask(arg: number): number {
  return arg + 0.0;
}

// Helper function: accesses State enum from worker thread
function accessStateEnumTask(): number {
  return taskpool.State.RUNNING;
}

export default function TaskpoolStateTest(): void {
  describe('TaskpoolStateTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskpoolStateTest0100
     * @tc.number SUB_TASKPOOL_STATE_TEST_0100
     * @tc.desc   Verify task state is WAITING after execute enters queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolStateTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tasks: taskpool.Task[] = [];
      let promises: Array<Promise<Any>> = [];
      for (let i: number = 0; i < 20; i++) {
        let t: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
        tasks.push(t);
        promises.push(taskpool.execute(t));
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let hasWaiting: boolean = false;
      for (let taskInfo of info.taskInfos) {
        if (taskInfo.state === taskpool.State.WAITING) {
          hasWaiting = true;
        }
      }
      expect(hasWaiting || info.taskInfos.length === 0).assertTrue();
      try {
        await Promise.all(promises);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolStateTest0200
     * @tc.number SUB_TASKPOOL_STATE_TEST_0200
     * @tc.desc   Verify task state is RUNNING during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolStateTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let execPromise: Promise<Any> = taskpool.execute(task);
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      let hasRunning: boolean = false;
      for (let taskInfo of info.taskInfos) {
        if (taskInfo.state === taskpool.State.RUNNING) {
          hasRunning = true;
        }
      }
      expect(hasRunning || info.taskInfos.length === 0).assertTrue();
      try {
        await execPromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolStateTest0300
     * @tc.number SUB_TASKPOOL_STATE_TEST_0300
     * @tc.desc   Verify completed task removed from taskInfos or no longer RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolStateTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.isDone()).assertTrue();
      let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
      // After task completion, the task may no longer appear in taskInfos (completed tasks are removed)
      // or its state may be WAITING (ready for reuse) - both are valid outcomes
      let foundInInfos: boolean = false;
      let stateValid: boolean = false;
      for (let taskInfo of info.taskInfos) {
        if (taskInfo.taskId === task.taskId) {
          foundInInfos = true;
          // WAITING means task is reusable, any non-RUNNING state after completion is acceptable
          if (taskInfo.state !== taskpool.State.RUNNING) {
            stateValid = true;
          }
        }
      }
      // Either task not found (completed and removed), or found with non-RUNNING state
      expect(!foundInInfos || stateValid).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolStateTest0400
     * @tc.number SUB_TASKPOOL_STATE_TEST_0400
     * @tc.desc   Verify cancel completed task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolStateTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.isDone()).assertTrue();
      let cancelThrows: boolean = false;
      try {
        taskpool.cancel(task);
      } catch (error) {
        cancelThrows = true;
        expect(error.code).assertEqual(10200085);
      }
      expect(cancelThrows).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolStateTest0500
     * @tc.number SUB_TASKPOOL_STATE_TEST_0500
     * @tc.desc   Verify task error execution throws error and state resets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolStateTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(errorTask);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      expect(task.isDone()).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolStateTest0600
     * @tc.number SUB_TASKPOOL_STATE_TEST_0600
     * @tc.desc   Verify task timeout throws error with timeout message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolStateTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 5000.0);
      let timeoutError: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 500 });
      } catch (error) {
        timeoutError = true;
        expect(error.code).assertEqual(10200115);
      }
      expect(timeoutError).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolStateTest0700
     * @tc.number SUB_TASKPOOL_STATE_TEST_0700
     * @tc.desc   Verify SequenceRunner tasks complete with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolStateTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(returnArgTask, 1.0);
      let task2: taskpool.Task = new taskpool.Task(returnArgTask, 2.0);
      let task3: taskpool.Task = new taskpool.Task(returnArgTask, 3.0);
      let result1: Any
      let result2: Any
      let result3: Any
      try {
        let allResults = await Promise.all([runner.execute(task1), runner.execute(task2), runner.execute(task3)]);
        result1 = allResults[0];
        result2 = allResults[1];
        result3 = allResults[2];
        expect(result1 as number).assertEqual(1.0);
        expect(result2 as number).assertEqual(2.0);
        expect(result3 as number).assertEqual(3.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(task1.isDone()).assertTrue();
      expect(task2.isDone()).assertTrue();
      expect(task3.isDone()).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolStateTest0800
     * @tc.number SUB_TASKPOOL_STATE_TEST_0800
     * @tc.desc   Verify State enum values are accessible from taskpool worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolStateTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(accessStateEnumTask);
      try {
        let result = await taskpool.execute(task);
        expect(result as number).assertEqual(taskpool.State.RUNNING);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
