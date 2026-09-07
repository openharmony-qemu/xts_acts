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

// Helper functions for executePeriodically tests
function simplePeriodicTask(): void {
  taskpool.Task.sendData(1);
}

function periodicTaskWithArg(n: number): void {
  taskpool.Task.sendData(n);
}

function multiArgPeriodicTask(a: number, b: number): void {
  taskpool.Task.sendData(a + b);
}

function namedPeriodicTask(): void {
  taskpool.Task.sendData(1);
}

function objectPeriodicTask(): Record<string, number> {
  let obj: Record<string, number> = {};
  obj["value"] = 100;
  return obj;
}

function arrayPeriodicTask(): number[] {
  return [1, 2, 3, 4, 5];
}

function voidPeriodicTask(): void {}

function parentPeriodicFunc(): number {
  return 10;
}

function childPeriodicFunc(): number {
  return 20;
}

function parentPeriodicFunc1(): number {
  return 10;
}

function parentPeriodicFunc2(): number {
  return 20;
}

function childMultiDepFunc(): number {
  return 30;
}

function simpleExecTask(): number {
  return 1;
}

// Module-level array to track active periodic tasks for cleanup
let activePeriodicTasks: taskpool.Task[] = [];

export default function TaskpoolExecutePeriodicallyTest(): void {
  describe('TaskpoolExecutePeriodicallyTest', (): void => {
    beforeAll((): void => {
    })
    // afterEach hook to ensure all periodic tasks are canceled
    afterEach((): void => {
      for (let task of activePeriodicTasks) {
        try {
          taskpool.cancel(task);
          activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
        } catch (e) {
          // Task may already be canceled or completed
        }
      }
      activePeriodicTasks = [];
    });

    afterAll((): void => {})

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest0100

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_0100

     * @tc.desc   Verify executePeriodically with required params (period + task)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      let maxWait: number = 0;
      while (executeCount.load() < 3 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 3).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest0200

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_0200

     * @tc.desc   Verify executePeriodically without priority uses default MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      let maxWait: number = 0;
      while (executeCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest0300

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_0300

     * @tc.desc   Verify executePeriodically with priority parameter (HIGH)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task, taskpool.Priority.HIGH);
      let maxWait: number = 0;
      while (executeCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest0400

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_0400

     * @tc.desc   Verify executePeriodically with period boundary value 1ms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(1, task);
      let maxWait: number = 0;
      while (executeCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest0500

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_0500

     * @tc.desc   Verify executePeriodically runs repeatedly during a 2500ms observation window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      try {
        await Utils.msSleep(2500);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 1).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest0600

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_0600

     * @tc.desc   Verify executePeriodically throws error when period is negative (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(voidPeriodicTask);
      let errorCaught: boolean = false;
      try {
        taskpool.executePeriodically(-1, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest0700

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_0700

     * @tc.desc   Verify executePeriodically throws error when period is -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(voidPeriodicTask);
      let errorCaught: boolean = false;
      try {
        taskpool.executePeriodically(-100, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest0800

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_0800

     * @tc.desc   Verify executePeriodically throws error when period is -2147483648
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(voidPeriodicTask);
      let errorCaught: boolean = false;
      try {
        taskpool.executePeriodically(-2147483648, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest0900

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_0900

     * @tc.desc   Verify executePeriodically with normal Task object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(periodicTaskWithArg, 100.0);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      try {
        await Utils.msSleep(1200);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest1000

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_1000

     * @tc.desc   Verify executePeriodically with Task carrying multiple args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(multiArgPeriodicTask, 10.0, 20.0);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      try {
        await Utils.msSleep(1200);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest1100

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_1100

     * @tc.desc   Verify executePeriodically with named Task object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task("myPeriodicTask", namedPeriodicTask);
      activePeriodicTasks.push(task);
      expect(task.name).assertEqual("myPeriodicTask");
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      let maxWait: number = 0;
      while (executeCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest1200

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_1200

     * @tc.desc   Verify executePeriodically repeatedly executes Task returning object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let successCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(objectPeriodicTask);
      activePeriodicTasks.push(task);
      let cbSucc0: () => void = (): void => {
        successCount.fetchAdd(1);
      }
      task.onExecutionSucceeded(cbSucc0);
      taskpool.executePeriodically(200, task);
      let maxWait: number = 0;
      while (successCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(successCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest1300

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_1300

     * @tc.desc   Verify executePeriodically repeatedly executes Task returning array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let successCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(arrayPeriodicTask);
      activePeriodicTasks.push(task);
      let cbSucc1: () => void = (): void => {
        successCount.fetchAdd(1);
      }
      task.onExecutionSucceeded(cbSucc1);
      taskpool.executePeriodically(200, task);
      let maxWait: number = 0;
      while (successCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(successCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest1400

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_1400

     * @tc.desc   Verify executePeriodically repeatedly executes void return Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let successCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(voidPeriodicTask);
      activePeriodicTasks.push(task);
      let cbSucc2: () => void = (): void => {        successCount.fetchAdd(1);}
      task.onExecutionSucceeded(cbSucc2);
      taskpool.executePeriodically(200, task);
      let maxWait: number = 0;
      while (successCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(successCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest1500

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_1500

     * @tc.desc   Verify executePeriodically with Priority.MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task, taskpool.Priority.MEDIUM);
      let maxWait: number = 0;
      while (executeCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest1600

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_1600

     * @tc.desc   Verify executePeriodically with Priority.LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task, taskpool.Priority.LOW);
      let maxWait: number = 0;
      while (executeCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest1700

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_1700

     * @tc.desc   Verify executePeriodically with Priority.IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task, taskpool.Priority.IDLE);
      let maxWait: number = 0;
      while (executeCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest1800

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_1800

     * @tc.desc   Verify executePeriodically throws error for already executed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleExecTask);
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let errorCaught: boolean = false;
      try {
        taskpool.executePeriodically(200, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest1900

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_1900

     * @tc.desc   Verify executePeriodically throws error for task executed via executeDelayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleExecTask);
      try {
        await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      let errorCaught: boolean = false;
      try {
        taskpool.executePeriodically(200, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest2000

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_2000

     * @tc.desc   Verify executePeriodically throws error for task with single dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let parentTask: taskpool.Task = new taskpool.Task(parentPeriodicFunc);
      let childTask: taskpool.Task = new taskpool.Task(childPeriodicFunc);
      childTask.addDependency(parentTask);
      let errorCaught: boolean = false;
      try {
        taskpool.executePeriodically(200, childTask);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest2100

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_2100

     * @tc.desc   Verify executePeriodically throws error for task with multiple dependencies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let parentTask1: taskpool.Task = new taskpool.Task(parentPeriodicFunc1);
      let parentTask2: taskpool.Task = new taskpool.Task(parentPeriodicFunc2);
      let childTask: taskpool.Task = new taskpool.Task(childMultiDepFunc);
      childTask.addDependency(parentTask1);
      childTask.addDependency(parentTask2);
      let errorCaught: boolean = false;
      try {
        taskpool.executePeriodically(200, childTask);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest2200

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_2200

     * @tc.desc   Verify finally always executes in try-catch-finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(voidPeriodicTask);
      let errorCaught: boolean = false;
      let finallyExecuted: boolean = false;
      try {
        taskpool.executePeriodically(-1, task);
      } catch (error) {
        errorCaught = true;
      } finally {
        finallyExecuted = true;
      }
      expect(errorCaught).assertTrue();
      expect(finallyExecuted).assertTrue();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest2300

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_2300

     * @tc.desc   Verify executePeriodically multiple execution intervals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      let maxWait: number = 0;
      while (executeCount.load() < 5 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 5).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest2400

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_2400

     * @tc.desc   Verify executePeriodically with 200ms period over a 1500ms window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      try {
        await Utils.msSleep(1500);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest2500

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_2500

     * @tc.desc   Verify cancel stops periodic task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecutePeriodicallyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      let maxWait: number = 0;
      while (executeCount.load() < 1 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      let countBeforeCancel: number = executeCount.load();
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      try {
        await Utils.msSleep(1000);
      } catch (error) {
        expect().assertFail();
      }
      expect(executeCount.load() <= countBeforeCancel + 1).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest2600

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_2600

     * @tc.desc   Verify unregister onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          receivedCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      let maxWait: number = 0;
      while (receivedCount.load() < 1 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      expect(receivedCount.load() >= 1).assertTrue();
      task.onReceiveData();
      // unregister can race with one callback already dispatched. First drain the in-flight delivery,
      // then take an exact quiescent snapshot and prove it remains unchanged across later periods.
      try {
        await Utils.msSleep(300);
      } catch (error) {
        expect().assertFail();
      }
      let countAfterDrain: number = receivedCount.load();
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedCount.load()).assertEqual(countAfterDrain);
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest2700

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_2700

     * @tc.desc   Verify periodic task stops execution after cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let successCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          successCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      let maxWait: number = 0;
      while (successCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(successCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest2800

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_2800

     * @tc.desc   Verify multiple periodic tasks concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecutePeriodicallyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1Count: AtomicInt = new AtomicInt(0);
      let task2Count: AtomicInt = new AtomicInt(0);
      let task3Count: AtomicInt = new AtomicInt(0);
      let task1: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      let task2: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      let task3: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task1);
      activePeriodicTasks.push(task2);
      activePeriodicTasks.push(task3);
      task1.onReceiveData((data: Object) => {
        if (data !== undefined) {
          task1Count.fetchAdd(1);
        }
      });
      task2.onReceiveData((data: Object) => {
        if (data !== undefined) {
          task2Count.fetchAdd(1);
        }
      });
      task3.onReceiveData((data: Object) => {
        if (data !== undefined) {
          task3Count.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task1);
      taskpool.executePeriodically(200, task2);
      taskpool.executePeriodically(200, task3);
      let maxWait: number = 0;
      while ((task1Count.load() < 2 || task2Count.load() < 2 || task3Count.load() < 2) && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(task1);
      taskpool.cancel(task2);
      taskpool.cancel(task3);
      expect(task1Count.load() >= 2).assertTrue();
      expect(task2Count.load() >= 2).assertTrue();
      expect(task3Count.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest2900

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_2900

     * @tc.desc   Verify different period concurrent periodic tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecutePeriodicallyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let shortCount: AtomicInt = new AtomicInt(0);
      let longCount: AtomicInt = new AtomicInt(0);
      let shortTask: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      let longTask: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(shortTask);
      activePeriodicTasks.push(longTask);
      shortTask.onReceiveData((data: Object) => {
        if (data !== undefined) {
          shortCount.fetchAdd(1);
        }
      });
      longTask.onReceiveData((data: Object) => {
        if (data !== undefined) {
          longCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, shortTask);
      taskpool.executePeriodically(1000, longTask);
      let waitCount2900: number = 0
      while ((shortCount.load() < 12 || longCount.load() < 3) && waitCount2900 < 250) {
        try {
          await Utils.msSleep(20);
        } catch (error) {
          expect().assertFail();
        }
        waitCount2900++
      }
      expect(shortCount.load()).assertLargerOrEqual(12);
      expect(longCount.load()).assertLargerOrEqual(3);
      taskpool.cancel(shortTask);
      taskpool.cancel(longTask);
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      // cancel is asynchronous; in-flight callback delivery may complete after cancel.
      expect(shortCount.load()).assertLargerOrEqual(12);
      expect(longCount.load()).assertLargerOrEqual(3);
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest3000

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_3000

     * @tc.desc   Verify Timer trigger starts periodic task after delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecutePeriodicallyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.executePeriodically(200, task);
      try {
        await Utils.msSleep(1500);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest3100

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_3100

     * @tc.desc   Verify Timer cancel stops periodic task after delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecutePeriodicallyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let executeCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      activePeriodicTasks.push(task);
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, task);
      try {
        await Utils.msSleep(1500);
      } catch (error) {
        expect().assertFail();
      }
      try {
        taskpool.cancel(task);
      } catch (error) {
        expect().assertFail();
      }
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task);
      let countBeforeCheck: number = executeCount.load();
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(executeCount.load() - countBeforeCheck <= 1).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest3200

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_3200

     * @tc.desc   Verify sequential chain: single execute then periodic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let singleTask: taskpool.Task = new taskpool.Task(simpleExecTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(singleTask);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(1);
      let periodicTask: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      let executeCount: AtomicInt = new AtomicInt(0);
      activePeriodicTasks.push(periodicTask);
      periodicTask.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, periodicTask);
      let maxWait: number = 0;
      while (executeCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(periodicTask);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest3300

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_3300

     * @tc.desc   Verify condition chain: result decides periodic task start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let shouldStartPeriodic: boolean = false;
      let conditionTask: taskpool.Task = new taskpool.Task(simpleExecTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(conditionTask);
      } catch (error) {
        expect().assertFail();
      }
      if (result as number === 1) {
        shouldStartPeriodic = true;
      }
      expect(shouldStartPeriodic).assertTrue();
      if (shouldStartPeriodic) {
        let periodicTask: taskpool.Task = new taskpool.Task(simplePeriodicTask);
        let executeCount: AtomicInt = new AtomicInt(0);
        activePeriodicTasks.push(periodicTask);
        periodicTask.onReceiveData((data: Object) => {
          if (data !== undefined) {
            executeCount.fetchAdd(1);
          }
        });
        taskpool.executePeriodically(200, periodicTask);
        let maxWait: number = 0;
        while (executeCount.load() < 2 && maxWait < 3000) {
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect().assertFail();
          }
          maxWait += 100;
        }
        taskpool.cancel(periodicTask);
        activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== periodicTask);
        expect(executeCount.load() >= 2).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecutePeriodicallyTest3400

     * @tc.number SUB_TASKPOOL_EXECUTE_PERIODICALLY_TEST_3400

     * @tc.desc   Verify exception interrupts periodic task start flow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecutePeriodicallyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorCaught: boolean = false;
      let task: taskpool.Task = new taskpool.Task(voidPeriodicTask);
      try {
        taskpool.executePeriodically(-1, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      let newTask: taskpool.Task = new taskpool.Task(simplePeriodicTask);
      let executeCount: AtomicInt = new AtomicInt(0);
      activePeriodicTasks.push(newTask);
      newTask.onReceiveData((data: Object) => {
        if (data !== undefined) {
          executeCount.fetchAdd(1);
        }
      });
      taskpool.executePeriodically(200, newTask);
      let maxWait: number = 0;
      while (executeCount.load() < 2 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      taskpool.cancel(newTask);
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== newTask);
      expect(executeCount.load() >= 2).assertTrue();
      done();
    })

  })
}
