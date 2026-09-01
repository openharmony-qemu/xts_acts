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

import {describe, afterAll, it, expect, TestType, Size, Level, beforeAll} from '../../../../hypium';
import Utils from '../Util.test';

let simpleFunc = (): number => { return 100 }
let multiplyFunc = (args: number): number => { return args * 2.0 }
let longDelayFunc = (): number => {
  let t: Long = Date.now()
  while (Date.now() - t < 100) {}
  return 100
}
let multiParamFunc = (a: number, b: string, c: boolean): string => {
  return a + '-' + b + '-' + c
}

export default function TaskRemoveDependencyTest(): void {
  describe('TaskRemoveDependencyTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskRemoveDependencyTest0100
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_0100
     * @tc.desc   Verify Task.removeDependency() with no parameters throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskRemoveDependencyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let errorThrown: boolean = false
      try {
        task1.removeDependency()
      } catch (error) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
    })

    /**
     * @tc.name   TaskRemoveDependencyTest0200
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_0200
     * @tc.desc   Verify Task.removeDependency() with one Task parameter removes dependency successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskRemoveDependencyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      task1.removeDependency(task2)
      let result: number = 0;
      try {
        result = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(200)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest0300
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_0300
     * @tc.desc   Verify Task.removeDependency() with multiple Task parameters removes dependencies successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskRemoveDependencyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(task2, task3)
      task1.removeDependency(task2, task3)
      let result: number = 0;
      try {
        result = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(200)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest0400
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_0400
     * @tc.desc   Verify Task.removeDependency() with spread syntax of Task array removes dependencies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskRemoveDependencyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let tasks: taskpool.Task[] = [
        new taskpool.Task(multiplyFunc, 200.0),
        new taskpool.Task(multiplyFunc, 300.0),
        new taskpool.Task(multiplyFunc, 400.0)
      ]
      task1.addDependency(tasks[0], tasks[1], tasks[2])
      task1.removeDependency(tasks[0], tasks[1], tasks[2])
      let result: number = 0;
      try {
        result = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(200)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest0500
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_0500
     * @tc.desc   Verify Task.removeDependency() with Task not having dependency throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskRemoveDependencyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let errorThrown: boolean = false
      try {
        task1.removeDependency(task2)
      } catch (error) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
    })

    /**
     * @tc.name   TaskRemoveDependencyTest0600
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_0600
     * @tc.desc   Verify Task.removeDependency() on executed current task throws executedTask error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskRemoveDependencyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      try {
        await taskpool.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await taskpool.execute(task1);
      } catch (error) {
        expect().assertFail();
      }
      let errorThrown: boolean = false
      try {
        task1.removeDependency(task2)
      } catch (error) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest0700
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_0700
     * @tc.desc   Verify Task.removeDependency() with executed parameter task throws dependent and executed error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskRemoveDependencyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      try {
        await taskpool.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      let errorThrown: boolean = false
      try {
        task1.removeDependency(task2)
      } catch (error) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest0800
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_0800
     * @tc.desc   Verify Task.removeDependency() with duplicate addDependency removes dependency correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskRemoveDependencyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      task1.addDependency(task2)
      task1.removeDependency(task2)
      let result: number = 0;
      try {
        result = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(200)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest0900
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_0900
     * @tc.desc   Verify Task can add new dependency after removing previous dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskRemoveDependencyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(task2)
      task1.removeDependency(task2)
      task1.addDependency(task3)
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
      expect(result3).assertEqual(600)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest1000
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_1000
     * @tc.desc   Verify remaining dependency still valid after partial remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskRemoveDependencyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task1.addDependency(task2, task3)
      task1.removeDependency(task2)
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
      expect(result3).assertEqual(600)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest1100
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_1100
     * @tc.desc   Verify dependency chain breaks after removing dependency from chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskRemoveDependencyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task2.addDependency(task3)
      task1.addDependency(task2)
      task1.removeDependency(task2)
      let result1: number = 0;
      try {
        result1 = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result1).assertEqual(200)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest1200
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_1200
     * @tc.desc   Verify Task.removeDependency() after already removed dependency throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskRemoveDependencyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      task1.removeDependency(task2)
      let errorThrown: boolean = false
      try {
        task1.removeDependency(task2)
      } catch (error) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
    })

    /**
     * @tc.name   TaskRemoveDependencyTest1300
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_1300
     * @tc.desc   Verify Task.removeDependency() error caught by try-catch correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskRemoveDependencyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let errorCaught: boolean = false
      try {
        task1.removeDependency(task2)
      } catch (error) {
        errorCaught = true
      }
      expect(errorCaught).assertTrue()
    })

    /**
     * @tc.name   TaskRemoveDependencyTest1400
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_1400
     * @tc.desc   Verify multiple add and remove cycles on same dependency work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskRemoveDependencyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      task1.removeDependency(task2)
      task1.addDependency(task2)
      task1.removeDependency(task2)
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
     * @tc.name   TaskRemoveDependencyTest1500
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_1500
     * @tc.desc   Verify diamond dependency partial remove updates dependencies correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskRemoveDependencyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskA: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let taskB: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let taskC: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      let taskD: taskpool.Task = new taskpool.Task(multiplyFunc, 400.0)
      taskA.addDependency(taskB, taskC)
      taskB.addDependency(taskD)
      taskC.addDependency(taskD)
      taskA.removeDependency(taskB)
      let resultD: number = 0;
      try {
        resultD = await taskpool.execute(taskD) as number;
      } catch (error) {
        expect().assertFail();
      }
      let resultC: number = 0;
      try {
        resultC = await taskpool.execute(taskC) as number;
      } catch (error) {
        expect().assertFail();
      }
      let resultA: number = 0;
      try {
        resultA = await taskpool.execute(taskA) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(resultA).assertEqual(200)
      expect(resultC).assertEqual(600)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest1600
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_1600
     * @tc.desc   Verify concurrent removeDependency on multiple tasks executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskRemoveDependencyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      let depTask1: taskpool.Task = new taskpool.Task(multiplyFunc, 10.0)
      let depTask2: taskpool.Task = new taskpool.Task(multiplyFunc, 20.0)
      let depTask3: taskpool.Task = new taskpool.Task(multiplyFunc, 30.0)
      task1.addDependency(depTask1)
      task2.addDependency(depTask2)
      task3.addDependency(depTask3)
      task1.removeDependency(depTask1)
      task2.removeDependency(depTask2)
      task3.removeDependency(depTask3)
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
      expect(results[0]).assertEqual(200)
      expect(results[1]).assertEqual(400)
      expect(results[2]).assertEqual(600)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest1700
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_1700
     * @tc.desc   Verify removeDependency in main thread after dependency task executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskRemoveDependencyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      let result2: number = 0;
      try {
        result2 = await taskpool.execute(task2) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result2).assertEqual(400)
      let errorThrown: boolean = false
      try {
        task1.removeDependency(task2)

      } catch (error) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest1800
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_1800
     * @tc.desc   Verify task executes immediately after dependency removed by timer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskRemoveDependencyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      task1.addDependency(task2)
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      task1.removeDependency(task2)
      let startTime: Long = Date.now()
      let result: number = 0;
      try {
        result = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      let elapsedTime: Long = Date.now() - startTime
      expect(result).assertEqual(200)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest1900
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_1900
     * @tc.desc   Verify removeDependency during task execution throws executedTask error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskRemoveDependencyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longDelayFunc)
      let task2: taskpool.Task = new taskpool.Task(simpleFunc)
      task1.addDependency(task2)
      let executePromise = taskpool.execute(task2)
      try {
        await executePromise;
      } catch (error) {
        expect().assertFail();
      }
      let executePromise1 = taskpool.execute(task1)
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      let removeErrorThrown: boolean = false
      try {
        task1.removeDependency(task2)

      } catch (error) {
        removeErrorThrown = true
      }
      expect(removeErrorThrown).assertTrue()
      try {
        await executePromise1
      } catch (e) {
      }
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest2000
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_2000
     * @tc.desc   Verify Task.removeDependency() with self dependency throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskRemoveDependencyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let selfDepAdded: boolean = false
      let removeErrorThrown: boolean = false
      try {
        task1.addDependency(task1)
        selfDepAdded = true
      } catch (e) {
      }
      if (selfDepAdded) {
        try {
          task1.removeDependency(task1)
        } catch (error) {
          removeErrorThrown = true
        }
        expect(removeErrorThrown).assertTrue()
      }
    })

    /**
     * @tc.name   TaskRemoveDependencyTest2100
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_2100
     * @tc.desc   Verify Task.removeDependency() with large number of dependencies removes all successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskRemoveDependencyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let mainTask: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let depTasks: taskpool.Task[] = []
      for (let i = 0; i < 100; i++) {
        let depTask: taskpool.Task = new taskpool.Task(multiplyFunc, i * 1.0)
        depTasks.push(depTask)
        mainTask.addDependency(depTask)
      }
      for (let i = 0; i < 100; i++) {
        mainTask.removeDependency(depTasks[i])
      }
      let result: number = 0;
      try {
        result = await taskpool.execute(mainTask) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(200)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest2200
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_2200
     * @tc.desc   Verify execution order adjusts correctly after dependency removal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskRemoveDependencyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      task2.addDependency(task3)
      task1.addDependency(task2)
      task1.removeDependency(task2)
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
      expect(results[0]).assertEqual(200)
      expect(results[1]).assertEqual(400)
      expect(results[2]).assertEqual(600)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest2300
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_2300
     * @tc.desc   Verify Task.removeDependency() with multi-parameter Task removes dependency correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskRemoveDependencyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiParamFunc, 100.0, "test", true)
      let task2: taskpool.Task = new taskpool.Task(multiParamFunc, 200.0, "demo", false)
      task1.addDependency(task2)
      task1.removeDependency(task2)
      let result: string = "";
      try {
        result = await taskpool.execute(task1) as string;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual("100-test-true")
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest2400
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_2400
     * @tc.desc   Verify task still works after removeDependency error and subsequent correct operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskRemoveDependencyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let errorThrown: boolean = false
      try {
        task1.removeDependency(task2)
      } catch (error) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      task1.addDependency(task2)
      task1.removeDependency(task2)
      let result: number = 0;
      try {
        result = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(200)
      done();
    })

    /**
     * @tc.name   TaskRemoveDependencyTest2500
     * @tc.number SUB_TASK_REMOVE_DEPENDENCY_TEST_2500
     * @tc.desc   Verify task state correct after continuous error operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskRemoveDependencyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 300.0)
      let errorThrown: boolean = false
      try {
        task1.removeDependency()
      } catch (error) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      errorThrown = false
      try {
        task1.removeDependency(task2)
      } catch (error) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      task1.addDependency(task3)
      task1.removeDependency(task3)
      let result: number = 0;
      try {
        result = await taskpool.execute(task1) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(200)
      done();
    })
  })
}
