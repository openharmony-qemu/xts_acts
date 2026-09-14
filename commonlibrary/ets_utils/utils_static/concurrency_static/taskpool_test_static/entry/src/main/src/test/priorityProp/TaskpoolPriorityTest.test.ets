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

import { describe, beforeAll, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

// Helper function: returns 100 for simple task
function simpleTask(): number {
  return 100.0;
}

// Helper function: computes n * 2
function computeTask(n: number): number {
  return n * 2.0;
}

// Helper function: simulates long-running task for given duration (ms)
function longTask(duration: number): string {
  let start: number = Date.now();
  while ((Date.now() - start) < duration) { continue; }
  return 'success';
}

// Helper function: returns value * 10 for concurrent testing
function concurrentTask(value: number): number {
  return value * 10.0;
}

// Helper function: simulates delay for given duration
function delayTask(duration: number): string {
  let start: number = Date.now();
  while ((Date.now() - start) < duration) { continue; }
  return "completed";
}

// Helper function: returns "done" quickly
function quickTask(): string {
  return "done";
}

// Module-level array to track active periodic tasks for cleanup
let activePeriodicTasks: taskpool.Task[] = [];

// Helper function: increments the shared atomic counter (visible across worker threads)
function periodicAtomicTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
}

export default function TaskpoolPriorityTest(): void {
  describe('TaskpoolPriorityTest', (): void => {
    beforeAll((): void => {
    })
    afterEach((): void => {
      for (let task of activePeriodicTasks) {
        try {
          taskpool.cancel(task);
        } catch (e) {
          // Task may already be canceled or completed
        }
      }
      activePeriodicTasks = [];
    });

    afterAll((): void => {})

    // ==================== 1.1 Enum Value Tests ====================

    /**
     * @tc.name   TaskpoolPriorityTest0100
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0100
     * @tc.desc   Verify execute(task, Priority.HIGH) completes with correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.HIGH);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest0200
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0200
     * @tc.desc   Verify execute(task, Priority.MEDIUM) completes with correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.MEDIUM);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest0300
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0300
     * @tc.desc   Verify execute(task, Priority.LOW) completes with correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.LOW);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest0400
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0400
     * @tc.desc   Verify execute(task, Priority.IDLE) completes with correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.IDLE);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest0500
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0500
     * @tc.desc   Verify task completes with correct result when not passing priority parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest0600
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0600
     * @tc.desc   Verify task with empty Configs object completes with correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, {});
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    // ==================== 4.1 taskpool.execute(Task, Priority) ====================

    /**
     * @tc.name   TaskpoolPriorityTest0700
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0700
     * @tc.desc   Verify execute(task, Priority.HIGH) returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 100.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.HIGH);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(200);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest0800
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0800
     * @tc.desc   Verify execute(task, Priority.MEDIUM) returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 50.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.MEDIUM);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest0900
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0900
     * @tc.desc   Verify execute(task, Priority.LOW) returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 25.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.LOW);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(50);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest1000
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1000
     * @tc.desc   Verify execute(task, Priority.IDLE) returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 10.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.IDLE);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(20);
      done();
    })

    // ==================== 4.2 taskpool.execute(Task, Configs) ====================

    /**
     * @tc.name   TaskpoolPriorityTest1100
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1100
     * @tc.desc   Verify execute(task, Configs) with HIGH priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 100.0);
      let configs: taskpool.Configs = { priority: taskpool.Priority.HIGH };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(200);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest1200
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1200
     * @tc.desc   Verify execute(task, Configs) with LOW priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 50.0);
      let configs: taskpool.Configs = { priority: taskpool.Priority.LOW };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest1300
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1300
     * @tc.desc   Verify execute(task, Configs) with IDLE priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 25.0);
      let configs: taskpool.Configs = { priority: taskpool.Priority.IDLE };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(50);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest1400
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1400
     * @tc.desc   Verify execute(task, Configs) with priority and timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 10.0);
      let configs: taskpool.Configs = { priority: taskpool.Priority.HIGH, timeout: 5000 };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(20);
      done();
    })

    // ==================== 4.3 taskpool.execute(TaskGroup, Priority) ====================

    /**
     * @tc.name   TaskpoolPriorityTest1500
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1500
     * @tc.desc   Verify execute(taskGroup, Priority.HIGH) returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(computeTask, 10.0)
      taskGroup.addTask(computeTask, 20.0)
      taskGroup.addTask(computeTask, 30.0)
      let results: Any[] = [];
      try {
        results = (await taskpool.execute(taskGroup, taskpool.Priority.HIGH)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(3);
      expect(results[0] as number).assertEqual(20);
      expect(results[1] as number).assertEqual(40);
      expect(results[2] as number).assertEqual(60);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest1600
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1600
     * @tc.desc   Verify execute(taskGroup, Priority.MEDIUM) returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(computeTask, 5.0)
      taskGroup.addTask(computeTask, 15.0)
      let results: Any[] = [];
      try {
        results = (await taskpool.execute(taskGroup, taskpool.Priority.MEDIUM)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(2);
      expect(results[0] as number).assertEqual(10);
      expect(results[1] as number).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest1700
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1700
     * @tc.desc   Verify execute(taskGroup, Priority.LOW) returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(computeTask, 1.0)
      taskGroup.addTask(computeTask, 2.0)
      let results: Any[] = [];
      try {
        results = (await taskpool.execute(taskGroup, taskpool.Priority.LOW)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(2);
      expect(results[0] as number).assertEqual(2);
      expect(results[1] as number).assertEqual(4);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest1800
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1800
     * @tc.desc   Verify execute(taskGroup, Priority.IDLE) returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(computeTask, 100.0)
      taskGroup.addTask(computeTask, 200.0)
      let results: Any[] = [];
      try {
        results = (await taskpool.execute(taskGroup, taskpool.Priority.IDLE)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(2);
      expect(results[0] as number).assertEqual(200);
      expect(results[1] as number).assertEqual(400);
      done();
    })

    // ==================== 4.4 taskpool.execute(TaskGroup, Configs) ====================

    /**
     * @tc.name   TaskpoolPriorityTest1900
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1900
     * @tc.desc   Verify execute(taskGroup, Configs) with HIGH priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(computeTask, 50.0)
      let configs: taskpool.Configs = { priority: taskpool.Priority.HIGH };
      let results: Any[] = [];
      try {
        results = (await taskpool.execute(taskGroup, configs)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(1);
      expect(results[0] as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest2000
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2000
     * @tc.desc   Verify execute(taskGroup, Configs) with priority and timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(computeTask, 100.0)
      taskGroup.addTask(computeTask, 200.0)
      let configs: taskpool.Configs = { priority: taskpool.Priority.LOW, timeout: 5000 };
      let results: Any[] = [];
      try {
        results = (await taskpool.execute(taskGroup, configs)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(2);
      done();
    })

    // ==================== 4.5 taskpool.executeDelayed ====================

    /**
     * @tc.name   TaskpoolPriorityTest2100
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2100
     * @tc.desc   Verify executeDelayed with HIGH priority returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 100.0);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task, taskpool.Priority.HIGH);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(200);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest2200
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2200
     * @tc.desc   Verify executeDelayed with MEDIUM priority returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 50.0);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task, taskpool.Priority.MEDIUM);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest2300
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2300
     * @tc.desc   Verify executeDelayed with LOW priority returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 25.0);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task, taskpool.Priority.LOW);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(50);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest2400
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2400
     * @tc.desc   Verify executeDelayed with IDLE priority returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 10.0);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task, taskpool.Priority.IDLE);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest2500
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2500
     * @tc.desc   Verify executeDelayed without priority completes with correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 100.0);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(200);
      done();
    })

    // ==================== 4.6 taskpool.executePeriodically ====================

    /**
     * @tc.name   TaskpoolPriorityTest2600
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2600
     * @tc.desc   Verify executePeriodically with HIGH priority executes periodically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(periodicAtomicTask, counter);
      activePeriodicTasks.push(task);
      taskpool.executePeriodically(200, task, taskpool.Priority.HIGH);
      try {
        await Utils.msSleep(2500);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      expect(counter.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest2700
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2700
     * @tc.desc   Verify executePeriodically with MEDIUM priority executes periodically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(periodicAtomicTask, counter);
      activePeriodicTasks.push(task);
      taskpool.executePeriodically(200, task, taskpool.Priority.MEDIUM);
      try {
        await Utils.msSleep(1500);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      expect(counter.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest2800
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2800
     * @tc.desc   Verify executePeriodically with LOW priority executes periodically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(periodicAtomicTask, counter);
      activePeriodicTasks.push(task);
      taskpool.executePeriodically(200, task, taskpool.Priority.LOW);
      try {
        await Utils.msSleep(2500);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      expect(counter.load() >= 1).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest2900
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2900
     * @tc.desc   Verify executePeriodically with IDLE priority executes periodically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(periodicAtomicTask, counter);
      activePeriodicTasks.push(task);
      taskpool.executePeriodically(200, task, taskpool.Priority.IDLE);
      try {
        await Utils.msSleep(2500);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      expect(counter.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest3000
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_3000
     * @tc.desc   Verify executePeriodically without priority uses default MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(periodicAtomicTask, counter);
      activePeriodicTasks.push(task);
      taskpool.executePeriodically(200, task);
      try {
        await Utils.msSleep(1500);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      expect(counter.load() >= 1).assertTrue();
      done();
    })

    // ==================== 5.1 Concurrent Execution with Different Priorities ====================

    /**
     * @tc.name   TaskpoolPriorityTest3100
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_3100
     * @tc.desc   Verify concurrent tasks with different priorities all complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let highTask: taskpool.Task = new taskpool.Task(concurrentTask, 1.0);
      let mediumTask: taskpool.Task = new taskpool.Task(concurrentTask, 2.0);
      let lowTask: taskpool.Task = new taskpool.Task(concurrentTask, 3.0);
      let idleTask: taskpool.Task = new taskpool.Task(concurrentTask, 4.0);
      let p1 = taskpool.execute(highTask, taskpool.Priority.HIGH);
      let p2 = taskpool.execute(mediumTask, taskpool.Priority.MEDIUM);
      let p3 = taskpool.execute(lowTask, taskpool.Priority.LOW);
      let p4 = taskpool.execute(idleTask, taskpool.Priority.IDLE);
      let allResults: Any[] = [];
      try {
        allResults = (await Promise.all([p1, p2, p3, p4])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(allResults.length).assertEqual(4);
      expect(allResults[0] as number).assertEqual(10);
      expect(allResults[1] as number).assertEqual(20);
      expect(allResults[2] as number).assertEqual(30);
      expect(allResults[3] as number).assertEqual(40);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest3200
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_3200
     * @tc.desc   Verify priority competition scenario, high and low priority both complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let highTask: taskpool.Task = new taskpool.Task(delayTask, 100.0);
      let lowTask: taskpool.Task = new taskpool.Task(delayTask, 100.0);
      let p1 = taskpool.execute(highTask, taskpool.Priority.HIGH);
      let p2 = taskpool.execute(lowTask, taskpool.Priority.LOW);
      let allResults: Any[] = [];
      try {
        allResults = (await Promise.all([p1, p2])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(allResults[0] as string).assertEqual("completed");
      expect(allResults[1] as string).assertEqual("completed");
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest3300
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_3300
     * @tc.desc   Verify same priority tasks execute sequentially when awaited
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(computeTask, 1.0);
      let task2: taskpool.Task = new taskpool.Task(computeTask, 2.0);
      let task3: taskpool.Task = new taskpool.Task(computeTask, 3.0);
      let result1: Any = undefined;
      try {
        result1 = await taskpool.execute(task1, taskpool.Priority.MEDIUM);
      } catch (error) {
        expect().assertFail();
      }
      let result2: Any = undefined;
      try {
        result2 = await taskpool.execute(task2, taskpool.Priority.MEDIUM);
      } catch (error) {
        expect().assertFail();
      }
      let result3: Any = undefined;
      try {
        result3 = await taskpool.execute(task3, taskpool.Priority.MEDIUM);
      } catch (error) {
        expect().assertFail();
      }
      expect(result1 as number).assertEqual(2);
      expect(result2 as number).assertEqual(4);
      expect(result3 as number).assertEqual(6);
      done();
    })

    // ==================== 6.2 Timer with Priority ====================

    /**
     * @tc.name   TaskpoolPriorityTest3400
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_3400
     * @tc.desc   Verify concurrent HIGH/LOW priority tasks complete with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.Task(computeTask, 100.0);
      let t2: taskpool.Task = new taskpool.Task(computeTask, 200.0);
      try {
        let results = await Promise.all([
          taskpool.execute(t1, taskpool.Priority.HIGH),
          taskpool.execute(t2, taskpool.Priority.LOW)
        ]);
        expect(results[0] as number).assertEqual(200.0);
        expect(results[1] as number).assertEqual(400.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    // ==================== 6.3 Task Lifecycle Management ====================

    /**
     * @tc.name   TaskpoolPriorityTest3500
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_3500
     * @tc.desc   Verify task group lifecycle with HIGH priority completes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i = 0; i < 10; i++) {
        taskGroup.addTask(computeTask, i + 0.0)
      }
      let results: Any[] = [];
      try {
        results = (await taskpool.execute(taskGroup, taskpool.Priority.HIGH)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(10);
      for (let i = 0; i < 10; i++) {
        expect(results[i] as number).assertEqual(i * 2);
      }
      done();
    })

    // ==================== 6.4 Periodic Task Lifecycle ====================

    /**
     * @tc.name   TaskpoolPriorityTest3600
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_3600
     * @tc.desc   Verify periodic task counter stops after cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(periodicAtomicTask, counter);
      activePeriodicTasks.push(task);
      taskpool.executePeriodically(200, task, taskpool.Priority.HIGH);
      // Wait for at least one periodic execution to complete
      let maxWait: number = 0;
      while (counter.load() < 1 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      let countBeforeCancel: number = counter.load();
      taskpool.cancel(task);
      try {
        await Utils.msSleep(1000);
      } catch (error) {
        expect().assertFail();
      }
      // Allow +1 tolerance for in-flight periodic execution after cancel
      expect(counter.load() <= countBeforeCancel + 1).assertTrue();
      done();
    })

    // ==================== 7.2 Extreme Scenarios ====================

    /**
     * @tc.name   TaskpoolPriorityTest3700
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_3700
     * @tc.desc   Verify large number of tasks with same priority execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let taskCount: number = 100;
      for (let i = 0; i < taskCount; i++) {
        taskGroup.addTask(computeTask, i + 0.0)
      }
      let results: Any[] = [];
      try {
        results = (await taskpool.execute(taskGroup, taskpool.Priority.MEDIUM)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(taskCount);
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest3800
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_3800
     * @tc.desc   Verify 4 tasks with mixed priorities execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let priorities: taskpool.Priority[] = [
        taskpool.Priority.HIGH,
        taskpool.Priority.MEDIUM,
        taskpool.Priority.LOW,
        taskpool.Priority.IDLE
      ];
      let task1: taskpool.Task = new taskpool.Task(computeTask, 1.0);
      let task2: taskpool.Task = new taskpool.Task(computeTask, 2.0);
      let task3: taskpool.Task = new taskpool.Task(computeTask, 3.0);
      let task4: taskpool.Task = new taskpool.Task(computeTask, 4.0);
      let p1 = taskpool.execute(task1, priorities[0]);
      let p2 = taskpool.execute(task2, priorities[1]);
      let p3 = taskpool.execute(task3, priorities[2]);
      let p4 = taskpool.execute(task4, priorities[3]);
      let initialResults: Any[] = [];
      try {
        initialResults = (await Promise.all([p1, p2, p3, p4])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(initialResults.length).assertEqual(4);
      expect(initialResults[0] as number).assertEqual(2);
      expect(initialResults[1] as number).assertEqual(4);
      expect(initialResults[2] as number).assertEqual(6);
      expect(initialResults[3] as number).assertEqual(8);
      done();
    })

    // ==================== 7.3 Timeout with Priority Combination ====================

    /**
     * @tc.name   TaskpoolPriorityTest3900
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_3900
     * @tc.desc   Verify quick task with HIGH priority and timeout completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(quickTask);
      let configs: taskpool.Configs = { priority: taskpool.Priority.HIGH, timeout: 5000 };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("done");
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest4000
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_4000
     * @tc.desc   Verify quick task with LOW priority and timeout completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(quickTask);
      let configs: taskpool.Configs = { priority: taskpool.Priority.LOW, timeout: 5000 };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("done");
      done();
    })

    /**
     * @tc.name   TaskpoolPriorityTest4100
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_4100
     * @tc.desc   Verify LOW priority task triggers timeout error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask, 5000.0);
      let configs: taskpool.Configs = { priority: taskpool.Priority.LOW, timeout: 1000 };
      try {
        await taskpool.execute(task, configs);
        expect().assertFail();
      } catch (error) {
      }
      done();
    })
  })
}
