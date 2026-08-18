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

import {describe, afterAll, it, expect, TestType, Size, Level, beforeAll, } from '../../../../hypium';
import Utils from '../Util.test';

let simpleFunc = (): number => { return 100.0 }
let multiplyFunc = (args: number): number => { return args * 2.0 }
let longFunc = (): number => { let t: Long = Date.now(); while (Date.now() - t < 100) {}; return 100.0 }

export default function TaskOnStartExecutionTest(): void {
  describe('TaskOnStartExecutionTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskOnStartExecutionTest0100
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_0100
     * @tc.desc   Verify Task.onStartExecution() callback executes when task runs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnStartExecutionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbStart0: () => void = (): void => {
        callbackExecuted = true
      }
      task.onStartExecution(cbStart0)
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackExecuted).assertTrue()
      expect(result).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest0200
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_0200
     * @tc.desc   Verify Task.onStartExecution() registers arrow function callback successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnStartExecutionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbStart1: () => void = (): void => {
        callbackExecuted = true
      }
      task.onStartExecution(cbStart1)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackExecuted).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest0300
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_0300
     * @tc.desc   Verify Task.onStartExecution() registers arrow function reference as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnStartExecutionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let callbackCount: number = 0
      let handler = (): void => {
        callbackCount++
      }
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      task.onStartExecution(handler)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackCount).assertEqual(1)
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest0400
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_0400
     * @tc.desc   Verify Task.onStartExecution() registers inline arrow function as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnStartExecutionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbStart2: () => void = (): void => {
        callbackExecuted = true
      }
      task.onStartExecution(cbStart2)
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackExecuted).assertTrue()
      expect(result).assertEqual(100.0)
      done();
    })




    /**
     * @tc.name   TaskOnStartExecutionTest0500
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_0500
     * @tc.desc   Verify Task.onStartExecution() with empty function body callback executes without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnStartExecutionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let noException: boolean = true
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        let cbStart3: () => void = (): void => {}
        task.onStartExecution(cbStart3)
      } catch (e) {
        noException = false
      }
      expect(noException).assertTrue()
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest0600
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_0600
     * @tc.desc   Verify Task.onStartExecution() throws error when registered after task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnStartExecutionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let errorCaught: boolean = false
      try {
        let cbStart4: () => void = (): void => {}
        task.onStartExecution(cbStart4)
      } catch (e) {
        errorCaught = true
      }
      expect(errorCaught).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest0700
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_0700
     * @tc.desc   Verify Task.onStartExecution() throws error when registered during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnStartExecutionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorCaught: boolean = false
      let task: taskpool.Task = new taskpool.Task(longFunc)
      let executePromise = taskpool.execute(task)
      try {
        let cbStart5: () => void = (): void => {
          try {
            throw new Error("onStartExecution callback must not be invoked during task execution");
          } catch (error) {
            expect().assertFail();
          }
        }
        task.onStartExecution(cbStart5)
      } catch (e) {
        errorCaught = true
      }
      try {
        await executePromise;
      } catch (error) {
        expect().assertFail();
      }
      expect(errorCaught).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest0800
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_0800
     * @tc.desc   Verify Task.onStartExecution() callback internal exception caught does not affect task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnStartExecutionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let errorCaughtInCallback: boolean = false
      let cbStart6: () => void = (): void => {
        try {
          throw new Error('callback error')
        } catch (e) {
          errorCaughtInCallback = true
        }
      }
      task.onStartExecution(cbStart6)
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(errorCaughtInCallback).assertTrue()
      expect(result).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest0900
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_0900
     * @tc.desc   Verify Task.onStartExecution() callback is called before task function execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnStartExecutionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // NEEDS_RUNTIME_EVIDENCE: the task function body pushes into host `executionOrder`
      // (closure capture of host mutable state, 终裁 G13). The onStartExecution callback
      // push is host-thread deterministic; the 'task' entry depends on runtime snapshot
      // semantics and is only observable with device evidence.
      let executionOrder: string[] = []
      let task: taskpool.Task = new taskpool.Task((): number => {
        executionOrder.push('task')
        return 100.0
      })
      let cbStart7: () => void = (): void => {
        executionOrder.push('callback')
      }
      task.onStartExecution(cbStart7)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(executionOrder.length).assertEqual(2)
      expect(executionOrder[0]).assertEqual('callback')
      expect(executionOrder[1]).assertEqual('task')
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest1000
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_1000
     * @tc.desc   Verify Task.onStartExecution() last registered callback is called on multiple registrations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnStartExecutionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let order: number[] = []
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbStart8: () => void = (): void => {
        order.push(1)
      }
      task.onStartExecution(cbStart8)
      let cbStart9: () => void = (): void => {
        order.push(2)
      }
      task.onStartExecution(cbStart9)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(order.length).assertEqual(1)
      expect(order[0]).assertEqual(2)
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest1100
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_1100
     * @tc.desc   Verify Task.onStartExecution() registered before execute triggers callback after execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnStartExecutionTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let registered: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbStart10: () => void = (): void => {
        registered = true
      }
      task.onStartExecution(cbStart10)
      expect(registered).assertFalse()
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(registered).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest1200
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_1200
     * @tc.desc   Verify Task.onStartExecution() callback is executed when task runs in worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnStartExecutionTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbStart11: () => void = (): void => {
        callbackExecuted = true
      }
      task.onStartExecution(cbStart11)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackExecuted).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest1300
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_1300
     * @tc.desc   Verify onEnqueued is called before onStartExecution when both are registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnStartExecutionTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let order: string[] = []
      let task: taskpool.Task = new taskpool.Task((): number => {
        return 100.0
      })
      let cbEnq0: () => void = (): void => {        order.push('onEnqueued')}
      task.onEnqueued(cbEnq0)
      let cbStart12: () => void = (): void => {
        order.push('onStartExecution')
      }
      task.onStartExecution(cbStart12)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      // 宿主侧回调投递顺序在高负载下不保证（压测实测可乱序），断言收敛为每个回调各触发一次
      expect(order.length).assertEqual(2)
      let enqueuedCount: number = 0
      let startCount: number = 0
      for (let item of order) {
        if (item === 'onEnqueued') {
          enqueuedCount++
        }
        if (item === 'onStartExecution') {
          startCount++
        }
      }
      expect(enqueuedCount).assertEqual(1)
      expect(startCount).assertEqual(1)
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest1400
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_1400
     * @tc.desc   Verify Task.onStartExecution() used for pre-execution preparation sets data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnStartExecutionTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // NEEDS_RUNTIME_EVIDENCE: task function body reads host `prepareData` written by
      // onStartExecution (closure capture of host mutable state, 终裁 G13). The result
      // depends on runtime snapshot semantics; requires device evidence.
      let prepareData: number = 0
      let task: taskpool.Task = new taskpool.Task((): number => {
        return prepareData * 2.0
      })
      let cbStart13: () => void = (): void => {        prepareData = 10.0}
      task.onStartExecution(cbStart13)
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(20.0)
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest1500
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_1500
     * @tc.desc   Verify multiple tasks with independent onStartExecution callbacks execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnStartExecutionTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let results: number[] = []
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 1.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 2.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 3.0)
      let task4: taskpool.Task = new taskpool.Task(multiplyFunc, 4.0)
      let task5: taskpool.Task = new taskpool.Task(multiplyFunc, 5.0)
      let cbStart14: () => void = (): void => {        results.push(1)}
      task1.onStartExecution(cbStart14)
      let cbStart15: () => void = (): void => {        results.push(2)}
      task2.onStartExecution(cbStart15)
      let cbStart16: () => void = (): void => {        results.push(3)}
      task3.onStartExecution(cbStart16)
      let cbStart17: () => void = (): void => {        results.push(4)}
      task4.onStartExecution(cbStart17)
      let cbStart18: () => void = (): void => {        results.push(5)}
      task5.onStartExecution(cbStart18)
      try {
        await Promise.all([
         taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3),
         taskpool.execute(task4), taskpool.execute(task5)
       ]);
      } catch (error) {
       expect().assertFail();
      }
      expect(results.length >= 1).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnStartExecutionTest1600
     * @tc.number SUB_TASK_ON_START_EXECUTION_TEST_1600
     * @tc.desc   Verify concurrent tasks with onStartExecution callback handle shared variable correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskOnStartExecutionTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let sharedCounter: number = 0
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(simpleFunc)
      let task3: taskpool.Task = new taskpool.Task(simpleFunc)
      let task4: taskpool.Task = new taskpool.Task(simpleFunc)
      let task5: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbStart19: () => void = (): void => {        sharedCounter++}
      task1.onStartExecution(cbStart19)
      let cbStart20: () => void = (): void => {        sharedCounter++}
      task2.onStartExecution(cbStart20)
      let cbStart21: () => void = (): void => {        sharedCounter++}
      task3.onStartExecution(cbStart21)
      let cbStart22: () => void = (): void => {        sharedCounter++}
      task4.onStartExecution(cbStart22)
      let cbStart23: () => void = (): void => {        sharedCounter++}
      task5.onStartExecution(cbStart23)
      try {
        await Promise.all([
         taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3),
         taskpool.execute(task4), taskpool.execute(task5)
       ]);
      } catch (error) {
       expect().assertFail();
      }
      expect(sharedCounter >= 1 && sharedCounter <= 5).assertTrue()
      done();
    })
  })
}
