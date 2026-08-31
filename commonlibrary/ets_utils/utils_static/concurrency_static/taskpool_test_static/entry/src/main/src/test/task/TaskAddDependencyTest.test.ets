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

let simpleFunc = (): number => { return 100 }
let multiplyFunc = (args: number): number => { return args * 2.0 }
let addFunc = (args: number): number => { return args + 1.0 }
let delayFunc = (args: number): number => {
  let t: Long = Date.now()
  while (Date.now() - t < args) {}
  return args
}
let longDelayFunc = (): number => {
  let t: Long = Date.now()
  while (Date.now() - t < 500) {}
  return 100
}
let multiParamFunc = (a: number, b: string, c: boolean): string => {
  return a + '-' + b + '-' + c
}

export default function TaskAddDependencyTest(): void {
  describe('TaskAddDependencyTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   TaskAddDependencyTest0100
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_0100
     * @tc.desc   Verify Task.addDependency() with no parameters throws "addDependency has no params" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        task1.addDependency()
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskAddDependencyTest0200
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_0200
     * @tc.desc   Verify Task.addDependency() with one Task parameter adds dependency successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      let result2: number = 0;
      try {
        result2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let result1: number = 0;
      try {
        result1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result1).assertEqual(200)
      expect(result2).assertEqual(400)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest0300
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_0300
     * @tc.desc   Verify Task.addDependency() with two Task parameters adds multiple dependencies successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(task2, task3)
      let result2: number = 0;
      try {
        result2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let result3: number = 0;
      try {
        result3 = await taskpool.execute(task3) as number;
      } catch (error) {
        expect().assertFail();
      }
      let result1: number = 0;
      try {
        result1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result1).assertEqual(200)
      expect(result2).assertEqual(400)
      expect(result3).assertEqual(600)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest0400
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_0400
     * @tc.desc   Verify Task.addDependency() with five Task parameters adds dependencies successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let depTask1: taskpool.Task = new taskpool.Task(multiplyFunc, 10.0)
      let depTask2: taskpool.Task = new taskpool.Task(multiplyFunc, 20.0)
      let depTask3: taskpool.Task = new taskpool.Task(multiplyFunc, 30.0)
      let depTask4: taskpool.Task = new taskpool.Task(multiplyFunc, 40.0)
      let depTask5: taskpool.Task = new taskpool.Task(multiplyFunc, 50.0)
      task1.addDependency(depTask1, depTask2, depTask3, depTask4, depTask5)
      let r1: number = 0;
      try {
        r1 = await taskpool.execute(depTask1) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r2: number = 0;
      try {
        r2 = await taskpool.execute(depTask2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r3: number = 0;
      try {
        r3 = await taskpool.execute(depTask3) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r4: number = 0;
      try {
        r4 = await taskpool.execute(depTask4) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r5: number = 0;
      try {
        r5 = await taskpool.execute(depTask5) as number;
      } catch (error) {
        expect().assertFail();
      }
      let result: number = 0;
      try {
        result = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(100)
      expect(r1).assertEqual(20)
      expect(r2).assertEqual(40)
      expect(r3).assertEqual(60)
      expect(r4).assertEqual(80)
      expect(r5).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest0500
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_0500
     * @tc.desc   Verify Task.addDependency() with ten Task parameters adds dependencies successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let mainTask: taskpool.Task = new taskpool.Task(simpleFunc)
      let depTasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        let depTask: taskpool.Task = new taskpool.Task(multiplyFunc, i * 1.0)
        depTasks.push(depTask)
        mainTask.addDependency(depTask)
      }
      for (let i = 0; i < 10; i++) {
        try {
          await taskpool.execute(depTasks[i]);
        } catch (error) {
          expect().assertFail();
        }
      }
      let result: number = 0;
      try {
        result = await taskpool.execute(mainTask) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest0600
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_0600
     * @tc.desc   Verify Task.addDependency() with 100 Task parameters adds large number of dependencies successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let mainTask: taskpool.Task = new taskpool.Task(simpleFunc)
      let depTasks: taskpool.Task[] = []
      for (let i = 0; i < 100; i++) {
        let depTask: taskpool.Task = new taskpool.Task(multiplyFunc, i * 1.0)
        depTasks.push(depTask)
        mainTask.addDependency(depTask)
      }
      for (let i = 0; i < 100; i++) {
        try {
          await taskpool.execute(depTasks[i]);
        } catch (error) {
          expect().assertFail();
        }
      }
      let result: number = 0;
      try {
        result = await taskpool.execute(mainTask) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest0700
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_0700
     * @tc.desc   Verify Task.addDependency() with normal Task objects of different parameter types succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiParamFunc, 100.0, "hello", true)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      let result2: number = 0;
      try {
        result2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let result1: string = "";
      try {
        result1 = await taskpool.execute(task1) as string;
      } catch (error) {
        expect().assertFail();
      }
      expect(result1).assertEqual("100-hello-true")
      expect(result2).assertEqual(400)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest0800
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_0800
     * @tc.desc   Verify Task.addDependency() with groupTask as dependency throws "groupTask cannot be relied on" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let groupTask: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(groupTask)
      try {
        task1.addDependency(groupTask)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskAddDependencyTest0900
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_0900
     * @tc.desc   Verify Task.addDependency() with seqRunnerTask as dependency throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let seqTask: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let execPromise = runner.execute(seqTask)
      try {
        await execPromise;
      } catch (error) {
        expect().assertFail();
      }
      try {
        task1.addDependency(seqTask)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest1000
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_1000
     * @tc.desc   Verify Task.addDependency() with executed Task as dependency throws "seqRunnerTask or executedTask cannot be relied on" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      try {
        await taskpool.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      try {
        task1.addDependency(task2)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest1100
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_1100
     * @tc.desc   Verify Task.addDependency() with periodic Task as dependency throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let periodicTask: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      taskpool.executePeriodically(200, periodicTask)
      try {
        task1.addDependency(periodicTask)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof Error).assertTrue()
      }
      taskpool.cancel(periodicTask) // ✅ Add cancel to clean up periodic task
    })

    /**
     * @tc.name   TaskAddDependencyTest1200
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_1200
     * @tc.desc   Verify Task.addDependency() with mixed normal Task and groupTask throws "groupTask cannot be relied on" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let groupTask: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(groupTask)
      try {
        task1.addDependency(task2, groupTask)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskAddDependencyTest1300
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_1300
     * @tc.desc   Verify Task.addDependency() with multiple sequential addDependency calls works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(task2)
      task1.addDependency(task3)
      let r2: number = 0;
      try {
        r2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r3: number = 0;
      try {
        r3 = await taskpool.execute(task3) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r1: number = 0;
      try {
        r1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(r1).assertEqual(200)
      expect(r2).assertEqual(400)
      expect(r3).assertEqual(600)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest1400
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_1400
     * @tc.desc   Verify Task.addDependency() with single dependency executes tasks and returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(delayFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(simpleFunc)
      task1.addDependency(task2)
      let r1: number = 0;
      try {
        r1 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r2: number = 0;
      try {
        r2 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(r1).assertEqual(100)
      expect(r2).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest1500
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_1500
     * @tc.desc   Verify Task.addDependency() with multiple dependencies waits for all to complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      let task4: taskpool.Task = new taskpool.Task(multiplyFunc, 400.0)
      task1.addDependency(task2, task3, task4)
      let r2: number = 0;
      try {
        r2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r3: number = 0;
      try {
        r3 = await taskpool.execute(task3) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r4: number = 0;
      try {
        r4 = await taskpool.execute(task4) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r1: number = 0;
      try {
        r1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(r1).assertEqual(100)
      expect(r2).assertEqual(400)
      expect(r3).assertEqual(600)
      expect(r4).assertEqual(800)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest1600
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_1600
     * @tc.desc   Verify Task.addDependency() with chain dependency executes in correct order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(task2)
      task2.addDependency(task3)
      let r3: number = 0;
      try {
        r3 = await taskpool.execute(task3) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r2: number = 0;
      try {
        r2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r1: number = 0;
      try {
        r1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(r1).assertEqual(200)
      expect(r2).assertEqual(400)
      expect(r3).assertEqual(600)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest1700
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_1700
     * @tc.desc   Verify Task.addDependency() with direct circular dependency throws "There is a circular dependency" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      task1.addDependency(task2)
      try {
        task2.addDependency(task1)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskAddDependencyTest1800
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_1800
     * @tc.desc   Verify Task.addDependency() with self dependency throws "There is a circular dependency" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        task1.addDependency(task1)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskAddDependencyTest1900
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_1900
     * @tc.desc   Verify Task.addDependency() with triangle circular dependency throws "There is a circular dependency" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      task2.addDependency(task3)
      try {
        task3.addDependency(task1)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskAddDependencyTest2000
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_2000
     * @tc.desc   Verify Task.addDependency() with multi-layer indirect circular dependency throws "There is a circular dependency" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task4: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(task2)
      task2.addDependency(task3)
      task3.addDependency(task4)
      try {
        task4.addDependency(task2)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskAddDependencyTest2100
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_2100
     * @tc.desc   Verify Task.addDependency() on executed task throws "seqRunnerTask or executedTask cannot addDependency" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      try {
        await taskpool.execute(task1);
      } catch (error) {
        expect().assertFail();
      }
      try {
        task1.addDependency(task2)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest2200
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_2200
     * @tc.desc   Verify Task.addDependency() on seqRunnerTask throws "seqRunnerTask or executedTask cannot addDependency" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let seqTask: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let execPromise = runner.execute(seqTask)
      try {
        await execPromise;
      } catch (error) {
        expect().assertFail();
      }
      let task2: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        seqTask.addDependency(task2)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest2300
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_2300
     * @tc.desc   Verify Task.addDependency() on groupTask throws "groupTask cannot addDependency" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskAddDependencyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let groupTask: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(groupTask)
      let task2: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        groupTask.addDependency(task2)
        expect().assertFail()
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskAddDependencyTest2400
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_2400
     * @tc.desc   Verify Task.addDependency() with Promise.all waits for all dependencies to complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2, task3)
      let results: number[] = [];
      try {
        results = await Promise.all([
          taskpool.execute(task1) as Promise<number>,
          taskpool.execute(task2) as Promise<number>,
          taskpool.execute(task3) as Promise<number>
        ]);
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual(100)
      expect(results[1]).assertEqual(200)
      expect(results[2]).assertEqual(400)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest2500
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_2500
     * @tc.desc   Verify Task.addDependency() with multiple tasks concurrent execution order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskA: taskpool.Task = new taskpool.Task(delayFunc, 100.0)
      let taskB: taskpool.Task = new taskpool.Task(delayFunc, 100.0)
      let taskC: taskpool.Task = new taskpool.Task(simpleFunc)
      taskA.addDependency(taskB)
      taskB.addDependency(taskC)
      let results: number[] = [];
      try {
        results = await Promise.all([
          taskpool.execute(taskA) as Promise<number>,
          taskpool.execute(taskB) as Promise<number>,
          taskpool.execute(taskC) as Promise<number>
        ]);
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual(100)
      expect(results[1]).assertEqual(100)
      expect(results[2]).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest2600
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_2600
     * @tc.desc   Verify Task.addDependency() with two-layer dependency nesting executes in correct order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(task2)
      task2.addDependency(task3)
      let r3: number = 0;
      try {
        r3 = await taskpool.execute(task3) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r2: number = 0;
      try {
        r2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r1: number = 0;
      try {
        r1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(r3).assertEqual(600)
      expect(r2).assertEqual(400)
      expect(r1).assertEqual(200)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest2700
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_2700
     * @tc.desc   Verify Task.addDependency() with three-layer dependency nesting executes in correct order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task4: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(task2)
      task2.addDependency(task3)
      task3.addDependency(task4)
      let r4: number = 0;
      try {
        r4 = await taskpool.execute(task4) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r3: number = 0;
      try {
        r3 = await taskpool.execute(task3) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r2: number = 0;
      try {
        r2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r1: number = 0;
      try {
        r1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(r4).assertEqual(600)
      expect(r3).assertEqual(400)
      expect(r2).assertEqual(200)
      expect(r1).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest2800
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_2800
     * @tc.desc   Verify Task.addDependency() with parallel dependencies waits for all then executes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskAddDependencyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(delayFunc, 100.0)
      let task3: taskpool.Task = new taskpool.Task(delayFunc, 100.0)
      let task4: taskpool.Task = new taskpool.Task(delayFunc, 100.0)
      task1.addDependency(task2, task3, task4)
      let results: number[] = [];
      try {
        results = await Promise.all([
          taskpool.execute(task1) as Promise<number>,
          taskpool.execute(task2) as Promise<number>,
          taskpool.execute(task3) as Promise<number>,
          taskpool.execute(task4) as Promise<number>
        ]);
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(4)
      expect(results[0]).assertEqual(100)
      expect(results[1]).assertEqual(100)
      expect(results[2]).assertEqual(100)
      expect(results[3]).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest2900
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_2900
     * @tc.desc   Verify Task.addDependency() with sequential chain dependency produces consistent delay results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskAddDependencyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(delayFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(delayFunc, 100.0)
      let task3: taskpool.Task = new taskpool.Task(delayFunc, 100.0)
      task1.addDependency(task2)
      task2.addDependency(task3)
      let t3: number = 0;
      try {
        t3 = await taskpool.execute(task3) as number;
      } catch (error) {
        expect().assertFail();
      }
      let t2: number = 0;
      try {
        t2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let t1: number = 0;
      try {
        t1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(t3).assertEqual(100)
      expect(t2).assertEqual(100)
      expect(t1).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest3000
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_3000
     * @tc.desc   Verify Task.addDependency() with mixed sequential and parallel dependencies executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskAddDependencyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task4: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(task2)
      task2.addDependency(task3, task4)
      let r3: number = 0;
      try {
        r3 = await taskpool.execute(task3) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r4: number = 0;
      try {
        r4 = await taskpool.execute(task4) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r2: number = 0;
      try {
        r2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r1: number = 0;
      try {
        r1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(r3).assertEqual(400)
      expect(r4).assertEqual(600)
      expect(r2).assertEqual(200)
      expect(r1).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest3100
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_3100
     * @tc.desc   Verify Task.addDependency() with multiple tasks depending on same task (fan-out pattern)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskAddDependencyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let sharedTask: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(addFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(sharedTask)
      task2.addDependency(sharedTask)
      task3.addDependency(sharedTask)
      let rShared: number = 0;
      try {
        rShared = await taskpool.execute(sharedTask) as number;
      } catch (error) {
        expect().assertFail();
      }
      let results: number[] = [];
      try {
        results = await Promise.all([
          taskpool.execute(task1) as Promise<number>,
          taskpool.execute(task2) as Promise<number>,
          taskpool.execute(task3) as Promise<number>
        ]);
      } catch (error) {
        expect().assertFail();
      }
      expect(rShared).assertEqual(200)
      expect(results[0]).assertEqual(100)
      expect(results[1]).assertEqual(201)
      expect(results[2]).assertEqual(600)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest3200
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_3200
     * @tc.desc   Verify task executes independently after adding then removing dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      task1.removeDependency(task2)
      let results: number[] = [];
      try {
        results = await Promise.all([
          taskpool.execute(task1) as Promise<number>,
          taskpool.execute(task2) as Promise<number>
        ]);
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(2)
      expect(results[0]).assertEqual(200)
      expect(results[1]).assertEqual(400)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest3300
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_3300
     * @tc.desc   Verify Task.addDependency() with execute returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(addFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(addFunc, 200.0)
      task1.addDependency(task2)
      let r2: number = 0;
      try {
        r2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r1: number = 0;
      try {
        r1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(r1).assertEqual(101)
      expect(r2).assertEqual(201)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest3400
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_3400
     * @tc.desc   Verify canceling a running dependent task does not reject its execute promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskAddDependencyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longDelayFunc)
      let task2: taskpool.Task = new taskpool.Task(simpleFunc)
      task1.addDependency(task2)
      let executePromise2 = taskpool.execute(task2)
      try {
        await executePromise2;
      } catch (error) {
        expect().assertFail();
      }
      let executePromise1 = taskpool.execute(task1)
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running3400: boolean = false
      let begin3400: number = Date.now()
      while (!running3400 && Date.now() - begin3400 < 10000) {
        let poolInfo3400: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfo3400.taskInfos) {
          if (taskInfo.taskId === task1.taskId && taskInfo.state === taskpool.State.RUNNING) {
            running3400 = true
          }
        }
        if (!running3400) {
          try {
            await Utils.msSleep(20);
          } catch (error) {
            expect().assertFail();
          }
        }
      }
      expect(running3400).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50);
      } catch (error) {
        expect().assertFail();
      }
      try {
        taskpool.cancel(task1)
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }
      // 裸 await 包进 try/catch：若 cancel 意外早于启动导致 Promise reject，直接断言失败而非抛异常
      try {
        let result: number = await executePromise1 as number
        expect(result).assertEqual(100)
      } catch (e) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest3500
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_3500
     * @tc.desc   Verify Task.addDependency() with timeout config on dependent task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskAddDependencyTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      task1.addDependency(task2)
      let caught: boolean = false
      try {
        await taskpool.execute(task1, { timeout: 5000 })
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
      }
      expect(caught).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest3600
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_3600
     * @tc.desc   Verify Task.addDependency() with isDone verification after dependency execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      task1.addDependency(task2)
      expect(task1.isDone()).assertFalse()
      expect(task2.isDone()).assertFalse()
      try {
        await taskpool.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      expect(task2.isDone()).assertTrue()
      expect(task1.isDone()).assertFalse()
      try {
        await taskpool.execute(task1);
      } catch (error) {
        expect().assertFail();
      }
      expect(task1.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest3700
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_3700
     * @tc.desc   Verify Task.addDependency() with duplicate same dependency still executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      task1.addDependency(task2)
      task1.addDependency(task2)
      let r2: number = 0;
      try {
        r2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      let r1: number = 0;
      try {
        r1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(r1).assertEqual(100)
      expect(r2).assertEqual(200)
      done();
    })

    /**
     * @tc.name   TaskAddDependencyTest3800
     * @tc.number SUB_TASK_ADD_DEPENDENCY_TEST_3800
     * @tc.desc   Verify Task.addDependency() with getTask returns correct task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAddDependencyTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      task1.addDependency(task2)
      let retrievedTask: taskpool.Task | undefined = taskpool.getTask(task2.taskId)
      expect(retrievedTask !== undefined).assertTrue()
      if (retrievedTask !== undefined) {
        expect(retrievedTask.taskId).assertEqual(task2.taskId)
      }
    })
  })
}
