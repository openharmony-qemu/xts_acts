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

// ========== 辅助函数 ==========
function simpleTask(): number {
  return 100.0;
}

function computeTask(n: number): number {
  return n * n;
}

function stringTask(s: string): string {
  return "hello " + s;
}

function booleanTask(n: number): boolean {
  return n > 0;
}

function returnMinusOneTask(): number {
  return -1;
}

function returnZeroTask(): number {
  return 0;
}

function returnFalseTask(): boolean {
  return false;
}

function returnEmptyStringTask(): string {
  return "";
}

function throwTask(): number {
  throw new Error("task error in group");
}

function partialFailTask(shouldFail: boolean): number {
  if (shouldFail) {
    throw new Error("partial fail");
  }
  return 1.0;
}

function orderTask(value: number): number {
  return value;
}

function longRunningTask(duration: number): string {
  let start: number = Date.now();
  while (Date.now() - start < duration) {}
  return 'success';
}

function taskInGroupFunc(value: number): number {
  return value * 10;
}

function quickTask(n: number): number {
  return n + 0.0;
}

export default function TaskpoolExecuteGroupConfigsTest(): void {
  describe('TaskpoolExecuteGroupConfigsTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   TaskpoolExecute5Test0100

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_0100

     * @tc.desc   Verify execute(group, configs) with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      taskGroup.addTask(computeTask, 5.0);
      let configs: taskpool.Configs = { timeout: 1000, priority: taskpool.Priority.HIGH };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(2);
        expect(results[0] as number).assertEqual(100);
        expect(results[1] as number).assertEqual(25.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    // ==================== 1.2 TaskGroup类型 ====================

    /**
     * @tc.name   TaskpoolExecute5Test0200

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_0200

     * @tc.desc   Verify execute with TaskGroup containing single task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(stringTask, "world");
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        expect(results[0] as string).assertEqual("hello world");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test0300

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_0300

     * @tc.desc   Verify execute with TaskGroup containing multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i = 1; i <= 5; i++) {
        taskGroup.addTask(computeTask, i + 0.0);
      }
      let configs: taskpool.Configs = { timeout: 2000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(5);
        expect(results[0] as number).assertEqual(1.0);
        expect(results[4] as number).assertEqual(25.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test0400

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_0400

     * @tc.desc   Verify execute with empty TaskGroup returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let emptyGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(emptyGroup, configs);
        expect(results.length).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test0500

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_0500

     * @tc.desc   Verify execute with named TaskGroup and configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let namedGroup: taskpool.TaskGroup = new taskpool.TaskGroup("myGroup");
      namedGroup.addTask(simpleTask);
      expect(namedGroup.name).assertEqual("myGroup");
      let configs: taskpool.Configs = { timeout: 1000, priority: taskpool.Priority.HIGH };
      try {
        let results = await taskpool.execute(namedGroup, configs);
        expect(results.length).assertEqual(1);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test0600

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_0600

     * @tc.desc   Verify execute with Task objects added to TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(taskInGroupFunc, 10.0);
      let task2: taskpool.Task = new taskpool.Task(taskInGroupFunc, 20.0);
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(2);
        expect(results[0] as number).assertEqual(100.0);
        expect(results[1] as number).assertEqual(200.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test0700

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_0700

     * @tc.desc   Verify execute with configs containing only timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test0800

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_0800

     * @tc.desc   Verify execute with configs containing only priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { priority: taskpool.Priority.HIGH };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test0900

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_0900

     * @tc.desc   Verify execute with empty configs object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(orderTask, 42.0);
      let configs: taskpool.Configs = {};
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(42.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test1000

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_1000

     * @tc.desc   Verify execute with configs timeout=0 treated as Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { timeout: 0 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test1100

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_1100

     * @tc.desc   Verify execute with configs timeout=1ms triggers timeout error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(longRunningTask, 500.0);
      let configs: taskpool.Configs = { timeout: 1 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (e) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test1200

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_1200

     * @tc.desc   Verify execute with configs timeout=-1 (treated as Infinity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { timeout: -1 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test1300

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_1300

     * @tc.desc   Verify execute with configs timeout=500.5 decimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { timeout: 500.5 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test1400

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_1400

     * @tc.desc   Verify execute with configs large timeout value 60000ms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { timeout: 60000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test1500

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_1500

     * @tc.desc   Verify execute with priority=MEDIUM in configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { priority: taskpool.Priority.MEDIUM };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test1600

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_1600

     * @tc.desc   Verify execute with priority=LOW in configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { priority: taskpool.Priority.LOW };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test1700

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_1700

     * @tc.desc   Verify execute with LOW priority + long timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { timeout: 5000, priority: taskpool.Priority.LOW };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test1800

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_1800

     * @tc.desc   Verify single task result in TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(orderTask, 42.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        expect(results[0] as number).assertEqual(42.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test1900

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_1900

     * @tc.desc   Verify multi task result order matches addTask order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(orderTask, 10.0);
      taskGroup.addTask(orderTask, 20.0);
      taskGroup.addTask(orderTask, 30.0);
      let configs: taskpool.Configs = { timeout: 2000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(10.0);
        expect(results[1] as number).assertEqual(20.0);
        expect(results[2] as number).assertEqual(30.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test2000

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_2000

     * @tc.desc   Verify result with different return types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(computeTask, 2.0);
      taskGroup.addTask(stringTask, "world");
      taskGroup.addTask(booleanTask, 1.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(3);
        expect(typeof results[0]).assertEqual("number");
        expect(typeof results[1]).assertEqual("string");
        expect(typeof results[2]).assertEqual("boolean");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test2100

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_2100

     * @tc.desc   Verify result contains negative number -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(returnMinusOneTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(-1);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test2200

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_2200

     * @tc.desc   Verify result contains 0, false, empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(returnZeroTask);
      taskGroup.addTask(returnFalseTask);
      taskGroup.addTask(returnEmptyStringTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(0);
        expect(results[1] as boolean).assertFalse();
        expect(results[2] as string).assertEqual("");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test2300

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_2300

     * @tc.desc   Verify execute returns Promise resolving to results array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(Array.isArray(results)).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test2400

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_2400

     * @tc.desc   Verify 100 tasks in TaskGroup with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute5Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let largeGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i = 0; i < 100; i++) {
        largeGroup.addTask(quickTask, i + 0.0);
      }
      let configs: taskpool.Configs = { timeout: 30000 };
      try {
        let results = await taskpool.execute(largeGroup, configs);
        expect(results.length).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test2500

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_2500

     * @tc.desc   Verify TaskGroup cannot be executed again with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results1 = await taskpool.execute(taskGroup, configs);
        expect(results1.length).assertEqual(1);
        let errorCaught: boolean = false;
        try {
          await taskpool.execute(taskGroup, configs);
        } catch (error) {
          errorCaught = true;
        }
        expect(errorCaught).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test2600

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_2600

     * @tc.desc   Verify TaskGroup timeout error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(longRunningTask, 500.0);
      let configs: taskpool.Configs = { timeout: 100 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test2700

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_2700

     * @tc.desc   Verify single long task causing TaskGroup timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(quickTask, 10.0);
      taskGroup.addTask(longRunningTask, 500.0);
      taskGroup.addTask(quickTask, 20.0);
      let configs: taskpool.Configs = { timeout: 100 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test2800

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_2800

     * @tc.desc   Verify TaskGroup with error task throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(throwTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test2900

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_2900

     * @tc.desc   Verify TaskGroup partial task failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(partialFailTask, false);
      taskGroup.addTask(partialFailTask, true);
      taskGroup.addTask(partialFailTask, false);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test3000

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_3000

     * @tc.desc   Verify try-catch-finally normal execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false;
      let errorCaught: boolean = false;
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(orderTask, 42.0);
        let configs: taskpool.Configs = { timeout: 1000.0 };
        let results = await taskpool.execute(taskGroup, configs);
        expect(results[0] as number).assertEqual(42.0);
      } catch (error) {
        errorCaught = true;
      } finally {
        finallyExecuted = true;
      }
      expect(errorCaught).assertFalse();
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test3100

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_3100

     * @tc.desc   Verify try-catch-finally with timeout error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let catchExecuted: boolean = false;
      let finallyExecuted: boolean = false;
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(longRunningTask, 500.0);
        let configs: taskpool.Configs = { timeout: 100 };
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        catchExecuted = true;
      } finally {
        finallyExecuted = true;
      }
      expect(catchExecuted).assertTrue();
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test3200

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_3200

     * @tc.desc   Verify TaskGroup error caught by try-catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(throwTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test3300

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_3300

     * @tc.desc   Verify Promise.all with multiple TaskGroups and configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group1: taskpool.TaskGroup = new taskpool.TaskGroup();
      group1.addTask(orderTask, 1.0);
      let group2: taskpool.TaskGroup = new taskpool.TaskGroup();
      group2.addTask(orderTask, 2.0);
      let group3: taskpool.TaskGroup = new taskpool.TaskGroup();
      group3.addTask(orderTask, 3.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      let p1 = taskpool.execute(group1, configs);
      let p2 = taskpool.execute(group2, configs);
      let p3 = taskpool.execute(group3, configs);
      try {
        let allResults = await Promise.all([p1, p2, p3]);
        expect(allResults.length).assertEqual(3);
        expect(allResults[0][0] as number).assertEqual(1.0);
        expect(allResults[1][0] as number).assertEqual(2.0);
        expect(allResults[2][0] as number).assertEqual(3.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test3400

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_3400

     * @tc.desc   Verify Promise.all with different priority configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let highGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      highGroup.addTask(orderTask, 1.0);
      let lowGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      lowGroup.addTask(orderTask, 2.0);
      let highConfigs: taskpool.Configs = { timeout: 1000, priority: taskpool.Priority.HIGH };
      let lowConfigs: taskpool.Configs = { timeout: 1000, priority: taskpool.Priority.LOW };
      let p1 = taskpool.execute(highGroup, highConfigs);
      let p2 = taskpool.execute(lowGroup, lowConfigs);
      try {
        let allResults = await Promise.all([p1, p2]);
        expect(allResults.length).assertEqual(2);
        expect(allResults[0][0] as number).assertEqual(1.0);
        expect(allResults[1][0] as number).assertEqual(2.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test3500

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_3500

     * @tc.desc   Verify finally with TaskGroup execute and configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        expect().assertFail();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test3600

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_3600

     * @tc.desc   Verify sequential chain execution of TaskGroups with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(orderTask, 1.0);
      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup2.addTask(orderTask, 2.0);
      let taskGroup3: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup3.addTask(orderTask, 3.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let result1 = await taskpool.execute(taskGroup1, configs);
        let result2 = await taskpool.execute(taskGroup2, configs);
        let result3 = await taskpool.execute(taskGroup3, configs);
        expect(result1[0] as number).assertEqual(1.0);
        expect(result2[0] as number).assertEqual(2.0);
        expect(result3[0] as number).assertEqual(3.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test3700

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_3700

     * @tc.desc   Verify cancel TaskGroup during execution with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute5Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(longRunningTask, 500.0);
      let configs: taskpool.Configs = { timeout: 5000 };
      let executePromise = taskpool.execute(taskGroup, configs);
      try {
        await Utils.msSleep(50);
        taskpool.cancel(taskGroup);
        let errorCaught: boolean = false;
        try {
          await executePromise;
        } catch (error) {
          errorCaught = true;
        }
        expect(errorCaught).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute5Test3800

     * @tc.number SUB_TASKPOOL_EXECUTE5_TEST_3800

     * @tc.desc   Verify execute TaskGroup with longRunningTask and adequate timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute5Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(longRunningTask, 500.0);
      taskGroup.addTask(quickTask, 100.0);
      let configs: taskpool.Configs = { timeout: 2000, priority: taskpool.Priority.HIGH };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(2);
        expect(results[0] as string).assertEqual("success");
        expect(results[1] as number).assertEqual(100.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
